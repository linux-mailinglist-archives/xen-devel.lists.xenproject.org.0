Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE0C2435DD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 10:20:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k68SV-0004Ya-L7; Thu, 13 Aug 2020 08:19:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JVDZ=BX=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k68SU-0004YV-4q
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 08:19:34 +0000
X-Inumbo-ID: ca670f37-9e7c-46e0-aa09-11f243651cde
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca670f37-9e7c-46e0-aa09-11f243651cde;
 Thu, 13 Aug 2020 08:19:33 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z18so4407571wrm.12
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2020 01:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=+pgThj4ttDQD7a/1xgCNzLTCnoiMCUkfQ/JgRbmg3DA=;
 b=EBtQInEHAyyIfm0PWtuLIoE9vAnjJaxqCS3Z1Q3G1AWj+7Dxt8W3RU1UmllpUGE0M7
 Ow8ODjrrZZ/dQthe9lym+UCP9UsCWVVy9O91oKv2M599Jgk6SBGC55L5tSw/kwMe4wzM
 L4zxlLaS8nzDIrh/IfqRQR3QBtRA4y+SrzgtzOm/QqgaUuRhO5zeK2x6l9Nb9+3HNQzd
 Vby/6SD27wCJ/fu3Si+yCBxgOTZUap08Qf2OObKDiq17jCzY75Xo399UFWtBc37Zj5XU
 yr5z5gn66vYERCUqFEl0fXmSqI3kNHWTqxg8Af5fz3/Hk9FISKknFc99R5cy/d3BVDYX
 V2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=+pgThj4ttDQD7a/1xgCNzLTCnoiMCUkfQ/JgRbmg3DA=;
 b=bUEFoqPMekI3UkK6B+HdA8hniFapFCQM/rBUiizinKB3jhGJMn35diis8tg982Dr1W
 4lnF7cOVmZ9SlauOEOwZwAvxo9ugh4AowPEniQexB+93lghr38wPTJnVlXIXs1L4Zc/4
 7F8Ql01qxrqdIM94c++rdrPt3GHkwUDWQeBlFym7xFb7QsnznSt1+7n7AV+gUCXztVM1
 actubZb7Ueseq4a/EpsFKAo3KwR/Cwg9aiGH6JacftmOahIKOC//QuwkdPOxAUQfqf1J
 gQ4TTewZfNJzs8w9Z4WWz9uKJQodd+HQnhN15RjVUvAlO6MfBUtSZB5LQLGLadoux+4H
 d56w==
X-Gm-Message-State: AOAM5309k7D+Umnq3C9bzelV+TPZ0rsTMlklc66GiIGW/PvGf065oAYm
 wmM5Be7JUlrXV/NrYNvcWkU=
X-Google-Smtp-Source: ABdhPJz+dxcOmrUA+djJyTOga40Oi7nxXAphzYj+w9RrWJ2EyqxIzPWtiwJBXmrIK4PWlavNguIMrQ==
X-Received: by 2002:adf:e550:: with SMTP id z16mr2844195wrm.329.1597306772054; 
 Thu, 13 Aug 2020 01:19:32 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-143-223-30.range86-143.btcentralplus.com.
 [86.143.223.30])
 by smtp.gmail.com with ESMTPSA id g3sm9742239wrb.59.2020.08.13.01.19.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Aug 2020 01:19:31 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Cc: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>, "'Wei Liu'" <wl@xen.org>
References: <20200812124709.4165-1-roger.pau@citrix.com>
 <20200812124709.4165-4-roger.pau@citrix.com>
