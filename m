Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6931E379542
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 19:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125389.236023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg9ZC-0000zZ-34; Mon, 10 May 2021 17:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125389.236023; Mon, 10 May 2021 17:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg9ZC-0000wn-08; Mon, 10 May 2021 17:19:38 +0000
Received: by outflank-mailman (input) for mailman id 125389;
 Mon, 10 May 2021 17:19:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lg9ZA-0000wh-HU
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 17:19:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lg9Z1-0001w4-42; Mon, 10 May 2021 17:19:27 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lg9Z0-0007qf-T7; Mon, 10 May 2021 17:19:27 +0000
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
	bh=m5qxCaZp1ejqtUS7kBwp2KDNFCV084AjTlJ/YcrB2p0=; b=r4tLqNK1IqCAE+pl89EULElMn4
	VrZ7xxoMBRRLQJvHBjtWnIQq9xPBzkXBHWF+jOnrgEQ2DwqQ+LTwZQmzpdoThHWhH8OEB5NOXJKBV
	F9QZPIrwpaEenW7oiNzeZeLQej70+iVoNO849kKuKJ84o444XlKAr7ezGdibQvKHEJto=;
Subject: Re: [PATCH v3 00/10] arm64: Get rid of READ/WRITE_SYSREG32
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com
References: <20210505074308.11016-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9eefdce8-a002-bdef-5de7-4c598b537940@xen.org>
Date: Mon, 10 May 2021 18:19:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210505074308.11016-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 05/05/2021 08:42, Michal Orzel wrote:
> The purpose of this patch series is to remove usage of 32bit helper
> macros READ/WRITE_SYSREG32 on arm64 as the idea of them is
> not following the latest ARMv8 specification and mrs/msr instructions
> are expecting 64bit values.
> According to ARM DDI 0487G.a all the AArch64 system registers
> are 64bit wide even though many of them have upper 32bit reserved.
> This does not mean that in the newer versions of ARMv8 or in the next
> architecture, some of the sysregs will get widen.
> Also when dealing with system registers we should use register_t
> type.
> 
> This patch series removes the use of READ/WRITE_SYSREG32
> and replaces these calls with READ/WRITE_SYSREG. The change was
> splited into several small patches to make the review proces easier.
> 
> This patch series focuses on removing READ/WRITE_SYSREG32.
> The next thing to do is to also get rid of vreg_emulate_sysreg32
> and other parts related to it like TVM_REG macro.
> The final part will be to completely remove macros READ/WRITE_SYSREG32.
> 
> Michal Orzel (10):
>    arm64/vfp: Get rid of READ/WRITE_SYSREG32
>    arm/domain: Get rid of READ/WRITE_SYSREG32
>    arm: Modify type of actlr to register_t
>    arm/gic: Remove member hcr of structure gic_v3
>    arm/gic: Get rid of READ/WRITE_SYSREG32
>    arm/p2m: Get rid of READ/WRITE_SYSREG32
>    xen/arm: Always access SCTLR_EL2 using READ/WRITE_SYSREG()
>    arm/page: Get rid of READ/WRITE_SYSREG32
>    arm/time,vtimer: Get rid of READ/WRITE_SYSREG32

I have merged the first 9 patches. It looks like...

>    arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t

... this one needs an answer from you at least.

Cheers,

-- 
Julien Grall

