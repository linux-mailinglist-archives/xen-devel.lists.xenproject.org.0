Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2285276F0A9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 19:30:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576547.902799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRc8w-0005No-0l; Thu, 03 Aug 2023 17:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576547.902799; Thu, 03 Aug 2023 17:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRc8v-0005L6-UO; Thu, 03 Aug 2023 17:29:45 +0000
Received: by outflank-mailman (input) for mailman id 576547;
 Thu, 03 Aug 2023 17:29:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0usr=DU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qRc8u-0005L0-HG
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 17:29:44 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 530f6042-3223-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 19:29:41 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691083774724241.91618186962626;
 Thu, 3 Aug 2023 10:29:34 -0700 (PDT)
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
X-Inumbo-ID: 530f6042-3223-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691083776; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mrMqGmqY1Toa3lpPDrAw0S2wyoznZsujWLJHpJtEfkWy9m5ZPwN5oJ/S9JcXWacZ73E5kjVWjd5ZChWGp4W8VzY1QDQ3FZAvspoAa42iP7ylLMRRuH4jcuW3AUiY9P+RFxh74VhDBbHU2C4VGca5F3s3PariPewE0AvsHgk0UKc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691083776; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=GXeUjwwr+A8yvrvDsQGAKvZOE1KzahYN6RE+9FJ12L4=; 
	b=D3fzz4PC4xZFNK380u2gpHeRmIOAsv6+vIDQ45re/1obvHF6MowFFxl63XRLnFvlcgmPt3EKs6kup6WnaQuLlo9QSr9xccerslX++UnNJ7ABtyWDFPtpQk9dwRs+rBARz7yKcXxbiZhSRrlZwBdd6s4Z7OF2uHstOCCUYGoAu2M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691083776;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=GXeUjwwr+A8yvrvDsQGAKvZOE1KzahYN6RE+9FJ12L4=;
	b=eBOoCQlmqM1QMbMAjcApXLiJTR2vdd8WhaZC8k7b1aezpydhKhfGcpAZRUO+b/ja
	7PFYEtr0R29mRIR8W+i8VvpYED9KwBT4ehE+GQ0HguzVJ3xBH0wDXMneJrW/ESvPsIK
	SkL0OYTavsXKXynBaT4f6qIir40dl73EgdnN5xLU=
Message-ID: <956a8409-a02f-41f0-5ddd-051d47907ad9@apertussolutions.com>
Date: Thu, 3 Aug 2023 13:29:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] fdt: make fdt handling reusable across arch
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-3-dpsmith@apertussolutions.com>
 <476e5c13-2b4f-d115-7237-d5220ec13cf2@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <476e5c13-2b4f-d115-7237-d5220ec13cf2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/3/23 08:48, Michal Orzel wrote:
> Hi Daniel,
> 
> On 03/08/2023 12:44, Daniel P. Smith wrote:
>>
>>
>> This refactors reusable code from Arm's bootfdt.c and device-tree.h that is
>> general fdt handling code.  The Kconfig parameter CORE_DEVICE_TREE is
> IIUC, you just try to untangle the code for fdt from dt (unflattened). CORE_DEVICE_TREE is
> a bit ambiguous in my opinion, so maybe just CONFIG_FDT, especially since you use it to guard libfdt/?

Untangle is a very good way to phrase it. ( ^_^)

Yes, I don't see any reason why CONFIG_FDT could be used instead.

