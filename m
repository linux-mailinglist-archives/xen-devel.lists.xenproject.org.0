Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B253FB1DCC8
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 19:59:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073452.1436285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk4t6-0002tx-Vi; Thu, 07 Aug 2025 17:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073452.1436285; Thu, 07 Aug 2025 17:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk4t6-0002sP-Sp; Thu, 07 Aug 2025 17:58:48 +0000
Received: by outflank-mailman (input) for mailman id 1073452;
 Thu, 07 Aug 2025 17:58:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ck7v=2T=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1uk4t6-0002sJ-95
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 17:58:48 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a20f6c1-73b8-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 19:58:46 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-458bece40fcso7575925e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 10:58:46 -0700 (PDT)
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
X-Inumbo-ID: 2a20f6c1-73b8-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754589526; x=1755194326; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZaVtEeTFOPXKnjN/YUL4KsNEe+UKZQVlkQ3V5nxpgm8=;
        b=itC1UwFY0KAl9Wl+WOYQ0z0ZaCWWn6FIbdkz6adoeoGBqQEZtwT/9Acmu+Ku8jWjfY
         OzzOdyHL+smkAUjCwcL4M/IjuRnYlWU0fjW4Cs9qlu7wy7PWm+Vrd+pmNACTJ1vNpba5
         KosJSYC+bwaRj6O0o15HP2Dw7BuxUkJA+b2zPTSrNA1bYtQCJmTsnx1DA2BUwJMIkw1j
         r/ENs5qyuY8jPFXM4UUO8e9ELeDxCBSqWbOjoedhMCRNfnk71cgOPyzE/hXzpcKpbQgR
         Aj86w8sz7301i7Vq826McXMyxW5JLTeiS+PWu7rY3O/bxktsnt027a7LtXUjIcKtBn8Q
         n3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754589526; x=1755194326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZaVtEeTFOPXKnjN/YUL4KsNEe+UKZQVlkQ3V5nxpgm8=;
        b=cRmDwphruT/O81eJLlN3PTFi7SIMlYtsxkkp4tdPcdfgg47mtz2WytaOyx33udn3Hq
         4kyZrddIWmFPL1UsrYL8iDZsHdCGzfUOvUb8ao+yvnfg4OB46An4v+KNi4v5Yj26AD0s
         B5ISCmFdxcOCDpS+56DbLtUbpwiV4PiN32LsNKE0dl5uJMjctSHsCViy4imG8bL/gBEx
         E8/0bYbG1ZzNfcxhknTzKcEBE+KX5K/aePp2GJgJWCvFPaJA8lhqt0GxKge6fb7r4nNu
         e8aP+PStY0MF9BmDJv3rR9be5iCKKEp6Ka76drL2oMjpmpN3iRGQirY8DD3kYMi7xnrl
         4pvQ==
X-Gm-Message-State: AOJu0Yzzfg/csu1pxxnCSX0V8ItqtumCXA9BzspFv6zvi6poOMoROkrg
	HETbhfUFahvzq99HiosN0S5Y6Bskz/MJ+6CeMCfRIQcRnvBIwvA1rsSBc6Pc6hOnetS6FC+pop2
	24XUgpUJubCi82yeVEggqW/PO3AuhKoM=
X-Gm-Gg: ASbGncskd0BzqmQOctcc1/s1wAioPO2F0Vjme1BtjMysT0VTFy2H4vohB8+RrpgwZ/v
	feWVuiSgTaw7PXnMy0z1tlOJZS+IvPJ4MkMj8vp+c4M3ndSIV57Eo5La2VVPfBO1V8M397KCHng
	22k5irysvx6O0luUyG8xGkvgGzZqz+xz5Yf5GCmXSjAZ06aDdCdOZteCNbab1hBb+aIJC8RPy06
	U2QLBYUf8GT3EDsY2PpJbwuhG9MZ6v5Vo57ONXRow==
X-Google-Smtp-Source: AGHT+IElGcaCeliyS+2kBjL7DGwVcK2/gtoMdO6qLtpZ/ET68j1eLakrtnURgb2xsHfWj9Y/ZM+woDR2QIjO39E4bLU=
X-Received: by 2002:a05:6000:4283:b0:3b8:d8d1:6ceb with SMTP id
 ffacd0b85a97d-3b900b2de47mr182786f8f.24.1754589525913; Thu, 07 Aug 2025
 10:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754580687.git.milan_djokic@epam.com>
