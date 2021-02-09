Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BF23152DF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 16:34:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83303.154676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9V1g-0000N1-2g; Tue, 09 Feb 2021 15:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83303.154676; Tue, 09 Feb 2021 15:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9V1f-0000Me-Vo; Tue, 09 Feb 2021 15:34:03 +0000
Received: by outflank-mailman (input) for mailman id 83303;
 Tue, 09 Feb 2021 15:34:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5GlY=HL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l9V1e-0000MZ-K3
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 15:34:02 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2c82df9-58d6-4634-9ac2-4c1f747c8794;
 Tue, 09 Feb 2021 15:34:01 +0000 (UTC)
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
X-Inumbo-ID: b2c82df9-58d6-4634-9ac2-4c1f747c8794
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612884841;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=evLa/BNS2wckTYhJm+Vfd5cvV1KAOJvy29N7hg9YC+4=;
  b=O7OuA32jU7IiQfFDAuV3NP3pHPrUHncji3MfGrvLAwGPzq01EYtx3A88
   8zC+a4Wx/Hw74rq550g/5m/EgKWpL5GiIMCZg5PNAYocy9qMYcNwt0Hgk
   gT2kG4gJZ7VbDNAJMC8mU/C2tmhnQu3+d9fyQDBUlqWQDOtVTfzxOrdXn
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uqevPY52mP0+MCL1tyha9isG/6xSm6O0XDNd90OrIcCg5evehdH6dcR2ETswAjUrFuZZRv9TqD
 N+88m1xlz+pN0Ab56WYnhEZyENAuavVXxoehszBcRnY5wvaG2o8zQXnH1yEtKtaJM5RVZsPGbG
 c5fKNjuqh8Tk7wNRubn81KbsjzjVZ4ZYxaF51+3h9esGe3vkK3djbzZExIQPgC7T4uEcOGXqkl
 aDc8hUmrW14c6SznrAE4nQyp/sckg3qJLQoRiVXE1SPP7bNCX7rfDk0ysqiQTLAFj9MKREDTg1
 mok=
X-SBRS: 5.1
X-MesageID: 38224177
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,165,1610427600"; 
   d="scan'208";a="38224177"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.15] x86/ucode: Fix microcode payload size for Fam19 processors
Date: Tue, 9 Feb 2021 15:33:36 +0000
Message-ID: <20210209153336.4016-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The original limit provided wasn't accurate.  Blobs are in fact rather larger.

Fixes: fe36a173d1 ("x86/amd: Initial support for Fam19h processors")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>

For 4.15.  This is a very targetted fix at AMD Zen3 processors.  Without it,
microcode loading doesn't function.
---
 xen/arch/x86/cpu/microcode/amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 5255028af7..c4ab395799 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -111,7 +111,7 @@ static bool verify_patch_size(uint32_t patch_size)
 #define F15H_MPB_MAX_SIZE 4096
 #define F16H_MPB_MAX_SIZE 3458
 #define F17H_MPB_MAX_SIZE 3200
-#define F19H_MPB_MAX_SIZE 4800
+#define F19H_MPB_MAX_SIZE 5568
 
     switch ( boot_cpu_data.x86 )
     {
-- 
2.11.0


