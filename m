Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E372F9B27
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 09:23:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69424.124209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1PoT-0006Zi-5u; Mon, 18 Jan 2021 08:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69424.124209; Mon, 18 Jan 2021 08:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1PoT-0006ZP-2f; Mon, 18 Jan 2021 08:23:01 +0000
Received: by outflank-mailman (input) for mailman id 69424;
 Mon, 18 Jan 2021 08:22:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1WU=GV=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l1PoR-0006ZK-Px
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 08:22:59 +0000
Received: from mail-wm1-x334.google.com (unknown [2a00:1450:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c59f7a5-9742-42dd-8ca2-7715e0b7ff53;
 Mon, 18 Jan 2021 08:22:57 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id v184so8751964wma.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 00:22:57 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id o124sm25682212wmb.5.2021.01.18.00.22.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 00:22:56 -0800 (PST)
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
X-Inumbo-ID: 0c59f7a5-9742-42dd-8ca2-7715e0b7ff53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=0DMLcDNYWk5YcR9lWqzkjmdZXRc8HGjM27EvjQeI2w4=;
        b=J/P9PyqenO3TESX1dZB0/cutu8wUlYMR5+VKCtb5LmKvbqAK/BGQXNy/pUh4N+cb2F
         LvOdZntMskahW7WVmPB1HWxlMvp2NYYlidwSEWqxa7xb0KiS6q7zbToy12nGEWGr3PLu
         8ajfVhZqpD6wkhTFuFyOzbbykxxRxwe6wUbZ8WOcroicFsXBVrJNZFAbPWZUaeV1b4fc
         CN3Yh5x+SsSjfHO3DxmEu4HPrXET0rVetLfjmnun+JmUCE8auw1zKEGSOi0XEfZQ7itS
         PDfwAVERYePGx95Asbi4ux+VoL/sm7oMqrknr1uObMa2oxQwXSW7yvhhrlflfWCEfm0p
         /Bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=0DMLcDNYWk5YcR9lWqzkjmdZXRc8HGjM27EvjQeI2w4=;
        b=iyE9jk2Hxwmy0TyhfBnGMSOsiF8DtnnAXajaOAovofoXIsgBDWW/Wc+WrHBgVKyZod
         xUZh7yI/prPzF1WKJDp+XAlcy7Z/TgSZf31TBNWJJdoTpvHJQNTLOYnCAOMevw9wHhwn
         Lxb7r8UG02JFDmS+PTGO3CACcCsr2fAuFUa3Rw+SuR+LKhlBbyQ/bSsEhhMhOVJqi4eA
         zGYdunN5NNPAQ974qb8Xaq5mfDz6E5J0syJInaqzmhqt/LrYOsWv11gi9dDMWbtqCS8r
         vWsLZELS3eBVnkFjBCUT7g68GlRznz7S9JtUaMmH8kIXOZNCHRk6CR83e85o45rdMhq9
         XrXQ==
X-Gm-Message-State: AOAM532+RvpUSSJ+WXMv2KW6/S8v6jqakEsYDnI2QI+Y6JlKhkTIR/vC
	7grdmIvDOP7RExoDgRb32wE=
X-Google-Smtp-Source: ABdhPJzmeEF2rP2JnmgYq/Ou8X8rpSQcPg1QFkCEfMM8pNtco54r2NOC9yDagap748waMbfGz2wBKg==
X-Received: by 2002:a05:600c:4148:: with SMTP id h8mr4740299wmm.137.1610958176956;
        Mon, 18 Jan 2021 00:22:56 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-2-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1610488352-18494-2-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V4 01/24] x86/ioreq: Prepare IOREQ feature for making it common
Date: Mon, 18 Jan 2021 08:22:55 -0000
Message-ID: <00b901d6ed73$1f91a930$5eb4fb90$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJtR7ihpnpDvKGK8VeC26+r2ffFKQH7t7oPqPB43uA=
Content-Language: en-gb

> -----Original Message-----
> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
> Sent: 12 January 2021 21:52
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant =
<paul@xen.org>; Jan Beulich
> <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger =
Pau Monn=C3=A9
> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; Julien Grall =
<julien@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>; Julien Grall <julien.grall@arm.com>
> Subject: [PATCH V4 01/24] x86/ioreq: Prepare IOREQ feature for making =
it common
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> As a lot of x86 code can be re-used on Arm later on, this
> patch makes some preparation to x86/hvm/ioreq.c before moving
> to the common code. This way we will get a verbatim copy
> for a code movement in subsequent patch.
>=20
> This patch mostly introduces specific hooks to abstract arch
> specific materials taking into the account the requirment to leave
> the "legacy" mechanism of mapping magic pages for the IOREQ servers
> x86 specific and not expose it to the common code.
>=20
> These hooks are named according to the more consistent new naming
> scheme right away (including dropping the "hvm" prefixes and infixes):
> - IOREQ server functions should start with "ioreq_server_"
> - IOREQ functions should start with "ioreq_"
> other functions will be renamed in subsequent patches.
>=20
> Also re-order #include-s alphabetically.
>=20
> This support is going to be used on Arm to be able run device
> emulator outside of Xen hypervisor.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>
>=20
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
>=20
> Changes RFC -> V1:
>    - new patch, was split from:
>      "[RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common"
>    - fold the check of p->type into hvm_get_ioreq_server_range_type()
>      and make it return success/failure
>    - remove relocate_portio_handler() call from =
arch_hvm_ioreq_destroy()
>      in arch/x86/hvm/ioreq.c
>    - introduce =
arch_hvm_destroy_ioreq_server()/arch_handle_hvm_io_completion()
>=20
> Changes V1 -> V2:
>    - update patch description
>    - make arch functions inline and put them into arch header
>      to achieve a truly rename by the subsequent patch
>    - return void in arch_hvm_destroy_ioreq_server()
>    - return bool in arch_hvm_ioreq_destroy()
>    - bring relocate_portio_handler() back to arch_hvm_ioreq_destroy()
>    - rename IOREQ_IO* to IOREQ_STATUS*
>    - remove *handle* from arch_handle_hvm_io_completion()
>    - re-order #include-s alphabetically
>    - rename hvm_get_ioreq_server_range_type() to =
hvm_ioreq_server_get_type_addr()
>      and add "const" to several arguments
>=20
> Changes V2 -> V3:
>    - update patch description
>    - name new arch hooks according to the new naming scheme
>    - don't make arch hooks inline, move them ioreq.c
>    - make get_ioreq_server() local again
>    - rework the whole patch taking into the account that "legacy" =
interface
>      should remain x86 specific (additional arch hooks, etc)
>    - update the code to be able to use =
hvm_map_mem_type_to_ioreq_server()
>      in the common code (an extra arch hook, etc)
>    - don=E2=80=99t include <asm/hvm/emulate.h> from arch header
>    - add "arch" prefix to hvm_ioreq_server_get_type_addr()
>    - move IOREQ_STATUS_* #define-s introduction to the separate patch
>    - move HANDLE_BUFIOREQ to the arch header
>    - just return relocate_portio_handler() from =
arch_ioreq_server_destroy_all()
>    - misc adjustments proposed by Jan (adding const, unsigned int =
instead of uint32_t)
>=20
> Changes V3 -> V4:
>    - add Alex's R-b
>    - update patch description
>    - make arch_ioreq_server_get_type_addr return bool
>    - drop #include <xen/ctype.h>
>    - use two arch hooks in hvm_map_mem_type_to_ioreq_server()
>      to avoid calling p2m_change_entry_type_global() with lock held
> ---
>  xen/arch/x86/hvm/ioreq.c        | 179 =
++++++++++++++++++++++++++--------------
>  xen/include/asm-x86/hvm/ioreq.h |  22 +++++
>  2 files changed, 141 insertions(+), 60 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
> index 1cc27df..468fe84 100644
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -16,16 +16,15 @@
>   * this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>=20
> -#include <xen/ctype.h>
> +#include <xen/domain.h>
> +#include <xen/event.h>
>  #include <xen/init.h>
> +#include <xen/irq.h>
>  #include <xen/lib.h>
> -#include <xen/trace.h>
> +#include <xen/paging.h>
>  #include <xen/sched.h>
> -#include <xen/irq.h>
>  #include <xen/softirq.h>
> -#include <xen/domain.h>
> -#include <xen/event.h>
> -#include <xen/paging.h>
> +#include <xen/trace.h>
>  #include <xen/vpci.h>
>=20
>  #include <asm/hvm/emulate.h>
> @@ -170,6 +169,29 @@ static bool hvm_wait_for_io(struct hvm_ioreq_vcpu =
*sv, ioreq_t *p)
>      return true;
>  }
>=20
> +bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion)
> +{
> +    switch ( io_completion )
> +    {
> +    case HVMIO_realmode_completion:
> +    {
> +        struct hvm_emulate_ctxt ctxt;
> +
> +        hvm_emulate_init_once(&ctxt, NULL, guest_cpu_user_regs());
> +        vmx_realmode_emulate_one(&ctxt);
> +        hvm_emulate_writeback(&ctxt);
> +
> +        break;
> +    }
> +
> +    default:
> +        ASSERT_UNREACHABLE();
> +        break;
> +    }
> +
> +    return true;
> +}
> +
>  bool handle_hvm_io_completion(struct vcpu *v)
>  {
>      struct domain *d =3D v->domain;
> @@ -209,19 +231,8 @@ bool handle_hvm_io_completion(struct vcpu *v)
>          return handle_pio(vio->io_req.addr, vio->io_req.size,
>                            vio->io_req.dir);
>=20
> -    case HVMIO_realmode_completion:
> -    {
> -        struct hvm_emulate_ctxt ctxt;
> -
> -        hvm_emulate_init_once(&ctxt, NULL, guest_cpu_user_regs());
> -        vmx_realmode_emulate_one(&ctxt);
> -        hvm_emulate_writeback(&ctxt);
> -
> -        break;
> -    }
>      default:
> -        ASSERT_UNREACHABLE();
> -        break;
> +        return arch_vcpu_ioreq_completion(io_completion);
>      }
>=20
>      return true;
> @@ -477,9 +488,6 @@ static void hvm_update_ioreq_evtchn(struct =
hvm_ioreq_server *s,
>      }
>  }
>=20
> -#define HANDLE_BUFIOREQ(s) \
> -    ((s)->bufioreq_handling !=3D HVM_IOREQSRV_BUFIOREQ_OFF)
> -
>  static int hvm_ioreq_server_add_vcpu(struct hvm_ioreq_server *s,
>                                       struct vcpu *v)
>  {
> @@ -586,7 +594,7 @@ static void =
hvm_ioreq_server_remove_all_vcpus(struct hvm_ioreq_server *s)
>      spin_unlock(&s->lock);
>  }
>=20
> -static int hvm_ioreq_server_map_pages(struct hvm_ioreq_server *s)
> +int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s)
>  {
>      int rc;
>=20
> @@ -601,7 +609,7 @@ static int hvm_ioreq_server_map_pages(struct =
hvm_ioreq_server *s)
>      return rc;
>  }
>=20
> -static void hvm_ioreq_server_unmap_pages(struct hvm_ioreq_server *s)
> +void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s)
>  {
>      hvm_unmap_ioreq_gfn(s, true);
>      hvm_unmap_ioreq_gfn(s, false);
> @@ -674,6 +682,12 @@ static int =
hvm_ioreq_server_alloc_rangesets(struct hvm_ioreq_server *s,
>      return rc;
>  }
>=20
> +void arch_ioreq_server_enable(struct hvm_ioreq_server *s)
> +{
> +    hvm_remove_ioreq_gfn(s, false);
> +    hvm_remove_ioreq_gfn(s, true);
> +}
> +
>  static void hvm_ioreq_server_enable(struct hvm_ioreq_server *s)
>  {
>      struct hvm_ioreq_vcpu *sv;
> @@ -683,8 +697,7 @@ static void hvm_ioreq_server_enable(struct =
hvm_ioreq_server *s)
>      if ( s->enabled )
>          goto done;
>=20
> -    hvm_remove_ioreq_gfn(s, false);
> -    hvm_remove_ioreq_gfn(s, true);
> +    arch_ioreq_server_enable(s);
>=20
>      s->enabled =3D true;
>=20
> @@ -697,6 +710,12 @@ static void hvm_ioreq_server_enable(struct =
hvm_ioreq_server *s)
>      spin_unlock(&s->lock);
>  }
>=20
> +void arch_ioreq_server_disable(struct hvm_ioreq_server *s)
> +{
> +    hvm_add_ioreq_gfn(s, true);
> +    hvm_add_ioreq_gfn(s, false);
> +}
> +
>  static void hvm_ioreq_server_disable(struct hvm_ioreq_server *s)
>  {
>      spin_lock(&s->lock);
> @@ -704,8 +723,7 @@ static void hvm_ioreq_server_disable(struct =
hvm_ioreq_server *s)
>      if ( !s->enabled )
>          goto done;
>=20
> -    hvm_add_ioreq_gfn(s, true);
> -    hvm_add_ioreq_gfn(s, false);
> +    arch_ioreq_server_disable(s);
>=20
>      s->enabled =3D false;
>=20
> @@ -750,7 +768,7 @@ static int hvm_ioreq_server_init(struct =
hvm_ioreq_server *s,
>=20
>   fail_add:
>      hvm_ioreq_server_remove_all_vcpus(s);
> -    hvm_ioreq_server_unmap_pages(s);
> +    arch_ioreq_server_unmap_pages(s);
>=20
>      hvm_ioreq_server_free_rangesets(s);
>=20
> @@ -764,7 +782,7 @@ static void hvm_ioreq_server_deinit(struct =
hvm_ioreq_server *s)
>      hvm_ioreq_server_remove_all_vcpus(s);
>=20
>      /*
> -     * NOTE: It is safe to call both hvm_ioreq_server_unmap_pages() =
and
> +     * NOTE: It is safe to call both arch_ioreq_server_unmap_pages() =
and
>       *       hvm_ioreq_server_free_pages() in that order.
>       *       This is because the former will do nothing if the pages
>       *       are not mapped, leaving the page to be freed by the =
latter.
> @@ -772,7 +790,7 @@ static void hvm_ioreq_server_deinit(struct =
hvm_ioreq_server *s)
>       *       the page_info pointer to NULL, meaning the latter will =
do
>       *       nothing.
>       */
> -    hvm_ioreq_server_unmap_pages(s);
> +    arch_ioreq_server_unmap_pages(s);
>      hvm_ioreq_server_free_pages(s);
>=20
>      hvm_ioreq_server_free_rangesets(s);
> @@ -836,6 +854,12 @@ int hvm_create_ioreq_server(struct domain *d, int =
bufioreq_handling,
>      return rc;
>  }
>=20
> +/* Called when target domain is paused */
> +void arch_ioreq_server_destroy(struct hvm_ioreq_server *s)
> +{
> +    p2m_set_ioreq_server(s->target, 0, s);
> +}
> +
>  int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
>  {
>      struct hvm_ioreq_server *s;
> @@ -855,7 +879,7 @@ int hvm_destroy_ioreq_server(struct domain *d, =
ioservid_t id)
>=20
>      domain_pause(d);
>=20
> -    p2m_set_ioreq_server(d, 0, s);
> +    arch_ioreq_server_destroy(s);
>=20
>      hvm_ioreq_server_disable(s);
>=20
> @@ -900,7 +924,7 @@ int hvm_get_ioreq_server_info(struct domain *d, =
ioservid_t id,
>=20
>      if ( ioreq_gfn || bufioreq_gfn )
>      {
> -        rc =3D hvm_ioreq_server_map_pages(s);
> +        rc =3D arch_ioreq_server_map_pages(s);
>          if ( rc )
>              goto out;
>      }
> @@ -1080,6 +1104,27 @@ int hvm_unmap_io_range_from_ioreq_server(struct =
domain *d, ioservid_t id,
>      return rc;
>  }
>=20
> +/* Called with ioreq_server lock held */
> +int arch_ioreq_server_map_mem_type(struct domain *d,
> +                                   struct hvm_ioreq_server *s,
> +                                   uint32_t flags)
> +{
> +    return p2m_set_ioreq_server(d, flags, s);
> +}
> +
> +void arch_ioreq_server_map_mem_type_completed(struct domain *d,
> +                                              struct hvm_ioreq_server =
*s,
> +                                              uint32_t flags)
> +{
> +    if ( flags =3D=3D 0 )
> +    {
> +        const struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
> +
> +        if ( read_atomic(&p2m->ioreq.entry_count) )
> +            p2m_change_entry_type_global(d, p2m_ioreq_server, =
p2m_ram_rw);
> +    }
> +}
> +
>  /*
>   * Map or unmap an ioreq server to specific memory type. For now, =
only
>   * HVMMEM_ioreq_server is supported, and in the future new types can =
be
> @@ -1112,18 +1157,13 @@ int hvm_map_mem_type_to_ioreq_server(struct =
domain *d, ioservid_t id,
>      if ( s->emulator !=3D current->domain )
>          goto out;
>=20
> -    rc =3D p2m_set_ioreq_server(d, flags, s);
> +    rc =3D arch_ioreq_server_map_mem_type(d, s, flags);
>=20
>   out:
>      spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>=20
> -    if ( rc =3D=3D 0 && flags =3D=3D 0 )
> -    {
> -        struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
> -
> -        if ( read_atomic(&p2m->ioreq.entry_count) )
> -            p2m_change_entry_type_global(d, p2m_ioreq_server, =
p2m_ram_rw);
> -    }
> +    if ( rc =3D=3D 0 )
> +        arch_ioreq_server_map_mem_type_completed(d, s, flags);
>=20
>      return rc;
>  }
> @@ -1210,12 +1250,17 @@ void hvm_all_ioreq_servers_remove_vcpu(struct =
domain *d, struct vcpu *v)
>      spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>  }
>=20
> +bool arch_ioreq_server_destroy_all(struct domain *d)
> +{
> +    return relocate_portio_handler(d, 0xcf8, 0xcf8, 4);
> +}
> +
>  void hvm_destroy_all_ioreq_servers(struct domain *d)
>  {
>      struct hvm_ioreq_server *s;
>      unsigned int id;
>=20
> -    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
> +    if ( !arch_ioreq_server_destroy_all(d) )
>          return;
>=20
>      spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
> @@ -1239,33 +1284,28 @@ void hvm_destroy_all_ioreq_servers(struct =
domain *d)
>      spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>  }
>=20
> -struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
> -                                                 ioreq_t *p)
> +bool arch_ioreq_server_get_type_addr(const struct domain *d,
> +                                     const ioreq_t *p,
> +                                     uint8_t *type,
> +                                     uint64_t *addr)
>  {
> -    struct hvm_ioreq_server *s;
> -    uint32_t cf8;
> -    uint8_t type;
> -    uint64_t addr;
> -    unsigned int id;
> +    unsigned int cf8 =3D d->arch.hvm.pci_cf8;
>=20
>      if ( p->type !=3D IOREQ_TYPE_COPY && p->type !=3D IOREQ_TYPE_PIO =
)
> -        return NULL;
> -
> -    cf8 =3D d->arch.hvm.pci_cf8;
> +        return false;
>=20
>      if ( p->type =3D=3D IOREQ_TYPE_PIO &&
>           (p->addr & ~3) =3D=3D 0xcfc &&
>           CF8_ENABLED(cf8) )
>      {
> -        uint32_t x86_fam;
> +        unsigned int x86_fam, reg;
>          pci_sbdf_t sbdf;
> -        unsigned int reg;
>=20
>          reg =3D hvm_pci_decode_addr(cf8, p->addr, &sbdf);
>=20
>          /* PCI config data cycle */
> -        type =3D XEN_DMOP_IO_RANGE_PCI;
> -        addr =3D ((uint64_t)sbdf.sbdf << 32) | reg;
> +        *type =3D XEN_DMOP_IO_RANGE_PCI;
> +        *addr =3D ((uint64_t)sbdf.sbdf << 32) | reg;
>          /* AMD extended configuration space access? */
>          if ( CF8_ADDR_HI(cf8) &&
>               d->arch.cpuid->x86_vendor =3D=3D X86_VENDOR_AMD &&
> @@ -1277,16 +1317,30 @@ struct hvm_ioreq_server =
*hvm_select_ioreq_server(struct domain *d,
>=20
>              if ( !rdmsr_safe(MSR_AMD64_NB_CFG, msr_val) &&
>                   (msr_val & (1ULL << =
AMD64_NB_CFG_CF8_EXT_ENABLE_BIT)) )
> -                addr |=3D CF8_ADDR_HI(cf8);
> +                *addr |=3D CF8_ADDR_HI(cf8);
>          }
>      }
>      else
>      {
> -        type =3D (p->type =3D=3D IOREQ_TYPE_PIO) ?
> -                XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
> -        addr =3D p->addr;
> +        *type =3D (p->type =3D=3D IOREQ_TYPE_PIO) ?
> +                 XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
> +        *addr =3D p->addr;
>      }
>=20
> +    return true;
> +}
> +
> +struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
> +                                                 ioreq_t *p)
> +{
> +    struct hvm_ioreq_server *s;
> +    uint8_t type;
> +    uint64_t addr;
> +    unsigned int id;
> +
> +    if ( !arch_ioreq_server_get_type_addr(d, p, &type, &addr) )
> +        return NULL;
> +
>      FOR_EACH_IOREQ_SERVER(d, id, s)
>      {
>          struct rangeset *r;
> @@ -1515,11 +1569,16 @@ static int hvm_access_cf8(
>      return X86EMUL_UNHANDLEABLE;
>  }
>=20
> +void arch_ioreq_domain_init(struct domain *d)
> +{
> +    register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
> +}
> +
>  void hvm_ioreq_init(struct domain *d)
>  {
>      spin_lock_init(&d->arch.hvm.ioreq_server.lock);
>=20
> -    register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
> +    arch_ioreq_domain_init(d);
>  }
>=20
>  /*
> diff --git a/xen/include/asm-x86/hvm/ioreq.h =
b/xen/include/asm-x86/hvm/ioreq.h
> index e2588e9..13d35e1 100644
> --- a/xen/include/asm-x86/hvm/ioreq.h
> +++ b/xen/include/asm-x86/hvm/ioreq.h
> @@ -19,6 +19,9 @@
>  #ifndef __ASM_X86_HVM_IOREQ_H__
>  #define __ASM_X86_HVM_IOREQ_H__
>=20
> +#define HANDLE_BUFIOREQ(s) \
> +    ((s)->bufioreq_handling !=3D HVM_IOREQSRV_BUFIOREQ_OFF)
> +
>  bool hvm_io_pending(struct vcpu *v);
>  bool handle_hvm_io_completion(struct vcpu *v);
>  bool is_ioreq_server_page(struct domain *d, const struct page_info =
*page);
> @@ -55,6 +58,25 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool =
buffered);
>=20
>  void hvm_ioreq_init(struct domain *d);
>=20
> +bool arch_vcpu_ioreq_completion(enum hvm_io_completion =
io_completion);
> +int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s);
> +void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s);
> +void arch_ioreq_server_enable(struct hvm_ioreq_server *s);
> +void arch_ioreq_server_disable(struct hvm_ioreq_server *s);
> +void arch_ioreq_server_destroy(struct hvm_ioreq_server *s);
> +int arch_ioreq_server_map_mem_type(struct domain *d,
> +                                   struct hvm_ioreq_server *s,
> +                                   uint32_t flags);
> +void arch_ioreq_server_map_mem_type_completed(struct domain *d,
> +                                              struct hvm_ioreq_server =
*s,
> +                                              uint32_t flags);
> +bool arch_ioreq_server_destroy_all(struct domain *d);
> +bool arch_ioreq_server_get_type_addr(const struct domain *d,
> +                                     const ioreq_t *p,
> +                                     uint8_t *type,
> +                                     uint64_t *addr);
> +void arch_ioreq_domain_init(struct domain *d);
> +
>  #endif /* __ASM_X86_HVM_IOREQ_H__ */
>=20
>  /*
> --
> 2.7.4



