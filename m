Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0FC6A0BEF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 15:35:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500457.771847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCh8-0000az-Iu; Thu, 23 Feb 2023 14:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500457.771847; Thu, 23 Feb 2023 14:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCh8-0000Z0-Ei; Thu, 23 Feb 2023 14:35:38 +0000
Received: by outflank-mailman (input) for mailman id 500457;
 Thu, 23 Feb 2023 14:35:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pVCh6-0000Yu-Df
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 14:35:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVCh5-0006mo-UZ; Thu, 23 Feb 2023 14:35:35 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.22.85]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVCh5-0000cE-Ny; Thu, 23 Feb 2023 14:35:35 +0000
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
	bh=X5cTTLQ0ZLQi6Fwxkx1Emxoye/fpsaVVBqeexbkjIac=; b=CtoMxA+wqmk1GYwiTr8FdZjRLC
	9a+dbJQNEIo+RSOiPFkw/jYCdUTQc1DtW5KyCL2xikyKDKj8uMKGAHvTSKBgWtt0UUxxwrtCk+uiV
	YT8AcNM5AdqIKyGnyER9ULsEHhNka4gVE05NmCPcTtT57Pbm9mc5K2BwCFCe2wyXKSZk=;
Message-ID: <399c85a9-2130-efa4-7a14-7f9f76084662@xen.org>
Date: Thu, 23 Feb 2023 14:35:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [XEN PATCH v7 01/20] xen/arm: smccc: add support for SMCCCv1.2
 extended input/output registers
Content-Language: en-US
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Marc Bonnici <marc.bonnici@arm.com>,
 Achin Gupta <achin.gupta@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <13719ab3736160259ad9245d5d5b5071b8933194.1677079672.git.jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <13719ab3736160259ad9245d5d5b5071b8933194.1677079672.git.jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

On 22/02/2023 15:32, Jens Wiklander wrote:
> SMCCC v1.2 [1] AArch64 allows x0-x17 to be used as both parameter
> registers and result registers for the SMC and HVC instructions.
> 
> Arm Firmware Framework for Armv8-A specification makes use of x0-x7 as
> parameter and result registers.
> 
> Let us add new interface to support this extended set of input/output
> registers.
> 
> This is based on 3fdc0cb59d97 ("arm64: smccc: Add support for SMCCCv1.2
> extended input/output registers") by Sudeep Holla from the Linux kernel
> 
> The SMCCC version reported to the VM is bumped to 1.2 in order to support
> handling FF-A messages.
> 
> [1] https://developer.arm.com/documentation/den0028/c/?lang=en
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

One remark here. The tags are usually added chronologically. So your 
signed-off-by should be first.

I am not planning to commit this patch until one of the patch using the 
call is ready. If this happen in this version, then I am happy to fix it 
on commit. Otherwise, please do it in the next version:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

