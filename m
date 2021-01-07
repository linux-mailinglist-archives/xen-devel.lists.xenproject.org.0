Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2374F2ED325
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 16:02:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62943.111686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxWnC-0000ek-Ia; Thu, 07 Jan 2021 15:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62943.111686; Thu, 07 Jan 2021 15:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxWnC-0000eL-FE; Thu, 07 Jan 2021 15:01:38 +0000
Received: by outflank-mailman (input) for mailman id 62943;
 Thu, 07 Jan 2021 15:01:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3gRj=GK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxWnB-0000eG-8j
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 15:01:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a684ab0-fb3a-4cad-a72f-eaef595dbb97;
 Thu, 07 Jan 2021 15:01:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C12A9ACAF;
 Thu,  7 Jan 2021 15:01:34 +0000 (UTC)
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
X-Inumbo-ID: 0a684ab0-fb3a-4cad-a72f-eaef595dbb97
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610031694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b2d3XLpkpNlhWp1MGwdKBhDHK2qlfncY4GZ3KtJypuk=;
	b=ORUCLpXWOAG13MFvRKExtDAD/ysGh/8f+qxPMDmnZNHFCt38C/hL2T2N1lZlruTphRDp8U
	78O/m0t35ofn5gbx9ymQmwjyVL5RLyO6IRu28ytQSY15fV64fxJSc7o0y/EEYhciWfncm8
	7BxpIySpdJ6Yr1n3DgWapyfRx80jRi4=
Subject: Re: [PATCH V3 09/23] xen/dm: Make x86's DM feature common
To: Oleksandr <olekstysh@gmail.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-10-git-send-email-olekstysh@gmail.com>
 <00c3df9f-760d-bb3d-d1d6-7c7df7f0c17c@suse.com>
 <24191fca-78e7-3e6b-ff02-c06e8ae79f56@gmail.com>
 <7c985117-2bb4-dd5b-53cf-e217e25b2e8e@suse.com>
 <f7d06c56-7f76-9ba7-6797-ebd9cf133479@gmail.com>
 <94c20a50-9363-c8d1-11aa-7a35f97a03a6@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <318580a5-d02f-9663-cc58-dfad8a4f7836@suse.com>
Date: Thu, 7 Jan 2021 16:01:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <94c20a50-9363-c8d1-11aa-7a35f97a03a6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.01.2021 15:38, Oleksandr wrote:
>>> Well, on v2 you replied you didn't consider the alternative. I would
>>> have expected that you would at least go through this consideration
>>> process, and see whether there are better reasons to stick with the
>>> apparently backwards arrangement than to change to the more
>>> conventional one. If there are such reasons, I would expect them to
>>> be called out in reply and perhaps also in the commit message; the
>>> latter because down the road more people may wonder why the more
>>> narrow / special set of cases gets handled at a higher layer than
>>> the wider set of remaining ones, and they would then be able to find
>>> an explanation without having to resort to searching through list
>>> archives.
>> Ah, will investigate. Sorry for not paying enough attention to it.
>> Yes, IOREQ (I mean "common") ops are 7 out of 18 right now. The 
>> subsequent patch is adding one more DM op - XEN_DMOP_set_irq_level.
>> There are several PCI related ops which might want to be common in the 
>> future (but I am not sure).
> I think, I can say that I have considered the alternative (doing it the 
> other way around), of course if I got your suggestion for V2 correctly.
> Agree, the alternative is more natural, also compat_dm_op() was left in 
> x86 code. For me the downside is in code duplication. With the 
> alternative both arches have to duplicate do_dm_op() and "common" part 
> of dm_op()
> (only "switch ( op.op )" is unique).

Yes, this duplication is the main downside.

> Now the question is which approach to take ("current" or "alternative") 
> for me to prepare for V4. Personally, I would be OK with the both (with 
> a little preference for "alternative").

Same here. I don't think I've seen anyone else voice an opinion.

> Also, If we decide to go with the alternative, should the common files 
> still be named dm.*?

I think this should live in ioreq.c, just like e.g.
iommu_do_pci_domctl() lives in passthrough/pci.c. This would then
allow quite a few things to become static in that file, I believe.

Jan

