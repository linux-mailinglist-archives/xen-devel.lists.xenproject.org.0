Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F12AF29F102
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 17:16:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14325.35428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYAZq-0004Hg-R2; Thu, 29 Oct 2020 16:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14325.35428; Thu, 29 Oct 2020 16:15:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYAZq-0004HH-Nu; Thu, 29 Oct 2020 16:15:02 +0000
Received: by outflank-mailman (input) for mailman id 14325;
 Thu, 29 Oct 2020 16:15:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kYAZp-0004HC-Kg
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 16:15:02 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19df6871-3009-4950-8d40-72c03d805cf5;
 Thu, 29 Oct 2020 16:15:00 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9TGEp3PQ
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 17:14:51 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kYAZp-0004HC-Kg
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 16:15:02 +0000
X-Inumbo-ID: 19df6871-3009-4950-8d40-72c03d805cf5
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 19df6871-3009-4950-8d40-72c03d805cf5;
	Thu, 29 Oct 2020 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603988099;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
	Subject:Sender;
	bh=9OTNbIyCoQ7WfPyq64qoCNVmm6++9PsjVAwM8+F1lss=;
	b=CKDGh3fnezBIGmNlaXn9hsXY9CMDlJXeCrbkyP1nhbmChUmxIVu/qBHrEukMYu88CV
	eHzXq9dF9OUvC834ly/XHrqy4uuLOaBueTyY7kteGlFJ4bkibuAPOnO+lrQwrjzmFwBA
	I9qp6bpWLmq+ySdHYoqpOE7K75vfPZ6cbWLwK9Hj2J9685jwketbd3IsMvjEoNhF6L4X
	PVJIj38WfIzJf11QOsnENRBVSRNSx63Ey8h2tgxP5TkebCvmE/f85SwdmGe61LYO0hV2
	GATWOMD/TwayUF7q8nqU7O2MFGOpJ5Rw0HshoOQ2GQb+JYu+Cgf4P/CZpEEEtZHMjwx6
	4VVw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9TGEp3PQ
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 17:14:51 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1] xl: fix description of migrate --debug
Date: Thu, 29 Oct 2020 17:14:48 +0100
Message-Id: <20201029161448.11385-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
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
index 4bde0672fa..d0f50f0b4a 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -488,7 +488,9 @@ Include timestamps in output.
 
 =item B<--debug>
 
-Display huge (!) amount of debug information during the migration process.
+Verify transferred domU page data. All memory will be transferred one more
+time to the destination host while the domU is paused, and compare with
+the result of the inital transfer while the domU was still running.
 
 =item B<-p>
 
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index fd2dc0aef2..af160dde42 100644
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

