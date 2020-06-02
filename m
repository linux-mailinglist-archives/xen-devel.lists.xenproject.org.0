Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50B61EB6AB
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 09:43:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg1a5-0003bF-VF; Tue, 02 Jun 2020 07:43:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJcj=7P=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jg1a3-0003aw-Sq
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 07:43:27 +0000
X-Inumbo-ID: be7efc18-a4a4-11ea-9947-bc764e2007e4
Received: from mail-wm1-x336.google.com (unknown [2a00:1450:4864:20::336])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be7efc18-a4a4-11ea-9947-bc764e2007e4;
 Tue, 02 Jun 2020 07:43:27 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id j198so1607130wmj.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 00:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=afxo1YQhq8R7tiHBruiDK5cfcarcjaUlnwjiDlODfu8=;
 b=rjo9dKcKbAs8wTTD5FBH4a5g+lAZPaxTQ6acl+H6oy7kejefmSdqDdRv6RwZaKGKPI
 Xvdpl1JYjI6As7ziQHGnIFGp3jzRAC00waGXeABmtieYF/i8yqQ/R59CnPQjsuhFxUC7
 o77ojgbmE2Z2dmDN0fv8W3nuftT+jkyrXtCED6z0nE/VZ/oDlIz33UrwDrw4cSocnvuD
 fYkCv6ju8Kl+crqdtxK+ddS1W/5iM7LKq6g9YzlEhaK43xrovJnH6Jz35daeGx41xbaT
 AuNzqIyTrysz4G2Y1tdteqwNinRjnOwXgRaayyoAtygZICblJkZmAVYOZkhxFrt0kNs/
 sbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=afxo1YQhq8R7tiHBruiDK5cfcarcjaUlnwjiDlODfu8=;
 b=pooBOpRsJ5OPN2XEuv0ouoJBE1CpRncWKaUnySewEBjw+vP9+WBACiyBF79L7zHw16
 C5vX83Rk1ga/816B9ARnTLuZaT1fiAQ6j/22L0SMz2iI/6DaqxjhplnAV855URiIm1Wv
 MNuH4niiIQkadaxOyq9gnCDP2qLtpYhHob43i3n1woGjlEv8Yy12dVWPG6wrBiLXq68+
 5sbYPimKaU44K8HurPbVMCSqICgEjStnyQFnE8tg7Gw5GSn+8oZywSZUlEcQ6hSK/J/S
 9RZFdwhRLfdJxLVgPUf/e/KopM1NsSmgJLmNeoChjB2UL8n6YLbFk4ea16yuNmkY0le8
 wDlg==
X-Gm-Message-State: AOAM530m3m9riyWPUCLG+Y9IJShoZlkpdAbUtUFGM+iwz/58kArha4ey
 ekXBeNUsCUHxFEqwUvE+Y1E=
X-Google-Smtp-Source: ABdhPJyzYzsB2gz1MGSl3SQAh8o+sU/a+d1sKn5/kO8bvSpsx682/I7qpqdwk/eB5sy4pR6+pgYWbw==
X-Received: by 2002:a1c:28c5:: with SMTP id o188mr2779879wmo.62.1591083806130; 
 Tue, 02 Jun 2020 00:43:26 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id j18sm2606270wrn.59.2020.06.02.00.43.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jun 2020 00:43:25 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Tamas K Lengyel'" <tamas.lengyel@intel.com>,
 <xen-devel@lists.xenproject.org>
References: <cover.1591017086.git.tamas.lengyel@intel.com>
 <a7ecf7703357130dbd9f23481d39adafea569872.1591017086.git.tamas.lengyel@intel.com>
In-Reply-To: <a7ecf7703357130dbd9f23481d39adafea569872.1591017086.git.tamas.lengyel@intel.com>
Subject: RE: [PATCH v19 for-4.14 01/13] x86/mem_sharing: block interrupt
 injection for forks
Date: Tue, 2 Jun 2020 08:43:24 +0100
Message-ID: <003401d638b1$7f99efd0$7ecdcf70$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLopxTEy5NbImEQwB/v9n5io2F1+gFjtKKwppT2/KA=
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
Reply-To: paul@xen.org
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Jan Beulich' <jbeulich@suse.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Tamas K Lengyel' <tamas@tklengyel.com>,
 'Jun Nakajima' <jun.nakajima@intel.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Tamas K Lengyel