In-Reply-To: <cover.1754580687.git.milan_djokic@epam.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 7 Aug 2025 18:58:34 +0100
X-Gm-Features: Ac12FXzeEfkEXXhWH7z12JYf_ohAFyKMyyVzXgNwl9xI8tiQszRr80PO1zzg6Po
Message-ID: <CAJ=z9a1eM6M+Gagond9TiFtF7c7EEQKOKHANcvDWDhW_3JzqOA@mail.gmail.com>
Subject: Re: [PATCH 00/20] Add SMMUv3 Stage 1 Support for XEN guests
To: Milan Djokic <milan_djokic@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Nick Rosbrook <enr0n@ubuntu.com>, 
	George Dunlap <gwd@xenproject.org>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000006b36ce063bca3518"

--0000000000006b36ce063bca3518
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Milan,

On Thu, 7 Aug 2025 at 17:55, Milan Djokic <milan_djokic@epam.com> wrote:

> This patch series represents a rebase of an older patch series implemente=
d
> and
> sumbitted by Rahul Singh as an RFC:
> https://patchwork.kernel.org/project/xen-devel/cover/cover.1669888522.git=
.rahul.singh@arm.com/
> .
> Original patch series content is aligned with the latest xen structure in
> terms of common/arch-specific code structuring.
> Some minor bugfixes are also applied:
> - Sanity checks / error handling
> - Non-pci devices support for emulated iommu


>
> Overall description of stage-1 support is available in the original
> patch series cover letter. Original commits structure with detailed
> explanation for each commit
> functionality is maintained.


I am a bit surprised not much has changed. Last time we asked a document to
explain the overall design of the vSMMU including some details on the
security posture. I can=E2=80=99t remember if this was ever posted.

If not, then you need to start with that. Otherwise, if is going to be
pretty difficult to review this series.

Cheers,


>
> Patch series testing is performed in qemu arm environment. Additionally,
> stage-1 translation for non-pci devices is verified on a Renesas platform=
.
>
> Jean-Philippe Brucker (1):
>   xen/arm: smmuv3: Maintain a SID->device structure
>
> Rahul Singh (19):
>   xen/arm: smmuv3: Add support for stage-1 and nested stage translation
>   xen/arm: smmuv3: Alloc io_domain for each device
>   xen/arm: vIOMMU: add generic vIOMMU framework
>   xen/arm: vsmmuv3: Add dummy support for virtual SMMUv3 for guests
>   xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and viommu config param
>   xen/arm: vIOMMU: Add cmdline boot option "viommu =3D <boolean>"
>   xen/arm: vsmmuv3: Add support for registers emulation
>   xen/arm: vsmmuv3: Add support for cmdqueue handling
>   xen/arm: vsmmuv3: Add support for command CMD_CFGI_STE
>   xen/arm: vsmmuv3: Attach Stage-1 configuration to SMMUv3 hardware
>   xen/arm: vsmmuv3: Add support for event queue and global error
>   xen/arm: vsmmuv3: Add "iommus" property node for dom0 devices
>   xen/arm: vIOMMU: IOMMU device tree node for dom0
>   xen/arm: vsmmuv3: Emulated SMMUv3 device tree node for dom0less
>   arm/libxl: vsmmuv3: Emulated SMMUv3 device tree node in libxl
>   xen/arm: vsmmuv3: Alloc virq for virtual SMMUv3
>   xen/arm: vsmmuv3: Add support to send stage-1 event to guest
>   libxl/arm: vIOMMU: Modify the partial device tree for iommus
>   xen/arm: vIOMMU: Modify the partial device tree for dom0less
>
>  docs/man/xl.cfg.5.pod.in                |  13 +
>  docs/misc/xen-command-line.pandoc       |   7 +
>  tools/golang/xenlight/helpers.gen.go    |   2 +
>  tools/golang/xenlight/types.gen.go      |   1 +
>  tools/include/libxl.h                   |   5 +
>  tools/libs/light/libxl_arm.c            | 123 +++-
>  tools/libs/light/libxl_types.idl        |   6 +
>  tools/xl/xl_parse.c                     |  10 +
>  xen/arch/arm/dom0less-build.c           |  72 ++
>  xen/arch/arm/domain.c                   |  26 +
>  xen/arch/arm/domain_build.c             | 103 ++-
>  xen/arch/arm/include/asm/domain.h       |   4 +
>  xen/arch/arm/include/asm/viommu.h       | 102 +++
>  xen/common/device-tree/dom0less-build.c |  31 +-
>  xen/drivers/passthrough/Kconfig         |  14 +
>  xen/drivers/passthrough/arm/Makefile    |   2 +
>  xen/drivers/passthrough/arm/smmu-v3.c   | 369 +++++++++-
>  xen/drivers/passthrough/arm/smmu-v3.h   |  49 +-
>  xen/drivers/passthrough/arm/viommu.c    |  87 +++
>  xen/drivers/passthrough/arm/vsmmu-v3.c  | 895 ++++++++++++++++++++++++
>  xen/drivers/passthrough/arm/vsmmu-v3.h  |  32 +
>  xen/include/public/arch-arm.h           |  14 +-
>  xen/include/public/device_tree_defs.h   |   1 +
>  xen/include/xen/iommu.h                 |  14 +
>  24 files changed, 1935 insertions(+), 47 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/viommu.h
>  create mode 100644 xen/drivers/passthrough/arm/viommu.c
>  create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.c
>  create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.h
>
> --
> 2.43.0
>

