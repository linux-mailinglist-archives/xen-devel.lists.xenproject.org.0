Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMdxNT+W6GmsNAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 11:34:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 221574440E6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 11:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290125.1569811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFTyl-0003Ow-Ey; Wed, 22 Apr 2026 09:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290125.1569811; Wed, 22 Apr 2026 09:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFTyl-0003Me-Bc; Wed, 22 Apr 2026 09:34:43 +0000
Received: by outflank-mailman (input) for mailman id 1290125;
 Wed, 22 Apr 2026 09:34:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jens.wiklander@linaro.org>) id 1wFTyj-0003MV-Ox
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 09:34:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFTyh-00Em4Z-K1
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:34:41 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 69e89625-2eae-0a2a0a5409dd-0a2a4502a7d6-22
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:34:41 +0200
Received: from [209.85.167.182] (helo=mail-oi1-f182.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 69e8962f-af86-0a2a45020019-d155a7b6d980-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:34:40 +0200
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-479d9b155deso1025502b6e.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 02:34:40 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1776850479; cv=none;
        d=google.com; s=arc-20240605;
        b=NltxZV6Kyu05P/ejc5gB3yFbLwlQcGYflgtcqodM3cLry+VB+WobdQU3bh6FikaHMH
         P9976gtnigY09zWId8KzcuwklLeFZBSwFLh0nk1DqkbH43s7OI1an3KdlZOXtQHyxPTg
         W8qPftT4VylPXcqFpeQfKYb10TsoPWU4BY1L8qxnVmOyg48/fdEs7IH3T/XUp/zU0gik
         Q9uDhQMtdIyuQE0/Aw57LxLsFUHpKFjD5uROqy/7GYIm34TV7TkqSMRuO/kSEfB8UpO+
         hauGLk3xsATL5lOoqNVvoq5eWJccc2gdtLmt3IVmoIvNwhhwL3mM3oNe0X3v0gJO3p7Z
         Ngpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IjGNLzZoVRcnaqKTCMBdzdnt+nQoxCffNoAezlXriWA=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=XIAndFaDmQZnTMfrlp0TKQhG0KCU/wtNX35Mm8jCbwpfKQDSbGwtlGC0ocr2cD9ni3
         xKHoH/wNkisE3sAw+7xf1xKR4i1dXFsWB/ccVkFUmLGVGdkuD2UG3JplhZRWIfbRYApR
         MroCYx18APy+4j3sRP9o0J5iEb0p1T3BiJ2jbv+kJTrs7KGzuBMOjTtV/+nUJCdboV1G
         sH050Hj3Cv3QiWPgz3zftlnER379uiYZtBJfcEwMIhnffFBxWY5r1A5ps+JlQHIPkH0X
         xmGgZtauqL0kDZfWkDpRAiKsHHY2geKwJ+UMLX3ikR4+PDC/pU5kORp23gna/n4Pus9g
         pyXA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776850479; x=1777455279; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjGNLzZoVRcnaqKTCMBdzdnt+nQoxCffNoAezlXriWA=;
        b=pALyDpJJxCFMyT5X+OgCx/0hpeZK3ORPubfMu3ljCG79F+x2etGPcsELPp+NPtlDSM
         A7PU9SfzxIhqu9iFXavpWA7WCEAlmluxCZ41cAz1HCYxBiyzcv7rWgR0jOz7v2grgAQm
         H4EWEevpEeXJ1+8E00XQ/aE6E5dMsOZFO1JGIK341wupEmqbMNnyOIUxMCBGeWMUaUTm
         FsCRNOhpdbF7bNErdFlgaqdn4TLZDLVViiZrZt1+Uxh/cX58XtaXgYezFfesGRLTJ+cW
         E3kpIs2Y8oDBqmHe+0hmwyu+TRXHDoRBgN8+VvKrNagmGB1a+eF5fi+Fai2U/bWW/paP
         zJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776850479; x=1777455279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IjGNLzZoVRcnaqKTCMBdzdnt+nQoxCffNoAezlXriWA=;
        b=Hkr8sJlfVXP04rhYOibwDU5bJShxZehnOH4S9C2zpaUey36cW6pUDIfbQpLZIhpTpM
         kQs88sJ2NBb5f2+TkA1WlSBbdyRxMyGHWD+3mMxsd6mhBqr1YYBkvyQoZVldMBWAYb4z
         9ou400ZoWTRljEHTsu/XlvjrrcPrZLwH0J6xq6ozn9l7rWP5N4U/tuVRMDAUVa1o9scN
         r/nY2gtuQhQ+4ULOzYy476Nk9UcuuO7Te6TCSFFtBzuUhY2g2LLtYaKvNKmK94z/fWw0
         wpIRRnlCaePfGXp7JNXIFiPGn8NwY4jhz7y2L7oQUkynDC0cgZDFeZB5mqB5B9pTp0fc
         mDhA==
X-Gm-Message-State: AOJu0YyxHURTa8lAKuzLmFuqwgdWFjs6SNpNqskFQ9QDaFqsTGdBshhO
	y16xCxyz7QD17979J0Wun/BlFwWhLAAvWEZ/3WXz21KYAQ6t2kvmLy1Eys16UdVSink0eIQ6HEc
	3M1R0HjniGYHobdwpE4YBYj5uT5a/ewiKVMmkrtYWGHEYu1TOiT25SVBb7g==
X-Gm-Gg: AeBDiesGv8SRusDkIxuABqlbnMH8WApWy5cB0SBL8g7XvsumYLMFzvLKFbSWoh43L8v
	VNFMXG88vptxnMtEsIUwh8aZL3rCy8kpRo/f68SahbDlmOa2qBj/hROkp9GGSNR7dnEBHlQHHl4
	4EvRSFonjf9AjpqV6VlcY9myvq4Qtl4LglHShZIUSQPTb2N1lGjIaLaWn+3IT+h07zlhqsiEg2j
	qf0gVO3zt+oD9qxsdm+2qn+pOxNUbLz2qofo3wcwAtKED8J1/bZJar3hLWj+mRNwmPlXrnvfQkg
	DEdMKiayN3oa5nsMVXY9MU0gBXtWpwkfEBxO3R8r7QkK2OGL
X-Received: by 2002:a05:6820:c2cc:10b0:689:dfc8:5e3c with SMTP id
 006d021491bc7-69462e21091mr7845143eaf.3.1776850479020; Wed, 22 Apr 2026
 02:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776266307.git.bertrand.marquis@arm.com> <7053b8c14bbe50cc855dad0a82cde2bb10153d2b.1776266307.git.bertrand.marquis@arm.com>
In-Reply-To: <7053b8c14bbe50cc855dad0a82cde2bb10153d2b.1776266307.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 22 Apr 2026 11:34:27 +0200
X-Gm-Features: AQROBzCz5_jC5njY6PS3Hdagxogu3g53p99f8Avu2f8VjavqSIrjuDcbIdWOC9k
Message-ID: <CAHUa44HaFjLf9CcSJMDD5O-R24_Kq_7zabw2Op2X=P1gj+85Sw@mail.gmail.com>
Subject: Re: [PATCH 2/6] xen/arm: ffa: Track hypervisor notifications in a bitmap
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1776850481-83961161-D049620E/0/0
X-purgate-type: clean
X-purgate-size: 5630
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,mail.gmail.com:mid];
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
X-Rspamd-Queue-Id: 221574440E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bertrand,

