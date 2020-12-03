Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30C22CDA47
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 16:45:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43797.78671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkqnQ-0004Ym-RE; Thu, 03 Dec 2020 15:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43797.78671; Thu, 03 Dec 2020 15:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkqnQ-0004YN-My; Thu, 03 Dec 2020 15:45:28 +0000
Received: by outflank-mailman (input) for mailman id 43797;
 Thu, 03 Dec 2020 15:45:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oiWT=FH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kkqnO-0004YH-T5
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 15:45:26 +0000
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96f5e1c2-4d31-4160-923a-6713c82a0c92;
 Thu, 03 Dec 2020 15:45:25 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a6so3165243wmc.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Dec 2020 07:45:25 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-145.range86-183.btcentralplus.com.
 [86.183.162.145])
 by smtp.gmail.com with ESMTPSA id q4sm2025341wmc.2.2020.12.03.07.45.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Dec 2020 07:45:24 -0800 (PST)
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
X-Inumbo-ID: 96f5e1c2-4d31-4160-923a-6713c82a0c92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=GzSzmJYRN4HMPNLrihzT9az/OPz9iInm9sfCMz8CPLo=;
        b=j4wjSvdqkXZkBywwbxpbvvxlzL8WrCyc07ue6Lamgw1g7QUeIgU8hOiOcnBzF20joT
         an70k8hICH5jiguisqjPdkY3FP4Gvgn1EWOsQYf0RCNSQ7AieLeYbqu8w9BtKM3mvwZi
         Xne0qGqYHC537wgcaPUjrmQjzlKxnm03/591BtjPk1fuuqUHfoTwPeKG5W+aCagMXz6B
         cnSMcEg5mdnTfGyZz3Gxk9gQbsSDAU1dcJgXXp2G5KldXRPwwGN00p3Oh2ZD9i4f65ep
         J9PdH8Ws/hRXM/GSXIWKT+Ju7J6mC6SpQZx1k1KwWmjoHCx95KKUSGLomwkLFln/QxNk
         J/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=GzSzmJYRN4HMPNLrihzT9az/OPz9iInm9sfCMz8CPLo=;
        b=Br6UWA8ond1/Kx1FsXkl3pl0ps8fCEGBshduTmmmrsUerAqXi3kj5h6rn95r+a1Z1K
         nQedS78Zaf50Btr4nInbK2aXWapk2tq5RMXf7Yjy7vadKpfGG6+BmVsA6vIOIverjr8N
         JDXetaAwDV/XdmG6Wx1YnM/fD4nvhXS6y+f1AHe8WCeTUVSiHUbz7nsaiqRwf9Ys2zAr
         T6MPvUBDPVvrLKrHrqIs7S3FZygG/1AuznVN6zX/zIiVc1ueireJKBq7COJpXLJPMNdL
         HYIsDNtVvlE3wkQbzTjBiQcuxgbaYHpLX24Vexfwo52MZi0emUQmnZ9QYEKLgUki6nxK
         wt+w==
X-Gm-Message-State: AOAM530dxC5zgyabbMwrzGv7PiiV2B4c10K0svzNJrvnvFevtvAcJET0
	LW6EIhm49wAlIRa1o1Qf9fo=
X-Google-Smtp-Source: ABdhPJxUSxDzqgwLUXNs9sOyya7svy5LVn1a5CWGGNM2GLQbPAz2wmBikIPVf3YwC8jArTxr8y4XJQ==
X-Received: by 2002:a05:600c:2652:: with SMTP id 18mr3977779wmy.54.1607010324882;
        Thu, 03 Dec 2020 07:45:24 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Eslam Elnikety'" <elnikety@amazon.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Anthony PERARD'" <anthony.perard@citrix.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Christian Lindig'" <christian.lindig@citrix.com>,
	"'David Scott'" <dave@recoil.org>,
	"'Volodymyr Babchuk'" <Volodymyr_Babchuk@epam.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20201203124159.3688-1-paul@xen.org> <20201203124159.3688-2-paul@xen.org> <fea91a65-1d7c-cd46-81a2-9a6bcb690ed1@suse.com>
