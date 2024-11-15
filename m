Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043629CF190
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 17:35:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837826.1253722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBzHw-0000WE-C3; Fri, 15 Nov 2024 16:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837826.1253722; Fri, 15 Nov 2024 16:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBzHw-0000Ue-9B; Fri, 15 Nov 2024 16:35:16 +0000
Received: by outflank-mailman (input) for mailman id 837826;
 Fri, 15 Nov 2024 16:35:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=54cC=SK=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tBzHu-0000UY-Hg
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 16:35:14 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9353c9e6-a36f-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 17:35:09 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 173168850120022.310783997064277;
 Fri, 15 Nov 2024 08:35:01 -0800 (PST)
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
X-Inumbo-ID: 9353c9e6-a36f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjkzNTNjOWU2LWEzNmYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjg4NTEwLjAzOTc1OSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1731688503; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B0B77teyLZ6+fiXfRROE0J3Ou5MHkZo1qGQqzm9sm4vkwNAAtIFdEnc4Z7w/0xQbTFNPB1GOLHEGofo5GJmIxRA/+tAg+bqNLZ534/EtYBsPgfMPTx2kdAmT0+3g38xztfndYgkLEA5ac6AC51ZzetJc9MStsESUKKlsXQz5Fho=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731688503; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IC7on8EMBFSFYNnxwB6vXSPPYjvNqf7r/MO4JTFDGvk=; 
	b=QIxd9FkVB6Lq7eY433C5IVUzeK58fVMjeYDS3Ie9DmI0K5+gl+AbBVCwX9aFZyuHNyqEeFoO5n36/jV5q8KWrcctCBL6MP5IBxa51x3y/FJN7tIeGPWavEMLdlby6QRJEyn9VZor76cRcSu1HMqgCMr51Z5t5gUvK+3VkRZ6BQ4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731688503;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=IC7on8EMBFSFYNnxwB6vXSPPYjvNqf7r/MO4JTFDGvk=;
	b=kmKM5fUF7twUOIZVEsCkFcVku2ZfYmDUaTPMJ2mzA51WR6uw2U0UPqfm9IReuK8t
	VDsrn/hGMKPCpCI3GDJcwGxEwB7fasE3yJkF0C6P6NJNKh0T5BHyE1xMhmH50O/D/YJ
	DLO3bO/ZqLrwygudUxjFYrU4HGjas1koAp2V4yoY=
