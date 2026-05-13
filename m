Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAUlJ60RBGqVDAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 07:52:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1368652DCB4
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 07:52:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307577.1579181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN2Vu-0003pH-Vz; Wed, 13 May 2026 05:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307577.1579181; Wed, 13 May 2026 05:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN2Vu-0003nL-TP; Wed, 13 May 2026 05:52:10 +0000
Received: by outflank-mailman (input) for mailman id 1307577;
 Wed, 13 May 2026 05:52:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jens.wiklander@linaro.org>) id 1wN2Vt-0003n1-6P
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 05:52:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN2Vs-00GVmr-JX
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 07:52:08 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 6a04116d-2eae-0a2a0a5409dd-0a2a4503a882-28
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 07:52:08 +0200
Received: from [209.85.167.182] (helo=mail-oi1-f182.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 6a041187-672d-0a2a45030019-d155a7b6e965-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 07:52:08 +0200
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-479dd56d016so4692180b6e.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 22:52:08 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1778651527; cv=none;
        d=google.com; s=arc-20240605;
        b=KCZvoD2FzNWU1yL5ZPXkS5yih6b+wec9xicSzd1nlf2wpmyevHGAftUaTbtRuocSOZ
         LGm8WHaEJIm3TUTNP/ZLkSn9h7ZGWVnq9mjF3nTtViSUDouRmOktuk11dCMblkhnS5Ty
         iQ2UEoO3N697GT474N25hkKiJ8EHyMaHiWNRN/S47gNbCBL0ml+4NdfCIad2MLh6FgUF
         FZCVsnpB1Rs8HCEkPyVDmE6MamcCXzL/C1aysy4ITk50AjE73NWVlmqP/ttmKEfNgfgb
         zk/lp2AcpybZjTXIxEOBEU/LAGxuBE3uve1zd2CvmyD4rkPbpdVaz8uc62t+Dl2+qdhI
         LQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pjtW/ih8DgRup9tUYord5CdhpuchYBY3fKaAqR8q44M=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=j9LACpKzNU+CQgztoWmgUdt28yRQ4a93SowNU5LjOvMiCDcVc1B4/LI/8jAxXabVMh
         JjED9r0hLvqg/lIptzH0SLQ/NMhtyiAEMtRrR8BOmW/5iDtkAAyT76L8pU++XKRNFaMw
         UrgBNsBvYWV09de9jwl6TZXWYN9mnPqHlKfEo7e0oEaza0yuoi24RRoyfhwuyyiRGsO1
         nkM9LNMucxhyGuC6jXDfdEdXk8/9/l+HGm1kzDSQkutnM2HW9he3fJzU+Dqm8JdNjMPW
         Ep1zc5Q7zG2VMxMA0BrjYBMCescAjkzogl+6snYfg35P4CDiLMLZidrrZXUsV7ctSLXC
         LqRw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778651527; x=1779256327; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjtW/ih8DgRup9tUYord5CdhpuchYBY3fKaAqR8q44M=;
        b=VJbKm+G+87tlF0uA+hn7iz38bCvyB+tKQFuozmSi8Saxy1jbdQZb0BzZ3qvR+smGE9
         lUC6h/nBg63qQUCWIa3ilfC8ysfhAe4GaSg7VDBkaRBBXO2g7mV241nHYzSmdfkYp+nG
         m26RGU/6TiYK0UOwWNyHD+yJ2IdV12lgSmWmH/eB+C/xyossXKPeFLjd7CFK/K3y1cET
         4nFEHXDWdwkB+b1bOQoRiDxaG0khN8/bsLHU9mOEYjKlhY6RnOCucTO/9lgPKIns7enc
         6uzbVMMMhmizkI3FD7XIM9FJuzrJ7tIeHW/ur7hwp1DVHdAWdWl5bVZpOb7wcuu9NnIL
         9AeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778651527; x=1779256327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pjtW/ih8DgRup9tUYord5CdhpuchYBY3fKaAqR8q44M=;
        b=EIHKE/+LyA8Fl8U9VsgSH1A9iyCDIXHZUU4QM+GT+k+7X4/i6F0UUf5/QMEz1dyCQT
         EwZonNxdMbI94vxwNd4XIApsMpHn4RLH+r/qLXuylaMn1n9kVObICMkkPeD0v5mCF0Rl
         vhnmKJ5PaMp6hPLaWWtqZIng70hP4/8KdwoK2ivW/5MILMcMqlI9X1muX0AL/niHY6ur
         qQE1oVNU9spqfu16EvO0mEJ7nTx7FmxjnSOTWxfCVRMUWI2sY+TvY1UY93mo13M4VZ4N
         osXbrnATiMrhiAUP9HLO8u3OODv5UNAbgX2yCOgIbmkIF2bI9upV3uYlpdy/GSyi74rk
         XVng==
X-Gm-Message-State: AOJu0YzxcaPcNwVcypIZWUU+93Gh9K1dlHDA2ooBUC+0fRcGJ7uaSs4/
	uFm6ydIckNuWjAvKZPp2fOeoXwaOkAwTgY58dghI38jEwrxCwvl+GH71RLdU6zIkTaZvSZi+vyh
	LxPY4tDnr65a7mHp4bFlfpaXqYXp/T5YIRhcbOvvTnHcBCNdCT/jTPt8Aqw==
X-Gm-Gg: Acq92OGc1MNcGNHuEnDQnO5ELUCgqYeho0XSKbQpq4aRKg8K3+A1o9UcOCDwxdzPcrf
	okPN4O+OBCmRQDcyD248Era6vemd0fL4w1qfnB7MZznyshmKQ46jN1TxwOZifsE8EC67uv+cr05
	AxtyGj7he5WcggaPdNhDA1Ss/1K74zDYUsv2VdE+KR7Q9mQjdjrSXaPrX/uuUooylo2PgQRJPAS
	tevhw0CWcE7sp0h4FAgKviIcp0O/1ORVq7RqwyBXO6MkDTKc7NCUujnvrfqW1KZluaxgZEFfqb1
	3En3N+hP16Uf0RMrUZElLUwwwPy7RwZPKwSlrv1ryq0AF6JC
X-Received: by 2002:a05:6808:3c43:b0:45c:881c:e0c0 with SMTP id
 5614622812f47-482b6288b52mr966806b6e.47.1778651526471; Tue, 12 May 2026
 22:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776955622.git.bertrand.marquis@arm.com> <b22ff7b7bf12fc21e6fbff47d77b092f5c487aec.1776955622.git.bertrand.marquis@arm.com>
In-Reply-To: <b22ff7b7bf12fc21e6fbff47d77b092f5c487aec.1776955622.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 13 May 2026 07:51:55 +0200
X-Gm-Features: AVHnY4JDr4br8YW584uPXHxxnLvNtoDya9_GfV9ljZW70CeJkuhrYmlrDTHC6SY
Message-ID: <CAHUa44EOHaFyyExqLRHtF0c+4MAxhrtW6UfqAmhvPQSXOEpr3w@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] xen/arm: ffa: Preserve secure notification state
 when polling SPMC
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1778651528-40E68938-CD8BE204/0/0
X-purgate-type: clean
X-purgate-size: 7845
X-Rspamd-Queue-Id: 1368652DCB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,linaro.org:email,linaro.org:dkim,mail.gmail.com:mid];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Hi Bertrand,

