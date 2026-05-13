Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCIODO8RBGoMDAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 07:53:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B6D52DCF7
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 07:53:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307591.1579200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN2XL-0004qX-Gs; Wed, 13 May 2026 05:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307591.1579200; Wed, 13 May 2026 05:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN2XL-0004p3-DO; Wed, 13 May 2026 05:53:39 +0000
Received: by outflank-mailman (input) for mailman id 1307591;
 Wed, 13 May 2026 05:53:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jens.wiklander@linaro.org>) id 1wN2XJ-0004ox-Rr
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 05:53:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN2XJ-005vV7-8o
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 07:53:37 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 6a0411cf-e002-0a2a0a5209dd-0a2a4504c82c-32
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 07:53:37 +0200
Received: from [209.85.160.43] (helo=mail-oa1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 6a0411df-1dec-0a2a45040019-d155a02bcc2a-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 07:53:36 +0200
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-4042905015cso4895160fac.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 22:53:36 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1778651615; cv=none;
        d=google.com; s=arc-20240605;
        b=AiuQYGgSJrwNIn19LKXgFdXCA8H+HokE8iRz3j0LAn6t+tzgdfD5nkogyPodRs3q/A
         IEMi/bNc8T2BecSFfv+mz9I0iin0AJaTZhORkMKVt4PNz14m1yQzGk4B4f3TLVOGAtQc
         Jx+IWIsD4/Oof+/IaoYSm/uZMMbE7/sU7d4MEPKX48MAUIDjzcfHWCO6MrwGQ98mlIX/
         LV23KnmbnkFCAsKTlgyjwZ5YRKV15rEe0UiQkF0PfybbUDxYdXw6VCEXaU3h5Az2nIyE
         VqPQ5Ec9eFhzLPLC6j2qcZ/hYCtO9RfFXg9kr8XhDa6D8gYkVKRncCNRGqK1v6fbMEyK
         1hEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Pc1uggmRTA2DwslDfcvnBBkST/j89rI3aeF6qhsmnc=;
        fh=wB0f5JGUSpWYejuxtnrl8SDqvqyWrEsEaWvC32LbdiU=;
        b=HaiQa9uYOi7AePSutIIN+SjG/RHxJ2EvYSLr8zOHIL7E4jEANPV3eR4Uc5fjBJsLqU
         khmd5lv81mOLaurIYBHw7FRzRTjftCEi9kswQugZ8J1yqbpFU/IZxl/9q9zMcyXQp/mw
         BxTrfnf4PM8gOqmE0opbPfTL+96OWbZebPsXccJsdUXmukgDw/MJXX7gp/nPYvK6TnEC
         eG0IifDG6Dyqejm+JSNJPp0EriJ7BoR9E9be+dF+jbo7a6PCJHhZSOJoJ7qD8I+SpSPA
         8ksxv982WOC2MRPNC6eGZFNuGNOmh+h1pQyV0OIYirV2paCeoQ62+xthUE5LjV1fslNz
         8e3Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778651615; x=1779256415; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Pc1uggmRTA2DwslDfcvnBBkST/j89rI3aeF6qhsmnc=;
        b=xSS7pjeUA2a3hlizDAwTmCe1mys9fcl+OWAZQ4k8vgLmlWJt6QXbYlHPg1I5VdaIDR
         tQvveRJujZ4ysWsWcs2dqDjJGh7KuJZmLt5DG6vnkDp30y9lTUuP9lSN2CTY4+pAWxdu
         3MFy4jUP0M7LqiTBswvh1Ixhe5kKXxy9D7D3NSYkjwZHzFeemoDcyKomnf3w9SqIuZi1
         ulWbQ4TRxOc4o6H0at2cGI0C1fgJysd+BdoAtPzLpRYd+ZV2P2FqmKfwM/ZnS2+bvQyR
         VzTaO082cnh8/xLfaNNZiugSDo7W5B/gh1n7bFdnnIPofLB2qYr9gJwTJuW/f3rWP+/3
         hAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778651615; x=1779256415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Pc1uggmRTA2DwslDfcvnBBkST/j89rI3aeF6qhsmnc=;
        b=HXexZ98e6gdRpCqSi3ZqxrVXQjtfn6/gZByRNyZRhBKVNP9w6Y2Gy1ENpLGHQFyYWn
         1JodiO/zZDvAV8Aim43F5zokNoOdIL3SuqnsWk+AWBD3d0FhT3oIVpVLrDCPr1es9Tqp
         UHItBPItzn8hpBXKAL8/WYU27lXufnZ+blD/SyFhvYP4p1SAjkoiU+0JGRqF2YR9r/yO
         /fv72jHrsMCkmOfAwEmVXwI9BLlR7CKXSK0rF69aMtSZ0ZDJG72BJ72vKnQ4iWOo8SjV
         vuqioI4dguYLg81+Pm8k/k47cuBI5vPREbg57Sk5X3VDyqX2sQxH19r9xrtkGWo7woaD
         iA5A==
X-Gm-Message-State: AOJu0Yzggf8Tz4i1UFMjSZIldjv66Lv//iuG/efvoHnIeXYRpWaYfVY8
	SgBJnxiJA+D0UjNhrSPThlUcEM1FS/1zf3vaac+RAtaVccnkHN5Sm+Akp7YgPTlaxkyON0sXLvW
	MGq5ZVz3OjQb/U/RDGfoF4f9tOvkiCCET9KG2ogjP7w==
X-Gm-Gg: Acq92OF4onwvpi85HqZJ6YRXe7ebkV0Oe5QR41BYq72bqHys7auhi81O23uk/r8Mktl
	cEQ5ZzNosoIWVc+tQt2ijwAdOPI39eK63iGlxtLtxcM/S12SpNcE2SJawu5VV5eFqUz3qVFZ9Yt
	T/UcaZXuapoY4ucU2evNJfAYoGfln/47MA9YfS4dkpbFTwLVA9M4d286NDPi3ap8Waqx7wh6djL
	RjR8lTVYHsDi706nAqcnW/EGnF9deABgCt7fV8W2ert+LZMQmSOK2bKNOHwXDHouN14Gc1gOUJN
	KQQTsRa/MazEB3pCtQe7q2Uaw9VFmp9SSk/9CA==
X-Received: by 2002:a05:6870:2e0b:b0:430:1519:5cf7 with SMTP id
 586e51a60fabf-439ce106332mr1129014fac.14.1778651614736; Tue, 12 May 2026
 22:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776955622.git.bertrand.marquis@arm.com>
 <1ead2af7182a0501f16e7b4e9ad3e58ccd8f538c.1776955622.git.bertrand.marquis@arm.com>
 <CAHUa44ES1LD6wgDic8Y6zm7+AzWFg6x7pSZhY6NkneW3mse+wA@mail.gmail.com> <109D53DA-85D7-4AA5-BBB1-F54DF529BA8D@arm.com>
In-Reply-To: <109D53DA-85D7-4AA5-BBB1-F54DF529BA8D@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 13 May 2026 07:53:23 +0200
X-Gm-Features: AVHnY4In8dqg6cLibmw3h9X9c5XFn51UMHigSTRhtcPOk9mPT4p3t68Pzg_54gU
Message-ID: <CAHUa44EoJQMXf-+XF0bx_xWAopGnbt=K5j7D39TAhAVgMEFn6w@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] xen/arm: ffa: Deliver VM-to-VM notifications locally
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1778651616-29F7D3FF-8A44E5E3/0/0
X-purgate-type: clean
X-purgate-size: 11828
X-Rspamd-Queue-Id: 89B6D52DCF7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,arm.com:email,linaro.org:email,linaro.org:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Hi Bertrand,

