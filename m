Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ABE4CA8BA
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 16:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282330.481004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPQU3-0000de-QU; Wed, 02 Mar 2022 15:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282330.481004; Wed, 02 Mar 2022 15:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPQU3-0000b4-KG; Wed, 02 Mar 2022 15:01:43 +0000
Received: by outflank-mailman (input) for mailman id 282330;
 Wed, 02 Mar 2022 15:01:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=alt7=TN=citrix.com=prvs=053475f8d=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nPQU1-0000as-Dt
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 15:01:41 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9127ac9-9a39-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 16:01:40 +0100 (CET)
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
X-Inumbo-ID: a9127ac9-9a39-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646233300;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5KcxhijTDRSq6JWWwTlcwnD9VXMmCwU9rJErCFz1CI0=;
  b=W+laNnovRASbArDK1Bs7v0xAxuXdbNgp99kM8mVKhkgHDcRAR08/nF7K
   /gZvohof0Qn3k8EeHaVxg0DOD5OOVzNWpXAA/DHn0nPiAeVahlEJPJkdp
   b3iR8D2+asqZGqNzY61YIuNCXRmBrKYygRhBjjB0xCCVCcUS6WGZjNHWq
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64766513
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nkfro6+Ww23y4RDBtJTEDrUD5H6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 zBOXG6Ba/vZN2fwfY12O42yoENT78LVmoJhHQZl+yw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oDjW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCna2bSEQuIrPgpLgYTyFDOS1gbZdUo5aSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKEWvHwm6DjdBPIvR53rSKTW/95Imjw3g6iiGN6AO
 5VHN2c2N3wsZTUVOmU6Us4guduUjyjSVRdXtHvPpu04tj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+ov+KaQr6AwxgfJnypKVUNQBQDTTeSFZlCWavlea
 EsI5AYS8a0uzFeBQsetZQ/jiSvR1vIDYOZ4H+o/4QCL76Pb5QeFG2QJJgJ8hMwaWNweHmJzi
 ALQ9z/9LXk26eDOFyrBnluBhW7qYUAowXk+iTjopOfvy/3qu8kNgx3GVb6P+4bl34SuSVkcL
 91nxRXSZon/b+ZWj81XHnid2lpAQ6QlqCZvvG07uUr/s2tEiHaNPdDA1LQixa8owHylZleAp
 mMYvMOV8foDC5qA/ATUHrlTRe/xv6fbaWyG6bKKI3XH3273k5JEVdoNiAyS2W8zappUEdMXS
 BW7VfxtCG97YyLxMP4fj3OZAMU216nwfekJpdiPBueilqNZLVfdlAk3PBb49zm0zCAEzPFuU
 b/GIJ3EJStLVsxaIM+eGr51PUkDnXtlmws+hPnTknya7FZpTCXNGOddbQDXNbhRAWHtiFy9z
 uuz/vCik313ONASqAGMmWLPBTjm9UQGOK0=
IronPort-HdrOrdr: A9a23:48gkAK7sq8gn1GfzDwPXwMTXdLJyesId70hD6qhwISY6TiX+rb
 HIoB17726RtN9/YhEdcLy7VJVoIkmskKKdg7NhXotKNTOO0ADDQb2KhbGSpQEIcBeeygcy78
 hdmtBFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.90,149,1643691600"; 
   d="scan'208";a="64766513"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>
Subject: [PATCH v4 0/2] xen: Report and use hardware APIC virtualization capabilities
Date: Wed, 2 Mar 2022 15:00:54 +0000
Message-ID: <20220302150056.14381-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Jane Malalane (2):
  xen+tools: Report Interrupt Controller Virtualization capabilities on
    x86
  x86/xen: Allow per-domain usage of hardware virtualized APIC

 docs/man/xl.cfg.5.pod.in                | 19 ++++++++++++++++
 docs/man/xl.conf.5.pod.in               | 12 ++++++++++
 tools/golang/xenlight/helpers.gen.go    | 16 +++++++++++++
 tools/golang/xenlight/types.gen.go      |  4 ++++
 tools/include/libxl.h                   | 14 ++++++++++++
 tools/libs/light/libxl.c                |  3 +++
 tools/libs/light/libxl_arch.h           |  9 ++++++--
 tools/libs/light/libxl_arm.c            | 12 ++++++++--
 tools/libs/light/libxl_create.c         | 22 ++++++++++--------
 tools/libs/light/libxl_types.idl        |  4 ++++
 tools/libs/light/libxl_x86.c            | 39 ++++++++++++++++++++++++++++++--
 tools/ocaml/libs/xc/xenctrl.ml          |  7 ++++++
 tools/ocaml/libs/xc/xenctrl.mli         |  7 ++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c     | 16 +++++++++----
 tools/xl/xl.c                           |  8 +++++++
 tools/xl/xl.h                           |  2 ++
 tools/xl/xl_info.c                      |  6 +++--
 tools/xl/xl_parse.c                     | 16 +++++++++++++
 xen/arch/x86/domain.c                   | 28 ++++++++++++++++++++++-
 xen/arch/x86/hvm/vmx/vmcs.c             | 14 ++++++++++++
 xen/arch/x86/hvm/vmx/vmx.c              | 40 +++++++++++++--------------------
 xen/arch/x86/include/asm/domain.h       |  3 +++
 xen/arch/x86/include/asm/hvm/domain.h   |  6 +++++
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  3 +++
 xen/arch/x86/sysctl.c                   |  7 ++++++
 xen/arch/x86/traps.c                    |  6 ++---
 xen/include/public/arch-x86/xen.h       |  2 ++
 xen/include/public/sysctl.h             | 11 ++++++++-
 28 files changed, 285 insertions(+), 51 deletions(-)

-- 
2.11.0


