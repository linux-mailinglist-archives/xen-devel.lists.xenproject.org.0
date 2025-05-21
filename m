Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F7AABF9C9
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 17:45:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992112.1375889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHld0-00084K-Tz; Wed, 21 May 2025 15:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992112.1375889; Wed, 21 May 2025 15:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHld0-00081q-RJ; Wed, 21 May 2025 15:45:10 +0000
Received: by outflank-mailman (input) for mailman id 992112;
 Wed, 21 May 2025 15:45:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHlcz-00081k-1E
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 15:45:09 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 918b6372-365a-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 17:45:06 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ad216a5a59cso980353066b.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 08:45:06 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04b08bsm928214566b.13.2025.05.21.08.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 08:45:05 -0700 (PDT)
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
X-Inumbo-ID: 918b6372-365a-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747842306; x=1748447106; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fmlu9LIzefqsnSDBpgSUuQP5QuHaG/iY95IyALdJ1bA=;
        b=DC1zWwHnoYwkX7cCJ82J6R43i2P8QgvHqpbl6PYvf3PuzQwpTJmFU+cnvkdygVP7iY
         XLMWrwIsnOMcpOo3Zczldv3m+ceYMqf6rrM17XdexxPqFJ8rvzU/bRA99e4VD6IyUYgi
         vdmlk0UPNO6EQSYVXd91Qnhkn7lGcGGkLe34lLyl58kVhhwmpmEFdxeT5L17xjc/Lq/q
         sbkKbIPArqC1NglwEk8h89GcKjQcFD/u/XhYtq/2fGdFQmuLrpydov38NbFuf5f/KLWY
         XMVk2td7RlJvewCfvSRPb3h8E/GL0XADp+FAggu6bFJ1WKyWptECIu1+KG6QEeb9+Ktt
         RRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747842306; x=1748447106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fmlu9LIzefqsnSDBpgSUuQP5QuHaG/iY95IyALdJ1bA=;
        b=Kfo7K0kjOvhtkYtslsDGNlbqlmADe05WOTwZ/OAQDyyzysuRaYbiFnr0X/50iUqd5+
         V9an1gd50fDdQ0+qeyHq/cca6F0dt3QifGQqc182hZOsW+xR6K7N0WpjwwqJ6d+o2Zmg
         2yc0mlQaUxv1ekfrpWkqLpPupTzJYsh4Krn1DFEVbg31CJLhstIqO+nTbJsw+cjz+7X/
         NMJ/oAnTUArlS03hg2WlhIbzitDWkBlaMLKn3hG9kh9saUX2QlQOGF1vo8J9m4PTtNmM
         afwtdmqvdXmXh6Q1OOLwxxIbcekjskkkX8j+OSZ/7DK0FH9BvgmOGURi7mMsRUgsGPm/
         X1Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVd3tHX+E0N3IIYSIVLuhyG3BqMxAZelsjj4QTtB9Gq0UCuR5Y76XdwwXzKHKUes154VF7JoktGbBw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxrpnsn6W88Wyw/p9DLolrbAv909kykxKs7XdQcHpfgYtjSzfwo
	5d6BAXtr88Y1z7dUrvyF7eyt8CUg2oLk73hd+lcURDERPXVqLGqpzLR7OfrdvRHj/Q==
X-Gm-Gg: ASbGncutRrzZ0CLx9nxPW+Y61omAGJgWmU+qc2nMDXfvIt0IHGiCYqdIVji7N/ObeQM
	I0HZeY3I8gkq+WB1Nn30/rDabCr0rBUMo6wNPA1DfLnNJ7GFMcS19E/Egl1+yPh1oBqb/aMkbTg
	oplQFkA8w5mJ/0MYcD22jnpVqqsgFxaWXb2BfY950WzvKe6ijQW6NLHKVH+q3mTMMUAomebC34Z
	YlMpcQK2KtWegTAhTvOqw7EG7BfGIRH8utGlEC1riXQ66NBhOiJN92cr6owiP9zmmxTpJOMpapO
	XX+2RCPqR0dSz/7LxrqVB5hhKe+dZs+I7NPJiXxvbCLa0zraXKdMpsbjBxfrGg==
