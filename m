Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D32C252047E
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 20:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324734.546919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no89D-0006l8-P1; Mon, 09 May 2022 18:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324734.546919; Mon, 09 May 2022 18:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no89D-0006j0-Lm; Mon, 09 May 2022 18:30:19 +0000
Received: by outflank-mailman (input) for mailman id 324734;
 Mon, 09 May 2022 18:30:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1no89C-0006iu-4e
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 18:30:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1no89B-0003H6-Op; Mon, 09 May 2022 18:30:17 +0000
Received: from [54.239.6.187] (helo=[192.168.22.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1no89B-0005z6-If; Mon, 09 May 2022 18:30:17 +0000
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
	bh=1cMY2WjmVzdoY//sq9qPo+5OBr0bW9FtGCyCu7eFM8E=; b=0y/bKBGWJP3ub+/dr9ebbLLBSU
	Vb6OdlUn/I2bDGyJ6HyXZnh16NnVY/kXQMcjy/uGfcnwxkQuoeC9p4/KB7Kk3iRw/WMPcCGOqIM84
	EyK8kudD34265ZoDrA0HjBuIvWBTyXEqj7eKrAzpVBsgIzJkEiWvjLZqLiq1q/Z81Eh0=;
Message-ID: <64d47797-3789-694b-0eb5-08fc7527ff5b@xen.org>
Date: Mon, 9 May 2022 19:30:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2] xen/arm: p2m don't fall over on FEAT_LPA enabled hw
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org
Cc: stratos-dev@op-lists.linaro.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220428103410.2723837-1-alex.bennee@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220428103410.2723837-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alex,

On 28/04/2022 11:34, Alex Bennée wrote:
> When we introduced FEAT_LPA to QEMU's -cpu max we discovered older
> kernels had a bug where the physical address was copied directly from
> ID_AA64MMFR0_EL1.PARange field. The early cpu_init code of Xen commits
> the same error by blindly copying across the max supported range.
> 
> Unsurprisingly when the page tables aren't set up for these greater
> ranges hilarity ensues and the hypervisor crashes fairly early on in
> the boot-up sequence. This happens when we write to the control
> register in enable_mmu().
> 
> Attempt to fix this the same way as the Linux kernel does by gating
> PARange to the maximum the hypervisor can handle. I also had to fix up
> code in p2m which panics when it sees an "invalid" entry in PARange.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Julien Grall <julien@xen.org>
> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> Cc: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

