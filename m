Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A1B262B2D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 10:59:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFvwI-0002ox-3p; Wed, 09 Sep 2020 08:58:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M6/y=CS=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kFvwG-0002os-0S
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 08:58:48 +0000
X-Inumbo-ID: 736bf33b-0534-44f9-ae53-411b0d5cf7ca
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 736bf33b-0534-44f9-ae53-411b0d5cf7ca;
 Wed, 09 Sep 2020 08:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1599641925;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=WEHC+LUD2lp0yflyObE68XDDsOT9j8D1jg9DQQfoJzY=;
 b=ImXBeEeCBLLhAGcHaXklaOPhMeSAvYB/k+WstaIrBtIXKCUwePaz7TrE01xf6RgUH1
 0Vw6ARLptdIteMFX2stiYocyB8qbYJceUKcP/y9D7G8vYCf802HHjJoiIGPKoOu0rX5i
 RJJrA9AyauuFSCDX/t2ISlZbVfhSsycHFZMbXTbJrBuDtzgBOQr0E9kTLqvW1SrmvcQT
 0CPF7cMTluLb1zlfg7OFvRs9lzH27F6bXWIlAjWVhmsw6rhzE7EcQwdZMEo+58yWf8fI
 5Ph1j2I9AFA3qdj5HKTdJJ+sgxgxpzxsI3tM3NQ7aiNV1XedbLQvlkNf0TagDwA88N8G
 uPpw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS32hIjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.7 SBL|AUTH)
 with ESMTPSA id 60ad29w898wbKkT
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 9 Sep 2020 10:58:37 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Quan Xu <quan.xu0@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2] stubdom: remove tpm_version from vtpmmgr
Date: Wed,  9 Sep 2020 10:58:28 +0200
Message-Id: <20200909085829.29393-1-olaf@aepfle.de>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Giving an enum a name turns it into a variable, which is bad when it is
done in a header file that is consumbed by multiple files.

ld: /home/abuild/rpmbuild/BUILD/xen-4.14.20200616T103126.3625b04991/non-dbg/stubdom/vtpmmgr/vtpmmgr.a(vtpm_cmd_handler.o):(.bss+0x0): multiple definition of `tpm_version'; /home/abuild/rpmbuild/BUILD/xen-4.14.20200616T103126.3625b04991/non-dbg/stubdom/vtpmmgr/vtpmmgr.a(vtpmmgr.o):(.bss+0x0): first defined here

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 stubdom/vtpmmgr/vtpmmgr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubdom/vtpmmgr/vtpmmgr.h b/stubdom/vtpmmgr/vtpmmgr.h
index 2e6f8de9e4..f40ca9fd67 100644
--- a/stubdom/vtpmmgr/vtpmmgr.h
+++ b/stubdom/vtpmmgr/vtpmmgr.h
@@ -53,7 +53,7 @@
 enum {
     TPM1_HARDWARE = 1,
     TPM2_HARDWARE,
-} tpm_version;
+};
 
 struct tpm_hardware_version {
     int hw_version;