On Fri, Apr 17, 2026 at 3:41=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Hypervisor notifications are currently tracked with a dedicated
> buff_full_pending boolean. That state only represents a single HYP
> notification bit and keeps HYP bitmap handling tied to single-purpose
> bookkeeping.
>
> Replace the boolean with a hypervisor notification bitmap protected by
> notif_lock. INFO_GET reports pending when the bitmap is non-zero, GET
> returns and clears the HYP bitmap under the lock, and RX-buffer-full
> sets FFA_NOTIF_RX_BUFFER_FULL in the bitmap instead of updating
> separate state.
>
> Initialize and clear the bitmap during domain lifecycle handling, and
> use ctx->ffa_id for bitmap create and destroy so the notification state
> stays tied to the cached FF-A endpoint ID.
>
> No functional changes.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa_notif.c   | 46 ++++++++++++++++++++++++++--------
>  xen/arch/arm/tee/ffa_private.h |  9 +++++--
>  2 files changed, 43 insertions(+), 12 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 07bc5cb3a430..d15119409a25 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -94,8 +94,15 @@ void ffa_handle_notification_info_get(struct cpu_user_=
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

Isn't this a functional change? Before this patch, we didn't consider
ctx->notif.buff_full_pending here. Am I missing something?

> +    }
> +
>      if ( notif_pending )
>      {
>          /* A pending global notification for the guest */
> @@ -174,12 +181,17 @@ void ffa_handle_notification_get(struct cpu_user_re=
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
> +        }
> +
> +        spin_unlock(&ctx->notif.notif_lock);
>      }
>
>      ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, w4, w5, w6, w7);
> @@ -207,12 +219,17 @@ int32_t ffa_handle_notification_set(struct cpu_user=
_regs *regs)
>  void ffa_raise_rx_buffer_full(struct domain *d)
>  {
>      struct ffa_ctx *ctx =3D d->arch.tee;
> +    uint32_t prev_bitmap;
>
>      if ( !ctx )
>          return;
>
> -    ACCESS_ONCE(ctx->notif.buff_full_pending) =3D true;
> -    if ( !test_and_set_bool(ctx->notif.vm_pending) )
> +    spin_lock(&ctx->notif.notif_lock);
> +    prev_bitmap =3D ctx->notif.hyp_pending;
> +    ctx->notif.hyp_pending |=3D FFA_NOTIF_RX_BUFFER_FULL;
> +    spin_unlock(&ctx->notif.notif_lock);
> +
> +    if ( !(prev_bitmap & FFA_NOTIF_RX_BUFFER_FULL) )

Do we need to check for FFA_NOTIF_RX_BUFFER_FULL? Isn't !prev_bitmap
more accurate, if any other bit would ever be used in the bitmap?

Cheers,
Jens

>          inject_notif_pending(d);
>  }
>  #endif
> @@ -426,12 +443,15 @@ void ffa_notif_init(void)
>
>  int ffa_notif_domain_init(struct domain *d)
>  {
> +    struct ffa_ctx *ctx =3D d->arch.tee;
>      int32_t res;
>
> +    spin_lock_init(&ctx->notif.notif_lock);
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
> @@ -441,10 +461,16 @@ int ffa_notif_domain_init(struct domain *d)
>
>  void ffa_notif_domain_destroy(struct domain *d)
>  {
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    spin_lock(&ctx->notif.notif_lock);
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
> index c291f32b56ff..5693772481ed 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -340,9 +340,14 @@ struct ffa_ctx_notif {
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

