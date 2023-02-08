Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BACE68F68E
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 19:05:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491953.761327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPooy-000451-Md; Wed, 08 Feb 2023 18:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491953.761327; Wed, 08 Feb 2023 18:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPooy-000425-Io; Wed, 08 Feb 2023 18:05:28 +0000
Received: by outflank-mailman (input) for mailman id 491953;
 Wed, 08 Feb 2023 18:05:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8nB3=6E=citrix.com=prvs=396cc5531=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1pPoox-00041z-7F
 for xen-devel@lists.xen.org; Wed, 08 Feb 2023 18:05:27 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 271b7ce0-a7db-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 19:05:25 +0100 (CET)
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
X-Inumbo-ID: 271b7ce0-a7db-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675879525;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6GFlkZ7+0oTK0eTY8I2TZ0OsKy8DTPzIbsaB6hzh+UQ=;
  b=Ad/bRzp88iwwHKMOY9Y6bq+E23ynEmDbfQL3y6iwquhcYQg2MPLG2suj
   Cg4T8zwmbT3KuzkwX0e78p1KCzx83Mk7+1ZJ9JeAZSHskdHR0SQ6TCJCH
   JYezVm+iuB/nBVje6L+Y6yfs6V9p5BbuBU8dMVEufaOBy4bIqs3JzGig5
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 96638636
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:hEMwmKuox9I2ik6kSEjD9gcxXufnVFleMUV32f8akzHdYApBsoF/q
 tZmKT3Vb66JNzOgKo9wbI2wph8EvsTVzoBjSwNupS89ECtB+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AWGxyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMweClQbAGAityM/vGaWtcv1p0KIsvOM9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7Wydfs0nToaM47nLMxQh1+LPsLMDUapqBQsA9ckOw9
 zyYpDSnWU9y2Nq322K18Firl+/0rQyhAqMiKpjl7NtnjwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7GRqirxasvRkaQdNcVfI77AKlzbDd6AKUQGMDS1Z8hMcO7ZFsA2Zwj
 xnQwo2vXGY02FGIdZ6D3ueN8DGjOiUrF1FBRD86DltcytfhhY5m23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab/P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3Y1R/HNFBz3oRZPmLy8BxkgTHqFyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27Ca2LP4YQPMUrK1HvEMRSiai4hTiFfK8EyP5XB
 HtmWZz0USZy5VpPnFJauNvxIZd0n3tjlAs/tLjwzgi90Kr2WZJmYe5tDbd6VchgtPnsiFyMo
 75i2z6il003vBvWPnOGrub+7DkicRAGOHwBg5UGLbDfelU4SAnMyZb5mNscRmCspIwN/s+gw
 513chYGoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:K15wR6nlYRGaflI5jvXKVzCIa1fpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.97,281,1669093200"; 
   d="scan'208";a="96638636"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: <xen-devel@lists.xen.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, <sergey.dyasli@citrix.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
Subject: [PATCH] create-diff-object: Handle missing secsym for debug sections
Date: Wed, 8 Feb 2023 18:04:57 +0000
Message-ID: <20230208180457.800671-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Certain debug sections like ".debug_aranges" when built with GCC 11.2.1
are missing section symbols (presumably because they're not needed).
Instead, of segfaulting, simply don't include them if they're missing.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 create-diff-object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/create-diff-object.c b/create-diff-object.c
index a516670..780e6c8 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -1484,7 +1484,7 @@ static void kpatch_include_debug_sections(struct kpatch_elf *kelf)
 	list_for_each_entry(sec, &kelf->sections, list) {
 		if (is_debug_section(sec)) {
 			sec->include = 1;
-			if (!is_rela_section(sec))
+			if (!is_rela_section(sec) && sec->secsym)
 				sec->secsym->include = 1;
 		}
 	}
-- 
2.31.1


