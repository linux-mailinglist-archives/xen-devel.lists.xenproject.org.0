Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE592CDBD3
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 18:07:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43883.78801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kks52-0005Qp-71; Thu, 03 Dec 2020 17:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43883.78801; Thu, 03 Dec 2020 17:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kks52-0005QP-3W; Thu, 03 Dec 2020 17:07:44 +0000
Received: by outflank-mailman (input) for mailman id 43883;
 Thu, 03 Dec 2020 17:07:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oiWT=FH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kks51-0005QK-58
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 17:07:43 +0000
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58928c02-8db5-47f2-b985-4cf0a7ec52bd;
 Thu, 03 Dec 2020 17:07:41 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h21so4675786wmb.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Dec 2020 09:07:41 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-145.range86-183.btcentralplus.com.
 [86.183.162.145])
 by smtp.gmail.com with ESMTPSA id v12sm126244wrt.4.2020.12.03.09.07.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Dec 2020 09:07:39 -0800 (PST)
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
X-Inumbo-ID: 58928c02-8db5-47f2-b985-4cf0a7ec52bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=XjsLZyijg53AIF2WdwTwUGl3TQ8Jq0C865tkp8CATYc=;
        b=Ja9Z/mrv+3gRadIzKaT1A7w4roSSutxOJ0cFAsvhp32grnB0A1ynjzDX60oQMxRdKD
         UVQH4OmAJ10K0yCvSZ8wW0GTx7fsrTsd2QNSb1vgxB/MUw9k8pfpSh6nyUC80XNZ7mOx
         HCoDp5i4jVCsY/5+XSVzeLmDz1+XNTTueVqXGkBz+O6pBGV/cdRPDNtdvjHsoQQ+cJdW
         j4Fvha9te51zqo0nDlhJ+SjsqoguZxTwvfZP/iM3FKFMQHvXvCrlAPKmZuBrg+vuAESE
         iJ9Uc42opEWks9NfqIAJTnJXXMdhbvfXWtr1f/r9b1ALiDZjAz0cnSTThiC07UY4CSkc
         5Wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=XjsLZyijg53AIF2WdwTwUGl3TQ8Jq0C865tkp8CATYc=;
        b=C0ymlxY8WIOn7BL9qvbjsNL6GvrtpY0quHT2pjEzVgvbziy0S5vWUYLkN6KDl7FgwF
         DD52xdTIUZkHqgBarv3KvIOs0gdUSNJBDQbi3063grrwsfs2p7G6rk8morxsk3nfEjQX
         ufbNkHKdPgT67Lo32FimJl7eNVHPRRZL8UuUXv7Yc2SYsl7JHs64+LItjmmCnMStAhs3
         Hzl8hnAketYdF3j7iqZwPr9unUHL06t/Zjq8oC5lQZRA608SrXfs5B1haKS+CvT+chUc
         /TfClxE/PDLRV8wESfQTKmZouZAisc56QLmAuTzk7jwwpbgGAsVCH5Se7bQtKbqO06SN
         wtZA==
X-Gm-Message-State: AOAM5328QYlfeSn0tyruM5hRPTC9xr8BpReGZaAroi2j6lKgaxlRyN25
	t3YSDhyxhTltDPn6n6lnpbg=
