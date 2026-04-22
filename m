Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HreFXTV6GksQwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 16:04:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55331447095
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 16:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290631.1570184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFYBf-0003Yg-6g; Wed, 22 Apr 2026 14:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290631.1570184; Wed, 22 Apr 2026 14:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFYBf-0003XE-3u; Wed, 22 Apr 2026 14:04:19 +0000
Received: by outflank-mailman (input) for mailman id 1290631;
 Wed, 22 Apr 2026 14:04:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jens.wiklander@linaro.org>) id 1wFYBd-0003X8-8K
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 14:04:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFYBc-000rZB-Ks
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 16:04:16 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 69e8d557-e002-0a2a0a5209dd-0a2a4502d804-40
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 16:04:16 +0200
Received: from [209.85.161.41] (helo=mail-oo1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 69e8d55f-af86-0a2a45020019-d155a129e4d8-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 16:04:16 +0200
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-67e0d3f288aso3472587eaf.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 07:04:16 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1776866655; cv=none;
        d=google.com; s=arc-20240605;
        b=g5J3CY3eNpJci3mNW0sTvZ8cDVOXXcD7JfGDOMcqcweopxL4NPdmvnZebSlRc40fNG
         G8AIGLLn9H8NoM0qaI/6QwfHANoOdWwo937WXQh/jDNhSb4f5JOEjji5DiPPyYp1ikM9
         k1zdXOaxiImq/LNJdjxpxJu/NMJS9yiUnC2N/jbs7m6Ac1AplvPST4op9RFId6+xtBW/
         lNoGQf9UpoZGqZjwTPrz9QNGMZIszv7m2HaW7V8oP1AECziQjhd2yKO90ocn5GWOx1Oy
         sWwgQ1gQU7dJSdbVfkQjOAepipBpVmDNy7EOK4hbalkXeSuyEtGwePu5SDp19VkPP885
         0bYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SZbVa42LBrVIvv19c71FIcjtgICz5v6MXlpF0LMZ+PM=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=awT2RvHwDPA++jI3ltppRrn3Y//tyF9xjOKjGNQixWYyxfnf1b04om8S8SkvfDcgWN
         St2OQBj/a6k8lh/JG8g1mD399z3JLjKsXwS7AlEDLuO0d2KWI3iohJ1Ht+C4FTyEO4Hk
         LEvRGWjp2H63V6fhi2u+R661k2OWaWnFVxM4Cm1ElnjEkEg38GLMoxCvmawRjphfkXXP
         /Nn2O5cM2OKbtR0Z2WIjTXwrCfJHEJ3qD4+fZsTJWYFrEN8XkrD1/R3I6CWyjbirFpg7
         vuPP9cMw+TXVdVJ4CuUMR630ESzNEZv1x5lWsNEydM4pXAcAaupzyYQof4jT2cHP+X+N
         5ahA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776866655; x=1777471455; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZbVa42LBrVIvv19c71FIcjtgICz5v6MXlpF0LMZ+PM=;
        b=Y9cvFOBg19KypRBdpM2j1/XozVY43/RoTkOU9Sg/GgnJprgucnaHZk+pCXDksAC8Fm
         4ZWZRtZIcbsxTXv0YkL3VwSeQ1G1TJIIqXWcGqoKlKmtGrw9NKDnubUxP2v6IBMirycP
         Tg2f/ObXIyRzTdOuvvSTl5grqwmIqXt+CtgtgqJ3sBVMzdccudLwa365mhebQKRBSDG+
         yPcLTGCP6OQ5zTyfhC9D+Gvnku+tgFbHUb7AHgaknAxVWGmZXDB5tNuPEBB5P11Y0Gjn
         emK4mVGBwz4U2HFSf4+Z13Zg25uSP7KJL/jL43wOhsZv/zCLSj9fK/K14Dfd+VWV6vSc
         QWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776866655; x=1777471455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SZbVa42LBrVIvv19c71FIcjtgICz5v6MXlpF0LMZ+PM=;
        b=pCekpo/Lb6fujpUmMKz5jGuipXa47PhzLZRpe2ASRex1EopJUTsiqy3x4uwfgJ0tFO
         HuIdc7Goy8rnL8A8PImEWpG7mdPqpmyZkeOawTMF8I6qSJzfT1c9fuK1jHMskw5fG9aU
         hxlrczQvz0h99MrTRhCm95cq13MWUgIvr6hLNB3PcH0SPCuRnBUN+mK955Bwz4soKKjM
         6iGakPISJ/t0F2nwGtY6pDBsi8rlQ8aQ2HzueorgABZrVSu8QYQJceGI1j8Yn3w3Bc1g
         eSC3kVtoSE5t/sjj6YObfcJy/YgP9OUi+pwl1RFAqmFJm2pYH/7Ih1PQ8oT8ZBvNdoGi
         bAtg==
X-Gm-Message-State: AOJu0YyRiZK4V5FUisxLBAqgMnHLGG55NUzSRLBgbeFcBn9gypti/Fhi
	TaOKUPJ+df7LYiCY9NBRSEPXJbwW0Z0jhsxzJi0T0EMODTdN7DVtP6rdLJPdHT86bLisS7OM20I
	5wu0Qp9vTVp0/UUdhjIKYLmEiM29qP3IHAcBLc+wT2w==
X-Gm-Gg: AeBDiev6y09iTM8A+Sqo1bCIIlBONglznxuVl/pJfhUhQAJJYJaqBaXpqLzRKZtzuqG
	AvD+FnPVkw3R9QWyoFS/VZ8x7gen6al33+bqqQuscilg0F54a3iP2V2e8jKdUbH3y5DrspIsvp1
	Ptawl1cITGHi9YMENvz3Lc+oU9h0xy0A6Amoy2ya8XYerCIlYkGWqWiYRMrzVtqsCSIOg8YGDhS
	qixwk+pU0naesJ9oJNOubnWOM/E8lED45cpQ84Cm+sUnOUABNlyrfAn5/A14lx10PSUQpxfhq/8
	x1oaM7DrsCp+qKR5LysGicZmB5EMUNW9wk5EWTzmkgHGk3BD
X-Received: by 2002:a05:6820:8303:b0:694:852a:28b3 with SMTP id
 006d021491bc7-694852a2e8emr5169175eaf.10.1776866654463; Wed, 22 Apr 2026
 07:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776266307.git.bertrand.marquis@arm.com> <e85d0ef9733f091e09f520c2e0598f13cb7af06a.1776266307.git.bertrand.marquis@arm.com>
In-Reply-To: <e85d0ef9733f091e09f520c2e0598f13cb7af06a.1776266307.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 22 Apr 2026 16:04:02 +0200
X-Gm-Features: AQROBzD4LaPZwDV8-tF5y0H9VSwgHEF2ba1iT0SZO4NQVav6K5VQ7LXkYN-XrMI
Message-ID: <CAHUa44GbUQRfFzBqpAX94FSioYzT9tx5oP7C8fOvnWmMTV4-SQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] xen/arm: ffa: Deliver VM-to-VM notifications locally
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1776866656-80F7E161-D52F125B/0/0
X-purgate-type: clean
X-purgate-size: 13283
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 55331447095
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bertrand,

