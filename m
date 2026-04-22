Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yE2rAjTD6Gm9PwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 14:46:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6072F446228
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 14:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290478.1570058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFWxo-00086R-LU; Wed, 22 Apr 2026 12:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290478.1570058; Wed, 22 Apr 2026 12:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFWxo-00084N-Hw; Wed, 22 Apr 2026 12:45:56 +0000
Received: by outflank-mailman (input) for mailman id 1290478;
 Wed, 22 Apr 2026 12:45:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jens.wiklander@linaro.org>) id 1wFWxm-00084H-Jy
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 12:45:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFWxm-000QLW-0F
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 14:45:54 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 69e8c2fc-2eae-0a2a0a5409dd-0a2a4506be72-16
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 14:45:53 +0200
Received: from [209.85.167.169] (helo=mail-oi1-f169.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 69e8c300-7371-0a2a45060019-d155a7a9dcd8-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 14:45:53 +0200
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-45f053b7b90so3041437b6e.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 05:45:53 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1776861952; cv=none;
        d=google.com; s=arc-20240605;
        b=NSGI9wXZQyV/ehWnkogX+Vy1mYxmujhLgEo59yyyjdvYratZyi4A22I9hWK4fhUi/D
         tnW/TIm/4Ow34wz1X5LW5DsbX0mvoatUFkaAMR6JMhJezyNWidSRNtdhJWPFc/NE69CP
         pQ232u9b4bZbxfy3lTyEhhbUXhBUFvAUWmmLuEWre6myGA4e2k2X46TwcROnmK8pZAsL
         JA6dWFmJ6ILq/pEQnLhVzloF18HALnAFoUmPw3wFy3eHPcMvJzEFy4ThSvAa9/p/Gq/e
         2z+oNi2fD38UrnbB80lC5KLntnvimfQFFbYPugdNmxvol9w49y9IMxnUDhKe0/wms6WT
         TKKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6CRmPzKF3K9QyQEexRPq5aH4kw0kNjI7Ou5yzweCuOQ=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=JC/eCnUC9/BJKRUe7f4s4L0P0MruAYr2wPKCAWY56wQaV5yIONpaaZtOmKobv1DTwc
         ine+aOcL7hEFj7vbxyWl63aafKRlbk0OYRD7tf5hSdJdgWumZz5sphBDLX9MygGLsTKD
         78iFvA89Iq0V/qmxVsfA6wtjVUoAFqe/pk7PNVweNQMDwH+Y52RTE4VgkbSEpY5SVv9j
         dCGB9nCVagloz+Z/6UaZS1xqQJdCb9adSP+GKjAf0lRCF6sGHTNkeZGNcJeiN3dxoHg0
         jI73Aw39PM8EUtcWdNW2K3Ppjtff9PidW+kl6kp7HXBiM77VR2JfES6Q63tlYDE4Y5rC
         x18Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776861952; x=1777466752; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CRmPzKF3K9QyQEexRPq5aH4kw0kNjI7Ou5yzweCuOQ=;
        b=PVR/DeO4koFAbE/PpI2JIPvtGGWJ64lwL+wLbcdQ+ZSCRcZBW7ohK+n+I6hWby3rAY
         u8biEbx/rcQAD4WU+V8wYsyxEydThu7efD1S1y/vqmnP6JD7UUu5ODm5CYfRKPIm4iy7
         x+w7CTEPOd6IC6KVfZ8kLQ/8Ne1Rn+37NtN7RWpgGsdgfYNqK5mOmGg3qJI0EukWRcRH
         18ruigsNCC7BGVCjyBq3ucXISE44y8mVvWoINloehG0EJw4OieZ0Aa4krs4EZLdRUT2K
         O01Q3CxQYIVgboVK+xLdx+xe5r3DT8T8eTpwl0wKQfGzpTj9/GQur0fQaKljabnGE2nN
         6X+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776861952; x=1777466752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6CRmPzKF3K9QyQEexRPq5aH4kw0kNjI7Ou5yzweCuOQ=;
        b=Bl2iVSsKaIr38aiDobkTa/i9XBYgluETRMWFIjHr5jHeccgpvPBwY7sO6dgWRnJ+SL
         Y1UQ+rzD8yEO0yY8HtDrvVYH3zhHp8XTXojMRMKJjAjI6PIAXQVUgBzeI5d9QnY+I2On
         0X8gk4w5z+O4diy9IeiqWEwzjgAlmDynY6lF4lE2zNTAuu30JPfUJjej2VnSqjQ0t9n2
         rVGG0VFuNd2rUwjOg+gDtbjMcDBcFQlghLPekZVgMrgQxW5YFxemht8ZQsaf7weu7gw1
         ZI5kjPRIIbNXGK9UCCwh12OlFs/3ePxC/UxZ30P9oUQqB9ZOpHevbkSJppIrcV7smoO5
         i5Lw==
X-Gm-Message-State: AOJu0YyJfkF57xxYZhI7U6xAyMwwgTsOz7fK6wlMlIi2BBcPMarv7oId
	TKo8OWH9dhPD+3d2FQAK8+wRLCHJeb0D4lk0oBv2v3/DfuQz8Y/i5jWF/iP6N0s02jy4lRqhr5r
	GRJacqH61nQdBPbfRBnnmPu3z2J2MSkQtnMMxk42PYQ==
X-Gm-Gg: AeBDiesfcpRIer0Z8QrUNfrXArIuLsJ2Qg8GoPn+i2G8+4YxeTJeGpzMObWgsW09hfP
	gbGZwo1cj1Rdp7zIuI17Jgvzxgl581se5KolMR3ULX2S34/7cnE8GRBo5XKdp236hLIrexgJXKW
	gzRVOWUeUTQOTNA61AW3W4Hvl44WTKLKDVghgaIy2jXKx1N9vYWbM1NezNbYUvT09bIWRw4AIb/
	Rzs+YRV1j6YZ1bJY09UG2Jj12LccniCJoiEEKBjcQ3WKs3gB/LO0C0IR5872zZage2bYWSnN1dL
	io9uymdqn5Mcl1mbU7mVFP5KTYayrxXoJZ4W9LJ3FrmGgp17KiAg3Ck1SR8=
X-Received: by 2002:a4a:e905:0:b0:694:6d72:9fd0 with SMTP id
 006d021491bc7-6946d72a2f8mr10755778eaf.16.1776861951969; Wed, 22 Apr 2026
 05:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776266307.git.bertrand.marquis@arm.com> <5b9ce4a4a3927ce2287ec4db7f864174f53b8f17.1776266307.git.bertrand.marquis@arm.com>
In-Reply-To: <5b9ce4a4a3927ce2287ec4db7f864174f53b8f17.1776266307.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 22 Apr 2026 14:45:40 +0200
X-Gm-Features: AQROBzCGOIBzjZ3Xfz9x00948t7ArGxeMrG9x-UdM514xcfd3fZvVtFJbdnI6yE
Message-ID: <CAHUa44FnKKpZOZ_oVKXZdaznmAcPC5Y3iF2MJ_o2o3i5M1+mFw@mail.gmail.com>
Subject: Re: [PATCH 4/6] xen/arm: ffa: Preserve secure notification state when
 polling SPMC
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1776861953-51F6BD75-2D8E3FA1/0/0
X-purgate-type: clean
X-purgate-size: 7755
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,linaro.org:dkim,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 6072F446228
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bertrand,

On Fri, Apr 17, 2026 at 3:41=E2=80=AFPM Bertrand Marquis
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
>  xen/arch/arm/tee/ffa_notif.c | 54 +++++++++++++++++++++++-------------
>  1 file changed, 35 insertions(+), 19 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 491db3b04df5..fff00ca2baec 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -18,6 +18,7 @@
>
>  static bool __ro_after_init fw_notif_enabled;
>  static unsigned int __ro_after_init notif_sri_irq;
> +static DEFINE_SPINLOCK(notif_info_lock);
>
>  static void inject_notif_pending(struct domain *d)
>  {
> @@ -109,6 +110,7 @@ void ffa_handle_notification_info_get(struct cpu_user=
_regs *regs)
>  {
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
> +    uint32_t fid =3D get_user_reg(regs, 0);
>      bool notif_pending;
>
>      if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
> @@ -117,7 +119,10 @@ void ffa_handle_notification_info_get(struct cpu_use=
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
> @@ -131,7 +136,9 @@ void ffa_handle_notification_info_get(struct cpu_user=
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
> @@ -154,6 +161,8 @@ void ffa_handle_notification_get(struct cpu_user_regs=
 *regs)
>      uint32_t w5 =3D 0;
>      uint32_t w6 =3D 0;
>      uint32_t w7 =3D 0;
> +    uint32_t secure_flags =3D flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
> +                                      FFA_NOTIF_FLAG_BITMAP_SPM );
>
>      if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
>      {
> @@ -173,27 +182,16 @@ void ffa_handle_notification_get(struct cpu_user_re=
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
> @@ -210,6 +208,10 @@ void ffa_handle_notification_get(struct cpu_user_reg=
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
> @@ -354,7 +356,10 @@ static void notif_vm_pend_intr(uint16_t vm_id)
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
> @@ -373,11 +378,18 @@ static void notif_sri_action(void *unused)
>      unsigned int n;
>      int32_t res;
>
> -    do {
> +    if ( !fw_notif_enabled )
> +        return;

Can this ever happen? Am I missing something?

Cheers,
Jens

> +
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
> @@ -391,7 +403,7 @@ static void notif_sri_action(void *unused)
>          id_pos =3D 0;
>          for ( n =3D 0; n < list_count; n++ )
>          {
> -            unsigned int count =3D ((ids_count >> 2 * n) & 0x3) + 1;
> +            unsigned int count =3D ((ids_count >> (2 * n)) & 0x3) + 1;
>              uint16_t vm_id =3D get_id_from_resp(&resp, id_pos);
>
>              notif_vm_pend_intr(vm_id);
> @@ -399,7 +411,9 @@ static void notif_sri_action(void *unused)
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
> @@ -486,6 +500,7 @@ int ffa_notif_domain_init(struct domain *d)
>      int32_t res;
>
>      spin_lock_init(&ctx->notif.notif_lock);
> +    ctx->notif.secure_pending =3D false;
>      ctx->notif.hyp_pending =3D 0;
>
>      if ( fw_notif_enabled )
> @@ -503,6 +518,7 @@ void ffa_notif_domain_destroy(struct domain *d)
>      struct ffa_ctx *ctx =3D d->arch.tee;
>
>      spin_lock(&ctx->notif.notif_lock);
> +    ctx->notif.secure_pending =3D false;
>      ctx->notif.hyp_pending =3D 0;
>      spin_unlock(&ctx->notif.notif_lock);
>
> --
> 2.53.0
>

