Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D063F9A9A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 16:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173689.316880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJcUv-0008Mr-So; Fri, 27 Aug 2021 14:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173689.316880; Fri, 27 Aug 2021 14:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJcUv-0008KP-PI; Fri, 27 Aug 2021 14:06:21 +0000
Received: by outflank-mailman (input) for mailman id 173689;
 Fri, 27 Aug 2021 14:06:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DBy1=NS=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mJcUu-0008KJ-6Z
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 14:06:20 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1f9c812-073f-11ec-aad0-12813bfff9fa;
 Fri, 27 Aug 2021 14:06:17 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1630073171753102.6665651335893;
 Fri, 27 Aug 2021 07:06:11 -0700 (PDT)
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
X-Inumbo-ID: f1f9c812-073f-11ec-aad0-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1630073174; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XBMRSNZDd8BdrFbw9mxZ61TLWuALX+y19hGFAq/q6NOF1igsP4nfM6QI4EXPPjCiu49g3jaLGwO3ctvomv7nGu56myI1vGFxVqA2aXWtZ4EKDmI5LtfesHlFXdpAgUWiwSEDL5XZKWc4ZuLgRfgt55At4IfzDhbKCMfmWMxJP94=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1630073174; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=SNt/Rw8vZIn8PLP20AjU+WdsrbTgqiOtPHfpD/qjnyw=; 
	b=dOE5s/DF+c+1OzeoFkC2UvZywPv9vZzJC9COaiY/MiqcZ2Hj/2n4LfuIRFSljiSFNbHGMs8bhcFo0HMA5WgW5wYRoT8hPxlqUNGtlrqJQ8spnFBBKWnM46BzLISgSlMV8mi37V0u+Uu9DqBK7KoTYP9x3AX9/8bGtj4XD6v+xh0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1630073174;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=SNt/Rw8vZIn8PLP20AjU+WdsrbTgqiOtPHfpD/qjnyw=;
	b=HtDAFtjwsdEj820aWu2AjiiR/j6qNOmBs41Mcl72cToBDHWljVOKCfN4KTd+6LvL
	tQF5zJ6hMwOzf3CaQptJfs7g6G7KVYXIjfl+nHyZNMb3EmpMXp1JgEKphgnT+jO04wm
	55nek69F4rHnIXz1UqebO99xuNOl/rHJlP15cBa8=
To: Jan Beulich <jbeulich@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
 <20210805140644.357-6-dpsmith@apertussolutions.com>
 <2e4471d4-7d0a-757f-1291-de6e93d1d6f6@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 5/7] xsm: decouple xsm header inclusion selection
Message-ID: <ba39f827-3fea-faed-9fde-105d03d3b417@apertussolutions.com>
Date: Fri, 27 Aug 2021 10:06:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2e4471d4-7d0a-757f-1291-de6e93d1d6f6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 8/26/21 4:13 AM, Jan Beulich wrote:
> On 05.08.2021 16:06, Daniel P. Smith wrote:
>> --- /dev/null
>> +++ b/xen/include/xsm/xsm-core.h
>> @@ -0,0 +1,273 @@
>> +/*
>> + *  This file contains the XSM hook definitions for Xen.
>> + *
>> + *  This work is based on the LSM implementation in Linux 2.6.13.4.
>> + *
>> + *  Author:  George Coker, <gscoker@alpha.ncsc.mil>
>> + *
>> + *  Contributors: Michael LeMay, <mdlemay@epoch.ncsc.mil>
>> + *
>> + *  This program is free software; you can redistribute it and/or modify
>> + *  it under the terms of the GNU General Public License version 2,
>> + *  as published by the Free Software Foundation.
>> + */
>> +
>> +#ifndef __XSM_CORE_H__
>> +#define __XSM_CORE_H__
>> +
>> +#include <xen/sched.h>
>> +#include <xen/multiboot.h>
> 
> I was going to ask to invert the order (as we try to arrange #include-s
> alphabetically), but it looks like multiboot.h isn't fit for this.

So my understanding is to leave this as is.

>> +typedef void xsm_op_t;
>> +DEFINE_XEN_GUEST_HANDLE(xsm_op_t);
> 
> Just FTR - I consider this dubious. If void is meant, I don't see why
> a void handle can't be used.

Unless I am misunderstanding what you are calling for, I am afraid this
will trickle further that what intended to be addressed in this patch
set. If disagree and would like to provide me a suggest that stays
bounded, I would gladly incorporate.

