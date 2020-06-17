Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEAD1FC60B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 08:15:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlRLo-0007LN-7H; Wed, 17 Jun 2020 06:15:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gOQl=76=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jlRLl-0007LI-RN
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 06:15:06 +0000
X-Inumbo-ID: e1a39a50-b061-11ea-b7bb-bc764e2007e4
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.166])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1a39a50-b061-11ea-b7bb-bc764e2007e4;
 Wed, 17 Jun 2020 06:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592374503;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=LleofVG/8ySnMgVXLkfGiWlGl5Zthgo4wUc7zE2IRkw=;
 b=OJYblfXrv6ui9mwQt4uWQ5jClpn9/XTvMDD8n3KurA9SFfl31HOzObQqPfIa76l5Ll
 bWq+ceExjAAlTEauMBs4gJxctpWGmNrvm/4fDQN3PpmGdCaYNf+7E53qY7m3R7fKWqrk
 1HO2ff4GX9DN6ruRPt84jG9294iCxCOqVgV9dhCHyphcTqbSN5l2Io76J4JVoGBgqDSG
 uajN3wG3Ouiv1PNc+0DGOEesTbA36APny4Cq9WEqLZVs73GvhdPmbamiA+xIJEMXSOBs
 oTdc+TpjzgHtYUmck7x/ryT+lQ2sVqriNSez1Kl9SQ1kko9fpvEtjUish2nNO9r5Sa6t
 FW4Q==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3GpKjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
 with ESMTPSA id 0013a0w5H6DpGvs
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 17 Jun 2020 08:13:51 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v1] stubdom/vtpmmgr: simplify handling of hardware_version
Date: Wed, 17 Jun 2020 08:13:49 +0200
Message-Id: <20200617061349.7623-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Olaf Hering <olaf@aepfle.de>, Quan Xu <quan.xu0@gmail.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Remove complicated code which deals with a simple boolean, to make gcc10 happy.

ld: /home/abuild/rpmbuild/BUILD/xen-4.14.20200616T103126.3625b04991/non-dbg/stubdom/vtpmmgr/vtpmmgr.a(vtpm_cmd_handler.o):(.bss+0x0): multiple definition of `tpm_version'; /home/abuild/rpmbuild/BUILD/xen-4.14.20200616T103126.3625b04991/non-dbg/stubdom/vtpmmgr/vtpmmgr.a(vtpmmgr.o):(.bss+0x0): first defined here

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 stubdom/vtpmmgr/vtpmmgr.c | 8 +++-----
 stubdom/vtpmmgr/vtpmmgr.h | 9 ---------
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/stubdom/vtpmmgr/vtpmmgr.c b/stubdom/vtpmmgr/vtpmmgr.c
index 9fddaa24f8..94578adbff 100644
--- a/stubdom/vtpmmgr/vtpmmgr.c
+++ b/stubdom/vtpmmgr/vtpmmgr.c
@@ -45,9 +45,7 @@
 #include "vtpmmgr.h"
 #include "tcg.h"
 
-struct tpm_hardware_version hardware_version = {
-    .hw_version = TPM1_HARDWARE,
-};
+static int hardware_version;
 
 int parse_cmdline_hw(int argc, char** argv)
 {
@@ -55,7 +53,7 @@ int parse_cmdline_hw(int argc, char** argv)
 
     for (i = 1; i < argc; ++i) {
         if (!strcmp(argv[i], TPM2_EXTRA_OPT)) {
-            hardware_version.hw_version = TPM2_HARDWARE;
+            hardware_version = 2;
             break;
         }
     }
@@ -64,7 +62,7 @@ int parse_cmdline_hw(int argc, char** argv)
 
 int hw_is_tpm2(void)
 {
-    return (hardware_version.hw_version == TPM2_HARDWARE) ? 1 : 0;
+    return hardware_version == 2 ? 1 : 0;
 }
 
 void main_loop(void) {
diff --git a/stubdom/vtpmmgr/vtpmmgr.h b/stubdom/vtpmmgr/vtpmmgr.h
index 2e6f8de9e4..6523604bdc 100644
--- a/stubdom/vtpmmgr/vtpmmgr.h
+++ b/stubdom/vtpmmgr/vtpmmgr.h
@@ -50,16 +50,7 @@
 #define RSA_KEY_SIZE 0x0800
 #define RSA_CIPHER_SIZE (RSA_KEY_SIZE / 8)
 
-enum {
-    TPM1_HARDWARE = 1,
-    TPM2_HARDWARE,
-} tpm_version;
 
-struct tpm_hardware_version {
-    int hw_version;
-};
-
-extern struct tpm_hardware_version hardware_version;
 
 struct vtpm_globals {
    int tpm_fd;

