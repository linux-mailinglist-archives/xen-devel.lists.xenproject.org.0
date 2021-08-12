Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4D03EA602
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 15:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166446.303770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEB7D-0006u0-TA; Thu, 12 Aug 2021 13:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166446.303770; Thu, 12 Aug 2021 13:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEB7D-0006qz-Px; Thu, 12 Aug 2021 13:51:23 +0000
Received: by outflank-mailman (input) for mailman id 166446;
 Thu, 12 Aug 2021 13:51:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rsMc=ND=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mEB7C-0006qt-Qf
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 13:51:22 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f8b263c-fb74-11eb-a1a2-12813bfff9fa;
 Thu, 12 Aug 2021 13:51:20 +0000 (UTC)
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
X-Inumbo-ID: 5f8b263c-fb74-11eb-a1a2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628776280;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=qQyMiQ6Z7hc4qdDW3IMyVg3qE3ezglmAlkD1tFRvu08=;
  b=dqiFeNGXdamdYCms0qTsa4kLDDSe2DfFLdsGXTDS7VMVW7584mBs2kgd
   X8LCqmRhS8MUrhOxP7UVGRjSYXb+WnAicd3NKiEHFN5FX74/xJUroO4yR
   bM1QH1nleMYJ5UOjJoVzwD1nNjd78nb/c5nKz13A01dHCJNmCq5R450QQ
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: eCGN0yTLj4vvhHfT8cxWWjhmOKS3/Sy43l2jS6/OJ1umkP3kmwKjHYvCnz0d7Bvm120m+PEvM3
 wGkqQwVsmYOhIjJnTSuLDQJbo1jUTSp7I6pcrJIkm1uRXGVYQar8fhq/lYTrX3sc/6NcmUlsR7
 X5M7DeQvEwxgwl5vQ5XvqI71cGRGAiRibpOlL0heGSr8ok+3n5ut4JjvBYlRGDOg+eQovmDiOI
 yZxXObl2LyDRfn62w4BLnIuimIbMIknNJwN0TeSghkLOvKQ7SiETwhzvUtzjrtAk5JJz+RHB8G
 QuaEX11SThIPNKnVcgqaGLFm
X-SBRS: 5.1
X-MesageID: 50692826
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jqoy4aoq2cehwgS6gT7LNDEaV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-IronPort-AV: E=Sophos;i="5.84,316,1620705600"; 
   d="scan'208";a="50692826"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>
Subject: [PATCH] MAINTAINERS: Fix file path for kexec headers
Date: Thu, 12 Aug 2021 14:51:01 +0100
Message-ID: <20210812135101.27618-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 56d16e4328cf..9be4ad653af8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -370,7 +370,7 @@ KEXEC
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
 S:	Supported
 F:	xen/common/{kexec,kimage}.c
-F:	xen/include/{kexec,kimage}.h
+F:	xen/include/xen/{kexec,kimage}.h
 F:	xen/arch/x86/machine_kexec.c
 F:	xen/arch/x86/x86_64/kexec_reloc.S
 
-- 
2.11.0


