Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5CA7F20AF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 23:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637326.993065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5D56-0005dn-Ab; Mon, 20 Nov 2023 22:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637326.993065; Mon, 20 Nov 2023 22:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5D56-0005bZ-67; Mon, 20 Nov 2023 22:49:28 +0000
Received: by outflank-mailman (input) for mailman id 637326;
 Mon, 20 Nov 2023 22:49:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uh/B=HB=citrix.com=prvs=681f0548f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5D54-0004rh-Ud
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 22:49:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d453ff8-87f7-11ee-98e0-6d05b1d4d9a1;
 Mon, 20 Nov 2023 23:49:25 +0100 (CET)
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
X-Inumbo-ID: 0d453ff8-87f7-11ee-98e0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700520565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EVJR9V5+k1L0Xv34e64y+YGh6kPJI63dNHLzn39U6pA=;
  b=icIo2ZNdPWV0gjqVlGhvtX78q2xZMaRMYsmmWPRPn18Qdy0Ipky8SWq/
   xNkwSec/chVRf7S8sPHk6nsZ8nLwYgrcLwcr/7r5cNRE8U1Lg2sBKO+QS
   6o0xSzE9BEovptx0wXh9Hvt9M9gfKojHym1uWKGprx6/hH/U+6O2jJmh7
   M=;
X-CSE-ConnectionGUID: WaXQkFtXSsexmHBFI/oWVg==
X-CSE-MsgGUID: vYXeQnT6QZ6dKD6x9aj9UQ==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128662993
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:7Yx7WaOvDVN+r2vvrR16l8FynXyQoLVcMsEvi/4bfWQNrUog0zECz
 GMaWmDSOavYYGWjLthxbd/ioUlX7cSGyoVgGQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/7rRC9H5qyo42pB5ARmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0tl+MVhN2
 +AoEysAfhWjrcyXh7WEdOY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEOHwwNHwsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4baG5sPzxfDz
 o7A13rIMhwjMuDB8Ajb/lGA2P+elCGqZbtHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFafpQIVUddUF+w86SmOx7DS7gLfAXILJhZDddgnuckeVTEsk
 FiTkLvBOztrt7GETGOHwZ2dpziyJCs9IHcLYGkPSg5ty9Puup0phxTDCNNqCreoj8bdECv1h
 TuNqUAWgrQYjccPkaKh713Dqzupqt7CSQtdzh/QVG+/8gQ/boeqYYWy4HDR8PlbIYCWCFKGu
 RAsncmV6+QHS4+AiDaMRuQlFqym/PuDP3vXhlsHInU6323zoTj5J9kWuWwvYhgxWioZRdP3S
 HDaiTpSyoNjB2CnfapXSayQTMMV86e1QLwJScvogspyjolZLVDfpH0/OxTJgQjQfF4QfbbT0
 Kp3kPpA7l5AUMyLNBLsG48gPUYDn0jSP1/7S5Hh1AiA2rGDfnOTQrptGALRNrhktP7e/FyMr
 Ig32y62J/N3CrWWjs7/q9Z7ELz3BSJjWcCeRzJ/KoZv3TaK6El+UqSMkNvNiqRunrhPl/egw
 51OchYw9bYLvlWecV/iQik6ONvSsWNX8SpT0doEYQz5hBDOoO+HsM8iSnfAVeB2qLU+lacsE
 KhtlgfpKq0ndwkrMg81NfHVxLGOvjzy7e5SF0JJuAQCQqM=
IronPort-HdrOrdr: A9a23:NgNX+ai79DJOlJx7BX2/oURwDXBQXuIji2hC6mlwRA09TySZ//
 rBoB19726MtN9xYgBHpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdWSS5vya3ODXKbkdKaG8gcKVuds=
X-Talos-CUID: =?us-ascii?q?9a23=3Ajsly/2sWA5XPJ2tPQJv9A9+36Isae03kz1nME3S?=
 =?us-ascii?q?jBHZsaJe7aBiXx51rxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AAkEUMg4FyJ26Mo7pnZGtscHYxox20pSjMUYxz6w?=
 =?us-ascii?q?05cWnGXJgaj6f3QmOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.04,214,1695700800"; 
   d="scan'208";a="128662993"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Roberto Bagnara
	<roberto.bagnara@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 5/6] arm/platforms: Make compatbile with -Wwrite-strings
Date: Mon, 20 Nov 2023 22:49:11 +0000
Message-ID: <20231120224912.1421916-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

GCC complains:

  arch/arm/platforms/brcm.c: In function ‘brcm_populate_plat_regs’:
  arch/arm/platforms/brcm.c:76:27: error: passing argument 1 of ‘brcm_get_dt_node’ discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
     76 |     rc = brcm_get_dt_node("brcm,brcmstb-cpu-biu-ctrl", &node, &reg_base);
        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~

and

  arch/arm/platforms/exynos5.c: In function ‘exynos5_smp_init’:
  arch/arm/platforms/exynos5.c:109:20: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
    109 |         compatible = "samsung,exynos4210-sysram-ns";
        |                    ^

In both cases, just make the relevant variable const.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/platforms/brcm.c    | 2 +-
 xen/arch/arm/platforms/exynos5.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/platforms/brcm.c b/xen/arch/arm/platforms/brcm.c
index 951e4d6cc328..43a07ab1a69d 100644
--- a/xen/arch/arm/platforms/brcm.c
+++ b/xen/arch/arm/platforms/brcm.c
@@ -35,7 +35,7 @@ static u32 brcm_boot_continuation_pc;
 
 static struct brcm_plat_regs regs;
 
-static __init int brcm_get_dt_node(char *compat_str,
+static __init int brcm_get_dt_node(const char *compat_str,
                                    const struct dt_device_node **dn,
                                    u32 *reg_base)
 {
diff --git a/xen/arch/arm/platforms/exynos5.c b/xen/arch/arm/platforms/exynos5.c
index c48093cd4fa4..f7c09520675e 100644
--- a/xen/arch/arm/platforms/exynos5.c
+++ b/xen/arch/arm/platforms/exynos5.c
@@ -96,7 +96,7 @@ static int __init exynos5_smp_init(void)
 {
     struct dt_device_node *node;
     void __iomem *sysram;
-    char *compatible;
+    const char *compatible;
     paddr_t sysram_addr;
     paddr_t size;
     paddr_t sysram_offset;
-- 
2.30.2


