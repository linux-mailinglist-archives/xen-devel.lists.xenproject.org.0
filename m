Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7832F1CBC
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:43:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65109.115306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DR-0002vb-A9; Mon, 11 Jan 2021 17:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65109.115306; Mon, 11 Jan 2021 17:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DR-0002uR-20; Mon, 11 Jan 2021 17:42:53 +0000
Received: by outflank-mailman (input) for mailman id 65109;
 Mon, 11 Jan 2021 17:42:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1DO-0002aB-PR
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:42:50 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c03e026-477d-4418-b7e2-e587f59b1321;
 Mon, 11 Jan 2021 17:42:37 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgUM3N
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:30 +0100 (CET)
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
X-Inumbo-ID: 1c03e026-477d-4418-b7e2-e587f59b1321
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386956;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=DGxp3rtLM/VN7/zuIDOVMV5m/V9u5X/Xkf+X/TXAnys=;
	b=Gr/IugpMqXvvTqC0giIzyhfeKhZSL6fa5m0w0zasKL13nfzOudk7uYqslm90Bt06Je
	EJcfmr9HLgcXz9TogSNNPaLjpu/ctwkZ6RpEE4tk0xjtgP0kxGitBfwi8HmGSuYR8jzE
	9/7gOiaor0nQtBm4ShrOpvyJO73+p1nHDCIGmwjW6mV/NAx/iF6o9iLT5SEmvl9RhQy7
	foPArDxwNylgdPsrjk8VpwxBnhRE05cD1xSZYxO23Akl8aWlRB3vY/L6IEfKwHoCBOnF
	5K982GGWA3mzL6LxY/EzMflUYQhUAKPLZgFUJ4t3sgHEJLS1HbWbjJCkVG62iNBaWEsr
	yY6g==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 08/39] xl: fix description of migrate --debug
Date: Mon, 11 Jan 2021 18:41:53 +0100
Message-Id: <20210111174224.24714-9-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xl migrate --debug used to track every pfn in every batch of pages.
But these times are gone. Adjust the help text to tell what --debug
is supposed to do today.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 docs/man/xl.1.pod.in   | 4 +++-
 tools/xl/xl_cmdtable.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index 494a84ee13..e6e4e8e83a 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -481,7 +481,9 @@ Include timestamps in output.
 
 =item B<--debug>
 
-Display huge (!) amount of debug information during the migration process.
+Verify transferred domU page data. All memory will be transferred one more
+time to the destination host while the domU is paused, and compared with
+the result of the inital transfer while the domU was still running.
 
 =item B<-p>
 
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index da0473ddfb..a0567169bf 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -168,7 +168,7 @@ struct cmd_spec cmd_table[] = {
       "-e              Do not wait in the background (on <host>) for the death\n"
       "                of the domain.\n"
       "-T              Show timestamps during the migration process.\n"
-      "--debug         Print huge (!) amount of debug during the migration process.\n"
+      "--debug         Verify transferred domU page data.\n"
       "-p              Do not unpause domain after migrating it.\n"
       "-D              Preserve the domain id"
     },

