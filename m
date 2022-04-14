Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AAF501B2D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 20:36:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305028.519832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf4KD-0000DR-6Y; Thu, 14 Apr 2022 18:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305028.519832; Thu, 14 Apr 2022 18:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf4KD-0000Ac-37; Thu, 14 Apr 2022 18:36:13 +0000
Received: by outflank-mailman (input) for mailman id 305028;
 Thu, 14 Apr 2022 18:36:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNZz=UY=citrix.com=prvs=096427a9b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nf4KB-0000AW-AI
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 18:36:11 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba977b17-bc21-11ec-8fbe-03012f2f19d4;
 Thu, 14 Apr 2022 20:36:01 +0200 (CEST)
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
X-Inumbo-ID: ba977b17-bc21-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649961361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Di5+t/87BhZxgJtY2Uvlne/fduhLkHlu/xbxATrt2uA=;
  b=SFuyBtXT2dC4iogrYILcqXB7HIphyPzrXtz6ws4bU4zU8uY5JB9PWyad
   e4eUVrlcki8SSbtgAenOF+8ebkSe/wh/L0kuxXSWx+g0We74GX56qNMxM
   e62ewhLeqookYNwe5KbD5vjmlB0I1D4ZbAIhBQZcBBwlIceUkrmwc7OYZ
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69399701
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gb87g6PeZSpM++HvrR2gl8FynXyQoLVcMsEvi/4bfWQNrUojhGEDm
 mQcWTrTb//ZZmfxfdx/PIW280lVucKAmoNkQAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl29Iw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z2
 Y5GlZLhZycQeY7Bs/1FcDMJIQREFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQTK2PN
 pVBMFKDajzcTydzC1U1CKksp9mawVj6KWFlhkqK8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc8sLGM00uS+t8+337i2AXksuHwxkUvVz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbv1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb7
 RDofODEsogz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0vdB0xa5hYImS0C
 KM2he+3zMUCVJdNRfUpC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLSnPHKGoNJJcAhiwLpSLcmelvG7v9WremJOcFzNwdeKqV/9U+SJR5hoq9o=
IronPort-HdrOrdr: A9a23:PYKRSK3qmF34E6oB7wBCuQqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.90,260,1643691600"; 
   d="scan'208";a="69399701"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH v2] xen/build: Fix dependency for the MAP rule
Date: Thu, 14 Apr 2022 19:35:48 +0100
Message-ID: <20220414183548.19611-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220414162348.4808-1-andrew.cooper3@citrix.com>
References: <20220414162348.4808-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>

v2:
 * Use $(TARGET) not $(TARGET)-syms
---
 xen/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index dd05672ff42d..3a4e3bdd0f95 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -599,7 +599,7 @@ cscope:
 	cscope -k -b -q
 
 .PHONY: _MAP
-_MAP:
+_MAP: $(TARGET)
 	$(NM) -n $(TARGET)-syms | grep -v '\(compiled\)\|\(\.o$$\)\|\( [aUw] \)\|\(\.\.ng$$\)\|\(LASH[RL]DI\)' > System.map
 
 %.o %.i %.s: %.c tools_fixdep FORCE
-- 
2.11.0


