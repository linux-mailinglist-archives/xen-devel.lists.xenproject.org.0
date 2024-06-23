Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A04913935
	for <lists+xen-devel@lfdr.de>; Sun, 23 Jun 2024 11:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746001.1152993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLJV0-00062G-HE; Sun, 23 Jun 2024 09:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746001.1152993; Sun, 23 Jun 2024 09:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLJV0-0005zp-EU; Sun, 23 Jun 2024 09:27:02 +0000
Received: by outflank-mailman (input) for mailman id 746001;
 Sun, 23 Jun 2024 09:27:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5R9h=NZ=wanadoo.fr=christophe.jaillet@srs-se1.protection.inumbo.net>)
 id 1sLJUx-0005zj-Td
 for xen-devel@lists.xenproject.org; Sun, 23 Jun 2024 09:27:00 +0000
Received: from out.smtpout.orange.fr (out-14.smtpout.orange.fr [193.252.22.14])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbef8973-3142-11ef-90a3-e314d9c70b13;
 Sun, 23 Jun 2024 11:26:58 +0200 (CEST)
Received: from fedora.home ([86.243.222.230]) by smtp.orange.fr with ESMTPA
 id LJUss4O2bZn3gLJUssabkv; Sun, 23 Jun 2024 11:26:56 +0200
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
X-Inumbo-ID: bbef8973-3142-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1719134816;
	bh=tuK3/1THv4OAkyKVZvTBBjQAk0ybiMNLzExzqmjJTAA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dyzuUSzxf9eZkx/L57cs7UQgY5D2fkCX1H6T7jJb6bWQ3DK3wV0JxqoEy3REXvnF0
	 bNBmScvyJ66uvrZW7sheAkivRV+0XLlJcREzy+L5nbf2EeHjDAR2nr2GytyJOoMqdb
	 xlS8aGDRl9ifQmQYPQC7fTv+iXyQkl1LqLU+LSyR3mrB1ule/mCpzEGrN+gZxAPIU5
	 k4CPhL8LfJEeOHE018lSazeByHbFVm1USTGgNRnfJy/7IC2OFfqk868YjmWMMP6cUw
	 I2z1AMV7Iku29G47MmVgIfhTfr2VsfcSBGOhBz5GBp7b64tX1qot0vjR+bI0cFhLvW
	 StnZoUlHG3erQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 23 Jun 2024 11:26:56 +0200
X-ME-IP: 86.243.222.230
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] xen/manage: Constify struct shutdown_handler
Date: Sun, 23 Jun 2024 11:26:50 +0200
Message-ID: <ca1e75f66aed43191cf608de6593c7d6db9148f1.1719134768.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct shutdown_handler' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   7043	    788	      8	   7839	   1e9f	drivers/xen/manage.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   7164	    676	      8	   7848	   1ea8	drivers/xen/manage.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only
---
 drivers/xen/manage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c
index c16df629907e..b4b4ebed68da 100644
--- a/drivers/xen/manage.c
+++ b/drivers/xen/manage.c
@@ -208,7 +208,7 @@ static void do_reboot(void)
 	orderly_reboot();
 }
 
-static struct shutdown_handler shutdown_handlers[] = {
+static const struct shutdown_handler shutdown_handlers[] = {
 	{ "poweroff",	true,	do_poweroff },
 	{ "halt",	false,	do_poweroff },
 	{ "reboot",	true,	do_reboot   },
-- 
2.45.2


