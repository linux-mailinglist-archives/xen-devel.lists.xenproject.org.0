Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKP6LxajlWmaSwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 12:31:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7F5155E8D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 12:31:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235474.1538453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsfmA-0004nB-S5; Wed, 18 Feb 2026 11:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235474.1538453; Wed, 18 Feb 2026 11:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsfmA-0004l8-PW; Wed, 18 Feb 2026 11:31:26 +0000
Received: by outflank-mailman (input) for mailman id 1235474;
 Wed, 18 Feb 2026 11:31:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CABg=AW=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vsfm9-00046b-9i
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 11:31:25 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ab3731a-0cbd-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 12:31:23 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-388126f79bcso37393361fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 03:31:23 -0800 (PST)
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
X-Inumbo-ID: 5ab3731a-0cbd-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1771414283; cv=none;
        d=google.com; s=arc-20240605;
        b=A65kJh32mXSBGmgaxA8thhfjaStrut5+hJ46vvgP4LgDgsKSojGskvwq9cTRdmc8Ti
         b6a2FsCpI5dUAt3ppuacFJd1enafxfLnefGPkj9t/skju8wqV7K9kcevItL193cZn2NQ
         5RDrFF5DfvCXPHnMcaDSTaHy+DdUy7T2GNI48/wtH/zsiVsnahxKiIZQOI3GhOYkAhfd
         zspQqwRbcIxNvVlle03Ud/ZZL+D7NIIWlhwfNEZbFqBNl9Ff7KJLObcxncVkSK31AWAh
         LNIHMzYawn8BZ/PfP442VEFN2S71J7sV+Y09XyTfb3KElF0cVP4dPtJjtpb6p92+eK5L
         fJ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cs08etBiNYUYlD0ODZUoYef1Y/MZqFHenbZZSUV9sQI=;
        fh=S1TgsMYO/ju21WOcmYTQxMlAU8ImCjuw50drwKkfBt8=;
        b=QK9HiIPi22OCkMT3fjV/N+07+dfmbx5V45FnhZJK9zyCcGlYinxPwoiXm5ge8sMENb
         lQQBljo6twYG39/faNlsluUU4I20RMCIfO5bPOso9LiVKXSG6wzzBzXliXjlUksvuAcY
         gs4b0jkGl5MxLI6B+/FNeZJqa71dDS48NLVeqf9lXhPTK+mjY4A1/hkCuHiJNXXwROYW
         Tk8gMVfESZ5fBSiSlh0A1HWX3DZ84+O2oVPuufSsQlggN5xiibIjVlFI4D8mBBKFrS/Q
         JkCsDOER/QjHkzVjCdxL76QsaF+lzO8zOriwHniRD4gT0I/IRokqrDzJN1ssHR0ffDQw
         TZag==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771414283; x=1772019083; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cs08etBiNYUYlD0ODZUoYef1Y/MZqFHenbZZSUV9sQI=;
        b=JUbIMC+2EP3vr4RA+yfqRo9Btqmxy2mw1awA6MAyBJaDAzNpULh8QzCbgMhcEYvlZv
         MHf9fF24FgulZ3qm+uSNrn9fwxV4TkvaiU+ZLkUlC8fBT8STaHbaILDYiNx3xWgkm9Nn
         tY5DvPgK2qyMV8tNrZF77tLdhp6gWeWa7mXCHAan2Xcqg4HNPP9m3+CObkU2VTHDvzri
         xUWskdKFFH8Z/bBDEGbgXZn6iFRnJcDtz59Pwh92/UM7P4VOSxTSMPgIwtYM0UiTrGj5
         YsBAJn/lUuupN5xJfSk5fb/khyDaTwScj3atWzzEfofu3tDSRbh2wgKo+SJK5gWZnhhH
         iMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771414283; x=1772019083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cs08etBiNYUYlD0ODZUoYef1Y/MZqFHenbZZSUV9sQI=;
        b=iaciHwbkFW1wAE39CxZTOMmsMfce7cqPye3yB7y3CAKhluFh0UJTA0/LQofl05gPam
         IlRZa6RqHARq9R1IqtY25UZq46MFk+q/yFNPfilv4FX6cRQNQlAAH5C6RE4QTFmPvyus
         9+TLOAOVvOm/Kg4cOVP1YH8jO2d+h2IL2OXu4g4WRmJu5IvfyiFgUx7AWa7YZPPlF+kV
         HFHUlKILvh2+zbS4/E0i52NPJFs6vs7SOMcUwsaPZA4pZi6ybMDfIxpkbohVMDJu+Oya
         3Es4VwvIKNGlTphZBi+Y0zD7/+srXp5ySf50MtemaaPpd1/bneC1PMZ0pLYcywQ0vwDX
         Oqtw==
X-Gm-Message-State: AOJu0YzIdOO8U6V0FfojSysrVVmP10foijyzMbiXPZOUMLEl1u6SpZ91
	6yQ5ZS/bUNFkYmEbVmLAVKIoNfbdoMRmL/od+5Edafp/kE3rUXWPtF4cldTa03t1XRv80L5/mt3
	6lNDAkUQWIepzHK6z20cx4g4hrZ5OPPE=
