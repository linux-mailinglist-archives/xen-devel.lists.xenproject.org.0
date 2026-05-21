Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WriBBzhVD2oFJQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 20:55:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CED5AB488
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 20:55:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315825.1585511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ8Xz-0006QB-3C; Thu, 21 May 2026 18:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315825.1585511; Thu, 21 May 2026 18:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ8Xy-0006Nd-WD; Thu, 21 May 2026 18:55:07 +0000
Received: by outflank-mailman (input) for mailman id 1315825;
 Thu, 21 May 2026 18:55:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQ8Xx-0006NX-Si
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 18:55:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ8Xx-003c8G-9K
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 20:55:05 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f54d9-bab6-0a2a0a5309dd-0a2a45049bd8-28
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 20:55:05 +0200
Received: from [209.85.208.174] (helo=mail-lj1-f174.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f5508-1dec-0a2a45040019-d155d0aeb1cd-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 20:55:05 +0200
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-39393c1b5aaso10738411fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 11:55:05 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1779389704; cv=none;
        d=google.com; s=arc-20240605;
        b=Dn19TCDwli0YMOCY1Sw6oU1uUIWugL2km5rfe4lNNufDDrzBiKOTV5Np4q3PPNgE/S
         YwiMslzy6XudACcHHIgzC7aqYX+UOASGPSzPXFxvrJWEFuMoolzZk9cFwkMFTdkycnhE
         oMm5pi7cruU46Qf/CN4hConaejDsvksXt2+mtcSgLXT7LqGWQzfiyfDBwTTsU6IE1naR
         SSCe0RQ3yZ8G2quB5ev/yBVQ5qjrj2O/0dxWxdu98Ce2AbPNY0QavQPhgS61Kvty7rQf
         1lBObC4ca3PDK2pIghJ8ooP24sffHyfd1+qv8ay3rX2F8rDAE4zQUivxmIOsW5F/kv9q
         oKng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/3rjbGp0HttxGbdO7stMCJxHdJRRoeSvCJWFnm0/r4k=;
        fh=LYPtEiP/QdkSJ/aZ/WXlTr0/QjWEldrtJeLO5/sVid8=;
        b=YanrXs/7dy2uZhAoLcf9375Aq8u5lugoeXtbMjHhBk5nIZ3Rvi/CZ2l6IkYNmdIi6v
         GPsXYIqcQkONm5pMu/g10rvTy6CMPnfVvpfNrwH0ZUurC//P0WmWDJF+n1QqUr1Dh8dK
         NDCibqqX7Dhmuk1UzGidl6CCDSQ7UApJgiyLdLFN8GxgebskMdHRgWmDe7PTxuXDo4Kv
         PKO3lcTt8lDdRakGcbUC2jYwGX7m9hktBbdNeByqCGwwcRtEFSciqDqQJ262UDycjfb5
         wICyMf24XjFMpfq3MHtEFjBI3cq/ur1jJ362rPOhX4KmtznD5gEAt3F9R4IkhupWNoPb
         gTmQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779389704; x=1779994504; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3rjbGp0HttxGbdO7stMCJxHdJRRoeSvCJWFnm0/r4k=;
        b=feqtx/EAxuhXbyxRw8REO8Cmlo4z90G58KoImZ647WcsflrRqfeCiE13HYwseZ0MHq
         p0Q1D2Mjj8h50bGAUOYzQP2ttngSxaYWHL4aic62w7/1XI7ppoUNsXjgMepqBH9CiA9k
         USfca1/Zm3pOPr8/bP2eHP4vvfUIYgXgTjRo+s3+Mwnvx97mtKLrzXwE1x+OLgOL6gGW
         dUm9AWoQKTxgrg3wEqr+GJBx4fTOLCdgYsz6bYcpk2VapFSqaqThlhgOH/YqPf2UnFrx
         4ZunTPor7xEpwRiR5Rf639Uj1fyqVv+aQXlcODfFaPWM63uQPOTJ9lBhfrvsYvu4y7A9
         FXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779389704; x=1779994504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/3rjbGp0HttxGbdO7stMCJxHdJRRoeSvCJWFnm0/r4k=;
        b=nV6/JHiBApw9gRhCR1l+li9X+4VcTGmQk4f36oPxfuJaDwcExo/RPd0FNxeXocNArk
         5NkB+osYbY7kDpCKkTYuRtx7voQfL3FXdE4vobURcE9hohhAZeVN2fR0lgBGQEtbaFKF
         fUhwRpr5BZ+yVEMCJQI/SGZLzPXlUSzOOzoWkGQMU4fEqgCnvD1vA2/rwpu9nYohpAXI
         +HLXdEV5WauSpwdDyhEuw8uCjaKHPDYrQmCyOiFkTNdhdz+urB3Wl+7jzU+KG+sWEvER
         WMWjAbAb1vda1M/NCUg8kSVM0lTa2Fi9sJhnOIhlMLq2e0naN5HlOfIq/8wBAQgW0qKh
         aK/g==
X-Gm-Message-State: AOJu0YyF93OXplqqPy1uoqUOEh+HKKCO1/fbxHhxYV4zptQ5YunqOS7X
	1ETHg+gLa/JNTTGSh2Mmdu6objY0xpXMzeifU9GqlEauVN7BZa4E6Q5U/bDlBtnOKi7TLtT6GSj
	juK2QEr4ichewaVpqHIKoQkS0DwfHkpBRKXW7Tew=
X-Gm-Gg: Acq92OEbD3F+cw3jqJEHGLiTlA02BC0aluwrsaF56GYBBgNj88iyhrauqv7sC2fsxui
	TuFzc9PqN9sjcqOeH8lUcl7mkEy71W22qh+df++M3JXx/xEtZe2ttwdyrwCJavSge8ojW1OI9uD
	PjW8JZjbOjv6ps/07Yv7+Ez4yKzShJcFs8iTutvUL+Z9Ltc8BeSW74OBJZMIImAjRupZ5s46e09
	0Q5AEQ6mxa2JRmIXWQ2u7B+1sN01k3rvy61KT1Jt2d+qM8j1KhwT1gNsOzr2sJfP1BbvpcTocLn
	QYEw
X-Received: by 2002:a05:651c:150c:b0:393:fa0f:d64a with SMTP id
 38308e7fff4ca-395d8d82e30mr371051fa.28.1779389704281; Thu, 21 May 2026
 11:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <998162706f89bb3100bda409d8fde3c8b143eae6.1777886129.git.mykola_kvach@epam.com>
In-Reply-To: <998162706f89bb3100bda409d8fde3c8b143eae6.1777886129.git.mykola_kvach@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 21 May 2026 21:54:52 +0300
X-Gm-Features: AVHnY4I-IpgjoYId6sqvHLdqAjJa9nS733RLjNqqzF66xXCS7KlCmc2D5iauR44
Message-ID: <CAGeoDV85LvygjSYfma-CLFiZ8Ubc-q0=T4M070bc_67OL=0K=A@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: scan CLIDR Ctype fields upwards when probing LLC
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Luca Miccio <lucmiccio@gmail.com>, Carlo Nonato <carlo.nonato@minervasys.tech>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1779389705-291763FF-D72511D3/0/0
X-purgate-type: clean
X-purgate-size: 3964
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,gmail.com,minervasys.tech];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo,epam.com:email,xenproject.org:url];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:lucmiccio@gmail.com,m:carlo.nonato@minervasys.tech,m:marco.solieri@minervasys.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 78CED5AB488
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Adding Luca, Carlo and Marco for visibility, as this patch touches code
based on Luca's original work and signed off by Carlo and Marco.

