Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5879722910
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 16:44:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543740.848968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6BQt-0005Uk-4R; Mon, 05 Jun 2023 14:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543740.848968; Mon, 05 Jun 2023 14:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6BQt-0005SU-1P; Mon, 05 Jun 2023 14:43:43 +0000
Received: by outflank-mailman (input) for mailman id 543740;
 Mon, 05 Jun 2023 14:43:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wlJc=BZ=citrix.com=prvs=5133c6164=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q6BQr-0005DU-4z
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 14:43:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bddc795-03af-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 16:43:39 +0200 (CEST)
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
X-Inumbo-ID: 5bddc795-03af-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685976219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jGBoLlQik/DdUsmblsNJ1iLT3fecu+Jt0ccxIilExLg=;
  b=JXSp2pvlJIgbLamxHtaENRUvs+Y9qnptAa/IyubpEgzF0LpEaGt3LfUG
   WpUpIc92BBWHOONW+kJPn7zILfiXss1BJWPlaqvJksoASDisSlOjlEL5o
   pAJZnva4lY4WAUTtpKoyKlg4A7ZnSME+qs9Vjd9WVd5kEe1EmJTIMNHH6
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111652720
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:6ihxxKP22eyT3jjvrR1Nl8FynXyQoLVcMsEvi/4bfWQNrUoggT0Cm
 2BLD26OaPrfMDGmc9h0b9638kMEsZWGzN5nHgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5gBmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uxzXGBy+
 7tbEQ8EUyysosuI5eKcSsA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXTHJsIxBnC/
 goq+Uz+WU5GMdO58QGDsWK3gN6S2i/cXrArQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxaspQUAUtBdF+k77gClyafO5QudQG8eQVZpasEitcIwbSwn0
 BmOhdyBLQJotLqZWHeM7IC+pDm5OTUWBWIabCpCRgwAi/HprZsvlBvJQpBmGbSsk9zuMTjqx
 naBqy1Wr7cei9VNyKS4+VnBjz+2jpzISAcv4UPQRG3N0+9iTNf7PcryswGdtKseat/DFTFto
 UToheCU6L0PMZ/K1xWySdgxM5SA2dPVFz311AsH84Yayxyh/HuqfIZ16T54JVt0PstsRQIFc
 HM/qisKusYNYSLCgbtfJtvoVp90lfSI+cHNDKi8UzZYXnRmmOZrFglKbFXY4W3imVNEfUoXa
 cbCKpbE4Zr35M1aINuKqwU1i+RDKsMWnzm7qXXHI/OPj9KjiIa9E+ttDbd3RrlRAFm4iAvU6
 c1DEMCB1g9SVubzCgGOr95OfAhRcChnW8+owyCySgJkClA/cFzN9teLme9xE2Cbt/o9ehj0E
 oGVBRYDlQuXaYzvIgSWcHFzAI4Drr4mxU/XyRcEZA7ys1B6ONbH0UvqX8dvFVXR3LA5nKEco
 jhsU5noP8mjvRyep2xEPcil8N07HPlp7CrXVxeYjPEEV8YIb2T0FhXMJ2MDKAFm4vKLiPYD
IronPort-HdrOrdr: A9a23:MmAZR6CyPNHqgF/lHel855DYdb4zR+YMi2TDsHoBMiC9E/bo7/
 xG+c5xvyMc5wx9ZJheo7C90cW7Lk80jKQFg7X5Xo3SJTUO2lHIEGg41/qG/9SIIUSXygc378
 ldmsZFZOEYB2IK7vrS0U2ZFMw8yN6M/MmT9IHjJwoBd3AMV0ho1XYCNi+rVnd7QxQDOpowfa
 DsgvZ6mw==
X-Talos-CUID: 9a23:f09GgG7kEr0wUFQ3Mdss/kpJG/wrNT7k837tH2CdIFhMGJqVYArF
X-Talos-MUID: =?us-ascii?q?9a23=3Ant0oXgyATgB5ptY9uSPA5s5WgG+aqKP1VxwInrM?=
 =?us-ascii?q?+gM/HJTd2CmragBOxcLZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="111652720"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH 2/2] arm: Boilerpate arch_domain_teardown()
Date: Mon, 5 Jun 2023 15:43:31 +0100
Message-ID: <20230605144331.1819452-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230605144331.1819452-1-andrew.cooper3@citrix.com>
References: <20230605144331.1819452-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

XXX to be filled in with TEE teardown.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Jens Wiklander <jens.wiklander@linaro.org>

Jens: In the same was as the previous patch in the common path, you want to
add a PROG_tee(?) here, and rearrange the right function(s).
---
 xen/arch/arm/domain.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index b3981d70a442..b00d0e4f30b7 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -752,6 +752,33 @@ int arch_domain_create(struct domain *d,
 
 int arch_domain_teardown(struct domain *d)
 {
+    BUG_ON(!d->is_dying);
+
+    /* See domain_teardown() for an explanation of all of this magic. */
+    switch ( d->teardown.arch_val )
+    {
+#define PROGRESS(x)                             \
+        d->teardown.arch_val = PROG_ ## x;      \
+        fallthrough;                            \
+    case PROG_ ## x
+
+        enum {
+            PROG_none,
+            PROG_done,
+        };
+
+    case PROG_none:
+        BUILD_BUG_ON(PROG_none != 0);
+
+    PROGRESS(done):
+        break;
+
+#undef PROGRESS
+
+    default:
+        BUG();
+    }
+
     return 0;
 }
 
-- 
2.30.2


