Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 800EF69E537
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 17:56:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499025.770066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUVwC-0007Yd-GG; Tue, 21 Feb 2023 16:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499025.770066; Tue, 21 Feb 2023 16:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUVwC-0007Qg-1X; Tue, 21 Feb 2023 16:56:20 +0000
Received: by outflank-mailman (input) for mailman id 499025;
 Tue, 21 Feb 2023 16:56:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJL1=6R=citrix.com=prvs=409c08766=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pUVwA-0006LK-DO
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 16:56:18 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6e795ff-b208-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 17:56:16 +0100 (CET)
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
X-Inumbo-ID: a6e795ff-b208-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676998576;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UseCy4+DGI15ehevA8lX7nQmBmn5pL/bMgIUe4HdfiA=;
  b=SpLtwq+UFEPVDSGIYr4ML4Gq1Mc0Cad78RzLKXHxRbMZtJa3SxwGhjjV
   Y+RKyBmizPp9H6xBxvL+kDv4blFdFKMrbkS7IZutuavmlJGPGk6ieFGId
   ABSIIt/ekXk1d2NdUy1tePAaQu+Z5I0eOBGTAy1pLo/ejT75Pi6BMygiW
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97316300
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:N1uj96qyt3qDMSc3Vi5zp3snLWleBmICZRIvgKrLsJaIsI4StFCzt
 garIBmBOKyOZTejKd8lYIvl/UkAu5OBytI2HlA//yFnFSgU85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzSBNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACwwYgDd3MOp/IvhVrFxouUkEu6zbYxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jOZpD2nWUlCXDCZ4TSUqnKeo7bMoQy4X6BIHoWZ/8VBv2TGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8Ux4RuBzaf86A+DCm8JCDVGbbQOr9QqTDYn0
 luImdLBBjF1trCRD3WH+d+pQSiaYHZPazVYPGldEFVDuoO4yG0usv7RZspeHL7r1fzqJQiq3
 2iXiAk5uZJL3MFegs1X4mv7qz6ro5HISCs86QPWQn+p42tFWWK1W2C7wQOFtKgdde51WnHE5
 SFZwJbGsIjiGLnXzESwrPMx8KZFDhpvGBnVmhZREpYo7FxBEFbzLNkLsFmSyKqEW/vomAMFg
 meJ5Gu9B7cJZhNGiJObhKroUqwXIVDIT4iNaxwtRoMmjmJNXAGG5jpyQkWbwnrglkMh+YlmZ
 8jFIJ/8VSZFUP8/pNZTewv6+eV2rh3SOEuJHcyrp/hZ+ef2iIGppUctbwLVM7FRAFKsqwTJ6
 ddPX/ZmOD0GONASlhL/qNZJRXhTdChTOHwDg5APHgJ1ClY8ST5J5j646e9JRrGJaIwPyLmWp
 CrmAhYAoLc97FWeQTi3hrlYQOuHdf5CQbgTYUTA4X7AN6AfXLuS
IronPort-HdrOrdr: A9a23:+gAjrKzdJSoWJP+tGuBWKrPw2r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726TtN91YhsdcL+7V5VoLUmzyXcx2/hyAV7AZniAhILLFvAA0WKK+VSJdxEWtNQtsJ
 uIG5IUNDSaNykfsS+V2miF+9ZL+qj5zEir792usUuEm2tRGtBdBwQSMHfqLqVvLjM2fKbQjP
 Cnl7d6TzzLQwVuUu2LQkMrcsLkvNPxmJfvcXc9dmIaAFnnt0LS1FbieSLopCsjbw==
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="97316300"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH v2 6/7] automation: Remove testing on Debian Jessie
Date: Tue, 21 Feb 2023 16:55:41 +0000
Message-ID: <20230221165542.7642-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230221165542.7642-1-anthony.perard@citrix.com>
References: <20230221165542.7642-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Jessie as rearch EOL in 2020.

Even if we update the containers, we would still not be able to reach
HTTPS webside with Let's Encrypt certificates and thus would need more
change to the container.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    HTTPS would fail unless we commit "automation: Remove expired root
    certificates used to be used by let's encrypt", that is. Patch still in
    the series, and fix Jessie.

 automation/gitlab-ci/build.yaml | 40 ---------------------------------
 1 file changed, 40 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 22ce1c45e7..2be1b05d5c 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -221,46 +221,6 @@ centos-7-gcc-debug:
   variables:
     CONTAINER: centos:7
 
-debian-jessie-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: debian:jessie
-
-debian-jessie-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: debian:jessie
-
-debian-jessie-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: debian:jessie
-
-debian-jessie-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: debian:jessie
-
-debian-jessie-32-clang:
-  extends: .clang-x86-32-build
-  variables:
-    CONTAINER: debian:jessie-i386
-
-debian-jessie-32-clang-debug:
-  extends: .clang-x86-32-build-debug
-  variables:
-    CONTAINER: debian:jessie-i386
-
-debian-jessie-32-gcc:
-  extends: .gcc-x86-32-build
-  variables:
-    CONTAINER: debian:jessie-i386
-
-debian-jessie-32-gcc-debug:
-  extends: .gcc-x86-32-build-debug
-  variables:
-    CONTAINER: debian:jessie-i386
-
 debian-stretch-clang:
   extends: .clang-x86-64-build
   variables:
-- 
Anthony PERARD


