Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8926F5EF2B4
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 11:51:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413563.657281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqCk-0005En-0o; Thu, 29 Sep 2022 09:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413563.657281; Thu, 29 Sep 2022 09:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqCj-0005D0-UK; Thu, 29 Sep 2022 09:51:41 +0000
Received: by outflank-mailman (input) for mailman id 413563;
 Thu, 29 Sep 2022 09:51:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QeyO=2A=citrix.com=prvs=264849f80=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1odqCj-00052L-8G
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 09:51:41 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b461dcd-3fdc-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 11:51:33 +0200 (CEST)
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
X-Inumbo-ID: 4b461dcd-3fdc-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664445099;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TChuXwC840w9+LOr9D+E1CZ+f718cGjtfvDJ6CjciMc=;
  b=Gb0LT4/qRe8ofnfQW1Gn5WgM7B/pTI9bpA6CZZ05q08S4iOadua3Iqrg
   6aRlnQs9i5rEh5zQFMnBFf3WhjzDqB2lwC1WqUkYvqVgGbPO/Y+gEh4AA
   efieR6/+eDnGBMtDpenQkbQHcRMrTO1YuaOLgX7XgYxn+2IUdm1w3He6f
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 82031605
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ee5HTKyhI6kJdZFCdEZ6t+cExirEfRIJ4+MujC+fZmUNrF6WrkVTn
 2EdWGqHPPqNYzfwKN10YYS2oBsDscWAmoVnGgNp+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHPykYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFsMpvlDs15K6o4GJC7wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw2vRTEGRx3
 NIkECEgRT6evO+E+6ybVbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/AZQinOCulz/nfidRsl69rqsr+WnDigd21dABNfKFIITRHJsNwy50o
 ErqwG/jPAk9HuWF2GCe0GKOo7fjlgLkDdd6+LqQqacx3Qz7KnYoID0bU0Gq58awjEGWUshab
 UcT/0IGpqEo+EumZtL0RRG/rTiPuRt0c99RGO0z7EeK0LjZ5y6QA2RCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdszHuMWium
 XbQ9nF43uhNy55Qv0mmwbzZqxK+gonMcScb2j3Gc0mL8zh0VrW7R5P9vDA38s18BIqeS1CAu
 l0NlM6f8P0CAPmxqcCdfAkeNOr3vqjYaVUwlXYqRsB8rGr1pxZPaKgKuFlDyFFV3tHokNMDS
 Gvaoktv6ZBaJxNGhocnMtvqW6zGIUUNfOkJt8w4jPIUOvCdlyfdpkmCgHJ8OEiy+HXAaYllZ
 f+mnT+EVB7285hPwjusXPs62rQ23C04zm67bcmlkUj8gOLFNSfKEeZt3L6yggcRs8u5TPj9q
 Y4DZ6NmNT0GOAEBXsUn2dFKdg1bRZTKLZv3t9ZWZoa+H+aSI0l4Uqe5/F/UU9Y690ijvruXo
 yrVt44x4AaXuEAr3i3UNiE9M+q0BscXQLBSFXVEAGtEEkMLOe6HhJrzvbNtFVX73ISPFcJJc
 sQ=
IronPort-HdrOrdr: A9a23:fLl9OKMw3Ev9KMBcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3/qy
 nOpoVi6faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrJ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.93,354,1654574400"; 
   d="scan'208";a="82031605"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Henry Wang <Henry.Wang@arm.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v2] automation: Information about running containers for a different arch
Date: Thu, 29 Sep 2022 10:51:31 +0100
Message-ID: <20220929095131.61034-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220926135838.47330-1-anthony.perard@citrix.com>
References: <20220926135838.47330-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Adding pointer to 'qemu-user-static'.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - reword to point out that it's an x86 thing

 automation/build/README.md | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/automation/build/README.md b/automation/build/README.md
index 00305eed03..4cc1acb6b4 100644
--- a/automation/build/README.md
+++ b/automation/build/README.md
@@ -102,3 +102,16 @@ make -C automation/build suse/opensuse-tumbleweed PUSH=1
 
 [registry]: https://gitlab.com/xen-project/xen/container_registry
 [registry help]: https://gitlab.com/help/user/project/container_registry
+
+
+Building/Running container for a different architecture
+-------------------------------------------------------
+
+On a x86 host, it is possible to build and run containers for other arch (like
+running a container made for Arm) with docker taking care of running the
+appropriate software to emulate that arch. For this, simply install the package
+`qemu-user-static`, and that's it. Then you can start an Arm container on x86
+host like you would start an x86 container.
+
+If that doesn't work, you might find some information on
+[multiarch/qemu-user-static](https://github.com/multiarch/qemu-user-static).
-- 
Anthony PERARD


