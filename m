Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4E41956A5
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 12:56:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHnVJ-0003Ay-Mc; Fri, 27 Mar 2020 11:50:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VSB4=5M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jHnVI-0003At-6e
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 11:50:24 +0000
X-Inumbo-ID: 23d1ea8e-7021-11ea-895c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23d1ea8e-7021-11ea-895c-12813bfff9fa;
 Fri, 27 Mar 2020 11:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585309823;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TlVT6eLgFAO/hsKfwr636BLi3ocU44+9/wsUBpLND2A=;
 b=dJip49ReDZZHdD4+7/4CPZIiYZFSX2Dgl9WfDSYlYDOIiAmbvR+FTINN
 WC6WBw1owIK9TR6gDuS9llZcNJhTBZSu+D9QAYPh6GwFotNuI3hdAnjGB
 7emco/f6fw7qdccUSrAAfzUlzBupTNDGjWtrJkIj0u91Q+2JU3tihxgKI 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7GblKPCTyagdzwVUkCM9Pc+jHrftVZHV1d7Qtwq98HD2Dk4qr8c12+93IH32djAbtzVnLoIXFh
 CgH0RgxpPNPzB1+2y3VQAb7MrYvkcTo5fKGECN0ZPixe3ebTXh3blWtTqHk1ROk2WmmjWlQljv
 5+LjqtGSjW3haj+Yo3UHNeZ0Sqg9oJViDaq3bb6JluJbuMd2wDdTXqxrj1dlLdArYfd9UxcXRr
 gDL8aJpJUKmiLUv+wLQHNwX4XOX3CSzx+bM9ZjgPt2bAzkNjZQS6V74fo3MAuVWZANFeOrI1ea
 vnQ=
X-SBRS: 2.7
X-MesageID: 14733360
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,312,1580792400"; d="scan'208";a="14733360"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 27 Mar 2020 12:49:47 +0100
Message-ID: <20200327114947.47654-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH] automation/gitlab: add https transport support
 to Debian images
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The LLVM repos have switched from http to https, and trying to access
using http will get redirected to https. Add the apt-transport-https
package to the x86 Debian containers that use the LLVM repos, in order
to support the https transport method.

Note that on Arm we only test with gcc, so don't add the package for
the Debian Arm container.

This fixes the following error seen on the QEMU smoke tests:

E: The method driver /usr/lib/apt/methods/https could not be found.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Wei Liu <wl@xen.org>
---
Should I try to push the updated containers myself?
---
 automation/build/debian/stretch-i386.dockerfile  | 1 +
 automation/build/debian/stretch.dockerfile       | 1 +
 automation/build/debian/unstable-i386.dockerfile | 1 +
 automation/build/debian/unstable.dockerfile      | 1 +
 4 files changed, 4 insertions(+)

diff --git a/automation/build/debian/stretch-i386.dockerfile b/automation/build/debian/stretch-i386.dockerfile
index 4797ae3442..7b6f8eff69 100644
--- a/automation/build/debian/stretch-i386.dockerfile
+++ b/automation/build/debian/stretch-i386.dockerfile
@@ -45,6 +45,7 @@ RUN apt-get update && \
         wget \
         git \
         nasm \
+        apt-transport-https \
         && \
         apt-get autoremove -y && \
         apt-get clean && \
diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
index cfbb2e9b0b..32742f7f39 100644
--- a/automation/build/debian/stretch.dockerfile
+++ b/automation/build/debian/stretch.dockerfile
@@ -44,6 +44,7 @@ RUN apt-get update && \
         git \
         nasm \
         gnupg \
+        apt-transport-https \
         && \
         apt-get autoremove -y && \
         apt-get clean && \
diff --git a/automation/build/debian/unstable-i386.dockerfile b/automation/build/debian/unstable-i386.dockerfile
index 1a73b3b1ec..86ff3585df 100644
--- a/automation/build/debian/unstable-i386.dockerfile
+++ b/automation/build/debian/unstable-i386.dockerfile
@@ -45,6 +45,7 @@ RUN apt-get update && \
         wget \
         git \
         nasm \
+        apt-transport-https \
         && \
         apt-get autoremove -y && \
         apt-get clean && \
diff --git a/automation/build/debian/unstable.dockerfile b/automation/build/debian/unstable.dockerfile
index 2a834f6719..d0aa5ad2bb 100644
--- a/automation/build/debian/unstable.dockerfile
+++ b/automation/build/debian/unstable.dockerfile
@@ -44,6 +44,7 @@ RUN apt-get update && \
         git \
         nasm \
         gnupg \
+        apt-transport-https \
         && \
         apt-get autoremove -y && \
         apt-get clean && \
-- 
2.26.0