Message-ID: <21474601-2372-4f9c-aa26-b4ae415a273e@apertussolutions.com>
Date: Fri, 15 Nov 2024 11:34:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] x86/boot: add cmdline to struct boot_domain
To: xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-7-dpsmith@apertussolutions.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241115131204.32135-7-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/15/24 08:12, Daniel P. Smith wrote:
> Add a container for the "cooked" command line for a domain. This provides for
> the backing memory to be directly associated with the domain being constructed.
> This is done in anticipation that the domain construction path may need to be
> invoked multiple times, thus ensuring each instance had a distinct memory
> allocation.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> Changes since v8:
> - switch to a dynamically allocated buffer
> - dropped local cmdline var in pv dom0_construct()
> 
> Changes since v7:
> - updated commit message to expand on intent and purpose
> ---
>   xen/arch/x86/include/asm/bootdomain.h |  2 ++
>   xen/arch/x86/include/asm/dom0_build.h |  1 +
>   xen/arch/x86/pv/dom0_build.c          |  6 ++--
>   xen/arch/x86/setup.c                  | 49 ++++++++++++++++++++++-----
>   4 files changed, 45 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
> index 3873f916f854..75e7c706d86e 100644
> --- a/xen/arch/x86/include/asm/bootdomain.h
> +++ b/xen/arch/x86/include/asm/bootdomain.h
> @@ -12,6 +12,8 @@ struct boot_module;
>   struct domain;
>   
>   struct boot_domain {
> +    const char *cmdline;
> +
>       domid_t domid;
>   
>       struct boot_module *kernel;
> diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
> index 8c94e87dc576..6ca3ca7c8a43 100644
> --- a/xen/arch/x86/include/asm/dom0_build.h
> +++ b/xen/arch/x86/include/asm/dom0_build.h
> @@ -4,6 +4,7 @@
>   #include <xen/libelf.h>
>   #include <xen/sched.h>
>   
> +#include <asm/bootinfo.h>
>   #include <asm/setup.h>
>   
>   extern unsigned int dom0_memflags;
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index f42aeb031694..91bcce1542bc 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -379,7 +379,6 @@ static int __init dom0_construct(struct boot_domain *bd)
>       unsigned long image_len;
>       void *image_start;
>       unsigned long initrd_len = initrd ? initrd->size : 0;
> -    const char *cmdline;
>       l4_pgentry_t *l4tab = NULL, *l4start = NULL;
>       l3_pgentry_t *l3tab = NULL, *l3start = NULL;
>       l2_pgentry_t *l2tab = NULL, *l2start = NULL;
> @@ -422,7 +421,6 @@ static int __init dom0_construct(struct boot_domain *bd)
>       image_base = bootstrap_map_bm(image);
>       image_len = image->size;
>       image_start = image_base + image->headroom;
> -    cmdline = __va(image->cmdline_pa);
>   
>       d->max_pages = ~0U;
>   
> @@ -972,8 +970,8 @@ static int __init dom0_construct(struct boot_domain *bd)
>       }
>   
>       memset(si->cmd_line, 0, sizeof(si->cmd_line));
> -    if ( cmdline != NULL )
> -        strlcpy((char *)si->cmd_line, cmdline, sizeof(si->cmd_line));
> +    if ( bd->cmdline )
> +        strlcpy((char *)si->cmd_line, bd->cmdline, sizeof(si->cmd_line));
>   
>   #ifdef CONFIG_VIDEO
>       if ( !pv_shim && fill_console_start_info((void *)(si + 1)) )
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 533a1e2bbe05..b9ca9c486fe5 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -963,10 +963,31 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
>       return n;
>   }
>   
> -static struct domain *__init create_dom0(struct boot_info *bi)
> +static size_t __init domain_cmdline_size(
> +    struct boot_info *bi, struct boot_domain *bd)
>   {
> -    static char __initdata cmdline[MAX_GUEST_CMDLINE];
> +    size_t s = 0;
> +
> +    s += bi->kextra ? strlen(bi->kextra) : 0;
> +    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
>   
> +    /* Should only be called if one of extra or cmdline_pa are valid */
> +    ASSERT(s > 0);
> +
> +    /*
> +     * Add additional space for the following cases:
> +     *  - 7 chars for " noapic"
> +     *  - 13 chars for longest acpi opiton, " acpi=verbose"
> +     *  - 1 char to hold \0
> +     */
> +    s += 7 + 13 + 1;
> +
> +    return s;
> +}
> +
> +static struct domain *__init create_dom0(struct boot_info *bi)
> +{
> +    char *cmdline = NULL;
>       struct xen_domctl_createdomain dom0_cfg = {
>           .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
>           .max_evtchn_port = -1,
> @@ -1008,17 +1029,23 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>       /* Grab the DOM0 command line. */
>       if ( bd->kernel->cmdline_pa || bi->kextra )

The logic from which this originally derives mistakenly gives the sense, 
at least for me, that `string` field from module_t would only be a valid 
address if there was a string. I have now discovered this is not the 
case but is in fact the address of a zero length string. It just so 
happens all the previous logic worked out even for a zero length string. 
It also means this block was always being executed, since the check for 
a cmdline_pa will always be true. I am open to other suggestions, but my 
thinking right now is that the check of cmdline_pa should be a twofold 
check, that it is not zero and that it has a string length, e.g.:

     if ( (bd->kernel->cmdline_pa &&
           strlen(__va(bd->kernel->cmdline_pa))) || bi->kextra )



