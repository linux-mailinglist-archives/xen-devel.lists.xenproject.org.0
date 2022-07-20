Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0F857BDD7
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 20:33:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372136.603964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEVG-0000x1-8n; Wed, 20 Jul 2022 18:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372136.603964; Wed, 20 Jul 2022 18:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEVG-0000th-5f; Wed, 20 Jul 2022 18:32:58 +0000
Received: by outflank-mailman (input) for mailman id 372136;
 Wed, 20 Jul 2022 18:32:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fbis=XZ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oEEVE-0000tU-8g
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 18:32:56 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d768b61-085a-11ed-924f-1f966e50362f;
 Wed, 20 Jul 2022 20:32:54 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1658341968525237.44157802434802;
 Wed, 20 Jul 2022 11:32:48 -0700 (PDT)
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
X-Inumbo-ID: 5d768b61-085a-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1658341970; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=i3MSXvWGVFTj4Eu+UH9XowosJq51w/O/mFuuh7DV1IPL6dXT0ZYvo5t3E0vJotjB/l2TeFvPM6wAaD/6xaaXJ2Fau/LfE59r3TexA8rCXjS9faYY+6ZJrtnH9Nkt7NG5lV6x0mPkRZaoIB5wsFikgGi5E5mBVeorKVCiT8VsC3c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1658341970; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=/co16vRAwNgC5Z2jziSVb8l7V52dXhdT0PZ8F1tU+Fo=; 
	b=iM0rTlbn8QCJ2IjaVtZpNqgud4grhmDMFfikaza2IVN+zbV6R1jnZrz4UXHEiOpmI5ckcrxWV2mMvq3tTEDs3niTL0UHxg8o+bUPJyll7cvDDPe7HDNHD7ByaQxU5zuVqIou5ORQIwaKvatyxvsyLTY2Bilty92VVPuc75SrZ80=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658341970;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/co16vRAwNgC5Z2jziSVb8l7V52dXhdT0PZ8F1tU+Fo=;
	b=YloKpdYmNEW44Dg61L2dRfzQ7ROTCgsZXnkOv9rNzyN1JoYl7ep1wDkk0pgp0aOf
	gLd+/eSs6gTHzkBbsL74VtLKzr9GNi8WBjt0DdRfd2faqPaIP0XRBU8aHNZevyqNLYb
	yQ7W3tWFfSgPrT6oFPtVj2gci+Hi2vFkkfxo6MVE=
Message-ID: <e0a35fd5-d94e-b9e6-4d8b-eb442a03980b@apertussolutions.com>
Date: Wed, 20 Jul 2022 14:32:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-3-dpsmith@apertussolutions.com>
 <ea661a62-d832-cf7e-0f69-fc9d0bf1e50b@xen.org>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 02/18] introduction of generalized boot info
In-Reply-To: <ea661a62-d832-cf7e-0f69-fc9d0bf1e50b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 7/15/22 15:25, Julien Grall wrote:
> Hi Daniel,
> 
> On 06/07/2022 22:04, Daniel P. Smith wrote:
>> The x86 and Arm architectures represent in memory the general boot
>> information
>> and boot modules differently despite having commonality. The x86
>> representations are bound to the multiboot v1 structures while the Arm
>> representations are a slightly generalized meta-data container for the
>> boot
>> material. The multiboot structure does not lend itself well to being
>> expanded
>> to accommodate additional metadata, both general and boot module
>> specific. The
>> Arm structures are not bound to an external specification and thus are
>> able to
>> be expanded for solutions such as dom0less.
>>
>> This commit introduces a set of structures patterned off the Arm
>> structures to
>> represent the boot information in a manner that captures common data. The
>> structures provide an arch field to allow arch specific expansions to the
>> structures. The intended goal of these new common structures is to enable
>> commonality between the different architectures.  Specifically to enable
>> dom0less and hyperlaunch to have a common representation of boot-time
>> constructed domains.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
>> ---
>>   xen/arch/x86/include/asm/bootinfo.h | 48 +++++++++++++++++++++++++
>>   xen/include/xen/bootinfo.h          | 54 +++++++++++++++++++++++++++++
>>   2 files changed, 102 insertions(+)
>>   create mode 100644 xen/arch/x86/include/asm/bootinfo.h
>>   create mode 100644 xen/include/xen/bootinfo.h
>>
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h
>> b/xen/arch/x86/include/asm/bootinfo.h
>> new file mode 100644
>> index 0000000000..b0754a3ed0
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -0,0 +1,48 @@
>> +#ifndef __ARCH_X86_BOOTINFO_H__
>> +#define __ARCH_X86_BOOTINFO_H__
>> +
>> +/* unused for x86 */
>> +struct arch_bootstring { };
>> +
>> +struct __packed arch_bootmodule {
>> +#define BOOTMOD_FLAG_X86_RELOCATED      1U << 0
>> +    uint32_t flags;
>> +    uint32_t headroom;
>> +};
>> +
>> +struct __packed arch_boot_info {
>> +    uint32_t flags;
>> +#define BOOTINFO_FLAG_X86_MEMLIMITS      1U << 0
>> +#define BOOTINFO_FLAG_X86_BOOTDEV        1U << 1
>> +#define BOOTINFO_FLAG_X86_CMDLINE        1U << 2
>> +#define BOOTINFO_FLAG_X86_MODULES        1U << 3
>> +#define BOOTINFO_FLAG_X86_AOUT_SYMS      1U << 4
>> +#define BOOTINFO_FLAG_X86_ELF_SYMS       1U << 5
>> +#define BOOTINFO_FLAG_X86_MEMMAP         1U << 6
>> +#define BOOTINFO_FLAG_X86_DRIVES         1U << 7
>> +#define BOOTINFO_FLAG_X86_BIOSCONFIG     1U << 8
>> +#define BOOTINFO_FLAG_X86_LOADERNAME     1U << 9
>> +#define BOOTINFO_FLAG_X86_APM            1U << 10
>> +
>> +    bool xen_guest;
>> +
>> +    char *boot_loader_name;
>> +    char *kextra;
>> +
>> +    uint32_t mem_lower;
>> +    uint32_t mem_upper;
>> +
>> +    uint32_t mmap_length;
>> +    paddr_t mmap_addr;
>> +};
>> +
>> +struct __packed mb_memmap {
>> +    uint32_t size;
>> +    uint32_t base_addr_low;
>> +    uint32_t base_addr_high;
>> +    uint32_t length_low;
>> +    uint32_t length_high;
>> +    uint32_t type;
>> +};
>> +
>> +#endif
> 
> NIT: Missing emacs magics.

