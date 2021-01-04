Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAFC2E9958
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 17:01:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61332.107825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSHk-0001Tl-4x; Mon, 04 Jan 2021 16:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61332.107825; Mon, 04 Jan 2021 16:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSHk-0001TL-15; Mon, 04 Jan 2021 16:00:44 +0000
Received: by outflank-mailman (input) for mailman id 61332;
 Mon, 04 Jan 2021 16:00:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwSHj-0001TG-4p
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 16:00:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c69eb414-fa89-47f8-b979-e75235b6781d;
 Mon, 04 Jan 2021 16:00:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 95203AE1F;
 Mon,  4 Jan 2021 16:00:40 +0000 (UTC)
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
X-Inumbo-ID: c69eb414-fa89-47f8-b979-e75235b6781d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609776040; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V7dVDBH7c8cGIPSIDgEPtZ5ABQn7lw8ZYRQ+1zXtPII=;
	b=cb0sQVW0H1Mp0j3IXSqvMz9DEL3ud5XzNmA7OiTxVVhLICpLxcfLmGI4F/3H06ngeY5SVV
	WGVedZ0dN7rboML7rlySgbek2TNXeSey4X/s+cXzuOmX7I6fDxjh8cdWjaAbMB0j7jcZqG
	Q+NPlS+4mKL2B21vh5CH98oq2xFNAXQ=
Subject: Re: [PATCH v2] gnttab: defer allocation of status frame tracking
 array
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <57dc915c-c373-5003-80f7-279dd300d571@suse.com>
 <920f3df3-3343-3947-e318-da3b8dd8a56c@citrix.com>
 <ec21a8d6-744c-0f02-cedd-c35d36097a8a@suse.com>
 <25c6efe0-fb29-eb83-badf-70cd2dade0d7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1d8e0cbd-1250-70aa-5b6a-038744530052@suse.com>
Date: Mon, 4 Jan 2021 17:00:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <25c6efe0-fb29-eb83-badf-70cd2dade0d7@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.01.2021 16:41, Andrew Cooper wrote:
> On 04/01/2021 15:22, Jan Beulich wrote:
>> On 04.01.2021 16:04, Andrew Cooper wrote:
>>> On 23/12/2020 15:13, Jan Beulich wrote:
>>>> This array can be large when many grant frames are permitted; avoid
>>>> allocating it when it's not going to be used anyway, by doing this only
>>>> in gnttab_populate_status_frames().
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> v2: Defer allocation to when a domain actually switches to the v2 grant
>>>>     API.
>>> I see this as a backwards step.  It turns a build-time -ENOMEM into a
>>> runtime -ENOMEM, and if you recall from one of the XSAs, the Windows PV
>>> drivers will BUG() if set_version fails.  (Yes - this is dumb behaviour,
>>> but it is in the field now.)
>> Well, if this was the only source of -ENOMEM (i.e. none was there
>> previously), I'd surely understand the concern. But there have been
>> memory allocations before on this path.
> 
> ... you're literally writing a patch saying "avoid large allocation at
> domain create time, and make it at runtime instead" and then trying to
> argue that it isn't a concern because there are other memory allocations.
> 
> It is very definitely a backwards step irrespective of the size of the
> allocation, even if the current behaviour isn't necessarily perfect.

I agree when taking this one possible perspective. There's the other
one as well: For domains never switching to the v2 API, allocating
the table at build time is purely a waste of memory. Note also how
the description says "This array can be large" - it doesn't have to
be, and hence the other involved allocations may be at higher risk
of yielding -ENOMEM.

>>  In any event, this will
>> need settling between you and Julien, as it was him to request the
>> change.
> 
> Well - that's because gnttab v2 is disabled in general on ARM.

I'm afraid I don't understand the "because" here: For Arm it's
irrelevant whether v1 or v2 of this patch gets used - the table
would never be allocated anymore in either case.

> Conditionally avoiding the allocation because of opt_gnttab_max_version
> being 1 would be ok, because it doesn't introduce new runtime failures
> for guests. 
> 
> The correctness of this change does depend on opt_gnttab_max_version
> being invariant for the lifetime of a domain.  If it were to become a
> runtime parameter, it would need caching per domain, (which is frankly
> how it should have been implemented all along, along with a parameter in
> XEN_DOMCTL_createdomain).

I think it is well understood that conversion of boot time
(command line) options to runtime ones needs careful inspection
of the consumers of the controlled variable(s). The option isn't
a runtime one right now, which is all that counts. (I agree this
would better be a per-domain property set when creating one.)

Jan

