Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668253B901B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:57:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148346.274212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRO-0006aF-Ow; Thu, 01 Jul 2021 09:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148346.274212; Thu, 01 Jul 2021 09:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRO-0006Wq-F3; Thu, 01 Jul 2021 09:57:02 +0000
Received: by outflank-mailman (input) for mailman id 148346;
 Thu, 01 Jul 2021 09:57:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytRM-0004XT-Rr
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:57:00 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.50])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef2dd189-357d-4b4a-8416-ff4c5bf7bfa6;
 Thu, 01 Jul 2021 09:56:49 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619ue5Mg
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:40 +0200 (CEST)
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
X-Inumbo-ID: ef2dd189-357d-4b4a-8416-ff4c5bf7bfa6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133400;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=WwrXv/hX+8hePyd4mOYFfrU0MUgrTtUZ8Gjzx55scrs=;
    b=X40nb9sxbjnVV1nAwDlmHOrl3IpT3EDdb5MM+s5mXJNeggyrJFdvy4UKL79A3twwkP
    +GgMYKeLI2azO1neoyTzxlVOnk4/L2Gy7xZCGEEfkoeofS2KIvBh4UFk1X9JGrcFjxW2
    45NQz5Q3u3KT+4TDeSyj8jS5AHNlDWtvHGbSorrR8r2ziEFd6zVLf0rxEpnDsEjIBAib
    9ktCG0zE9JmsWZSW0RCrX4SrSXe9uf3UfgFfkCzRXivSBfRt8vg/CRdyJSzCJmna5Gks
    j7aivrJk7fEaB7AbSpFZzedvlaKaj1bNHamNVOGR0IiRVI+wY/CfzsFZnFhxU5bmbseQ
    DpUQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210701 03/40] xl: fix description of migrate --debug
Date: Thu,  1 Jul 2021 11:55:58 +0200
Message-Id: <20210701095635.15648-4-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xl migrate --debug used to track every pfn in every batch of pages.
But these times are gone. The code in xc_domain_save is the consumer
of this knob, but it considers it only for the remus and colo case.

Adjust the help text to tell what --debug does today: Nothing.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>

v02:
- the option has no effect anymore
---
 docs/man/xl.1.pod.in   | 2 +-
 tools/xl/xl_cmdtable.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index e2176bd696..70a6ebf438 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -481,7 +481,7 @@ domain.
 
 =item B<--debug>
 
-Display huge (!) amount of debug information during the migration process.
+This option has no effect. It is preserved for compatibility reasons.
 
 =item B<-p>
 
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 661323d488..ca1dfa3525 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -172,7 +172,7 @@ const struct cmd_spec cmd_table[] = {
       "                migrate-receive [-d -e]\n"
       "-e              Do not wait in the background (on <host>) for the death\n"
       "                of the domain.\n"
-      "--debug         Print huge (!) amount of debug during the migration process.\n"
+      "--debug         Ignored.\n"
       "-p              Do not unpause domain after migrating it.\n"
       "-D              Preserve the domain id"
     },

