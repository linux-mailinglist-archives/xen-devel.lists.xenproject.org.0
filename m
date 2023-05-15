Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEDC703054
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 16:43:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534782.832174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyZQC-0002C2-4h; Mon, 15 May 2023 14:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534782.832174; Mon, 15 May 2023 14:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyZQB-00026n-TL; Mon, 15 May 2023 14:43:31 +0000
Received: by outflank-mailman (input) for mailman id 534782;
 Mon, 15 May 2023 14:43:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uWdz=BE=citrix.com=prvs=492993889=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pyZQA-0000CT-AL
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 14:43:30 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db620a99-f32e-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 16:43:29 +0200 (CEST)
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
X-Inumbo-ID: db620a99-f32e-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684161809;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j2YW2cWonftkq/hMdpKaFZq5iF9LBLJDuv16HmF0O5k=;
  b=PVZzLs7enL9MtG4DB6ZOo7txhTIPdFr5pR/l5qkP6J3vmYjkyv3Ui0el
   iyYE+qGcd2IcxWcAs2vRBCTsTmXOnzXaLxEtuKhTvpEWT+Yk2V6UNBTdR
   cUWQqTArAmRK2TirO5N0QFiKQnOMEWNS2VuL9xkFWZsKV+3ks258Yau/3
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111537998
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:nZ2xyKM54Km6rIjvrR2ul8FynXyQoLVcMsEvi/4bfWQNrUoghjYEy
 WYeCm/XPa2JMGumcop0a43j8xxQsZ7Wx4VrTAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tF5wFmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uAvKzxS6
 +cJESEUSSuZusW7xY+SFeY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXTHJgOwRfJ9
 goq+UzfRTo+ZfuH9AOl71/81/X1zCPDY407QejQGvlC3wTImz175ActfUS/iem0jAi5Qd03A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52ml6IDZ/gKYDWgsVSNaZZots8peeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwATdUVfeTEfXDIU+v7YurwUgxfyZ4lsRfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zt64oEWqPcrWWU
 JHoceC65ftGM5yCnTflrA4lTODwvKbt3NExbDdS83gdG9aFoSTLkWN4umsWyKJV3iEsJ1fUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMgtLF/Wpn41NRXIt4wIrKTLufBXB
 HtmWZz0USZy5VpPllJauNvxIZd0n3tjlAs/tLjwzgi90Kr2WUN5vYwtaQPUBshgtfPsnekg2
 4oHXyd840kFAbKWj+i+2dJ7EG3m2lBhWMGn9pINJ7LbSuekcUl4Y8LsLXoaU9QNt8xoei3go
 SnVtpNwoLYnuUD6FA==
IronPort-HdrOrdr: A9a23:10NsPKtlO5DUIiL4lA5bpxNk7skDhtV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5CNB/KHHCAnTKadd/DGEmprY+ts3GR1WPH9Xg6IL1XYJNu6CeHcGIjWvnfACZe
 ChDswsnUvYRV0nKv6VK1MiROb5q9jChPvdEGM7705O0nj3sduwgoSKaCSl4g==
X-Talos-CUID: =?us-ascii?q?9a23=3AemMzwWgM4vLSbgSLVbvsnCMrYTJudCX3kWvOOF6?=
 =?us-ascii?q?BGH9Oc6eoblKVxYo7nJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AsAorpA0Ii0I3kkfVYHTIgsuKzjUjxeOFLBEqiag?=
 =?us-ascii?q?/m9SpZX1qAWadtA+4a9py?=
X-IronPort-AV: E=Sophos;i="5.99,277,1677560400"; 
   d="scan'208";a="111537998"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/6] x86/boot: Adjust MSR_ARCH_CAPS handling for the Host policy
Date: Mon, 15 May 2023 15:42:55 +0100
Message-ID: <20230515144259.1009245-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We are about to move MSR_ARCH_CAPS into featureset, but the order of
operations (copy raw policy, then copy x86_capabilitiles[] in) will end up
clobbering the ARCH_CAPS value currently visible in the Host policy.

To avoid this transient breakage, read from raw_cpu_policy rather than
modifying it in place.  This logic will be removed entirely in due course.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu-policy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 5e7e19fbcda8..49f5465ec445 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -411,7 +411,7 @@ static void __init calculate_host_policy(void)
     p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
 
     /* Temporary, until we have known_features[] for feature bits in MSRs. */
-    p->arch_caps.raw &=
+    p->arch_caps.raw = raw_cpu_policy.arch_caps.raw &
         (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
          ARCH_CAPS_SKIP_L1DFL | ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO |
          ARCH_CAPS_IF_PSCHANGE_MC_NO | ARCH_CAPS_TSX_CTRL | ARCH_CAPS_TAA_NO |
-- 
2.30.2