> Sent: 01 June 2020 14:22
> To: xen-devel@lists.xenproject.org
> Cc: Kevin Tian <kevin.tian@intel.com>; Stefano Stabellini =
<sstabellini@kernel.org>; Tamas K Lengyel
> <tamas.lengyel@intel.com>; Jun Nakajima <jun.nakajima@intel.com>; Wei =
Liu <wl@xen.org>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; =
George Dunlap
> <george.dunlap@citrix.com>; Tamas K Lengyel <tamas@tklengyel.com>; Jan =
Beulich <jbeulich@suse.com>;
> Julien Grall <julien@xen.org>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>
> Subject: [PATCH v19 for-4.14 01/13] x86/mem_sharing: block interrupt =
injection for forks
>=20
> When running VM forks without device models (QEMU), it may
> be undesirable for Xen to inject interrupts. When creating such forks =
from
> Windows VMs we have observed the kernel trying to process interrupts
> immediately after the fork is executed. However without QEMU running =
such
> interrupt handling may not be possible because it may attempt to =
interact with
> devices that are not emulated by a backend. In the best case scenario =
such
> interrupt handling would only present a detour in the VM forks' =
execution
> flow, but in the worst case as we actually observed can completely =
stall it.
> By disabling interrupt injection a fuzzer can exercise the target code =
without
> interference. For other use-cases this option probably doesn't make =
sense,
> that's why this is not enabled by default.
>=20
> Forks & memory sharing are only available on Intel CPUs so this only =
applies
> to vmx. Note that this is part of the experimental VM forking feature =
that's
> completely disabled by default and can only be enabled by using
> XEN_CONFIG_EXPERT during compile time.
>=20
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Release-acked-by: Paul Durrant <paul@xen.org>

> ---
>  xen/arch/x86/hvm/vmx/intr.c      | 6 ++++++
>  xen/arch/x86/mm/mem_sharing.c    | 6 +++++-
>  xen/include/asm-x86/hvm/domain.h | 2 +-
>  xen/include/public/memory.h      | 3 +++
>  4 files changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
> index 000e14af49..80bfbb4787 100644
> --- a/xen/arch/x86/hvm/vmx/intr.c
> +++ b/xen/arch/x86/hvm/vmx/intr.c
> @@ -256,6 +256,12 @@ void vmx_intr_assist(void)
>      if ( unlikely(v->arch.vm_event) && v->arch.vm_event->sync_event )
>          return;
>=20
> +#ifdef CONFIG_MEM_SHARING
> +    /* Block event injection for VM fork if requested */
> +    if ( unlikely(v->domain->arch.hvm.mem_sharing.block_interrupts) )
> +        return;
> +#endif
> +
>      /* Crank the handle on interrupt state. */
>      pt_vector =3D pt_update_irq(v);
>=20
> diff --git a/xen/arch/x86/mm/mem_sharing.c =
b/xen/arch/x86/mm/mem_sharing.c
> index 19922ab5d1..c428fd16ce 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -2106,7 +2106,8 @@ int =
mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
>          rc =3D -EINVAL;
>          if ( mso.u.fork.pad )
>              goto out;
> -        if ( mso.u.fork.flags & ~XENMEM_FORK_WITH_IOMMU_ALLOWED )
> +        if ( mso.u.fork.flags &
> +             ~(XENMEM_FORK_WITH_IOMMU_ALLOWED | =
XENMEM_FORK_BLOCK_INTERRUPTS) )
>              goto out;
>=20
>          rc =3D =
rcu_lock_live_remote_domain_by_id(mso.u.fork.parent_domain,
> @@ -2134,6 +2135,9 @@ int =
mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
>              rc =3D =
hypercall_create_continuation(__HYPERVISOR_memory_op,
>                                                 "lh", =
XENMEM_sharing_op,
>                                                 arg);
> +        else if ( !rc && (mso.u.fork.flags & =
XENMEM_FORK_BLOCK_INTERRUPTS) )
> +            d->arch.hvm.mem_sharing.block_interrupts =3D true;
> +
>          rcu_unlock_domain(pd);
>          break;
>      }
> diff --git a/xen/include/asm-x86/hvm/domain.h =
b/xen/include/asm-x86/hvm/domain.h
> index 95fe18cddc..9d247baf4d 100644
> --- a/xen/include/asm-x86/hvm/domain.h
> +++ b/xen/include/asm-x86/hvm/domain.h
> @@ -67,7 +67,7 @@ struct hvm_ioreq_server {
>  #ifdef CONFIG_MEM_SHARING
>  struct mem_sharing_domain
>  {
> -    bool enabled;
> +    bool enabled, block_interrupts;
>=20
>      /*
>       * When releasing shared gfn's in a preemptible manner, recall =
where
> diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> index dbd35305df..850bd72c52 100644
> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -536,7 +536,10 @@ struct xen_mem_sharing_op {
>          } debug;
>          struct mem_sharing_op_fork {      /* OP_FORK */
>              domid_t parent_domain;        /* IN: parent's domain id =
*/
> +/* Only makes sense for short-lived forks */
>  #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
> +/* Only makes sense for short-lived forks */
> +#define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)
>              uint16_t flags;               /* IN: optional settings */
>              uint32_t pad;                 /* Must be set to 0 */
>          } fork;
> --
> 2.25.1
>=20



