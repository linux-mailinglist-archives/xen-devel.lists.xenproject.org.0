Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH/xGOEA6mk/rQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 13:22:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E7645138F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 13:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291945.1570657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFs7E-00036B-7l; Thu, 23 Apr 2026 11:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291945.1570657; Thu, 23 Apr 2026 11:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFs7E-00033k-4n; Thu, 23 Apr 2026 11:21:04 +0000
Received: by outflank-mailman (input) for mailman id 1291945;
 Thu, 23 Apr 2026 11:21:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jens.wiklander@linaro.org>) id 1wFs7C-00033e-De
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 11:21:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFs7B-00AXcd-G1
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 13:21:01 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 69ea008f-2eae-0a2a0a5409dd-0a2a450bdc42-22
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 13:21:01 +0200
Received: from [209.85.161.52] (helo=mail-oo1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 69ea009c-212f-0a2a450b0019-d155a134cc49-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 13:21:01 +0200
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-673ee2a98b1so3621658eaf.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 04:21:00 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1776943259; cv=none;
        d=google.com; s=arc-20240605;
        b=CsV7KVb7oAO0+8YeWQBNH7eRG0EG54CNOvYlfexsUelvzeaHJHB176156/5XeQiGc0
         txUGwEtHCFlCbe0ESZswny34d1wQoxEP5BSi9NdbG/7JXxAmcfjRTkrEIGPNB+k1SQ1p
         gsmkbyQL6BlX6K2GLuoflZEpYcd9IuY4VGyFfwDZ5kFoubuP004gTyu7sqrw91d4ob5W
         kXdkBXV9rBVy2BCqy+2YxKHiA+MrRHmAFP/0EjKsA9BI/rFGbuOVpgO0T+00bijGH6tK
         gH5nmTNaLzTS4kyJsrh9wniJtiWNr/3lcNdtsFP47T7h+vdwiZthne/8X4UCN67pxkVt
         /Quw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0QDXMTjcM4sp3IomM8jvKgkOHnQ+tAa7gG7azNTIOvk=;
        fh=wB0f5JGUSpWYejuxtnrl8SDqvqyWrEsEaWvC32LbdiU=;
        b=iB8HBLit6lwx4AjOnlyunlB0sGZG50rFQc1Zh5s9qmtMPXLrO8KQH5iOvujEhV8Jyn
         HSRRLqqcVL4lfyJMwOMGecPVYnL2VLmWm0GRTQpGd11TQ4COK7MA3Zrr2tQAEu5YG4Z0
         QPIpfkGEpBQ77jh90L3oEGBFT2LU+IroTCZKvH2GsPEUFCYRD+U4AuBQ9Xcuiu/5Clcj
         HLSwahsvXGTKzv7gokul+5psp3YKDMfv6J92eDvMSLfgdXU2FWFKQema/AckZLO48O6r
         iN58JfP5BlrPnMC3fdLCQ8xgRPMdadoUeJUU3TMjgK3Lmms8ZA5lTIw88QLTrLaumPgy
         XYsw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776943259; x=1777548059; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QDXMTjcM4sp3IomM8jvKgkOHnQ+tAa7gG7azNTIOvk=;
        b=tiq8cQH00wqazfneXjDmEJIaGshXgk79u5fU24hJf7soyeZH8CASZluYEupvMphGxr
         sw5WC3KV0NNiB3fkWUfWHkoF2/OjVFWGSwnykFzmFyyfdqR5K5F14SungV9ef6ettxoG
         SPpues60zrCGMZMpTBVXO7Akv1vcTSfLeJi74HL7E1VjAmGfSLbPmBhiT4hrRU/KmSdT
         bMPVc4YsYF2RIgxNIcUHeVMLV7Rxw4mJ5eCCislgPtbn8P1A7xpvVtjT4lN5ou9UGmFN
         ZIe8TPv4ZVfSWwla7LyhCfTLcph2UWXNMMPLAozRAzDMVDBf1IbeRHVZixwkJiio6e65
         q01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776943259; x=1777548059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0QDXMTjcM4sp3IomM8jvKgkOHnQ+tAa7gG7azNTIOvk=;
        b=OjbH6GozoUfO2xIUKQRvenyNr5tDfFXvwOsopBGSiBFw8bsjSZ2TMvu9bV4MX5/vB3
         GotZzTi+xyR0nUn1ku0xtNMxE5jtZVeL/RyYtilO00q8PEcnDI/qp6qztCSHLFWTx6gK
         kSkJU+rmOvlnrBjedJ9xAKHBkgbuRI9fcjY7shgfQRoOKyn3Up1gTmy86dEw7e8wy3fO
         RtK3d34PIfQSQPkYHIfInJfi9rQHNfaL+NzbCUe0MBKIFQX6AkOSq9u+pYC7QEtO8zW3
         yfZNaYRHwluEunrK5/MU8KIRPVtF0DVAKz2XEhnRFdVXpUd0mA799fRR64oQbPPg7SEn
         uBNA==
X-Gm-Message-State: AOJu0YyzOZlfZYq//L2MIv1PlnqmfGORNAEtvtEwUJFoOrUUkN0ZlXID
	Y0a8CM43Is/Qvi14+Q5dpvY5EtaETaeB+JwbmhIq/1NvP7bDN9f1q05TN4tA84djc+kzszdAhH+
	bUyIblkts6kOYnWz8zJBNbq7mxQrLxwzq3x+DeyfQGw==
X-Gm-Gg: AeBDiettrdNbzCaEp/jp4f82e0xQBjKqhGNwZYnh53PRE1yU/jJsvkHtLw2Mt0LGV9y
	cb8u/mZ8So7KDNRzUh78RClznQjoThXua7kttI2jU4BhbTUOsmB95ACLd5ubLr35p6t3G5KqUVJ
	oWxXANI6I/9M5v7cze7m+HwTtcW2f7eIWE/e1ZhPXWBsPq89iIDvF5UkFygxvPsCwQkfyX4vlsp
	UoSFR92PCVHlksJ2ad2dt5NCh6rtpWJ/6yxABpdgGFhqlm5wV8w0ot74Cz/ULndKcttlVu9CN6E
	2FfoHhzk4Oi9KmEAaNyl3gMkRiRvE4/d1jvITDyzJIijS7ADr4PkhKGo+Go=
X-Received: by 2002:a05:6820:160c:b0:696:1413:496a with SMTP id
 006d021491bc7-69614134ab7mr2707120eaf.17.1776943259378; Thu, 23 Apr 2026
 04:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776266307.git.bertrand.marquis@arm.com>
 <e85d0ef9733f091e09f520c2e0598f13cb7af06a.1776266307.git.bertrand.marquis@arm.com>
 <CAHUa44GbUQRfFzBqpAX94FSioYzT9tx5oP7C8fOvnWmMTV4-SQ@mail.gmail.com> <263B26DA-15D5-43A6-90D8-AA42AF8C391B@arm.com>
In-Reply-To: <263B26DA-15D5-43A6-90D8-AA42AF8C391B@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 23 Apr 2026 13:20:48 +0200
X-Gm-Features: AQROBzCa-RtBTHXQqjokdyCc5gBlsx7zks-BOcWWP7X4as4jQ1SAxO4LuMKKhLs
Message-ID: <CAHUa44H9u83GAoH33pq32oNK8uXB3q5JaSxtRqrKAoVG8ia+BQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] xen/arm: ffa: Deliver VM-to-VM notifications locally
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1776943261-06772F3B-06E98B4A/0/0
X-purgate-type: clean
X-purgate-size: 9436
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,arm.com:email,mail.gmail.com:mid];
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
X-Rspamd-Queue-Id: B5E7645138F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bertrand,

