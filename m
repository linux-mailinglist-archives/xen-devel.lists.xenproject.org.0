Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5AF731439
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 11:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549498.858064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9jSf-00035W-Bv; Thu, 15 Jun 2023 09:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549498.858064; Thu, 15 Jun 2023 09:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9jSf-00033r-8r; Thu, 15 Jun 2023 09:40:13 +0000
Received: by outflank-mailman (input) for mailman id 549498;
 Thu, 15 Jun 2023 09:40:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q9jSd-00033j-VD
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 09:40:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9jSd-0007wx-H2; Thu, 15 Jun 2023 09:40:11 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9jSd-0002pp-9s; Thu, 15 Jun 2023 09:40:11 +0000
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
	bh=Ce2Hf9V6ob4s+vYtijmG/3zPfNoIQPCs7FVQBuC5w8o=; b=wg4TCXbU7FS+kOqBKTvKsSEGwP
	bOfxTInlar31q1iqOM755ALUdNIm0X3cIPRXqvNCDRkUlsVcj6xrh1etNA7tTYsqzWTYOSXybYhz7
	NT+ylGDAjEcOUp9a0WZpbO9SF8X1MC3sqBJC/YnyPygFbD7uH0mUaCkxBb4nyJlOiGk0=;
Message-ID: <bd8911e1-a896-120b-e2f1-add33524bc1f@xen.org>
Date: Thu, 15 Jun 2023 10:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN v8 1/5] xen/arm: p2m: Use the pa_range_info table to support
 ARM_32 and ARM_64
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Michal Orzel
 <michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
 <20230602120754.23817-2-ayan.kumar.halder@amd.com>
 <c48d763b-4b58-69f1-4cce-2f9855aa8ee0@amd.com>
 <35d0fd4a-4afe-6203-183b-d0a1f2f5d5ba@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <35d0fd4a-4afe-6203-183b-d0a1f2f5d5ba@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 15/06/2023 10:29, Ayan Kumar Halder wrote:
> 
> On 15/06/2023 09:05, Michal Orzel wrote:
>> Hi Ayan,
> Hi Michal,
>>
>> On 02/06/2023 14:07, Ayan Kumar Halder wrote:
>>>
>>> Restructure the code so that one can use pa_range_info[] table for both
>>> ARM_32 as well as ARM_64.
>> I grepped for ARM_{32,64} in our code base and could not find any use 
>> in source files except for things
>> introduced by this commit. While I'm ok with it in a commit message I 
>> think for consistency we should be
>> using arm32/arm64 in the code.
> 
> AFAIU, arm32/arm64 refers to the Architecture. ARM_32/ARM_64 refers to 
> the configuration.
> 
> If you see the original code (xen/arch/arm/include/asm/p2m.h, 
> xen/arch/arm/p2m.c)
> 
> ARM_32/ARM_64 has been used.
> 
> Thus, I used ARM_32/ARM_64 in this commit. Let me know if it makes sense.
> The rest of your comments look sane to me.
In text, we commonly don't use the name of the config. Instead we use 
the name of the architecture (i.e. arm32/arm64) because this is a strict 
correspondence.

I agree with Michal, about using arm32/arm64 rather than ARM_32/ARM_64 
in the comments at least to stay consistent with the rest of the code.

Assuming there is no other changes required in this patch (I haven't 
looked at it yet), then I am happy to handle this request on commit if 
you are OK with it.

Cheers,

-- 
Julien Grall

