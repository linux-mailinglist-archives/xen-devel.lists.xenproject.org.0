Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOdrAuW2+WmNBAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 11:22:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A9F4C9883
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 11:22:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300404.1574939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKByo-0003yK-EP; Tue, 05 May 2026 09:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300404.1574939; Tue, 05 May 2026 09:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKByo-0003wC-8k; Tue, 05 May 2026 09:22:14 +0000
Received: by outflank-mailman (input) for mailman id 1300404;
 Tue, 05 May 2026 09:22:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jens.wiklander@linaro.org>) id 1wKByn-0003w6-2W
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 09:22:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKBym-005KFX-Ee
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 11:22:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 69f9b6af-e002-0a2a0a5209dd-0a2a45079eba-36
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 11:22:12 +0200
Received: from [209.85.160.54] (helo=mail-oa1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 69f9b6c3-229c-0a2a45070019-d155a036c589-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 11:22:12 +0200
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-4232323a7daso1875815fac.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 02:22:11 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1777972930; cv=none;
        d=google.com; s=arc-20240605;
        b=A/dEKqpTmqOy9MnOG16YKWoUnkVKgc7MkorRydrIc+gJxM2tLZ6hDtaPxtVH5noF12
         h+hU3F9PLp4ohDoq5lWOgQKCGDc9sqc75G/TkaNwLWeg0rciPrJv5ApyHvuiPpatdArx
         bAj+1EIcAJJzUQVRo1cL+4qM4TyhVP/TWikafTuwAYV2iQf4MPsoVkBTO305k1QEp0fm
         xJwYR29JNeQE+kEVZ2pbLiXPJUikkQv2BV26qMQoWakPIg+ukRuB5jegm0RQ8XC/6jSA
         cLLuQUBsv6ATqNqO7miLvXc6pOn3Swydk0DpHrH2k8ctyMs3v8kHvJ4YEolxwkAPHvDx
         ZGnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bF2MhqEkmPDfOhZHwctv0kDz2MF4bZE20UsKIaTdzEM=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=XDnfQJYWadJ4jtutVAFepRlB32nhhDXnWaHd48Jcad/6Ombi0zYF/GCS54AtpyUS8K
         Q+cxmiosDHXrsPjZzDL+WNqsVSd2Tc+jPxsTiwUOxK/ABFy9ucKcEmv5MOSAcASa6fY7
         1QWEesae8XOEsciSG2FD3gSe2PLWVzIIWzLD7dx1GIlK9b5N/qsywhlKOULlFyhTRt1c
         fU3S+SkBfLliD1hRpn7XYV3FfxEuCW7ldNFMOdiZnzcdaz2M+uGEJJCsUBmlAB2ux3wF
         jyar47eNHA9A3CBg5m5QxyVgnlBifTaE68FoVbU4YtGim13SyURxzPXxlzo5dOkCMw79
         GN+g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777972930; x=1778577730; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF2MhqEkmPDfOhZHwctv0kDz2MF4bZE20UsKIaTdzEM=;
        b=nUz4D8jT7jEcu0Pv8i3/r1z7HZ601LFDX/jC/xtpucVuCi2jwRNt+IBxPDX2zl8mTl
         4PBX+8KuFAoHYeIvp0FUfPIvI3HHUWicdcgD0SZxXnkyWc7oZoXLrt6NKES1UASdf+MX
         XhaTi30Q8V12b/m70W4UVdvE09CQo60RWYJiN4lk+i4IKByR7fH5NtBEy+1pjiYDoKtF
         fl1TS0t7xRw97i0EipfynP37kbmcYdHN/n00JLqDFof3B/XzCu5NQzus8Liys7UqKDUj
         UGEGuGyFV2GJlDLl4E0ONlHoz6dvDOwLtn3cRGYKc3ycNtMeopj/y/YSPMRFomhCr3Xn
         ysHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777972930; x=1778577730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bF2MhqEkmPDfOhZHwctv0kDz2MF4bZE20UsKIaTdzEM=;
        b=cGji5GxUdwLgMeq97inu9NMmlE6XDnAjY4IqjYTtBqfq9ByzOUS73EqSWSJ+L+4tFB
         qQM2XWVa+AcSWX3BJp5Kp2GLL3V02zPdGzSb+GdEb68lls23cstPVrwT2jSuRC61fNTr
         5kxsrQEDa/mzjf2oM7wVcosZUkTsT+QVfzKupctRWE/v6lq7QxQ0Pei4b3kiHZR2XvB8
         e/8uxfxPPSOGO4VDQaWAh/iuaYoA9EiX/3bYOZEwIVGRNEWA/FUMyV6EpidGB7q5M1cI
         9jfTO66zA5wAqp7Dzlzq9gZHqarg/bhOxvyHF2BwovZEf1SjEiJqSOxsoDVdePn4aqU3
         msSw==
X-Gm-Message-State: AOJu0YwhNruBu8cN9OI/jQguVtBE4Py+m9o99tuBhz4+NYbeVDMfaqdG
	TreTOEcS3XcsrxhjA8OE1CyXMl65ujF195AZoEJrFSnd62nHZbhR2bagl7XV3h/iN5RFbUBkWfP
	Ne5VqhmbO585trlw9GrJ0G9UMzR5lBnBru/hGiRDhdg==
X-Gm-Gg: AeBDievB2V04ayCnz9mBBqPWVMa1ud5VEfcACPg6YGUW/NKMiRZuksven2thuSC5zmU
	ipJiXkV7VEfP3UDK5oPoG/960lzHTToh2QFTdSilkX1e2mLiQ+OfkBFoHXpvQvBQpJBuiL3AOZu
	oTt0861wzJEHSHwj/A1YTmSjuf6RKBQwNah3S9nGgAW807S66TifC0UczrB1zl9esVSxARbqt3g
	bvNrdIHgoI6urp2PrwrsqDrfNsM/GURyGTLaCtFDoeo1XAPjRUyysaxDDdz1hRxFn4QCbxgw9qA
	/XjSpfRju6oik0g8UUBooFjj08k+k1oQ9BQxvU218vL+fh0+
X-Received: by 2002:a05:6871:829:b0:434:2752:34db with SMTP id
 586e51a60fabf-434d3f64953mr1256227fac.5.1777972930369; Tue, 05 May 2026
 02:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776955622.git.bertrand.marquis@arm.com> <1ead2af7182a0501f16e7b4e9ad3e58ccd8f538c.1776955622.git.bertrand.marquis@arm.com>
In-Reply-To: <1ead2af7182a0501f16e7b4e9ad3e58ccd8f538c.1776955622.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 5 May 2026 11:21:57 +0200
X-Gm-Features: AVHnY4IxbheL-Y6kED6xjiouZiMz263rlg7LJlyow8jkhaTaKdqkJ3po73KqXvQ
Message-ID: <CAHUa44ES1LD6wgDic8Y6zm7+AzWFg6x7pSZhY6NkneW3mse+wA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] xen/arm: ffa: Deliver VM-to-VM notifications locally
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1777972932-16062C48-9F58A8FB/0/0
X-purgate-type: clean
X-purgate-size: 10679
X-Rspamd-Queue-Id: 63A9F4C9883
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]

