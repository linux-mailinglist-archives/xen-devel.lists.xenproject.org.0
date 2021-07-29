Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B99193DA1FC
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jul 2021 13:20:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161913.297108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9458-0004PN-QG; Thu, 29 Jul 2021 11:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161913.297108; Thu, 29 Jul 2021 11:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9458-0004MB-NF; Thu, 29 Jul 2021 11:20:06 +0000
Received: by outflank-mailman (input) for mailman id 161913;
 Thu, 29 Jul 2021 11:20:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m9457-0004ID-D4
 for xen-devel@lists.xenproject.org; Thu, 29 Jul 2021 11:20:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m9456-0005AL-8R; Thu, 29 Jul 2021 11:20:04 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m9456-0007cN-2Z; Thu, 29 Jul 2021 11:20:04 +0000
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
	bh=nmf1IRZj8cnd76qyGGakCImJbQh2t/HEcp1VzhyGGL0=; b=tiqTPvNbLpEcGDcpXJ7NGxN5y2
	4utQAIci7Jgfdegtboc075KQ0A7rQmhQBPG1wmTRWKOoj9jXm1CS3Ay/dC/ejUzCbJe44wHF4szVY
	nCPOf1zKU+JxpAaBUo8i79OQy8mnc0apVfNJUCqkJ9Cpsbh5d6p5vieSE+leGxds7qWQ=;
Subject: Re: [PATCH v2] xen/arm64: Remove vreg_emulate_sysreg32
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210729104258.6320-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4a5ac822-3078-de0e-8f84-6881d47ad3eb@xen.org>
Date: Thu, 29 Jul 2021 12:20:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210729104258.6320-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 29/07/2021 11:42, Michal Orzel wrote:
> According to ARMv8A architecture, AArch64 registers
> are 64bit wide even though in many cases the upper
> 32bit is reserved. Therefore there is no need for
> function vreg_emulate_sysreg32 on arm64. This means
> that we can have just one function vreg_emulate_sysreg
> using new function pointer:
> typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs,
>                                register_t *r, bool read);
> 
> Modify vreg_emulate_cp32 to use the new function pointer
> as well.
> 
> This change allows to properly use 64bit registers in AArch64
> state and in case of AArch32 the upper 32 bits of AArch64
> registers are inaccessible and are ignored(D1.20.1 ARM DDI 0487A.j).

What you wrote only says that the bits are ignored. It doesn't say 
whether the bits will be 0.

They are probably, but as I wrote yesterday, I couldn't confirm it.

> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Please provide a change log.

Cheers,

-- 
Julien Grall

