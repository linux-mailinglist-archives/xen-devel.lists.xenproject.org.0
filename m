Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157A32C05C2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 13:30:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34151.64981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khAyz-00012r-EJ; Mon, 23 Nov 2020 12:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34151.64981; Mon, 23 Nov 2020 12:30:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khAyz-00012S-Aw; Mon, 23 Nov 2020 12:30:13 +0000
Received: by outflank-mailman (input) for mailman id 34151;
 Mon, 23 Nov 2020 12:30:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khAyx-00012N-Hj
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:30:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ef8067c-7322-4542-90b0-25c2110cd060;
 Mon, 23 Nov 2020 12:30:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB675AFC1;
 Mon, 23 Nov 2020 12:30:09 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khAyx-00012N-Hj
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:30:11 +0000
X-Inumbo-ID: 0ef8067c-7322-4542-90b0-25c2110cd060
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0ef8067c-7322-4542-90b0-25c2110cd060;
	Mon, 23 Nov 2020 12:30:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606134610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qwFVAuzV3tht+QwpySCOfxOj21TQQI0/ENeuahmUz04=;
	b=l/MptpJqYzVd/Z0Zx6LcI0GBmg01gnYsVBb9UY5y1U+frBUPRjBz84mmOIbsWkI/VizFGu
	lhHzR2l6XMlMCyyq3UfSaeeIb43t5ncgky2B2q3KhXhvNNQYhfCeC3QBBehtOau7wLwMW/
	N58ZVTEIAD+tVBx2ui8Nzk57skaDHus=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EB675AFC1;
	Mon, 23 Nov 2020 12:30:09 +0000 (UTC)
Subject: Re: [PATCH v2] x86/PV: make post-migration page state consistent
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <07ebce3c-4dcf-bc9e-6d82-7f3def486ab8@suse.com>
 <20201123114843.ocjwlv4wkukcdcgf@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c9578226-91b6-c621-2e61-dfeb7cbfdbe5@suse.com>
Date: Mon, 23 Nov 2020 13:30:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201123114843.ocjwlv4wkukcdcgf@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.11.2020 12:48, Roger Pau Monné wrote:
> On Wed, Nov 04, 2020 at 08:56:50AM +0100, Jan Beulich wrote:
>> When a page table page gets de-validated, its type reference count drops
>> to zero (and PGT_validated gets cleared), but its type remains intact.
>> XEN_DOMCTL_getpageframeinfo3, therefore, so far reported prior usage for
>> such pages. An intermediate write to such a page via e.g.
>> MMU_NORMAL_PT_UPDATE, however, would transition the page's type to
>> PGT_writable_page, thus altering what XEN_DOMCTL_getpageframeinfo3 would
>> return. In libxc the decision which pages to normalize / localize
>> depends solely on the type returned from the domctl. As a result without
>> further precautions the guest won't be able to tell whether such a page
>> has had its (apparent) PTE entries transitioned to the new MFNs.
>>
>> Add a check of PGT_validated, thus consistently avoiding normalization /
>> localization in the tool stack.
>>
>> Also use XEN_DOMCTL_PFINFO_NOTAB in the variable's initializer instead
>> open coding it.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Maybe the switch could be avoided if the page is not validated or
> broken? Not that I care that much.

It certainly could be, but it didn't seem worth the code churn
to me.

Jan

