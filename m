Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNx+Ja0RBGoMDAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 07:52:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CFC52DCB3
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 07:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307573.1579172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN2VL-0003Rb-Ol; Wed, 13 May 2026 05:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307573.1579172; Wed, 13 May 2026 05:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN2VL-0003Oh-Gm; Wed, 13 May 2026 05:51:35 +0000
Received: by outflank-mailman (input) for mailman id 1307573;
 Wed, 13 May 2026 05:51:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jens.wiklander@linaro.org>) id 1wN2VJ-0003Ob-Pj
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 05:51:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN2VI-00Cgwd-NX
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 07:51:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 6a041160-5cb7-0a2a0a5109dd-0a2a4502afd4-12
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 07:51:32 +0200
Received: from [209.85.161.43] (helo=mail-oo1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 6a041163-af86-0a2a45020019-d155a12bc91f-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 07:51:32 +0200
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-694932346a1so2309890eaf.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 22:51:32 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1778651491; cv=none;
        d=google.com; s=arc-20240605;
        b=JCDibiwu7oFrtD+v704GIPIM3EUR/OJSFCLPm3GDsZLEvLSGUcU54wJcb74vGFo4iS
         s2YgFPcYfEdWITwg9PeObDaTWuTJvgQFSXne+nGVzNemie7lg49FHspe2jkfZeDFXSIp
         WvH07voxOHvMZFEv2qBv+BOv3MxzhS6IJQDwHFrm7id3zNhlvJjnlnb/+dhcm57Pl38I
         yoGKcdhXzfk+7uj2JFe/arGpP8hK0KDQCozGMrP/LEFCCGqqAA2rfR2Ssl8QTts64leX
         Vz2iPnv7EnMSF3oY/6O4Mtjwy3s79VvmryXCyS+pBy1XGIgubtC0cX63p5BRrD4IEm6T
         L56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bhTpi/CpEXo8RyqZTmivoo9OsZQNme5x14a7tnaLrZE=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=VYz5UsNToDfBMxCxrr6lqCoD6lx1pndqsSaQpUKTxY/lH2SihH6z/GP+941RREnagv
         l+FkLkswGR4xxqTFAHzCXsr5ZOkGtl8KO2sF/qWxQU8w2+nWAb/LBD8iEnLSCKfsBtXL
         exyjGIKVnH6TD1vYPj0Xn9zqJgno1xOXds+Qp+Ql2k/2RyGvWCt0RXK+UcrhY0gShAbf
         YTcgn9qE3d9l8Ncuinc0Ly9Sxh3OAsRIv9RyGYjv0J4NyVIvVnU46CW/N5y9VsKSm4ME
         hyFoUgFrsGbLYjBoLe3Hp0mAQbcOpGqjc1zK7DqlL/KaiadpLINo6aN4SV7Cx2nCS2bh
         bH2g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778651491; x=1779256291; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhTpi/CpEXo8RyqZTmivoo9OsZQNme5x14a7tnaLrZE=;
        b=szJQOtsEMXLBCxi0dJvlAPzbQvljV2XgLXi8uHkQU+xl0+TNdBEvKTuOR3PdKWetuV
         1Tcnbmjmxj9xse8PoEIukQLuMfuTpFF0QWDRyaHpcw5n2FdSkzUuWP2NQCZglHSlHCmd
         ZBGAq+e/DiMO6c6pO+HNChrf5K5ap2B343xEfEIh3mXSl2mVvbFlNATiFg0JcKHwMZQe
         5duYHaGBiITxD39H9Cjq/scxrJssAOuIFoDRrvqfrO5jWlyhWF9SOpozYeLiAFg85EU2
         2PHYc540hymgem3pGApJdllvn4OCD4eWfaX5M/jCB/Eroyjo03k3zHl4myBUJhbFKcDc
         /HLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778651491; x=1779256291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bhTpi/CpEXo8RyqZTmivoo9OsZQNme5x14a7tnaLrZE=;
        b=mM1Do5rnMUxNPCIW5OpkcDqN47iVrXiuH+WeaVp0w0PAQWvRImJY6UoXixnym7hTHI
         lzQFDKKxuktHg2kIyd6V3VRC3yzv7QGH/DCMcQ9p1ZSwyFOs5d03Xbzc0r1H1CgRgwGP
         0R8AHTeIilxVPOfbGi9MVPaxxk/Lu/90SNx1OBinGoip9WnNpB3nfqhkPZGjdbBN2N9s
         JXeV2FHWQ72Qq1au4uuDO5lVSulodgvi0yWCt62FedKul7RZkK5H+f1Tkj5K/f+gyD/C
         +qceCu1yeKwKNGU9Dr1k5Ey+CsYF4tTFBiYoDveDagPFbLzssv4rezisVnCI+RoeaQsu
         DnKw==
X-Gm-Message-State: AOJu0YyH0uTB/JG/RRoaN0Z6SG56gLBHeEwm9hEOGYUPd08kQpnCXSRc
	oKS+PIjvfWOV4gfLMmvKLjTAMHNyrmRVgLdOPgI++jcoxfctIg4BqFMAOLVckVs30tAM2RAnH68
	GUi796W+W4oi8/ZqWYN3yAH0U/sWXH+zBMM38wApHpg==
X-Gm-Gg: Acq92OEoO/Kwb/FUii/RKCMmuTCvEz+jvYL7a/nGgBPJ76HNDVGdwvO5nXjQ/oahEZS
	MBOLT2dv/TLKOyNx/GzuaoBvwa2vMmForzA/QZBKZZrpFcJBLCRSIs1Y0XpvuEpTDCU54HA2CDx
	BrhrL10UP1rO9n0aIGJLSYjAWHgSSUdpBgstrrBAakqly2nMzDMAhCGukJ3pW1ux52B1XYgQM9r
	kgZodhAp/esr/a3cvBUx4vD1DwGOfFmMdzIdUC0PFritmhCpsiXU9WGBL1pJePf5FN0gl8tRpbM
	ETBL+AyVF/l5aH1pstJ1DqSy3ifAv/2xKkBuKQnJBR0yRLJy
X-Received: by 2002:a05:6820:814:b0:696:1d34:3271 with SMTP id
 006d021491bc7-69b78e4a46fmr1111690eaf.58.1778651490688; Tue, 12 May 2026
 22:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776955622.git.bertrand.marquis@arm.com> <b83650603daa853d7069748a2575ebe6ece040c2.1776955622.git.bertrand.marquis@arm.com>
In-Reply-To: <b83650603daa853d7069748a2575ebe6ece040c2.1776955622.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 13 May 2026 07:51:19 +0200
X-Gm-Features: AVHnY4Kt3Zf2s_av28Irr6I9SAXTnMMXzbj2154gD1vg7BivIcdLyJ0bhJxZRRw
Message-ID: <CAHUa44HLK9dNdh1cffXAr5A4Nbo5_ZvtXgSOYxSe3hMH06TLmg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] xen/arm: ffa: Track hypervisor notifications in a bitmap
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1778651492-81B70161-82860AF4/0/0
X-purgate-type: clean
X-purgate-size: 7434
X-Rspamd-Queue-Id: D7CFC52DCB3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:email,linaro.org:dkim,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Hi Bertrand,

