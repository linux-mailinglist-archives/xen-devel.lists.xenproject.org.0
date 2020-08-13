Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61DC2435FD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 10:34:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k68gG-0006Cg-1p; Thu, 13 Aug 2020 08:33:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JVDZ=BX=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k68gE-0006Cb-R3
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 08:33:46 +0000
X-Inumbo-ID: 6cc30f48-4264-4761-afdd-e66e663dfc94
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cc30f48-4264-4761-afdd-e66e663dfc94;
 Thu, 13 Aug 2020 08:33:45 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x5so3973014wmi.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2020 01:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=rpQzT81yG9oculy0yH22eNr0uNmpBDk/TugSd6rMMWA=;
 b=Qmw6EYIpk0aS+SiWKArRMYxW3kYf+KbgzuUk7ieboKbuYzhmhY5KXMCy4IXUIknQpV
 Vd5wniO2n+2pPgVGVblVvtZpOYFXJF84JUcyQ4pwUfNi6pfGo4w7bcZROwNqbNfurBPh
 zcXgg8EZ9U0IJiMo86H0m5vSQqIqYxjxL1gwSQZt9yzdpD77F2VENs3MV8OwJXqIsDhF
 GzVFanTuW1U+WWABi2GJLL9Hoz5i/C3lnDtK2xuPwJIli4jYZaFUy08y64TwAeIpIb84
 MVlFuBYAyuZ7Zz2fn7fPHFiYLiLojxxHow7ilVlzEltwPNRyoIqcGDwVTGex2/Zl7t74
 ivrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=rpQzT81yG9oculy0yH22eNr0uNmpBDk/TugSd6rMMWA=;
 b=DPMQw+xwSaCRplj/W2EuVTY7uAVmz38WglzPcN7XIkp5bSMuuAqnLw44Ui3WY6b5Iy
 7Ds+aQdbdQHsKwOovio7Dg8SItsDVz6PuXyD1f61nNaiOVBBUaUAw94TNMsBAhpEpPw1
 RkQ/3iWDk1emMN+AkmxiAGR05gcH/kcOoio4ahNfKGRxm6xZjZdhNXEdA6gMqM3oOP/o
 ckoJNt3QZAFmU1YI09lxsR29Ocf4y2Q6N/uCOLfRFMJcVsEOtOf0M1D38i1sD+93YUv0
 7Lv4kp6YMgyk1NGHAbzFGeASJiNvcWIChKWlzeXoE193Rbh8tpNV3B+dxZgKJg902LCI
 iEWw==
X-Gm-Message-State: AOAM530p8Mmg/HUlk5YBWDXpWR5FpGM619kxp/aZFIxGP3juRfmdYGoI
 BmxCmJpuwwBLSpNY2W6Hcw0=
X-Google-Smtp-Source: ABdhPJxUmf0WNRn9L8sWZSxcR2CM8KBL/LXD5dYW2LokWeDiD1EHwR/uEWml0hj6MOv9PpMwZgUnzQ==
X-Received: by 2002:a1c:4409:: with SMTP id r9mr3169463wma.114.1597307624866; 
 Thu, 13 Aug 2020 01:33:44 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-143-223-30.range86-143.btcentralplus.com.
 [86.143.223.30])
 by smtp.gmail.com with ESMTPSA id s206sm8412895wmf.40.2020.08.13.01.33.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Aug 2020 01:33:44 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Cc: "'Wei Liu'" <wl@xen.org>, "'Jan Beulich'" <jbeulich@suse.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>
References: <20200812124709.4165-1-roger.pau@citrix.com>
 <20200812124709.4165-5-roger.pau@citrix.com>
In-Reply-To: <20200812124709.4165-5-roger.pau@citrix.com>
Subject: RE: [PATCH 4/5] x86/viridian: switch synic to use the new EOI callback
Date: Thu, 13 Aug 2020 09:33:43 +0100
Message-ID: <004e01d6714c$748450d0$5d8cf270$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHtt6hyfd7HfGtbm1qQjI5TC+nvgAFzOaW4qPuMi9A=
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
> Cc: Roger Pau Monne <roger.pau@citrix.com>; Paul Durrant =
<paul@xen.org>; Wei Liu <wl@xen.org>; Jan
> Beulich <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>
> Subject: [PATCH 4/5] x86/viridian: switch synic to use the new EOI =
callback
>=20
> Switch synic interrupts to use an EOI callback in order to execute the
> logic tied to the end of interrupt. This allows to remove the synic
> call in vlapic_handle_EOI.
>=20
> Move and rename viridian_synic_ack_sint now that it can be made
> static.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> I'm unsure about the logic in viridian_synic_deliver_timer_msg, as it
> seems to only set the vector in msg_pending when the message is
> already pending?

See section 11.10.3 of the TLFS (SynIC Message Flags)...

