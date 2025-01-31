Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471FCA23849
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2025 01:34:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879811.1290028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdeyx-00007U-HO; Fri, 31 Jan 2025 00:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879811.1290028; Fri, 31 Jan 2025 00:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdeyx-00005i-EP; Fri, 31 Jan 2025 00:34:03 +0000
Received: by outflank-mailman (input) for mailman id 879811;
 Fri, 31 Jan 2025 00:34:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyPN=UX=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1tdeyv-0008Ee-QS
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 00:34:01 +0000
Received: from sender3-op-o16.zoho.com (sender3-op-o16.zoho.com
 [136.143.184.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f916847-df6b-11ef-99a4-01e77a169b0f;
 Fri, 31 Jan 2025 01:34:00 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1738283632693270.94448674437433;
 Thu, 30 Jan 2025 16:33:52 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6efea3c9e6eso3652527b3.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 16:33:52 -0800 (PST)
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
X-Inumbo-ID: 0f916847-df6b-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1738283636; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EDZQTcgoFoCK55+dBNDQLVclL/4tcCA06TPxq0KyzhgiSpTKVzR/fYwtFt6V4rb2ZXjZfGVs2ejzRAEOlcz7tRiFZZi834p//QEDjMUsK6pi2KXngCHS4t/Da1JPP56HF1QjgMA14BfjKitxxRwvFzNZVeerDKYV0G80ih1oCJg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738283636; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DGwOUai/U6rjKQW0Y8Iz7PQi4zjz0YJNw64ucG7bSRc=; 
	b=TRIHoQUHoUehI5nF3B+FS/xe8xzUVg3z+Al2vvQEOH6LyhkMzl1H47ck2xs22m0c7awrZdk61S5TuHwACyZai/yxAefKOWZc/Ab/yj596KUWYBgOHiwFY/Hk2K3kXKfGJy9Ym2pA+T33zmYRTn6KZRfH0VgZ1SP/ac0UgzFLUfI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738283636;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=DGwOUai/U6rjKQW0Y8Iz7PQi4zjz0YJNw64ucG7bSRc=;
	b=M/+L4wZbczLGOg07bJZfCu+peMyfg6L+OoZbs3dJt05oS/xoZdwpQKzZBriNUf7E
	UrzqEEeGGdtlZsFzzYYef3nzpSV5qxw8Rlvk9A6jzGI3LTxWTB9RNnnlD+vob92T9qW
	scHu1F/dDkTFtlvEnaKipRNi1LVLCsiLhcO5lV0w=
X-Gm-Message-State: AOJu0Ywhj/NBrgDxmQaUIta/wFfSN/1YU5I8KdxjCsMuUl5DrLA5zu6W
	ir4LOEu4cY8XAEUybMzIe4+q4TxBLVLV+4DpnfC/gj+nkFNDwpmsPfJbfUdiZQbDgKMvG95OQpz
	U/0FQkusKB0riVzUwJmfNvHwShaU=
X-Google-Smtp-Source: AGHT+IFiESrzHXvdxSl+eZgwHrVF87qZTJs+7fx/bknQTXtcM7CItYeo4pF086kcd2fOYV6vg3VldDtg27BS7PyQILw=
X-Received: by 2002:a05:690c:1c:b0:6f5:3bb1:7b7f with SMTP id
 00721157ae682-6f7a83fcecdmr74947787b3.26.1738283631942; Thu, 30 Jan 2025
 16:33:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1737452864.git.Sergiy_Kibrik@epam.com> <2e8b9c5390019ef66610a21d9a8744282e2badeb.1737452864.git.Sergiy_Kibrik@epam.com>
In-Reply-To: <2e8b9c5390019ef66610a21d9a8744282e2badeb.1737452864.git.Sergiy_Kibrik@epam.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 30 Jan 2025 19:33:16 -0500
X-Gmail-Original-Message-ID: <CABfawhkw-MDvVnfgTi44YHA9JYSkzFS6VkdtLdH33big9BcHdA@mail.gmail.com>
X-Gm-Features: AWEUYZkccRk1IKZk8pr4WIqF3sRseIK9Q36IU3s36578TlFvgUBYgcpYQ9I6zNU
Message-ID: <CABfawhkw-MDvVnfgTi44YHA9JYSkzFS6VkdtLdH33big9BcHdA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] xen: mem_access: conditionally compile vm_event.c
 & monitor.c
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <stefano.stabellini@amd.com>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, 
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 5:25=E2=80=AFAM Sergiy Kibrik <Sergiy_Kibrik@epam.c=
om> wrote:
>
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>
> Extend coverage of CONFIG_VM_EVENT option and make the build of VM events
> and monitoring support optional.
> This is to reduce code size on Arm when this option isn't enabled.
>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
> Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
> changes in v2:
>  - rename CONFIG_MEM_ACCESS -> CONFIG_VM_EVENT
>  - tags
> ---
>  xen/arch/arm/Makefile      |  4 ++--
>  xen/arch/arm/vsmc.c        |  3 ++-
>  xen/common/Makefile        |  4 ++--
>  xen/include/xen/monitor.h  |  9 +++++++++
>  xen/include/xen/vm_event.h | 14 +++++++++++---
>  5 files changed, 26 insertions(+), 8 deletions(-)
>
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index ad29316df1..e61238c4d0 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -39,7 +39,7 @@ obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o
>  obj-$(CONFIG_LLC_COLORING) +=3D llc-coloring.o
>  obj-$(CONFIG_VM_EVENT) +=3D mem_access.o
>  obj-y +=3D mm.o
> -obj-y +=3D monitor.o
> +obj-$(CONFIG_VM_EVENT) +=3D monitor.o
>  obj-y +=3D p2m.o
>  obj-y +=3D platform.o
>  obj-y +=3D platform_hypercall.o
> @@ -65,7 +65,7 @@ obj-$(CONFIG_VGICV2) +=3D vgic-v2.o
>  obj-$(CONFIG_GICV3) +=3D vgic-v3.o
>  obj-$(CONFIG_HAS_ITS) +=3D vgic-v3-its.o
>  endif
> -obj-y +=3D vm_event.o
> +obj-$(CONFIG_VM_EVENT) +=3D vm_event.o
>  obj-y +=3D vtimer.o
>  obj-$(CONFIG_SBSA_VUART_CONSOLE) +=3D vpl011.o
>  obj-y +=3D vsmc.o
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index 62d8117a12..1ea75cd7f1 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -330,7 +330,8 @@ void do_trap_smc(struct cpu_user_regs *regs, const un=
ion hsr hsr)
>      }
>
>      /* If monitor is enabled, let it handle the call. */
> -    if ( current->domain->arch.monitor.privileged_call_enabled )
> +    if ( IS_ENABLED(CONFIG_VM_EVENT) &&
> +         current->domain->arch.monitor.privileged_call_enabled )
>          rc =3D monitor_smc();

Why not wrap this entire if block above in an #ifdef CONFIG_VM_EVENT?
I think it would be more explicit what code is being compiled that way
instead of just relying on the compiler optimization to take care of
removing it. The rest of the patch looks fine to me.

Tamas

