Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B2B76D883
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 22:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575165.900982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRIJy-0000jI-2v; Wed, 02 Aug 2023 20:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575165.900982; Wed, 02 Aug 2023 20:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRIJx-0000gB-WB; Wed, 02 Aug 2023 20:19:49 +0000
Received: by outflank-mailman (input) for mailman id 575165;
 Wed, 02 Aug 2023 20:19:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F9x3=DT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qRIJw-0000fz-Ar
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 20:19:48 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb0f4094-3171-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 22:19:45 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691007580777367.84003628495543;
 Wed, 2 Aug 2023 13:19:40 -0700 (PDT)
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
X-Inumbo-ID: eb0f4094-3171-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691007583; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b7hovrLJM2gMZUtVHQojyZiIU+PiuLTi02e9181eLDfBFvrvI73R+cKfOyhyos23ZjyXBPBQ+eYYAdq8bawsOw+aDtiKSM72DMPpAmhsfVvBVGA2eNtb1XVbnD7U4Eflv8+P8zFDV3F1a/cy90df0tmA7SP2oomtfm7JQQfZb2M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691007583; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=cXdqKLC6su+a6fFUARpsTMErLg/CXMnfU4mRRHRkGKE=; 
	b=JMRqWkVJSKUuynFFxDtw1wAzi2B3xZnjiRjAeSSRs/1YchgMsHh9N3smEGEAojP7aUMAytpstXDGJkFwIFhwV6vA91oLCKaABKY6NNW+pEls831arwIpNImEWLE7HhpyzGsnIHvnaPyXJHR0xVyEHv6e5vf8iLXRsRagdrgD+2M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691007583;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cXdqKLC6su+a6fFUARpsTMErLg/CXMnfU4mRRHRkGKE=;
	b=syKOAf7NScc8ArgMsH1zxg0VDolAMJuNrZDVspxYy5DET2NaDbqtr544o31KVQbg
	kAreS3teJP9qJK7A3eviEGu5y2dmC2Kc/nOlFvz5A01bqaQvNroXsypqLLqPkug38QB
	fPVzycaAehklGhnhWGIR1Ov95NGgxOmFx5YAWkgY=
Message-ID: <7afba030-48f2-baaf-02f9-dae84107a620@apertussolutions.com>
Date: Wed, 2 Aug 2023 16:19:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] fdt: make fdt handling reusable across arch
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20230801161409.25905-1-dpsmith@apertussolutions.com>
 <20230801161409.25905-3-dpsmith@apertussolutions.com>
 <AS8PR08MB799102916C8CA24C276DB51A920BA@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <AS8PR08MB799102916C8CA24C276DB51A920BA@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/2/23 02:13, Henry Wang wrote:
> Hi Daniel,

Hey Henry!