X-Google-Smtp-Source: AGHT+IFwY3EBkA9SdvbUJ07ZxcbYFvj6yaI0lJQioAfj14s6spZSvGy1E6QH2A+bdJV8Ez+fqfXDBA==
X-Received: by 2002:a17:906:fb92:b0:ad5:3746:58fd with SMTP id a640c23a62f3a-ad537465b55mr1449347666b.51.1747842305973;
        Wed, 21 May 2025 08:45:05 -0700 (PDT)
Message-ID: <4896ab0b-f45e-43e9-bcee-f5496717eb2a@suse.com>
Date: Wed, 21 May 2025 17:45:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/22] include/xen/slr-table.h: Secure Launch Resource
 Table definitions
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <cdd7b9ff21c81683ce2245bc2b5e0a7a87e51e3c.1747155790.git.sergii.dmytruk@3mdeb.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cdd7b9ff21c81683ce2245bc2b5e0a7a87e51e3c.1747155790.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2025 19:05, Sergii Dmytruk wrote:
> The file provides constants, structures and several helper functions for
> parsing SLRT.
> 
> Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> ---
>  xen/include/xen/slr-table.h | 268 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 268 insertions(+)
>  create mode 100644 xen/include/xen/slr-table.h
> 
> --- /dev/null
> +++ b/xen/include/xen/slr-table.h
> @@ -0,0 +1,268 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

GPL-2.0-only is, I think, the one to use for new code.

> +/*
> + *  Copyright (c) 2025 Apertus Solutions, LLC
> + *  Copyright (c) 2025 Oracle and/or its affiliates.
> + *  Copyright (c) 2025 3mdeb Sp. z o.o

I'm curious: Considering the (just) 2 S-o-b, where's the 3rd copyright
line coming from?

> + *  Secure Launch Resource Table definitions
> + */
> +
> +#ifndef XEN__SLR_TABLE_H
> +#define XEN__SLR_TABLE_H
> +
> +#include <xen/types.h>

Looks like xen/stdint.h would suffice?

> +#define UEFI_SLR_TABLE_GUID \
> +    { 0x877a9b2aU, 0x0385, 0x45d1, { 0xa0, 0x34, 0x9d, 0xac, 0x9c, 0x9e, 0x56, 0x5f } }

I'm not sure this is a good place to put UEFI GUIDs. Considering e.g ...

> +/* SLR table header values */
> +#define SLR_TABLE_MAGIC         0x4452544d
> +#define SLR_TABLE_REVISION      1
> +
> +/* Current revisions for the policy and UEFI config */
> +#define SLR_POLICY_REVISION         1
> +#define SLR_UEFI_CONFIG_REVISION    1

... this, is the whole concept perhaps bound to UEFI? In which casethe
whole header may want to move to the efi/ subdir?

> +/* SLR defined architectures */
> +#define SLR_INTEL_TXT   1
> +#define SLR_AMD_SKINIT  2

These are both x86, yet the header is put in the common include dir?

