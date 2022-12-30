Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE1B6593E0
	for <lists+xen-devel@lfdr.de>; Fri, 30 Dec 2022 01:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469762.729177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pB3QL-0002vK-8y; Fri, 30 Dec 2022 00:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469762.729177; Fri, 30 Dec 2022 00:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pB3QL-0002t6-64; Fri, 30 Dec 2022 00:39:01 +0000
Received: by outflank-mailman (input) for mailman id 469762;
 Fri, 30 Dec 2022 00:38:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dJX=44=citrix.com=prvs=35664f79d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pB3QJ-0002si-Rc
 for xen-devel@lists.xenproject.org; Fri, 30 Dec 2022 00:38:59 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 562ad4f8-87da-11ed-91b6-6bf2151ebd3b;
 Fri, 30 Dec 2022 01:38:56 +0100 (CET)
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
X-Inumbo-ID: 562ad4f8-87da-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672360736;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=pkxRRRetPio8a77CxP8/YrVtKJVztJ6HmHdZ5d/IS/Q=;
  b=FtfToC06rLDoJ07FxqMsLU0QfVX3r73hzqnU8HT8iML04Zy3BhfyGog6
   O8MsoEgtG63lDfflAvC7RaL8T+UZOGXbvvTGvS2v616mZAS7XzXIbJjzV
   sjPs4bcuA3PUXyBoJKyCwL4u0pRNcnKhxZl6kD2wujwdHfB8j9eGxin0A
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90529778
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ewpw8q7/6mMJ3CvY8I1j4gxRtPXHchMFZxGqfqrLsTDasY5as4F+v
 jEbCj+BPfbeZWT3f9AjbYTg8B8BsJ+Bn99lQQRu/C0wHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKoR7QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mq
 fYcMRUAPyG4peO1+q++b8c9npV8I5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0ExhvC9
 z2ZrwwVBDkZFPqVlX3a/Eie2LfynBvEeYQzGpmRo6sCbFq7mTVIVUx+uUGAify4gU63X5RYM
 V4Z/gInqKR0/0uuJvH6WxC7u3+F+B0BQd1bE+49wA6Iw6vQpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRu5MDIZKmIqbiYeQQwIpdLkpekblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN0uYdUjjvvhuwqd2nT1+8aPHlVdChjrsnyNsgl9fauoNr2Ty1nY1+tFCajIVgjes
 y1R8ySB19wmAZaInS2LZewCGrC1+vqIWAHhbU5T84oJrGr0pSP6FWxEyHQnfRoybJ5YEdP8S
 BWL0T698qO/K5dDgUVfR4uqQ/onwqH7fTgOfqCFN4EeCnSdmeLuwc2PWaJy9zq2+KTPuftlU
 Xt+TSpLJShyNEif5GDqL9rxKJdyrszE+UvdRIrg0zOs2qeEaXieRN8taQXRNLtivPPa8V+Eq
 L6z0vdmLD0GCoXDjtT/q9ZPfTjm01BgbXwJlyCnXrHaeVc3cI3QI/TQ3akga+RYokihrc+Rp
 ivVchYBmDLCaYjvdV3ihoZLNOm+Av6SbBsTYUQRALpf8yJyPNvxvf9PLPPav9APrYRe8BK9d
 NFdE+3oPxiFYm2vF+g1BXUlkLFfSQ==
IronPort-HdrOrdr: A9a23:OJjypK6DBsyy4wSKKAPXwMbXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssRMb+exoSZPgfZq0z/cci+Qs1NyZLWrbUQWTXeRfxLqn7zr8GzDvss5xvJ
 0QF5SW0eeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.96,285,1665460800"; 
   d="scan'208";a="90529778"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 0/6] CI: Fixes/cleanup in preparation for RISCV
Date: Fri, 30 Dec 2022 00:38:42 +0000
Message-ID: <20221230003848.3241-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

This series is intended to avoid the need for any editing of
automation/scripts/build in the main RISCV series.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/734584203
https://gitlab.com/xen-project/people/andyhhp/xen/-/commits/auto-build

The two Ubuntu Bionic failures are known and preexisting.

Andrew Cooper (6):
  CI: Drop automation/configs/
  CI: Remove guesswork about which artefacts to preserve
  CI: Only calculate ./configure args if needed
  CI: Express HYPERVISOR_ONLY in build.yml
  CI: Fix build script when CROSS_COMPILE is in use
  CI: Simplify the MUSL check

 automation/configs/x86/hvm_only_config  |   3 -
 automation/configs/x86/no_hvm_pv_config |   3 -
 automation/configs/x86/pv_only_config   |   3 -
 automation/gitlab-ci/build.yaml         |   2 +
 automation/scripts/build                | 127 ++++++++++++++------------------
 5 files changed, 59 insertions(+), 79 deletions(-)
 delete mode 100644 automation/configs/x86/hvm_only_config
 delete mode 100644 automation/configs/x86/no_hvm_pv_config
 delete mode 100644 automation/configs/x86/pv_only_config

-- 
2.11.0


