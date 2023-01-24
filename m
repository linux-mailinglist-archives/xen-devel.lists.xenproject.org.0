Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE12678EAE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 04:01:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483383.749550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK9Xy-0007Gb-21; Tue, 24 Jan 2023 03:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483383.749550; Tue, 24 Jan 2023 03:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK9Xx-0007DZ-Ug; Tue, 24 Jan 2023 03:00:29 +0000
Received: by outflank-mailman (input) for mailman id 483383;
 Tue, 24 Jan 2023 03:00:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25we=5V=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pK9Xw-0006f9-GQ
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 03:00:28 +0000
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [2607:f8b0:4864:20::835])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 408c996e-9b93-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 04:00:27 +0100 (CET)
Received: by mail-qt1-x835.google.com with SMTP id q15so12143621qtn.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 19:00:26 -0800 (PST)
Received: from shine.lan ([2001:470:8:67e:5892:c1fa:86fb:7cb6])
 by smtp.gmail.com with ESMTPSA id
 72-20020a37074b000000b00706c1fc62desm602498qkh.112.2023.01.23.19.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 19:00:24 -0800 (PST)
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
X-Inumbo-ID: 408c996e-9b93-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Icd4DGK4E6ry+YQ31IfWclbr0BWHSpu3WVwgfB09ys=;
        b=UG1ctbLD84tqe5OF+o+HvcsPc09j9k60iHNSJUkCbLKSPRzHRhjfc70AV+FKGtncmy
         8oKanYLSohR+mwHDJXgoyEY5C1TcTLrpkGawKLCbbaA7pIlttaxVacLZR1lgzgl3He5Y
         OWwpMraSMH4CwAR+9rZiiQP0X0g9C/VPiOVQngHKJwybJ0rNERAcpEEQvcNAaQbPcj/N
         G1hhPH3lw3brl986CHlpbmDhyj46lSSluh52CdJhy1QzHUywqVHMbS733QaLAmvXLk6x
         9Fyuh8dip4l6XD03sH4+dMCqwIjpSvdH4qEOFc9bYeJYh1bvkci1N2f9irlbwqwd4rO6
         ISVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Icd4DGK4E6ry+YQ31IfWclbr0BWHSpu3WVwgfB09ys=;
        b=w0DdWGt6+GAiHvLk9eO6+UXN7wP/sdLSHVbTyRalJNlkDJMA0J7G0CqqYhfSFwSo6b
         IpIQLwFF1SMoBbHvaxHgZQXAAtG4gBIPw2E5n/1IbTTgWg575juOtbDl6fob55DTA+2E
         tkRGvKN14QmdfLVR6OMlnCHhZPCFfLfWcEIW83dInorXhy+2QkHtfPrzGrEEmKfZatNL
         MmRPl4X+XC7NO+zTHNxU+4MuKwBWC8kf4BYOcPdRLgAplgnpN5XxvIq2OslTWlyhRg2t
         xbMw/XjOQiKcNb8j3uFcRc292G9kpQ6h+4q4dZkvwfiIOuhoP2bazTEg7eFE5nNCgDHA
         JzeQ==
X-Gm-Message-State: AFqh2krI0pLRr7SwEbV0now+j9mhUTrIdLx9wKcAAMsch8el2zE4Wppo
	O8aWB1DiUCoJl5OeodZ854IOFXrycTk=
X-Google-Smtp-Source: AMrXdXsFq3tGlq6FmMNV+QnmDzJePgiYZsBTrOIPs5X+LcpJQdJEwBpNfovnhvEHtReKfd+CSKrA8A==
X-Received: by 2002:ac8:750e:0:b0:3b5:7af4:87b3 with SMTP id u14-20020ac8750e000000b003b57af487b3mr38061181qtq.38.1674529225231;
        Mon, 23 Jan 2023 19:00:25 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 2/2] Revert "tools/xenstore: simplify loop handling connection I/O"
Date: Mon, 23 Jan 2023 21:59:39 -0500
Message-Id: <20230124025939.6480-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124025939.6480-1-jandryuk@gmail.com>
References: <20230124025939.6480-1-jandryuk@gmail.com>
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

Fixes: e8e6e42279a5 "tools/xenstore: simplify loop handling connection I/O"
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
I didn't verify the stale pointers, which is why there are a lot of "I
think" qualifiers.  But reverting the commit has xenstored still running
whereas it was aborting consistently beforehand.

v2: Add Fixes
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