--0000000000006b36ce063bca3518
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Hi Milan,</div><div><br><div class=3D"gmail_quote"><=
/div></div></div><div><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 7 Aug 2=
025 at 17:55, Milan Djokic &lt;<a href=3D"mailto:milan_djokic@epam.com" tar=
get=3D"_blank">milan_djokic@epam.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">This patch series represents a rebase of an older patch se=
ries implemented and<br>
sumbitted by Rahul Singh as an RFC: <a href=3D"https://patchwork.kernel.org=
/project/xen-devel/cover/cover.1669888522.git.rahul.singh@arm.com/" rel=3D"=
noreferrer" target=3D"_blank">https://patchwork.kernel.org/project/xen-deve=
l/cover/cover.1669888522.git.rahul.singh@arm.com/</a>.<br>
Original patch series content is aligned with the latest xen structure in t=
erms of common/arch-specific code structuring. <br>
Some minor bugfixes are also applied:<br>
- Sanity checks / error handling<br>
- Non-pci devices support for emulated iommu</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex" dir=3D"auto"><br>
<br>
Overall description of stage-1 support is available in the original<br>
patch series cover letter. Original commits structure with detailed explana=
tion for each commit<br>
functionality is maintained.</blockquote><div dir=3D"auto"><br></div></div>=
<div><div dir=3D"auto">I am a bit surprised not much has changed. Last time=
 we asked a document to explain the overall design of the vSMMU=C2=A0<span =
