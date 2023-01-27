Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E432667EA43
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 17:02:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485781.753181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLRB6-0005St-Et; Fri, 27 Jan 2023 16:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485781.753181; Fri, 27 Jan 2023 16:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLRB6-0005Pa-CA; Fri, 27 Jan 2023 16:02:12 +0000
Received: by outflank-mailman (input) for mailman id 485781;
 Fri, 27 Jan 2023 16:02:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pLRB5-0005PU-5X
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 16:02:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLRB4-0000xD-8O; Fri, 27 Jan 2023 16:02:10 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLRB4-0003yN-2F; Fri, 27 Jan 2023 16:02:10 +0000
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
	bh=5jplpJY0zfhroJDOM6N0A2mqZtKNEP4nqIi9Adh6dG4=; b=A2I6eLbRurVzNWhuqmCfvYgdbl
	AM4uFLRCvVFif2Lwgw4iNsNIEwEVAfJp1Jsl0W7UCEYxtVMUuyj2reLZwz35v4jDMMbtvIJiGRdED
	+Iqdvt15GCbpnSukaerj+p5RUTejj8ERqJm1NyGMB/svbUJ1hB8C2gfZ8f3VLrlVQTB8=;
Message-ID: <73553bcf-9688-c187-a9cb-c12806484893@xen.org>
Date: Fri, 27 Jan 2023 16:02:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 12/14] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
 <06c06dde5ee635c6d1ebf66a8cff9e7e1f4fbf5c.1674818705.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <06c06dde5ee635c6d1ebf66a8cff9e7e1f4fbf5c.1674818705.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 27/01/2023 13:59, Oleksii Kurochko wrote:
> The patch introduces macros: BUG(), WARN(), run_in_exception(),
> assert_failed.
> 
> The implementation uses "ebreak" instruction in combination with
> diffrent bug frame tables (for each type) which contains useful
> information.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes:
>    - Remove __ in define namings
>    - Update run_in_exception_handler() with
>      register void *fn_ asm(__stringify(BUG_FN_REG)) = (fn);
>    - Remove bug_instr_t type and change it's usage to uint32_t
> ---
>   xen/arch/riscv/include/asm/bug.h | 118 ++++++++++++++++++++++++++++
>   xen/arch/riscv/traps.c           | 128 +++++++++++++++++++++++++++++++
>   xen/arch/riscv/xen.lds.S         |  10 +++
>   3 files changed, 256 insertions(+)
>   create mode 100644 xen/arch/riscv/include/asm/bug.h
> 
> diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
> new file mode 100644
> index 0000000000..4b15d8eba6
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/bug.h
> @@ -0,0 +1,118 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2021-2023 Vates

I have to question the two copyrights here given that the majority of 
the code seems to be taken from the arm implementation (see 
arch/arm/include/asm/bug.h).

With that said, we should consolidate the code rather than duplicating 
it on every architecture.

Cheers,

-- 
Julien Grall

