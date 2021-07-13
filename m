Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA273C761F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:06:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155543.287181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mni-0004y6-Om; Tue, 13 Jul 2021 18:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155543.287181; Tue, 13 Jul 2021 18:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mni-0004up-IC; Tue, 13 Jul 2021 18:06:34 +0000
Received: by outflank-mailman (input) for mailman id 155543;
 Tue, 13 Jul 2021 18:06:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3Mng-0002kr-Tc
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:06:32 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.50])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05524e76-e405-11eb-8793-12813bfff9fa;
 Tue, 13 Jul 2021 18:06:20 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6CtAl
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:12 +0200 (CEST)
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
X-Inumbo-ID: 05524e76-e405-11eb-8793-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199573;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=sGK5MVxjAVkaDlLv2beeaP+qQqyTAMbH073gSSJ9pMg=;
    b=j9zo2skvObV82f3sAdqJlzNQ2egJfGE23XTdygGlcV6tTMcE1vM/Xa4T1jpmnnbF7U
    v32DmdcLl7kopNAWu03Z/Q3/vV71CdVanXp+hgD0rFOdpebmPKWvPdh5FZWq+mkoVuzD
    fftBP6GZQLYXwVy3TEa7IwgO7dMTztdTAUb2jUfh0inFhLG1i3IyksokZ+wUQVdTDpEs
    wOTVucqVf2NxEX07JQoTW9MhLNkz3qz3B1TJr2RNWfjEgtcUxSc4deKX9H1B0kROP2E+
    8j7bj3PvTQfBaLvbVIUtQv+OcRLPKTmNDL6EZX6nfZ/lsQtzTQIuKDDAyfJWm51K31Yo
    l4yg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgthqlagRsstpH9XYEN5v9xf7dypFU9ge5p0Oi0V"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210713 04/31] xl: fix description of migrate --debug
Date: Tue, 13 Jul 2021 20:05:38 +0200
Message-Id: <20210713180605.12096-5-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xl migrate --debug used to track every pfn in every batch of pages.
But these times are gone. The code in xc_domain_save is the consumer
of this knob, now may enable verification mode.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
v03:
- adjust to describe what --debug would do when the code which
  consumes this knob is fixed.
v02:
- the option has no effect anymore
---
 docs/man/xl.1.pod.in   | 4 +++-
 tools/xl/xl_cmdtable.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index e2176bd696..bae557b1de 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -481,7 +481,9 @@ domain.
 
 =item B<--debug>
 
-Display huge (!) amount of debug information during the migration process.
+This enables verification mode, which will transfer the entire domU memory
+once more to the receiving host to make sure the content is identical on
+both sides.
 
 =item B<-p>
 
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 661323d488..e4f27a3248 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -172,7 +172,7 @@ const struct cmd_spec cmd_table[] = {
       "                migrate-receive [-d -e]\n"
       "-e              Do not wait in the background (on <host>) for the death\n"
       "                of the domain.\n"
-      "--debug         Print huge (!) amount of debug during the migration process.\n"
+      "--debug         Enable verification mode.\n"
       "-p              Do not unpause domain after migrating it.\n"
       "-D              Preserve the domain id"
     },

