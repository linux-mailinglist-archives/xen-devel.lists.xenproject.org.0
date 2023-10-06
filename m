Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A07F7BB9DC
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 15:58:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613646.954314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qolL0-0007Dk-Li; Fri, 06 Oct 2023 13:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613646.954314; Fri, 06 Oct 2023 13:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qolL0-0007B5-Ht; Fri, 06 Oct 2023 13:57:54 +0000
Received: by outflank-mailman (input) for mailman id 613646;
 Fri, 06 Oct 2023 13:57:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LN/y=FU=citrix.com=prvs=63610b956=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qolKz-0007Ax-8G
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 13:57:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55ec0011-6450-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 15:57:51 +0200 (CEST)
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
X-Inumbo-ID: 55ec0011-6450-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696600671;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=udLcDi6gbiqFXrXjQqc3tJTVg6LavLN9WYX7Nea8UKw=;
  b=RAO+IozJbKFMQFlTkj5eEGDCt5VbSc/QNYkbSmTokD//PBtEdKDsOqHJ
   UCKDs7M7ye4iEjy/DH2ym37Nl7Z0wj28GSC/Yx2UPZilJXcA5gJOso0sh
   j1T/pPQxfjdEBu4lOHF9nPgyPgHKYplPP9nQpvAtJVSCRAxgnJRiyUTOo
   w=;
X-CSE-ConnectionGUID: dnYV5AdTRVS3xDjQysEu0w==
X-CSE-MsgGUID: s9N7m4CWROeEoOEf7aaJBQ==
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 124695506
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:IC7kp6syL6txf3GV1+jX2DrCoefnVHpeMUV32f8akzHdYApBsoF/q
 tZmKWHSO6uMZmGkKdt+aN6+9EwG7ZPWnYU1SFM+pHgyQnwS+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5QeGySFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwJDY8UE2qi96M/ongWsVuv9U4AdSzI9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkAefAhPYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 D6YrjmkWk9y2Nq30mujrXfwrdD1ui7WX6U/GuKx/9xAuQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9/v1DDlmq5WJSnaQ8LiFoDf0Mi8QRUciaCkeXE066t/siIgpi1TESdMLLUKupoSrQ3eqm
 WnM9XVvwepL5SIW60ml1VzBsgzxj5T1dDAOvRX7XFu09S5kPJHwMuRE9mPnAeZ8wJexFwfQ4
 iVVy5bFtYjiHrnXynbQHLtl8KWBoqbdaWKC2zaDCrF8r1yQF2ifkZe8Cd2UDH9uN94NfzihS
 kLasgM5CHR7ZyDyM/Efj25cEa0XIUnc+TfNDKq8giJmOMQZSeN+1HgGibSs927silMwtqo0J
 I2Wd82hZV5DV/U5kWHuFr5Fj+N6rszb+Y80bcmkpylLLJLEPCLFIVv7GATmgh8FAFOs/1yOr
 oc32zqiwBRDSuzuChQ7AqZKRW3m2UMTXMisw+QOL7LrH+aTMD15YxMn6e97KtMNcmU8vrugw
 0xRrWcDlwqn1Sefdl3RAp2hAZu2NatCQbsAFXREFT6VN7ILO+5DMI93m0MLQIQa
IronPort-HdrOrdr: A9a23:vRq7w6yh8Do/6TNyBIIVKrPw2r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726TtN91YhsdcL+7V5VoLUmzyXcx2/hyAV7AZniAhILLFvAA0WKK+VSJdxEWtNQtsJ
 uIG5IUNDSaNykfsS+V2miF+9ZL+qj5zEir792usUuEm2tRGtBdBwQSMHfqLqVvLjM2fKbQjP
 Cnl7d6TzzLQwVuUu2LQkMrcsLkvNPxmJfvcXc9dmIaAFnnt0LS1FbieSLopCsjbw==
X-Talos-CUID: 9a23:MGAU1WApGAvb6Y/6EyVhxXBJM8wZSEPml2f8IXapEkt0EKLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AvoF+vA4LHSf1KmovoObeMxMXxoxzsoLxDRwmrq8?=
 =?us-ascii?q?htuSDEgF+ZD6Urh6OF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.03,204,1694750400"; 
   d="scan'208";a="124695506"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.18] x86/memshr: Fix build in copy_vcpu_settings()
Date: Fri, 6 Oct 2023 14:57:45 +0100
Message-ID: <20231006135745.1038947-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The last user of this variable was dropped.

Fixes: 295514ff7550 ("common: convert vCPU info area registration")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Henry Wang <Henry.Wang@arm.com>

I expect Gitlab randconfig to find this eventually, but it does depend on
CONFIG_MEM_SHARING being active to manifest.
---
 xen/arch/x86/mm/mem_sharing.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 5217c755a299..94b6b782ef2e 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1706,7 +1706,6 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
 {
     unsigned int i;
     int ret = -EINVAL;
-    mfn_t vcpu_info_mfn;
 
     for ( i = 0; i < cd->max_vcpus; i++ )
     {
-- 
2.30.2


