Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BE12F8104
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 17:42:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68437.122551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0SAB-0003sS-E2; Fri, 15 Jan 2021 16:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68437.122551; Fri, 15 Jan 2021 16:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0SAB-0003s3-At; Fri, 15 Jan 2021 16:41:27 +0000
Received: by outflank-mailman (input) for mailman id 68437;
 Fri, 15 Jan 2021 16:41:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0SA9-0003ry-Uj
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 16:41:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53eff025-ea6d-496e-87cb-30e52ac74d90;
 Fri, 15 Jan 2021 16:41:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F138DB7BD;
 Fri, 15 Jan 2021 16:41:23 +0000 (UTC)
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
X-Inumbo-ID: 53eff025-ea6d-496e-87cb-30e52ac74d90
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610728884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k2wqZ4s6YcMd6jG1uDYHWqLgFVyYTcZxxyOp9tDmx3k=;
	b=puKKLaRMsIvw11d/iQyjoOLpiW8kbvIwmPcQmwHjj7WlW2JOC9z2k6XLkiCfiqHSxmjJMx
	Kcu3UT9kCf/UOcmQvrJ6rK5JsPt6jA0Rztmxqukg9NNq17KhR6IQpusbGuO7YZAby+sHp1
	GnLfmyAqStkjReZDNg003HQ4cQ09U5g=
Subject: Re: [PATCH V4 01/24] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-2-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b37398f6-7242-49b5-bdba-a247af1f2351@suse.com>
Date: Fri, 15 Jan 2021 17:41:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610488352-18494-2-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.01.2021 22:52, Oleksandr Tyshchenko wrote:
> @@ -1080,6 +1104,27 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
>      return rc;
>  }
>  
> +/* Called with ioreq_server lock held */
> +int arch_ioreq_server_map_mem_type(struct domain *d,
> +                                   struct hvm_ioreq_server *s,
> +                                   uint32_t flags)
> +{
> +    return p2m_set_ioreq_server(d, flags, s);
> +}
> +
> +void arch_ioreq_server_map_mem_type_completed(struct domain *d,
> +                                              struct hvm_ioreq_server *s,
> +                                              uint32_t flags)
> +{
> +    if ( flags == 0 )
> +    {
> +        const struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +
> +        if ( read_atomic(&p2m->ioreq.entry_count) )
> +            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);

If I was the maintainer of this code, I'd ask that such single
use variables, unless needed to sensibly deal with line length
restrictions, be removed.

> --- a/xen/include/asm-x86/hvm/ioreq.h
> +++ b/xen/include/asm-x86/hvm/ioreq.h
> @@ -19,6 +19,9 @@
>  #ifndef __ASM_X86_HVM_IOREQ_H__
>  #define __ASM_X86_HVM_IOREQ_H__
>  
> +#define HANDLE_BUFIOREQ(s) \
> +    ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
> +
>  bool hvm_io_pending(struct vcpu *v);
>  bool handle_hvm_io_completion(struct vcpu *v);
>  bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
> @@ -55,6 +58,25 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
>  
>  void hvm_ioreq_init(struct domain *d);
>  
> +bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion);
> +int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s);
> +void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s);
> +void arch_ioreq_server_enable(struct hvm_ioreq_server *s);
> +void arch_ioreq_server_disable(struct hvm_ioreq_server *s);
> +void arch_ioreq_server_destroy(struct hvm_ioreq_server *s);
> +int arch_ioreq_server_map_mem_type(struct domain *d,
> +                                   struct hvm_ioreq_server *s,
> +                                   uint32_t flags);
> +void arch_ioreq_server_map_mem_type_completed(struct domain *d,
> +                                              struct hvm_ioreq_server *s,
> +                                              uint32_t flags);
> +bool arch_ioreq_server_destroy_all(struct domain *d);
> +bool arch_ioreq_server_get_type_addr(const struct domain *d,
> +                                     const ioreq_t *p,
> +                                     uint8_t *type,
> +                                     uint64_t *addr);
> +void arch_ioreq_domain_init(struct domain *d);

As indicated before, I don't think these declarations should
live here. Even if a later patch moves them I wouldn't see
why they couldn't be put in their final resting place right
away.

Also where possible without violating line length restrictions
please still try to put multiple parameters on a single line,
as is done higher up in this file.

Jan

