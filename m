Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ABC1EDEDB
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 09:50:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgkeB-0001Bf-Sd; Thu, 04 Jun 2020 07:50:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EphU=7R=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jgkeA-0001BY-7T
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 07:50:42 +0000
X-Inumbo-ID: 164fd9b4-a638-11ea-9947-bc764e2007e4
Received: from mail-ed1-x52d.google.com (unknown [2a00:1450:4864:20::52d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 164fd9b4-a638-11ea-9947-bc764e2007e4;
 Thu, 04 Jun 2020 07:50:41 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id p18so3884927eds.7
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2020 00:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=KuNf6C8p5U/pV3cH0HVswaojeUwltwpCkRZOPJXfz5U=;
 b=Y7FVr2ngIEYiTZl0edDmqaq9hjMiz1SmKQ1oDwyTCFTi/JqtYouQr+coxnkN8/bJ6S
 UttOnOwPTlxH2RLs+d2qsCPfvHLfCSeGD6GYiWE9/gEssC9KMvVJ9Kce+yvmYUU6c98s
 +ORackNhRTr35ij070nHuJBJ0Dti4Bn9SII7MP8KrmigtSZf/3DfjzW8LGPb5fGkmb3P
 Xz32erOHc63npK4zPMbOPqIpu/rEv9RDbWY1KkvrcaYnur0Bo9xMtBEYYjry3E06Rjt4
 Zn5Mynf+Zwju4RdzJhq700/wXU+tLJKq65NHFK1y0TlocrEtZPodGYsUBIghWtQ9Sh7u
 Ihhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=KuNf6C8p5U/pV3cH0HVswaojeUwltwpCkRZOPJXfz5U=;
 b=W0Jq7IFp2/RUmQtbYgW470D5CnsLcAI3fbJVG6zBHU4oQR2fgmoHsFYDf+pZ4ZwKgy
 MFRQ8CCiqApo0gzsS2xTqUCXzLNh3A4qbrnvXolIzbx5h2d58izqte6fHhUZN1HZM3CM
 Hkt+4uPY7G4icA2WpccMQlu76ALiQFx2fVADnGYO5BGY/qDtmrjyu76eJgMQ1UhrN2la
 m7e6jHEfEhcbwPo3j2flUaDdEE6pBIl73fk91uO6PDn1ml4Afbo+TS89/++OwnDvFsIB
 lph9glUTXVrc0pOVZCgjP6cL2DXDd68oSDhTvUZkpfofFDB92eB93fo+2InI0r+tUSJu
 ATdA==
X-Gm-Message-State: AOAM531T50lw69f6xwwoIRLqiG2RK8/AlE+4fkYXB9/fvu2GIhJFSjti
 f2YKNT4R853l3h7HJMgzzPA=
X-Google-Smtp-Source: ABdhPJzJ0sjZoihPlAmf98Qw/AKjHh5M3IVSEWx63Kk3T1jB0sk90e4VwRp2MBwMtOHhrUn3IipHUg==
X-Received: by 2002:a50:fd01:: with SMTP id i1mr3346973eds.32.1591257040795;
 Thu, 04 Jun 2020 00:50:40 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id n6sm1557427edv.24.2020.06.04.00.50.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jun 2020 00:50:40 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>
References: <20200603170908.13239-1-andrew.cooper3@citrix.com>
 <1a158ff8-e11e-432c-236d-ff884602d48a@suse.com>
In-Reply-To: <1a158ff8-e11e-432c-236d-ff884602d48a@suse.com>
Subject: RE: [PATCH for-4.14] x86/shim: Fix defconfig selection and trim the
 build further
Date: Thu, 4 Jun 2020 08:50:38 +0100
Message-ID: <006501d63a44$d771e0c0$8655a240$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQDiB7eoitU4qCF1PTePgHsB/Nx/GAHHmGl6qqI9QAA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Juergen Gross' <jgross@suse.com>,
 'Xen-devel' <xen-devel@lists.xenproject.org>,
 'Dario Faggioli' <dfaggioli@suse.com>, 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 04 June 2020 07:43
> To: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Xen-devel <xen-devel@lists.xenproject.org>; Wei Liu <wl@xen.org>; =
Roger Pau Monn=C3=A9
> <roger.pau@citrix.com>; Juergen Gross <jgross@suse.com>; Paul Durrant =
<paul@xen.org>; Dario Faggioli
> <dfaggioli@suse.com>
> Subject: Re: [PATCH for-4.14] x86/shim: Fix defconfig selection and =
trim the build further
>=20
> On 03.06.2020 19:09, Andrew Cooper wrote:
> > Several options (TBOOT, XENOPROF, Scheduler) depend on EXPERT to be =
able to
> > deselect/configure.
> >
> > Enabling EXPERT now causes the request of the Credit1 scheduler to =
be honoured
> > (rather than giving us Credit2), but take this opportunity to switch =
to Null,
> > as the previously problematic issues are now believed to be fixed.
> >
> > Enabling EXPERT also allows XEN_SHSTK to be selected, and we don't =
want this
> > being built for shim.  We also don't want TRACEBUFFER or GDBSX =
either.
> >
> > Take this oppotunity to swap the disable of HVM_FEP for a general =
disable of
> > HVM (likely to have wider impliciations in the future), and disable =
ARGO (will
> > necesserily need plumbing work to function in shim).
>=20
> Odd. I was quite sure this is the case already; in particular my
> own build test of a shim config has this already.
>=20
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Release-acked-by: Paul Durrant <paul@xen.org>

>=20
> I have a question though (without implying the patch here needs
> adjusting, but rather with a look towards after 4.14):
>=20
> > --- a/xen/arch/x86/configs/pvshim_defconfig
> > +++ b/xen/arch/x86/configs/pvshim_defconfig
> > @@ -5,19 +5,25 @@ CONFIG_PVH_GUEST=3Dy
> >  CONFIG_PV_SHIM=3Dy
> >  CONFIG_PV_SHIM_EXCLUSIVE=3Dy
> >  CONFIG_NR_CPUS=3D32
> > +CONFIG_EXPERT=3Dy
> > +CONFIG_SCHED_NULL=3Dy
> >  # Disable features not used by the PV shim
> > +# CONFIG_HVM is not set
> > +# CONFIG_XEN_SHSTK is not set
> >  # CONFIG_HYPFS is not set
> >  # CONFIG_SHADOW_PAGING is not set
> >  # CONFIG_BIGMEM is not set
> > -# CONFIG_HVM_FEP is not set
> >  # CONFIG_TBOOT is not set
> >  # CONFIG_KEXEC is not set
> >  # CONFIG_XENOPROF is not set
> >  # CONFIG_XSM is not set
> > +# CONFIG_ARGO is not set
> > +# CONFIG_SCHED_CREDIT is not set
> >  # CONFIG_SCHED_CREDIT2 is not set
> >  # CONFIG_SCHED_RTDS is not set
> >  # CONFIG_SCHED_ARINC653 is not set
> > -# CONFIG_SCHED_NULL is not set
> >  # CONFIG_LIVEPATCH is not set
> >  # CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS is not set
> > +# CONFIG_TRACEBUFFER is not set
> >  # CONFIG_DEBUG is not set
> > +# CONFIG_GDBSX is not set
>=20
> I assume both the "enable" and "disable" sections here are ordered
> like they would be in a resulting full .config. But this being two
> separate sections, doing so doesn't help e.g. diff-ing. How about
> we sort both sections alphabetically (short of other good sorting
> criteria, yet better than entirely unsorted)?
>=20
> Jan


