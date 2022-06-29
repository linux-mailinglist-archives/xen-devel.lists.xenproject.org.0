Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0170B5601C7
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 15:57:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357867.586713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6YBW-0005sk-U3; Wed, 29 Jun 2022 13:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357867.586713; Wed, 29 Jun 2022 13:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6YBW-0005qx-R6; Wed, 29 Jun 2022 13:56:50 +0000
Received: by outflank-mailman (input) for mailman id 357867;
 Wed, 29 Jun 2022 13:56:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gFtW=XE=citrix.com=prvs=17228c8f8=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1o6YBV-0005qp-CG
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 13:56:49 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fda81d5-f7b3-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 15:56:46 +0200 (CEST)
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
X-Inumbo-ID: 4fda81d5-f7b3-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656511006;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aenH0fD8UqySU1/PrIlq9KObEtNkts4LZGVHnoFy7D0=;
  b=Nv+/ciWBUlXMI1VJ+2vAX9T12wPwB3S32VUt4drNHpaIytBy9miV6+3a
   QEFZ0iWfPSubMyve7uXyg6UbsqG+tJT4xfLgwVBgu2F915dDoy+bLaufw
   C4UdwcmIuZscVIraB2r9zh37qPexBVGZDO0fJhNMZ2IosFzzKMo60Sdpf
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74715955
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Pfb6u6864Zi+E2EIzk6wDrUDPn+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mEWCGzQbPuKN2D2c9h0aoi2pkIG75CEztE3HlZrrSE8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ74f5fs7Rh2NQw34LoW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZa0eQlqJbLNo8tHazsDEg1XIasa8paSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKEWvHwm6DjdBPIvR53rSKTW/95Imjw3g6iiGN6BO
 5VANGsyMXwsZTVzKHIuBdVnt96xrUGucRtciVeyn7c4tj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+ov+KaQr6AwxgfJnypKVUNQBQDTTeSFZlCWUdZvJ
 Q8P5SsVgvIK1heqYvDhWUGyiSvR1vIDYOa8A9HW+SnUlPeKuFbBWTRcJtJSQId47ZFrHFTGw
 nfMxoq0XmI37dV5XFrHrt+pQSWO1T/5xIPoTQsNVkM77tbqu+nfZTqfH484QMZZYjAYcAwcI
 gxmTwBk3t3/deZRi82GEanv2lpAXKThQA8v/RnwVWm49A5/b4PNT9X2tAaHsa8Zct3JEwXpU
 J04dy62tbFm4XalxESwrBglRun1t55pzhWG6bKQI3XR32v0oCPyFWyhyDp/OF1oIq45RNMdW
 2eK4Vk5zMYKZBOCNPYrC6rsWp9C5fWxSrzYugX8M4Mmjm5ZL1fXokmDpCe4ggjQraTbufthY
 8fALJz8UCZy5GYO5GPeetrxGIQDnkgWrV4/j7ihlHxLDZL2iKapdIo4
IronPort-HdrOrdr: A9a23:xngPe6wJQZAVgN3regZqKrPwIr1zdoMgy1knxilNoRw8SK2lfq
 eV7ZImPH7P+VEssR4b6LO90cW7Lk80lqQFhbX5X43SPjUO0VHAROoJgOffKlXbalTDH4VmtZ
 uIHZIRNDSJNykesfrH
X-IronPort-AV: E=Sophos;i="5.92,231,1650945600"; 
   d="scan'208";a="74715955"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>
Subject: [PATCH RESEND v10 0/2] xen: Report and use hardware APIC virtualization capabilities
Date: Wed, 29 Jun 2022 14:55:32 +0100
Message-ID: <20220629135534.19923-1-jane.malalane@citrix.com>
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