> +/* SLR defined bootloaders */
> +#define SLR_BOOTLOADER_INVALID  0
> +#define SLR_BOOTLOADER_GRUB     1
> +
> +/* Log formats */
> +#define SLR_DRTM_TPM12_LOG      1
> +#define SLR_DRTM_TPM20_LOG      2
> +
> +/* DRTM Policy Entry Flags */
> +#define SLR_POLICY_FLAG_MEASURED    0x1
> +#define SLR_POLICY_IMPLICIT_SIZE    0x2
> +
> +/* Array Lengths */
> +#define TPM_EVENT_INFO_LENGTH       32
> +#define TXT_VARIABLE_MTRRS_LENGTH   32
> +
> +/* Tags */
> +#define SLR_ENTRY_INVALID       0x0000
> +#define SLR_ENTRY_DL_INFO       0x0001
> +#define SLR_ENTRY_LOG_INFO      0x0002
> +#define SLR_ENTRY_DRTM_POLICY   0x0003
> +#define SLR_ENTRY_INTEL_INFO    0x0004
> +#define SLR_ENTRY_AMD_INFO      0x0005
> +#define SLR_ENTRY_ARM_INFO      0x0006
> +#define SLR_ENTRY_UEFI_INFO     0x0007
> +#define SLR_ENTRY_UEFI_CONFIG   0x0008
> +#define SLR_ENTRY_END           0xffff
> +
> +/* Entity Types */
> +#define SLR_ET_UNSPECIFIED        0x0000
> +#define SLR_ET_SLRT               0x0001
> +#define SLR_ET_BOOT_PARAMS        0x0002
> +#define SLR_ET_SETUP_DATA         0x0003
> +#define SLR_ET_CMDLINE            0x0004
> +#define SLR_ET_UEFI_MEMMAP        0x0005
> +#define SLR_ET_RAMDISK            0x0006
> +#define SLR_ET_MULTIBOOT2_INFO    0x0007
> +#define SLR_ET_MULTIBOOT2_MODULE  0x0008
> +#define SLR_ET_TXT_OS2MLE         0x0010
> +#define SLR_ET_UNUSED             0xffff
> +
> +/*
> + * Primary SLR Table Header
> + */
> +struct slr_table
> +{
> +    uint32_t magic;
> +    uint16_t revision;
> +    uint16_t architecture;
> +    uint32_t size;
> +    uint32_t max_size;
> +    /* entries[] */
> +} __packed;

If x86-specific, the question on the need for some of the __packed arises
again.

> +/*
> + * Common SLRT Table Header
> + */
> +struct slr_entry_hdr
> +{
> +    uint32_t tag;
> +    uint32_t size;
> +} __packed;
> +
> +/*
> + * Boot loader context
> + */
> +struct slr_bl_context
> +{
> +    uint16_t bootloader;
> +    uint16_t reserved[3];
> +    uint64_t context;
> +} __packed;
> +
> +/*
> + * Prototype of a function pointed to by slr_entry_dl_info::dl_handler.
> + */
> +typedef void (*dl_handler_func)(struct slr_bl_context *bl_context);

It being an internal header, ...

> +/*
> + * DRTM Dynamic Launch Configuration
> + */
> +struct slr_entry_dl_info
> +{
> +    struct slr_entry_hdr hdr;
> +    uint64_t dce_size;
> +    uint64_t dce_base;
> +    uint64_t dlme_size;
> +    uint64_t dlme_base;
> +    uint64_t dlme_entry;
> +    struct slr_bl_context bl_context;
> +    uint64_t dl_handler;

... why can't this type be used here then? This would presumably avoid a
typecast later.

> +static inline void *
> +slr_end_of_entries(struct slr_table *table)
> +{
> +    return (uint8_t *)table + table->size;

Considering the function's return type, why not cast to void * (or perhaps
const void *, if the return type also can be such)?

> +}
> +
> +static inline struct slr_entry_hdr *
> +slr_next_entry(struct slr_table *table, struct slr_entry_hdr *curr)
> +{
> +    struct slr_entry_hdr *next = (struct slr_entry_hdr *)
> +                                 ((uint8_t *)curr + curr->size);
> +
> +    if ( (void *)next >= slr_end_of_entries(table) )
> +        return NULL;

Is this sufficient as a check? With it fulfilled, ...

> +    if ( next->tag == SLR_ENTRY_END )

... this member access may still be out of bounds. IOW the question is what
level of checking is really adequate here.

> +        return NULL;
> +
> +    return next;
> +}
> +
> +static inline struct slr_entry_hdr *
> +slr_next_entry_by_tag (struct slr_table *table,
> +                       struct slr_entry_hdr *entry,
> +                       uint16_t tag)
> +{
> +    if ( !entry ) /* Start from the beginning */
> +        entry = (struct slr_entry_hdr *)((uint8_t *)table + sizeof(*table));

Extending from the earlier comment - if the inner cast was to void * here,
the outer one could be dropped altogether.

Jan

