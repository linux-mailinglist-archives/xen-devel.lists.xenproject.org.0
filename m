Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5397576758
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 21:25:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368544.599885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCQw9-0002KI-EK; Fri, 15 Jul 2022 19:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368544.599885; Fri, 15 Jul 2022 19:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCQw9-0002IL-BK; Fri, 15 Jul 2022 19:25:17 +0000
Received: by outflank-mailman (input) for mailman id 368544;
 Fri, 15 Jul 2022 19:25:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oCQw8-0002IF-Bg
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 19:25:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCQw7-0003pP-CQ; Fri, 15 Jul 2022 19:25:15 +0000
Received: from [54.239.6.188] (helo=[192.168.17.116])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCQw7-0006iq-32; Fri, 15 Jul 2022 19:25:15 +0000
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
	bh=SroAn5sAyGZPK89dB+xgyIVv186RoJ/iI00k8W+Fk+k=; b=AKC0fzu4mtvgCOYj4/AjiXEZHd
	TVhwoqrUHXEk/CIEDWeRtFlTbfcEqpuoMOy5gi+Qc31A6e0+TSd8rCTgRI2lBy0aYzPsOlFN/jBdQ
	u1iLpIUdqGD5hlafrebWZ9dDR3ehs+mWPm8p4+BCsfnLdTIfJJKWPCO9lvygIF7IyiSk=;
Message-ID: <ea661a62-d832-cf7e-0f69-fc9d0bf1e50b@xen.org>
Date: Fri, 15 Jul 2022 20:25:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v1 02/18] introduction of generalized boot info
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-3-dpsmith@apertussolutions.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220706210454.30096-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Daniel,

On 06/07/2022 22:04, Daniel P. Smith wrote:
> The x86 and Arm architectures represent in memory the general boot information
> and boot modules differently despite having commonality. The x86
> representations are bound to the multiboot v1 structures while the Arm
> representations are a slightly generalized meta-data container for the boot
> material. The multiboot structure does not lend itself well to being expanded
> to accommodate additional metadata, both general and boot module specific. The
> Arm structures are not bound to an external specification and thus are able to
> be expanded for solutions such as dom0less.
> 
> This commit introduces a set of structures patterned off the Arm structures to
> represent the boot information in a manner that captures common data. The
> structures provide an arch field to allow arch specific expansions to the
> structures. The intended goal of these new common structures is to enable
> commonality between the different architectures.  Specifically to enable
> dom0less and hyperlaunch to have a common representation of boot-time
> constructed domains.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
> ---
>   xen/arch/x86/include/asm/bootinfo.h | 48 +++++++++++++++++++++++++
>   xen/include/xen/bootinfo.h          | 54 +++++++++++++++++++++++++++++
>   2 files changed, 102 insertions(+)
>   create mode 100644 xen/arch/x86/include/asm/bootinfo.h
>   create mode 100644 xen/include/xen/bootinfo.h
> 
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> new file mode 100644
> index 0000000000..b0754a3ed0
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -0,0 +1,48 @@
> +#ifndef __ARCH_X86_BOOTINFO_H__
> +#define __ARCH_X86_BOOTINFO_H__
> +
> +/* unused for x86 */
> +struct arch_bootstring { };
> +
> +struct __packed arch_bootmodule {
> +#define BOOTMOD_FLAG_X86_RELOCATED      1U << 0
> +    uint32_t flags;
> +    uint32_t headroom;
> +};
> +
> +struct __packed arch_boot_info {
> +    uint32_t flags;
> +#define BOOTINFO_FLAG_X86_MEMLIMITS  	1U << 0
> +#define BOOTINFO_FLAG_X86_BOOTDEV    	1U << 1
> +#define BOOTINFO_FLAG_X86_CMDLINE    	1U << 2
> +#define BOOTINFO_FLAG_X86_MODULES    	1U << 3
> +#define BOOTINFO_FLAG_X86_AOUT_SYMS  	1U << 4
> +#define BOOTINFO_FLAG_X86_ELF_SYMS   	1U << 5
> +#define BOOTINFO_FLAG_X86_MEMMAP     	1U << 6
> +#define BOOTINFO_FLAG_X86_DRIVES     	1U << 7
> +#define BOOTINFO_FLAG_X86_BIOSCONFIG 	1U << 8
> +#define BOOTINFO_FLAG_X86_LOADERNAME 	1U << 9
> +#define BOOTINFO_FLAG_X86_APM        	1U << 10
> +
> +    bool xen_guest;
> +
> +    char *boot_loader_name;
> +    char *kextra;
> +
> +    uint32_t mem_lower;
> +    uint32_t mem_upper;
> +
> +    uint32_t mmap_length;
> +    paddr_t mmap_addr;
> +};
> +
> +struct __packed mb_memmap {
> +    uint32_t size;
> +    uint32_t base_addr_low;
> +    uint32_t base_addr_high;
> +    uint32_t length_low;
> +    uint32_t length_high;
> +    uint32_t type;
> +};
> +
> +#endif

NIT: Missing emacs magics.

> diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
> new file mode 100644
> index 0000000000..42b53a3ca6
> --- /dev/null
> +++ b/xen/include/xen/bootinfo.h
> @@ -0,0 +1,54 @@
> +#ifndef __XEN_BOOTINFO_H__
> +#define __XEN_BOOTINFO_H__
> +
> +#include <xen/mm.h>
> +#include <xen/types.h>
> +
> +#include <asm/bootinfo.h>
> +
> +typedef enum {
> +    BOOTMOD_UNKNOWN,
> +    BOOTMOD_XEN,
> +    BOOTMOD_FDT,
> +    BOOTMOD_KERNEL,
> +    BOOTMOD_RAMDISK,
> +    BOOTMOD_XSM,
> +    BOOTMOD_UCODE,
> +    BOOTMOD_GUEST_DTB,
> +}  bootmodule_kind;
> +
> +typedef enum {
> +    BOOTSTR_EMPTY,
> +    BOOTSTR_STRING,
> +    BOOTSTR_CMDLINE,
> +} bootstring_kind;
> +
> +#define BOOTMOD_MAX_STRING 1024
> +struct __packed boot_string {

As you use __packed, the fields...

> +    bootstring_kind kind;
> +    struct arch_bootstring *arch;

... may not be naturally aligned anymore. Here it will depend on the 
size of bootstring_kind (this is an enum and it don't think C guarantees 
the size). This...

> +
> +    char bytes[BOOTMOD_MAX_STRING];
> +    size_t len;
> +};
> +
> +struct __packed boot_module {
> +    bootmodule_kind kind;
> +    paddr_t start;
> +    mfn_t mfn;
> +    size_t size;
> +
> +    struct arch_bootmodule *arch;
> +    struct boot_string string;
> +};
> +
> +struct __packed boot_info {
> +    char *cmdline;
> +
> +    uint32_t nr_mods;
> +    struct boot_module *mods;

... more obvious on this one because on 64-bit arch, there will be no 
32-bit padding. So 'mods' will be 32-bit aligned even if the value 64-bit.

This is going to be a problem on any architecture that forbid unaligned 
access (or let the software decide).

In this case, I don't think any structures you defined warrant to be 
__packed.

> +
> +    struct arch_boot_info *arch;
> +};
> +
> +#endif


NIT: Missing emacs magics.

-- 
Julien Grall

