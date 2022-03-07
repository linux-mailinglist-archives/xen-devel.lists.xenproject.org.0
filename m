Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7118C4D026C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 16:06:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286167.485573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREwL-0003QS-SB; Mon, 07 Mar 2022 15:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286167.485573; Mon, 07 Mar 2022 15:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREwL-0003OU-OS; Mon, 07 Mar 2022 15:06:25 +0000
Received: by outflank-mailman (input) for mailman id 286167;
 Mon, 07 Mar 2022 15:06:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NixE=TS=citrix.com=prvs=05809d0ec=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nREwK-0002xD-Ga
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 15:06:24 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26508988-9e28-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 16:06:23 +0100 (CET)
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
X-Inumbo-ID: 26508988-9e28-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646665583;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iwyxUg1jLsfl7bKz9mfciR2QE1g4jrUE9CZvlOdbhmk=;
  b=Dpby/gRa84vPef62dtnAcs4PHyJYnZn47qa0Dwb23Fr1tamigTf0iJfP
   V37ZRIdRmMB5TBfQ5m15oInpvPKtCdwk//p9siDPH3rxrWNAWq4CjeGl2
   JxYTtkDHhHidWStrssCO1PAqRHyz62rY3WKRKVKBQH3gPubbzXA0xmw96
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65628148
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:e+TplaJNXRE9rSC9FE+RgZUlxSXFcZb7ZxGr2PjKsXjdYENS0zMEm
 GpNCjuGa/qMZGH1L9t3PNyz900Bv5fdnNQyGgJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2dY32YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MdHmMeQFh4oBa3dm/YRYQNfUCpiF6ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBOviOo5Zn3hkxDXQC/sOSpHfWaTao9Rf2V/cg+gQQKiEN
 5NFOVKDajzAeDNqH0oTEa4Hjb6SiXnyQhl3mQ2K8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvGtJk6TePisKQw2RvKmzJVWEZ+uUaHTeeRmESTAPIAM
 k0v+jstv6QA7kvoRcXXUEjtyJKbhSI0V91VGuw8zQiCzKvI/gqUblQ5oi59hM8O75FvG2Fzv
 rOdt5awXGE07uXJIZ6I3urM9VuP1T4pwXjujMPuZS8M+JHdrY46lXojpf4zQffu3rUZ9dwdq
 g1mTRTSZZ1O16bnNI3hpDgrZg5AQbCTEmYICv3/BD7N0++ATNfNi3aUwVba9+1cC42SU0OMu
 nMJ8+DHsrxQUMDTzHPWELVRdF1M2xpiGGeA6WOD4rF7r2j9k5JdVdo4DM5CyLdBbZ9fJG6Bj
 L77sgJN/p5DVEZGnocsC79d//8ClPC6ffy8D6i8RoMXPvBZKV/WlAkzNBX49z28zyARfVQXZ
 M7znTCEVi1BV8yKDVOeGo8g7FPc7ntmlDOLGMuilEzPPHj3TCf9dIrp+WCmNogRhJ5oai2Pm
 zqDH6NmEylibdA=
IronPort-HdrOrdr: A9a23:ArMoo6swAG11NHKukfvTflzP7skDX9V00zEX/kB9WHVpm5qj5r
 iTdZMgpHvJYVcqKRQdcbLpAsO9qBbnmKKdjrN8AV7PZmbbUQiTXeNfBOnZowEIQBeOj9K1vJ
 0IG8ND4bvLY2SS5vyKgzVQfexA/DEpmprY/ts3Yx1WPGZXgwAL1XYeNjqm
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="65628148"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>
Subject: [PATCH v5 0/2] xen: Report and use hardware APIC virtualization capabilities
Date: Mon, 7 Mar 2022 15:06:07 +0000
Message-ID: <20220307150609.10662-1-jane.malalane@citrix.com>
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
 tools/golang/xenlight/helpers.gen.go    | 16 ++++++++++++++
 tools/golang/xenlight/types.gen.go      |  4 ++++
 tools/include/libxl.h                   | 14 ++++++++++++
 tools/libs/light/libxl.c                |  3 +++
 tools/libs/light/libxl_arch.h           |  9 ++++++--
 tools/libs/light/libxl_arm.c            | 12 ++++++++--
 tools/libs/light/libxl_create.c         | 22 +++++++++++--------
 tools/libs/light/libxl_types.idl        |  4 ++++
 tools/libs/light/libxl_x86.c            | 39 +++++++++++++++++++++++++++++++--
 tools/ocaml/libs/xc/xenctrl.ml          |  7 ++++++
 tools/ocaml/libs/xc/xenctrl.mli         |  7 ++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c     | 16 ++++++++++----
 tools/xl/xl.c                           |  8 +++++++
 tools/xl/xl.h                           |  2 ++
 tools/xl/xl_info.c                      |  6 +++--
 tools/xl/xl_parse.c                     | 16 ++++++++++++++
 xen/arch/x86/domain.c                   | 28 ++++++++++++++++++++++-
 xen/arch/x86/hvm/vmx/vmcs.c             | 13 +++++++++++
 xen/arch/x86/hvm/vmx/vmx.c              | 13 ++++-------
 xen/arch/x86/include/asm/domain.h       |  3 +++
 xen/arch/x86/include/asm/hvm/domain.h   |  6 +++++
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  3 +++
 xen/arch/x86/sysctl.c                   |  7 ++++++
 xen/arch/x86/traps.c                    |  9 ++++----
 xen/include/public/arch-x86/xen.h       |  2 ++
 xen/include/public/sysctl.h             | 11 +++++++++-
 28 files changed, 275 insertions(+), 36 deletions(-)

-- 
2.11.0


