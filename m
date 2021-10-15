Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B8942ED92
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 11:26:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210031.366732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJTr-0001Qn-CT; Fri, 15 Oct 2021 09:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210031.366732; Fri, 15 Oct 2021 09:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJTr-0001Nn-9Y; Fri, 15 Oct 2021 09:26:23 +0000
Received: by outflank-mailman (input) for mailman id 210031;
 Fri, 15 Oct 2021 09:26:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mbJTq-0001Nh-No
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 09:26:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mbJTn-0000Mk-Vw; Fri, 15 Oct 2021 09:26:19 +0000
Received: from [54.239.6.185] (helo=[192.168.0.140])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mbJTn-00062c-Nv; Fri, 15 Oct 2021 09:26:19 +0000
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
	bh=hOzbmovLvtJQ1Jo5rJVgx04ACmD0CR3WuBqls7yBu7Y=; b=TR0CzgugG/ngzLxzAw3spMvzJ2
	eExp7m1YyDpDllVJD/79C5N41R5E1iK4ju40QWj33fOhonM+r9QSiEjZlEILFAlFDgrXgGDTaNjM3
	cmknszTXYfSZ7xK8uffYGCVRsq3q7EptZgCGeg7ZtLA5O37YHaTS13fNTyDM0KazNpAs=;
Message-ID: <de2a74f3-5b7d-d0b2-28a1-c3efe5ae05de@xen.org>
Date: Fri, 15 Oct 2021 10:26:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] memory: XENMEM_add_to_physmap (almost) wrapping
 checks
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <f78f8a30-39b7-cec2-2af0-27ebab28cedd@suse.com>
 <561dcb90-7b6d-4dd6-2ca7-a4a5ec1c5e35@xen.org>
 <5e829583-d593-3b19-ea54-acb31ee8eec9@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5e829583-d593-3b19-ea54-acb31ee8eec9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/10/2021 15:10, Jan Beulich wrote:
> On 14.10.2021 13:29, Julien Grall wrote:
>> On 13/09/2021 07:42, Jan Beulich wrote:
>>> Determining that behavior is correct (i.e. results in failure) for a
>>> passed in GFN equaling INVALID_GFN is non-trivial. Make this quite a
>>> bit more obvious by checking input in generic code - both for singular
>>> requests to not match the value and for range ones to not pass / wrap
>>> through it.
>>>
>>> For Arm similarly make more obvious that no wrapping of MFNs passed
>>> for XENMAPSPACE_dev_mmio and thus to map_dev_mmio_region() can occur:
>>> Drop the "nr" parameter of the function to avoid future callers
>>> appearing which might not themselves check for wrapping. Otherwise
>>> the respective ASSERT() in rangeset_contains_range() could trigger.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> I find it odd that map_dev_mmio_region() returns success upon
>>> iomem_access_permitted() indicating failure - is this really intended?
>>
>> AFAIR yes. The hypercall is not used as "Map the region" but instead
>> "Make sure the region is mapped if the IOMEM region is accessible".
>>
>> It is necessary to return 0 because dom0 OS cannot distinguished between
>> emulated and non-emulated. So we may report error when there is none.
> 
> Odd, but I clearly don't understand all the aspects here.
> 
>>> As per commit 102984bb1987 introducing it this also was added for ACPI
>>> only - any reason XENMAPSPACE_dev_mmio isn't restricted to CONFIG_ACPI
>>> builds?
>>
>> There is nothing specific to ACPI in the implementation. So I don't
>> really see the reason to restrict to CONFIG_ACPI.
>>
>> However, it is still possible to boot using DT when Xen is built with
>> CONFIG_ACPI. So if the restriction was desirable, then I think it should
>> be using !acpi_disabled.
> 
> My point was rather about this potentially being dead code in non-ACPI
> builds (i.e. in particular uniformly on 32-bit).

The hypercall is already wired and a dom0 OS can use it today even on 
non-ACPI. Whether a dom0 OS will use it is a different question. I know 
that Linux will limit it to ACPI. It is likely not used by other OS, but 
I can't guarantee it.

In this case, the hypercall is only a few lines and already restricted 
to dom0 only (see xapt_permission_check()). So to me, the #ifdef here is 
not worth it.

>>> @@ -841,6 +844,15 @@ int xenmem_add_to_physmap(struct domain
>>>        if ( xatp->size < start )
>>>            return -EILSEQ;
>>>    
>>> +    if ( xatp->gpfn + xatp->size < xatp->gpfn ||
>>> +         xatp->idx + xatp->size < xatp->idx )
>>> +    {
>>> +#define _gfn(x) (x)
>>
>> AFAICT, _gfn() will already be defined. So some compiler may complain
>> because will be defined differently on debug build.
> 
> No - _gfn() is an inline function as per typesafe.h. (Or else it
> wouldn't be just "some" compiler, but gcc at least would have
> complained to me.)

Ah. somehow I thought it was a macro. But looking at the implementation, 
it makes sense to be an inline funciton.

Sorry for the noise.

> 
>> However...
>>
>>> +        BUILD_BUG_ON(INVALID_GFN + 1);
>>
>> ... I might be missing something... but why can't use gfn_x(INVALID_GFN)
>> + 1 here?
> 
> Because gfn_x() also is an inline function, and that's not suitable
> for a compile-time constant expression.

Right. How about introduce INVALID_GFN_RAW in mm-frame.h? This could 
also be used to replace the open-code value in INVALID_GFN and 
INVALID_GFN_INITIALIZER?

> 
>> In fact, I am not entirely sure what's the purpose of this
>> BUILD_BUG_ON(). Could you give more details?
> 
> The expression in the surrounding if() relies on INVALID_GFN being the
> largest representable value, i.e. this ensures that INVALID_GFN doesn't
> sit anywhere in [xatp->gpfn, xatp->gpfn + xatp->size).

Thanks the explanation. Can you add the rationale in a comment on top of 
BUILD_BUG_ON()?

Cheers,

-- 
Julien Grall