In-Reply-To: <20200812124709.4165-4-roger.pau@citrix.com>
Subject: RE: [PATCH 3/5] x86/vmsi: use the newly introduced EOI callbacks
Date: Thu, 13 Aug 2020 09:19:30 +0100
Message-ID: <004b01d6714a$782dbbb0$68893310$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHtt6hyfd7HfGtbm1qQjI5TC+nvgAHOUNRrqPixmOA=
Content-Language: en-gb
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monne <roger.pau@citrix.com>
> Sent: 12 August 2020 13:47
> To: xen-devel@lists.xenproject.org
> Cc: Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Paul Durrant =
<paul@xen.org>
> Subject: [PATCH 3/5] x86/vmsi: use the newly introduced EOI callbacks
>=20
> Remove the unconditional call to hvm_dpci_msi_eoi in vlapic_handle_EOI
> and instead use the newly introduced EOI callback mechanism in order
> to register a callback for MSI vectors injected from passed through
> devices.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/hvm/vlapic.c    |  2 --
>  xen/arch/x86/hvm/vmsi.c      | 36 =
++++++++++++++++++++++--------------
>  xen/drivers/passthrough/io.c |  4 +++-
>  xen/include/asm-x86/hvm/io.h |  2 +-
>  4 files changed, 26 insertions(+), 18 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 7369be468b..3b3b3d7621 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -496,8 +496,6 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 =
vector)
>      else if ( has_viridian_synic(d) )
>          viridian_synic_ack_sint(v, vector);
>=20
> -    hvm_dpci_msi_eoi(d, vector);
> -
>      spin_lock_irqsave(&vlapic->callback_lock, flags);
>      callback =3D vlapic->callbacks[vector].callback;
>      data =3D vlapic->callbacks[vector].data;
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 7ca19353ab..e192c4c6da 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -44,11 +44,9 @@
>  #include <asm/event.h>
>  #include <asm/io_apic.h>
>=20
> -static void vmsi_inj_irq(
> -    struct vlapic *target,
> -    uint8_t vector,
> -    uint8_t trig_mode,
> -    uint8_t delivery_mode)
> +static void vmsi_inj_irq(struct vlapic *target, uint8_t vector,
> +                         uint8_t trig_mode, uint8_t delivery_mode,
> +                         vlapic_eoi_callback_t *callback, void *data)
>  {
>      HVM_DBG_LOG(DBG_LEVEL_VLAPIC, "vmsi_inj_irq: vec %02x trig %d dm =
%d\n",
>                  vector, trig_mode, delivery_mode);
> @@ -57,17 +55,17 @@ static void vmsi_inj_irq(
>      {
>      case dest_Fixed:
>      case dest_LowestPrio:
> -        vlapic_set_irq(target, vector, trig_mode);
> +        vlapic_set_irq_callback(target, vector, trig_mode, callback, =
data);
>          break;
>      default:
>          BUG();
>      }
>  }
>=20
> -int vmsi_deliver(
> -    struct domain *d, int vector,
> -    uint8_t dest, uint8_t dest_mode,
> -    uint8_t delivery_mode, uint8_t trig_mode)
> +static int vmsi_deliver_callback(struct domain *d, int vector, =
uint8_t dest,
> +                                 uint8_t dest_mode, uint8_t =
delivery_mode,
> +                                 uint8_t trig_mode,
> +                                 vlapic_eoi_callback_t *callback, =
void *data)
>  {
>      struct vlapic *target;
>      struct vcpu *v;
> @@ -78,7 +76,8 @@ int vmsi_deliver(
>          target =3D vlapic_lowest_prio(d, NULL, 0, dest, dest_mode);
>          if ( target !=3D NULL )
>          {
> -            vmsi_inj_irq(target, vector, trig_mode, delivery_mode);
> +            vmsi_inj_irq(target, vector, trig_mode, delivery_mode, =
callback,
> +                         data);
>              break;
>          }
>          HVM_DBG_LOG(DBG_LEVEL_VLAPIC, "null MSI round robin: =
vector=3D%02x\n",
> @@ -89,8 +88,8 @@ int vmsi_deliver(
>          for_each_vcpu ( d, v )
>              if ( vlapic_match_dest(vcpu_vlapic(v), NULL,
>                                     0, dest, dest_mode) )
> -                vmsi_inj_irq(vcpu_vlapic(v), vector,
> -                             trig_mode, delivery_mode);
> +                vmsi_inj_irq(vcpu_vlapic(v), vector, trig_mode, =
delivery_mode,
> +                             callback, data);
>          break;
>=20
>      default:
> @@ -103,6 +102,14 @@ int vmsi_deliver(
>      return 0;
>  }
>=20
> +
> +int vmsi_deliver(struct domain *d, int vector, uint8_t dest, uint8_t =
dest_mode,
> +                 uint8_t delivery_mode, uint8_t trig_mode)
> +{
> +    return vmsi_deliver_callback(d, vector, dest, dest_mode, =
delivery_mode,
> +                                 trig_mode, NULL, NULL);
> +}
> +
>  void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci =
*pirq_dpci)
>  {
>      uint32_t flags =3D pirq_dpci->gmsi.gflags;
> @@ -119,7 +126,8 @@ void vmsi_deliver_pirq(struct domain *d, const =
struct hvm_pirq_dpci *pirq_dpci)
>=20
>      ASSERT(pirq_dpci->flags & HVM_IRQ_DPCI_GUEST_MSI);
>=20
> -    vmsi_deliver(d, vector, dest, dest_mode, delivery_mode, =
trig_mode);
> +    vmsi_deliver_callback(d, vector, dest, dest_mode, delivery_mode, =
trig_mode,
> +                          hvm_dpci_msi_eoi, NULL);
>  }
>=20
>  /* Return value, -1 : multi-dests, non-negative value: dest_vcpu_id =
*/
> diff --git a/xen/drivers/passthrough/io.c =
b/xen/drivers/passthrough/io.c
> index 6b1305a3e5..3793029b29 100644
> --- a/xen/drivers/passthrough/io.c
> +++ b/xen/drivers/passthrough/io.c
> @@ -874,8 +874,10 @@ static int _hvm_dpci_msi_eoi(struct domain *d,
>      return 0;
>  }
>=20
> -void hvm_dpci_msi_eoi(struct domain *d, int vector)
> +void hvm_dpci_msi_eoi(struct vcpu *v, unsigned int vector, void =
*data)
>  {
> +    struct domain *d =3D v->domain;
> +

Could we actually drop the vcpu parameter here... i.e. is there any case =
where this code will be invoked with v !=3D current?


>      if ( !is_iommu_enabled(d) ||
>           (!hvm_domain_irq(d)->dpci && !is_hardware_domain(d)) )
>         return;
> diff --git a/xen/include/asm-x86/hvm/io.h =
b/xen/include/asm-x86/hvm/io.h
> index 558426b772..450c7c8acb 100644
> --- a/xen/include/asm-x86/hvm/io.h
> +++ b/xen/include/asm-x86/hvm/io.h
> @@ -159,7 +159,7 @@ struct hvm_hw_stdvga {
>  void stdvga_init(struct domain *d);
>  void stdvga_deinit(struct domain *d);
>=20
> -extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
> +void hvm_dpci_msi_eoi(struct vcpu *v, unsigned int vector, void =
*data);
>=20
>  /* Decode a PCI port IO access into a bus/slot/func/reg. */
>  unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
> --
> 2.28.0



