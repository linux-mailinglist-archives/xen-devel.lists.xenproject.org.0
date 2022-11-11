Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88757625D75
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 15:48:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442629.696994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otVKf-0001Nl-CW; Fri, 11 Nov 2022 14:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442629.696994; Fri, 11 Nov 2022 14:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otVKf-0001L4-92; Fri, 11 Nov 2022 14:48:37 +0000
Received: by outflank-mailman (input) for mailman id 442629;
 Fri, 11 Nov 2022 14:48:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8SH=3L=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1otVKd-0001Ky-2K
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 14:48:35 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9d6d13f-61cf-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 15:48:33 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so4898319pjk.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Nov 2022 06:48:33 -0800 (PST)
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
X-Inumbo-ID: e9d6d13f-61cf-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IhWJ2nLOKJu8brLADrOERw4TNBcH2kQxpA6zIJNjozs=;
        b=dEtrqs4York8w/lGHpP+yDOG5OEboeDpOIo+L5WqUX7bmdympj9nybP4eSytGPAZQ/
         stbe/MqTf/e3JdBEw3T3/Avwcpq34GdYwD6n5rM+eQH4wmHvTnbbQOCwetqwCGxc1llV
         jNLTRo90w9m2rnFKcSs4WIXz9ti83M4Mm4zDfwmvnjEXAsYdcFdiw8zLIQJeZyLsHJcQ
         2hyPi3JRNDWgwQ1pKVg5u2RCR1bJExZ9ZwtulE4yVdhvpZDzwjVkMuvt9mOl8rS/seYP
         qD/l4Fs5FgGFeLcTQT9fB5gib5uMYFvU7lvwjaNxOWpPFc9NwT+khPIn/a7+Z65NjnmN
         FcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IhWJ2nLOKJu8brLADrOERw4TNBcH2kQxpA6zIJNjozs=;
        b=RsFpY91d94uKnCdlc7iEVwCFM7H6l5VD9NdVyJJtB+pgVqJ8a1On6K5z23thbAjXuY
         5gS8/K3llt2rbEHaVo54tEruUK7xcNyD6pyGVJvca7OX5DT7Hx/qJarI92zlrw4bDrjW
         y+LBJT8EcTVPrnQOKrvKRXv7eN2NOfhK7o6CRKREl4a1MvOxja6fESVepyK3tw4k6oEh
         hhN0S303oR5DToWicizYSsUhOQhqb+NdtlD6TKgbp29tAYHG1ZZ7O6iL+xpscbfbYqIj
         FLGd9KW6/32M9r2N3bnqt5LVxvFdfl2Hjp157G/dUfJJRojYjt8QYy82THISFRAsKClR
         ZPyQ==
X-Gm-Message-State: ANoB5plFIduqDSsoJSuErLwdOd/VC3jlLYxBDwp4Q/NeADJcy0RweFJA
	i9jyIVbPbR2CxL9dCFvhCz06VO5lPwA8hR3GStQ=
X-Google-Smtp-Source: AA0mqf4H1yoeVxLU98n1XLKOYks3RamLzGyjbmjJ/GqJtIAuMQeqv1N5M0gvruyjDPZYPUDqy9DYHkJ8hXRFm6+opKA=
X-Received: by 2002:a17:902:70c1:b0:188:77a7:eb5 with SMTP id
 l1-20020a17090270c100b0018877a70eb5mr2666367plt.6.1668178111994; Fri, 11 Nov
 2022 06:48:31 -0800 (PST)
MIME-Version: 1.0
References: <20221111112208.451449-1-Henry.Wang@arm.com> <20221111112208.451449-3-Henry.Wang@arm.com>
In-Reply-To: <20221111112208.451449-3-Henry.Wang@arm.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Fri, 11 Nov 2022 14:48:20 +0000
Message-ID: <CAPD2p-=Y-1SwcWc5p-_nrWZAjTZPiyF7KZbeM62q9hafybD9Gw@mail.gmail.com>
Subject: Re: [PATCH 2/3] CHANGELOG: Add missing entries for work during the
 4.17 release
To: Henry Wang <Henry.Wang@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000c9a02705ed32fbc8"

--000000000000c9a02705ed32fbc8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 11, 2022 at 11:23 AM Henry Wang <Henry.Wang@arm.com> wrote:

Hello Henry

