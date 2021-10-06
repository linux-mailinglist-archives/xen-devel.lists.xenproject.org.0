Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6088A424627
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 20:35:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203133.358201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYBlY-0002Lt-6M; Wed, 06 Oct 2021 18:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203133.358201; Wed, 06 Oct 2021 18:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYBlY-0002JS-39; Wed, 06 Oct 2021 18:35:44 +0000
Received: by outflank-mailman (input) for mailman id 203133;
 Wed, 06 Oct 2021 18:35:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mYBlX-0002JM-13
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 18:35:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mYBlV-0001YI-HD; Wed, 06 Oct 2021 18:35:41 +0000
Received: from [92.174.63.74] (helo=[192.168.1.232])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mYBlV-0005XP-8u; Wed, 06 Oct 2021 18:35:41 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=wKmQLk4UUow97V9ZfecvccjJZzz1EAHGrhzFhiH7LAc=; b=ol7Qnac3gxgPGV3dstnGYWuCky
	rNU6Wj6zInu9esbCihFtK/WyoTBsei5dc0ZrQlyLVIFJ1JB7ux4USvEFizVz8G2L52hsxRMKNfdhT
	0EewezeVtPbdS8yiL98st2J9jw0cDyZB49FJ/okENxQquwEZy6upQ2s+CA605KkKjGBs=;
Message-ID: <8ce7b98e-72eb-ba70-cb12-bf6869e5f64b@xen.org>
Date: Wed, 6 Oct 2021 20:35:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.2
Subject: Re: [PATCH V4 2/3] xen/arm: Add handling of extended regions for Dom0
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1632955927-27911-1-git-send-email-olekstysh@gmail.com>
 <1632955927-27911-3-git-send-email-olekstysh@gmail.com>
 <8318a7b0-80fa-ccd6-75c5-c3135b82235d@xen.org>
 <20f00d52-76c8-2afe-6544-6f1396e121e9@gmail.com>
 <bea0e4a3-90fe-79f0-ab4e-44d3b2d93c7f@xen.org>
 <CAPD2p-mLM-JjfKh6U+A_UTJostXvYDCJ68ac-V3teSeKjmaXTA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAPD2p-mLM-JjfKh6U+A_UTJostXvYDCJ68ac-V3teSeKjmaXTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 06/10/2021 20:15, Oleksandr Tyshchenko wrote:
> 
> 
> On Wed, Oct 6, 2021 at 9:11 PM Julien Grall <julien@xen.org 
> <mailto:julien@xen.org>> wrote:
> 
>     Hi Oleksandr,
> 
> 
> Hi Julien
> 
> [Sorry for the possible format issues]
> 
> 
>     On 04/10/2021 14:08, Oleksandr wrote:
>      >
>      > On 04.10.21 09:59, Julien Grall wrote:
>      >> Hi Oleksandr,
>      >
>      > Hi Julien
> 
>     Hi Oleksandr,
> 
>      >
>      >
>      >>
>      >> I saw Stefano committed this patch on Friday. However, I didn't
>     have a
>      >> chance go to through a second time and would like to request some
>      >> follow-up changes.
>      >
>      > ok, do you prefer the follow-up patch to be pushed separately or
>     within
>      > the rest patches of this series (#1 and #3)?  If the former, I
>     will try
>      > to push it today to close this question.
> 
>     I don't mind. My main ask is they are addressed for 4.16.
> 
>      >
>      >
>      >>
>      >>
>      >> On 30/09/2021 00:52, Oleksandr Tyshchenko wrote:
>      >>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com
>     <mailto:oleksandr_tyshchenko@epam.com>>
>      >>>
>      >>> The extended region (safe range) is a region of guest physical
>      >>> address space which is unused and could be safely used to create
>      >>> grant/foreign mappings instead of wasting real RAM pages from
>      >>> the domain memory for establishing these mappings.
>      >>>
>      >>> The extended regions are chosen at the domain creation time and
>      >>> advertised to it via "reg" property under hypervisor node in
>      >>> the guest device-tree. As region 0 is reserved for grant table
>      >>> space (always present), the indexes for extended regions are 1...N.
>      >>> If extended regions could not be allocated for some reason,
>      >>> Xen doesn't fail and behaves as usual, so only inserts region 0.
>      >>>
>      >>> Please note the following limitations:
>      >>> - The extended region feature is only supported for 64-bit domain
>      >>>    currently.
>      >>> - The ACPI case is not covered.
>      >>>
>      >>> ***
>      >>>
>      >>> As Dom0 is direct mapped domain on Arm (e.g. MFN == GFN)
>      >>> the algorithm to choose extended regions for it is different
>      >>> in comparison with the algorithm for non-direct mapped DomU.
>      >>> What is more, that extended regions should be chosen differently
>      >>> whether IOMMU is enabled or not.
>      >>>
>      >>> Provide RAM not assigned to Dom0 if IOMMU is disabled or memory
>      >>> holes found in host device-tree if otherwise. Make sure that
>      >>> extended regions are 2MB-aligned and located within maximum
>     possible
>      >>> addressable physical memory range. The minimum size of extended
>      >>> region is 64MB.
>      >>
>      >> You explained below why the 128 limits, but I don't see any
>      >> explanation on why 2MB and 64MB.
>      >>
>      >> IIRC, 2MB was to potentally allow superpage mapping. I am not
>     entirely
>      >> sure for 64MB.
>      >>
>      >> Could you add an in-code comment explaining the two limits?
>      >
>      > Yes. There was a discussion at [1]. 64MB was chosen as a reasonable
>      > value to deal with between initial 2MB (we might end up having a
>     lot of
>      > small ranges which are not quite useful but increase bookkeeping)
>     and
>      > suggested 1GB (we might not be able find a suitable regions at all).
> 
>     Ok. Please document in the code. Note that I don't think this choice
>     should be advertised to the OS. This would give us some flexibility to
>     change the size in the future (e.g. if we have platform where chunk of
>     less than 64MB is beneficial).
> 
>      >> The code below looks like an open-coding version of
>      >> dt_for_each_range(). Can you try to re-use it please? This will
>     help
>      >> to reduce the complexity of this function.
>      >
>      > You are right, it makes sense, will definitely reuse. If I was
>     aware of
>      > that function before I would safe some time I spent on the
>     investigation
>      > how to parse that)
> 
>     I have only skimmed through the diff below. This looks fine to me.
>     Please submit a formal patch.
> 
> 
> Already submitted, please take a look at [1].
> 
>   [1] 
> https://lore.kernel.org/xen-devel/1633519346-3686-4-git-send-email-olekstysh@gmail.com/ 
> <https://lore.kernel.org/xen-devel/1633519346-3686-4-git-send-email-olekstysh@gmail.com/>

Thanks! Sorry, my inbox has been growing quite a lot while I was away. I 
will have a look when I am fully back next week :).

Cheers,

-- 
Julien Grall

