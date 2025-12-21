Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 113B2CD3E8E
	for <lists+xen-devel@lfdr.de>; Sun, 21 Dec 2025 11:33:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1191711.1511292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXGko-0001Xq-Ma; Sun, 21 Dec 2025 10:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191711.1511292; Sun, 21 Dec 2025 10:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXGko-0001Vw-Jh; Sun, 21 Dec 2025 10:33:34 +0000
Received: by outflank-mailman (input) for mailman id 1191711;
 Sun, 21 Dec 2025 10:33:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vXGkn-0001Vq-BC
 for xen-devel@lists.xenproject.org; Sun, 21 Dec 2025 10:33:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vXGkm-00322a-2A;
 Sun, 21 Dec 2025 10:33:32 +0000
Received: from [2a02:8012:3a1:0:ec1c:da36:2cad:42dd]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vXGkm-00HXwm-2R;
 Sun, 21 Dec 2025 10:33:32 +0000
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
	bh=e//h6SwBCEIEFA5z3ulhkkYUhMoXqWhrp8wakQx6zCs=; b=uq5x9WejB/AcmnbQOzgICm9iX+
	xstyqixbL2Jd0iDyiq9ZQq9qf3qpZKLVfg5WVT+MAlkuD+J+255mY/IfnXBRGEtBTepG+kb7QM7oI
	d9KEi0zdvmiwv7o3w0t2e7N7BfCFd8GcJijZl2QFANdkyKNH+diNxqEhn/3PnTZPMB+s=;
Message-ID: <0b663cba-cc3c-4a5d-afe4-a52935779198@xen.org>
Date: Sun, 21 Dec 2025 10:33:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/12] xen/arm: Add suspend and resume timer helpers
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
 <6eb8f80c070f6b1198814df8d80dcc2e60d44ea8.1765472890.git.mykola_kvach@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6eb8f80c070f6b1198814df8d80dcc2e60d44ea8.1765472890.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 11/12/2025 18:43, Mykola Kvach wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> Timer interrupts must be disabled while the system is suspended to prevent
> spurious wake-ups. Suspending timers in Xen consists of disabling the
> physical timer and the hypervisor timer on the current CPU. The virtual
> timer does not need explicit handling here, as it is already disabled on
> vCPU context switch and its state is restored per-vCPU on the next context
> restore.
> 
> Resuming consists of raising TIMER_SOFTIRQ, which prompts the generic
> timer code to reprogram the hypervisor timer with the correct timeout.
> 
> Xen does not use or expose the physical timer, so it remains disabled
> across suspend/resume.
> 
> Introduce a new helper, disable_phys_hyp_timers(), to encapsulate disabling
> of the physical and hypervisor timers.
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