On Fri, Apr 17, 2026 at 3:41=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> VM notification binding and pending tracking exist for non-secure
> endpoints, but FFA_NOTIFICATION_SET still only forwards secure
> destinations to the SPMC. Non-secure VMs therefore cannot receive
> notifications from other VMs. Local NPI delivery also needs explicit
> re-arm tracking so repeated raises are not lost while the interrupt is
> already pending.
>
> Add a local VM notification delivery path for non-secure destinations.
> notification_set_vm() resolves the destination endpoint, verifies that
> every requested bit is bound to the sender, sets the receiver's
> vm_pending bitmap under notif_lock, and raises an NPI only when the
> receiver transitions from no local pending notifications to some.
>
> Track whether a local NPI is already armed with notif_irq_raised, clear
> that state once both VM and hypervisor pending bitmaps are drained, and
> roll back newly-added VM pending bits if no destination vCPU is online.
> Also expose firmware notification availability so FFA_FEATURES only
> advertises notification support when it is actually provided by the
> firmware or by CONFIG_FFA_VM_TO_VM.
>
> Functional impact: when CONFIG_FFA_VM_TO_VM is enabled, non-secure
> FFA_NOTIFICATION_SET delivers VM-to-VM notifications locally and keeps
> NPI delivery reliable across repeated raises.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa.c         |  24 +++++--
>  xen/arch/arm/tee/ffa_notif.c   | 126 +++++++++++++++++++++++++++++++--
>  xen/arch/arm/tee/ffa_private.h |  11 ++-
>  3 files changed, 147 insertions(+), 14 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 1fe33f26454a..7fe021049cba 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -39,8 +39,13 @@
>   * o FFA_MSG_SEND_DIRECT_REQ:
>   *   - only supported from a VM to an SP
>   * o FFA_NOTIFICATION_*:
> + *   - only supported when firmware notifications are enabled or VM-to-V=
M
> + *     support is built in
>   *   - only supports global notifications, that is, per vCPU notificatio=
ns
> - *     are not supported
> + *     are not supported and secure per-vCPU notification information is
> + *     not forwarded
> + *   - the source endpoint ID reported for a notification may no longer
> + *     exist by the time the receiver consumes it
>   *   - doesn't support signalling the secondary scheduler of pending
>   *     notification for secure partitions
>   *   - doesn't support notifications for Xen itself
> @@ -245,6 +250,8 @@ static void handle_features(struct cpu_user_regs *reg=
s)
>      uint32_t a1 =3D get_user_reg(regs, 1);
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
> +    bool notif_supported =3D IS_ENABLED(CONFIG_FFA_VM_TO_VM) ||
> +                           ffa_notif_fw_enabled();
>
>      /*
>       * FFA_FEATURES defines w2 as input properties only for specific
> @@ -343,10 +350,16 @@ static void handle_features(struct cpu_user_regs *r=
egs)
>
>          break;
>      case FFA_FEATURE_NOTIF_PEND_INTR:
> -        ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0);
> +        if ( notif_supported )
> +            ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>          break;
>      case FFA_FEATURE_SCHEDULE_RECV_INTR:
> -        ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_ID, 0);
> +        if ( notif_supported )
> +            ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_ID, =
0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>          break;
>      case FFA_PARTITION_INFO_GET_REGS:
>          if ( ACCESS_ONCE(ctx->guest_vers) >=3D FFA_VERSION_1_2 )
> @@ -361,7 +374,10 @@ static void handle_features(struct cpu_user_regs *re=
gs)
>      case FFA_NOTIFICATION_SET:
>      case FFA_NOTIFICATION_INFO_GET_32:
>      case FFA_NOTIFICATION_INFO_GET_64:
> -        ffa_set_regs_success(regs, 0, 0);
> +        if ( notif_supported )
> +            ffa_set_regs_success(regs, 0, 0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>          break;
>      default:
>          ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 4def701f0130..e77321244926 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -20,7 +20,12 @@ static bool __ro_after_init fw_notif_enabled;
>  static unsigned int __ro_after_init notif_sri_irq;
>  static DEFINE_SPINLOCK(notif_info_lock);
>
> -static void inject_notif_pending(struct domain *d)
> +bool ffa_notif_fw_enabled(void)
> +{
> +    return fw_notif_enabled;
> +}
> +
> +static bool inject_notif_pending(struct domain *d)
>  {
>      struct vcpu *v;
>
> @@ -34,13 +39,15 @@ static void inject_notif_pending(struct domain *d)
>          if ( is_vcpu_online(v) )
>          {
>              vgic_inject_irq(d, v, GUEST_FFA_NOTIF_PEND_INTR_ID, true);
> -            return;
> +            return true;
>          }
>      }
>
>      if ( printk_ratelimit() )
>          printk(XENLOG_G_DEBUG "%pd: ffa: can't inject NPI, all vCPUs off=
line\n",
>                 d);
> +
> +    return false;
>  }
>
>  static int32_t ffa_notif_parse_params(uint16_t dom_id, uint16_t caller_i=
d,
> @@ -104,6 +111,73 @@ out_unlock:
>      return ret;
>  }
>
> +/*
> + * Deliver a VM-to-VM notification. ctx->notif.notif_lock protects
> + * vm_bind/vm_pending so callers must not hold it already.
> + */
> +static int32_t notification_set_vm(uint16_t dst_id, uint16_t src_id,
> +                                   uint32_t flags, uint64_t bitmap)
> +{
> +    struct domain *dst_d;
> +    struct ffa_ctx *dst_ctx;
> +    unsigned int id;
> +    int32_t ret;
> +    uint64_t prev_bitmap =3D 0;
> +    uint64_t new_bitmap;
> +    bool inject =3D false;
> +
> +    if ( flags )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    ret =3D ffa_endpoint_domain_lookup(dst_id, &dst_d, &dst_ctx);
> +    if ( ret )
> +        return ret;
> +
> +    ret =3D FFA_RET_OK;
> +
> +    spin_lock(&dst_ctx->notif.notif_lock);
> +
> +    for ( id =3D 0; id < FFA_NUM_VM_NOTIF; id++ )
> +    {
> +        if ( !(bitmap & BIT(id, ULL)) )
> +            continue;
> +
> +        if ( dst_ctx->notif.vm_bind[id] !=3D src_id )
> +        {
> +            ret =3D FFA_RET_DENIED;
> +            goto out_unlock;
> +        }
> +    }
> +
> +    prev_bitmap =3D dst_ctx->notif.vm_pending;
> +    dst_ctx->notif.vm_pending |=3D bitmap;
> +    if ( !dst_ctx->notif.notif_irq_raised &&
> +         (dst_ctx->notif.vm_pending || dst_ctx->notif.hyp_pending) )
> +    {
> +        dst_ctx->notif.notif_irq_raised =3D true;
> +        inject =3D true;
> +    }
> +
> +out_unlock:
> +    spin_unlock(&dst_ctx->notif.notif_lock);
> +
> +    new_bitmap =3D bitmap & ~prev_bitmap;
> +    if ( ret =3D=3D FFA_RET_OK && inject && new_bitmap &&
> +         !inject_notif_pending(dst_d) )
> +    {
> +        spin_lock(&dst_ctx->notif.notif_lock);
> +        dst_ctx->notif.vm_pending &=3D ~new_bitmap;

There's a window above when dst_ctx->notif.notif_lock is unlocked.
What if another CPU has modified dst_ctx->notif.vm_pending during that
window?

Cheers,
Jens

> +        if ( !(dst_ctx->notif.vm_pending || dst_ctx->notif.hyp_pending) =
)
> +            dst_ctx->notif.notif_irq_raised =3D false;
> +        spin_unlock(&dst_ctx->notif.notif_lock);
> +        ret =3D FFA_RET_DENIED;
> +    }
> +
> +    rcu_unlock_domain(dst_d);
> +
> +    return ret;
> +}
> +
>  int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
>  {
>      struct domain *d =3D current->domain;
> @@ -285,6 +359,8 @@ void ffa_handle_notification_get(struct cpu_user_regs=
 *regs)
>
>      if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
>      {
> +        bool pending;
> +
>          spin_lock(&ctx->notif.notif_lock);
>
>          if ( (flags & FFA_NOTIF_FLAG_BITMAP_HYP) && ctx->notif.hyp_pendi=
ng )
> @@ -293,6 +369,18 @@ void ffa_handle_notification_get(struct cpu_user_reg=
s *regs)
>              ctx->notif.hyp_pending =3D 0;
>          }
>
> +        if ( (flags & FFA_NOTIF_FLAG_BITMAP_VM) && ctx->notif.vm_pending=
 )
> +        {
> +            w4 =3D (uint32_t)(ctx->notif.vm_pending & GENMASK(31, 0));
> +            w5 =3D (uint32_t)((ctx->notif.vm_pending >> 32) & GENMASK(31=
, 0));
> +            ctx->notif.vm_pending =3D 0;
> +        }
> +
> +        pending =3D (ctx->notif.hyp_pending !=3D 0) ||
> +                  (ctx->notif.vm_pending !=3D 0);
> +        if ( !pending )
> +            ctx->notif.notif_irq_raised =3D false;
> +
>          spin_unlock(&ctx->notif.notif_lock);
>      }
>
> @@ -318,9 +406,17 @@ int32_t ffa_handle_notification_set(struct cpu_user_=
regs *regs)
>      if ( flags )
>          return FFA_RET_INVALID_PARAMETERS;
>
> -    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
> -        return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bit=
map_lo,
> -                               bitmap_hi);
> +    if ( FFA_ID_IS_SECURE(dest_id) )
> +    {
> +        if ( fw_notif_enabled )
> +            return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags,
> +                                   bitmap_lo, bitmap_hi);
> +    }
> +    else if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +    {
> +        return notification_set_vm(dest_id, caller_id, flags,
> +                                   ((uint64_t)bitmap_hi << 32) | bitmap_=
lo);
> +    }
>
>      return FFA_RET_NOT_SUPPORTED;
>  }
> @@ -330,6 +426,7 @@ void ffa_raise_rx_buffer_full(struct domain *d)
>  {
>      struct ffa_ctx *ctx =3D d->arch.tee;
>      uint32_t prev_bitmap;
> +    bool inject =3D false;
>
>      if ( !ctx )
>          return;
> @@ -337,10 +434,23 @@ void ffa_raise_rx_buffer_full(struct domain *d)
>      spin_lock(&ctx->notif.notif_lock);
>      prev_bitmap =3D ctx->notif.hyp_pending;
>      ctx->notif.hyp_pending |=3D FFA_NOTIF_RX_BUFFER_FULL;
> +    if ( !ctx->notif.notif_irq_raised &&
> +         (ctx->notif.vm_pending || ctx->notif.hyp_pending) )
> +    {
> +        ctx->notif.notif_irq_raised =3D true;
> +        inject =3D true;
> +    }
>      spin_unlock(&ctx->notif.notif_lock);
>
> -    if ( !(prev_bitmap & FFA_NOTIF_RX_BUFFER_FULL) )
> -        inject_notif_pending(d);
> +    if ( inject && !(prev_bitmap & FFA_NOTIF_RX_BUFFER_FULL) &&
> +         !inject_notif_pending(d) )
> +    {
> +        spin_lock(&ctx->notif.notif_lock);
> +        ctx->notif.hyp_pending &=3D ~FFA_NOTIF_RX_BUFFER_FULL;
> +        if ( !(ctx->notif.vm_pending || ctx->notif.hyp_pending) )
> +            ctx->notif.notif_irq_raised =3D false;
> +        spin_unlock(&ctx->notif.notif_lock);
> +    }
>  }
>  #endif
>
> @@ -572,6 +682,7 @@ int ffa_notif_domain_init(struct domain *d)
>      spin_lock_init(&ctx->notif.notif_lock);
>      ctx->notif.secure_pending =3D false;
>      ctx->notif.vm_pending =3D 0;
> +    ctx->notif.notif_irq_raised =3D false;
>      for ( i =3D 0; i < FFA_NUM_VM_NOTIF; i++ )
>          ctx->notif.vm_bind[i] =3D 0;
>      ctx->notif.hyp_pending =3D 0;
> @@ -594,6 +705,7 @@ void ffa_notif_domain_destroy(struct domain *d)
>      spin_lock(&ctx->notif.notif_lock);
>      ctx->notif.secure_pending =3D false;
>      ctx->notif.vm_pending =3D 0;
> +    ctx->notif.notif_irq_raised =3D false;
>      for ( i =3D 0; i < FFA_NUM_VM_NOTIF; i++ )
>          ctx->notif.vm_bind[i] =3D 0;
>      ctx->notif.hyp_pending =3D 0;
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 6d83afb3d00a..5bb19bd11dd0 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -344,13 +344,17 @@ struct ffa_ctx_notif {
>      uint64_t vm_pending;
>
>      /*
> -     * Source endpoint bound to each VM notification ID (0 means unbound=
).
> +     * Tracks whether an NPI has been raised for local pending notificat=
ions.
> +     * Protected by notif_lock.
>       */
> -    uint16_t vm_bind[FFA_NUM_VM_NOTIF];
> +    bool notif_irq_raised;
>
>      /*
> -     * Lock protecting the hypervisor-managed notification state.
> +     * Source endpoint bound to each VM notification ID (0 means unbound=
).
>       */
> +    uint16_t vm_bind[FFA_NUM_VM_NOTIF];
> +
> +    /* Lock protecting local notification state. */
>      spinlock_t notif_lock;
>
>      /*
> @@ -493,6 +497,7 @@ void ffa_notif_init(void);
>  void ffa_notif_init_interrupt(void);
>  int ffa_notif_domain_init(struct domain *d);
>  void ffa_notif_domain_destroy(struct domain *d);
> +bool ffa_notif_fw_enabled(void);
>
>  int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs);
>  int32_t ffa_handle_notification_unbind(struct cpu_user_regs *regs);
> --
> 2.53.0
>

