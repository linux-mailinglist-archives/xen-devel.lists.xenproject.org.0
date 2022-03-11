Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98744D646F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 16:21:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289147.490567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSh5J-0006CP-26; Fri, 11 Mar 2022 15:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289147.490567; Fri, 11 Mar 2022 15:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSh5I-0006AS-Ul; Fri, 11 Mar 2022 15:21:40 +0000
Received: by outflank-mailman (input) for mailman id 289147;
 Fri, 11 Mar 2022 15:21:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3p0I=TW=citrix.com=prvs=06245b39f=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nSh5G-0006AM-Nc
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 15:21:38 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0d0ae16-a14e-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 16:21:37 +0100 (CET)
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
X-Inumbo-ID: f0d0ae16-a14e-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647012097;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NQe4qS5MBDdoMjjP8Wzae2ESuncqEPDVU3r+YlHB8x4=;
  b=gm9BMMn9u8X1KhEm7bqzTOGdDbWh9GCb0Vc/khwL1PNnfYEND+GI6htd
   UFTdV0d4rBvcn/cBUuh2KY7m8E3KY/EGUnB83c05qN1TPmT+aM9EoKyUa
   6Di9bk/aWZFpe//NNBND1QwtJue7FRMfaf+21gHGdalg6Ap2Gcavd0VpU
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65495651
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZM3aPq+ozGdccQ8euuRADrUD5H6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WIdUT3SOf+DZmH9fN90a4mz8h4D6MSBnYBqGQs9pH08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oHgW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnb3hZCMSEJbKpKcMCDZpK3pBAPUd/IaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKEWvHwm6DjdBPIvR53rSKTW/95Imjw3g6iiGN6AO
 pZINGQyNXwsZTV9I14SEa4zzdyzm1f8WhQI92PPn4oOtj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+ov+KaQr6AwxgfJnypKVUNQBQDTTeSFZlCWeoNyD
 3c6wSwS7rlp232TFebAB0a8mSvR1vIDYOZ4H+o/4QCL76Pb5QeFG2QJJgJ8hMwaWNweHmJzi
 ALQ9z/9LXk26eDOFyrBnluBhW7qYUAowXk+iTjopOfvy/3qu8kNgx3GVb6P+4bl34SuSVkcL
 91nxRXSZon/b+ZXhs1XHnid2lpAQ6QlqCZst207uUr/smtEiHaNPdDA1LQixa8owHylZleAp
 mMYvMOV8foDC5qA/ATUHrlTTer2uKbdaGSC6bKKI3XH3238k5JEVdoNiAyS2W8zappUEdMXS
 BO7VfxtCG97YyLxMP4fj3OZAMU216nwfekJpdiPBueilqNZLVfdlAk3PBb49zm0zCAEzPFuU
 b/GIJ3EJStLVsxaIM+eGr51PUkDnXtlmws+hPnTknya7FZpTCXMGOlfbwfWMLxRAWHtiFy9z
 uuz/vCik313ONASqAGNmWLPBTjm9UQGOK0=
IronPort-HdrOrdr: A9a23:VWSb3a1K3avTTYQsEvGGCgqjBL4kLtp133Aq2lEZdPRUGvb3qy
 nIpoV96faUskd0ZJhOo7C90cW7LU80lqQFhLX5X43SPzUO0VHAROoJgLcKqweQfREWndQ96U
 4PScdD4aXLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.90,174,1643691600"; 
   d="scan'208";a="65495651"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>
Subject: [PATCH v7 0/2] xen: Report and use hardware APIC virtualization capabilities
Date: Fri, 11 Mar 2022 15:21:05 +0000
Message-ID: <20220311152107.2918-1-jane.malalane@citrix.com>
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
 tools/xl/xl_parse.c                   | 16 ++++++++++++++
 xen/arch/x86/domain.c                 | 29 +++++++++++++++++++++++++-
 xen/arch/x86/hvm/hvm.c                |  3 +++
 xen/arch/x86/hvm/vmx/vmcs.c           | 13 ++++++++++++
 xen/arch/x86/hvm/vmx/vmx.c            | 13 ++++--------
 xen/arch/x86/include/asm/hvm/domain.h |  6 ++++++
 xen/arch/x86/include/asm/hvm/hvm.h    | 10 +++++++++
 xen/arch/x86/sysctl.c                 |  4 ++++
 xen/arch/x86/traps.c                  |  5 +++--
 xen/include/public/arch-x86/xen.h     |  2 ++
 xen/include/public/sysctl.h           | 11 +++++++++-
 28 files changed, 277 insertions(+), 34 deletions(-)

-- 
2.11.0


