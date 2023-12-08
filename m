Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D875580A55D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 15:24:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650651.1016364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBbm6-0000Hm-VQ; Fri, 08 Dec 2023 14:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650651.1016364; Fri, 08 Dec 2023 14:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBbm6-0000Ft-Sc; Fri, 08 Dec 2023 14:24:18 +0000
Received: by outflank-mailman (input) for mailman id 650651;
 Fri, 08 Dec 2023 14:24:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rBbm5-0000Fn-4Q
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 14:24:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBbm4-000086-Ep; Fri, 08 Dec 2023 14:24:16 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.23.116]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBbm4-0006II-8h; Fri, 08 Dec 2023 14:24:16 +0000
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
	bh=w5SQHuiVDosZvKu7mNqDvcqINp/XeUgrB4MfO4wvxhc=; b=LXnz4DcHYne468QkX4fGG1vQSB
	Pu4a+Ojtt1e2OiMZbnsqW73J8zVSWiaPoEpHMnWUD8j/kEvNDrgI94u5ZksoJaXgoOj8gmITftBod
	bQ9X/IwUFzSWTvKRPL2xcTM3xXeWUFdM0Gf5bC2z1mcmAciY3Gp2hJ8GrV9Edquehmso=;
Message-ID: <e13fbfe6-0a13-44ec-839a-f007990384cc@xen.org>
Date: Fri, 8 Dec 2023 14:24:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] automation: Add a Dockerfile for running FVP_Base
 jobs
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <20231208054637.1973424-1-Henry.Wang@arm.com>
 <20231208054637.1973424-2-Henry.Wang@arm.com>
 <9978c881-9d1a-4554-b0f8-577a1cf6fc35@xen.org>
 <239318A5-BBE7-495A-8BA6-1DBA75FDBE46@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <239318A5-BBE7-495A-8BA6-1DBA75FDBE46@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 08/12/2023 12:59, Henry Wang wrote:
> Hi Julien,

Hi,

>> On Dec 8, 2023, at 20:30, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 08/12/2023 05:46, Henry Wang wrote:
>>> Fixed Virtual Platforms (FVPs) are complete simulations of an Arm
>>> system, including processor, memory and peripherals. These are set
>>> out in a "programmer's view", which gives programmers a comprehensive
>>> model on which to build and test software. FVP can be configured to
>>> different setups by its cmdline parameters, and hence having the FVP
>>> in CI will provide us with the flexibility to test Arm features and
>>> setups that we find difficult to use real hardware or emulators.
>>> This commit adds a Dockerfile for the new arm64v8 container with
>>> FVP installed, based on the debian bookworm-arm64v8 image. This
>>> container will be used to run the FVP test jobs. Compared to the
>>> debian bookworm-arm64v8 image, the packages in the newly added FVP
>>> container does not contain the `u-boot-qemu`, and adds the `expect`
>>> to run expect scripts introduced by following commits, `telnet` to
>>> connect to FVP, and `tftpd-hpa` to provide the TFTP service for
>>> the FVP.
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>> ---
>>> v2:
>>> - Add Stefano's Reviewed-by tag.
>>> ---
>>> +
>>> +RUN wget https://developer.arm.com/-/media/Files/downloads/ecosystem-models/FVP_Base_RevC-2xAEMvA_${FVP_BASE_VERSION}.tgz && \
>>
>> I vaguely recall some discussions on whether it was ok for us to publish a container with the FVP model due to the license agreement.
>>
>> I guess this has now been resolved because the download can be done without sign-in to the account. Can you confirm?
> 
> Yes, quoting some words from the people we asked internally:
> (the page referred to is https://developer.arm.com/Tools%20and%20Software/Fixed%20Virtual%20Platforms):
> 
> "All the FVPs referenced on this page that you are interested in are licensed under
> lightweight Eco System EULA that has no restrictions on the redistribution.”
> 
> "So, yes, we can ship container images containing the FVP and the license on the FVP will remain as is.”
> 
> "No issues with redistributing the model package in a Docker container, as long as the EULA in included."

Thanks for checking. In the current form, I don't think it is easy to 
know that the FVP has a specific license. I think this should be written 
down at the top of the container file. Something:

"The FVP is license under... Please read the file in ... for more details".

> 
>> It would also be good that the commit message indicates whether there is any implicit license agreement from Xen Project (or any user that decide to use our scripts).
> 
> I think it is the “END USER LICENSE AGREEMENT FOR ARM ECOSYSTEM MODELS”?

It looks like it.

Cheers,

-- 
Julien Grall

