Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F4657673B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 21:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368510.599829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCQnH-0006Y4-2D; Fri, 15 Jul 2022 19:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368510.599829; Fri, 15 Jul 2022 19:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCQnG-0006VJ-VO; Fri, 15 Jul 2022 19:16:06 +0000
Received: by outflank-mailman (input) for mailman id 368510;
 Fri, 15 Jul 2022 19:16:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oCQnF-0006VD-1y
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 19:16:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCQnD-0003fy-MQ; Fri, 15 Jul 2022 19:16:03 +0000
Received: from [54.239.6.188] (helo=[192.168.17.116])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCQnD-0006GB-FT; Fri, 15 Jul 2022 19:16:03 +0000
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
	bh=arvjlA3l8K5gzm9a9hMeK1m+Hrcj3nW7D+7T4XKonLQ=; b=yBxscqSgyTAYJLAngz/nLocNEU
	H+5930LONalzwPnunZk1PaZRcCkBdCFpX307CzztUCYq41KPpnorkVz6DFINCrjgFfDa/nj4KBs6X
	9+fT98F2cg18RtjZWHozI+UycfMYPFItiUZrHK9wsP67bf5fHXdIeXNYySoCgC5s6AaE=;
Message-ID: <c4ca59d6-daed-25e9-86d8-019676744eb2@xen.org>
Date: Fri, 15 Jul 2022 20:16:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v1 01/18] kconfig: allow configuration of maximum modules
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-2-dpsmith@apertussolutions.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220706210454.30096-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 06/07/2022 22:04, Daniel P. Smith wrote:
> For x86 the number of allowable multiboot modules varies between the different
> entry points, non-efi boot, pvh boot, and efi boot. In the case of both Arm and
> x86 this value is fixed to values based on generalized assumptions. With
> hyperlaunch for x86 and dom0less on Arm, use of static sizes results in large
> allocations compiled into the hypervisor that will go unused by many use cases.
> 
> This commit introduces a Kconfig variable that is set with sane defaults based
> on configuration selection. This variable is in turned used as the array size
> for the cases where a static allocated array of boot modules is declared.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Christopher Clark <christopher.clark@starlab.io>

I am not entirely sure where this reviewed-by is coming from. Is this 
from internal review?

If yes, my recommendation would be to provide the reviewed-by on the 
mailing list. Ideally, the review should also be done in the open, but I 
understand some company wish to do a fully internal review first.

At least from a committer perspective, this helps me to know whether the 
reviewed-by still apply. An example would be if you send a v2, I would 
not be able to know whether Christoffer still agreed on the change.

> ---
>   xen/arch/Kconfig                  | 12 ++++++++++++
>   xen/arch/arm/include/asm/setup.h  |  5 +++--
>   xen/arch/x86/efi/efi-boot.h       |  2 +-
>   xen/arch/x86/guest/xen/pvh-boot.c |  2 +-
>   xen/arch/x86/setup.c              |  4 ++--
>   5 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> index f16eb0df43..24139057be 100644
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -17,3 +17,15 @@ config NR_CPUS
>   	  For CPU cores which support Simultaneous Multi-Threading or similar
>   	  technologies, this the number of logical threads which Xen will
>   	  support.
> +
> +config NR_BOOTMODS
> +	int "Maximum number of boot modules that a loader can pass"
> +	range 1 32768
> +	default "8" if X86
> +	default "32" if ARM
> +	help
> +	  Controls the build-time size of various arrays allocated for
> +	  parsing the boot modules passed by a loader when starting Xen.
> +
> +	  This is of particular interest when using Xen's hypervisor domain
> +	  capabilities such as dom0less.
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 2bb01ecfa8..312a3e4209 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -10,7 +10,8 @@
>   
>   #define NR_MEM_BANKS 256
>   
> -#define MAX_MODULES 32 /* Current maximum useful modules */
> +/* Current maximum useful modules */
> +#define MAX_MODULES CONFIG_NR_BOOTMODS
>   
>   typedef enum {
>       BOOTMOD_XEN,
> @@ -38,7 +39,7 @@ struct meminfo {
>    * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
>    * The purpose of the domU flag is to avoid getting confused in
>    * kernel_probe, where we try to guess which is the dom0 kernel and
> - * initrd to be compatible with all versions of the multiboot spec.
> + * initrd to be compatible with all versions of the multiboot spec.

In general, I much prefer if coding style changes are done separately 
because it helps the review (I don't have to stare at the line to figure 
out what changed).

I am not going to force this here. However, the strict minimum is to 
mention the change in the commit message.

>    */
>   #define BOOTMOD_MAX_CMDLINE 1024
>   struct bootmodule {
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 6e65b569b0..4e1a799749 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -18,7 +18,7 @@ static multiboot_info_t __initdata mbi = {
>    * The array size needs to be one larger than the number of modules we
>    * support - see __start_xen().
>    */
> -static module_t __initdata mb_modules[5];
> +static module_t __initdata mb_modules[CONFIG_NR_BOOTMODS + 1];

Please explain in the commit message why the number of modules was 
bumped from 5 to 9.

>   
>   static void __init edd_put_string(u8 *dst, size_t n, const char *src)
>   {
> diff --git a/xen/arch/x86/guest/xen/pvh-boot.c b/xen/arch/x86/guest/xen/pvh-boot.c
> index 498625eae0..834b1ad16b 100644
> --- a/xen/arch/x86/guest/xen/pvh-boot.c
> +++ b/xen/arch/x86/guest/xen/pvh-boot.c
> @@ -32,7 +32,7 @@ bool __initdata pvh_boot;
>   uint32_t __initdata pvh_start_info_pa;
>   
>   static multiboot_info_t __initdata pvh_mbi;
> -static module_t __initdata pvh_mbi_mods[8];
> +static module_t __initdata pvh_mbi_mods[CONFIG_NR_BOOTMOD + 1];

What's the +1 for?

>   static const char *__initdata pvh_loader = "PVH Directboot";
>   
>   static void __init convert_pvh_info(multiboot_info_t **mbi,
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index f08b07b8de..2aa1e28c8f 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1020,9 +1020,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>           panic("dom0 kernel not specified. Check bootloader configuration\n");
>   
>       /* Check that we don't have a silly number of modules. */
> -    if ( mbi->mods_count > sizeof(module_map) * 8 )
> +    if ( mbi->mods_count > CONFIG_NR_BOOTMODS )
>       {
> -        mbi->mods_count = sizeof(module_map) * 8;
> +        mbi->mods_count = CONFIG_NR_BOOTMODS;
>           printk("Excessive multiboot modules - using the first %u only\n",
>                  mbi->mods_count);
>       }

AFAIU, this check is to make sure that we will not overrun module_map in 
the next line:

bitmap_fill(module_map, mbi->mods_count);

The current definition of module_map will allow 64 modules. But you are 
allowing 32768. So I think you either want to keep the check or define 
module_map as:

DECLARE_BITMAP(module_map, CONFIG_NR_BOOTMODS);

Cheers,

-- 
Julien Grall

