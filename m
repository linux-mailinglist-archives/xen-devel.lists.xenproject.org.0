Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAKCDVqB6GkILAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 10:05:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DB544339C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 10:05:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289948.1569610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFSZj-0006H7-TD; Wed, 22 Apr 2026 08:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289948.1569610; Wed, 22 Apr 2026 08:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFSZj-0006Ea-Os; Wed, 22 Apr 2026 08:04:47 +0000
Received: by outflank-mailman (input) for mailman id 1289948;
 Wed, 22 Apr 2026 08:04:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jens.wiklander@linaro.org>) id 1wFSZi-0006EU-2B
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 08:04:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFSZh-00A4dO-AF
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 10:04:45 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 69e88118-e002-0a2a0a5209dd-0a2a45019744-22
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 10:04:45 +0200
Received: from [209.85.161.54] (helo=mail-oo1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 69e8811b-c1f2-0a2a45010019-d155a136b9de-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 10:04:44 +0200
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-69485d0e4beso1132538eaf.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 01:04:44 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1776845083; cv=none;
        d=google.com; s=arc-20240605;
        b=QeFhT7zu+TQ8SpWPQ2j2vkq5+wXfz3+w4ct/+k1jTFUW06cG+4ic0tPC+92S/AQmZU
         uapKZrdfVobxabZVHCZ/sFwxM5PevrYCMRp0dQWRiBSFmyxpOr2u15V8gsAnS/ZkYOAn
         tuugwVJPiXkjfHstxws7oI8BZhfZyyneJHVIMRH9bznJNASTpXBtAGoVoGelYgNsxEd8
         ho3e+3j+IATpjpVU0ip5E7gSbuuC0aNIuUc1YbZyV+bNIQGOrMTdN+4edD5q2eknY78J
         Rs2bJPSc6GX3ZqQ9l+RbHk8hlqf7V85DwFQaXWyciZ6Ofsc5nBePitXyaZ1t+Ufap96N
         TRNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4rKad+UxzUkxCopKUoZk2Ve1GRQCNyIIC91C5R5IU0E=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=RtGFfiaf70Eey0klBuoJxeZBvIHzAD0u6097Rp4AEfY4ABeqKJbdfFGdfBBpr68tYQ
         W/mJeaHqKylpOn0bXuq+fR7sg5td5YxHo8k2oCIKcgd/NEP3drWAmHiHwVy1vgfQ8qon
         JpE8YlSI3WCGEf6/8xrOD/imQwoENXpYrG6QE4NqPkLJC4SUaOxCIHl9c2ZGG075Wqv0
         MZg5+VZCy4DKSyaoEK3KkHWDcIH2u2EY5d79KwHCkoNurdcHF4g56PigwZJKTY62AJ9b
         EhNvtIwlkcXLQtXFI5lQOeWiy8YGi5WJC8c362igNL8SqcN3HjSDGvOYOqIw1cvaPBj3
         7sHQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776845083; x=1777449883; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rKad+UxzUkxCopKUoZk2Ve1GRQCNyIIC91C5R5IU0E=;
        b=GirINLjg3ND9wQ4LYfS8hixUuEHeHbzvpW2akstVAj4w7WYb+1czViwg6zu7SCbrWw
         egnckGX2N8cqLmb8xHsypRDh+dnuaW6K4IjTym8P7tZoVQ7olHFuC83eY+9LMFI07xtm
         lWVBO7vXiyoIpqAyC5WU+691BX+GVEj9elSW+6mEZD25aATAuAGCo0weGHxNDWBnXdeY
         pk7uVLjezB3cq+OXuNuBRB8Foh+p7hHN//9xoqmNkxAq/0CacvLPBwDewzDbuPzpOKV3
         iw+uFVVu82fHboeGuHMG+s87KLKclmpA72FSBrLEeH+h7KK3kAnnFfYTLRXWra3iz+EV
         8e5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776845083; x=1777449883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4rKad+UxzUkxCopKUoZk2Ve1GRQCNyIIC91C5R5IU0E=;
        b=lfjrttmi4kKAbrPDjN5ndbQUfbumMZJVPZVTU6IGGmw4KTb82S7oPOI4bWEn3jsKp7
         VL5Vf5CUyN91PXJuS+/rIiScuCW0zT4VmJ0lIHvfmzjCok6OmSYEW215lEojJWNpQqAI
         VJ4Lx/PyVWbMKfHBTTXLlmqiQ1YDS4bls1m0MFCx/7O21uAVOIceC9oV80s6v3qBDGr2
         Eb0+lHZn8prnNiLD4eMbcrMYAQM5eqn9IfQuJEsubNwN+y42bGt9Iyu7fYKWIzlywscV
         Pr/9zYEZZ5vnxRuPBhT+WR5wYdlrrUhE/T2KS5upPBy00K9XJRW5yLhkvcNFIHxmhDJe
         gvbw==
X-Gm-Message-State: AOJu0Ywkz0RePUWkLMbs/tYkqA0icqYbyGPraL4XNuEFP2ilwvt46Zjh
	FbqnkwovCl0FIKYPgaNHxCQePXF7vLRKnk6UgZKXO6yChdoWch7SyQxvWb/6QLWkvhjW/c+9zwC
	nK4lWXMZnmlntw5Y25qBRnc6134sEK4B5rBYA/bkKwQ==
X-Gm-Gg: AeBDiev6x64eaDrQDzTHAHSN70wrUcpz6UVh6Rjgg4sYn/v38t2wEZd+/JYykJ5V4Zo
	u/EHJ9YltLBQRRhoqF4AqKQ+7CNzqf4f+KcE9xAa3KQiRwU1seJTMhkOgwi8DeOWO3G6XA3ajB6
	Xih+AuIBlwC6AzHwoESOQzlLkmqhP545QwCxnrlpUgIsAFtXTUwZOiu6WXCCNrM/5CQtmobA1pw
	41ASt0xEXO/Yi56BPOdXNjKEvrxTSD+0O3zgVt1y10thjJklEzJbVyuEDcl7H/yoAkO3NXU1gKE
	6ex6wkj32RKBaVbLDU69PnTnyT+GZKAP89hTbWe032N5JulUVziRJElS9QE=
X-Received: by 2002:a05:6820:4704:b0:683:70eb:2676 with SMTP id
 006d021491bc7-69462e21612mr8082241eaf.5.1776845083075; Wed, 22 Apr 2026
 01:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776266307.git.bertrand.marquis@arm.com> <a755456257eff6e4c5bd042ce4b0edff8f6630c1.1776266307.git.bertrand.marquis@arm.com>
In-Reply-To: <a755456257eff6e4c5bd042ce4b0edff8f6630c1.1776266307.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 22 Apr 2026 10:04:31 +0200
X-Gm-Features: AQROBzC7bB4FQig0mzTxUpS0in5VDMjc43F87Gjf8I43gViVqd5-DG2514z0Syo
Message-ID: <CAHUa44FwLG1GZwLX4E1v-73=H2RLv=whpDV5cJ3h6oqHyGOqvw@mail.gmail.com>
Subject: Re: [PATCH 1/6] xen/arm: ffa: Fix NPI injection when vcpu0 is offline
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1776845085-B5468FF4-383709DD/0/0
X-purgate-type: clean
X-purgate-size: 3712
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 66DB544339C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bertrand,

On Fri, Apr 17, 2026 at 3:41=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> RX-buffer-full notifications currently inject the notification pending
> interrupt through vcpu0 only. Secure notification delivery already walks
> the domain's online vCPUs, but the RX-buffer-full path does not. When
> vcpu0 is offline, the notification remains pending and the guest never
> receives it.
>
> Extract the common notification injection path and reuse it from
> ffa_raise_rx_buffer_full(). The shared helper delivers the global
> notification to the first online vCPU and keeps the existing ratelimited
> debug message when none are online.
>
> Functional impact: RX-buffer-full notifications are delivered even when
> vcpu0 is offline.
>
> Fixes: 3935c705688e ("xen/arm: ffa: Add buffer full notification support"=
)
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa_notif.c | 45 ++++++++++++++++++++----------------
>  1 file changed, 25 insertions(+), 20 deletions(-)

Looks good:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 186e72641237..07bc5cb3a430 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -19,6 +19,29 @@
>  static bool __ro_after_init fw_notif_enabled;
>  static unsigned int __ro_after_init notif_sri_irq;
>
> +static void inject_notif_pending(struct domain *d)
> +{
> +    struct vcpu *v;
> +
> +    /*
> +     * Since we're only delivering global notification, always
> +     * deliver to the first online vCPU. It doesn't matter
> +     * which we chose, as long as it's available.
> +     */
> +    for_each_vcpu(d, v)
> +    {
> +        if ( is_vcpu_online(v) )
> +        {
> +            vgic_inject_irq(d, v, GUEST_FFA_NOTIF_PEND_INTR_ID, true);
> +            return;
> +        }
> +    }
> +
> +    if ( printk_ratelimit() )
> +        printk(XENLOG_G_DEBUG "%pd: ffa: can't inject NPI, all vCPUs off=
line\n",
> +               d);
> +}
> +
>  int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
>  {
>      struct domain *d =3D current->domain;
> @@ -190,7 +213,7 @@ void ffa_raise_rx_buffer_full(struct domain *d)
>
>      ACCESS_ONCE(ctx->notif.buff_full_pending) =3D true;
>      if ( !test_and_set_bool(ctx->notif.vm_pending) )
> -        vgic_inject_irq(d, d->vcpu[0], GUEST_FFA_NOTIF_PEND_INTR_ID, tru=
e);
> +        inject_notif_pending(d);
>  }
>  #endif
>
> @@ -238,7 +261,6 @@ static void notif_vm_pend_intr(uint16_t vm_id)
>  {
>      struct ffa_ctx *ctx;
>      struct domain *d;
> -    struct vcpu *v;
>
>      /*
>       * vm_id =3D=3D 0 means a notifications pending for Xen itself, but
> @@ -277,24 +299,7 @@ static void notif_vm_pend_intr(uint16_t vm_id)
>       * it.
>       */
>      ACCESS_ONCE(ctx->notif.secure_pending) =3D true;
> -
> -    /*
> -     * Since we're only delivering global notification, always
> -     * deliver to the first online vCPU. It doesn't matter
> -     * which we chose, as long as it's available.
> -     */
> -    for_each_vcpu(d, v)
> -    {
> -        if ( is_vcpu_online(v) )
> -        {
> -            vgic_inject_irq(d, v, GUEST_FFA_NOTIF_PEND_INTR_ID,
> -                            true);
> -            break;
> -        }
> -    }
> -    if ( !v && printk_ratelimit() )
> -        printk(XENLOG_G_DEBUG "%pd: ffa: can't inject NPI, all vCPUs off=
line\n",
> -               d);
> +    inject_notif_pending(d);
>
>  out_unlock:
>      rcu_unlock_domain(d);
> --
> 2.53.0
>

