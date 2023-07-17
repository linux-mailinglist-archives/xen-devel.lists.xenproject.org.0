Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707BA7562AA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 14:24:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564495.881950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLNGf-0005HJ-Sa; Mon, 17 Jul 2023 12:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564495.881950; Mon, 17 Jul 2023 12:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLNGf-0005EC-P4; Mon, 17 Jul 2023 12:23:57 +0000
Received: by outflank-mailman (input) for mailman id 564495;
 Mon, 17 Jul 2023 12:23:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HNI8=DD=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qLNGe-0004wM-Py
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 12:23:56 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc8a16d8-249c-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 14:23:56 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9891c73e0fbso910431666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 05:23:56 -0700 (PDT)
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
X-Inumbo-ID: cc8a16d8-249c-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689596635; x=1692188635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGCp6f7Mw5KvfRfDIg00T++t7Y382z3wCSngcbz0yHA=;
        b=b3vrmuXAw/YPSMAUPnIkoLWe3nzg8Qar3zKhzc129h0pRSEBIBx/NNR0pSqtSkPVlF
         sgH3wpncxBueQv/MWQ/a/NqSWE1OPajDakgkGRLRErOWEjOSmP3Yl2mM3um0U+K2jx24
         8fPBWiAGYzqg8FtkBbWYvCm9wVBlS++8ZbVsWQtHAbh+bG1eSrt0UO/esUXm3ZBIk4GE
         wTrG+wbMCppy0LCX7uCsbybLQ5yKsYX8XZVlRphkeinHbzaQxeSW6YPhzOEkTUXW5c40
         CNlzbewKLbjqJ9/nUjp4vMlfvUa+ZC/oi+Wd4jMkyP7BxvDRrwHC++hQ8PQiqFSSee4S
         4yNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689596635; x=1692188635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGCp6f7Mw5KvfRfDIg00T++t7Y382z3wCSngcbz0yHA=;
        b=C1/A9UFx+DbNX+56Anu36V+aco5c0B8mTZoYlakKDhGiX4bYkDNXo3wDGrp7Swfodv
         57DatDGNAt9uq753fEo7C/FX1JZ9QgKDprfiVMucOs3I1sLJNHe5HOXDavrMwb1m98cL
         Q2yy8K+HsVBXqegOpbEI5UWnP0wSKmS5x8krbFtrtV0rWfsZKaZPECEda6zJHJj1nCpg
         x6DTzBqzhkNqKust7ZzNnhu0WOLusf6vjNIpk5dIuDvDz0/oMKWSXXDb0Xd/wtVtB8l2
         eLENTx97jNaN0VJFhfBu3TRLB7MIY+gmWVlepQTu1m+fYLT78jPjRzS+r66CsB7QxUS2
         +06Q==
X-Gm-Message-State: ABy/qLaVAQf+SCY2bUcELtbc86fQHuHRfZnNCYOnmaM7VOo8XyY+uiu0
	8EPXwqhzcZT98E0yG/bL0xCauRtFsLqHUG3Lvkw=
X-Google-Smtp-Source: APBJJlGeRbETzJLdzlq9FfardnZ5654DsXaZZ3iUrBNUrAdGv5tlMjBwvgw1hUlHGRvv6+hWPoul4pcYk06W2hmPyRM=
X-Received: by 2002:a17:907:ea6:b0:96a:2dd7:2ee0 with SMTP id
 ho38-20020a1709070ea600b0096a2dd72ee0mr11385984ejc.5.1689596635310; Mon, 17
 Jul 2023 05:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com> <6f462a2f-2e91-6397-a527-18eeade19476@suse.com>
In-Reply-To: <6f462a2f-2e91-6397-a527-18eeade19476@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 17 Jul 2023 08:23:43 -0400
Message-ID: <CAKf6xpvCFyQOqzekw7hV++yMPBDRCZxTagMQ7Fvbq244RrR9CA@mail.gmail.com>
Subject: Re: [PATCH 1/3] x86: allow Kconfig control over psABI level
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 8:34=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> Newer hardware offers more efficient and/or flexible and/or capable
> instructions, some of which we can make good use of in the hypervisor
> as well. Allow a basic way (no alternatives patching) of enabling their
> use. Of course this means that hypervisors thus built won't work
> anymore on older, less capable hardware.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

With two comments.

> ---
> TBD: Should we, just like for NX, add an early check in assembly code,
>      to have a "clean" failure rather than a random crash?

That is less confusing than a random crash.

> Whereas the baseline -> v2 step isn't much of a difference (we'll gain
> more there by a subsequent patch), v2 -> v3, while presumably (or shall
> I say hopefully) faster, yields an overall growth of .text size by (in
> my build) about 2k. The primary reason for this appear to be conversions
> of SHL-by-immediate to SHLX.
>
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -118,6 +118,36 @@ config HVM
>
>           If unsure, say Y.
>
> +choice
> +       prompt "base psABI level"
> +       default X86_64_BASELINE
> +       help
> +         The psABI defines 4 levels of ISA extension sets as a coarse gr=
anular
> +         way of identifying advanced functionality that would be uniform=
ly
> +         available in respectively newer hardware.  While v4 is not real=
ly of
> +         interest for Xen, the others can be selected here, making the
> +         resulting Xen no longer work on older hardware.  This option wo=
n't
> +         have any effect if the toolchain doesn't support the distinctio=
n.
> +
> +         If unsure, stick to the default.
> +
> +config X86_64_BASELINE
> +       bool "baseline"
> +
> +config X86_64_V2
> +       bool "v2"
> +       help
> +         This enables POPCNT and CX16, besides other extensions which ar=
e of
> +         no interest here.
> +
> +config X86_64_V3
> +       bool "v3"
> +       help
> +         This enables BMI, BMI2, LZCNT, and MOVBE, besides other extensi=
ons
> +         which are of no interest here.

Would it make sense to try and specify models?  According to this:
https://en.wikipedia.org/wiki/X86-64#Microarchitecture_levels

x86-64-v2
(circa 2009: Nehalem and Jaguar)
Atom Silvermont (2013)
VIA Nano and Eden "C" (2015)

x86-64-v3
(circa 2015: Haswell and Excavator)
Atom Gracemont (2021)

Regards,
Jason