In-Reply-To: <fea91a65-1d7c-cd46-81a2-9a6bcb690ed1@suse.com>
Subject: RE: [PATCH v5 1/4] domctl: introduce a new domain create flag, XEN_DOMCTL_CDF_evtchn_fifo, ...
Date: Thu, 3 Dec 2020 15:45:23 -0000
Message-ID: <00ee01d6c98b$507af1c0$f170d540$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJzrCHAX/gquRkO4g65wfjgQBytUAJ7xs67Aj6rtzSoheWkIA==

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 03 December 2020 15:23
> To: Paul Durrant <paul@xen.org>
> Cc: Paul Durrant <pdurrant@amazon.com>; Eslam Elnikety =
<elnikety@amazon.com>; Ian Jackson
> <iwj@xenproject.org>; Wei Liu <wl@xen.org>; Anthony PERARD =
<anthony.perard@citrix.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; =
Julien Grall <julien@xen.org>;
> Stefano Stabellini <sstabellini@kernel.org>; Christian Lindig =
<christian.lindig@citrix.com>; David
> Scott <dave@recoil.org>; Volodymyr Babchuk =
<Volodymyr_Babchuk@epam.com>; Roger Pau Monn=C3=A9
> <roger.pau@citrix.com>; xen-devel@lists.xenproject.org
> Subject: Re: [PATCH v5 1/4] domctl: introduce a new domain create =
flag, XEN_DOMCTL_CDF_evtchn_fifo,
> ...
>=20
> On 03.12.2020 13:41, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > ...to control the visibility of the FIFO event channel operations
> > (EVTCHNOP_init_control, EVTCHNOP_expand_array, and =
EVTCHNOP_set_priority) to
> > the guest.
> >
> > These operations were added to the public header in commit =
d2d50c2f308f
> > ("evtchn: add FIFO-based event channel ABI") and the first =
implementation
> > appeared in the two subsequent commits: edc8872aeb4a ("evtchn: =
implement
> > EVTCHNOP_set_priority and add the set_priority hook") and =
88910061ec61
> > ("evtchn: add FIFO-based event channel hypercalls and port ops"). =
Prior to
> > that, a guest issuing those operations would receive a return value =
of
> > -ENOSYS (not implemented) from Xen. Guests aware of the FIFO =
operations but
> > running on an older (pre-4.4) Xen would fall back to using the =
2-level event
> > channel interface upon seeing this return value.
> >
> > Unfortunately the uncontrolable appearance of these new operations =
in Xen 4.4
> > onwards has implications for hibernation of some Linux guests. =
During resume
> > from hibernation, there are two kernels involved: the "boot" kernel =
and the
> > "resume" kernel. The guest boot kernel may default to use FIFO =
operations and
> > instruct Xen via EVTCHNOP_init_control to switch from 2-level to =
FIFO. On the
> > other hand, the resume kernel keeps assuming 2-level, because it was =
hibernated
> > on a version of Xen that did not support the FIFO operations.
> >
> > To maintain compatibility it is necessary to make Xen behave as it =
did
> > before the new operations were added and hence the code in this =
patch ensures
> > that, if XEN_DOMCTL_CDF_evtchn_fifo is not set, the FIFO event =
channel
> > operations will again result in -ENOSYS being returned to the guest.
>=20
> I have to admit I'm now even more concerned of the control for such
> going into Xen, the more with the now 2nd use in the subsequent patch.
> The implication of this would seem to be that whenever we add new
> hypercalls or sub-ops, a domain creation control would also need
> adding determining whether that new sub-op is actually okay to use by
> a guest. Or else I'd be keen to up front see criteria at least roughly
> outlined by which it could be established whether such an override
> control is needed.
>=20

Ultimately I think any new hypercall (or related set of hypercalls) =
added to the ABI needs to be opt-in on a per-domain basis, so that we =
know that from when a domain is first created it will not see a change =
in its environment unless the VM administrator wants that to happen.

> I'm also not convinced such controls really want to be opt-in rather
> than opt-out.

They really need to be opt-in I think. From a cloud provider PoV it is =
important that nothing in a customer's environment changes unless we =
want it to. Otherwise we have no way to deploy an updated hypervisor =
version without risking crashing their VMs.

> While perhaps sensible as long as a feature is
> experimental, not exposing stuff by default may mean slower adoption
> of new (and hopefully better) functionality. I realize there's still
> the option of having the tool stack default to enable, and just the
> hypervisor defaulting to disable, but anyway.
>=20

Ok. I don't see a problem in default-to-enable behaviour... but I guess =
we will need to add ABI features to migration stream to fix things =
properly.

> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -622,7 +622,8 @@ int arch_sanitise_domain_config(struct =
xen_domctl_createdomain *config)
> >      unsigned int max_vcpus;
> >
> >      /* HVM and HAP must be set. IOMMU may or may not be */
> > -    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu) !=3D
> > +    if ( (config->flags &
> > +          ~(XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_evtchn_fifo) !=3D
> >           (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
> >      {
> >          dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -2478,7 +2478,8 @@ void __init create_domUs(void)
> >          struct domain *d;
> >          struct xen_domctl_createdomain d_cfg =3D {
> >              .arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE,
> > -            .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> > +            .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
> > +                     XEN_DOMCTL_CDF_evtchn_fifo,
> >              .max_evtchn_port =3D -1,
> >              .max_grant_frames =3D 64,
> >              .max_maptrack_frames =3D 1024,
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -805,7 +805,8 @@ void __init start_xen(unsigned long =
boot_phys_offset,
> >      struct bootmodule *xen_bootmodule;
> >      struct domain *dom0;
> >      struct xen_domctl_createdomain dom0_cfg =3D {
> > -        .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> > +        .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
> > +                 XEN_DOMCTL_CDF_evtchn_fifo,
> >          .max_evtchn_port =3D -1,
> >          .max_grant_frames =3D gnttab_dom0_frames(),
> >          .max_maptrack_frames =3D -1,
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -738,7 +738,8 @@ static struct domain *__init create_dom0(const =
module_t *image,
> >                                           const char *loader)
> >  {
> >      struct xen_domctl_createdomain dom0_cfg =3D {
> > -        .flags =3D IS_ENABLED(CONFIG_TBOOT) ? =
XEN_DOMCTL_CDF_s3_integrity : 0,
> > +        .flags =3D XEN_DOMCTL_CDF_evtchn_fifo |
> > +                 (IS_ENABLED(CONFIG_TBOOT) ? =
XEN_DOMCTL_CDF_s3_integrity : 0),
> >          .max_evtchn_port =3D -1,
> >          .max_grant_frames =3D -1,
> >          .max_maptrack_frames =3D -1,
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -307,7 +307,7 @@ static int sanitise_domain_config(struct =
xen_domctl_createdomain *config)
> >           ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
> >             XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
> >             XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> > -           XEN_DOMCTL_CDF_nested_virt) )
> > +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_evtchn_fifo) =
)
> >      {
> >          dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", =
config->flags);
> >          return -EINVAL;
>=20
> All of the hunks above point out a scalability issue if we were to
> follow this route for even just a fair part of new sub-ops, and I
> suppose you've noticed this with the next patch presumably touching
> all the same places again.

Indeed. This solution works for now but is probably not what we want in =
the long run. Same goes for the current way we control viridian features =
via an HVM param. It is good enough for now IMO since domctl is not a =
stable interface. Any ideas about how we might implement a better =
interface in the longer term?

  Paul

>=20
> Jan