>> -----Original Message-----
>> Subject: [PATCH 2/2] fdt: make fdt handling reusable across arch
>>
>> This refactors reusable code from Arm's bootfdt.c and device-tree.h that is
>> general fdt handling code.  The Kconfig parameter CORE_DEVICE_TREE is
>> introduced for when the ability of parsing DTB files is needed by a capability
>> such as hyperlaunch.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   MAINTAINERS                   |   2 +
>>   xen/arch/arm/bootfdt.c        | 141 +------------------------------
>>   xen/common/Kconfig            |   4 +
>>   xen/common/Makefile           |   3 +-
>>   xen/common/fdt.c              | 153 ++++++++++++++++++++++++++++++++++
>>   xen/include/xen/device_tree.h |  50 +----------
>>   xen/include/xen/fdt.h         |  79 ++++++++++++++++++
>>   7 files changed, 242 insertions(+), 190 deletions(-)
>>   create mode 100644 xen/common/fdt.c
>>   create mode 100644 xen/include/xen/fdt.h
>>
>> +void __init device_tree_get_reg(
>> +    const __be32 **cell, uint32_t address_cells, uint32_t size_cells,
>> +    paddr_t *start, paddr_t *size)
>> +{
>> +    uint64_t dt_start, dt_size;
>> +
>> +    /*
>> +     * dt_next_cell will return uint64_t whereas paddr_t may not be 64-bit.
>> +     * Thus, there is an implicit cast from uint64_t to paddr_t.
>> +     */
>> +    dt_start = dt_next_cell(address_cells, cell);
>> +    dt_size = dt_next_cell(size_cells, cell);
>> +
>> +    if ( dt_start != (paddr_t)dt_start )
>> +    {
>> +        printk("Physical address greater than max width supported\n");
>> +        WARN();
>> +    }
>> +
>> +    if ( dt_size != (paddr_t)dt_size )
>> +    {
>> +        printk("Physical size greater than max width supported\n");
>> +        WARN();
>> +    }
>> +
>> +    /*
>> +     * Xen will truncate the address/size if it is greater than the maximum
>> +     * supported width and it will give an appropriate warning.
>> +     */
>> +    *start = dt_start;
>> +    *size = dt_size;
>> +}
>> +
>> +u32 __init device_tree_get_u32(
>> +    const void *fdt, int node, const char *prop_name, u32 dflt)
>> +{
>> +    const struct fdt_property *prop;
>> +
>> +    prop = fdt_get_property(fdt, node, prop_name, NULL);
>> +    if ( !prop || prop->len < sizeof(u32) )
>> +        return dflt;
>> +
>> +    return fdt32_to_cpu(*(uint32_t*)prop->data);
>> +}
> 
> When I tested this patch by our internal CI (I applied this patch on top
> of today's staging:
> c2026b88b5 xen/arm/IRQ: uniform irq_set_affinity() with x86 version),
> there are some build errors as below:
> 
> aarch64-linux-gnu-gcc -MMD -MP -MF ./.asm-offsets.s.d -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs -O2 -fomit-frame-pointer -nostdinc -fno-builtin -fno-common -Werror -Wredundant-decls -Wno-pointer-arith -Wvla -pipe -D__XEN__ -include /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/include/xen/config.h -mcpu=generic -mgeneral-regs-only -mno-outline-atomics -I./include -I./arch/arm/include -I/jenkins/workspace/ais-xenbits-xen/layers/xen/xen/include -I/jenkins/workspace/ais-xenbits-xen/layers/xen/xen/arch/arm/include -fno-pie -fno-stack-protector -fno-exceptions -fno-asynchronous-unwind-tables -Wnested-externs -S -g0 -o asm-offsets.s.new -MQ asm-offsets.s /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/arch/arm/arm64/asm-offsets.c
> In file included from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/arch/arm/arm64/asm-offsets.c:13:
> /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/arch/arm/include/asm/setup.h:162:6: error: redundant redeclaration of 'device_tree_get_reg' [-Werror=redundant-decls]
>    162 | void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
>        |      ^~~~~~~~~~~~~~~~~~~
> In file included from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/include/xen/device_tree.h:17,
>                   from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/arch/arm/include/asm/smp.h:6,
>                   from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/include/xen/smp.h:4,
>                   from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/include/xen/rwlock.h:6,
>                   from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/include/xen/sched.h:7,
>                   from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/arch/arm/arm64/asm-offsets.c:9:
> /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/include/xen/fdt.h:64:13: note: previous declaration of 'device_tree_get_reg' with type 'void(const __be32 **, u32,  u32,  u64 *, u64 *)' {aka 'void(const unsigned int **, unsigned int,  unsigned int,  long unsigned int *, long unsigned int *)'}
>     64 | void __init device_tree_get_reg(
>        |             ^~~~~~~~~~~~~~~~~~~
> In file included from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/arch/arm/arm64/asm-offsets.c:13:
> /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/arch/arm/include/asm/setup.h:165:5: error: redundant redeclaration of 'device_tree_get_u32' [-Werror=redundant-decls]
>    165 | u32 device_tree_get_u32(const void *fdt, int node,
>        |     ^~~~~~~~~~~~~~~~~~~
> In file included from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/include/xen/device_tree.h:17,
>                   from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/arch/arm/include/asm/smp.h:6,
>                   from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/include/xen/smp.h:4,
>                   from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/include/xen/rwlock.h:6,
>                   from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/include/xen/sched.h:7,
>                   from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/arch/arm/arm64/asm-offsets.c:9:
> /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/include/xen/fdt.h:68:12: note: previous declaration of 'device_tree_get_u32' with type 'u32(const void *, int,  const char *, u32)' {aka 'unsigned int(const void *, int,  const char *, unsigned int)'}
>     68 | u32 __init device_tree_get_u32(
>        |            ^~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[2]: *** [/jenkins/workspace/ais-xenbits-xen/layers/xen/xen/./build.mk:45: asm-offsets.s] Error 1
> make[1]: *** [/jenkins/workspace/ais-xenbits-xen/layers/xen/xen/Makefile:597: xen] Error 2
> make[1]: Leaving directory '/jenkins/workspace/ais-xenbits-xen/build/xen-fvp-base'
> make: *** [Makefile:183: __sub-make] Error 2
> make: Leaving directory '/jenkins/workspace/ais-xenbits-xen/layers/xen/xen'
> 
> The staging itself passed the CI check. Did I miss some context to make
> this patch works? Could you please provide some hints? Thanks in advance!

Nope you are correct, I now need to go back and look if I sent patches 
out of the wrong branch or if I really did miss cleaning up the original 
declarations in the Arm tree. I fairly confident I made sure gitlab-ci 
passed before I cut the patches for sending, but since I had three 
different series in flight, I may have gotten jumbled. Apologies for the 
unnecessary churn here.

V/r,
Daniel P. Smith

