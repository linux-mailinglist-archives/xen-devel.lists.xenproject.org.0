Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B704D2F2B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 13:40:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287814.488038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvbc-0005TJ-AX; Wed, 09 Mar 2022 12:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287814.488038; Wed, 09 Mar 2022 12:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvbc-0005RR-6f; Wed, 09 Mar 2022 12:39:52 +0000
Received: by outflank-mailman (input) for mailman id 287814;
 Wed, 09 Mar 2022 12:39:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d6dl=TU=citrix.com=prvs=060aafcb7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nRvba-0005Bn-Ul
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 12:39:50 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 027e3d6e-9fa6-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 13:39:50 +0100 (CET)
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
X-Inumbo-ID: 027e3d6e-9fa6-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646829589;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WF7VI67OSsAZQRpJlsfAPEjrr4Q7HY425itKcbMGzsw=;
  b=eT3mpT0VSkFl7AldrtKBAsUSCncV1ft+77yxb54DquAwSOaD80jRROz+
   G6M1v5XK1C6sbmsuOWA03vyp/s8kDAf8WFqRNg6rxHOYpdW5jto+2oPFS
   VkVBrojF0wVaWD0G7bI96pBgXua9HjnuZpakx2FZSvrOcFFDMQSIinJOd
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68164423
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DlQqCagHwgaPlooMdAndXhxkX161ZBAKZh0ujC45NGQN5FlHY01je
 htvXD+AOqvbazSje4p0OYu1ox5UuJTdztNkQAs9qCA3RC8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvc4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YVsXGYyRyKdEajt3QnhGBKNXp6fpAUHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xN2o2MkicOUYn1lE/DL47gbyWh1rEWn5mlFeb/IoZzHeDw1kkuFTqGIWMIYHbLSlPpW6Ho
 krW8mK/BQsVXPS94zeY9nOnhsfUgDj2HokVEdWQ5vNsxVGe2GEXIBkXTkeg5+m0jFakXNBSI
 FBS/TAhxZXe72TyEIO7BUfh5ifZ4FhMALK8DtHW9inR9I31vlbaX1EmYW8YUOUopZAuaxwTg
 wrhc8zSORRjt7icSHS4/7iSrC+vNSV9EVLudRPoXiNevYC9/dhbYgbnC486TfXr1oGd9STYn
 mjSxBXSkYn/miLiO0+T2VncywyhqZHSJuLezlWGBzn1hu+ViWPMWmBJ1bQ5xasYRGp6ZgPY1
 JThpyR4xLpQZX1qvHbRKNjh5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9aJWG2P
 hOJ6V8NuME70J6WgUlfOdLZ5yMCl/SIKDgYfqqMMoomjmZZL2drAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf8P8dZCfM9EieVD7nlnnQv7HMmnpzz6gev2TCPEEt8tbQrRBt3VGYvZ+W05B
 f4EbJDUo/ieOcWjChTqHXk7dglbcyJkWcio96S6tIere2JbJY3oMNeJqZtJRmCvt/g9ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:X1x/mKBMhCGLJBblHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="68164423"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] Changelog: Add __ro_after_init and CET
Date: Wed, 9 Mar 2022 12:39:36 +0000
Message-ID: <20220309123936.16991-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220309123936.16991-1-andrew.cooper3@citrix.com>
References: <20220309123936.16991-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 CHANGELOG.md | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 83d85fad5bbc..577517383ec9 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -6,6 +6,12 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
 ## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
+### Added
+ - __ro_after_init support on x86, for marking data as immutable after boot.
+ - Support for Xen using x86 Control Flow Enforcement technology for its own
+   protection.  Both Shadow Stacks (ROP protection) and Indirect Branch
+   Tracking (COP/JOP protection).
+
 ### Removed / support downgraded
  - dropped support for the (x86-only) "vesa-mtrr" and "vesa-remap" command line options
 
-- 
2.11.0