On Wed, Apr 29, 2026 at 7:44=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Secure pending state is latched when the SPMC raises the schedule
> receiver interrupt, but Xen currently clears that latch too aggressively.
> Guest FFA_NOTIFICATION_INFO_GET consumes secure_pending even though it
> only reports pending state, and secure FFA_NOTIFICATION_GET only clears
> the latch when both SP and SPM bitmaps are requested together. This can
> drop a pending indication before the receiver retrieves secure
> notifications, or keep INFO_GET reporting stale secure pending state
> after a successful GET.
>
> Keep secure_pending as a latched indication until secure notifications
> are actually retrieved. Guest FFA_NOTIFICATION_INFO_GET now reports the
> latched state without clearing it, while a successful secure
> FFA_NOTIFICATION_GET clears the latch regardless of which secure bitmap
> flags were requested. Also protect secure_pending with notif_lock,
> serialize SPMC INFO_GET polling behind notif_info_lock, and preserve the
> caller-visible INFO_GET success width.
>
> Functional impact: guest INFO_GET preserves the secure pending
> indication until secure notifications are retrieved, and successful
> secure GET clears the guest-visible pending latch.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes since v1:
> - drop the defensive fw_notif_enabled guard in notif_sri_action()
> ---
>  xen/arch/arm/tee/ffa_notif.c | 51 ++++++++++++++++++++++--------------
>  1 file changed, 32 insertions(+), 19 deletions(-)

Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 1260f98a77e9..e1cd852d1c53 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -18,6 +18,7 @@
>
>  static bool __ro_after_init fw_notif_enabled;
>  static unsigned int __ro_after_init notif_sri_irq;
> +static DEFINE_SPINLOCK(notif_info_lock);
>
>  static bool inject_notif_pending(struct domain *d)
>  {
> @@ -111,6 +112,7 @@ void ffa_handle_notification_info_get(struct cpu_user=
_regs *regs)
>  {
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
> +    uint32_t fid =3D get_user_reg(regs, 0);
>      bool notif_pending;
>
>      if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
> @@ -119,7 +121,10 @@ void ffa_handle_notification_info_get(struct cpu_use=
r_regs *regs)
>          return;
>      }
>
> -    notif_pending =3D test_and_clear_bool(ctx->notif.secure_pending);
> +    spin_lock(&ctx->notif.notif_lock);
> +    notif_pending =3D ctx->notif.secure_pending;
> +    spin_unlock(&ctx->notif.notif_lock);
> +
>      if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
>      {
>          notif_pending |=3D test_and_clear_bool(ctx->notif.vm_pending);
> @@ -133,7 +138,9 @@ void ffa_handle_notification_info_get(struct cpu_user=
_regs *regs)
>      if ( notif_pending )
>      {
>          /* A pending global notification for the guest */
> -        ffa_set_regs(regs, FFA_SUCCESS_64, 0,
> +        ffa_set_regs(regs,
> +                     smccc_is_conv_64(fid) ? FFA_SUCCESS_64 : FFA_SUCCES=
S_32,
> +                     0,
>                       1U << FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT, ffa_get_vm=
_id(d),
>                       0, 0, 0, 0);
>      }
> @@ -156,6 +163,8 @@ void ffa_handle_notification_get(struct cpu_user_regs=
 *regs)
>      uint32_t w5 =3D 0;
>      uint32_t w6 =3D 0;
>      uint32_t w7 =3D 0;
> +    uint32_t secure_flags =3D flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
> +                                      FFA_NOTIF_FLAG_BITMAP_SPM );
>
>      if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
>      {
> @@ -175,27 +184,16 @@ void ffa_handle_notification_get(struct cpu_user_re=
gs *regs)
>          return;
>      }
>
> -    if ( fw_notif_enabled && (flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
> -                                        FFA_NOTIF_FLAG_BITMAP_SPM )) )
> +    if ( fw_notif_enabled && secure_flags )
>      {
>          struct arm_smccc_1_2_regs arg =3D {
>              .a0 =3D FFA_NOTIFICATION_GET,
>              .a1 =3D recv,
> -            .a2 =3D flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
> -                            FFA_NOTIF_FLAG_BITMAP_SPM ),
> +            .a2 =3D secure_flags,
>          };
>          struct arm_smccc_1_2_regs resp;
>          int32_t e;
>
> -        /*
> -         * Clear secure pending if both FFA_NOTIF_FLAG_BITMAP_SP and
> -         * FFA_NOTIF_FLAG_BITMAP_SPM are set since secure world can't ha=
ve
> -         * any more pending notifications.
> -         */
> -        if ( ( flags  & FFA_NOTIF_FLAG_BITMAP_SP ) &&
> -             ( flags & FFA_NOTIF_FLAG_BITMAP_SPM ) )
> -            ACCESS_ONCE(ctx->notif.secure_pending) =3D false;
> -
>          arm_smccc_1_2_smc(&arg, &resp);
>          e =3D ffa_get_ret_code(&resp);
>          if ( e )
> @@ -212,6 +210,10 @@ void ffa_handle_notification_get(struct cpu_user_reg=
s *regs)
>
>          if ( flags & FFA_NOTIF_FLAG_BITMAP_SPM )
>              w6 =3D resp.a6;
> +
> +        spin_lock(&ctx->notif.notif_lock);
> +        ctx->notif.secure_pending =3D false;
> +        spin_unlock(&ctx->notif.notif_lock);
>      }
>
>      if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> @@ -356,7 +358,10 @@ static void notif_vm_pend_intr(uint16_t vm_id)
>       * guarantees that the data structure isn't freed while we're access=
ing
>       * it.
>       */
> -    ACCESS_ONCE(ctx->notif.secure_pending) =3D true;
> +    spin_lock(&ctx->notif.notif_lock);
> +    ctx->notif.secure_pending =3D true;
> +    spin_unlock(&ctx->notif.notif_lock);
> +
>      inject_notif_pending(d);
>
>  out_unlock:
> @@ -375,11 +380,15 @@ static void notif_sri_action(void *unused)
>      unsigned int n;
>      int32_t res;
>
> -    do {
> +    spin_lock(&notif_info_lock);
> +
> +    do
> +    {
>          arm_smccc_1_2_smc(&arg, &resp);
>          res =3D ffa_get_ret_code(&resp);
>          if ( res )
>          {
> +            spin_unlock(&notif_info_lock);
>              if ( res !=3D FFA_RET_NO_DATA && printk_ratelimit() )
>                  printk(XENLOG_WARNING
>                         "ffa: notification info get failed: error %d\n", =
res);
> @@ -393,7 +402,7 @@ static void notif_sri_action(void *unused)
>          id_pos =3D 0;
>          for ( n =3D 0; n < list_count; n++ )
>          {
> -            unsigned int count =3D ((ids_count >> 2 * n) & 0x3) + 1;
> +            unsigned int count =3D ((ids_count >> (2 * n)) & 0x3) + 1;
>              uint16_t vm_id =3D get_id_from_resp(&resp, id_pos);
>
>              notif_vm_pend_intr(vm_id);
> @@ -401,7 +410,9 @@ static void notif_sri_action(void *unused)
>              id_pos +=3D count;
>          }
>
> -    } while (resp.a2 & FFA_NOTIF_INFO_GET_MORE_FLAG);
> +    } while ( resp.a2 & FFA_NOTIF_INFO_GET_MORE_FLAG );
> +
> +    spin_unlock(&notif_info_lock);
>  }
>
>  static DECLARE_TASKLET(notif_sri_tasklet, notif_sri_action, NULL);
> @@ -489,6 +500,7 @@ int ffa_notif_domain_init(struct domain *d)
>
>      spin_lock_init(&ctx->notif.notif_lock);
>      ctx->notif.notif_irq_raised =3D false;
> +    ctx->notif.secure_pending =3D false;
>      ctx->notif.hyp_pending =3D 0;
>
>      if ( fw_notif_enabled )
> @@ -507,6 +519,7 @@ void ffa_notif_domain_destroy(struct domain *d)
>
>      spin_lock(&ctx->notif.notif_lock);
>      ctx->notif.notif_irq_raised =3D false;
> +    ctx->notif.secure_pending =3D false;
>      ctx->notif.hyp_pending =3D 0;
>      spin_unlock(&ctx->notif.notif_lock);
>
> --
> 2.53.0
>

