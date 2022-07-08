Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDADC56B9B2
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 14:30:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363385.593879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9n7Q-0003Qb-MB; Fri, 08 Jul 2022 12:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363385.593879; Fri, 08 Jul 2022 12:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9n7Q-0003OG-He; Fri, 08 Jul 2022 12:30:00 +0000
Received: by outflank-mailman (input) for mailman id 363385;
 Fri, 08 Jul 2022 12:29:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o9n7P-0003OA-6n
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 12:29:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9n7O-00038P-Oa; Fri, 08 Jul 2022 12:29:58 +0000
Received: from [54.239.6.184] (helo=[192.168.18.9])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9n7O-0003pz-Hv; Fri, 08 Jul 2022 12:29:58 +0000
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
	bh=ASPa0/f6XDI6IFoBl0HtGFveuOn2hnbjOButwXxtLXo=; b=rRsTsA3G/dAavxuyKgoFE63nqX
	/S09mO6wrEhn+96+JXaIjAiJYM6FQrfKY3PwpQGcinV+u1zz2IoYVS7oMDnU2plg8Ioy0INY5/HS2
	Yw+pZ9EUfg6dIbjjgZUPafyNqthCVCGBfhUJglsQ3nchzAw3+I94qiR1hue4qkaMW2u8=;
Message-ID: <cd9a2961-ca8e-24d1-5eef-1cbd869f09d4@xen.org>
Date: Fri, 8 Jul 2022 13:29:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v4 1/2] xen/arm: smccc: add support for SMCCCv1.2 extended
 input/output registers
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20220622134219.1596613-1-jens.wiklander@linaro.org>
 <20220622134219.1596613-2-jens.wiklander@linaro.org>
 <C8575668-5771-4E77-B77C-15E6E740E540@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <C8575668-5771-4E77-B77C-15E6E740E540@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 08/07/2022 13:01, Luca Fancellu wrote:
>> On 22 Jun 2022, at 14:42, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>>
>> SMCCC v1.2 AArch64 allows x0-x17 to be used as both parameter registers
>> and result registers for the SMC and HVC instructions.
>>
>> Arm Firmware Framework for Armv8-A specification makes use of x0-x7 as
>> parameter and result registers.
>>
>> Let us add new interface to support this extended set of input/output
>> registers.
>>
>> This is based on 3fdc0cb59d97 ("arm64: smccc: Add support for SMCCCv1.2
>> extended input/output registers") by Sudeep Holla from the Linux kernel
>>
>> The SMCCC version reported to the VM is bumped to 1.2 in order to support
>> handling FF-A messages.
>>
>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>> ---
>>
> 
> I think you need to update the copyright information of the smccc.h header (maintainers can confirm if it’s needed),

We don't usually update the copyright header (not sure if we should). 
Instead, I think we rely on ``git log`` to find who has contributed to 
the file.

Cheers,

-- 
Julien Grall