On Mon, May 11, 2026 at 3:17=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 5 May 2026, at 11:21, Jens Wiklander <jens.wiklander@linaro.org> wro=
te:
> >
> > Hi Bertrand,
> >
> > On Wed, Apr 29, 2026 at 7:44=E2=80=AFAM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> VM notification binding and pending tracking exist for non-secure
> >> endpoints, but FFA_NOTIFICATION_SET still only forwards secure
> >> destinations to the SPMC. Non-secure VMs therefore cannot receive
> >> notifications from other VMs. Local NPI delivery also needs explicit
> >> re-arm tracking so repeated raises are not lost while the interrupt is
> >> already pending.
> >>
> >> Add a local VM notification delivery path for non-secure destinations.
> >> notification_set_vm() resolves the destination endpoint, verifies that
> >> every requested bit is bound to the sender, sets the receiver's
> >> vm_pending bitmap under notif_lock, and raises an NPI only when local
> >> pending state is not already armed.
> >>
> >> Track whether a local NPI is already armed with notif_irq_raised,
> >> clear that state once both VM and hypervisor pending bitmaps are
> >> drained, and keep notif_lock held across the VM notification injection
> >> attempt. If no destination vCPU is online, leave the pending bits set
> >> and keep notif_irq_raised clear so delivery can be retried later.
> >> Also expose firmware notification availability so FFA_FEATURES only
> >> advertises notification support when it is actually provided by the
> >> firmware or by CONFIG_FFA_VM_TO_VM.
> >>
> >> Functional impact: when CONFIG_FFA_VM_TO_VM is enabled, non-secure
> >> FFA_NOTIFICATION_SET delivers VM-to-VM notifications locally and keeps
> >> NPI delivery reliable across repeated raises.
> >>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> Changes since v1:
> >> - serialize notification_set_vm() state updates with the NPI attempt
> >> - keep pending VM notifications set when local injection fails
> >> ---
> >> xen/arch/arm/tee/ffa.c         | 24 ++++++++--
> >> xen/arch/arm/tee/ffa_notif.c   | 82 ++++++++++++++++++++++++++++++++--
> >> xen/arch/arm/tee/ffa_private.h | 17 ++++---
> >> 3 files changed, 107 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >> index 1fe33f26454a..7fe021049cba 100644
> >> --- a/xen/arch/arm/tee/ffa.c
> >> +++ b/xen/arch/arm/tee/ffa.c
> >> @@ -39,8 +39,13 @@
> >>  * o FFA_MSG_SEND_DIRECT_REQ:
> >>  *   - only supported from a VM to an SP
> >>  * o FFA_NOTIFICATION_*:
> >> + *   - only supported when firmware notifications are enabled or VM-t=
o-VM
> >> + *     support is built in
> >>  *   - only supports global notifications, that is, per vCPU notificat=
ions
> >> - *     are not supported
> >> + *     are not supported and secure per-vCPU notification information=
 is
