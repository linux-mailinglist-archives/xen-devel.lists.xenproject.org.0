Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481BD6E0DE9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 15:02:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520714.808603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwb0-000890-IH; Thu, 13 Apr 2023 13:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520714.808603; Thu, 13 Apr 2023 13:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwb0-00087G-E8; Thu, 13 Apr 2023 13:02:38 +0000
Received: by outflank-mailman (input) for mailman id 520714;
 Thu, 13 Apr 2023 13:02:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pmwaz-000879-Hy
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 13:02:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmwaz-0002n9-5E; Thu, 13 Apr 2023 13:02:37 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.20.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmway-0006K5-Qg; Thu, 13 Apr 2023 13:02:37 +0000
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
	bh=lLBVMFdXzSBS66TcytgO+g8bcAII3N0qP+rdanIkDHQ=; b=tedVXxabetuTfyaivXg1gnnsAk
	ZbSl6eRRYKWwj+x8yqtpPAXHoya6hubplba9I5G690pY9495YDzbO5aMuITBA0mt/98si6ADua3UI
	lYpriE9aU+DQTBG2weHoXE5pdZ6loGyHivgfkbMezfe5rB8oDutS1g0W7IzoZwjYecF0=;
Message-ID: <f405fa12-d99b-c07f-0bdd-c49f64f3ffb4@xen.org>
Date: Thu, 13 Apr 2023 14:02:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH v5 04/12] xen/arm: add SVE exception class handling
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-5-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230412094938.2693890-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/04/2023 10:49, Luca Fancellu wrote:
> SVE has a new exception class with code 0x19, introduce the new code
> and handle the exception.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes from v4:
>   - No changes
> Changes from v3:
>   - No changes
> Changes from v2:
>   - No changes
> Changes from v1:
>   - No changes
> Changes from RFC:
>   - No changes
> ---
>   xen/arch/arm/include/asm/processor.h |  1 +
>   xen/arch/arm/traps.c                 | 12 ++++++++++++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index bc683334125c..7e42ff8811fc 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -426,6 +426,7 @@
>   #define HSR_EC_HVC64                0x16
>   #define HSR_EC_SMC64                0x17
>   #define HSR_EC_SYSREG               0x18
> +#define HSR_EC_SVE                  0x19
>   #endif
>   #define HSR_EC_INSTR_ABORT_LOWER_EL 0x20
>   #define HSR_EC_INSTR_ABORT_CURR_EL  0x21
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index a78a99ddadd0..c2e30feafd5a 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -2160,6 +2160,13 @@ void do_trap_guest_sync(struct cpu_user_regs *regs)
>           perfc_incr(trap_sysreg);
>           do_sysreg(regs, hsr);
>           break;
> +    case HSR_EC_SVE:
> +        GUEST_BUG_ON(regs_mode_is_32bit(regs));
> +        gprintk(XENLOG_WARNING,
> +                "Domain id %d tried to use SVE while not allowed\n",
> +                current->domain->domain_id);

gprintk() will already print the domain/vCPU for you. Also, if you want 
to print a domain ID, then you should use ("%pd", d) rather than ("%d", 
d->domain_id).

> +        inject_undef_exception(regs, hsr);
> +        break;
>   #endif
>   
>       case HSR_EC_INSTR_ABORT_LOWER_EL:
> @@ -2189,6 +2196,11 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)
>       case HSR_EC_BRK:
>           do_trap_brk(regs, hsr);
>           break;
> +    case HSR_EC_SVE:
> +        /* An SVE exception is a bug somewhere in hypervisor code */
> +        printk("SVE trap at EL2.\n");
> +        do_unexpected_trap("Hypervisor", regs);

I think it would be better if you pass "SVE trap at EL2" as a string 
rather than adding your own printk above.

> +        break;
>   #endif
>       case HSR_EC_DATA_ABORT_CURR_EL:
>       case HSR_EC_INSTR_ABORT_CURR_EL:

Cheers,

-- 
Julien Grall

