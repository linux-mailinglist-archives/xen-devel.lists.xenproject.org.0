Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C259B715CDC
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 13:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541110.843493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3xMu-0004Tl-1e; Tue, 30 May 2023 11:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541110.843493; Tue, 30 May 2023 11:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3xMt-0004Qn-Us; Tue, 30 May 2023 11:18:23 +0000
Received: by outflank-mailman (input) for mailman id 541110;
 Tue, 30 May 2023 11:18:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IZK1=BT=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q3xMs-0004Qh-3Y
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 11:18:22 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae7d2964-fedb-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 13:18:19 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4UBIAHle
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 30 May 2023 13:18:10 +0200 (CEST)
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
X-Inumbo-ID: ae7d2964-fedb-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1685445490; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=M3OzKoE3OnXMMuuYeGoewCaszTSTGUvss3H/ly1QRAnB21XWdgXLoZ9ogbh/GLgK7A
    TJQ/bLC1fuUPgYHKCvKHmV0u5ey/7LMVMXrI/PYUKRLomFuru93Rlt467cdmE0hXSU5o
    4OoIejqoTVJt96G7C9u6gpzs5HgZjBd0XH787730mhKxTM4qGGoGJ3hAGVKvNLFOsqES
    eX22HofL1vlpT9/8WBMz8QIApQnJtmdYYPFSad6/0s53ojn8mN0KAn7O4pnoQebWSVgu
    pL0fI7O1VvSv72xnsobXdbo+DvyxWl4VAYEzXJvkHB688oh96M69e2qd5t8kVLMhTq7C
    UslQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685445490;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=xpfZUYcz31NZPlJ7xvrja8Wj8g2sszCQGizz7J+CVKA=;
    b=tWjjzxWF5a+nOA4rwjagKQiarNCa0rHEGz4OyJTKljhdvVvGa59wurx9yMPoEESroO
    yEfN+oz9jelx73uriFWg7PBSsyIp4ion2SbM9a3nTxLvwNImzAv301IfP/Kr7CfnT9cR
    +9Uk3wx/qSITfJsk2AjIHfGCWMmS9ibUHuzjCxJUQQBRAnMpFlpQmpqRKd/1oNMbsRO2
    KIO3l3iwZ2/8ltPcZe0XQjBUsy3RkmyfAzZOsg4tErRnLs+viurdeTzzxcyOPzzEpo8r
    40VhixsLGNmRu6kSL532LJp3e9hJYmw3bRKpGr52iqTDSkErhoqRlkl/36OaoCP+dFly
    ZZtQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685445490;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=xpfZUYcz31NZPlJ7xvrja8Wj8g2sszCQGizz7J+CVKA=;
    b=GKaChHciI6VSbV7AdiDEE7gU+fM6WZpFia2Hu0TyPP1KzjAHZ3w5XkiPfhY78+gxgI
    teRpaZMT8dNEwaXS0knva5KWaYFn2p+RgZYt2YP0Mc6Bb2Nytkfqj8yQNQdsNFcqxkod
    IX0P7b6HJys0WkC1IIvuezz881P64O2xmkjRIcCPV8LELhMrzRrbixCsafaIhtZb5PkV
    KUzdVptEsocphIxyQQTSVJoQeM9BnU3VZWrPiZVvlScKDY89pVF6GkivNCx6wbhe6ruC
    gL9jxdXHlD5zdqazX+6+mwOvuPHu0LUff0B2+0D7cB2wB4JB6lmH9mp55Gq8wN7q1kYO
    w/eg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685445490;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=xpfZUYcz31NZPlJ7xvrja8Wj8g2sszCQGizz7J+CVKA=;
    b=ScHnd5IQDKhgMZr0ZHfLiY0koOReG7+Xk5biE44O7sUPC+2U5is+WW5PUNBPEThKCh
    G0BrICBCa+JXfH00iaAA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xqFv7EJ0tgRX/vKfT/e8Ig6v0dNw4QAWpzMWrRQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1] tools: fix make rpmball
Date: Tue, 30 May 2023 13:18:07 +0200
Message-Id: <20230530111807.6521-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Commit 438c5ffa44e99cceb574c0f9946aacacdedd2952 ("rpmball: Adjust to
new rpm, do not require --force") attempted to handle stricter
directory permissions in newer distributions.

This introduced a few issues:
- /boot used to be a constant prior commit
  6475d700055fa952f7671cee982a23de2f5e4a7c ("use BOOT_DIR as xen.gz
  install location"), since this commit the location has to be
  referenced via ${BOOT_DIR}
- it assumed the prefix and the various configurable paths match the
  glob pattern /*/*/*

Adjust the code to build a filelist on demand and filter directories
from an installed filesystem.rpm.

Take the opportunity to replace the usage of $RPM_BUILD_ROOT with
%buildroot, and use pushd/popd pairs.

Fixes: 438c5ffa4 ("rpmball: Adjust to new rpm, do not require --force")

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/misc/mkrpm | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/tools/misc/mkrpm b/tools/misc/mkrpm
index 74f6761bb0..a7bf854197 100644
--- a/tools/misc/mkrpm
+++ b/tools/misc/mkrpm
@@ -50,20 +50,35 @@ uninstall.
 %build
 
 %install
-rm -rf \$RPM_BUILD_ROOT
-mkdir -p \$RPM_BUILD_ROOT
-cd %{_xenroot}
-dist/install.sh \$RPM_BUILD_ROOT/
+rm -rf %buildroot
+mkdir -p %buildroot
+pushd %_xenroot
+dist/install.sh %buildroot
+
+pushd %buildroot
+popd
+rm -f dist/filesystem.txt
+rm -f dist/directories.txt
+rm -f dist/files.txt
+find %buildroot -type d | sed 's|^%buildroot||' | sort > dist/directories.txt
+find %buildroot -type f | sed 's|^%buildroot||' | sort > dist/files.txt
+find %buildroot -type l | sed 's|^%buildroot||' | sort >> dist/files.txt
+if rpm -ql filesystem > dist/filesystem.txt
+then
+  while read
+  do
+    sed -i "s|^\${REPLY}$||" dist/directories.txt
+  done < dist/filesystem.txt
+fi
+sed 's@^@%%dir @' dist/directories.txt >> dist/files.txt
 
-cd \$RPM_BUILD_ROOT
+popd
 
 %clean
-rm -rf \$RPM_BUILD_ROOT
+rm -rf %buildroot
 
-%files
+%files -f %_xenroot/dist/files.txt
 %defattr(-,root,root,-)
-/*/*/*
-/boot/*
 
 %post
 EOF

