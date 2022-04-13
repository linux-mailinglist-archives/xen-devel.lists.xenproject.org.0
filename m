Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C314FF59D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 13:22:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304072.518605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neb4V-0005tX-4n; Wed, 13 Apr 2022 11:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304072.518605; Wed, 13 Apr 2022 11:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neb4V-0005ql-1x; Wed, 13 Apr 2022 11:22:03 +0000
Received: by outflank-mailman (input) for mailman id 304072;
 Wed, 13 Apr 2022 11:22:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aOZT=UX=citrix.com=prvs=09565da51=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1neb4T-0005qf-OU
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 11:22:01 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee85e154-bb1b-11ec-a405-831a346695d4;
 Wed, 13 Apr 2022 13:22:00 +0200 (CEST)
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
X-Inumbo-ID: ee85e154-bb1b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649848919;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aenH0fD8UqySU1/PrIlq9KObEtNkts4LZGVHnoFy7D0=;
  b=XmqLQQRCDC4gCiDhx2uKGFG8VDDg9XFQmHNas05wpYlGzTWIMDkb80K+
   JJPALSe4/whWkmarrkmb8J7nWppzyLNZ/6n/T4vrsd46ivVTPOshKFpLI
   MHWgXoHkES4fseG3u2DRzpTQvTQ9JObvpKAweR4wMEZDzMQOqOJxs8R59
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68194872
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SXScTKN/qDaByU3vrR3Al8FynXyQoLVcMsEvi/4bfWQNrUpz32QBy
 zZMW2vXaKzcazSmKIgiadvj/U0H68XTy99kHQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl29Uw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z9
 JJHjYDrcjcSZpbUsfosChhYCBxkBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALDsDtMcU6s3VpyTjfAN4tQIzZQrWM7thdtNs1rp4eRKeCN
 5VDAdZpRAbkZUx9A1ERNLAvmPyzplTUcnp6j13A8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9R4XQ6pLSuf+rKQzxgTOmCpDU3X6SGdXv9GFzUSGR4lkG
 3dMwTIHs5lr9Uywc8PECkjQTGG/gjYQXN9ZEusf4Q6Ly7bJ7wvxOlXoXgKte/R96pZoGGVCO
 kuh2oqwWGcx6OH9pWe1rO/8kN+kBcQCwYbujwcgRBBN3dTsqZpbYvnnHoc6S/7dYjEY9FjNL
 9G2QMoW2u17YS0jjfzTEbX7b9SE/MmhoukdvFu/Y45dxlklDLNJnqTxgbQh0d5OLZyCUn6Kt
 2Uels6V4YgmVM/RxXzXGLxTQOryup5p1QEwZ3Y1TvHNEBz3pRaekX14umkidC+FzO5ZEdMWX
 KMjkVwIv8ICVJdbRaR2f5iwG6wXIVvITrzYugTvRoMWOPBZLVbflAk3PBL49z29wSAEzPBkU
 b/GIJnEMJrvIfk+pNZAb7xGiuFDK+FX7T67eK0XODz+iOTFNS/JE+pdWLZMB8hghJ65TMzu2
 443H6O3J993C4USvgG/HVYvEG03
IronPort-HdrOrdr: A9a23:WyvAwKAjlzFvhSHlHemg55DYdb4zR+YMi2TC1yhKJyC9Ffbo8P
 xG/c5rsSMc5wxwZJhNo7y90cq7MBbhHPxOkOos1N6ZNWGM0gaVxelZnO3fKlbbehEWmNQz6U
 4ZSdkdNOHN
X-IronPort-AV: E=Sophos;i="5.90,256,1643691600"; 
   d="scan'208";a="68194872"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>
Subject: [PATCH v10 0/2] xen: Report and use hardware APIC virtualization capabilities
Date: Wed, 13 Apr 2022 12:21:09 +0100
Message-ID: <20220413112111.30675-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Jane Malalane (2):
  xen+tools: Report Interrupt Controller Virtualization capabilities on
    x86
  x86/xen: Allow per-domain usage of hardware virtualized APIC

 docs/man/xl.cfg.5.pod.in              | 15 ++++++++++++++
 docs/man/xl.conf.5.pod.in             | 12 +++++++++++
 tools/golang/xenlight/helpers.gen.go  | 16 ++++++++++++++
 tools/golang/xenlight/types.gen.go    |  4 ++++
 tools/include/libxl.h                 | 14 +++++++++++++
 tools/libs/light/libxl.c              |  3 +++
 tools/libs/light/libxl_arch.h         |  9 ++++++--
 tools/libs/light/libxl_arm.c          | 14 ++++++++++---
 tools/libs/light/libxl_create.c       | 22 ++++++++++++--------
 tools/libs/light/libxl_types.idl      |  4 ++++
 tools/libs/light/libxl_x86.c          | 39 +++++++++++++++++++++++++++++++++--
 tools/ocaml/libs/xc/xenctrl.ml        |  7 +++++++
 tools/ocaml/libs/xc/xenctrl.mli       |  7 +++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c   | 17 ++++++++++++---
 tools/xl/xl.c                         |  8 +++++++
 tools/xl/xl.h                         |  2 ++
 tools/xl/xl_info.c                    |  6 ++++--
 tools/xl/xl_parse.c                   | 19 +++++++++++++++++
 xen/arch/x86/domain.c                 | 29 +++++++++++++++++++++++++-
 xen/arch/x86/hvm/hvm.c                |  3 +++
 xen/arch/x86/hvm/vmx/vmcs.c           | 11 ++++++++++
 xen/arch/x86/hvm/vmx/vmx.c            | 13 ++++--------
 xen/arch/x86/include/asm/hvm/domain.h |  6 ++++++
 xen/arch/x86/include/asm/hvm/hvm.h    | 10 +++++++++
 xen/arch/x86/sysctl.c                 |  4 ++++
 xen/arch/x86/traps.c                  |  5 +++--
 xen/include/public/arch-x86/xen.h     |  5 +++++
 xen/include/public/sysctl.h           | 11 +++++++++-
 28 files changed, 281 insertions(+), 34 deletions(-)

-- 
2.11.0


