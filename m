Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7643B3F5CB4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171051.312326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUC6-0006bM-SC; Tue, 24 Aug 2021 11:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171051.312326; Tue, 24 Aug 2021 11:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUC6-0006PO-2t; Tue, 24 Aug 2021 11:02:14 +0000
Received: by outflank-mailman (input) for mailman id 171051;
 Tue, 24 Aug 2021 11:02:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU2b-0001EC-B2
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:52:25 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94b400f2-f700-47d4-a60a-3018c7968342;
 Tue, 24 Aug 2021 10:51:25 +0000 (UTC)
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
X-Inumbo-ID: 94b400f2-f700-47d4-a60a-3018c7968342
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802284;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iJZ2e3nfEOTMZ6VCfmOynps4uVIsfbwmPPxlvx4nL9s=;
  b=Oh8hDTdAgi+UdIkUmVkMGtBJMIaWbc1zqAKQcLENcSOvJbpqIDeA/K2s
   0i0h4xtAtYSzb0Q5/266qlyVGW2t6nAkE7IRiLW9itO4CY6HqUWF7UfSV
   Z/QIoSfOfUEkKs9K+J5P9/x9ZBRnU8mvr15VYhqQDEGdTsQ7WyvCobp86
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: XV11iicS4d7/cF81GPwgEvK2EQEmjkOn5zSMUBM2cqRwD52fI8Dmvf9vaffgGbKUXbMnj3b9gc
 tBUv4yyQ9omLbj3f2wTr8gk/8ucwZ2rh0sW0NY9kfIcJSfynh5XJ+IObWqVxLLio88blA3PgZX
 6Kkv3VMArC1Y3MdwvUdU1ea3o0BvhmPq/afWLg52gJ2xiJ/bFGqnlqMnQRf9Y/VczP5R/SM6VS
 GQPm7sRmUkapCLGP+d93MLnAb5ffN3crUCt7oFzCikct7kIpMoRM1Xt1bKsw9z42snF5NjWji7
 kjLCqmOgr33lN8Mby/on6oAC
X-SBRS: 5.1
X-MesageID: 52875467
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DCquc66/WD6OrsE5LAPXwM7XdLJyesId70hD6qhwISY7TiX+rb
 HIoB17726MtN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4ZmpM
 FdmsNFZuEYY2IXsS+D2njaL+od
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="52875467"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 19/51] build: fix arch/x86/note.o rule
Date: Tue, 24 Aug 2021 11:50:06 +0100
Message-ID: <20210824105038.1257926-20-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Avoid different spelling for the location of "xen-syms", and simply
use the dependency variable. This avoid the assumption about $(TARGET)
value.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v7:
    - fix typo in title

 xen/arch/x86/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index dfcbd01bb4ed..29aa67ea371e 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -164,7 +164,7 @@ $(TARGET)-syms: prelink.o xen.lds
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
 
 note.o: $(TARGET)-syms
-	$(OBJCOPY) -O binary --only-section=.note.gnu.build-id  $(BASEDIR)/xen-syms $@.bin
+	$(OBJCOPY) -O binary --only-section=.note.gnu.build-id $< $@.bin
 	$(OBJCOPY) -I binary -O elf64-x86-64 -B i386:x86-64 \
 		--rename-section=.data=.note.gnu.build-id -S $@.bin $@
 	rm -f $@.bin
-- 
Anthony PERARD


