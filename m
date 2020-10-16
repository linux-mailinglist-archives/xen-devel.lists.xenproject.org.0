Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EECDB28FE55
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 08:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7774.20483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTJFW-0004vw-Ve; Fri, 16 Oct 2020 06:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7774.20483; Fri, 16 Oct 2020 06:29:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTJFW-0004vX-SH; Fri, 16 Oct 2020 06:29:58 +0000
Received: by outflank-mailman (input) for mailman id 7774;
 Fri, 16 Oct 2020 06:29:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kTJFV-0004vS-D3
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 06:29:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b1f3fe9-4c4c-41d7-9b25-59aeaf36b3be;
 Fri, 16 Oct 2020 06:29:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 68133AAB2;
 Fri, 16 Oct 2020 06:29:55 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kTJFV-0004vS-D3
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 06:29:57 +0000
X-Inumbo-ID: 3b1f3fe9-4c4c-41d7-9b25-59aeaf36b3be
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3b1f3fe9-4c4c-41d7-9b25-59aeaf36b3be;
	Fri, 16 Oct 2020 06:29:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602829795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=48TEeKQ3r3RulpCqqFBSkHHiIbkv+XpY/YgA5NU9RG0=;
	b=Q4YGHZ/D48KPyz9EU5JN/ir/Q13NIEjuvsSu/966kOCqbSWtjwZnc2swDI+CVoaH4yagcO
	IajvzYzRww6oMXAVUQgtnfAixUYGJ7CYpawMf6umrKuK9inRMsKhgvlrQFTyKxRn7h9Hav
	qZRY+lMwNhs6zJQM1IN9ZubbkZqIToA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 68133AAB2;
	Fri, 16 Oct 2020 06:29:55 +0000 (UTC)
Subject: Re: [PATCH V2 21/23] xen/arm: Add mapcache invalidation handling
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-22-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cad29fdb-089a-541b-6c5b-538d96441714@suse.com>
Date: Fri, 16 Oct 2020 08:29:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <1602780274-29141-22-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
> @@ -1067,7 +1068,14 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
>       */
>      if ( p2m_is_valid(orig_pte) &&
>           !mfn_eq(lpae_get_mfn(*entry), lpae_get_mfn(orig_pte)) )
> +    {
> +#ifdef CONFIG_IOREQ_SERVER
> +        if ( domain_has_ioreq_server(p2m->domain) &&
> +             (p2m->domain == current->domain) && p2m_is_ram(orig_pte.p2m.type) )
> +            p2m->domain->qemu_mapcache_invalidate = true;
> +#endif
>          p2m_free_entry(p2m, orig_pte, level);
> +    }

For all I have to say here, please bear in mind that I don't know
the internals of Arm memory management.

The first odd thing here the merely MFN-based condition. It may
well be that's sufficient, if there's no way to get a "not present"
entry with an MFN matching any valid MFN. (This isn't just with
your addition, but even before.)

Given how p2m_free_entry() works (or is supposed to work in the
long run), is the new code you add guaranteed to only alter leaf
entries? If not, the freeing of page tables needs deferring until
after qemu has dropped its mappings.

And with there being refcounting only for foreign pages, how do
you prevent the freeing of the page just unmapped before qemu has
dropped its possible mapping? On the x86 side this problem is one
of the reasons why PVH Dom0 isn't "supported", yet. At least a
respective code comment would seem advisable, so the issue to be
addressed won't be forgotten.

> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1442,6 +1442,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
>                                const union hsr hsr)
>  {
>      arm_hypercall_fn_t call = NULL;
> +    struct vcpu *v = current;

This ought to be named "curr".

Jan