style=3D"font-family:-apple-system,sans-serif">including some details on th=
e security posture. I can=E2=80=99t remember if this was ever posted.</span=
></div><div dir=3D"auto"><span style=3D"font-family:-apple-system,sans-seri=
f"><br></span></div><div dir=3D"auto"><span style=3D"font-family:-apple-sys=
tem,sans-serif">If not, then you need to start with that. Otherwise, if is =
going to be pretty difficult to review this series.</span></div><div dir=3D=
"auto"><span style=3D"font-family:-apple-system,sans-serif"><br></span></di=
v><div dir=3D"auto">Cheers,</div></div><div><div><div class=3D"gmail_quote"=
><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><b=
r>
<br>
Patch series testing is performed in qemu arm environment. Additionally,<br=
>
stage-1 translation for non-pci devices is verified on a Renesas platform.<=
br>
<br>
Jean-Philippe Brucker (1):<br>
=C2=A0 xen/arm: smmuv3: Maintain a SID-&gt;device structure<br>
<br>
Rahul Singh (19):<br>
=C2=A0 xen/arm: smmuv3: Add support for stage-1 and nested stage translatio=
n<br>
=C2=A0 xen/arm: smmuv3: Alloc io_domain for each device<br>
=C2=A0 xen/arm: vIOMMU: add generic vIOMMU framework<br>
=C2=A0 xen/arm: vsmmuv3: Add dummy support for virtual SMMUv3 for guests<br=
>
=C2=A0 xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and viommu config param<b=
r>
=C2=A0 xen/arm: vIOMMU: Add cmdline boot option &quot;viommu =3D &lt;boolea=
n&gt;&quot;<br>
=C2=A0 xen/arm: vsmmuv3: Add support for registers emulation<br>
=C2=A0 xen/arm: vsmmuv3: Add support for cmdqueue handling<br>
=C2=A0 xen/arm: vsmmuv3: Add support for command CMD_CFGI_STE<br>
=C2=A0 xen/arm: vsmmuv3: Attach Stage-1 configuration to SMMUv3 hardware<br=
>
=C2=A0 xen/arm: vsmmuv3: Add support for event queue and global error<br>
=C2=A0 xen/arm: vsmmuv3: Add &quot;iommus&quot; property node for dom0 devi=
ces<br>
=C2=A0 xen/arm: vIOMMU: IOMMU device tree node for dom0<br>
=C2=A0 xen/arm: vsmmuv3: Emulated SMMUv3 device tree node for dom0less<br>
=C2=A0 arm/libxl: vsmmuv3: Emulated SMMUv3 device tree node in libxl<br>
=C2=A0 xen/arm: vsmmuv3: Alloc virq for virtual SMMUv3<br>
=C2=A0 xen/arm: vsmmuv3: Add support to send stage-1 event to guest<br>
=C2=A0 libxl/arm: vIOMMU: Modify the partial device tree for iommus<br>
=C2=A0 xen/arm: vIOMMU: Modify the partial device tree for dom0less<br>
<br>
=C2=A0docs/man/<a href=3D"http://xl.cfg.5.pod.in" rel=3D"noreferrer" target=
=3D"_blank">xl.cfg.5.pod.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 13 +<br>
=C2=A0docs/misc/xen-command-line.pandoc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A07 +<br>
=C2=A0tools/golang/xenlight/helpers.gen.go=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<b=
r>
=C2=A0tools/golang/xenlight/types.gen.go=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
1 +<br>
=C2=A0tools/include/libxl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0tools/libs/light/libxl_arm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 123 +++-<br>
=C2=A0tools/libs/light/libxl_types.idl=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A06 +<br>
=C2=A0tools/xl/xl_parse.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +<br>
=C2=A0xen/arch/arm/dom0less-build.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 72 ++<br>
=C2=A0xen/arch/arm/domain.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 26 +<br>
=C2=A0xen/arch/arm/domain_build.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 103 ++-<br>
=C2=A0xen/arch/arm/include/asm/domain.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A04 +<br>
=C2=A0xen/arch/arm/include/asm/viommu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 102 +++=
<br>
=C2=A0xen/common/device-tree/dom0less-build.c |=C2=A0 31 +-<br>
=C2=A0xen/drivers/passthrough/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 14 +<br>
=C2=A0xen/drivers/passthrough/arm/Makefile=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<b=
r>
=C2=A0xen/drivers/passthrough/arm/smmu-v3.c=C2=A0 =C2=A0| 369 +++++++++-<br=
>
=C2=A0xen/drivers/passthrough/arm/smmu-v3.h=C2=A0 =C2=A0|=C2=A0 49 +-<br>
=C2=A0xen/drivers/passthrough/arm/viommu.c=C2=A0 =C2=A0 |=C2=A0 87 +++<br>
=C2=A0xen/drivers/passthrough/arm/vsmmu-v3.c=C2=A0 | 895 ++++++++++++++++++=
++++++<br>
=C2=A0xen/drivers/passthrough/arm/vsmmu-v3.h=C2=A0 |=C2=A0 32 +<br>
=C2=A0xen/include/public/arch-arm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 14 +-<br>
=C2=A0xen/include/public/device_tree_defs.h=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<b=
r>
=C2=A0xen/include/xen/iommu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 14 +<br>
=C2=A024 files changed, 1935 insertions(+), 47 deletions(-)<br>
=C2=A0create mode 100644 xen/arch/arm/include/asm/viommu.h<br>
=C2=A0create mode 100644 xen/drivers/passthrough/arm/viommu.c<br>
=C2=A0create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.c<br>
=C2=A0create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.h<br>
<br>
-- <br>
2.43.0<br>
</blockquote></div></div>
</div>

--0000000000006b36ce063bca3518--

