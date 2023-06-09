Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC22729F90
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 18:03:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546197.852879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7eZq-0001By-IT; Fri, 09 Jun 2023 16:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546197.852879; Fri, 09 Jun 2023 16:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7eZq-00019G-FR; Fri, 09 Jun 2023 16:03:02 +0000
Received: by outflank-mailman (input) for mailman id 546197;
 Fri, 09 Jun 2023 16:03:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H16Y=B5=citrix.com=prvs=5170a5cbe=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q7eZp-00019A-Bt
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 16:03:01 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1946dc69-06df-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 18:02:58 +0200 (CEST)
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
X-Inumbo-ID: 1946dc69-06df-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686326578;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iF3Qndk4wGvJ9qBNgzhGDGpWUPBDaNlxNMhbRXEfAAI=;
  b=iffvHrI6Omw4YZDGnDtqul8aV/uWexXHdRyfiTN0qg6AMe6+nPkcjAT0
   x8hsX3BeFOmrAr5n9p+AcLnkZgi93QTEU9nUuW7W7tMdEl2J3p1grPNYv
   5jsLcH+r6feY61Ajo0Qoxc1DetpTBTpp0LzsLkpW/EOjlmT7qrn5Lrxs5
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110981565
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:N+zEXKk4txeRQShcgu7F3y/o5gyYJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeCGHTPPqOYWOnKdx/PdnloxsH6pbTmtAxSQo+rHg8RSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KyaVA8w5ARkPqgV5A6GzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fgTITNOVk/TvbuvnO6wSslBp/YuF9a+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQth/B/
 jOWpjmnX3n2MvSg7z6U32+NudXxthjXeLkzGI2T+L1l1Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4CPYm4QuAzq7V5QexBWUeSDNFLts8u6ceQD0h1
 laN2dTzFzFrmLSQRTSW8bL8kN+pEXFLdylYP3ZCFFZbpYC5++nfky4jUP5nG6e2zeWqSQup2
 mzWpygeqpQhgPUUgvDTEU/8vxqgoZ3ATwgQ7wrRX3644g4RWLNJd7BE+nCAs68ecd/xok2p+
 SFdxpPAtLxm4YSlznTlfQkbIF2+Cx9p2hX4iEUnIZQu/i/FF5WLLdEJu2EWyKuE3685ld7Vj
 Kz741k5CHpv0JyCM8dKj3qZUZhC8EQZPY2NugroRtRPeINtUwSM4TtjY0Wdt0i0zhhyy/1uY
 83GLp38ZZr/NUiA5GDvL9rxLJdxnnxurY8tbc2TI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDg5A
 P4GX/ZmPy53CbWkCgGOqN57ELz/BSRjbXwAg5ANJ7Hrz8sPMD1JNsI9Npt4I9M8xPwLzbaQl
 px/M2cBoGfCabT8AV3iQhhehHnHBP6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:29Jb+a3UQR2wXLgB0AK9FgqjBKMkLtp133Aq2lEZdPU1SKGlfq
 WV954mPHDP6Ar5J0tQ++xoVJPufZq+z/JICOsqTNSftWDd0QOVxepZjLcKrQePJ8T2zJ856Z
 td
X-Talos-CUID: 9a23:rlM4/m5LXkSvi7zjc9ss8EUdGYMdLS3nlW6Mf0S4KUtIerCuVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AP4hrGg1nqdvl27lLjqPoqkJv8zUj3IKqGW0QsKo?=
 =?us-ascii?q?8heK/GQxLGjutpzr0Tdpy?=
X-IronPort-AV: E=Sophos;i="6.00,229,1681185600"; 
   d="scan'208";a="110981565"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] CI: Add Ocaml to the alpine containers
Date: Fri, 9 Jun 2023 17:02:44 +0100
Message-ID: <20230609160244.2638438-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This gets more coverage of optional parts of the build, and makes it easier to
trial Ocaml related changes in the smoke tests.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Anthony PERARD <anthony.perard@citrix.com>

Hacked up manually to fix the Ocaml bindings for arm64:

  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/895162017

but this aspect should be done irrespective.
---
 automation/build/alpine/3.12-arm64v8.dockerfile | 2 ++
 automation/build/alpine/3.12.dockerfile         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/automation/build/alpine/3.12-arm64v8.dockerfile b/automation/build/alpine/3.12-arm64v8.dockerfile
index 3f1e6a3fc6df..1be3bf780509 100644
--- a/automation/build/alpine/3.12-arm64v8.dockerfile
+++ b/automation/build/alpine/3.12-arm64v8.dockerfile
@@ -28,6 +28,8 @@ RUN apk --no-cache add \
   make \
   musl-dev  \
   ncurses-dev \
+  ocaml \
+  ocaml-findlib \
   patch  \
   python3-dev \
   texinfo \
diff --git a/automation/build/alpine/3.12.dockerfile b/automation/build/alpine/3.12.dockerfile
index c847aa82d9e2..72ad3a07ad4a 100644
--- a/automation/build/alpine/3.12.dockerfile
+++ b/automation/build/alpine/3.12.dockerfile
@@ -30,6 +30,8 @@ RUN apk --no-cache add \
   make \
   musl-dev  \
   ncurses-dev \
+  ocaml \
+  ocaml-findlib \
   patch  \
   python3-dev \
   texinfo \

base-commit: 3a82e4501c4ec4d53b764c5b69955997b03d1137
-- 
2.30.2


