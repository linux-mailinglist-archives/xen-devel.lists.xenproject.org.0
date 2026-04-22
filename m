Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGKEAJrL6GklQQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 15:22:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2772C446A83
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 15:22:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290529.1570094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXWx-00084j-5b; Wed, 22 Apr 2026 13:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290529.1570094; Wed, 22 Apr 2026 13:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXWx-00082T-32; Wed, 22 Apr 2026 13:22:15 +0000
Received: by outflank-mailman (input) for mailman id 1290529;
 Wed, 22 Apr 2026 13:22:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jens.wiklander@linaro.org>) id 1wFXWv-00082N-DO
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:22:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFXWu-000ZnF-Q3
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 15:22:12 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 69e8cb68-bab6-0a2a0a5309dd-0a2a450a950e-32
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:22:12 +0200
Received: from [209.85.160.51] (helo=mail-oa1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 69e8cb83-56b3-0a2a450a0019-d155a033e11a-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:22:12 +0200
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-41708f6c3feso3518147fac.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 06:22:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1776864131; cv=none;
        d=google.com; s=arc-20240605;
        b=bzdij10dWWIlonLfp9s7GIAtFzxpz3wLRIZ9JtVQQ0b+PH3TqvwhLcjn6Nt+Gl/t3z
         qBsSbYrrBd1N54tEDAjkCnXb9gXdJBz1iXVKBX7snaXZ46/fGdWe/LRLRWr+NiH1b+rG
         gMJbeuIVhGFBS/NSiTiOFppwcdB3+7JtHBUxCTfkBoTjc6mxdYdRG268d10sOKsvSTeR
         6SP5AS3v1n6gQmC2eNOo2UN2oeTKa8PypgKGeF61YTb5LIpXbynFegt8yreb/D8fNM+y
         BgMEbzKKSOLH8+ZClfhyUk9so0vCkVxdBQpPoyRk1wuGq+ExNk3kEN7TaURB1uOw2XOR
         joGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f0F3oZ8mp3d3dSf4u2eAOTbRoWum3oUzSMdZnoDb07c=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=Oihu5mspc8THzaHHIuSfsj9AO5LYNpLY9BnZSTGoD1ZMTotlJnRryqkK967Nl0jJPD
         KkFALTEknNPSF9DlRjNcIWyglW9VtxMsMBcmf9WciGcxmMsNX27MOQwb5VAthJ+xv3Da
         wRYul4CbWTn3lkiwfvM4Yd7b93gCxPHKRYsLGWzJlQZfipXEQRuYCsIZ+S9CUM2gQcdu
         q9hHgmRWdK2YXX1VVZfGpLlE2ZGyZ2Iu5NpKOpqlyHuioi+impLr23uqeyInjVniB6Zf
         5sELeYdObspouZ2NjBkGlkVllgpyMrJ+9Tao8a6K7c9nBXL2OLvwLfTl3q9GbpDO1Y7y
         isGQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776864131; x=1777468931; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0F3oZ8mp3d3dSf4u2eAOTbRoWum3oUzSMdZnoDb07c=;
        b=mk398bmHdnq3+5JOZD5aqxyXfG0cKkrcSNPpXn9mz08Aqan2K+wTFhI4TzDKusMLf1
         dCc4N35vbhSWDIvHdqanIKbgXfq3Zv3Nb27g9oFyYqu5VoZHNIoRm5mylVd/IEgekoFo
         zo8htTpaojHF4Kc1qZynBcHmBy+PV3FoXQoaEVm1fttoChGLMrqaIYdNjIOe8IW/PP7g
         mk2/fiAaQa7Q+B4/I5c+1YZ1ew1+VOMAckf7MMavaejyXortXHft4d9sZqLhjV6ouGyw
         eQwndjMFcUNqHAvjQ0+spOTB4NPdPJ3v0ZOZ/ZAOkGAWsP3xhQKWIVksQiFcdg3QV+OH
         vWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776864131; x=1777468931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f0F3oZ8mp3d3dSf4u2eAOTbRoWum3oUzSMdZnoDb07c=;
        b=fmrUYlqqQgiPlL4ZjZiDxB5NFRkGRLfiP6gi7wzYTpzkfT/FO/0eGv4nFmWkFk6BZg
         25KPaYM7a2oc1usJ9SMJmUR7C2rWmMQGwg1Brg7N05uLONKoAZ/trXoihDIEtPlk/xbp
         VcnLgIPuqhfnqIzIVdM5rO9o5qn4sR9OaLGbZ7qN7xEz31MLtRZ9RMRSm3T08DCQmEpQ
         dr7Uxl77UFOdLPl/Eqy/Jokn2A0iaXwx9tOJXJe88Ymjs+6ZQwKB26Ma2Pd7Grx0Wkn8
         uVaOZIgWMR0P8fVNginNT6WkTRwxFG5jqIDvpyML3IBIJRvsGyyVeGbUymIZKLlEMNnP
         YRlQ==
X-Gm-Message-State: AOJu0Yy2ZKC361OYQOJkfuKRiUxXXFy08KaBvj3SVMU4aUGU37v2dEEz
	g5hHUb/AyYpHZ4Mce87Yx1L86MI1rJ2Q8rebElgu1I8PL42+ISknFYU49a8N3VYAJZZaJMI5+G1
	1r1w2XECWI+zFYi2npbWUe70a3USVsbf//PE7zPJPdQ==
X-Gm-Gg: AeBDievgCAZHABzUxtYNKBE6jFJRU1uun+Leelde4IhoNMwX16XVa4IAy2WfbsO3Ibu
	dX4qM656Yo5Ik2T10Lyyxho4q98Xr2+hANXO0/OegCp69tJtnQ4SKiuE+WnQfbQuC0OCSNyEctT
	gRkN/AymXRk0lre2OPr/cfjCIMBjE2n3M5ItLom1EnBGUGXszfTYtQT5i3587QNzng5aSRy5Mrt
	bO+nhk2W/Ke6hNiBja3RYvTGze4j7XgaUA4zgMke45PDfOsGORBU6qiuzPdZ5mWWyhCNB5PPgjx
	y58KkjqxWSvifjVaOxkLIFfzG1AmFTp6bsR4eJOJcWPUq5Ofs5AWNyb4xMY=
X-Received: by 2002:a4a:e903:0:b0:694:9f32:11 with SMTP id 006d021491bc7-6949f3202e9mr2826813eaf.5.1776864130648;
 Wed, 22 Apr 2026 06:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776266307.git.bertrand.marquis@arm.com> <a3e689abc6695c0adbe294ebce7ee0a77bd4b7bf.1776266307.git.bertrand.marquis@arm.com>
In-Reply-To: <a3e689abc6695c0adbe294ebce7ee0a77bd4b7bf.1776266307.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 22 Apr 2026 15:21:58 +0200
X-Gm-Features: AQROBzBKQVL6zQvr3FCIfYlQ6vhvNnWfQ5N49pVyGmS3J7xHS8LLWBnnR4QMJtI
Message-ID: <CAHUa44EnUgxzyY7z53pfOhB5Xps8KWOV2FdZiTEF0gufrfQcdQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] xen/arm: ffa: Track VM notification bindings locally
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1776864132-45F698B7-B7A7B868/0/0
X-purgate-type: clean
X-purgate-size: 8132
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,linaro.org:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 2772C446A83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bertrand,

