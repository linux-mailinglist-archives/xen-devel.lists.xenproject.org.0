Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B016A5E5A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 18:40:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503617.775931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX3xO-0006kO-Cb; Tue, 28 Feb 2023 17:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503617.775931; Tue, 28 Feb 2023 17:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX3xO-0006hf-9N; Tue, 28 Feb 2023 17:40:06 +0000
Received: by outflank-mailman (input) for mailman id 503617;
 Tue, 28 Feb 2023 17:40:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WuWh=6Y=citrix.com=prvs=4168872ba=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1pX3xN-0006WI-A2
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 17:40:05 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec0694bf-b78e-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 18:40:01 +0100 (CET)
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
X-Inumbo-ID: ec0694bf-b78e-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677606001;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=g4W4W/7oBB6pzfZ5TSnKR3UMeS8LA7gAF0KFTPw8wP0=;
  b=bK835yw6W4ueUsCBBTER/5PcyV5U04EXsYCjuxbd1wOhYDaKrR5cVSUe
   /OjTmllB6uaxKXJa+yLhGe/PgaX8ASQ/EcY1MhsUCEIxoTHXPm1+BiLGP
   szigVgvvSZcz9Y9+V6c1SDTVnlE4CySvxCqxNZMYkzg29NlkB9rZxFNze
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101312542
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:fF1e36uPJCdC9QI5TEwoMPJw3ufnVJheMUV32f8akzHdYApBsoF/q
 tZmKWHXO/iLNmX3e9xxPtuwoEkPvpDRx4IyTgE5rSA9FXsR+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5AWExyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBRMxPkGBruKP+42SU8Vtr8MofNLiM9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WyZVsl2YtOw78mHIyA1Z27nxKtvFPNeNQK25m27B/
 judpj6kXkty2Nq3w2S/6kqnuM71ugzZcac2Jaa07PBQuQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+8w5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9/vrCiZoq6a9Um+G+/GfqjbaESoIKW4PYwcUQA1D5MPsyKkolQ7GRNtnFK+zj/X2FCv2z
 jTMqzIx74j/luZSif/9pwqexWvx+N6QFFVdChjrsnyNwyBFNN+nToyR0mfy9NpBBYGSHkKIs
 y1R8ySB19wmAZaInS2LZewCGrC1+vqIWAHhbU5T84oJrGr0pSP6FWxEyHQnfRoybJ5YEdP8S
 BWL0T698qO/K5dDgUVfR4uqQ/onwqH7fTgOfqCFN4EeCnSdmeLuwc2PWaJy9zqw+KTPuftlU
 Xt+TSpLJSdyNEif5GDqL9rxKJdyrszE+UvdRIrg0zOs2qeEaXieRN8taQXRMb1jtvLc/FSJo
 r6z0vdmLD0FDYXDjtT/q9ZPfTjm01BgbXwJlyCnXrHaeVc3cI3QI/TQ3akga+RYc1d9z4/1E
 oWGchYAkjLX3CSXQThmn1g/MNsDq74j9yNkVcHtVH70s0UejXGHt/9PJsZnLOJ8q4SOD5dcF
 pE4RilJOdwXIhyvxtjXRcOVQFBKHPhzuT+zAg==
IronPort-HdrOrdr: A9a23:NGTD86FHnrBz6M0NpLqEFceALOsnbusQ8zAXPhZKOHhom62j+/
 xG88536faZskdpZJhko6HnBEDiexzhHPxOkOws1OyZLWrbUQKTRelfBMnZowEIfReOlNK1+p
 0QC5SWY+eAamSS4/yR3CCIV/48xdGc6qChgqP7x3dpCSVncbtp4Qs8KgvzKCNLbTgDLYc9HI
 CH5sJB4x6peXFSU9+yAWMMVfXCodqOtJ+OW3877k4cgzWzsQ==
X-IronPort-AV: E=Sophos;i="5.98,222,1673931600"; 
   d="scan'208";a="101312542"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v2 0/3] xen-ucode: print information about currently loaded ucode
Date: Tue, 28 Feb 2023 17:39:29 +0000
Message-ID: <20230228173932.28510-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

I've split the patch into 3 parts. And now I'm using xenhypfs instead of
introducing another platform op. That's my first attempt at xenhypfs and
the patch itself is of RFC quality. Open questions are where to put the
new code and if it's possible to come up with a better hypfs functions.

Sergey Dyasli (3):
  xen/hypfs: add initial cpuinfo directory
  tools/xenctrl: add xc_get_cpu_version()
  tools/xen-ucode: print information about currently loaded ucode

 tools/include/xenctrl.h   |  1 +
 tools/libs/ctrl/xc_misc.c | 20 ++++++++
 tools/misc/Makefile       |  2 +-
 tools/misc/xen-ucode.c    | 97 +++++++++++++++++++++++++++++++++++++++
 xen/arch/x86/cpu/common.c | 58 +++++++++++++++++++++++
 5 files changed, 177 insertions(+), 1 deletion(-)

-- 
2.17.1