X-Google-Smtp-Source: ABdhPJyMhSlKcRWvU4lJ4odLL/6qvd1arhOdHixsDjA4gel2YyLD0tZ3AKOBDzo1QVkxkGsuD4bYJQ==
X-Received: by 2002:a05:600c:2106:: with SMTP id u6mr136490wml.4.1607015260294;
        Thu, 03 Dec 2020 09:07:40 -0800 (PST)
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
References: <20201203124159.3688-1-paul@xen.org> <20201203124159.3688-2-paul@xen.org> <fea91a65-1d7c-cd46-81a2-9a6bcb690ed1@suse.com> <00ee01d6c98b$507af1c0$f170d540$@xen.org> <8a4a2027-0df3-aee2-537a-3d2814b329ec@suse.com>
In-Reply-To: <8a4a2027-0df3-aee2-537a-3d2814b329ec@suse.com>
Subject: RE: [PATCH v5 1/4] domctl: introduce a new domain create flag, XEN_DOMCTL_CDF_evtchn_fifo, ...
Date: Thu, 3 Dec 2020 17:07:38 -0000
Message-ID: <00f601d6c996$ce3908d0$6aab1a70$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJzrCHAX/gquRkO4g65wfjgQBytUAJ7xs67Aj6rtzQCSqguWAI8ixj/qGHFtuA=

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 03 December 2020 15:57
> To: paul@xen.org
> Cc: 'Paul Durrant' <pdurrant@amazon.com>; 'Eslam Elnikety' =
<elnikety@amazon.com>; 'Ian Jackson'
> <iwj@xenproject.org>; 'Wei Liu' <wl@xen.org>; 'Anthony PERARD' =
<anthony.perard@citrix.com>; 'Andrew
> Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap' =
<george.dunlap@citrix.com>; 'Julien Grall'
> <julien@xen.org>; 'Stefano Stabellini' <sstabellini@kernel.org>; =
'Christian Lindig'
> <christian.lindig@citrix.com>; 'David Scott' <dave@recoil.org>; =
'Volodymyr Babchuk'
> <Volodymyr_Babchuk@epam.com>; 'Roger Pau Monn=C3=A9' =
<roger.pau@citrix.com>; xen-devel@lists.xenproject.org
> Subject: Re: [PATCH v5 1/4] domctl: introduce a new domain create =
flag, XEN_DOMCTL_CDF_evtchn_fifo,
> ...
>=20
> On 03.12.2020 16:45, Paul Durrant wrote:
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 03 December 2020 15:23
> >>
> >> On 03.12.2020 13:41, Paul Durrant wrote:
> >>> From: Paul Durrant <pdurrant@amazon.com>
> >>>
> >>> ...to control the visibility of the FIFO event channel operations
> >>> (EVTCHNOP_init_control, EVTCHNOP_expand_array, and =
EVTCHNOP_set_priority) to
> >>> the guest.
> >>>
> >>> These operations were added to the public header in commit =
d2d50c2f308f
> >>> ("evtchn: add FIFO-based event channel ABI") and the first =
implementation
> >>> appeared in the two subsequent commits: edc8872aeb4a ("evtchn: =
implement
> >>> EVTCHNOP_set_priority and add the set_priority hook") and =
88910061ec61
> >>> ("evtchn: add FIFO-based event channel hypercalls and port ops"). =
Prior to
> >>> that, a guest issuing those operations would receive a return =
value of
> >>> -ENOSYS (not implemented) from Xen. Guests aware of the FIFO =
operations but
> >>> running on an older (pre-4.4) Xen would fall back to using the =
2-level event
> >>> channel interface upon seeing this return value.
> >>>
> >>> Unfortunately the uncontrolable appearance of these new operations =
in Xen 4.4
> >>> onwards has implications for hibernation of some Linux guests. =
During resume
> >>> from hibernation, there are two kernels involved: the "boot" =
kernel and the
> >>> "resume" kernel. The guest boot kernel may default to use FIFO =
operations and
> >>> instruct Xen via EVTCHNOP_init_control to switch from 2-level to =
FIFO. On the
> >>> other hand, the resume kernel keeps assuming 2-level, because it =
was hibernated
> >>> on a version of Xen that did not support the FIFO operations.
> >>>
> >>> To maintain compatibility it is necessary to make Xen behave as it =
did
> >>> before the new operations were added and hence the code in this =
patch ensures
> >>> that, if XEN_DOMCTL_CDF_evtchn_fifo is not set, the FIFO event =
channel
> >>> operations will again result in -ENOSYS being returned to the =
guest.
> >>
> >> I have to admit I'm now even more concerned of the control for such
> >> going into Xen, the more with the now 2nd use in the subsequent =
patch.
> >> The implication of this would seem to be that whenever we add new
> >> hypercalls or sub-ops, a domain creation control would also need
> >> adding determining whether that new sub-op is actually okay to use =
by
> >> a guest. Or else I'd be keen to up front see criteria at least =
roughly
> >> outlined by which it could be established whether such an override
> >> control is needed.
> >>
> >
> > Ultimately I think any new hypercall (or related set of hypercalls) =
added to the ABI needs to be
> opt-in on a per-domain basis, so that we know that from when a domain =
is first created it will not see
> a change in its environment unless the VM administrator wants that to =
happen.
>=20
> A new hypercall appearing is a change to the guest's environment, yes,
> but a backwards compatible one. I don't see how this would harm a =
guest.

Say we have a guest which is aware of the newer Xen and is coded to use =
the new hypercall *but* we start it on an older Xen where the new =
hypercall is not implemented. *Then* we migrate it to the newer Xen... =
the new hypercall suddenly becomes available and changes the guest =
behaviour. In the worst case, the guest is sufficiently confused that it =
crashes.

> This and ...
>=20
> >> I'm also not convinced such controls really want to be opt-in =
rather
> >> than opt-out.
> >
> > They really need to be opt-in I think. From a cloud provider PoV it =
is important that nothing in a
> customer's environment changes unless we want it to. Otherwise we have =
no way to deploy an updated
> hypervisor version without risking crashing their VMs.
>=20
> ... this sound to me more like workarounds for buggy guests than
> functionality the hypervisor _needs_ to have. (I can appreciate
> the specific case here for the specific scenario you provide as
> an exception.)

If we want to have a hypervisor that can be used in a cloud environment =
then Xen absolutely needs this capability.

>=20
> >>> --- a/xen/arch/arm/domain.c
> >>> +++ b/xen/arch/arm/domain.c
> >>> @@ -622,7 +622,8 @@ int arch_sanitise_domain_config(struct =
xen_domctl_createdomain *config)
> >>>      unsigned int max_vcpus;
> >>>
> >>>      /* HVM and HAP must be set. IOMMU may or may not be */
> >>> -    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu) !=3D
> >>> +    if ( (config->flags &
> >>> +          ~(XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_evtchn_fifo) =
!=3D
> >>>           (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
> >>>      {
> >>>          dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
> >>> --- a/xen/arch/arm/domain_build.c
> >>> +++ b/xen/arch/arm/domain_build.c
> >>> @@ -2478,7 +2478,8 @@ void __init create_domUs(void)
> >>>          struct domain *d;
> >>>          struct xen_domctl_createdomain d_cfg =3D {
> >>>              .arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE,
> >>> -            .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> >>> +            .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
> >>> +                     XEN_DOMCTL_CDF_evtchn_fifo,
> >>>              .max_evtchn_port =3D -1,
> >>>              .max_grant_frames =3D 64,
> >>>              .max_maptrack_frames =3D 1024,
> >>> --- a/xen/arch/arm/setup.c
> >>> +++ b/xen/arch/arm/setup.c
> >>> @@ -805,7 +805,8 @@ void __init start_xen(unsigned long =
boot_phys_offset,
> >>>      struct bootmodule *xen_bootmodule;
> >>>      struct domain *dom0;
> >>>      struct xen_domctl_createdomain dom0_cfg =3D {
> >>> -        .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> >>> +        .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
> >>> +                 XEN_DOMCTL_CDF_evtchn_fifo,
> >>>          .max_evtchn_port =3D -1,
> >>>          .max_grant_frames =3D gnttab_dom0_frames(),
> >>>          .max_maptrack_frames =3D -1,
> >>> --- a/xen/arch/x86/setup.c
> >>> +++ b/xen/arch/x86/setup.c
> >>> @@ -738,7 +738,8 @@ static struct domain *__init create_dom0(const =
module_t *image,
> >>>                                           const char *loader)
> >>>  {
> >>>      struct xen_domctl_createdomain dom0_cfg =3D {
> >>> -        .flags =3D IS_ENABLED(CONFIG_TBOOT) ? =
XEN_DOMCTL_CDF_s3_integrity : 0,
> >>> +        .flags =3D XEN_DOMCTL_CDF_evtchn_fifo |
> >>> +                 (IS_ENABLED(CONFIG_TBOOT) ? =
XEN_DOMCTL_CDF_s3_integrity : 0),
> >>>          .max_evtchn_port =3D -1,
> >>>          .max_grant_frames =3D -1,
> >>>          .max_maptrack_frames =3D -1,
> >>> --- a/xen/common/domain.c
> >>> +++ b/xen/common/domain.c
> >>> @@ -307,7 +307,7 @@ static int sanitise_domain_config(struct =
xen_domctl_createdomain *config)
> >>>           ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
> >>>             XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
> >>>             XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> >>> -           XEN_DOMCTL_CDF_nested_virt) )
> >>> +           XEN_DOMCTL_CDF_nested_virt | =
XEN_DOMCTL_CDF_evtchn_fifo) )
> >>>      {
> >>>          dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", =
config->flags);
> >>>          return -EINVAL;
> >>
> >> All of the hunks above point out a scalability issue if we were to
> >> follow this route for even just a fair part of new sub-ops, and I
> >> suppose you've noticed this with the next patch presumably touching
> >> all the same places again.
> >
> > Indeed. This solution works for now but is probably not what we want =
in the long run. Same goes for
> the current way we control viridian features via an HVM param. It is =
good enough for now IMO since
> domctl is not a stable interface. Any ideas about how we might =
implement a better interface in the
> longer term?
>=20
> While it has other downsides, J=C3=BCrgen's proposal doesn't have any
> similar scalability issue afaics. Another possible model would
> seem to be to key new hypercalls to hypervisor CPUID leaf bits,
> and derive their availability from a guest's CPUID policy. Of
> course this won't work when needing to retrofit guarding like
> you want to do here.
>=20

Ok, I'll take a look hypfs as an immediate solution, if that's =
preferred.

  Paul