On Fri, Apr 17, 2026 at 3:41=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> VM-to-VM notifications need receiver-side bind state so Xen can validate
> which sender owns each notification bit. Non-secure BIND and UNBIND
> requests currently have no local state and cannot enforce that contract.
>
> Add per-bit VM notification binding state to struct ffa_ctx_notif and
> use it to handle non-secure BIND and UNBIND requests when
> CONFIG_FFA_VM_TO_VM is enabled. The update helper validates the whole
> request under notif_lock before mutating anything, denies bind or
> unbind when a bit is pending, rejects rebinding to a different sender,
> and keeps rebinding to the same sender idempotent.
>
> Promote vm_pending to a bitmap so the bind logic can reason per
> notification ID, use that bitmap directly when reporting pending state,
> and initialize and clear the new VM notification state during domain
> init and teardown.
>
> Functional impact: when CONFIG_FFA_VM_TO_VM is enabled, Xen tracks VM
> notification bindings locally and validates non-secure bind and unbind
> requests against that state.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa_notif.c   | 97 ++++++++++++++++++++++++++++++----
>  xen/arch/arm/tee/ffa_private.h | 15 ++++--
>  2 files changed, 99 insertions(+), 13 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index fff00ca2baec..4def701f0130 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -56,6 +56,54 @@ static int32_t ffa_notif_parse_params(uint16_t dom_id,=
 uint16_t caller_id,
>      return FFA_RET_OK;
>  }
>
> +static int32_t ffa_notif_update_vm_binding(struct ffa_ctx *ctx,
> +                                           uint16_t dest_id, uint64_t bi=
tmap,
> +                                           bool bind)
> +{
> +    unsigned int id;
> +    int32_t ret =3D FFA_RET_OK;
> +
> +    spin_lock(&ctx->notif.notif_lock);
> +
> +    for ( id =3D 0; id < FFA_NUM_VM_NOTIF; id++ )
> +    {
> +        if ( !(bitmap & BIT(id, ULL)) )
> +            continue;
> +
> +        if ( ctx->notif.vm_pending & BIT(id, ULL) )
> +        {
> +            ret =3D FFA_RET_DENIED;
> +            goto out_unlock;
> +        }
> +
> +        if ( bind )
> +        {
> +            if ( ctx->notif.vm_bind[id] !=3D 0 &&
> +                 ctx->notif.vm_bind[id] !=3D dest_id )
> +            {
> +                ret =3D FFA_RET_DENIED;
> +                goto out_unlock;
> +            }
> +        }
> +        else if ( ctx->notif.vm_bind[id] !=3D dest_id )
> +        {
> +            ret =3D FFA_RET_DENIED;
> +            goto out_unlock;
> +        }
> +    }
> +
> +    for ( id =3D 0; id < FFA_NUM_VM_NOTIF; id++ )
> +    {
> +        if ( bitmap & BIT(id, ULL) )
> +            ctx->notif.vm_bind[id] =3D bind ? dest_id : 0;
> +    }
> +
> +out_unlock:
> +    spin_unlock(&ctx->notif.notif_lock);
> +
> +    return ret;
> +}
> +
>  int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
>  {
>      struct domain *d =3D current->domain;
> @@ -76,11 +124,21 @@ int32_t ffa_handle_notification_bind(struct cpu_user=
_regs *regs)
>      if ( ret )
>          return ret;
>
> -    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
> -        return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags,
> -                               bitmap_lo, bitmap_hi);
> +    if ( FFA_ID_IS_SECURE(dest_id) )
> +    {
> +        if ( fw_notif_enabled )
> +            return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags=
,
> +                                   bitmap_lo, bitmap_hi);
>
> -    return FFA_RET_NOT_SUPPORTED;
> +        return FFA_RET_NOT_SUPPORTED;
> +    }
> +
> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    return ffa_notif_update_vm_binding(ctx, dest_id,
> +                                       ((uint64_t)bitmap_hi << 32) | bit=
map_lo,
> +                                       true);
>  }
>
>  int32_t ffa_handle_notification_unbind(struct cpu_user_regs *regs)
> @@ -99,11 +157,21 @@ int32_t ffa_handle_notification_unbind(struct cpu_us=
er_regs *regs)
>      if ( ret )
>          return ret;
>
> -    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
> -        return ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitm=
ap_lo,
> -                               bitmap_hi);
> +    if ( FFA_ID_IS_SECURE(dest_id) )
> +    {
> +        if ( fw_notif_enabled )
> +            return ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0,
> +                                   bitmap_lo, bitmap_hi);
>
> -    return FFA_RET_NOT_SUPPORTED;
> +        return FFA_RET_NOT_SUPPORTED;
> +    }
> +
> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    return ffa_notif_update_vm_binding(ctx, dest_id,
> +                                       ((uint64_t)bitmap_hi << 32) | bit=
map_lo,
> +                                       false);
>  }
>
>  void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
> @@ -125,9 +193,10 @@ void ffa_handle_notification_info_get(struct cpu_use=
r_regs *regs)
>
>      if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
>      {
> -        notif_pending |=3D test_and_clear_bool(ctx->notif.vm_pending);
> -
>          spin_lock(&ctx->notif.notif_lock);
> +        if ( ctx->notif.vm_pending )
> +            notif_pending =3D true;
> +
>          if ( ctx->notif.hyp_pending )
>              notif_pending =3D true;
>          spin_unlock(&ctx->notif.notif_lock);
> @@ -497,10 +566,14 @@ void ffa_notif_init(void)
>  int ffa_notif_domain_init(struct domain *d)
>  {
>      struct ffa_ctx *ctx =3D d->arch.tee;
> +    unsigned int i;
>      int32_t res;
>
>      spin_lock_init(&ctx->notif.notif_lock);
>      ctx->notif.secure_pending =3D false;
> +    ctx->notif.vm_pending =3D 0;
> +    for ( i =3D 0; i < FFA_NUM_VM_NOTIF; i++ )
> +        ctx->notif.vm_bind[i] =3D 0;
>      ctx->notif.hyp_pending =3D 0;
>
>      if ( fw_notif_enabled )
> @@ -516,9 +589,13 @@ int ffa_notif_domain_init(struct domain *d)
>  void ffa_notif_domain_destroy(struct domain *d)
>  {
>      struct ffa_ctx *ctx =3D d->arch.tee;
> +    unsigned int i;
>
>      spin_lock(&ctx->notif.notif_lock);
>      ctx->notif.secure_pending =3D false;
> +    ctx->notif.vm_pending =3D 0;
> +    for ( i =3D 0; i < FFA_NUM_VM_NOTIF; i++ )
> +        ctx->notif.vm_bind[i] =3D 0;

Why not memset(ctx->notif.vm_bind, 0, sizeof(ctx->notif.vm_bind)?

>      ctx->notif.hyp_pending =3D 0;
>      spin_unlock(&ctx->notif.notif_lock);
>
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 5693772481ed..6d83afb3d00a 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -236,6 +236,11 @@
>  #define FFA_NOTIF_INFO_GET_ID_COUNT_MASK    0x1F
>
>  #define FFA_NOTIF_RX_BUFFER_FULL        BIT(0, U)
> +#define FFA_NUM_VM_NOTIF                64U
> +
> +#if FFA_NUM_VM_NOTIF > 64
> +#error "FFA_NUM_VM_NOTIF must be <=3D 64"
> +#endif

BUILD_BUG_ON(FFA_NUM_VM_NOTIF > 64) ?

Cheers,
Jens

>
>  /* Feature IDs used with FFA_FEATURES */
>  #define FFA_FEATURE_NOTIF_PEND_INTR     0x1U
> @@ -334,10 +339,14 @@ struct ffa_ctx_notif {
>      bool secure_pending;
>
>      /*
> -     * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
> -     * pending notifications from VMs (including framework ones).
> +     * Bitmap of pending notifications from VMs (including framework one=
s).
> +     */
> +    uint64_t vm_pending;
> +
> +    /*
> +     * Source endpoint bound to each VM notification ID (0 means unbound=
).
>       */
> -    bool vm_pending;
> +    uint16_t vm_bind[FFA_NUM_VM_NOTIF];
>
>      /*
>       * Lock protecting the hypervisor-managed notification state.
> --
> 2.53.0
>

