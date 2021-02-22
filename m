Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8624932119C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 08:52:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87786.164993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE60f-0002bX-8a; Mon, 22 Feb 2021 07:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87786.164993; Mon, 22 Feb 2021 07:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE60f-0002b6-48; Mon, 22 Feb 2021 07:52:01 +0000
Received: by outflank-mailman (input) for mailman id 87786;
 Mon, 22 Feb 2021 07:51:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lE60d-0002az-GN
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 07:51:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5efe0135-04ed-480c-bb50-0f53d8d77186;
 Mon, 22 Feb 2021 07:51:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 59536AE36;
 Mon, 22 Feb 2021 07:51:57 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 5efe0135-04ed-480c-bb50-0f53d8d77186
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613980317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dlT6ej+2/kuWXutbS9Mejo2sW8ib9b0ySrgZatwo2fA=;
	b=poNN9bKPZq8LspINsWpFmjpthVz7C0iQApWn5Vi/YYbyL57lP4gQvTT5ewVdtSxIfU0G9l
	3+KIStwlkkt+rrXrABCkOrHjQsTaa6M2UkczR3RtyC2DKg31fGv9eX8dNQLnuJUcGvfrBc
	FZE0/vy0bEf/fHRTXEVlty91IZsp9h8=
Subject: Re: [PATCH for-4.15 v2] VMX: use a single, global APIC access page
To: Ian Jackson <iwj@xenproject.org>, George Dunlap <George.Dunlap@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <a895386d-db14-2743-d8f9-09f9509a510a@suse.com>
 <dcada8be-a91d-87f0-c579-30f3c7e3607e@suse.com>
 <24623.61403.440917.434@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dfdd4440-3c37-8cb5-b7d3-a86b7c697b2e@suse.com>
Date: Mon, 22 Feb 2021 08:51:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24623.61403.440917.434@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.02.2021 18:05, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH v2] VMX: use a single, global APIC access page"):
>> While this patch was triggered not just by Julien's observation of
>> the early p2m insertion being a problem, but also many earlier
>> times of running into this odd code, it is - especially at this
>> stage - perhaps a possible option to split the change into just
>> the movement of the set_mmio_p2m_entry() invocation and all the
>> rest, in order to defer that rest until after 4.15.
> 
> I infer that this contains a bugfix, but perhaps other
> changes/improvements too.
> 
> George, I think you're our expert on this refcounting stuff - what do
> you think of this ?
> 
> I guess my key question is whether this change will introduce risk by
> messing with the complex refcounting machineryt - or remove it by
> removing an interaction with the refcounting.

If anything, then the latter, but largely neither afaict - there's no
change in this regard here at all as far as the guest could affect
behavior, due to the page getting inserted as p2m_mmio_direct, and
guest_remove_page() having

    if ( p2mt == p2m_mmio_direct )
    {
        rc = clear_mmio_p2m_entry(d, gmfn, mfn, PAGE_ORDER_4K);
        goto out_put_gfn;
    }

before any refcounting logic is reached. The removal of interaction
is because now the page doesn't get associated with a domain (and
hence doesn't become subject to refcounting) at all.

The risk of the change stems from going from using a per-domain
page to using a single, system-wide one, which indeed was the subject
of v1 discussion. In any event the consideration towards splitting
the change would cover either concern. Perhaps I should really do so
and submit as v3 ...

Jan

