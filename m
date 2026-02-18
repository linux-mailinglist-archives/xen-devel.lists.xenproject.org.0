Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAylK8wolmnxbQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 22:02:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BEF159BAC
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 22:02:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235993.1538803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsogF-0004hL-R2; Wed, 18 Feb 2026 21:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235993.1538803; Wed, 18 Feb 2026 21:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsogF-0004fO-OP; Wed, 18 Feb 2026 21:01:55 +0000
Received: by outflank-mailman (input) for mailman id 1235993;
 Wed, 18 Feb 2026 21:01:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CABg=AW=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vsogE-0004fA-GD
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 21:01:54 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cf616d4-0d0d-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 22:01:52 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-3870778358aso2511661fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 13:01:52 -0800 (PST)
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
X-Inumbo-ID: 0cf616d4-0d0d-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1771448512; cv=none;
        d=google.com; s=arc-20240605;
        b=EFO8xb18msWKMfGrRiUDonQeAz0i8Sje14oTGnbQGVn8VWnTls/Z2ZW0jsyrSyFcUq
         nNwBlzFRBcabJRzTIn8siomQiDglEbwCTAxGAErWI7WCXHoDebMfGamzTlvw5u6af8tf
         J+qmmM55ljc9jGMecPyyNFgzV7SFyLKME/jIWJipVT9fm4bO9wt0Zh57pJEu4OYUlImZ
         uid4H/6KjGsElGMTpep540iN5rKhF56OuH7FkRichryBxtVAANq+v7ai1/DrXXXMb9H5
         nzhMQd8ed4HbGSxR5n2gp98Dl1E2qUytkKuxJeHdrk46xhD16byOXynihIQARBxwJJhz
         kxZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TaaWYpn9TK4SHYazChCG6RzaF2w9QYkdXnL0D4nykk8=;
        fh=S1TgsMYO/ju21WOcmYTQxMlAU8ImCjuw50drwKkfBt8=;
        b=idnOncmPoDr6yNgtA1xLCHv+f/LFIQS4y93ig95eLFkqXcIEXdZa2MU+dt7cPz5Bs3
         HVjZ6epNwZB8VHAOkKyOOCy5zBbKTBSIIKIizmLyCia7Wm9Yw2J5FeWKGyf3IKaVs/X1
         nCqhfZvHRL4C+c59WBR2cJRCOSzP8ea3qRQ6cG7nJlPTEi/AUSozB1QDYgKAgywdk83v
         03LjeIzovhxcTXkWQ8kSIM8XPMag00AbvoulH5O3pNB7PTrvXEC14k4NQBGALvOyiFac
         tsofsOGHrnm9Hln1fFePTlT25NKc7cvTqIhai3V9sF3yZ532PQHsNj7ZuM9s3uhiirdG
         DyDQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771448512; x=1772053312; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TaaWYpn9TK4SHYazChCG6RzaF2w9QYkdXnL0D4nykk8=;
        b=ey5L4IqxjgEX2jz1g+ycskO4yi2GtH5yLGlSMFPDuob7lFuya1x8i2RLg3M9GFh3bo
         04VbLkSuloYxHpUx8UPQKN2A4+FAQHB1rNKxOoEZ9FWRNy13Di2ZVY3rNG75Q0Df9rO2
         8iTS47XoIqHIFWp9/5+1LOZrhK42h/l6TssoG8lZO2tXX3vPpbJlyJPGRMbSMV82L/dG
         fWJx8VOKWsL/zMiQhxP0NAvMhgq1VfPOedxT378xqSO9/s57h8Aqa2MKi7IgDLd8AJgB
         xD38POvtFt1iickEKeZdzjqVJ0yw3scMzd+hUx+fDx87XeVD1gSGg1OOMLnxAttKV58T
         UDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448512; x=1772053312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TaaWYpn9TK4SHYazChCG6RzaF2w9QYkdXnL0D4nykk8=;
        b=ia4KsXFmIOgZOKkQRJ71JSZ+UZgEq+88fn2kK9DFZc+5WzWHyDgrgWxcNnHqKt39O5
         Mh4oZfBL/FhdPjFO+T/8OIryDE/ae/zk61WcQAtzcWRscIOMzW3suOAhhHHpC08n10+s
         R60DKhlK6+ghFIyCTuwUCBtKZX8JypPMaCi/ij4W5RBVMWUI35QVBUemlrsT5JEyi4B5
         VYT78Fin31I/rXdNUmGhJeASPoU78GO9MknYnXQ+zomzvnAqbti4bV3ROfcfzafQ/3Bh
         PgW40W4dFe4uR0cZbq9gi/totG3hixN5RhDSVXogU9jOCHnEnFRcQXe0N1e5QJHmeX3r
         uWnA==
