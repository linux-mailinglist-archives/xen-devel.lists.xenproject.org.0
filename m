Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A6A6769AB
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jan 2023 22:40:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482384.747874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJLac-0004se-E4; Sat, 21 Jan 2023 21:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482384.747874; Sat, 21 Jan 2023 21:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJLac-0004p6-Ag; Sat, 21 Jan 2023 21:39:54 +0000
Received: by outflank-mailman (input) for mailman id 482384;
 Sat, 21 Jan 2023 21:39:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ql0K=5S=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pJLab-0004Ke-Ap
 for xen-devel@lists.xenproject.org; Sat, 21 Jan 2023 21:39:53 +0000
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [2607:f8b0:4864:20::f2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 226ad58a-99d4-11ed-b8d1-410ff93cb8f0;
 Sat, 21 Jan 2023 22:39:51 +0100 (CET)
Received: by mail-qv1-xf2e.google.com with SMTP id g10so6368251qvo.6
 for <xen-devel@lists.xenproject.org>; Sat, 21 Jan 2023 13:39:51 -0800 (PST)
Received: from shine.lan ([2001:470:8:67e:4282:e612:9c15:499])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a05620a424600b00705be892191sm24202402qko.56.2023.01.21.13.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 13:39:48 -0800 (PST)
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
X-Inumbo-ID: 226ad58a-99d4-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5M2ErVFM3ffELnEbXKvTrmkvSoDVxImjjfW2QVBelko=;
        b=f/lW/Oy/8GtMQRgRZmpr7uaJfCjHJ40UWyp5DbiReRm6FlvGHdZUgu9sv/+kkegcTO
         rgFLK3DEAYSK4sJ6Rv26b1W/RiYbNFnoIfHhBbgsnIXn8ERrerCa2/9B0xnvcBb1wq1Q
         Afl9yNr0x8EPKpCa2DLuxHe4LfxozqJW01Vqb01Rv6yQOSygne3cs/Kk8qJcUHl7XzLd
         eiRCpCYeOjBJILEUZt4tnWzVGQuJJ+1H0eiZPkevmoW6oyUW9zPpOEyR2HcYlq8hwYYr
         nGFN0TyMAxobXOClVOx0Iic1yPux8CmbFVBjMTvdjJwRfKDZ9itWbRhNmFSVQ+m/Sq5h
         izlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5M2ErVFM3ffELnEbXKvTrmkvSoDVxImjjfW2QVBelko=;
        b=13tywHzQkTd4EYfymQQsO3a+j42XCGLWE4+h21LzOi64Abkd6XLijQd3o6VNqVg46N
         nEHw76QMHIYbJg29RO+sQAi+rbBhVv6donYql9ZshJmn+aMDtqfhY/C5bppGNsNvOtcg
         yL0da0n41gRae6yuJ2cE9rbY8+FCutYL5utwyEX1xfR1GqXJAI7U4TWQzOB+qnlkhEkc
         rMBU1oJswqCIKNN6NMi0eMFH9JlDK1xDGiHtdz6h5lmDitxCscqXXrQwhMRfe+RdfBg9
         4KpJ2qqej7zrRUU/Bkrj1gG+LMEhCN84DgQsrctPKHlV87W0VYDImCj5QtIJFwoifp09
         W3Kw==
X-Gm-Message-State: AFqh2kp5lAaj3Qir4NrWPrLHokv9CLqqYmbzyin22Xncj1PGtQS25jXO
	InFC/IqM7Ibj3UrF9G/ZbWR68MVlXvs=
X-Google-Smtp-Source: AMrXdXvgUq6EjRFocmsqWWNYsaDfvnRpwxtDOvRgwbUsxotT8lr9AYnAZhcBp5dpibOm+JJmCxh8IQ==
X-Received: by 2002:a0c:b2d4:0:b0:534:8f10:e1a with SMTP id d20-20020a0cb2d4000000b005348f100e1amr29409884qvf.0.1674337189583;
        Sat, 21 Jan 2023 13:39:49 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/2] Revert "tools/xenstore: simplify loop handling connection I/O"
Date: Sat, 21 Jan 2023 16:39:08 -0500
Message-Id: <20230121213908.6504-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230121213908.6504-1-jandryuk@gmail.com>
References: <20230121213908.6504-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm observing guest kexec trigger xenstored to abort on a double free.

gdb output:
Program received signal SIGABRT, Aborted.
__pthread_kill_implementation (no_tid=0, signo=6, threadid=140645614258112) at ./nptl/pthread_kill.c:44
44    ./nptl/pthread_kill.c: No such file or directory.
(gdb) bt
    at ./nptl/pthread_kill.c:44
    at ./nptl/pthread_kill.c:78
    at ./nptl/pthread_kill.c:89
    at ../sysdeps/posix/raise.c:26
    at talloc.c:119
    ptr=ptr@entry=0x559fae724290) at talloc.c:232
    at xenstored_core.c:2945