The patch already has Luca Fancellu's Reviewed-by. Please let me know if
you have any concerns.

Best regards,
Mykola

On Mon, May 4, 2026 at 12:21=E2=80=AFPM Mykola Kvach <xakep.amatop@gmail.co=
m> wrote:
>
> From: Mykola Kvach <mykola_kvach@epam.com>
>
> get_llc_way_size() currently scans CLIDR_EL1 Ctype fields from the
> highest level downwards and stops at the first unified cache it finds.
>
> However, CLIDR_EL1 describes the cache hierarchy from Ctype1 upwards.
> Arm ARM DDI 0487J.a, D19.2.27 says that once software has seen a
> Ctype value of 0b000 while reading from Ctype1 upwards, no caches
> manageable by the architected set/way maintenance instructions exist at
> further-out levels, and the higher Ctype fields must be ignored.
>
> The current reverse scan can therefore select a unified cache level from
> a Ctype field above the first no-cache level. Such a field is not part of
> the architecturally described CLIDR/CCSIDR cache hierarchy and should not
> be used for selecting the CCSIDR level.
>
> Scan Ctype fields from L1 upwards, stop at the first no-cache level, and
> keep the outermost unified cache observed before that point.
>
> This preserves the result for regular cache hierarchies, while avoiding
> selection of an architecturally ignored Ctype field.
>
> Fixes: f4985fce6f0b ("xen/arm: add initial support for LLC coloring on ar=
m64")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> This patch follows the xen-devel discussion:
> https://lists.xenproject.org/archives/html/xen-devel/2026-01/msg00345.htm=
l
>
> In that thread, Michal noted that the reverse scan was a simplification
> rather than an intentional requirement, and that changing the
> implementation would be fine.
>
> Testing performed:
> - standalone synthetic CLIDR tests covered both regular and pathological
>   Ctype sequences and showed that the forward scan ignores unified cache
>   levels above the first Ctype =3D=3D 0b000 while the reverse scan can pi=
ck
>   them
> - Renesas H3ULCB booted with llc-coloring=3Don
> ---
>  xen/arch/arm/llc-coloring.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> index 6f78817c57..3783f4c824 100644
> --- a/xen/arch/arm/llc-coloring.c
> +++ b/xen/arch/arm/llc-coloring.c
> @@ -22,21 +22,33 @@ unsigned int __init get_llc_way_size(void)
>      register_t id_aa64mmfr2_el1 =3D READ_SYSREG(ID_AA64MMFR2_EL1);
>      uint32_t ccsidr_numsets_shift =3D CCSIDR_NUMSETS_SHIFT;
>      uint32_t ccsidr_numsets_mask =3D CCSIDR_NUMSETS_MASK;
> -    unsigned int n, line_size, num_sets;
> -
> -    for ( n =3D CLIDR_CTYPEn_LEVELS; n !=3D 0; n-- )
> +    unsigned int n, line_size, num_sets, llc_level =3D 0;
> +
> +    /*
> +     * CLIDR_EL1 Ctype fields are interpreted from Ctype1 upwards. Once =
a
> +     * no-cache level is seen, higher Ctype fields are architecturally i=
gnored
> +     * for the CLIDR/CCSIDR set/way manageable cache hierarchy.
> +     *
> +     * Keep the outermost unified cache before that point.
> +     */
> +    for ( n =3D 1; n <=3D CLIDR_CTYPEn_LEVELS; n++ )
>      {
>          uint8_t ctype_n =3D (clidr_el1 >> CLIDR_CTYPEn_SHIFT(n)) &
>                             CLIDR_CTYPEn_MASK;
>
> +        if ( ctype_n =3D=3D 0b000 )
> +            break;
> +
>          /* Unified cache (see Arm ARM DDI 0487J.a D19.2.27) */
>          if ( ctype_n =3D=3D 0b100 )
> -            break;
> +            llc_level =3D n;
>      }
>
> -    if ( n =3D=3D 0 )
> +    if ( !llc_level )
>          return 0;
>
> +    n =3D llc_level;
> +
>      WRITE_SYSREG((n - 1) << CSSELR_LEVEL_SHIFT, CSSELR_EL1);
>      isb();
>
> --
> 2.43.0
>

