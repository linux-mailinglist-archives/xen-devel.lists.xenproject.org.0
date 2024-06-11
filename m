Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB374903915
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 12:40:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738262.1144964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGyvf-00013A-Ec; Tue, 11 Jun 2024 10:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738262.1144964; Tue, 11 Jun 2024 10:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGyvf-00011e-Bt; Tue, 11 Jun 2024 10:40:39 +0000
Received: by outflank-mailman (input) for mailman id 738262;
 Tue, 11 Jun 2024 10:40:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=887E=NN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sGyve-00011Y-Nz
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 10:40:38 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a7ca15c-27df-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 12:40:37 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52bc335e49aso1259525e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 03:40:37 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c90af4f01sm441743e87.179.2024.06.11.03.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 03:40:36 -0700 (PDT)
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
X-Inumbo-ID: 0a7ca15c-27df-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718102437; x=1718707237; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TcmKGQ9cWbbsBGbku5qP9rjaAFfDpJaaLMtBz07Xhjw=;
        b=VSaUMIID4VjExVFclDh7FAltKVK/7r0Yo6yS3ACIScRK5vP00xGXu3XCZutUroqDBU
         H50g9+mrJzhDAKUbFpaNvkj8oftevNAy4N6/ApUzMxsYkXVGnVk9fbfCDP+p8XPjGfSo
         QgPLDg5Lrt2h1etXFRPpYoc4Y12UMz4uoGDCseaOnDOHALO8dgWDA3lJBlOEiNc+09Hv
         yiYDCBO6ZfUJUF6iibHCKEzGhH6OmnXHE9EJ8q6+kDLMZWowMSV/9EbJ3TFPJjB+vDhe
         qh/+Hd0ruOT6hhQbILtg8TmjoZrwjZ/+Uev6bHMmvY+vC4ExLbJDUlqVtLC0T4wLYJ9Z
         hxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718102437; x=1718707237;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TcmKGQ9cWbbsBGbku5qP9rjaAFfDpJaaLMtBz07Xhjw=;
        b=G4fpbyxnNfLRMhJHkt/jpXk2rb9gfV5sLS43Y0A87bOLimNHBuqwKdzV+6DKftaUs8
         1ip8xu+02WouGLEugE1rKZ93JOw17ADlCAp8VMmJE4Zp7SAZ2Ty7JBetYhsO6spy0i/6
         KbUF+9ME8UfCzEVDRrIeDLFJQ3XW80hfdkuPc8zoz40EtW6JyxLhWxUa8/1eEXYQnwP3
         i44nM5TnIRuEsxd4ojzhh8dsZfTL7Z6D6y6SEtJb/Xne1TBL+Fl2YYptf6PJhDZtlEa8
         DS3Vn5j49C3iZAV0yXIbZvjTVVEqb22ZTtmpRD7ROMkMYg1tUVodjWpVWbZ3jUBtBry2
         kAXw==
X-Forwarded-Encrypted: i=1; AJvYcCW+JMCBle80fltEruB+WR829oKVgiPlD7oCa3IeUJcqBUOCV0v8iuV4BhGlgkpL0pvb63FoHyVkZ3GmB2GcGNi6VsdfSHUlIvcNHtgCbtM=
X-Gm-Message-State: AOJu0YwQDHcdA4kq8pzPLyPzdF/yUoUsEx+D6z0D5+9sMfjK8zt+u/vP
	momDYqZAXNrj+EAix6JU9OhMPYXXDw/vCi7tnCEdsyfHnLWR7jahK1LZFQ==
X-Google-Smtp-Source: AGHT+IGRCnfj0agldrg7jGTI3BN19RrN2rSjG0NOhdopTSnq4AjP7ETtXzGG6DEA4zjeaQB0GYU4NA==
X-Received: by 2002:a05:6512:1288:b0:52c:90aa:444c with SMTP id 2adb3069b0e04-52c90aa4595mr2044498e87.28.1718102437230;
        Tue, 11 Jun 2024 03:40:37 -0700 (PDT)
Message-ID: <8d75d6983d3a9e1d98c6a3739a8cea2e9bbad85a.camel@gmail.com>
Subject: Re: [PATCH for-4.19] x86/EPT: relax iPAT for "invalid" MFNs
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Date: Tue, 11 Jun 2024 12:40:36 +0200
In-Reply-To: <dcdb2217-d3be-4cfa-b698-d18bdfdd91e3@suse.com>
References: <56063a8f-f569-4130-ac25-f0f064e288a1@suse.com>
	 <dcdb2217-d3be-4cfa-b698-d18bdfdd91e3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Mon, 2024-06-10 at 17:00 +0200, Jan Beulich wrote:
> On 10.06.2024 16:58, Jan Beulich wrote:
> > mfn_valid() is RAM-focused; it will often return false for MMIO.
> > Yet
> > access to actual MMIO space should not generally be restricted to
> > UC
> > only; especially video frame buffer accesses are unduly affected by
> > such
> > a restriction. Permit PAT use for directly assigned MMIO as long as
> > the
> > domain is known to have been granted some level of cache control.
> >=20
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

> > ---
> > Considering that we've just declared PVH Dom0 "supported", this may
> > well
> > qualify for 4.19. The issue was specifically very noticable there.
>=20
> Actually - meant to Cc Oleksii for this, and then forgot.
>=20
> Jan
>=20
> > The conditional may be more complex than really necessary, but it's
> > in
> > line with what we do elsewhere. And imo better continue to be a
> > little
> > too restrictive, than moving to too lax.
> >=20
> > --- a/xen/arch/x86/mm/p2m-ept.c
> > +++ b/xen/arch/x86/mm/p2m-ept.c
> > @@ -503,7 +503,8 @@ int epte_get_entry_emt(struct domain *d,
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 if ( !mfn_valid(mfn) )
> > =C2=A0=C2=A0=C2=A0=C2=A0 {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *ipat =3D true;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *ipat =3D type !=3D p2m_mmi=
o_direct ||
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (!is_iommu_enabled(d) &&
> > !cache_flush_permitted(d));
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return X86_MT_UC;
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0
>=20