"The MessagePending flag indicates whether or not there are any messages =
pending in the message queue of the synthetic interrupt source. If there =
are, then an =E2=80=9Cend of message=E2=80=9D must be performed by the =
guest after emptying the message slot. This allows for opportunistic =
writes to the EOM MSR (only when required). Note that this flag may be =
set by the hypervisor upon message delivery or at any time afterwards. =
The flag should be tested after the message slot has been emptied and if =
set, then there are one or more pending messages and the =E2=80=9Cend of =
message=E2=80=9D should be performed."

IOW it's a bit like APIC assist in that it tries to avoid a VMEXIT (in =
this case an access to the EOM MSR) unless it is necessary.

Reading the code again I think it may well be possible to get rid of the =
'msg_pending' flag since it only appears to be an optimization to avoid =
testing 'message_type'. I'll try dropping it and see what breaks.

  Paul

> ---
>  xen/arch/x86/hvm/viridian/synic.c  | 28 +++++++++++++++-------------
>  xen/arch/x86/hvm/vlapic.c          |  4 ----
>  xen/include/asm-x86/hvm/viridian.h |  1 -
>  3 files changed, 15 insertions(+), 18 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/viridian/synic.c =
b/xen/arch/x86/hvm/viridian/synic.c
> index 94a2b88733..250f0353cf 100644
> --- a/xen/arch/x86/hvm/viridian/synic.c
> +++ b/xen/arch/x86/hvm/viridian/synic.c
> @@ -315,6 +315,19 @@ void viridian_synic_poll(struct vcpu *v)
>      viridian_time_poll_timers(v);
>  }
>=20
> +static void synic_ack_sint(struct vcpu *v, unsigned int vector, void =
*data)
> +{
> +    struct viridian_vcpu *vv =3D v->arch.hvm.viridian;
> +    unsigned int sintx =3D vv->vector_to_sintx[vector];
> +
> +    ASSERT(v =3D=3D current);
> +
> +    if ( sintx < ARRAY_SIZE(vv->sint) )
> +        __clear_bit(array_index_nospec(sintx, ARRAY_SIZE(vv->sint)),
> +                    &vv->msg_pending);
> +}
> +
> +
>  bool viridian_synic_deliver_timer_msg(struct vcpu *v, unsigned int =
sintx,
>                                        unsigned int index,
>                                        uint64_t expiration,
> @@ -361,7 +374,8 @@ bool viridian_synic_deliver_timer_msg(struct vcpu =
*v, unsigned int sintx,
>      memcpy(msg->u.payload, &payload, sizeof(payload));
>=20
>      if ( !vs->masked )
> -        vlapic_set_irq(vcpu_vlapic(v), vs->vector, 0);
> +        vlapic_set_irq_callback(vcpu_vlapic(v), vs->vector, 0,
> +                                synic_ack_sint, NULL);
>=20
>      return true;
>  }
> @@ -380,18 +394,6 @@ bool viridian_synic_is_auto_eoi_sint(const struct =
vcpu *v,
>      return vs->auto_eoi;
>  }
>=20
> -void viridian_synic_ack_sint(const struct vcpu *v, unsigned int =
vector)
> -{
> -    struct viridian_vcpu *vv =3D v->arch.hvm.viridian;
> -    unsigned int sintx =3D vv->vector_to_sintx[vector];
> -
> -    ASSERT(v =3D=3D current);
> -
> -    if ( sintx < ARRAY_SIZE(vv->sint) )
> -        __clear_bit(array_index_nospec(sintx, ARRAY_SIZE(vv->sint)),
> -                    &vv->msg_pending);
> -}
> -
>  void viridian_synic_save_vcpu_ctxt(const struct vcpu *v,
>                                     struct hvm_viridian_vcpu_context =
*ctxt)
>  {
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 3b3b3d7621..701ff942e6 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -489,12 +489,8 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 =
vector)
>      void *data;
>      unsigned long flags;
>=20
> -    /* All synic SINTx vectors are edge triggered */
> -
>      if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
>          vioapic_update_EOI(d, vector);
> -    else if ( has_viridian_synic(d) )
> -        viridian_synic_ack_sint(v, vector);
>=20
>      spin_lock_irqsave(&vlapic->callback_lock, flags);
>      callback =3D vlapic->callbacks[vector].callback;
> diff --git a/xen/include/asm-x86/hvm/viridian.h =
b/xen/include/asm-x86/hvm/viridian.h
> index 844e56b38f..d387d11ce0 100644
> --- a/xen/include/asm-x86/hvm/viridian.h
> +++ b/xen/include/asm-x86/hvm/viridian.h
> @@ -89,7 +89,6 @@ void viridian_apic_assist_clear(const struct vcpu =
*v);
>  void viridian_synic_poll(struct vcpu *v);
>  bool viridian_synic_is_auto_eoi_sint(const struct vcpu *v,
>                                       unsigned int vector);
> -void viridian_synic_ack_sint(const struct vcpu *v, unsigned int =
vector);
>=20
>  #endif /* __ASM_X86_HVM_VIRIDIAN_H__ */
>=20
> --
> 2.28.0



