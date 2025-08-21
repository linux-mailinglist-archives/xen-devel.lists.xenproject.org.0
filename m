Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0DCB2F437
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 11:40:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088306.1446064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up1ml-0006Hs-UV; Thu, 21 Aug 2025 09:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088306.1446064; Thu, 21 Aug 2025 09:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up1ml-0006FK-R9; Thu, 21 Aug 2025 09:40:43 +0000
Received: by outflank-mailman (input) for mailman id 1088306;
 Thu, 21 Aug 2025 09:40:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1up1mk-0006FE-6I
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 09:40:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1up1mi-00GgFh-1I;
 Thu, 21 Aug 2025 09:40:40 +0000
Received: from [15.248.3.91] (helo=[10.24.67.183])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1up1mi-00BNWo-07;
 Thu, 21 Aug 2025 09:40:40 +0000
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
	bh=6BWl5dUvRqYj82XZXyd1cMA74pbVYYusGlLz3T5sy14=; b=ovMLyTcDtQUiJrojQ+SSyiI2Rc
	9x7hRI2dLpWlOhvQOM1AAfuJ777vyzF9iKRzb86nbBrxwWlq6s09ATicccuo16phTCks58C0xvyCE
	synYMJYdFeEQ9PYF+lCfIWodTNFxa39rUXfFnXfr+1j2e77n44HiQeuqkduSG3voKAMk=;
Message-ID: <b53e72af-8d63-4394-80f4-80d14721e7dd@xen.org>
Date: Thu, 21 Aug 2025 10:40:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/6] altp2m: Drop p2m_altp2m_check() stubs on non-x86,
 move prototype, and guard uses
Content-Language: en-GB
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <cover.1753953832.git.w1benny@gmail.com>
 <44b4b60854cd7db6d529ff23bb228e9ac19a2a75.1753953832.git.w1benny@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <44b4b60854cd7db6d529ff23bb228e9ac19a2a75.1753953832.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Petr,

On 31/07/2025 10:27, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> Remove the no‑op stubs from the ARM, PPC, and RISC‑V p2m headers and stop
> providing a stub in arch/x86/include/asm/p2m.h.
> 
> Declare p2m_altp2m_check() in xen/include/xen/p2m-common.h and gate all
> call sites with CONFIG_ALTP2M:
>   - wrap the fast_single_step block in hvm/monitor.c with #ifdef CONFIG_ALTP2M
>     (IS_ENABLED(CONFIG_ALTP2M) is not used here, because in the subsequent commit
>     hvm_vcpu::fast_single_step will be guarded by CONFIG_ALTP2M)
>   - make the vm_event.c path conditional via IS_ENABLED(CONFIG_ALTP2M)
> 
> No functional change intended: on builds without ALTP2M the calls are
> compiled out; on builds with ALTP2M behavior is unchanged.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com> # arm

Cheers,

-- 
Julien Grall


