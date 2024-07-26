Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5F193D6EB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 18:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765698.1176360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXNrY-0004j6-FB; Fri, 26 Jul 2024 16:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765698.1176360; Fri, 26 Jul 2024 16:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXNrY-0004hb-CH; Fri, 26 Jul 2024 16:32:12 +0000
Received: by outflank-mailman (input) for mailman id 765698;
 Fri, 26 Jul 2024 16:32:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8ZK=O2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sXNrW-0004hT-KF
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 16:32:10 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ab4cee9-4b6c-11ef-bc00-fd08da9f4363;
 Fri, 26 Jul 2024 18:32:09 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5a2ffc3447fso2721252a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 09:32:09 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac63b59ca1sm2139425a12.52.2024.07.26.09.32.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jul 2024 09:32:08 -0700 (PDT)
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
X-Inumbo-ID: 9ab4cee9-4b6c-11ef-bc00-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1722011529; x=1722616329; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45nvN7EPr/hhNIhud3ZozczxUmsCkPjNs4KnECSaARs=;
        b=lGMjMqgstn89lszWdqT0a7QY7p3yj1g26CAOZa+8OmL5PvHsrF8rTdvh6B7FgfH5O2
         Ty51HNRwqYzTuW1fHp0oRrkwllPDIkLPuqGzICpEu1N10shbUJBh9AJLIXpdaxwpt8yD
         066IuBbbsz8Qp13zz7tRaWCyJe9mOB55q60f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722011529; x=1722616329;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=45nvN7EPr/hhNIhud3ZozczxUmsCkPjNs4KnECSaARs=;
        b=IgpchISYS587Ujlf0ZISJ1npOSals0nRJaB3kRsoSgpEoc0WmPbh9Co2BYfzX32dHI
         +lsUap0L1+zNabf/hp14wHOz0vpxpzPu0FWSmc35P+AmHVDGWI5pak59JAvN8QKmQIbB
         Xpl+MRd/Q+fOaW+hdAuQYkHH4P+G8JWTH5LeX8eaCqVO633ZzY0DDvtpHs7DByEvorys
         tPbkXhydcsHqXElG797OMBqZMGWcSKSDOYrRQc2zDsOKvB8yYTyc/+ldeZqSnjfGben6
         4q6388/gzYApy3zzb9y/Pr6ii3LUhthZQWH1pslme1GDKN4PTi14xrDZLMNRfjosgx5c
         jQNw==
X-Forwarded-Encrypted: i=1; AJvYcCXbuhyB9BOWXEIuYJmKrB4SIm5s25HYC8Bqr0aIV3dwyEBQzyBNhAesWQYoKbQIJ9Fr6PLSJvBzPy39w1dXwLCkQ6ff1b5P3Q8Fpu5K70o=
X-Gm-Message-State: AOJu0Yz4F6905i7Mz2ObrSNpiNoOy6DEHkheUFkBby5Z5eh+tpKn0oep
	XAzSJUmkz0890s8HlsMfUDfXLTzZ/dpl8XUaz8cuT/rTDCpIvkIvJbjEgBlEZ1g=
X-Google-Smtp-Source: AGHT+IHF7/UohxQFGXt4cSthc6lhVaRDfVltT5QW9nTfHOoG03fpZIIpzPyUvvh0hB/ZhNtU2itBAw==
X-Received: by 2002:a50:cd18:0:b0:5a3:b866:eaee with SMTP id 4fb4d7f45d1cf-5ac631afba8mr4490748a12.7.1722011529170;
        Fri, 26 Jul 2024 09:32:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jul 2024 17:32:07 +0100
Message-Id: <D2ZM52IVW8FG.7497GL0FA95Z@cloud.com>
To: <paul@xen.org>, "Xen-devel" <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/viridian: Clarify some viridian logging strings
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.17.0
References: <20240726145200.1991-1-alejandro.vallejo@cloud.com>
 <e757eaeb-a10f-423e-a914-ec1d77ee0491@xen.org>
In-Reply-To: <e757eaeb-a10f-423e-a914-ec1d77ee0491@xen.org>

On Fri Jul 26, 2024 at 4:11 PM BST, Paul Durrant wrote:
> On 26/07/2024 15:52, Alejandro Vallejo wrote:
> > It's sadically misleading to show an error without letters and expect
> > the dmesg reader to understand it's in hex.
>
> That depends on who's doing the reading.
>
> > The patch adds a 0x prefix
> > to all hex numbers that don't already have it.
> >=20
> > On the one instance in which a boolean is printed as an integer, print
> > it as a decimal integer instead so it's 0/1 in the common case and not
> > misleading if it's ever not just that due to a bug.
> >=20
> > While at it, rename VIRIDIAN CRASH to VIRIDIAN GUEST_CRASH. Every membe=
r
> > of a support team that looks at the message systematically believes
> > "viridian" crashed,
>
> ... which suggests they need educating as to what 'viridian' is (or was).
>

