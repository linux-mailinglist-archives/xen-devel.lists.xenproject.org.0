Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B977F3C7619
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:06:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155537.287115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MnT-0002nA-GY; Tue, 13 Jul 2021 18:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155537.287115; Tue, 13 Jul 2021 18:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MnT-0002lJ-DY; Tue, 13 Jul 2021 18:06:19 +0000
Received: by outflank-mailman (input) for mailman id 155537;
 Tue, 13 Jul 2021 18:06:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3MnR-0002kr-UR
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:06:17 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.167])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04584618-e405-11eb-8793-12813bfff9fa;
 Tue, 13 Jul 2021 18:06:17 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6BtAi
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:11 +0200 (CEST)
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
X-Inumbo-ID: 04584618-e405-11eb-8793-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199571;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=oJEcT6v2n/O5Zj5MH8UEB3htWfj1QTk7O+DK+AM3TXA=;
    b=PciP9VORIaGFuJ6qCss2A4mnbbOe3K7r8nCJEEeY0df5QeLCvNsAWdxdTi7yOZgbtZ
    vYBPx1JZAGcofS+BtlzPu5X2ur1W1HxgQZ0cFo3a+AuADZ1TQJigZT8yQhXMSRsiCmr6
    71Qo0bws7mPRd0nXPxmuYE4I+V6+GZeV0X1E/9t9AxVqxLZUOI8r0JlNMjJJkZ3lTahF
    2Fd0FU4e5Aq8xoyfH81c+YW10a4Jfw+bPYE8JFpKCqvlkc1CRGSriq1eqECbv6gcn5cF
    qhfiNK08nJuri8KlYheJWB9LZl66rKRxhnfRPKCFMoJUnYXp7Xk34LjWUvpClDR2ZgsO
    Nepg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgthqlagRsstpH9XYEN5v9xf7dypFU9ge5p0Oi0V"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210713 01/31] tools: fix make rpmball
Date: Tue, 13 Jul 2021 20:05:35 +0200
Message-Id: <20210713180605.12096-2-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
from an installed filesystem.rpm. This works on a SUSE system, and
will likely work on a RedHat based system as well.

Take the opportunity to replace the usage of $RPM_BUILD_ROOT with
%buildroot, and use pushd/popd pairs.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/misc/mkrpm | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/tools/misc/mkrpm b/tools/misc/mkrpm
index 68819b2d73..b31054444d 100644
--- a/tools/misc/mkrpm
+++ b/tools/misc/mkrpm
@@ -50,20 +50,35 @@ uninstall.
 %build
 
 %install
-rm -rf \$RPM_BUILD_ROOT
-mkdir -p \$RPM_BUILD_ROOT
-cd %{_xenroot}
-dist/install.sh \$RPM_BUILD_ROOT/
+rm -rf %{buildroot}
+mkdir -p %{buildroot}
+pushd %{_xenroot}
+dist/install.sh %{buildroot}
+
+pushd %{buildroot}
+popd
+rm -f dist/filesystem.txt
+rm -f dist/directories.txt
+rm -f dist/files.txt
+find %{buildroot} -type d | sed 's|^%{buildroot}||' | sort > dist/directories.txt
+find %{buildroot} -type f | sed 's|^%{buildroot}||' | sort > dist/files.txt
+find %{buildroot} -type l | sed 's|^%{buildroot}||' | sort >> dist/files.txt
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
+rm -rf %{buildroot}
 
-%files
+%files -f %{_xenroot}/dist/files.txt
 %defattr(-,root,root,-)
-/*/*/*
-/boot/*
 
 %post
 EOF

