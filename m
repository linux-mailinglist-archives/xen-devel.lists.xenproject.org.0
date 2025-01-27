Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57367A1D99F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 16:34:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878023.1288196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcR7i-0005qZ-HY; Mon, 27 Jan 2025 15:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878023.1288196; Mon, 27 Jan 2025 15:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcR7i-0005oA-DS; Mon, 27 Jan 2025 15:34:02 +0000
Received: by outflank-mailman (input) for mailman id 878023;
 Mon, 27 Jan 2025 15:34:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fFPb=UT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tcR7g-0005o4-I7
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 15:34:00 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2039834d-dcc4-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 16:33:58 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso49155395e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 07:33:58 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4857b8sm134215005e9.15.2025.01.27.07.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 07:33:57 -0800 (PST)
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
X-Inumbo-ID: 2039834d-dcc4-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1737992038; x=1738596838; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/JG8+dznbyTEKQARA7FgwYkkO81M5MTR4iCeQKqUns=;
        b=IUl7ZwcnaSnwn9Z7ALKgZudCDSYZBR6FjuTd2mJTBP2ehTyUT2L0zb2sS+NVAhBGyf
         zNmNk8pui5oIlfu+JVzV4Pfrdz6xvAQwE9l+hNM65g3YcfF5ahuHfvBWZ9aYrNYL2Lpd
         UOSSJxaTKCSqsTnMK+ViAd1Nzz+m20dgaFkuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737992038; x=1738596838;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g/JG8+dznbyTEKQARA7FgwYkkO81M5MTR4iCeQKqUns=;
        b=Ja3jfaLxh1lUHfrSig6jyDf3idJzAzAD7IauxSvcyPF43NGh1G1plbiEpxx/zduhwX
         K9O5Pd6usP29+V99bevcvegQLoQQZiZr9dGLn8/WV3HjRlkRnJzFxLj5cWlUyH31kIR4
         KecqWj0Lryj7J/d5TTp73MBJSiEzgWhWlBg5dvrc64tKjh0dWGqe4BDZIzMrLD/xV3iH
         hi48EY0OqvZLeI2NvoQXBC0FOse9RoADIqh2c+9wKqjXMETOupuK6JjrJIk3PcYhCGNL
         cNVY35tTRtIcI8hfsxJaf6Ao+xXSfGj9w1oYDdfOaBbvKeJDT/5abk42sKH/uhajcQAx
         y7RQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1ouMP1hRr/LWmVo+kYUi8MKALrGalj2CHSZ4s6V4wbH2sJLJ3yhZK3TW9rBchuf/gaqUAuL2D1Qo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEgZ/e8jY937yeFgXkCEVyBWxkg7eHgG8/s+RelT1dPQg67xPg
	PnTyVCSpip6fKSAz6pyNz9klHer2Zp4Nj6oQVA9+TudyPt+aXxySh/Ilz4fh1Do=
X-Gm-Gg: ASbGnctpPPuk1CUFQWesiO2ViVgnXEbf7CbIappqtzJUd3+qIzEfPHjUgdnQwJQRIco
	YzKOeeX1LF5ZzaG/7bN4wR4QDMxlvWLNuYmuwzxYv7/khlD0Fskc+epKqTSv1zx4kk3KC7wE6eI
	ngEH8D0wqX1+kfGyTa09Lllqj3Jzh+3ZhyRKAhdCS+kuuKh2cGEeOgiqp/d1F3infYtxM6gUDy7
	RTuFr49KhC8wrw0bL3cDP0GZ2y+jPADr+viS4qLPfKXIV2Bl91/m+o9L4USL9zXcgHmkwad5Re5
	laYNyUokXbEvD4CZ2jl9N/DMitSUD35Cphg=
X-Google-Smtp-Source: AGHT+IG4ZiV3i/zZDPIyfTA3JtgqyKJNi0W0OcnJncw/avcdNM6RBK9wHFqD3RT8GipTWru0/SY1rw==
X-Received: by 2002:a05:600c:4f84:b0:434:a90b:94fe with SMTP id 5b1f17b1804b1-438913ca9bamr396332895e9.10.1737992037910;
        Mon, 27 Jan 2025 07:33:57 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jan 2025 15:33:53 +0000