Hi Bertrand,

On Wed, Apr 29, 2026 at 7:44=E2=80=AFAM Bertrand Marquis
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
> vm_pending bitmap under notif_lock, and raises an NPI only when local
> pending state is not already armed.
>
> Track whether a local NPI is already armed with notif_irq_raised,
> clear that state once both VM and hypervisor pending bitmaps are
> drained, and keep notif_lock held across the VM notification injection
> attempt. If no destination vCPU is online, leave the pending bits set
> and keep notif_irq_raised clear so delivery can be retried later.
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
> Changes since v1:
> - serialize notification_set_vm() state updates with the NPI attempt
> - keep pending VM notifications set when local injection fails
> ---
>  xen/arch/arm/tee/ffa.c         | 24 ++++++++--
>  xen/arch/arm/tee/ffa_notif.c   | 82 ++++++++++++++++++++++++++++++++--
>  xen/arch/arm/tee/ffa_private.h | 17 ++++---
>  3 files changed, 107 insertions(+), 16 deletions(-)
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
> index a841c8f8d747..b29d948a7110 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -21,6 +21,11 @@ static bool __ro_after_init fw_notif_enabled;
>  static unsigned int __ro_after_init notif_sri_irq;
>  static DEFINE_SPINLOCK(notif_info_lock);
>
> +bool ffa_notif_fw_enabled(void)
> +{
> +    return fw_notif_enabled;
> +}
> +
>  static bool inject_notif_pending(struct domain *d)
>  {
>      struct vcpu *v;
> @@ -107,6 +112,55 @@ out_unlock:
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
> +    dst_ctx->notif.vm_pending |=3D bitmap;
> +    if ( !dst_ctx->notif.notif_irq_raised &&
> +         (dst_ctx->notif.vm_pending || dst_ctx->notif.hyp_pending) &&
> +         inject_notif_pending(dst_d) )
> +        dst_ctx->notif.notif_irq_raised =3D true;
> +
> +out_unlock:
> +    spin_unlock(&dst_ctx->notif.notif_lock);
> +
> +    rcu_unlock_domain(dst_d);
> +
> +    return ret;
> +}
> +
>  int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
>  {
>      struct domain *d =3D current->domain;
> @@ -288,6 +342,8 @@ void ffa_handle_notification_get(struct cpu_user_regs=
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
> @@ -298,6 +354,18 @@ void ffa_handle_notification_get(struct cpu_user_reg=
s *regs)
>                  ctx->notif.notif_irq_raised =3D false;
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

This seems to take care of clearing notif_irq_raised for all cases. Do
we still need the one just above this block (copied here):
            if ( !ctx->notif.vm_pending )
                ctx->notif.notif_irq_raised =3D false;
?

Cheers,
Jens

> +
>          spin_unlock(&ctx->notif.notif_lock);
>      }
>
> @@ -323,9 +391,17 @@ int32_t ffa_handle_notification_set(struct cpu_user_=
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
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 78a0a9815d56..923a071a9d7c 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -340,20 +340,18 @@ struct ffa_ctx_notif {
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
> -    spinlock_t notif_lock;
> +    uint16_t vm_bind[FFA_NUM_VM_NOTIF];
>
> -    /*
> -     * Tracks whether a local notification pending interrupt was raised.
> -     * Protected by notif_lock.
> -     */
> -    bool notif_irq_raised;
> +    /* Lock protecting local notification state. */
> +    spinlock_t notif_lock;
>
>      /*
>       * Bitmap of pending hypervisor notifications (for HYP bitmap querie=
s).
> @@ -495,6 +493,7 @@ void ffa_notif_init(void);
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

