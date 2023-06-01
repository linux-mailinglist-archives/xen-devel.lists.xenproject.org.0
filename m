Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669C9719FEE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 16:28:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542545.846536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jHc-0006ms-6a; Thu, 01 Jun 2023 14:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542545.846536; Thu, 01 Jun 2023 14:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jHc-0006iJ-2Y; Thu, 01 Jun 2023 14:28:08 +0000
Received: by outflank-mailman (input) for mailman id 542545;
 Thu, 01 Jun 2023 14:28:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Xwn=BV=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q4jHb-00066T-3W
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 14:28:07 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8621ad0a-0088-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 16:28:06 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.5.3 AUTH)
 with ESMTPSA id L38909z51ERw1Sm
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jun 2023 16:27:58 +0200 (CEST)
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
X-Inumbo-ID: 8621ad0a-0088-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1685629678; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=r/eu1fIER1wPtZpC+xC77N6N7DJLuru5V1w9oFBuvxjO5WUkg8NrG4CtdMC5BcCLO+
    A6k7twbEcn6oKNcybOKlsc3AKnbfz7LGXC+JTLuenYilG2jbmyP4wS1e0LsQnsi+Ijmr
    wYQrXcopUZYpgGyae55grBaS10fh2ASOcF5OjVwMwnH0DJGC2xoRmWRTnYjTxllde9nF
    iX8s71tIXigDG2ayhNrt0v1utwjcrkVzCMvivlM6SxDdf9fm3xETwBhEcYlC1mNAR5Bd
    zgIhe3oKLd/phROPzvWAOtzff7ipGsuATRxIv7HslBIVKhum/+azFuqa/mXOtSBfz3uS
    3GWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685629678;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Ycz8f4S+YBpjwDakc+Obg3kVrNZi3RzeWmvuw/COUYA=;
    b=bpf85c1++ih3Ove1r592do1uITxcPaD31yENAjapJ9D5EcO0doWfqZ8TExpczXA5N7
    ospyr40816WHbdGMbCPWHaOJsU4sDhc2q2aXz7dQPuFb/dj0zZj1L59Lll24NZ7FlaDX
    12zNCcOEgt02alAoH4vretWqQPz6xFGdvBe9jnHLsgMSIqvDPb6tsU519g5WC0hRmp6I
    oZElnIGXCf1yXK6gO4epLDPLxFoiNU3UkTKBzAVj7PWfTh2MOQ+FVYACa3s37VHnrlqC
    UU6XGiNT/ha8vVOy++JY0RGsnGeqpTZly4EVxGrlvSktKGRCyC2pPbeiml/AhYrN5R0F
    U6Jg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685629678;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Ycz8f4S+YBpjwDakc+Obg3kVrNZi3RzeWmvuw/COUYA=;
    b=PFTAfY8BdVyFK3M5hmk0NxfmH0KBGS3IvFEy8DSDdbJ5ydt5H4UtVfEnwDkFamiTzK
    XvEH0JCTlaUJspRrwSAOik+HkOCrWtWjHK90Xut8HvHunEKULxNZLr4PC748Y/tRhZiS
    HdfZERiDTkBy6vbQJO0in4xsbEHnUytI4JdWJnWIfgQeuPTsuuOumPYVNYskxDC7azlA
    gA8QrJn0XLUzAXcPAVY2phzUmK+voH1ZdUMcKeRFiDzotI8qPolEfWqiFOfhLYRzmo6O
    1ewt8W9Oeo43CzQTZ/UvJbOrBJ+G+O27b6JKwd9ZbXB0gQs5LzfW9q3z3ckxsiM+6Sjc
    rC5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685629678;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Ycz8f4S+YBpjwDakc+Obg3kVrNZi3RzeWmvuw/COUYA=;
    b=jPeOf2U4nhZ/BQZKRx1Hm0HaDs/pgr8xOyOlw2IYdmDb/XGB/XBveXnMUgq4EVNnlN
    ccz9cwRMgObZnfiWYQBg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xqFv7EJ0tgRX/vKfT/e8Ig6v0dNw4QAWpzMWrRQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 2/7] xentrace: use correct output format for pit and rtc
Date: Thu,  1 Jun 2023 16:27:37 +0200
Message-Id: <20230601142742.15489-3-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230601142742.15489-1-olaf@aepfle.de>
References: <20230601142742.15489-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The input values were always 32bit.

Fixes 55ee5dea32 ("xentrace: add TRC_HVM_EMUL")

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/xentrace/formats | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/xentrace/formats b/tools/xentrace/formats
index 0fcc327a40..afb5ee0112 100644
--- a/tools/xentrace/formats
+++ b/tools/xentrace/formats
@@ -211,8 +211,8 @@
 0x00802008  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  do_irq [ irq = %(1)d, began = %(2)dus, ended = %(3)dus ]
 
 0x00084001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  hpet create [ tn = %(1)d, irq = %(2)d, delta = 0x%(4)08x%(3)08x, period = 0x%(6)08x%(5)08x ]
-0x00084002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  pit create [ delta = 0x%(1)016x, period = 0x%(2)016x ]
-0x00084003  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  rtc create [ delta = 0x%(1)016x , period = 0x%(2)016x ]
+0x00084002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  pit create [ delta = 0x%(1)08x, period = 0x%(2)08x ]
+0x00084003  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  rtc create [ delta = 0x%(1)08x, period = 0x%(2)08x ]
 0x00084004  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  vlapic create [ delta = 0x%(2)08x%(1)08x , period = 0x%(4)08x%(3)08x, irq = %(5)d ]
 0x00084005  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  hpet destroy [ tn = %(1)d ]
 0x00084006  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  pit destroy  [ ]