Can't argue with you there. But if a minor cosmetic tweak to a dmesg string
clarifies a matter without further explanation it's imo a net positive chan=
ge.

> > which is absolutely not what goes on. It's the guest
> > asking the hypervisor for a sudden shutdown because it crashed, and
> > stating why.
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > ---
> > Still going through its Gitlab pipeline
> >=20
> > ---
> >   xen/arch/x86/hvm/viridian/synic.c    | 2 +-
> >   xen/arch/x86/hvm/viridian/viridian.c | 9 +++++----
> >   2 files changed, 6 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/virid=
ian/synic.c
> > index 3375e55e95ca..c3dc573b003d 100644
> > --- a/xen/arch/x86/hvm/viridian/synic.c
> > +++ b/xen/arch/x86/hvm/viridian/synic.c
> > @@ -172,7 +172,7 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t i=
dx, uint64_t val)
> >           vector =3D new.vector;
> >           vv->vector_to_sintx[vector] =3D sintx;
> >  =20
> > -        printk(XENLOG_G_INFO "%pv: VIRIDIAN SINT%u: vector: %x\n", v, =
sintx,
> > +        printk(XENLOG_G_INFO "%pv: VIRIDIAN SINT%u: vector: %#x\n", v,=
 sintx,
> >                  vector);
> >  =20
> >           *vs =3D new;
> > diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/vi=
ridian/viridian.c
> > index 0496c52ed5a2..21480d9ee700 100644
> > --- a/xen/arch/x86/hvm/viridian/viridian.c
> > +++ b/xen/arch/x86/hvm/viridian/viridian.c
> > @@ -253,7 +253,7 @@ static void dump_guest_os_id(const struct domain *d=
)
> >       goi =3D &d->arch.hvm.viridian->guest_os_id;
> >  =20
> >       printk(XENLOG_G_INFO
> > -           "d%d: VIRIDIAN GUEST_OS_ID: vendor: %x os: %x major: %x min=
or: %x sp: %x build: %x\n",
> > +           "d%d: VIRIDIAN GUEST_OS_ID: vendor: %#x os: %#x major: %#x =
minor: %#x sp: %#x build: %#x\n",
> >              d->domain_id, goi->vendor, goi->os, goi->major, goi->minor=
,
> >              goi->service_pack, goi->build_number);
> >   }
> > @@ -264,7 +264,7 @@ static void dump_hypercall(const struct domain *d)
> >  =20
> >       hg =3D &d->arch.hvm.viridian->hypercall_gpa;
> >  =20
> > -    printk(XENLOG_G_INFO "d%d: VIRIDIAN HYPERCALL: enabled: %x pfn: %l=
x\n",
> > +    printk(XENLOG_G_INFO "d%d: VIRIDIAN HYPERCALL: enabled: %u pfn: %#=
lx\n",
> >              d->domain_id,
> >              hg->enabled, (unsigned long)hg->pfn);
> >   }
> > @@ -372,7 +372,8 @@ int guest_wrmsr_viridian(struct vcpu *v, uint32_t i=
dx, uint64_t val)
> >           d->shutdown_code =3D SHUTDOWN_crash;
> >           spin_unlock(&d->shutdown_lock);
> >  =20
> > -        gprintk(XENLOG_WARNING, "VIRIDIAN CRASH: %lx %lx %lx %lx %lx\n=
",
> > +        gprintk(XENLOG_WARNING,
> > +                "VIRIDIAN GUEST_CRASH: %#lx %#lx %#lx %#lx %#lx\n",
>
> Honestly this change should be unnecessary, but since this is all=20
> cosmetic...
>
> Reviewed-by: Paul Durrant <paul@xen.org>
>

Thanks

> >                   vv->crash_param[0], vv->crash_param[1], vv->crash_par=
am[2],
> >                   vv->crash_param[3], vv->crash_param[4]);
> >           break;
> > @@ -1056,7 +1057,7 @@ void viridian_dump_guest_page(const struct vcpu *=
v, const char *name,
> >       if ( !vp->msr.enabled )
> >           return;
> >  =20
> > -    printk(XENLOG_G_INFO "%pv: VIRIDIAN %s: pfn: %lx\n",
> > +    printk(XENLOG_G_INFO "%pv: VIRIDIAN %s: pfn: %#lx\n",
> >              v, name, (unsigned long)vp->msr.pfn);
> >   }
> >  =20

Cheers,
Alejandro

