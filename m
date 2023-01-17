Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCB866DF89
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 14:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479419.743251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmPj-0000It-GK; Tue, 17 Jan 2023 13:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479419.743251; Tue, 17 Jan 2023 13:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmPj-0000Gf-Db; Tue, 17 Jan 2023 13:54:11 +0000
Received: by outflank-mailman (input) for mailman id 479419;
 Tue, 17 Jan 2023 13:54:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kjsf=5O=citrix.com=prvs=374a1453b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHmPh-0000F6-HX
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 13:54:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65531a99-966e-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 14:54:02 +0100 (CET)
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
X-Inumbo-ID: 65531a99-966e-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673963646;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=Abp/N1+vD7yY6WtrVffgBelI/6bXRwma3RvGpevqz/w=;
  b=a3gG9h+bTykBA/hyOlpefWDDylQNZN/fuQ9WmP2NYrm+meLieLm2qHiV
   KKtW8PCZYY8rqP0Gf1BQOmOJ43YwbnnhFNXGXK9JyTHkC0vZGzOk03YGd
   ldZZTKYSiAnP1uMkG69cWn2kKizhVRjK5Wkx7x8kr5m7ZzohZLjIrviis
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91898367
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:8B7uzKl3cj3f72PL9bHe12vo5gyKJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdXWnVO66NZGOgKo0kaou+80gDvpSDm9JgHgs9qS4yQyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgS5QCGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eYDKhRdSDCtvLKnnLKaUtNpqtslCda+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQthfB9
 jOWpDqmav0cHNaBigK+zFuDvfLCvwbGBoJDROGCseE/1TV/wURMUUZLBDNXu8KRlUqWS99Zb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6VD3YJZiRMY9snsIkxXzNC/
 l2GhdTyHhR0raaYD3ma89+pQSiaYHZPazVYPGldEFVDuoO4yG0usv7RZsx4EorlqP3bImHhn
 zCrtBI7q6oVqNFegs1X4mv7byKQSonhF1BqvVSNBDr6vmuVd6b+OdX2tAGzAeJoad/AEwLf5
 CVsd922trhmMH2bqMCarAzh9pmN7u3NDjDTiEUH83IJp2X0oC7LkWy9DVhDyKZV3iUsI2WBj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMcqJF7bpHE/PB/Lt4wIrKTLufhvU
 ap3jO72VSpKYUiZ5GfeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9cWGZimtsRtfveyC2Mq
 oY3Cid/40kHOAEISnWNoNF7wJFjBSRTOK0aXOQMJ77TeFQ4Rjt/YxITqJt4E7FYc21uvr+g1
 hmAtoVwlAGXaaHvQelSVk1eVQ==
IronPort-HdrOrdr: A9a23:WLSF3KuaLYtDUuyFyHZYY2XD7skDsNV00zEX/kB9WHVpm6yj+v
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBO3ZogEIcxeUygc379
 YDT0ERMr3N5VgRt7eG3CCIV+wO7fPC2pqO7N2uqEuET2tRGt1dB9ESMHflLqV0LjM2e6bQDP
 Cnl6x6T6LLQwVsUiy8bEN1JtQq97Xw5erbiQdtPW9d1DWz
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="91898367"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH 0/6] tools: Switch to non-truncating XENVER_* ops
Date: Tue, 17 Jan 2023 13:53:30 +0000
Message-ID: <20230117135336.11662-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

This is the tools side of the Xen series posted previously.

With this, a Xen built with long strings can be retrieved:

  # xl info
  ...
  xen_version            : 4.18-unstable+REALLY LONG EXTRAVERSION
  xen_changeset          : Tue Jan 3 19:27:17 2023 git:52d2da6c0544+REALLY SUPER DUPER EXTRA MEGA LONG CHANGESET
  ...


Andrew Cooper (6):
  tools/libxc: Move xc_version() out of xc_private.c into its own file
  tools: Introduce a non-truncating xc_xenver_extraversion()
  tools: Introduce a non-truncating xc_xenver_capabilities()
  tools: Introduce a non-truncating xc_xenver_changeset()
  tools: Introduce a non-truncating xc_xenver_cmdline()
  tools: Introduce a xc_xenver_buildid() wrapper

 tools/include/xenctrl.h             |  10 ++
 tools/libs/ctrl/Makefile.common     |   1 +
 tools/libs/ctrl/xc_private.c        |  66 ------------
 tools/libs/ctrl/xc_private.h        |   7 --
 tools/libs/ctrl/xc_version.c        | 206 ++++++++++++++++++++++++++++++++++++
 tools/libs/light/libxl.c            |  61 +----------
 tools/ocaml/libs/xc/xenctrl_stubs.c |  45 +++++---
 7 files changed, 250 insertions(+), 146 deletions(-)
 create mode 100644 tools/libs/ctrl/xc_version.c

-- 
2.11.0