X-Gm-Message-State: AOJu0YwElQ94FiB34CvhuChD5X1b/jciUTkApwk/253u7hN5ew9NETJ7
	zdJ5wVNthnxyV1/jrcrBpyzUAZyWCj67D2aRKgCd/4YaV7yKDxTq1nR7XaYFVTlgzp+eDnMum9q
	okvB7AWvcyNa0bQIGqYiAKRPePSmk3EE=
X-Gm-Gg: AZuq6aKTk08HC7z3ricM/KLEwkVzJ7AWc621VrVTlU9N9wwKFZySsw/0AOribQjtc7e
	H/gwtQuV9fZpNh6W3XzkuB7M+lbAqEEvc3ZHeFSH6t0y6TtBUiKzCZnC8DwUumXZLcBh4is2+UH
	QpJ2eP64JZrXoJTXtuJR+N9nNFaJQStpPBP+P5IasLgbG408vUjv/vrHmZTm9ZDBvl7tcTYbEup
	eDqQ0F4Y2fbn8chFub1G/TUo0kb1nbxnx2+JEf0b9B9h2oJ+k27It10jGEHR7t4AhK7/VyByR+a
	Qu8KMA==
X-Received: by 2002:a05:651c:1442:b0:387:1ba5:99ca with SMTP id
 38308e7fff4ca-38810576c5bmr55472961fa.31.1771448511998; Wed, 18 Feb 2026
 13:01:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770046465.git.mykyta_poturai@epam.com> <13bab832bed00832d7597105a33ab2f215e626ce.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <13bab832bed00832d7597105a33ab2f215e626ce.1770046465.git.mykyta_poturai@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 18 Feb 2026 23:00:00 +0200
X-Gm-Features: AaiRm529IKmljNPd7An2WyanH56X6HM_g-zRbmWyByLv-WdgMIC_WBTlSqjBpJo
Message-ID: <CAGeoDV_ftsmBPW+246n+5rDOnh2UR8BoLMy5DbXbVTLG0jmogA@mail.gmail.com>
Subject: Re: [RFC PATCH 16/19] arm/gic: Fix LR group handling for GICv4
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 20BEF159BAC
X-Rspamd-Action: no action

This commit can likely be dropped if we apply the approach from the
review of the previous one (i.e. do not introduce per-domain GIC_V4/V4_1
versions in the domctl ABI and keep guests on XEN_DOMCTL_CONFIG_GIC_V3).

In that case current->domain->arch.vgic.version would remain GIC_V3 for
v4-capable systems too, so the existing checks (=3D=3D GIC_V3) already cove=
r
the intended behaviour.

If we keep v4/v4.1 as distinct internal values, then using >=3D GIC_V3 is
fine, but please avoid relying on numeric ordering of enums unless that
ordering is explicitly guaranteed.


Thanks,
Mykola

On Mon, Feb 2, 2026 at 6:14=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epam.=
com> wrote:
>
> Extend the check to mark interrupts as Group1 for all GIC versions >=3D 3
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/arch/arm/gic-v3.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 07736179db..1cb3169b72 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1366,10 +1366,10 @@ static void gicv3_update_lr(int lr, unsigned int =
virq, uint8_t priority,
>      val =3D  (((uint64_t)state & 0x3) << ICH_LR_STATE_SHIFT);
>
>      /*
> -     * When the guest is GICv3, all guest IRQs are Group 1, as Group0
> -     * would result in a FIQ in the guest, which it wouldn't expect
> +     * When the guest is GICv3/GICv4/GICv4.1, all guest IRQs are Group 1=
, as
> +     * Group0 would result in a FIQ in the guest, which it wouldn't expe=
ct
>       */
> -    if ( current->domain->arch.vgic.version =3D=3D GIC_V3 )
> +    if ( current->domain->arch.vgic.version >=3D GIC_V3 )
>          val |=3D ICH_LR_GRP1;
>
>      val |=3D (uint64_t)priority << ICH_LR_PRIORITY_SHIFT;
> @@ -1455,10 +1455,10 @@ static void gicv3_write_lr(int lr, const struct g=
ic_lr *lr_reg)
>      }
>
>      /*
> -     * When the guest is using vGICv3, all the IRQs are Group 1. Group 0
> -     * would result in a FIQ, which will not be expected by the guest OS=
.
> +     * When the guest is using vGICv3/vGICv4/vGICv4.1, all the IRQs are =
Group 1.
> +     * Group 0 would result in a FIQ, which will not be expected by the =
guest OS.
>       */
> -    if ( vgic_version =3D=3D GIC_V3 )
> +    if ( vgic_version >=3D GIC_V3 )
>          lrv |=3D ICH_LR_GRP1;
>
>      gicv3_ich_write_lr(lr, lrv);
> --
> 2.51.2