> >> + *     not forwarded
> >> + *   - the source endpoint ID reported for a notification may no long=
er
> >> + *     exist by the time the receiver consumes it
> >>  *   - doesn't support signalling the secondary scheduler of pending
> >>  *     notification for secure partitions
> >>  *   - doesn't support notifications for Xen itself
> >> @@ -245,6 +250,8 @@ static void handle_features(struct cpu_user_regs *=
regs)
> >>     uint32_t a1 =3D get_user_reg(regs, 1);
> >>     struct domain *d =3D current->domain;
> >>     struct ffa_ctx *ctx =3D d->arch.tee;
> >> +    bool notif_supported =3D IS_ENABLED(CONFIG_FFA_VM_TO_VM) ||
> >> +                           ffa_notif_fw_enabled();
> >>
> >>     /*
> >>      * FFA_FEATURES defines w2 as input properties only for specific
> >> @@ -343,10 +350,16 @@ static void handle_features(struct cpu_user_regs=
 *regs)
> >>
> >>         break;
> >>     case FFA_FEATURE_NOTIF_PEND_INTR:
> >> -        ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0);
> >> +        if ( notif_supported )
> >> +            ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, =
0);
> >> +        else
> >> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >>         break;
> >>     case FFA_FEATURE_SCHEDULE_RECV_INTR:
> >> -        ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_ID, 0=
);
> >> +        if ( notif_supported )
> >> +            ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_I=
D, 0);
> >> +        else
> >> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >>         break;
> >>     case FFA_PARTITION_INFO_GET_REGS:
> >>         if ( ACCESS_ONCE(ctx->guest_vers) >=3D FFA_VERSION_1_2 )
> >> @@ -361,7 +374,10 @@ static void handle_features(struct cpu_user_regs =
*regs)
> >>     case FFA_NOTIFICATION_SET:
> >>     case FFA_NOTIFICATION_INFO_GET_32:
> >>     case FFA_NOTIFICATION_INFO_GET_64:
> >> -        ffa_set_regs_success(regs, 0, 0);
> >> +        if ( notif_supported )
> >> +            ffa_set_regs_success(regs, 0, 0);
> >> +        else
> >> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >>         break;
> >>     default:
> >>         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif=
.c
> >> index a841c8f8d747..b29d948a7110 100644
> >> --- a/xen/arch/arm/tee/ffa_notif.c
> >> +++ b/xen/arch/arm/tee/ffa_notif.c
> >> @@ -21,6 +21,11 @@ static bool __ro_after_init fw_notif_enabled;
> >> static unsigned int __ro_after_init notif_sri_irq;
> >> static DEFINE_SPINLOCK(notif_info_lock);
> >>
> >> +bool ffa_notif_fw_enabled(void)
> >> +{
> >> +    return fw_notif_enabled;
> >> +}
> >> +
> >> static bool inject_notif_pending(struct domain *d)
> >> {
> >>     struct vcpu *v;
> >> @@ -107,6 +112,55 @@ out_unlock:
> >>     return ret;
> >> }
> >>
> >> +/*
> >> + * Deliver a VM-to-VM notification. ctx->notif.notif_lock protects
> >> + * vm_bind/vm_pending so callers must not hold it already.
> >> + */
> >> +static int32_t notification_set_vm(uint16_t dst_id, uint16_t src_id,
> >> +                                   uint32_t flags, uint64_t bitmap)
> >> +{
> >> +    struct domain *dst_d;
> >> +    struct ffa_ctx *dst_ctx;
> >> +    unsigned int id;
> >> +    int32_t ret;
> >> +
> >> +    if ( flags )
> >> +        return FFA_RET_INVALID_PARAMETERS;
> >> +
> >> +    ret =3D ffa_endpoint_domain_lookup(dst_id, &dst_d, &dst_ctx);
> >> +    if ( ret )
> >> +        return ret;
> >> +
> >> +    ret =3D FFA_RET_OK;
> >> +
> >> +    spin_lock(&dst_ctx->notif.notif_lock);
> >> +
> >> +    for ( id =3D 0; id < FFA_NUM_VM_NOTIF; id++ )
> >> +    {
> >> +        if ( !(bitmap & BIT(id, ULL)) )
> >> +            continue;
> >> +
> >> +        if ( dst_ctx->notif.vm_bind[id] !=3D src_id )
> >> +        {
> >> +            ret =3D FFA_RET_DENIED;
> >> +            goto out_unlock;
> >> +        }
> >> +    }
> >> +
> >> +    dst_ctx->notif.vm_pending |=3D bitmap;
> >> +    if ( !dst_ctx->notif.notif_irq_raised &&
> >> +         (dst_ctx->notif.vm_pending || dst_ctx->notif.hyp_pending) &&
> >> +         inject_notif_pending(dst_d) )
> >> +        dst_ctx->notif.notif_irq_raised =3D true;
> >> +
> >> +out_unlock:
> >> +    spin_unlock(&dst_ctx->notif.notif_lock);
> >> +
> >> +    rcu_unlock_domain(dst_d);
> >> +
> >> +    return ret;
> >> +}
> >> +
> >> int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
> >> {
> >>     struct domain *d =3D current->domain;
> >> @@ -288,6 +342,8 @@ void ffa_handle_notification_get(struct cpu_user_r=
egs *regs)
> >>
> >>     if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> >>     {
> >> +        bool pending;
> >> +
> >>         spin_lock(&ctx->notif.notif_lock);
> >>
> >>         if ( (flags & FFA_NOTIF_FLAG_BITMAP_HYP) && ctx->notif.hyp_pen=
ding )
> >> @@ -298,6 +354,18 @@ void ffa_handle_notification_get(struct cpu_user_=
regs *regs)
> >>                 ctx->notif.notif_irq_raised =3D false;
> >>         }
> >>
> >> +        if ( (flags & FFA_NOTIF_FLAG_BITMAP_VM) && ctx->notif.vm_pend=
ing )
> >> +        {
> >> +            w4 =3D (uint32_t)(ctx->notif.vm_pending & GENMASK(31, 0))=
;
> >> +            w5 =3D (uint32_t)((ctx->notif.vm_pending >> 32) & GENMASK=
(31, 0));
> >> +            ctx->notif.vm_pending =3D 0;
> >> +        }
> >> +
> >> +        pending =3D (ctx->notif.hyp_pending !=3D 0) ||
> >> +                  (ctx->notif.vm_pending !=3D 0);
> >> +        if ( !pending )
> >> +            ctx->notif.notif_irq_raised =3D false;
> >
> > This seems to take care of clearing notif_irq_raised for all cases. Do
> > we still need the one just above this block (copied here):
> >            if ( !ctx->notif.vm_pending )
> >                ctx->notif.notif_irq_raised =3D false;
> > ?
>
> Yes you are right, this is now redundant.
> I will drop it in v3.

Good, thanks.

Cheers,
Jens

>
> Cheers
> Bertrand
>
> >
> > Cheers,
> > Jens
> >
> >> +
> >>         spin_unlock(&ctx->notif.notif_lock);
> >>     }
> >>
> >> @@ -323,9 +391,17 @@ int32_t ffa_handle_notification_set(struct cpu_us=
er_regs *regs)
> >>     if ( flags )
> >>         return FFA_RET_INVALID_PARAMETERS;
> >>
> >> -    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
> >> -        return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, =
bitmap_lo,
> >> -                               bitmap_hi);
> >> +    if ( FFA_ID_IS_SECURE(dest_id) )
> >> +    {
> >> +        if ( fw_notif_enabled )
> >> +            return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, fla=
gs,
> >> +                                   bitmap_lo, bitmap_hi);
> >> +    }
> >> +    else if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> >> +    {
> >> +        return notification_set_vm(dest_id, caller_id, flags,
> >> +                                   ((uint64_t)bitmap_hi << 32) | bitm=
ap_lo);
> >> +    }
> >>
> >>     return FFA_RET_NOT_SUPPORTED;
> >> }
> >> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_pri=
vate.h
> >> index 78a0a9815d56..923a071a9d7c 100644
> >> --- a/xen/arch/arm/tee/ffa_private.h
> >> +++ b/xen/arch/arm/tee/ffa_private.h
> >> @@ -340,20 +340,18 @@ struct ffa_ctx_notif {
> >>     uint64_t vm_pending;
> >>
> >>     /*
> >> -     * Source endpoint bound to each VM notification ID (0 means unbo=
und).
> >> +     * Tracks whether an NPI has been raised for local pending notifi=
cations.
> >> +     * Protected by notif_lock.
> >>      */
> >> -    uint16_t vm_bind[FFA_NUM_VM_NOTIF];
> >> +    bool notif_irq_raised;
> >>
> >>     /*
> >> -     * Lock protecting the hypervisor-managed notification state.
> >> +     * Source endpoint bound to each VM notification ID (0 means unbo=
und).
> >>      */
> >> -    spinlock_t notif_lock;
> >> +    uint16_t vm_bind[FFA_NUM_VM_NOTIF];
> >>
> >> -    /*
> >> -     * Tracks whether a local notification pending interrupt was rais=
ed.
> >> -     * Protected by notif_lock.
> >> -     */
> >> -    bool notif_irq_raised;
> >> +    /* Lock protecting local notification state. */
> >> +    spinlock_t notif_lock;
> >>
> >>     /*
> >>      * Bitmap of pending hypervisor notifications (for HYP bitmap quer=
ies).
> >> @@ -495,6 +493,7 @@ void ffa_notif_init(void);
> >> void ffa_notif_init_interrupt(void);
> >> int ffa_notif_domain_init(struct domain *d);
> >> void ffa_notif_domain_destroy(struct domain *d);
> >> +bool ffa_notif_fw_enabled(void);
> >>
> >> int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs);
> >> int32_t ffa_handle_notification_unbind(struct cpu_user_regs *regs);
> >> --
> >> 2.53.0
> >>
>

