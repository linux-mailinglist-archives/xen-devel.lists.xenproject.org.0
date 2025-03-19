Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9F2A694C1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 17:23:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920925.1324975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuwC7-0005Yu-85; Wed, 19 Mar 2025 16:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920925.1324975; Wed, 19 Mar 2025 16:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuwC7-0005Wg-4r; Wed, 19 Mar 2025 16:23:03 +0000
Received: by outflank-mailman (input) for mailman id 920925;
 Wed, 19 Mar 2025 16:23:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sUeB=WG=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tuwC5-0005Ul-IN
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 16:23:01 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c59c849-04de-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 17:22:59 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ac297cbe017so171945966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 09:22:59 -0700 (PDT)
Received: from localhost ([46.149.103.11]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a9b74bsm1031382166b.168.2025.03.19.09.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 09:22:47 -0700 (PDT)
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
X-Inumbo-ID: 6c59c849-04de-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1742401379; x=1743006179; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQ3f135hq0vj6cfK0kSQ6gjlbOUDD1s3tqOAmZ+1qeY=;
        b=MrWFYcnoOBUFT0/H3KXCFTjcdiPLM4hOQxNAEq4ymiMYL0OSHGIHgwDXepw+X+y/bL
         7ES8ktnlfrdb/Q3KQ/ra4zyVmeyg/ih5NxBvVQehTSDfTYKFfiQBZTGG7ARb41G4Kixl
         tGW8L4RGMyHVzQhDd1+WaciMJn5hUSZQoMc0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742401379; x=1743006179;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SQ3f135hq0vj6cfK0kSQ6gjlbOUDD1s3tqOAmZ+1qeY=;
        b=Zalf767WLS0JIX5KE/nEHTcR6UiXP3cIl2+POKxNqlE5tb/JfO1BG5viX/xWiepS6W
         VMBsuKCP10bNj3tnv6LL6L8JGgyMf93fCj8BlDT0wg0QwL3wtW4aEPOhEMDSM8u8gIeS
         rgj9tiuclC2dDpM6m3/TCEYyzoiZ93zBX1pTbrbP7SFf/tbOzGIB5zgSH2xCIKpZbSb9
         Sh4XtUoGgcai02cPKXeiXYqQ/KeTomNuWzHWqPH5CoMFoIAUTGC8m2keKX6u+JVEVdmS
         XG8nLDVSAqJSj8cCgs3IRHxnVk0JTG1H8qPYBHk1+XONPcv03R1pvTsUIOJJRrXQ2D6d
         i1ww==
X-Forwarded-Encrypted: i=1; AJvYcCXlXEYFSq4HOpAmZIKz99cusFIBF7GYhc9hEOzHZMkmL5STg6H6rGfhmtFmxAab5r4DUg1i3/5nnsI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6ToYSrC9l3Nx9GjyEIe5FD9Oo7XHmfU9R7d1FMPAT1MdG/0Jg
	lFP4Xs4JWmWDv1rt7xXTJOUAjjkaO9weTujTQCal/ToiLxiOObHgZikGY8SuOFXClQi6q0Xiwhj
	q
X-Gm-Gg: ASbGncsSg9GcSvgsCgMpNkyvLgM9B6DdkC1kL3oy+KajRiFH6spOkNOgmipon5FTh9r
	pQXPSdFFKUDz3GEGLRavJLwjKLTAMjnOnR83fPALAaH1Nd+0zZXL7vt0RAnV7E9F29tSndLi0zy
	VgWxNGkUG5XLSxt3XMI54qsqRJTK4x3HnmZXot0WrDrXk1RgXRFfbXG7QiT7CDGShDy5WyzDzob
	RdduKF0hoRzf114cxKza6F+gbeZh0NMqFfFd7HXc40YhPXprlwZqf5iR/le9D2sWAXrPCJYRNqt
	ErVUBsz9q/SL3Nu6Yf2qqX+a8XpHihSxxOnQbq3JX4L4d35p5kRo/e1akAR72A==
X-Google-Smtp-Source: AGHT+IHghpJ824trwtp1f0BjAJswqgKy9C7Y1HSUaoLcNFUcGE7vO76VVubu+jvYGgmb0fsYT5NLzg==
X-Received: by 2002:a17:907:7e8f:b0:ac3:b50c:c94d with SMTP id a640c23a62f3a-ac3cdc7973amr12945566b.28.1742401368360;
        Wed, 19 Mar 2025 09:22:48 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Mar 2025 16:22:44 +0000
Message-Id: <D8KDQGQ0PYJ5.2DYMZFDLVXKSO@cloud.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross"
 <jgross@suse.com>, "Luca Fancellu" <luca.fancellu@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Julien Grall" <julien@xen.org>,
 "Bertrand Marquis" <bertrand.marquis@arm.com>
Subject: Re: [PATCH] tools/arm: Fix nr_spis handling v2
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel"
 <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250318090013.100823-1-michal.orzel@amd.com>
 <D8KAQ3MH52YA.1G12M32NDFRJW@cloud.com>
 <1f3c9275-14da-4baa-a0e1-e092d0d606b5@citrix.com>
In-Reply-To: <1f3c9275-14da-4baa-a0e1-e092d0d606b5@citrix.com>

On Wed Mar 19, 2025 at 2:05 PM GMT, Andrew Cooper wrote:
> On 19/03/2025 2:01 pm, Alejandro Vallejo wrote:
> > On Tue Mar 18, 2025 at 9:00 AM GMT, Michal Orzel wrote:
> >> We are missing a way to detect whether a user provided a value for
> >> nr_spis equal to 0 or did not provide any value (default is also 0) wh=
ich
> >> can cause issues when calculated nr_spis is > 0 and the value from dom=
ain
> >> config is 0. Fix it by setting default value for nr_spis to UINT32_MAX
> >> (max supported nr of SPIs is 960 anyway).
> >>
> >> Fixes: 55d62b8d4636 ("tools/arm: Reject configuration with incorrect n=
r_spis value")
> >> Reported-by: Luca Fancellu <luca.fancellu@arm.com>
> >> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >> ---
> >>  tools/libs/light/libxl_arm.c     | 7 ++++---
> >>  tools/libs/light/libxl_types.idl | 2 +-
> >>  2 files changed, 5 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm=
.c
> >> index 2d895408cac3..5bb5bac61def 100644
> >> --- a/tools/libs/light/libxl_arm.c
> >> +++ b/tools/libs/light/libxl_arm.c
> >> @@ -84,7 +84,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >>                                        libxl_domain_config *d_config,
> >>                                        struct xen_domctl_createdomain =
*config)
> >>  {
> >> -    uint32_t nr_spis =3D 0;
> >> +    uint32_t nr_spis =3D 0, cfg_nr_spis =3D d_config->b_info.arch_arm=
.nr_spis;
> >>      unsigned int i;
> >>      uint32_t vuart_irq, virtio_irq =3D 0;
> >>      bool vuart_enabled =3D false, virtio_enabled =3D false;
> >> @@ -181,13 +181,14 @@ int libxl__arch_domain_prepare_config(libxl__gc =
*gc,
> >> =20
> >>      LOG(DEBUG, "Configure the domain");
> >> =20
> >> -    if (nr_spis > d_config->b_info.arch_arm.nr_spis) {
> >> +    /* We use UINT32_MAX to denote if a user provided a value or not =
*/
> >> +    if ((cfg_nr_spis !=3D UINT32_MAX) && (nr_spis > cfg_nr_spis)) {
> >>          LOG(ERROR, "Provided nr_spis value is too small (minimum requ=
ired %u)\n",
> >>              nr_spis);
> >>          return ERROR_FAIL;
> >>      }
> >> =20
> >> -    config->arch.nr_spis =3D max(nr_spis, d_config->b_info.arch_arm.n=
r_spis);
> >> +    config->arch.nr_spis =3D (cfg_nr_spis !=3D UINT32_MAX) ? cfg_nr_s=
pis : nr_spis;
> >>      LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);
> >> =20
> >>      switch (d_config->b_info.arch_arm.gic_version) {
> >> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl=
_types.idl
> >> index bd4b8721ff19..129c00ce929c 100644
> >> --- a/tools/libs/light/libxl_types.idl
> >> +++ b/tools/libs/light/libxl_types.idl
> >> @@ -723,7 +723,7 @@ libxl_domain_build_info =3D Struct("domain_build_i=
nfo",[
> >>      ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
> >>                                 ("vuart", libxl_vuart_type),
> >>                                 ("sve_vl", libxl_sve_type),
> >> -                               ("nr_spis", uint32),
> >> +                               ("nr_spis", uint32, {'init_val': 'UINT=
32_MAX'}),
> >>                                ])),
> >>      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
> >>                                ])),
> > Doesn't this regenerate the golang bindings?
>
> You need a build environment with golang for that to happen.=C2=A0 It's e=
asy
> to miss.
>
> In this case, best to ask the committer to regen.
>
> ~Andrew

One more thing for the list of stuff I'd like to add to CI at some point.

Cheers,
Alejandro

