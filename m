Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D675EC0DA
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 13:16:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412493.655865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od8Z1-00007b-8z; Tue, 27 Sep 2022 11:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412493.655865; Tue, 27 Sep 2022 11:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od8Z1-0008WS-32; Tue, 27 Sep 2022 11:15:47 +0000
Received: by outflank-mailman (input) for mailman id 412493;
 Tue, 27 Sep 2022 11:15:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYJ1=Z6=citrix.com=prvs=262b5a957=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1od8Yz-0008Aw-Jp
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 11:15:45 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9793d31-3e55-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 13:15:43 +0200 (CEST)
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
X-Inumbo-ID: b9793d31-3e55-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664277343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FqKJptP8xI/gmJSM9NBmTiySQIrCF/7zJnDRHUkHENk=;
  b=Xh0EI/pzQxXFO2fd9vtR1wkPdePf/aZv5ZblcUfEiqxy7QgGgN2jyhOL
   pZINNqoCHNBYNerd1br7FS1GDffQqESDgJ68Y1oLOWZBNVW3iv0NI7vFO
   Q4Y8MvasytlBAc9eWu5oF5zYx6GHgAaqQV2AUrAzPA/DaFgeeOQ9QgpVw
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80557651
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:p5GegKhmwqdAvJVQN7shVlGpX161HxAKZh0ujC45NGQN5FlHY01je
 htvUGGDPq6PNGuheN0kbI7i/UoG68XXx4c2HAFoq3hgEC0b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrSCYkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UgHUMja4mtC5ARvP68T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUBxp
 M0WFC4yVDKOm72Y0KyQV+1voP12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tOqkmHj5NSFfslWWjaE2/3LS3Ep6172F3N/9KoTXGJoLwx/wS
 mTu3z/TBEAYDuOl2AXe4HW02M7mwXKhcddHfFG/3qEz2wDCroAJMzUJUXOrrP//jVSxM/pTI
 lIZ0jAjpq8z8AqsVNaVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8jAzjCCYpM1A4RyIYEiUV/fL+pIIVt0eaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2Gz1+MWQJuIhzkCOBz/+sFslDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKNN8N5n9hO0yT5FWy13N2ZDBgBDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66KMoAXPcUgJF7frUmCgHJ8OEiy+HXAbIllY
 cvLGSpSJS9y5VtbIMqeGL5GjO5DKtEWzmLPX5HrpymaPU6lTCfMEd843K6mNL9RAFWs/FqIq
 L6y9qKil31ibQEJSnKOqdJOcQ1WRZX5bLivw/Fqmie4ClIOMAkc5zX5mNvNp6QNc3xpq9r1
IronPort-HdrOrdr: A9a23:hQSZ8KEbDG6WbLAOpLqE0seALOsnbusQ8zAXP0AYc31om6uj5r
 iTdZUgpGbJYVkqKRIdcLy7V5VoBEmskaKdgrNhW4tKPjOW2ldARbsKheCJrlHd8m/Fh4lgPM
 9bAtND4bbLbWSS4/yV3ODBKadE/OW6
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; 
   d="scan'208";a="80557651"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 1/5] tools/ocaml/Makefile.rules: do not run ocamldep on distclean
Date: Tue, 27 Sep 2022 12:14:57 +0100
Message-ID: <f06cb11ea0e2d504f5c6c56a1a513f5a184140f7.1664276827.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1664276827.git.edvin.torok@citrix.com>
References: <cover.1664276827.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/Makefile.rules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/Makefile.rules b/tools/ocaml/Makefile.rules
index 0d3c6ac839..e0b9de34e4 100644
--- a/tools/ocaml/Makefile.rules
+++ b/tools/ocaml/Makefile.rules
@@ -44,7 +44,7 @@ META: META.in
 
 ALL_OCAML_OBJ_SOURCES=$(addsuffix .ml, $(ALL_OCAML_OBJS))
 
-ifneq ($(MAKECMDGOALS),clean)
+ifeq (,$(findstring clean,$(MAKECMDGOALS)))
 .ocamldep.make: $(ALL_OCAML_OBJ_SOURCES) Makefile $(OCAML_TOPLEVEL)/Makefile.rules
 	$(call quiet-command, $(OCAMLDEP) $(ALL_OCAML_OBJ_SOURCES) *.mli $o,MLDEP,)
 endif
-- 
2.34.1


