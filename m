Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88390299821
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 21:43:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12564.32698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX9Jn-0005fv-HY; Mon, 26 Oct 2020 20:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12564.32698; Mon, 26 Oct 2020 20:42:15 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX9Jn-0005fW-EA; Mon, 26 Oct 2020 20:42:15 +0000
Received: by outflank-mailman (input) for mailman id 12564;
 Mon, 26 Oct 2020 20:42:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wDZ8=EB=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kX9Jl-0005fR-0M
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 20:42:13 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00a13b8b-3c22-4d36-84e6-ee97feeda9da;
 Mon, 26 Oct 2020 20:42:11 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.2.2 DYNA|AUTH)
 with ESMTPSA id R05874w9QKg01Si
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 26 Oct 2020 21:42:00 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=wDZ8=EB=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kX9Jl-0005fR-0M
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 20:42:13 +0000
X-Inumbo-ID: 00a13b8b-3c22-4d36-84e6-ee97feeda9da
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.25])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 00a13b8b-3c22-4d36-84e6-ee97feeda9da;
	Mon, 26 Oct 2020 20:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603744930;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
	Subject:Sender;
	bh=EwcirB4XvBjykSpJRWnvQgUIQP98XMUaOqvA5ypkIuM=;
	b=pDMRBAkW7MbVxcNYRTEH6va2dRIXbEdahduEnVza/bHHljKxaU8bHQ42BdpvMp3Sak
	5zR47f6i2tNCWQRI/N0OO990u5j7/e0OxWilSmUZ3w4s0/oFRNT8C6r4M0bMk3ROM+Ch
	QcYQRPSpqdxwk68zqd9okBlQPgmqurP0QqaWW8JFwZyMs6z5KJoJsCT1tKmNId1NYjIi
	Gg9SUrEFZ2F4ptzooC+aZnK6/XDCNd1A+zumRBzZXj+txD0pjsxbtuPr5Di/GIDB5lH4
	F/x4vNLf2bMwgsyt4nNAIFDq1H2lHtCJ8tUgbyzObVH/ZmP1mdTjpSt2DpA/MZbUloUw
	Iy1Q==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.2.2 DYNA|AUTH)
	with ESMTPSA id R05874w9QKg01Si
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Mon, 26 Oct 2020 21:42:00 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Jan Beulich <jbeulich@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] libacpi: use temporary files for generated files
Date: Mon, 26 Oct 2020 21:41:51 +0100
Message-Id: <20201026204151.23459-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a temporay file, and move it in place once done.
The same pattern exists already for other dependencies.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libacpi/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
index c17f3924cc..2cc4cc585b 100644
--- a/tools/libacpi/Makefile
+++ b/tools/libacpi/Makefile
@@ -43,7 +43,8 @@ all: $(C_SRC) $(H_SRC)
 
 $(H_SRC): $(ACPI_BUILD_DIR)/%.h: %.asl iasl
 	iasl -vs -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $<
-	sed -e 's/AmlCode/$*/g' -e 's/_aml_code//g' $(ACPI_BUILD_DIR)/$*.hex >$@
+	sed -e 's/AmlCode/$*/g' -e 's/_aml_code//g' $(ACPI_BUILD_DIR)/$*.hex >$@.$(TMP_SUFFIX)
+	mv -f $@.$(TMP_SUFFIX) $@
 	rm -f $(addprefix $(ACPI_BUILD_DIR)/, $*.aml $*.hex)
  
 $(MK_DSDT): mk_dsdt.c

