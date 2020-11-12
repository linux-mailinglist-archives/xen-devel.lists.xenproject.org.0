Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E142B0338
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 11:59:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25670.53586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdAJZ-0006oA-NT; Thu, 12 Nov 2020 10:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25670.53586; Thu, 12 Nov 2020 10:58:53 +0000
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
	id 1kdAJZ-0006nl-KI; Thu, 12 Nov 2020 10:58:53 +0000
Received: by outflank-mailman (input) for mailman id 25670;
 Thu, 12 Nov 2020 10:58:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdAJY-0006ng-LF
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 10:58:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1b17b4a-365b-49f7-9673-1faeafe396c6;
 Thu, 12 Nov 2020 10:58:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B281AABCC;
 Thu, 12 Nov 2020 10:58:50 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdAJY-0006ng-LF
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 10:58:52 +0000
X-Inumbo-ID: e1b17b4a-365b-49f7-9673-1faeafe396c6
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e1b17b4a-365b-49f7-9673-1faeafe396c6;
	Thu, 12 Nov 2020 10:58:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605178730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DlfkP7rECkN0bJWq4bNw6g0KKy/ouqpGPSstB0Hv+CA=;
	b=p0MgpB6j0DbGDwri+i7bDjJUGmt4326j1OBO3zH109x4TEjbDNjWxQUe7vdqRF/LjAmqLe
	RTeRZ/0qGuv+shp4rb5I7s0yN8dwRW/TgPzQSPLu1MIsV7Hap2sTcX8UsRg9xPVMhTqs33
	0xTmi+o0ATCKn0veNKtM7DYK5iYKRrI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B281AABCC;
	Thu, 12 Nov 2020 10:58:50 +0000 (UTC)
Subject: Re: [PATCH V2 01/23] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-2-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <61ea02e0-bdd4-5a0a-dd6f-b22e806e6d1e@suse.com>
Date: Thu, 12 Nov 2020 11:58:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <1602780274-29141-2-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> As a lot of x86 code can be re-used on Arm later on, this
> patch makes some preparation to x86/hvm/ioreq.c before moving
> to the common code. This way we will get a verbatim copy for
> a code movement in subsequent patch (arch/x86/hvm/ioreq.c
> will be *just* renamed to common/ioreq).
> 
> This patch does the following:
> 1. Introduce *inline* arch_hvm_ioreq_init(), arch_hvm_ioreq_destroy(),
>    arch_hvm_io_completion(), arch_hvm_destroy_ioreq_server() and
>    hvm_ioreq_server_get_type_addr() to abstract arch specific materials.
> 2  Make hvm_map_mem_type_to_ioreq_server() *inline*. It is not going
>    to be called from the common code.

As already indicated on another sub-thread, I think some of these
are too large to be inline functions. Additionally, considering
their single-use purpose, I don't think they should be placed in
a header consumed by more than the producer and the sole consumer.

> 3. Make get_ioreq_server() global. It is going to be called from
>    a few places.

And with this its name ought to change, to fit the general naming
model of global functions of this subsystem.

> 4. Add IOREQ_STATUS_* #define-s and update candidates for moving.

This, it seems to me, could be a separate patch.

> @@ -855,7 +841,7 @@ int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
>  
>      domain_pause(d);
>  
> -    p2m_set_ioreq_server(d, 0, s);
> +    arch_hvm_destroy_ioreq_server(s);

Iirc there are plans to rename hvm_destroy_ioreq_server() in the
course of the generalization. If so, this arch hook would imo
better be named following the new scheme right away.

> @@ -1215,7 +1153,7 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
>      struct hvm_ioreq_server *s;
>      unsigned int id;
>  
> -    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
> +    if ( !arch_hvm_ioreq_destroy(d) )

There's no ioreq being destroyed here, so I think this wants
renaming (and again ideally right away following the planned
new scheme).

> +static inline int hvm_map_mem_type_to_ioreq_server(struct domain *d,
> +                                                   ioservid_t id,
> +                                                   uint32_t type,
> +                                                   uint32_t flags)
> +{
> +    struct hvm_ioreq_server *s;
> +    int rc;
> +
> +    if ( type != HVMMEM_ioreq_server )
> +        return -EINVAL;
> +
> +    if ( flags & ~XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
> +        return -EINVAL;
> +
> +    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
> +
> +    s = get_ioreq_server(d, id);
> +
> +    rc = -ENOENT;
> +    if ( !s )
> +        goto out;
> +
> +    rc = -EPERM;
> +    if ( s->emulator != current->domain )
> +        goto out;
> +
> +    rc = p2m_set_ioreq_server(d, flags, s);
> +
> + out:
> +    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
> +
> +    if ( rc == 0 && flags == 0 )
> +    {
> +        struct p2m_domain *p2m = p2m_get_hostp2m(d);

I realize I may be asking too much, but would it be possible if,
while moving code, you made simple and likely uncontroversial
adjustments like adding const here? (Such adjustments would be
less desirable to make if they increased the size of the patch,
e.g. if you were touching only nearby code.)

> +        if ( read_atomic(&p2m->ioreq.entry_count) )
> +            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
> +    }
> +
> +    return rc;
> +}
> +
> +static inline int hvm_ioreq_server_get_type_addr(const struct domain *d,
> +                                                 const ioreq_t *p,
> +                                                 uint8_t *type,
> +                                                 uint64_t *addr)
> +{
> +    uint32_t cf8 = d->arch.hvm.pci_cf8;

Similarly, for example, neither this nor ...

> +    if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
> +        return -EINVAL;
> +
> +    if ( p->type == IOREQ_TYPE_PIO &&
> +         (p->addr & ~3) == 0xcfc &&
> +         CF8_ENABLED(cf8) )
> +    {
> +        uint32_t x86_fam;

... this really need to use a fixed width type - unsigned int is
going to be quite fine. But since you're only moving this code,
I guess I'm not going to insist.

> +static inline bool arch_hvm_ioreq_destroy(struct domain *d)
> +{
> +    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
> +        return false;
> +
> +    return true;

Any reason this cannot simply be

    return relocate_portio_handler(d, 0xcf8, 0xcf8, 4);

?

Jan