As a devoted vim user, begrudged ack. ( ^_^)

>> diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
>> new file mode 100644
>> index 0000000000..42b53a3ca6
>> --- /dev/null
>> +++ b/xen/include/xen/bootinfo.h
>> @@ -0,0 +1,54 @@
>> +#ifndef __XEN_BOOTINFO_H__
>> +#define __XEN_BOOTINFO_H__
>> +
>> +#include <xen/mm.h>
>> +#include <xen/types.h>
>> +
>> +#include <asm/bootinfo.h>
>> +
>> +typedef enum {
>> +    BOOTMOD_UNKNOWN,
>> +    BOOTMOD_XEN,
>> +    BOOTMOD_FDT,
>> +    BOOTMOD_KERNEL,
>> +    BOOTMOD_RAMDISK,
>> +    BOOTMOD_XSM,
>> +    BOOTMOD_UCODE,
>> +    BOOTMOD_GUEST_DTB,
>> +}  bootmodule_kind;
>> +
>> +typedef enum {
>> +    BOOTSTR_EMPTY,
>> +    BOOTSTR_STRING,
>> +    BOOTSTR_CMDLINE,
>> +} bootstring_kind;
>> +
>> +#define BOOTMOD_MAX_STRING 1024
>> +struct __packed boot_string {
> 
> As you use __packed, the fields...
> 
>> +    bootstring_kind kind;
>> +    struct arch_bootstring *arch;
> 
> ... may not be naturally aligned anymore. Here it will depend on the
> size of bootstring_kind (this is an enum and it don't think C guarantees
> the size). This...

Ack.

>> +
>> +    char bytes[BOOTMOD_MAX_STRING];
>> +    size_t len;
>> +};
>> +
>> +struct __packed boot_module {
>> +    bootmodule_kind kind;
>> +    paddr_t start;
>> +    mfn_t mfn;
>> +    size_t size;
>> +
>> +    struct arch_bootmodule *arch;
>> +    struct boot_string string;
>> +};
>> +
>> +struct __packed boot_info {
>> +    char *cmdline;
>> +
>> +    uint32_t nr_mods;
>> +    struct boot_module *mods;
> 
> ... more obvious on this one because on 64-bit arch, there will be no
> 32-bit padding. So 'mods' will be 32-bit aligned even if the value 64-bit.
> 
> This is going to be a problem on any architecture that forbid unaligned
> access (or let the software decide).
> 
> In this case, I don't think any structures you defined warrant to be
> __packed.

Ack, I was too focused on 32bit alignment for x86 bootstrap entry point
when I was laying out the structure, that was short-sighted on my part.
I will go back and rework to be 64bit aligned.

>> +
>> +    struct arch_boot_info *arch;
>> +};
>> +
>> +#endif
> 
> 
> NIT: Missing emacs magics.

Ack.

