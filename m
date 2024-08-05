Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CED2C948209
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 21:03:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772344.1182790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb2xU-0000H4-Fm; Mon, 05 Aug 2024 19:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772344.1182790; Mon, 05 Aug 2024 19:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb2xU-0000Fa-D7; Mon, 05 Aug 2024 19:01:28 +0000
Received: by outflank-mailman (input) for mailman id 772344;
 Mon, 05 Aug 2024 19:01:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sb2xS-0000FB-TC
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 19:01:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sb2xR-0007NK-RZ; Mon, 05 Aug 2024 19:01:25 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sb2xR-0001mb-K5; Mon, 05 Aug 2024 19:01:25 +0000
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
	bh=OaT3F0yh0XwvogJKjRg1RLdZlN4Ss7A68YRgvOiwPv8=; b=Gwj4ELdoDtxhMd418IFWCikbFj
	4msOfaQ019d7IHbWictUPqYNV1yPaMPeochHxJfkQ7AW91YeSgbTnvGpXxeUItcn3hc2TopRwzyAf
	IT//083Adqw55ArMRLr/6ILiKfFQd+hez7n1or5wyCpbFXwCJFjrZZA66AHooTp2zco4=;
Message-ID: <c8aa0451-4a99-4496-a5eb-cb4cf6b49862@xen.org>
Date: Mon, 5 Aug 2024 20:01:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] xen/common: Move Arm's bootfdt.c to common
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1722856894.git.oleksii.kurochko@gmail.com>
 <85321f4a2fc7f1d892aa658603bffaae25249045.1722856894.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <85321f4a2fc7f1d892aa658603bffaae25249045.1722856894.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/08/2024 12:33, Oleksii Kurochko wrote:
> From: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Move Arm's bootfdt.c to xen/common so that it can be used by other
> device tree architectures like PPC and RISCV.
> 
> Remove stubs for process_shm_node() and early_print_info_shmem()
> from $xen/arch/arm/include/asm/static-shmem.h.
> These stubs are removed to avoid introducing them for architectures
> that do not support CONFIG_STATIC_SHM.
> The process_shm_node() stub is now implemented in common code to
> maintain the current behavior of early_scan_code() on ARM.
> The early_print_info_shmem() stub is only used in early_print_info(),
> so it's now guarded with #ifdef CONFIG_STATIC_SHM ... #endif.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