X-Gm-Gg: AZuq6aJTAHBfpeISCadUkoJtpSvbIhOjYrIba9XfUzP0/L3gBq9OyeriVDdN1n0DtrY
	7Kzvr36Hkxm9Ag1bbdddrE88jwYLzS27VcnstseEEH8mt6mReERyzqyyMqnn5jPHmYuzQg1qO+d
	QUIicSCcXuxEgNHPajEYBr0uTMEZ/E2DPHQXOxK2rQgZmcoPDvLNKCQJ3UjxhzO/xYkTtD2wtSd
	JIofzqT3CGo5+WQNpTljKE/J2bDCbE0KSUAZQI5WAwoiTUMtOyMYxXhnaig10uGpM/rVysTKfbs
	AC3xvA==
X-Received: by 2002:a2e:be83:0:b0:386:9653:5d6e with SMTP id
 38308e7fff4ca-38846e1c90dmr5404031fa.34.1771414282745; Wed, 18 Feb 2026
 03:31:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770046465.git.mykyta_poturai@epam.com> <b15ec6f42418d7c0669d551e42be1d1b75839df8.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <b15ec6f42418d7c0669d551e42be1d1b75839df8.1770046465.git.mykyta_poturai@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 18 Feb 2026 13:30:00 +0200
X-Gm-Features: AaiRm51Fr3YTyjMCneA3a-mdmhwduL52fJf_BXgXYD2zkSB0SaQyfD3EZGcDbsE
Message-ID: <CAGeoDV_=tpv09wibQcrazt1XvQY=adLDXB7Z+duuN1p5gwrJrw@mail.gmail.com>
Subject: Re: [RFC PATCH 12/19] arm/gic: Add VPENDBASER/VPROPBASER accessors
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3B7F5155E8D
X-Rspamd-Action: no action

Hi Mykyta,

Thank you for the patch!

On Mon, Feb 2, 2026 at 6:14=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epam.=
com> wrote:
>
> Implement accessors for GICv4 registers VPENDBASER and VPROPBASER.
> VPENDBASER access needs special handling to clear the Valid bit before
> writing a new value.
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/arch/arm/include/asm/gic_v4_its.h | 38 +++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/xen/arch/arm/include/asm/gic_v4_its.h b/xen/arch/arm/include=
/asm/gic_v4_its.h
> index fb0ef37bbe..ba81b25bde 100644
> --- a/xen/arch/arm/include/asm/gic_v4_its.h
> +++ b/xen/arch/arm/include/asm/gic_v4_its.h
> @@ -17,6 +17,8 @@
>   * along with this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>
> +#include <asm/arm64/io.h>
> +
>  #ifndef __ASM_ARM_GICV4_ITS_H__
>  #define __ASM_ARM_GICV4_ITS_H__
>
> @@ -50,6 +52,42 @@ struct event_vlpi_map {
>  };
>
>  void gicv4_its_vpeid_allocator_init(void);
> +
> +#define GICR_VPROPBASER                              0x0070
> +#define GICR_VPENDBASER                              0x0078
> +
> +#define GICR_VPENDBASER_Dirty                   (1UL << 60)
> +#define GICR_VPENDBASER_PendingLast             (1UL << 61)
> +#define GICR_VPENDBASER_IDAI                    (1UL << 62)
> +#define GICR_VPENDBASER_Valid                   (1UL << 63)
> +
> +#define GICR_VPENDBASER_OUTER_CACHEABILITY_SHIFT         56
> +#define GICR_VPENDBASER_SHAREABILITY_SHIFT               10
> +#define GICR_VPENDBASER_INNER_CACHEABILITY_SHIFT          7
> +
> +#define gits_read_vpropbaser(c)         readq_relaxed(c)
> +#define gits_write_vpropbaser(v, c)     {writeq_relaxed(v, c);}
> +
> +/*
> + * GICR_VPENDBASER - the Valid bit must be cleared before changing
> + * anything else.
> + */
> +static inline void gits_write_vpendbaser(uint64_t val, void __iomem *add=
r)
> +{
> +    uint64_t tmp;
> +
> +    tmp =3D readq_relaxed(addr);
> +    while ( tmp & GICR_VPENDBASER_Valid )

The loop clearing GICR_VPENDBASER_Valid has no timeout.
If the bit never clears, we can spin forever. Please add a bounded
retry (and warn on timeout), similar to other polling paths.


Best regards,
Mykola

> +    {
> +        tmp &=3D ~GICR_VPENDBASER_Valid;
> +        writeq_relaxed(tmp, addr);
> +        tmp =3D readq_relaxed(addr);
> +    }
> +
> +    writeq_relaxed(val, addr);
> +}
> +#define gits_read_vpendbaser(c)     readq_relaxed(c)
> +
>  #endif
>
>  /*
> --
> 2.51.2

