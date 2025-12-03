Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59836CA19D1
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 22:02:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177125.1501520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQtzT-0006ij-2B; Wed, 03 Dec 2025 21:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177125.1501520; Wed, 03 Dec 2025 21:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQtzS-0006gg-VN; Wed, 03 Dec 2025 21:02:22 +0000
Received: by outflank-mailman (input) for mailman id 1177125;
 Wed, 03 Dec 2025 21:02:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vQtzR-0006gY-I3
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 21:02:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vQtzP-0050eK-1V;
 Wed, 03 Dec 2025 21:02:19 +0000
Received: from [2a02:8012:3a1:0:a90a:e0da:b0b5:e466]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vQtzO-00BJ8I-2U;
 Wed, 03 Dec 2025 21:02:19 +0000
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
	bh=gL/rt9eEmumR6Q2tJV1h556Vey9yXOCfpAxhha+N5Rc=; b=4byBcTb2PN/fYSEPX3PqLBQisP
	HMwgGiR/z9+VPKDHEcE3lSZ92CNBSF4t9okl7/rST4troWJR7LOd11nVz2/3NoxLjNF/WdyfmJzRN
	Z71dRnSQyuEebwgf5MRqONLMu8FWJuuYuXD0/l1lnyweqQcoW2VBcQXmo8kZyZSLic3k=;
Message-ID: <9ddb8824-2d88-444e-819a-e46be4b406d1@xen.org>
Date: Wed, 3 Dec 2025 21:02:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: Drop ThumbEE support
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Hans van Kranenburg <hans@knorrie.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <JBeulich@suse.com>,
 Maximilian Engelhardt <maxi@daemonizer.de>
References: <20251203171608.1714964-1-andrew.cooper3@citrix.com>
 <f081cd84-a626-4b02-8c8b-6c0c0b723b84@xen.org>
 <875a6a6c-f81f-449e-bd57-7e720d07e8a2@citrix.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <875a6a6c-f81f-449e-bd57-7e720d07e8a2@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 03/12/2025 18:49, Andrew Cooper wrote:
> On 03/12/2025 6:23 pm, Julien Grall wrote:
>> Hi Andrew,
>>
>> On 03/12/2025 17:16, Andrew Cooper wrote:
>>> to keep it working, but there was apparently no use of ThumbEE
>>> outside of demo
>>> code, so simply drop it.
>>
>> I am in favor of dropping support for ThumbEE for guest. But I am not
>> sure I understand this comment.
> 
> There's no production use of ThumbEE known to ARM.

Interesting. The Arm Arm is less assertive and in fact confusing, the 
latest spec released in 2018 (ARM DDI 0406C.d) has the following:

"
 From the publication of issue C.a of this manual, ARM deprecates any 
use of the ThumbEE instruction set.

[...]

ThumbEE is both the name of the instruction set and the name of the 
extension that provides support for that
instruction set. The ThumbEE Extension is:
• Required in implementations of the ARMv7-A profile.
"

I have also checked the TRM of the Cortex-A15 (one of the Armv7 CPU we 
used to have in the CI before gitlab) and it supports ThumbEE. So I 
think we need to additional diff you sent in this patch.

> 
>> Are you saying there are no processors supporting ThumbEE where Xen
>> would run? Asking because below, you are removing code to context
>> switch the ThumbEE registers. But I don't see any code that would
>> ensure the registers are trapping (i.e. HSTR.TEE is set). So wouldn't
>> this result to a cross-VM leak on those processors?
>>
>> If we really don't want to support CPU where ThumbEE is available,
>> then we should check that "cpu_has_thumbee" is 0.
> 
> The registers exist in ARM v7 only.  They do not exist in ARM v8.
> 
> I suppose yes this change would result in a cross-VM leak on hardware
> supporting ThumbEE.
> 
> Can HSTR.TTEE be set unilaterally, or does it need gating on
> cpu_has_thumbee?

 From my understanding of the Armv7 specification, the bit doesn't need 
to be gated. The Armv8 specification suggest it is RES0 so in theory it 
could be used in the future. So the diff you sent is correct.

> 
> Is setting HSTR.TTEE sufficient to cause an undefined instruction
> exception to be thrown back at a guest which goes poking?  (I guess this
> is really "will the default do the right thing")

I believe so. The default behavior in Xen is to inject an undefined 
exception if it can't handle a trap.

> 
> I'll freely admit that I'm out of my depth here, but the build failure
> does need fixing.

I agree. Do we need to include the fix in 4.19 (I think Jan asked to cut 
it tomorrow)? Thanks for sending the patch!

Cheers,

-- 
Julien Grall