>> +/* policy magic number (defined by XSM_MAGIC) */
>> +typedef uint32_t xsm_magic_t;
>> +
>> +#ifdef CONFIG_XSM_FLASK
>> +#define XSM_MAGIC 0xf97cff8c
>> +#else
>> +#define XSM_MAGIC 0x0
>> +#endif
>> +
>> +/* These annotations are used by callers and in dummy.h to document the
>> + * default actions of XSM hooks. They should be compiled out otherwise.
>> + */
> 
> I realize you only move code, but like e.g. the u32 -> uint32_t change
> in context above I'd like to encourage you to also address other style
> issues in the newly introduced file. Here I'm talking about comment
> style, requiring /* to be on its own line.

Ack.

>> +enum xsm_default {
>> +    XSM_HOOK,     /* Guests can normally access the hypercall */
>> +    XSM_DM_PRIV,  /* Device model can perform on its target domain */
>> +    XSM_TARGET,   /* Can perform on self or your target domain */
>> +    XSM_PRIV,     /* Privileged - normally restricted to dom0 */
>> +    XSM_XS_PRIV,  /* Xenstore domain - can do some privileged operations */
>> +    XSM_OTHER     /* Something more complex */
>> +};
>> +typedef enum xsm_default xsm_default_t;
>> +
>> +struct xsm_ops {
>> +    void (*security_domaininfo) (struct domain *d,
> 
> Similarly here (and below) - we don't normally put a blank between
> the closing and opening parentheses in function pointer declarations.
> The majority does so here, but ...

Ack.

>> [...]
>> +    int (*page_offline)(uint32_t cmd);
>> +    int (*hypfs_op)(void);
> 
> ... there are exceptions.
> 
>> [...]
>> +    int (*platform_op) (uint32_t cmd);
>> +
>> +#ifdef CONFIG_X86
>> +    int (*do_mca) (void);
>> +    int (*shadow_control) (struct domain *d, uint32_t op);
>> +    int (*mem_sharing_op) (struct domain *d, struct domain *cd, int op);
>> +    int (*apic) (struct domain *d, int cmd);
>> +    int (*memtype) (uint32_t access);
>> +    int (*machine_memory_map) (void);
>> +    int (*domain_memory_map) (struct domain *d);
>> +#define XSM_MMU_UPDATE_READ      1
>> +#define XSM_MMU_UPDATE_WRITE     2
>> +#define XSM_MMU_NORMAL_UPDATE    4
>> +#define XSM_MMU_MACHPHYS_UPDATE  8
>> +    int (*mmu_update) (struct domain *d, struct domain *t,
>> +                       struct domain *f, uint32_t flags);
>> +    int (*mmuext_op) (struct domain *d, struct domain *f);
>> +    int (*update_va_mapping) (struct domain *d, struct domain *f,
>> +                              l1_pgentry_t pte);
>> +    int (*priv_mapping) (struct domain *d, struct domain *t);
>> +    int (*ioport_permission) (struct domain *d, uint32_t s, uint32_t e,
>> +                              uint8_t allow);
>> +    int (*ioport_mapping) (struct domain *d, uint32_t s, uint32_t e,
>> +                           uint8_t allow);
>> +    int (*pmu_op) (struct domain *d, unsigned int op);
>> +#endif
>> +    int (*dm_op) (struct domain *d);
> 
> To match grouping elsewhere, a blank line above here, ...

Ack.

>> +    int (*xen_version) (uint32_t cmd);
>> +    int (*domain_resource_map) (struct domain *d);
>> +#ifdef CONFIG_ARGO
> 
> ... and here would be nice.

Ack.

>> +    int (*argo_enable) (const struct domain *d);
>> +    int (*argo_register_single_source) (const struct domain *d,
>> +                                        const struct domain *t);
>> +    int (*argo_register_any_source) (const struct domain *d);
>> +    int (*argo_send) (const struct domain *d, const struct domain *t);
>> +#endif
>> +};
>> +
>> +extern void xsm_fixup_ops(struct xsm_ops *ops);
>> +
>> +#ifdef CONFIG_XSM
>> +
>> +#ifdef CONFIG_MULTIBOOT
>> +extern int xsm_multiboot_init(unsigned long *module_map,
>> +                              const multiboot_info_t *mbi);
>> +extern int xsm_multiboot_policy_init(unsigned long *module_map,
>> +                                     const multiboot_info_t *mbi,
>> +                                     void **policy_buffer,
>> +                                     size_t *policy_size);
>> +#endif
>> +
>> +#ifdef CONFIG_HAS_DEVICE_TREE
>> +/*
>> + * Initialize XSM
>> + *
>> + * On success, return 1 if using SILO mode else 0.
>> + */
>> +extern int xsm_dt_init(void);
>> +extern int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
>> +extern bool has_xsm_magic(paddr_t);
>> +#endif
>> +
>> +#ifdef CONFIG_XSM_FLASK
>> +extern const struct xsm_ops *flask_init(const void *policy_buffer,
>> +                                        size_t policy_size);
>> +#else
>> +static inline const struct xsm_ops *flask_init(const void *policy_buffer,
>> +                                               size_t policy_size)
>> +{
>> +    return NULL;
>> +}
>> +#endif
>> +
>> +#ifdef CONFIG_XSM_FLASK_POLICY
>> +extern const unsigned char xsm_flask_init_policy[];
>> +extern const unsigned int xsm_flask_init_policy_size;
>> +#endif
> 
> To be honest, I don't think this belongs in any header. This interfaces
> with a generated assembly file. In such a case I would always suggest
> to limit visibility of the symbols as much as possible, i.e. put the
> declarations in the sole file referencing them.

Confirmed only used in xsm_core.c, so will move there.

>> +#ifdef CONFIG_XSM_SILO
>> +extern const struct xsm_ops *silo_init(void);
>> +#else
>> +static const inline struct xsm_ops *silo_init(void)
>> +{
>> +    return NULL;
>> +}
>> +#endif
>> +
>> +#else /* CONFIG_XSM */
>> +
>> +#ifdef CONFIG_MULTIBOOT
>> +static inline int xsm_multiboot_init (unsigned long *module_map,
> 
> Nit: Stray blank ahead of the opening parenthesis.

Ack.

> Looking back there's also the question of "extern" on function
> declarations. In new code I don't think we put the redundant
> storage class specifier there; they're only needed on data
> declarations. I'm inclined to suggest to drop all of them while
> moving the code.
> 
> Preferably with these adjustments
> Acked-by: Jan Beulich <jbeulich@suse.com>

I believe I have pretty much incorporated all your adjustments. Will
include your Acked-by unless you feel I have not.

v/r,
dps

