Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A4272E032
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:56:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548099.855889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91gV-0005jP-L1; Tue, 13 Jun 2023 10:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548099.855889; Tue, 13 Jun 2023 10:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91gV-0005hg-I6; Tue, 13 Jun 2023 10:55:35 +0000
Received: by outflank-mailman (input) for mailman id 548099;
 Tue, 13 Jun 2023 10:55:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x/hz=CB=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q91gU-0005ha-2W
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:55:34 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0740ed8-09d8-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 12:55:31 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.5.3 AUTH)
 with ESMTPSA id L38909z5DAtLgi4
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jun 2023 12:55:21 +0200 (CEST)
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
X-Inumbo-ID: d0740ed8-09d8-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1686653721; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Q/+qAbJGAeHB72kyFEVHs4asb00k8ZVnaucX8o2BGmFV9a2+lc/WfPZi2rqB3KGLnU
    0eVDtviyeOnLEBxwNW9XPoYUVRtAu4wUNb8yYBRq/9D/T3s4Q5uFGVBwft/5y6d0pFH/
    +nTczKCjyfRDN+TL0IoZjv0RmcXgXVdAy+CYHf7Ao9A5Hb9gQ6vGmATmMX0ZBLGxUxw/
    9CiQ7O5eQbh4A6KVU4bPXZjZ3+teMk1FipqmNHiqLWtADBd6fWQBKSpSm2s+rMBL/nNQ
    EDcCxG0MvitxJpsnTL07XClteL+YvbC55LCTVPf3A0O6H5ElOq5ftsuWfw1cJdrmh8o0
    fpUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1686653721;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=sRbirY/RQH93pxT0aGNHNMhIZ9WGkvyruar1mUwhkMU=;
    b=tTznOkbiFosIHBiv4EVOLafpm8XirhKHuxpQPo7Ar0dnmfXWeRtSh8bDKut6ZDOZwe
    ABkHqmQf9WRte02Zh/NsRp6zk+IW606oaxzm/M3aLFkhCBh1106jyUK9JBIoye344sez
    6xuVbPlcVXlvsJ52oueUdvq2jQTJFZOx4nCqxu01eIK+FrEdPYOE5rKUvWOO9M0zuV4B
    WKXzrvpQLCR7WJwdNWQtkZtqRC9zW/mZ3jw0cruXdFDI8XAxQHGcpHOiZs72kXuYv5rs
    OJ8qWUVn5rJyv+MdChVl1euXqC55/tBLJl/MMjIF8v/JcCf5zcIE70+rFXNjUWSb+RiB
    Ji9Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686653721;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=sRbirY/RQH93pxT0aGNHNMhIZ9WGkvyruar1mUwhkMU=;
    b=AEpAFCVwDuEIQs4x0OtizU2/EQS31oloSjzsCdpem6rK32UAmX//ltoWsTTsojI8Mi
    tbmTYgmB+vdsFsGNkJHJ8I/Dgp6/RHZ+cUujygaDPHLVYorCPzG4wckBZN+x/3CTquzv
    m7e9e4ugHmlJhQKFEq3mHt+k489Y91it7r43sSrhNWSmnEm2Ce/QKqTdkIQQYdvxoltu
    f5q++ay3wZ3MRcipsxn/Hk3sDsPOg/w6yxGbCP43Nl/Zzt7B8fejz/iWdcwik5GezAw/
    5ERrjf/2Yzn7qV5QYJK/JJm6B6IGJiKhrS/YouR8sJtrhAFwwu2F3DVO2vb5x5xOvO/z
    nrWg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686653721;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=sRbirY/RQH93pxT0aGNHNMhIZ9WGkvyruar1mUwhkMU=;
    b=23op1sipG9Sd40YrDbRHfw6l4EwNT1ibzHXKmq/NwOnjtaXZVYo8ElqousNOPtfqBi
    MTZEsv/wX4aZ63DshWCg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4wrlX7F5stp0W7RR6sn4IXX0XAi33PEsP+tJs+yA=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2] tools: fix make rpmball
Date: Tue, 13 Jun 2023 12:55:13 +0200
Message-Id: <20230613105513.12949-1-olaf@aepfle.de>
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
from an installed filesystem.rpm. This works on a SUSE system, and
will likely work on a RedHat based system as well.

Take the opportunity to replace the usage of $RPM_BUILD_ROOT with
%buildroot, and use pushd/popd pairs.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---

v2: remove bogus pushd/popd pair, use pipe as delimiter for s command for consistency

 tools/misc/mkrpm | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/tools/misc/mkrpm b/tools/misc/mkrpm
index 74f6761bb0..b072144a42 100644
--- a/tools/misc/mkrpm
+++ b/tools/misc/mkrpm
@@ -50,20 +50,32 @@ uninstall.
 %build
 
 %install
-rm -rf \$RPM_BUILD_ROOT
-mkdir -p \$RPM_BUILD_ROOT
-cd %{_xenroot}
-dist/install.sh \$RPM_BUILD_ROOT/
-
-cd \$RPM_BUILD_ROOT
+rm -rf %buildroot
+mkdir -p %buildroot
+pushd %_xenroot
+dist/install.sh %buildroot
+
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
+sed 's|^|%%dir |' dist/directories.txt >> dist/files.txt
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

