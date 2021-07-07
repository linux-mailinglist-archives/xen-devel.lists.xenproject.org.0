Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78833BE88D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 15:10:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152207.281209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17KA-0004sq-R9; Wed, 07 Jul 2021 13:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152207.281209; Wed, 07 Jul 2021 13:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17KA-0004qE-O4; Wed, 07 Jul 2021 13:10:46 +0000
Received: by outflank-mailman (input) for mailman id 152207;
 Wed, 07 Jul 2021 13:10:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eUo+=L7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m17K9-0004q8-Vy
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 13:10:46 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc8efb4a-df24-11eb-84f3-12813bfff9fa;
 Wed, 07 Jul 2021 13:10:44 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx67DAbWMF
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 7 Jul 2021 15:10:37 +0200 (CEST)
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
X-Inumbo-ID: bc8efb4a-df24-11eb-84f3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625663438;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=oJEcT6v2n/O5Zj5MH8UEB3htWfj1QTk7O+DK+AM3TXA=;
    b=oo+R6niRH+OrrUoMqQIzoiW06wRPeaUjy3jIpu8U/mS+sY+ZCIe8HMekXbJdk1FYb2
    oKj7b6rOsWAZHQOCFMnjKP44mewTDrWbaB+S/eWaZhLBxWLeKJ9j6Es4KqQlioJ2Ni/d
    u3/JU8fTYaP2zgFYmBzopTHdiIHCohad6nFVx0pdMaOPn24M8AdjYLMHSKfmFWn/eTqm
    F3ucmHTA5mRZzSUrwrCMh6Vbr/5o8kMhiEt1WwHPXg0Ow36uT/xqBTCts0H57DKpDLKd
    6P/j2nOnnj424a9zum6qSzcVCiPRxfHMKugGKPo+6KtFbzB4xETpBeLXBcX1GLzfnBrA
    qw/Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs3rVb2Qcstn6hLmi/A5ONQi+eEunNNoWD5g0T8"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] tools: fix make rpmball
Date: Wed,  7 Jul 2021 15:10:34 +0200
Message-Id: <20210707131034.11854-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
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