(gdb) frame 5
    at talloc.c:119
119            TALLOC_ABORT("Bad talloc magic value - double free");
(gdb) frame 7
    at xenstored_core.c:2945
2945                talloc_increase_ref_count(conn);
(gdb) p conn
$1 = (struct connection *) 0x559fae724290

Looking at a xenstore trace, we have:
IN 0x559fae71f250 20230120 17:40:53 READ (/local/domain/3/image/device-model-dom
id )
wrl: dom    0      1  msec      10000 credit     1000000 reserve        100 disc
ard
wrl: dom    3      1  msec      10000 credit     1000000 reserve        100 disc
ard
wrl: dom    0      0  msec      10000 credit     1000000 reserve          0 disc
ard
wrl: dom    3      0  msec      10000 credit     1000000 reserve          0 disc
ard
OUT 0x559fae71f250 20230120 17:40:53 ERROR (ENOENT )
wrl: dom    0      1  msec      10000 credit     1000000 reserve        100 disc
ard
wrl: dom    3      1  msec      10000 credit     1000000 reserve        100 disc
ard
IN 0x559fae71f250 20230120 17:40:53 RELEASE (3 )
DESTROY watch 0x559fae73f630
DESTROY watch 0x559fae75ddf0
DESTROY watch 0x559fae75ec30
DESTROY watch 0x559fae75ea60
DESTROY watch 0x559fae732c00
DESTROY watch 0x559fae72cea0
DESTROY watch 0x559fae728fc0
DESTROY watch 0x559fae729570
DESTROY connection 0x559fae724290
orphaned node /local/domain/3/device/suspend/event-channel deleted
orphaned node /local/domain/3/device/vbd/51712 deleted
orphaned node /local/domain/3/device/vkbd/0 deleted
orphaned node /local/domain/3/device/vif/0 deleted
orphaned node /local/domain/3/control/shutdown deleted
orphaned node /local/domain/3/control/feature-poweroff deleted
orphaned node /local/domain/3/control/feature-reboot deleted
orphaned node /local/domain/3/control/feature-suspend deleted
orphaned node /local/domain/3/control/feature-s3 deleted
orphaned node /local/domain/3/control/feature-s4 deleted
orphaned node /local/domain/3/control/sysrq deleted
orphaned node /local/domain/3/data deleted
orphaned node /local/domain/3/drivers deleted
orphaned node /local/domain/3/feature deleted
orphaned node /local/domain/3/attr deleted
orphaned node /local/domain/3/error deleted
orphaned node /local/domain/3/console/backend-id deleted

and no further output.

The trace shows that DESTROY was called for connection 0x559fae724290,
but that is the same pointer (conn) main() was looping through from
connections.  So it wasn't actually removed from the connections list?

Reverting commit e8e6e42279a5 "tools/xenstore: simplify loop handling
connection I/O" fixes the abort/double free.  I think the use of
list_for_each_entry_safe is incorrect.  list_for_each_entry_safe makes
traversal safe for deleting the current iterator, but RELEASE/do_release
will delete some other entry in the connections list.  I think the
observed abort is because list_for_each_entry has next pointing to the
deleted connection, and it is used in the subsequent iteration.

Add a comment explaining the unsuitability of list_for_each_entry_safe.
Also notice that the old code takes a reference on next which would
prevents a use-after-free.

This reverts commit e8e6e42279a5723239c5c40ba4c7f579a979465d.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
I didn't verify the stale pointers, which is why there are a lot of "I
think" qualifiers.  But reverting the commit has xenstored still running
whereas it was aborting consistently beforehand.
---
 tools/xenstore/xenstored_core.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 78a3edaa4e..029e3852fc 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2941,8 +2941,23 @@ int main(int argc, char *argv[])
 			}
 		}
 
-		list_for_each_entry_safe(conn, next, &connections, list) {
-			talloc_increase_ref_count(conn);
+		/*
+		 * list_for_each_entry_safe is not suitable here because
+		 * handle_input may delete entries besides the current one, but
+		 * those may be in the temporary next which would trigger a
+		 * use-after-free.  list_for_each_entry_safe is only safe for
+		 * deleting the current entry.
+		 */
+		next = list_entry(connections.next, typeof(*conn), list);
+		if (&next->list != &connections)
+			talloc_increase_ref_count(next);
+		while (&next->list != &connections) {
+			conn = next;
+
+			next = list_entry(conn->list.next,
+					  typeof(*conn), list);
+			if (&next->list != &connections)
+				talloc_increase_ref_count(next);
 
 			if (conn_can_read(conn))
 				handle_input(conn);
-- 
2.34.1


