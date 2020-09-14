Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D16E1268C93
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 15:53:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHouZ-0000j1-JA; Mon, 14 Sep 2020 13:52:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHouY-0000iw-J8
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 13:52:50 +0000
X-Inumbo-ID: c81031f9-ecec-4131-ac0f-6c7786b2e593
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c81031f9-ecec-4131-ac0f-6c7786b2e593;
 Mon, 14 Sep 2020 13:52:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E1572B19C;
 Mon, 14 Sep 2020 13:53:03 +0000 (UTC)
Subject: Re: [PATCH V1 01/16] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-2-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <98420567-40a9-7297-d243-4af90f692bf9@suse.com>
Date: Mon, 14 Sep 2020 15:52:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599769330-17656-2-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.09.2020 22:21, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> As a lot of x86 code can be re-used on Arm later on, this patch
> prepares IOREQ support before moving to the common code. This way
> we will get almost a verbatim copy for a code movement.
> 
> This support is going to be used on Arm to be able run device
> emulator outside of Xen hypervisor.

This is all fine, but you should then go on and explain what you're
doing, and why (at which point it may become obvious that it would
be more helpful to split this into a couple of steps). In particular
something as suspicious as ...

> Changes RFC -> V1:
>    - new patch, was split from:
>      "[RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common"
>    - fold the check of p->type into hvm_get_ioreq_server_range_type()
>      and make it return success/failure
>    - remove relocate_portio_handler() call from arch_hvm_ioreq_destroy()
>      in arch/x86/hvm/ioreq.c

... this (see below).

> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -170,6 +170,29 @@ static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
>      return true;
>  }
>  
> +bool arch_handle_hvm_io_completion(enum hvm_io_completion io_completion)

Do we need "handle" in here? Without it, I'd also not have to ask about
moving hvm further to the front of the name...

> @@ -836,6 +848,12 @@ int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
>      return rc;
>  }
>  
> +/* Called when target domain is paused */
> +int arch_hvm_destroy_ioreq_server(struct hvm_ioreq_server *s)
> +{
> +    return p2m_set_ioreq_server(s->target, 0, s);
> +}

Why return "int" when ...

> @@ -855,7 +873,7 @@ int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
>  
>      domain_pause(d);
>  
> -    p2m_set_ioreq_server(d, 0, s);
> +    arch_hvm_destroy_ioreq_server(s);

... the result has been ignored anyway? Or otherwise I guess you'd
want to add error handling here (but then the result of
p2m_set_ioreq_server() should still get ignored, for backwards
compatibility).

> @@ -1215,8 +1233,7 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
>      struct hvm_ioreq_server *s;
>      unsigned int id;
>  
> -    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
> -        return;
> +    arch_hvm_ioreq_destroy(d);

So the call to relocate_portio_handler() simply goes away. No
replacement, no explanation?

> @@ -1239,19 +1256,15 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
>      spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>  }
>  
> -struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
> -                                                 ioreq_t *p)
> +int hvm_get_ioreq_server_range_type(struct domain *d,
> +                                    ioreq_t *p,

At least p, but perhaps also d can gain const?

> +                                    uint8_t *type,
> +                                    uint64_t *addr)

By the name the function returns a type for a range (albeit without
it being clear where the two bounds of such a range actually live).
By the implementation is looks more like you mean "range_and_type",
albeit still without there really being a range passed back to the
caller. Therefore I think I need some clarification on what's
intended before even being able to suggest something. From ...

> +struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
> +                                                 ioreq_t *p)
> +{
> +    struct hvm_ioreq_server *s;
> +    uint8_t type;
> +    uint64_t addr;
> +    unsigned int id;
> +
> +    if ( hvm_get_ioreq_server_range_type(d, p, &type, &addr) )
> +        return NULL;

... this use - maybe hvm_ioreq_server_get_type_addr() (albeit I
don't like this name very much)?

> @@ -1351,7 +1378,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
>      pg = iorp->va;
>  
>      if ( !pg )
> -        return X86EMUL_UNHANDLEABLE;
> +        return IOREQ_IO_UNHANDLED;

At this example - why the IO infix, duplicating the prefix? I'd
suggest to either drop it (if the remaining identifiers are deemed
unambiguous enough) or use e.g. IOREQ_STATUS_*.

> @@ -1515,11 +1542,21 @@ static int hvm_access_cf8(
>      return X86EMUL_UNHANDLEABLE;
>  }
>  
> +void arch_hvm_ioreq_init(struct domain *d)
> +{
> +    register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
> +}
> +
> +void arch_hvm_ioreq_destroy(struct domain *d)
> +{
> +
> +}

Stray blank line?

Jan

