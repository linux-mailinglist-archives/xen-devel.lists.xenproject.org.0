Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEE3836F8B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 19:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670053.1042644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRyrS-0002hd-Uf; Mon, 22 Jan 2024 18:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670053.1042644; Mon, 22 Jan 2024 18:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRyrS-0002gE-Rg; Mon, 22 Jan 2024 18:17:30 +0000
Received: by outflank-mailman (input) for mailman id 670053;
 Mon, 22 Jan 2024 18:17:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EdLN=JA=citrix.com=prvs=74474809d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rRyrR-0002ee-IW
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 18:17:29 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f6d6917-b952-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 19:17:28 +0100 (CET)
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
X-Inumbo-ID: 7f6d6917-b952-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1705947448;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UOoglNsFMfZVcHPwpDLLBcSo2RQx5ClWaZKuA5F9ss8=;
  b=S4UQWbos//390ObDMIBlrX5rMP2WhEp8W90O8swoU1ogx4qPdKq6UnPw
   DtJOsyyBfyHzeyg2wqGa7HVGjRCjMxlErIU+ZlUKG9k5f+lbUaG1HrlHh
   GxXoB8YmIZ0Ttih8kG3Uu0b0x/sIwUUYhQxIXn2IIYivpBvr6Q49lgMna
   Q=;
X-CSE-ConnectionGUID: FCbAE902SjqaC0PT4u4YkQ==
X-CSE-MsgGUID: 5wRHdVzFSXuDO5oZp51RKg==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 132366779
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:POnXvqtb9QdNhken1SwIdkxotufnVAteMUV32f8akzHdYApBsoF/q
 tZmKWqBOP6PZGvyeNlwbY+19x4EupGAmoAyHAA+qigwQSoS+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq5Vv0gnRkPaoX5AaEziFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBhsHRz3S37iNwquyYbFUupg+cPjoBdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkAefAhPYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 TidoTqmXUBy2Nq3lCW/0n6SlMH0rT7Xf98VJqXlr8RJjwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9/vqAjp1ubHTVnOZ9Z+Ttzq5PSVTJmgHDRLoViNcvYOl+ttqyEuSH5A8SMZZk+EZBxne6
 DqjgXlm3Y4RlMcgj52HoU2bsjGV882hohEO2unHYo60xlomPNP0Pdz2sQWz0BpWEGqOorC8U
 Jk4dyu2trlm4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJv2kjdBkzaJZaIWO5C
 KM2he+2zMYNVEZGkIctO97hYyjU5faI+SvZugD8MYMVP8kZmP6v9yByf0+At13QfLwXufhnY
 /+zKJ/8ZUv2/Iw7lFJasc9Bi+50rs3/rEuPLa3GI+OPjeLDOSPPGOZbWLZMB8hghJ65TMzu2
 443H6O3J993CYUSvgG/HVYvEG03
IronPort-HdrOrdr: A9a23:hCmENaA7gOuK5PnlHemg55DYdb4zR+YMi2TC1yhKJyC9Ffbo8P
 xG/c5rsSMc5wxwZJhNo7y90cq7MBbhHPxOkOos1N6ZNWGM0gaVxelZnO3fKlbbehEWmNQz6U
 4ZSdkdNOHN
X-Talos-CUID: =?us-ascii?q?9a23=3A40l/OWslj6GeWXlJoJBB2G1J6IsLWXf04SaIeXS?=
 =?us-ascii?q?6EG9CEIWpFULMyaBdxp8=3D?=
X-Talos-MUID: 9a23:TIh+OAZ//GW3ZeBT6iDWpD1cJulT07mCLx0Ko41b4vOnOnkl
X-IronPort-AV: E=Sophos;i="6.05,211,1701147600"; 
   d="scan'208";a="132366779"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 0/3] x86/entry: ELF fixes and improvments
Date: Mon, 22 Jan 2024 18:17:10 +0000
Message-ID: <20240122181714.1543738-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Patch 1 is a bugfix.  Patches 2 and 3 are to improve livepatchability.

Andrew Cooper (3):
  x86/entry: Fix ELF metadata for NMI and handle_ist_exception
  x86/entry: Make #PF/NMI/INT0x82 more amenable to livepatching
  x86/entry: Make intra-funciton symbols properly local

 xen/arch/x86/x86_64/compat/entry.S | 21 ++++++++++----------
 xen/arch/x86/x86_64/entry.S        | 31 +++++++++++++++++-------------
 2 files changed, 29 insertions(+), 23 deletions(-)


base-commit: 4900c939cb9b876c51cfc7a4c854f54c722a30b5
-- 
2.30.2


