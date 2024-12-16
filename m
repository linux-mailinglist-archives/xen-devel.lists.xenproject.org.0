Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD709F3223
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 15:02:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858085.1270331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNBg5-0005tu-Ho; Mon, 16 Dec 2024 14:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858085.1270331; Mon, 16 Dec 2024 14:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNBg5-0005rq-EY; Mon, 16 Dec 2024 14:02:29 +0000
Received: by outflank-mailman (input) for mailman id 858085;
 Mon, 16 Dec 2024 14:02:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XQSc=TJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tNBg3-0005rk-IZ
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 14:02:27 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60c38d10-bbb6-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 15:02:25 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361c705434so29576855e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 06:02:25 -0800 (PST)
Received: from localhost ([85.152.134.39]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8060582sm8096186f8f.93.2024.12.16.06.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 06:02:24 -0800 (PST)
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
X-Inumbo-ID: 60c38d10-bbb6-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1734357745; x=1734962545; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yOYCFVZVcQRBuxGwcaYwMLPHbIXfU+0oS9iNm76wMI=;
        b=g78HUdkWqNyGFiEifAIrOeZcsYDxkRQRa5hIBlu+I9E6HGVxKuuyOxei7/K7ILRCmp
         Jv606bMgqJcTx2Yx7WQtQJH4JooMGp+43alaaVZ2HtM39SXFyW2gxiltoXdXLYURsN5R
         nTR3qCH8oKJGBv9fVtAld9p8nmg7Hz5pkb+PM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734357745; x=1734962545;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4yOYCFVZVcQRBuxGwcaYwMLPHbIXfU+0oS9iNm76wMI=;
        b=E8LbRBFUI24CvCW8WnAdsd8OszIQ4FjxURYcY5NWlAXqWjCkdKh+DymFfbxizQpn6X
         yf7GlOwGkX7otRAMPV9wGxRoJV7Phf/AmYEHz1x8Um8Z0Nft0QK/Q0ApdvblcAm5lgAi
         5jCqCSWurT5BmevoLZ0rgIqvcdtlUwskp9iyjceSMPmsxxbH0GlDiw3tPoYFUcyyLsjR
         9AHvJBdVPnmp88hcDqfzNfmwg/bOcc3f+oPNwrQAeaXd5WKP0hjRKCnxYjYL+v5uW+88
         zCkvunhh0AiBWPj46wpIZFPpinkGvBDqhpy5KImXavLChne7GJ2eqRcTeEQtNDERW0sW
         3wYg==
X-Forwarded-Encrypted: i=1; AJvYcCVxHHG+QSVIxTbJkIqsAAtwk2mRdIR33ccGnyMkgz7wvLOyIa9o8oPIN3zqGUJ91q+5LZBLjZ1LHj8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQtEFNuNpnvs/GCixdN1ctm5R1RkBa2gJunGRYHdYS4B6HSoZj
	FZ4qn3eDspZ8fx4wEZu0iJPrE51MNGQTzwmwXe7V58ne6aLCH/JSp3Xt8eEjvPE=
X-Gm-Gg: ASbGnctztWM5vBI92A75UUKKq6iqDGU6MhYzgp2DV0H3qS0Hwq8nqjFqDl4ln7hgKnw
	g2jzpInwcbp5j02GemJ7y3Z02UMHapWLl5XUbpkrBQKr59Z7GRpbihnou/dFj9y23knBlYH1JL1
	N+JiQ+oByy1tSpotyRVDrQv/pAFo8YZ+5JrK+AEtbpHkdFzW11XQ6CYqYGdUGDw5SKX7b27ERWw
	AaVfEy4/gRcjkNKs54CCTts3Gg2K2+ug5EkSZrdZLu4JwoI8nq+6qkS9Zhu5Co=
X-Google-Smtp-Source: AGHT+IHnzcvLwha3WwzYqyiaJol2bpa26aSbx5TFC/pK85SaeIDiV/BBycX6DcunxTbXSZGNypWyHQ==
X-Received: by 2002:a05:6000:1f82:b0:385:f349:ffe7 with SMTP id ffacd0b85a97d-38880ac4e71mr9377609f8f.2.1734357744464;
        Mon, 16 Dec 2024 06:02:24 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Dec 2024 14:02:21 +0000
Message-Id: <D6D6IAZRJYH5.E1DPQHQSI9CE@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 10/13] x86/mpx: Map/unmap xsave area in in
 read_bndcfgu()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-11-alejandro.vallejo@cloud.com>
 <7e36137b-ce1f-4e78-9a41-fbfdbe9c0d87@suse.com>
 <D6D3WWUR75T2.1C5DL8WJGQVNP@cloud.com>
 <def2d398-ae9a-43c8-8de6-22ea01eae196@suse.com>
In-Reply-To: <def2d398-ae9a-43c8-8de6-22ea01eae196@suse.com>

On Mon Dec 16, 2024 at 12:03 PM GMT, Jan Beulich wrote:
> On 16.12.2024 13:00, Alejandro Vallejo wrote:
> > On Mon Dec 9, 2024 at 4:30 PM GMT, Jan Beulich wrote:
> >> On 05.11.2024 15:33, Alejandro Vallejo wrote:
> >>> --- a/xen/arch/x86/xstate.c
> >>> +++ b/xen/arch/x86/xstate.c
> >>> @@ -1022,9 +1022,10 @@ int handle_xsetbv(u32 index, u64 new_bv)
> >>> =20
> >>>  uint64_t read_bndcfgu(void)
> >>>  {
> >>> +    uint64_t bndcfgu =3D 0;
> >>>      unsigned long cr0 =3D read_cr0();
> >>> -    struct xsave_struct *xstate
> >>> -        =3D idle_vcpu[smp_processor_id()]->arch.xsave_area;
> >>> +    struct vcpu *v =3D idle_vcpu[smp_processor_id()];
> >>
> >> Can this be pointer-to-const? Certainly right now, so the question is =
rather
> >> meant to be forward looking.
> >>
> >>> +    struct xsave_struct *xstate =3D VCPU_MAP_XSAVE_AREA(v);
> >>
> >> This certainly can be pointer-to-const, just like ...
> >>
> >>>      const struct xstate_bndcsr *bndcsr;
> >>
> >> ... this is.
> >=20
> > Yes, those retained non-const because of the now missing patch to zero-=
out
> > bndcfgu.
>
> I'm afraid this reply is ambiguous as to what's going to happen in the ne=
xt
> version. I can read both "will change" and "needs to stay" into it.
>
> Jan

It was an answer to "Can this be pointer to const?". Yes, I'll put the cons=
t
back.

Cheers,
Alejandro

