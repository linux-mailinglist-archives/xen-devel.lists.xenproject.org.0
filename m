Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB889477FC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 11:09:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771863.1182292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sathX-0000nL-6n; Mon, 05 Aug 2024 09:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771863.1182292; Mon, 05 Aug 2024 09:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sathX-0000l7-3t; Mon, 05 Aug 2024 09:08:23 +0000
Received: by outflank-mailman (input) for mailman id 771863;
 Mon, 05 Aug 2024 09:08:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sathV-0000l1-Fh
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 09:08:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sathU-00043R-Hq; Mon, 05 Aug 2024 09:08:20 +0000
Received: from [15.248.2.233] (helo=[10.24.67.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sathU-0007Nh-4l; Mon, 05 Aug 2024 09:08:20 +0000
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
	bh=7LHqG+5cQRYyexYtSZaKbPnZjvCTOGvJ8WmVaGI+YWQ=; b=Vs0iIkAedtkyrJsi1IvCeAgZEM
	n1e86pQ8jqiOqiuqpEyWXP00bETMwBM/AiE7yaPlEyfqFiUUBLLvrWQCJcyRHIrX7kC1+FTgjrxGY
	HAk4WmPS1ycJ723M4TOrv07KmPufU9+CrwiTcWXCbLbAdde5cytw6PkGE5TnoAkYGDlw=;
Message-ID: <309d42dc-e540-4fbe-a69e-2be6414deb70@xen.org>
Date: Mon, 5 Aug 2024 10:08:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <102f8b60c55cdf2db5890b9fb1c2fb66e61c4a67.1721834549.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <102f8b60c55cdf2db5890b9fb1c2fb66e61c4a67.1721834549.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/07/2024 16:31, Oleksii Kurochko wrote:
> Changes in V5:
>   - add xen/include/xen/bootfdt.h to MAINTAINERS file.
>   - drop message "Early device tree parsing and".
>   - After rebase on top of the current staging the following changes were done:
>     - init bootinfo variable in <common/device-tree/bootinfo.c> with BOOTINFO_INIT;
>     - update the code of dt_unreserved_regions():
>         CONFIG_STATIC_SHM related changes and getting of reserved_mem
>         bootinfo_get_shmem() ??
>     - update the code of meminfo_overlap_check():
>         add check ( INVALID_PADDR == bank_start ) to if case.
>     - update the code of check_reserved_regions_overlap():
>         CONFIG_STATIC_SHM related changes.
>     - struct bootinfo was updated ( CONFIG_STATIC_SHM changes )
>     - add shared_meminfo ( because of CONFIG_STATIC_SHM )
>     - struct struct membanks was update with __struct group so <xen/kernel> is
>       neeeded to be included in bootfdt.h
>     - move BOOTINFO_ACPI_INIT, BOOTINFO_SHMEM_INIT, BOOTINFO_INIT to generic bootfdt.h
>     - bootinfo_get_reserved_mem(), bootinfo_get_mem(), bootinfo_get_acpi(),
>       bootinfo_get_shmem() and bootinfo_get_shmem_extra() were moved to xen/bootfdt.h
>   - s/arm32/CONFIG_SEPARATE_XENHEAP/

I think this change deserve a comment in the commit message.

[...]

> --- /dev/null
> +++ b/xen/common/device-tree/bootinfo.c
> @@ -0,0 +1,459 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Derived from $xen/arch/arm/setup.c.

I would suggest to mention the version of Xen this is derived from.

Acked-by: Julien Grall <jgrall@amazon.com>

-- 
Julien Grall


