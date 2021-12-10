Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA92470A75
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 20:35:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244301.422539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvlfd-0001e1-0n; Fri, 10 Dec 2021 19:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244301.422539; Fri, 10 Dec 2021 19:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvlfc-0001bk-U1; Fri, 10 Dec 2021 19:35:04 +0000
Received: by outflank-mailman (input) for mailman id 244301;
 Fri, 10 Dec 2021 19:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C28n=Q3=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1mvlfa-0001bc-Uv
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 19:35:02 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 440e65e4-59f0-11ec-a74f-db008197e53d;
 Fri, 10 Dec 2021 20:35:02 +0100 (CET)
Received: by mail-qk1-x72c.google.com with SMTP id 193so8694287qkh.10
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 11:35:02 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204])
 by smtp.gmail.com with ESMTPSA id t35sm2852504qtc.83.2021.12.10.11.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 11:34:59 -0800 (PST)
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
X-Inumbo-ID: 440e65e4-59f0-11ec-a74f-db008197e53d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LZvhziiSpOBh0vC8yE04okJeIaA/J/aZR/gPEOPa60s=;
        b=l9mZTiIMsv9n8q8+YgiY4kIREo3bAQxulUzgIHa2t40ufnGDg2z8UJkCmkzaahskq6
         x1Vnjz2feT/YzNwV9GARtqjqyRrrQqN2Ozw6oVfFOg/3NqLSqiRxw/UQBiW+2sef2l2b
         yeBLzW4BTjZ8uehD2+U+q8Rmhm4QauLugTuqjaPZ5YZBknnos0BOpUplMXY7tjtN4mZV
         ZXQBDC6Ph2a76b6Sf7VoC2uWr06KqkDmi+VCNxX6nbEAgTYSN7bnlmx6rtggPYLxZszr
         oH3FdUW5kdUCoqkKOAtZaMXog6V8O1+yGo1PFJRpKK4ATGdUKkC74W7l1DnIFVQPgbp1
         TSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LZvhziiSpOBh0vC8yE04okJeIaA/J/aZR/gPEOPa60s=;
        b=qBouFW9OpqgXOWhF9reeU1WGPNjF5xaKH6UdanyXTNUn+xKifBkbDAgChVwoL4kbdp
         VXnTmgQi5DkwvyJ7GEbeuucFX+iapCnf878uyxWQb99pfdd3W1CJGMXiEmRSXJEnnz7h
         F9F6JLL2btw33srOla/mD296n0DGyUMRaKPGTmQNtDHWdEJne4CtbCECJndHB14zFAXq
         x0KmN98BSaSPLb8Nia7YZFfXvFMa6xeU8vgb4e8ujd+XRLussqUZLLscjDYlbO8khb+K
         EA71tRpy72hxmh61vGzV7mzfx+q2xBvSO62w4pHMTHZy9wY4BUyim0fkbi92BFyNciqz
         /BKA==
X-Gm-Message-State: AOAM530c9NsDwhsyufZNt6KA/Nqn0SAGxXnBNjxuYS4LuvWoP0v3Gsu+
	TcBL4hC6/om0GQg1KBHubb8=
X-Google-Smtp-Source: ABdhPJyDLIa5qmEdPeXW6KEgPi25RJENEAYf/YSsFN0Jpk5qmuVTclAyzherT+kcfWSQ7KRIsePfjw==
X-Received: by 2002:a05:620a:e0e:: with SMTP id y14mr21849497qkm.760.1639164900642;
        Fri, 10 Dec 2021 11:35:00 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH] xen-hvm: Allow disabling buffer_io_timer
Date: Fri, 10 Dec 2021 14:34:34 -0500
Message-Id: <20211210193434.75566-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit f37f29d31488 "xen: slightly simplify bufioreq handling" hard
coded setting req.count = 1 during initial field setup before the main
loop.  This missed a subtlety that an early exit from the loop when
there are no ioreqs to process, would have req.count == 0 for the return
value.  handle_buffered_io() would then remove state->buffered_io_timer.
Instead handle_buffered_iopage() is basically always returning true and
handle_buffered_io() always re-setting the timer.

Restore the disabling of the timer by introducing a new handled_ioreq
boolean and use as the return value.  The named variable will more
clearly show the intent of the code.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 hw/i386/xen/xen-hvm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 482be95415..cf8e500514 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -1087,10 +1087,11 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
     }
 }
 
-static int handle_buffered_iopage(XenIOState *state)
+static bool handle_buffered_iopage(XenIOState *state)
 {
     buffered_iopage_t *buf_page = state->buffered_io_page;
     buf_ioreq_t *buf_req = NULL;
+    bool handled_ioreq = false;
     ioreq_t req;
     int qw;
 
@@ -1144,9 +1145,10 @@ static int handle_buffered_iopage(XenIOState *state)
         assert(!req.data_is_ptr);
 
         qatomic_add(&buf_page->read_pointer, qw + 1);
+        handled_ioreq = true;
     }
 
-    return req.count;
+    return handled_ioreq;
 }
 
 static void handle_buffered_io(void *opaque)
-- 
2.33.1


