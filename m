Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B925E3B66DB
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 18:36:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147925.273120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxuEH-0003QT-TI; Mon, 28 Jun 2021 16:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147925.273120; Mon, 28 Jun 2021 16:35:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxuEH-0003Ns-PY; Mon, 28 Jun 2021 16:35:25 +0000
Received: by outflank-mailman (input) for mailman id 147925;
 Mon, 28 Jun 2021 16:35:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lxuEG-0003NT-FP
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 16:35:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lxuEF-0005Rd-2z; Mon, 28 Jun 2021 16:35:23 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lxuEE-0000db-RA; Mon, 28 Jun 2021 16:35:23 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=hBYLE5N4Wo3TfX/d3Ya7Pvj0xX218GanNazl0aDy9zs=; b=Den0/zUB9VR2GQ0F37wU34T1JW
	bDtsAFt2QmFTQaghvAt77kUVwfiimf5rc5agC6YcbH4tPzuYYI9Czt0tiuna38RVsaPTm60lmmN62
	oQJzhr4wz78bAaVeYHtLQkRZN2EFZvZn80TklJKSV7buK15VjE+uWKboZEz9uwEJJiAM=;
Subject: Re: [PATCH] fully replace mfn_to_gmfn()
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <389f5988-4700-da3e-e628-1513e87eb56a@suse.com>
 <263f1b30-e33d-711c-ff22-64f8acad230d@citrix.com>
 <9138e7a0-f4a0-db77-c09f-4fa6a45652cf@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6901f742-ee27-aeef-83ed-8c8de08acf75@xen.org>
Date: Mon, 28 Jun 2021 17:35:19 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9138e7a0-f4a0-db77-c09f-4fa6a45652cf@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 28/06/2021 17:15, Jan Beulich wrote:
> On 28.06.2021 17:42, Andrew Cooper wrote:
>> On 28/06/2021 12:52, Jan Beulich wrote:
>>> Convert the two remaining uses as well as Arm's stub to the properly
>>> named and type-safe mfn_to_gfn(), dropping x86's definition (where we
>>> already have mfn_to_gfn()).
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, but ...
> 
> Thanks.
> 
>>> --- a/xen/include/asm-arm/mm.h
>>> +++ b/xen/include/asm-arm/mm.h
>>> @@ -328,8 +328,7 @@ struct page_info *get_page_from_gva(stru
>>>   
>>>   /* Xen always owns P2M on ARM */
>>>   #define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } while (0)
>>> -#define mfn_to_gmfn(_d, mfn)  (mfn)
>>> -
>>> +#define mfn_to_gfn(d, mfn) _gfn(mfn_x(mfn))
>>
>> ... surely this wants to be ((void)(d), _gfn(mfn_x(mfn))), even if it's
>> just a latent bug right now?
> 
> Well, Julien said he plans to get rid of this anyway. I'll do here
> whatever the Arm maintainers say is wanted. Julien, Stefano?

I am fine with the change suggested by Andrew.

Cheers,

-- 
Julien Grall