[leave only xen-devel@lists.xenproject.org in CC]
[sorry for the possible format issues]

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
>  CHANGELOG.md | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index adbbb216fa..fa8cc476b3 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -4,16 +4,41 @@ Notable changes to Xen will be documented in this file.
>
>  The format is based on [Keep a Changelog](
> https://keepachangelog.com/en/1.0.0/)
>
> -## [unstable UNRELEASED](
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dshortlog;h=3Dstaging) - T=
BD
> +## [4.17.0](
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dshortlog;h=3Dstaging) -
> 2022-11-??
>
>  ### Changed
>   - On x86 "vga=3Dcurrent" can now be used together with GrUB2's gfxpaylo=
ad
> setting. Note that
>     this requires use of "multiboot2" (and "module2") as the GrUB command=
s
> loading Xen.
> + - The "gnttab" option now has a new command line sub-option for
> disabling the
> +   GNTTABOP_transfer functionality.
> + - The x86 MCE command line option info is now updated.
>
>  ### Added / support upgraded
> + - Out-of-tree builds for the hypervisor now supported.
> + - The project has officially adopted 4 directives and 24 rules of
> MISRA-C,
> +   added MISRA-C checker build integration, and defined how to document
> +   deviations.
>   - IOMMU superpage support on x86, affecting PV guests as well as HVM/PV=
H
> ones
>     when they don't share page tables with the CPU (HAP / EPT / NPT).
> - - Support VIRT_SSBD feature for HVM guests on AMD.
> + - Support VIRT_SSBD feature for HVM guests on AMD and MSR_SPEC_CTRL
> feature for
> +   SVM guests.
> + - Improved TSC, CPU frequency calibration and APIC on x86.
> + - Improved support for CET Indirect Branch Tracking on x86.
> + - Improved mwait-idle support for SPR and ADL on x86.
> + - Extend security support for hosts to 12 TiB of memory on x86.
> + - Add command line option to set cpuid parameters for dom0 at boot time
> on x86.
> + - Improved static configuration options on Arm.
> + - cpupools can be specified at boot using device tree on Arm.
> + - It is possible to use PV drivers with dom0less guests, allowing
> statically
> +   booted dom0less guests with PV devices.
> + - On Arm, p2m structures are now allocated out of a pool of memory set
> aside at
> +   domain creation.
> + - Improved mitigations against Spectre-BHB on Arm.
> + - Add support for VirtIO toolstack on Arm.
>

I would clarify that only virtio-mmio is supported on Arm.


> + - Allow setting the number of CPUs to activate at runtime from command
> line
> +   option on Arm.
> + - Improved toolstack build system.
> + - Add Xue - console over USB 3 Debug Capability.
>

I would probably also add the following:

- Add Renesas R-Car Gen4 IPMMU-VMSA support (Arm)
- grant-table support on Arm was improved and hardened by implementing
=E2=80=9Csimplified M2P-like
approach for the xenheap pages=E2=80=9D



>
>  ### Removed / support downgraded
>   - dropped support for the (x86-only) "vesa-mtrr" and "vesa-remap"
> command line options
> --
> 2.25.1
>
>
>

--=20
Regards,

Oleksandr Tyshchenko

--000000000000c9a02705ed32fbc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 11, 2022 at 11:23 AM Henr=
y Wang &lt;<a href=3D"mailto:Henry.Wang@arm.com" target=3D"_blank">Henry.Wa=
ng@arm.com</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_attr"><b=
r></div><div class=3D"gmail_attr">Hello Henry</div><div class=3D"gmail_attr=
"><br></div><div class=3D"gmail_attr">[leave only <a href=3D"mailto:xen-dev=
el@lists.xenproject.org">xen-devel@lists.xenproject.org</a> in CC]<br></div=
><div class=3D"gmail_attr">[sorry for the possible format issues]</div><div=
 dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Signed-off-by: Henry Wang &lt;<a href=3D"mailto:Henry.Wa=
