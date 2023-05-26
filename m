Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4829B712AA1
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 18:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540168.841733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2aJC-0006lP-N9; Fri, 26 May 2023 16:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540168.841733; Fri, 26 May 2023 16:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2aJC-0006id-KD; Fri, 26 May 2023 16:28:54 +0000
Received: by outflank-mailman (input) for mailman id 540168;
 Fri, 26 May 2023 16:28:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SRto=BP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q2aJB-0006iV-FA
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 16:28:53 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 668a4aa2-fbe2-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 18:28:52 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51458e3af68so1427299a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 May 2023 09:28:52 -0700 (PDT)
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
X-Inumbo-ID: 668a4aa2-fbe2-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685118532; x=1687710532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ti7bS5wJW8UvsSbPQEU2t0yrsJeXnjnzm7h2Il6etAs=;
        b=CuFQttPH807VxteXnOBThYKabFLqRFET9y8FVtIWtSX1DhFCxWoV6woywAE1ZmGhcr
         48cDlK8aXLx3I5Q+n16k8x3pKu9n0TBX58NtlPp87j5pBfS6npg86IUeNS+ebNgPG3GR
         2YvwSnYwTYmkh47o5pHESoG0oo2fHhJBH2lWH95OBxSWtiDjDuhukPmplMtWuC8Wr3oZ
         e+DolZoD26JMk+o400Mk1AolfvtpfFkCltA82ZEVgZtuTduYDwCEg/HlAI0MRR4XcF3z
         i0xRxx4X4X2vgx39KzTaPG446g7mBiCIyPoBialXb/ZFles30OYMuMj9SyjuayTAjenO
         eV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685118532; x=1687710532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ti7bS5wJW8UvsSbPQEU2t0yrsJeXnjnzm7h2Il6etAs=;
        b=ZfO8gAyMClP+1zRTvSB6RIXxPXaO/+zfsvmSdK1qz7ks7KpWZkLn9t3k6dMn4bwpZf
         C1XmTvG9VvCs3tR3KLk2yLis/kAgDzfeecEq/yECGB+GABhnBu1DMD4UIz1LP2JOi8pj
         rkDL7c56y7y2LR1OficmJOqlWRJ059Fbz4OXixr+/CoMXvpAwmucVi5cVtsRU9PGtWB+
         UKPlGT9yPti88UM+/ZQFL8BhvCtSrVP+T7wgeQZJBAzBeFEVb2j/ptmHdER9f/L4In9m
         YAq9luwbC/u2r52ndp0S9AOQOuzq1cSFewu97nFE5EzuwnaTavrfHEP/zoRRWUfkxImT
         BkyA==
X-Gm-Message-State: AC+VfDwdOcJN440lIH+nuqW/bDKll3Ux/nh/yRtBRcoXhp1Yn28Nh6NA
	FkNSrbXrx5UVtS9svTAtO/UDqu+SBPntYapiLDg=
X-Google-Smtp-Source: ACHHUZ4JxyW/MrCdN/raA4Tf2RM8IoZptvNwS6W1fHLbkGynxSQiztoMWgs9gJQ4H+phb/8OXXJjniaYT4frqJCsY80=
X-Received: by 2002:a17:907:3e02:b0:966:2fdf:f66c with SMTP id
 hp2-20020a1709073e0200b009662fdff66cmr2813222ejc.3.1685118531674; Fri, 26 May
 2023 09:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230526150044.31553-1-alejandro.vallejo@cloud.com> <20230526150044.31553-3-alejandro.vallejo@cloud.com>
In-Reply-To: <20230526150044.31553-3-alejandro.vallejo@cloud.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 26 May 2023 12:28:39 -0400
Message-ID: <CAKf6xptoZhWyxHUSQ3UiLz_ysRuC7gQ2xSTAXLBp008H5TX40Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] x86: Add support for AMD's Automatic IBRS
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 11:01=E2=80=AFAM Alejandro Vallejo
<alejandro.vallejo@cloud.com> wrote:
>
> In cases where AutoIBRS is supported by the host:
>
> * Prefer AutoIBRS to retpolines as BTI mitigation in heuristics
>   calculations.
> * Always enable AutoIBRS if IBRS is chosen as a BTI mitigation.
> * Avoid stuffing the RAS/RSB on VMEXIT if AutoIBRS is enabled.
> * Delay setting AutoIBRS until after dom0 is set up, just like setting
>   SPEC_CTRL.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---

> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -390,7 +390,7 @@ custom_param("pv-l1tf", parse_pv_l1tf);

> @@ -399,7 +399,10 @@ static void __init print_details(enum ind_thunk thun=
k)
>      if ( max >=3D 2 )
>          cpuid_count(7, 2, &tmp, &tmp, &tmp, &_7d2);
>      if ( boot_cpu_data.extended_cpuid_level >=3D 0x80000008 )
> +    {
>          cpuid(0x80000008, &tmp, &e8b, &tmp, &tmp);
> +        cpuid(0x80000021, &e21a, &tmp, &tmp, &tmp);
> +    }

Do you need to check boot_cpu_data.extended_cpuid_level >=3D 0x80000021?

Regards,
Jason