On Wed, Apr 29, 2026 at 7:44=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Hypervisor notifications are currently tracked with a dedicated
> buff_full_pending boolean. The old RX-buffer-full path also exposed a
> pending indication indirectly via vm_pending, so
> FFA_NOTIFICATION_INFO_GET could clear that summary before the guest
> retrieved the Hypervisor notification bitmap with
> FFA_NOTIFICATION_GET.
>
> Replace the single boolean with a Hypervisor notification bitmap
> protected by notif_lock. INFO_GET reports pending when hyp_pending is
> non-zero, GET returns and clears the HYP bitmap under the lock, and
> RX-buffer-full now keeps notif_lock held across the local NPI
> decision. notif_irq_raised is only set when an NPI is actually
> injected, and is cleared once the local pending state is consumed.
>
> Initialize and clear the bitmap during domain lifecycle handling, and
> use ctx->ffa_id for bitmap create and destroy so the notification
> state stays tied to the cached FF-A endpoint ID.
>
> If the local injection attempt fails because no vCPU is online,
> hyp_pending remains set and notif_irq_raised remains clear. This
> keeps the RX-buffer-full notification pending until the guest
> retrieves it, without publishing a successful local IRQ state too
> early.
>
> Functional impact: RX-buffer-full remains pending in hyp_pending
> until FFA_NOTIFICATION_GET, and failed local NPI injection no longer
> leaves Xen thinking the interrupt was already raised.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes since v1:
> - clarify that v1 exposed RX-buffer-full indirectly via vm_pending
> - document that v2 keeps the HYP pending indication until
>   FFA_NOTIFICATION_GET
> - keep RX-buffer-full pending state stable across failed local NPI
>   injection attempts
> ---
>  xen/arch/arm/tee/ffa_notif.c   | 56 ++++++++++++++++++++++++++--------
>  xen/arch/arm/tee/ffa_private.h | 15 +++++++--
>  2 files changed, 56 insertions(+), 15 deletions(-)


Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
>
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 07bc5cb3a430..a631481e3815 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -19,7 +19,7 @@
>  static bool __ro_after_init fw_notif_enabled;
>  static unsigned int __ro_after_init notif_sri_irq;
>
> -static void inject_notif_pending(struct domain *d)
> +static bool inject_notif_pending(struct domain *d)
>  {
>      struct vcpu *v;
>
> @@ -33,13 +33,15 @@ static void inject_notif_pending(struct domain *d)
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
>  int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
> @@ -94,8 +96,15 @@ void ffa_handle_notification_info_get(struct cpu_user_=
regs *regs)
>
>      notif_pending =3D test_and_clear_bool(ctx->notif.secure_pending);
>      if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +    {
>          notif_pending |=3D test_and_clear_bool(ctx->notif.vm_pending);
>
> +        spin_lock(&ctx->notif.notif_lock);
> +        if ( ctx->notif.hyp_pending )
> +            notif_pending =3D true;
> +        spin_unlock(&ctx->notif.notif_lock);
> +    }
> +
>      if ( notif_pending )
>      {
>          /* A pending global notification for the guest */
> @@ -174,12 +183,19 @@ void ffa_handle_notification_get(struct cpu_user_re=
gs *regs)
>              w6 =3D resp.a6;
>      }
>
> -    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) &&
> -          flags & FFA_NOTIF_FLAG_BITMAP_HYP &&
> -          test_and_clear_bool(ctx->notif.buff_full_pending) )
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
>      {
> -        ACCESS_ONCE(ctx->notif.vm_pending) =3D false;
> -        w7 =3D FFA_NOTIF_RX_BUFFER_FULL;
> +        spin_lock(&ctx->notif.notif_lock);
> +
> +        if ( (flags & FFA_NOTIF_FLAG_BITMAP_HYP) && ctx->notif.hyp_pendi=
ng )
> +        {
> +            w7 =3D ctx->notif.hyp_pending;
> +            ctx->notif.hyp_pending =3D 0;
> +            if ( !ctx->notif.vm_pending )
> +                ctx->notif.notif_irq_raised =3D false;
> +        }
> +
> +        spin_unlock(&ctx->notif.notif_lock);
>      }
>
>      ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, w4, w5, w6, w7);
> @@ -211,9 +227,12 @@ void ffa_raise_rx_buffer_full(struct domain *d)
>      if ( !ctx )
>          return;
>
> -    ACCESS_ONCE(ctx->notif.buff_full_pending) =3D true;
> -    if ( !test_and_set_bool(ctx->notif.vm_pending) )
> -        inject_notif_pending(d);
> +    spin_lock(&ctx->notif.notif_lock);
> +    ctx->notif.hyp_pending |=3D FFA_NOTIF_RX_BUFFER_FULL;
> +    if ( !ctx->notif.notif_irq_raised &&
> +         inject_notif_pending(d) )
> +        ctx->notif.notif_irq_raised =3D true;
> +    spin_unlock(&ctx->notif.notif_lock);
>  }
>  #endif
>
> @@ -426,12 +445,16 @@ void ffa_notif_init(void)
>
>  int ffa_notif_domain_init(struct domain *d)
>  {
> +    struct ffa_ctx *ctx =3D d->arch.tee;
>      int32_t res;
>
> +    spin_lock_init(&ctx->notif.notif_lock);
> +    ctx->notif.notif_irq_raised =3D false;
> +    ctx->notif.hyp_pending =3D 0;
> +
>      if ( fw_notif_enabled )
>      {
> -
> -        res =3D ffa_notification_bitmap_create(ffa_get_vm_id(d), d->max_=
vcpus);
> +        res =3D ffa_notification_bitmap_create(ctx->ffa_id, d->max_vcpus=
);
>          if ( res )
>              return -ENOMEM;
>      }
> @@ -441,10 +464,17 @@ int ffa_notif_domain_init(struct domain *d)
>
>  void ffa_notif_domain_destroy(struct domain *d)
>  {
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    spin_lock(&ctx->notif.notif_lock);
> +    ctx->notif.notif_irq_raised =3D false;
> +    ctx->notif.hyp_pending =3D 0;
> +    spin_unlock(&ctx->notif.notif_lock);
> +
>      /*
>       * Call bitmap_destroy even if bitmap create failed as the SPMC will
>       * return a DENIED error that we will ignore.
>       */
>      if ( fw_notif_enabled )
> -        ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
> +        ffa_notification_bitmap_destroy(ctx->ffa_id);
>  }
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index c291f32b56ff..9ddda3f88986 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -340,9 +340,20 @@ struct ffa_ctx_notif {
>      bool vm_pending;
>
>      /*
> -     * True if domain has buffer full notification pending
> +     * Lock protecting the hypervisor-managed notification state.
>       */
> -    bool buff_full_pending;
> +    spinlock_t notif_lock;
> +
> +    /*
> +     * Tracks whether a local notification pending interrupt was raised.
> +     * Protected by notif_lock.
> +     */
> +    bool notif_irq_raised;
> +
> +    /*
> +     * Bitmap of pending hypervisor notifications (for HYP bitmap querie=
s).
> +     */
> +    uint32_t hyp_pending;
>  };
>
>  struct ffa_ctx {
> --
> 2.53.0
>

