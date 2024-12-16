Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6D49F2F8D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 12:36:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857813.1270025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9Ow-0005EO-MN; Mon, 16 Dec 2024 11:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857813.1270025; Mon, 16 Dec 2024 11:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9Ow-0005Bw-JQ; Mon, 16 Dec 2024 11:36:38 +0000
Received: by outflank-mailman (input) for mailman id 857813;
 Mon, 16 Dec 2024 11:36:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XQSc=TJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tN9Ov-0005Bo-5j
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 11:36:37 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 013e9df9-bba2-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 12:36:35 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa6a92f863cso801722666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 03:36:35 -0800 (PST)
Received: from localhost ([85.152.134.39]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab9635996asm325356666b.102.2024.12.16.03.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 03:36:34 -0800 (PST)
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
X-Inumbo-ID: 013e9df9-bba2-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1734348995; x=1734953795; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pSNdM0wXEGoI3xI6ufGMlDOE27JrPVoHDz11IhOcnI=;
        b=EFFhoqMPff7Qb3zHmJxpdVqYeGzwO1kn7WIwoTi0mEp05eUItdUgB4LDTpibf9woSk
         VUSaM4/eVnbb/AVCUFgIjoaWb+wVphnqPvsF97sJddvwpWK42F0JUokYyW/H3Qq7jMho
         kui4Ad49G2m6zwDrB0KxACwjOZvGdo1TsmrWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734348995; x=1734953795;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1pSNdM0wXEGoI3xI6ufGMlDOE27JrPVoHDz11IhOcnI=;
        b=S7jfFifQLT4wmu1U8ti3qtpnoaHqgXg0F0iWRNktC5o8FwPQSu6oK3mLFxu+YvQm3v
         hIjTlxNbbTB78eu2EpCYQcefTXDPn++wCiGF7+1kEer/0GnrZrd91963a+PJgpL7VtT8
         3xX7IxfIi/mbIJ7oY0ILdNasve7dpGarjshfI9xsJSjNJUkMU+iT0vAaGPHgXYFnI62x
         PejzbSNi6Cq94kYKevvx0V9JzoOckEYRRxl9YipEfPvPTvD7n8aN+OxdmpwrEb9bCafr
         rBx411ud4i0IXBDd2h/BGfO0pH4MlXSA5KQFu0iRlIRaBYKTaJsj9v/LnXGtOJGOoiAj
         4lGg==
X-Forwarded-Encrypted: i=1; AJvYcCXRuAd0Hpw7O/vo/qGl7Wrcn/5Gebk2yD+yoIpV0imrhyO8wmD7/LL0MuzdAk1ZmkvE67FxgAvuAE8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdSG6ds7o4UK5KoPRvlSzZ7FLuGkgIIf57HTehgvAOr9QZ4/wd
	XhhkP2Mukn9J/l1PfPZ/ohWNBaMsJojLEU0bS62+KGkb9Oatj8SUlAQj0h2UQ98=
X-Gm-Gg: ASbGncs7PPn6RkMFsMQJ8XrFcNeQPBmstNkJJLBSeyHcgwWi93SblYCoT2K5CN0jsZ2
	CBkrtV+gIhPaRTztgay+5CdkKbOtlSGVMOPtWyGkkagfv29ZijTE72Kskd5Q19bJhGf67wg+4th
	MxHB5ZCNV2H6+EDqYfQ2/Mtab5oTQPFhlFyfU4u0fb+JypXuXTZ+EiQ2DQfkYDcQV5kscyL2qTF
	bL1ErXPMT4GzmjdUAPxm28koYmuv8rzvSF9AfKjbCqBpHyXw+TPF2Si2q0wfP4=
X-Google-Smtp-Source: AGHT+IG6CQwRSN0Eon/cIgo9Xa+ZZlHMcccWAy+S0UbzMr4qR7TkvsfPiepU2JAHFrUUc/dfKRMGDA==
X-Received: by 2002:a17:906:3289:b0:aa6:6f92:74b1 with SMTP id a640c23a62f3a-aab778f6f48mr940605266b.13.1734348994774;
        Mon, 16 Dec 2024 03:36:34 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Dec 2024 11:36:31 +0000
Message-Id: <D6D3ENF4CKYE.1XYBKJV0WFD3A@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 08/13] x86/xstate: Map/unmap xsave area in
 {compress,expand}_xsave_states()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.18.2
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-9-alejandro.vallejo@cloud.com>
 <0edad037-f6df-4a9a-ba3f-73ea2405604d@suse.com>
In-Reply-To: <0edad037-f6df-4a9a-ba3f-73ea2405604d@suse.com>

On Mon Dec 9, 2024 at 4:20 PM GMT, Jan Beulich wrote:
> On 05.11.2024 15:33, Alejandro Vallejo wrote:
> > No functional change.
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > ---
> > v2:
> >   * No change
> > ---
> >  xen/arch/x86/xstate.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
> > index 401bdad2eb0d..6db7ec2ea6a9 100644
> > --- a/xen/arch/x86/xstate.c
> > +++ b/xen/arch/x86/xstate.c
> > @@ -177,7 +177,7 @@ static void setup_xstate_comp(uint16_t *comp_offset=
s,
> >   */
> >  void expand_xsave_states(const struct vcpu *v, void *dest, unsigned in=
t size)
> >  {
> > -    const struct xsave_struct *xstate =3D v->arch.xsave_area;
> > +    const struct xsave_struct *xstate =3D VCPU_MAP_XSAVE_AREA(v);
> >      const void *src;
> >      uint16_t comp_offsets[sizeof(xfeature_mask)*8];
> >      u64 xstate_bv =3D xstate->xsave_hdr.xstate_bv;
> > @@ -228,6 +228,8 @@ void expand_xsave_states(const struct vcpu *v, void=
 *dest, unsigned int size)
> > =20
> >          valid &=3D ~feature;
> >      }
> > +
> > +    VCPU_UNMAP_XSAVE_AREA(v, xstate);
> >  }
>
> In the middle of these two hunks there's an early return.
>
> > @@ -242,7 +244,7 @@ void expand_xsave_states(const struct vcpu *v, void=
 *dest, unsigned int size)
> >   */
> >  void compress_xsave_states(struct vcpu *v, const void *src, unsigned i=
nt size)
> >  {
> > -    struct xsave_struct *xstate =3D v->arch.xsave_area;
> > +    struct xsave_struct *xstate =3D VCPU_MAP_XSAVE_AREA(v);
> >      void *dest;
> >      uint16_t comp_offsets[sizeof(xfeature_mask)*8];
> >      u64 xstate_bv, valid;
> > @@ -294,6 +296,8 @@ void compress_xsave_states(struct vcpu *v, const vo=
id *src, unsigned int size)
> > =20
> >          valid &=3D ~feature;
> >      }
> > +
> > +    VCPU_UNMAP_XSAVE_AREA(v, xstate);
> >  }
>
> Same here.
>
> Jan

Doh! Yes, good catch. I'll "goto out" on both rather than the early exit to
ensure the unmap is invoked in the "already (de)compressed" cases.

Cheers,
Alejandro