>> introduced for when the ability of parsing DTB files is needed by a capability
>> such as hyperlaunch.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   MAINTAINERS                      |   8 +-
>>   xen/arch/arm/bootfdt.c           | 141 +---------------------------
>>   xen/arch/arm/domain_build.c      |   1 +
>>   xen/arch/arm/include/asm/setup.h |   6 --
>>   xen/common/Kconfig               |   4 +
>>   xen/common/Makefile              |   3 +-
>>   xen/common/fdt.c                 | 153 +++++++++++++++++++++++++++++++
>>   xen/include/xen/device_tree.h    |  50 +---------
>>   xen/include/xen/fdt.h            |  79 ++++++++++++++++
>>   9 files changed, 246 insertions(+), 199 deletions(-)
>>   create mode 100644 xen/common/fdt.c
>>   create mode 100644 xen/include/xen/fdt.h
>>
> [...]
> 
>> diff --git a/xen/common/fdt.c b/xen/common/fdt.c
>> new file mode 100644
>> index 0000000000..8d7acaaa43
>> --- /dev/null
>> +++ b/xen/common/fdt.c
>> @@ -0,0 +1,153 @@
>> +/*
> SPDX missing for a new file

Ack.

>> + * Flattened Device Tree
>> + *
>> + * Copyright (C) 2012-2014 Citrix Systems, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +#include <xen/fdt.h>
>> +#include <xen/init.h>
>> +#include <xen/lib.h>
>> +#include <xen/libfdt/libfdt.h>
>> +#include <xen/types.h>
>> +
>> +bool __init device_tree_node_matches(
>> +    const void *fdt, int node, const char *match)
> FWICS, this code style (that you use for every function in this patch) is rather uncommon in Xen so maybe better to follow the generic style.
> Also, this would avoid changing the style of functions/prototypes you move.

Um, my understanding is that this is the official style for Xen function 
definitions, unless it has changed due to MISRA, and that anytime a 
function definition is changed that the style should be corrected to 
this form.

Another coding style change I have been pinged on in the past that I 
surprised I have not been pinged on for this series is allowing the use 
of the short hand notation for ints, e.g. u8, u16, and u32.

> [...]
> 
>> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
>> index 1d79e23b28..82db38b140 100644
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -14,13 +14,12 @@
>>   #include <asm/device.h>
>>   #include <public/xen.h>
>>   #include <public/device_tree_defs.h>
>> +#include <xen/fdt.h>
>>   #include <xen/kernel.h>
>>   #include <xen/string.h>
>>   #include <xen/types.h>
>>   #include <xen/list.h>
>>
>> -#define DEVICE_TREE_MAX_DEPTH 16
>> -
>>   /*
>>    * Struct used for matching a device
>>    */
>> @@ -159,17 +158,8 @@ struct dt_raw_irq {
>>       u32 specifier[DT_MAX_IRQ_SPEC];
>>   };
>>
>> -typedef int (*device_tree_node_func)(const void *fdt,
>> -                                     int node, const char *name, int depth,
>> -                                     u32 address_cells, u32 size_cells,
>> -                                     void *data);
>> -
>>   extern const void *device_tree_flattened;
>>
>> -int device_tree_for_each_node(const void *fdt, int node,
>> -                              device_tree_node_func func,
>> -                              void *data);
>> -
>>   /**
>>    * dt_unflatten_host_device_tree - Unflatten the host device tree
>>    *
>> @@ -214,14 +204,6 @@ extern const struct dt_device_node *dt_interrupt_controller;
>>   struct dt_device_node *
>>   dt_find_interrupt_controller(const struct dt_device_match *matches);
>>
>> -#define dt_prop_cmp(s1, s2) strcmp((s1), (s2))
>> -#define dt_node_cmp(s1, s2) strcasecmp((s1), (s2))
>> -#define dt_compat_cmp(s1, s2) strcasecmp((s1), (s2))
>> -
>> -/* Default #address and #size cells */
>> -#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
>> -#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
>> -
>>   #define dt_for_each_property_node(dn, pp)                   \
>>       for ( pp = (dn)->properties; (pp) != NULL; pp = (pp)->next )
>>
>> @@ -231,16 +213,6 @@ dt_find_interrupt_controller(const struct dt_device_match *matches);
>>   #define dt_for_each_child_node(dt, dn)                      \
>>       for ( dn = (dt)->child; (dn) != NULL; dn = (dn)->sibling )
>>
>> -/* Helper to read a big number; size is in cells (not bytes) */
>> -static inline u64 dt_read_number(const __be32 *cell, int size)
>> -{
>> -    u64 r = 0;
>> -
>> -    while ( size-- )
>> -        r = (r << 32) | be32_to_cpu(*(cell++));
>> -    return r;
>> -}
>> -
>>   /* Wrapper for dt_read_number() to return paddr_t (instead of uint64_t) */
>>   static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
> Shouldn't this also go to fdt.h as it is just a wrapper for dt_read_number() you moved?

This patch came from hyperlaunch v1 series were I only moved what I 
needed, not necessarily everything that could reasonably be moved. I 
will gladly incorporate any additional macros, inlines, and functions 
that is felt is general enough to be included.

v/r,
dps