On Thu, Apr 23, 2026 at 10:17=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 22 Apr 2026, at 16:04, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi Bertrand,
> >
> > On Fri, Apr 17, 2026 at 3:41=E2=80=AFPM Bertrand Marquis
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
> >> vm_pending bitmap under notif_lock, and raises an NPI only when the
> >> receiver transitions from no local pending notifications to some.
> >>
> >> Track whether a local NPI is already armed with notif_irq_raised, clea=
r
> >> that state once both VM and hypervisor pending bitmaps are drained, an=
d
> >> roll back newly-added VM pending bits if no destination vCPU is online=
.
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
> >> xen/arch/arm/tee/ffa.c         |  24 +++++--
> >> xen/arch/arm/tee/ffa_notif.c   | 126 +++++++++++++++++++++++++++++++--
> >> xen/arch/arm/tee/ffa_private.h |  11 ++-
> >> 3 files changed, 147 insertions(+), 14 deletions(-)
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
> >> index 4def701f0130..e77321244926 100644
> >> --- a/xen/arch/arm/tee/ffa_notif.c
> >> +++ b/xen/arch/arm/tee/ffa_notif.c
> >> @@ -20,7 +20,12 @@ static bool __ro_after_init fw_notif_enabled;
> >> static unsigned int __ro_after_init notif_sri_irq;
> >> static DEFINE_SPINLOCK(notif_info_lock);
> >>
> >> -static void inject_notif_pending(struct domain *d)
> >> +bool ffa_notif_fw_enabled(void)
> >> +{
> >> +    return fw_notif_enabled;
> >> +}
> >> +
> >> +static bool inject_notif_pending(struct domain *d)
> >> {
> >>     struct vcpu *v;
> >>
> >> @@ -34,13 +39,15 @@ static void inject_notif_pending(struct domain *d)
> >>         if ( is_vcpu_online(v) )
> >>         {
> >>             vgic_inject_irq(d, v, GUEST_FFA_NOTIF_PEND_INTR_ID, true);
> >> -            return;
> >> +            return true;
> >>         }
> >>     }
> >>
> >>     if ( printk_ratelimit() )
> >>         printk(XENLOG_G_DEBUG "%pd: ffa: can't inject NPI, all vCPUs o=
ffline\n",
> >>                d);
> >> +
> >> +    return false;
> >> }
> >>
> >> static int32_t ffa_notif_parse_params(uint16_t dom_id, uint16_t caller=
_id,
> >> @@ -104,6 +111,73 @@ out_unlock:
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
> >> +    uint64_t prev_bitmap =3D 0;
> >> +    uint64_t new_bitmap;
> >> +    bool inject =3D false;
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
> >> +    prev_bitmap =3D dst_ctx->notif.vm_pending;
> >> +    dst_ctx->notif.vm_pending |=3D bitmap;
> >> +    if ( !dst_ctx->notif.notif_irq_raised &&
> >> +         (dst_ctx->notif.vm_pending || dst_ctx->notif.hyp_pending) )
> >> +    {
> >> +        dst_ctx->notif.notif_irq_raised =3D true;
> >> +        inject =3D true;
> >> +    }
> >> +
> >> +out_unlock:
> >> +    spin_unlock(&dst_ctx->notif.notif_lock);
> >> +
> >> +    new_bitmap =3D bitmap & ~prev_bitmap;
> >> +    if ( ret =3D=3D FFA_RET_OK && inject && new_bitmap &&
> >> +         !inject_notif_pending(dst_d) )
> >> +    {
> >> +        spin_lock(&dst_ctx->notif.notif_lock);
> >> +        dst_ctx->notif.vm_pending &=3D ~new_bitmap;
> >
> > There's a window above when dst_ctx->notif.notif_lock is unlocked.
> > What if another CPU has modified dst_ctx->notif.vm_pending during that
> > window?
>
> You are right, there is a race in that window. Thanks for the finding :-)
>
> I think the simplest fix is to keep notif_lock held across the injection
> attempt, so we do not expose partially updated notification state while t=
he
> interrupt delivery is still in progress.
>
> I do not think we should roll the pending bits back on injection failure,
> though. In practice the cases where we fail to inject are cases where the
> target cannot currently take the notification anyway, and dropping the
> pending state would be worse than keeping it pending and not marking the =
IRQ
> as raised.
>
> So my plan would be to keep the pending state, only mark notif_irq_raised
> when we actually inject, and keep the existing debug print for the cases =
we
> can detect.
>
> If that approach looks OK to you, I will update this patch accordingly.
>
> The same issue exists in patch 2 for the RX-buffer-full path, so I will f=
ix
> it there as well for the same reason.

Sounds good.

Cheers,
Jens