Message-Id: <D7CYR9ZNH26A.3596KYC81OTVU@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 01/12] x86/xstate: Create map/unmap primitives for
 xsave areas
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
 <20250110132823.24348-2-alejandro.vallejo@cloud.com>
 <74ba0d8b-af2a-4fc7-891c-1a1305e71df7@suse.com>
In-Reply-To: <74ba0d8b-af2a-4fc7-891c-1a1305e71df7@suse.com>

Hi,

On Mon Jan 27, 2025 at 10:44 AM GMT, Jan Beulich wrote:
> On 10.01.2025 14:28, Alejandro Vallejo wrote:
> > Add infrastructure to simplify ASI handling. With ASI in the picture
> > we'll have several different means of accessing the XSAVE area of a
> > given vCPU, depending on whether a domain is covered by ASI or not and
> > whether the vCPU is question is scheduled on the current pCPU or not.
> >=20
> > Having these complexities exposed at the call sites becomes unwieldy
> > very fast. These wrappers are intended to be used in a similar way to
> > map_domain_page() and unmap_domain_page(); The map operation will
> > dispatch the appropriate pointer for each case in a future patch, while
> > unmap will remain a no-op where no unmap is required (e.g: when there's
> > no ASI) and remove the transient maping if one was required.
> >=20
> > Follow-up patches replace all uses of raw v->arch.xsave_area by this
> > mechanism in preparation to add the beforementioned dispatch logic to b=
e
> > added at a later time.
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with one nit below.
>
> > --- a/xen/arch/x86/include/asm/xstate.h
> > +++ b/xen/arch/x86/include/asm/xstate.h
> > @@ -143,4 +143,46 @@ static inline bool xstate_all(const struct vcpu *v=
)
> >             (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
> >  }
> > =20
> > +/*
> > + * Fetch a pointer to a vCPU's XSAVE area
> > + *
> > + * TL;DR: If v =3D=3D current, the mapping is guaranteed to already ex=
ist.
> > + *
> > + * Despite the name, this macro might not actually map anything. The o=
nly case
> > + * in which a mutation of page tables is strictly required is when ASI=
=3D=3Don &&
> > + * v!=3Dcurrent. For everything else the mapping already exists and ne=
eds not
> > + * be created nor destroyed.
> > + *
> > + *                         +-----------------+--------------+
> > + *                         |   v =3D=3D current  | v !=3D current |
> > + *          +--------------+-----------------+--------------+
> > + *          | ASI  enabled | per-vCPU fixmap |  actual map  |
> > + *          +--------------+-----------------+--------------+
> > + *          | ASI disabled |             directmap          |
> > + *          +--------------+--------------------------------+
> > + *
> > + * There MUST NOT be outstanding maps of XSAVE areas of the non-curren=
t vCPU
> > + * at the point of context switch. Otherwise, the unmap operation will
> > + * misbehave.
> > + *
> > + * TODO: Expand the macro to the ASI cases after infra to do so is in =
place.
> > + *
> > + * @param v Owner of the XSAVE area
> > + */
> > +#define VCPU_MAP_XSAVE_AREA(v) ((v)->arch.xsave_area)
> > +
> > +/*
> > + * Drops the mapping of a vCPU's XSAVE area and nullifies its pointer =
on exit
> > + *
> > + * See VCPU_MAP_XSAVE_AREA() for additional information on the persist=
ence of
> > + * these mappings. This macro only tears down the mappings in the ASI=
=3Don &&
> > + * v!=3Dcurrent case.
> > + *
> > + * TODO: Expand the macro to the ASI cases after infra to do so is in =
place.
> > + *
> > + * @param v Owner of the XSAVE area
> > + * @param x XSAVE blob of v
> > + */
> > + #define VCPU_UNMAP_XSAVE_AREA(v, x) do { (void)(v); (x) =3D NULL; } w=
hile(0)
>
> The "while" still wants to conform to style, despite it being a kind of
> degenerate form. The overwhelming majority of instances we've got have at
> least a blank before the opening parenthesis. Many also have the ones
> inside.
>
> Jan

Sure, makes sense. I'll adjust it.

Cheers
Alejandro