ng@arm.com" target=3D"_blank">Henry.Wang@arm.com</a>&gt;<br>
---<br>
=C2=A0CHANGELOG.md | 29 +++++++++++++++++++++++++++--<br>
=C2=A01 file changed, 27 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/CHANGELOG.md b/CHANGELOG.md<br>
index adbbb216fa..fa8cc476b3 100644<br>
--- a/CHANGELOG.md<br>
+++ b/CHANGELOG.md<br>
@@ -4,16 +4,41 @@ Notable changes to Xen will be documented in this file.<b=
r>
<br>
=C2=A0The format is based on [Keep a Changelog](<a href=3D"https://keepacha=
ngelog.com/en/1.0.0/" rel=3D"noreferrer" target=3D"_blank">https://keepacha=
ngelog.com/en/1.0.0/</a>)<br>
<br>
-## [unstable UNRELEASED](<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxe=
n.git;a=3Dshortlog;h=3Dstaging" rel=3D"noreferrer" target=3D"_blank">https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dshortlog;h=3Dstaging</a>) - TBD<b=
r>
+## [4.17.0](<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsho=
rtlog;h=3Dstaging" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen=
.org/gitweb/?p=3Dxen.git;a=3Dshortlog;h=3Dstaging</a>) - 2022-11-??<br>
<br>
=C2=A0### Changed<br>
=C2=A0 - On x86 &quot;vga=3Dcurrent&quot; can now be used together with GrU=
B2&#39;s gfxpayload setting. Note that<br>
=C2=A0 =C2=A0 this requires use of &quot;multiboot2&quot; (and &quot;module=
2&quot;) as the GrUB commands loading Xen.<br>
+ - The &quot;gnttab&quot; option now has a new command line sub-option for=
 disabling the<br>
+=C2=A0 =C2=A0GNTTABOP_transfer functionality.<br>
+ - The x86 MCE command line option info is now updated.<br>
<br>
=C2=A0### Added / support upgraded<br>
+ - Out-of-tree builds for the hypervisor now supported.<br>
+ - The project has officially adopted 4 directives and 24 rules of MISRA-C=
,<br>
+=C2=A0 =C2=A0added MISRA-C checker build integration, and defined how to d=
ocument<br>
+=C2=A0 =C2=A0deviations.<br>
=C2=A0 - IOMMU superpage support on x86, affecting PV guests as well as HVM=
/PVH ones<br>
=C2=A0 =C2=A0 when they don&#39;t share page tables with the CPU (HAP / EPT=
 / NPT).<br>
- - Support VIRT_SSBD feature for HVM guests on AMD.<br>
+ - Support VIRT_SSBD feature for HVM guests on AMD and MSR_SPEC_CTRL featu=
re for<br>
+=C2=A0 =C2=A0SVM guests.<br>
+ - Improved TSC, CPU frequency calibration and APIC on x86.<br>
+ - Improved support for CET Indirect Branch Tracking on x86.<br>
+ - Improved mwait-idle support for SPR and ADL on x86.<br>
+ - Extend security support for hosts to 12 TiB of memory on x86.<br>
+ - Add command line option to set cpuid parameters for dom0 at boot time o=
n x86.<br>
+ - Improved static configuration options on Arm.<br>
+ - cpupools can be specified at boot using device tree on Arm.<br>
+ - It is possible to use PV drivers with dom0less guests, allowing statica=
lly<br>
+=C2=A0 =C2=A0booted dom0less guests with PV devices.<br>
+ - On Arm, p2m structures are now allocated out of a pool of memory set as=
ide at<br>
+=C2=A0 =C2=A0domain creation.<br>
+ - Improved mitigations against Spectre-BHB on Arm.<br>
+ - Add support for VirtIO toolstack on Arm.<br></blockquote><div>=C2=A0</d=
iv><div>I would clarify that only virtio-mmio is supported on Arm.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+ - Allow setting the number of CPUs to activate at runtime from command li=
ne<br>
+=C2=A0 =C2=A0option on Arm.<br>
+ - Improved toolstack build system.<br>
+ - Add Xue - console over USB 3 Debug Capability.<br></blockquote><div><br=
></div><div>I would probably also add the following:</div><div><br></div><d=
iv>- Add Renesas R-Car Gen4 IPMMU-VMSA support (Arm)<br></div><div>- grant-=
table support on Arm was improved and hardened by implementing =E2=80=9Csim=
plified M2P-like</div><div>approach for the xenheap pages=E2=80=9D<br></div=
><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
=C2=A0### Removed / support downgraded<br>
=C2=A0 - dropped support for the (x86-only) &quot;vesa-mtrr&quot; and &quot=
;vesa-remap&quot; command line options<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><span style=
=3D"background-color:rgb(255,255,255)"><font size=3D"2"><span style=3D"colo=
r:rgb(51,51,51);font-family:Arial,sans-serif">Regards,</span></font></span>=
</div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div><span style=3D"backg=
round-color:rgb(255,255,255)"><font size=3D"2">Oleksandr Tyshchenko</font><=
/span></div></div></div></div></div></div></div></div>

--000000000000c9a02705ed32fbc8--

