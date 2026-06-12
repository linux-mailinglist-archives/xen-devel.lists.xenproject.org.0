Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bAbcF9WRLGoDTAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 01:10:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF44B67D020
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 01:10:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=dy3gqzy6;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1337055.1598759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYB0L-0003MP-1M; Fri, 12 Jun 2026 23:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337055.1598759; Fri, 12 Jun 2026 23:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYB0K-0003KQ-SH; Fri, 12 Jun 2026 23:09:36 +0000
Received: by outflank-mailman (input) for mailman id 1337055;
 Fri, 12 Jun 2026 23:09:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wYB0I-0002qs-Ak
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 23:09:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYB0H-00HQFu-O0
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 01:09:33 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c91aa-bab6-0a2a0a5309dd-0a2a450cdf7e-4
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 01:09:33 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c91ad-62f1-0a2a450c0019-d155802dc82e-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 01:09:33 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490a76757e5so11219995e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:09:33 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0d28sm10035907f8f.20.2026.06.12.16.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 16:09:31 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1781305772; x=1781910572; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFyw1G28LeeEU4Gr9TD1kO3R30BodTfCNqazb+xAagQ=;
        b=dy3gqzy6rZpRMjzKbSEbsxYqFsbDBjFrJOV0cb+erwj4lD2UY3bzh3YffjyLp7vovD
         PbONU4LQ1Hv+pNF8kvtpUnKYRAk07OoNIa/1Cu46BD6UTsWQMFgjP8gBorSPC7UFyNvf
         bobQQken0J6+RxQJgFfXnpC2RT7LjuD8rntk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781305772; x=1781910572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KFyw1G28LeeEU4Gr9TD1kO3R30BodTfCNqazb+xAagQ=;
        b=CEvJhngwmlI/i64vXDCPPgpTJRZpB1+oCmhMp2Bf9u14QWAEf7d7CTnDsn8EYf+Cs2
         ls8lvBtXvAvPvtuVZSZIF2XQhi4PwGqxzkAHzpQMo2YxWDLhG4a2BhZYUcvIh6qXRFsD
         krMePttQTTwaBdFxwtDuOHwCfFmFydxewovapPLIhuSHChpob4ojWL7seTL7hk7YYLJP
         unvBBkdj53RQpttUY4hbbjERJvo2uZ0kOoJ70fxqnnZsxC266n3+58fw1Ak1l+xxCzmB
         djzbUhQVH6ZxwHbhe2XFVSgtDFnS+q+l9nalqI4IESw0QywImpkaTrM8wTWzA6aoXSRn
         KyMA==
X-Gm-Message-State: AOJu0Yxk0a5lQ2UeXG7mQs491PHF2Ij/Y5MUPr6sCyBIMI+dwbFBjxsw
	OICyG15zrFxdyHPIw4iPsaGTaOceWiq6IiRvwI/8QmeR8acEylfdatz7bohs7AL5c1nAHL+GSZI
	W3bvJ
X-Gm-Gg: Acq92OH28l7DetbtFqa7Jdx6ppQKkxpJfR0XUXdII3ACRHHaDVWoEb0bJN3nqWPPVW3
	M95+rzWWqQyzFR5Rx8qXgUN8r3cwTQiKD/UmpnIqExh320rF9TR7DIOIyl1fu3c+yiK21e04Ow+
	rC/iYq2Rw/ZP9EzXErvFpGwkBK539cEXHU4OPwhQ79acJg3VuxdLe8uIIN/OR13USV/9QOrp6t/
	s0sfkcSG2DjTxxP+kmL7clM0EnTMEEbi8+83rn5kbRe8vqwo5e5V8yUo67ZTHtt1BDMWkLNt21Y
	XyXF02fYKRowOEcq4u+FFhhYPa3ZkfUpiec2H5cATEsZGiy0oxeinG1igTyLFuwncEZ+QhZ3tIV
	rq5QfAzvHz0tF03b0726icLLA1hyQ1Ryo70KAxWzOTy7yBunPSZ5VB9MIgQgeU/EWxgwe5Ev0lI
	HJ4RUZyhOFpU3xtpoyJSOoXyYsYrePOnwLREle1lxKUMWnepXFzcE9QpXx9gljF9dx06AEmLm/s
	ZeJ
X-Received: by 2002:a05:600c:348b:b0:490:e5c1:b89e with SMTP id 5b1f17b1804b1-49220061e38mr15308485e9.10.1781305771866;
        Fri, 12 Jun 2026 16:09:31 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 6/7] CI: Fix inconsistent use of x86-{64,32} vs x86_{64,32}
Date: Sat, 13 Jun 2026 00:09:23 +0100
Message-Id: <20260612230924.3181154-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
References: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1781305773-DA577CF5-ACB945E7/10/73395122804
X-purgate-type: spam
X-purgate-size: 29389
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,kernel.org,amd.com,cardoe.com,invisiblethingslab.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,qubes-x86-64.sh:url,vates.tech:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF44B67D020

The configuration uses a mix of dashes and underscores, which is irritating to
develop for.  Switch to using the underscore form consistently; it is the more
common form and it has the benefit that it allows splitting on dashes to work
sensibly.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

This also removes an artefact from Cody's Gitlab status page, which does use
simple splitting on dashes, and ends up with a mix of "x86" and "x86_64".

I've left Yocto alone.  They have bigger problems than just underscores, and
the jobs have bitrotted while they've been off.
---
 automation/gitlab-ci/build.yaml               | 154 +++++-----
 automation/gitlab-ci/test.yaml                | 280 +++++++++---------
 .../{xtf-x86-64-config => xtf-x86_64-config}  |   0
 ...86-64-efi-config => xtf-x86_64-efi-config} |   0
 .../include/{xtf-x86-64 => xtf-x86_64}        |   0
 .../{xtf-x86-64-efi => xtf-x86_64-efi}        |   0
 .../{qubes-x86-64.sh => qubes-x86_64.sh}      |   0
 7 files changed, 217 insertions(+), 217 deletions(-)
 rename automation/scripts/include/configs/{xtf-x86-64-config => xtf-x86_64-config} (100%)
 rename automation/scripts/include/configs/{xtf-x86-64-efi-config => xtf-x86_64-efi-config} (100%)
 rename automation/scripts/include/{xtf-x86-64 => xtf-x86_64} (100%)
 rename automation/scripts/include/{xtf-x86-64-efi => xtf-x86_64-efi} (100%)
 rename automation/scripts/{qubes-x86-64.sh => qubes-x86_64.sh} (100%)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index fa054a82800b..d5929e34ecaa 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -36,77 +36,77 @@
     CXX: clang++
     clang: y
 
-.x86-64-build-tmpl:
+.x86_64-build-tmpl:
   <<: *build
   variables:
     XEN_TARGET_ARCH: x86_64
   tags:
     - x86_64
 
-.x86-64-build:
-  extends: .x86-64-build-tmpl
+.x86_64-build:
+  extends: .x86_64-build-tmpl
   variables:
     debug: n
 
-.x86-64-build-debug:
-  extends: .x86-64-build-tmpl
+.x86_64-build-debug:
+  extends: .x86_64-build-tmpl
   variables:
     debug: y
 
-.x86-32-build-tmpl:
+.x86_32-build-tmpl:
   <<: *build
   variables:
     XEN_TARGET_ARCH: x86_32
   tags:
     - x86_32
 
-.x86-32-build:
-  extends: .x86-32-build-tmpl
+.x86_32-build:
+  extends: .x86_32-build-tmpl
   variables:
     debug: n
 
-.x86-32-build-debug:
-  extends: .x86-32-build-tmpl
+.x86_32-build-debug:
+  extends: .x86_32-build-tmpl
   variables:
     debug: y
 
-.gcc-x86-64-build:
-  extends: .x86-64-build
+.gcc-x86_64-build:
+  extends: .x86_64-build
   variables:
     <<: *gcc
 
-.gcc-x86-64-build-debug:
-  extends: .x86-64-build-debug
+.gcc-x86_64-build-debug:
+  extends: .x86_64-build-debug
   variables:
     <<: *gcc
 
-.gcc-x86-32-build:
-  extends: .x86-32-build
+.gcc-x86_32-build:
+  extends: .x86_32-build
   variables:
     <<: *gcc
 
-.gcc-x86-32-build-debug:
-  extends: .x86-32-build-debug
+.gcc-x86_32-build-debug:
+  extends: .x86_32-build-debug
   variables:
     <<: *gcc
 
-.clang-x86-64-build:
-  extends: .x86-64-build
+.clang-x86_64-build:
+  extends: .x86_64-build
   variables:
     <<: *clang
 
-.clang-x86-64-build-debug:
-  extends: .x86-64-build-debug
+.clang-x86_64-build-debug:
+  extends: .x86_64-build-debug
   variables:
     <<: *clang
 
-.clang-x86-32-build:
-  extends: .x86-32-build
+.clang-x86_32-build:
+  extends: .x86_32-build
   variables:
     <<: *clang
 
-.clang-x86-32-build-debug:
-  extends: .x86-32-build-debug
+.clang-x86_32-build-debug:
+  extends: .x86_32-build-debug
   variables:
     <<: *clang
 
@@ -244,25 +244,25 @@
   tags:
     - arm64
 
-.yocto-test-x86-64:
+.yocto-test-x86_64:
   extends: .yocto-test
   tags:
     - x86_64
 
-.x86-64-cross-build-tmpl:
+.x86_64-cross-build-tmpl:
   <<: *build
   variables:
     XEN_TARGET_ARCH: x86_64
   tags:
     - arm64
 
-.x86-64-cross-build:
-  extends: .x86-64-cross-build-tmpl
+.x86_64-cross-build:
+  extends: .x86_64-cross-build-tmpl
   variables:
     debug: n
 
-.gcc-x86-64-cross-build:
-  extends: .x86-64-cross-build
+.gcc-x86_64-cross-build:
+  extends: .x86_64-cross-build
   variables:
     <<: *gcc
 
@@ -271,13 +271,13 @@
 # Build jobs needed for tests
 
 alpine-3.24-x86_64-gcc:
-  extends: .gcc-x86-64-build
+  extends: .gcc-x86_64-build
   <<: *build-test
   variables:
     CONTAINER: alpine:3.24-x86_64
 
 alpine-3.24-x86_64-gcc-debug:
-  extends: .gcc-x86-64-build-debug
+  extends: .gcc-x86_64-build-debug
   <<: *build-test
   variables:
     CONTAINER: alpine:3.24-x86_64
@@ -292,13 +292,13 @@ alpine-3.24-x86_64-gcc-debug:
       CONFIG_XHCI=y
 
 debian-13-x86_64-gcc-debug:
-  extends: .gcc-x86-64-build-debug
+  extends: .gcc-x86_64-build-debug
   <<: *build-test
   variables:
     CONTAINER: debian:13-x86_64
 
 debian-13-x86_64-clang-debug:
-  extends: .clang-x86-64-build-debug
+  extends: .clang-x86_64-build-debug
   <<: *build-test
   variables:
     CONTAINER: debian:13-x86_64
@@ -482,14 +482,14 @@ yocto-qemuarm:
     YOCTO_OUTPUT: --copy-output
 
 yocto-qemux86-64:
-  extends: .yocto-test-x86-64
+  extends: .yocto-test-x86_64
   variables:
     YOCTO_BOARD: qemux86-64
 
 # Cppcheck analysis jobs
 
 debian-12-x86_64-gcc-cppcheck:
-  extends: .gcc-x86-64-cross-build
+  extends: .gcc-x86_64-cross-build
   variables:
     CONTAINER: debian:12-arm64v8-cppcheck
     CROSS_COMPILE: /usr/bin/x86_64-linux-gnu-
@@ -514,29 +514,29 @@ debian-12-arm64-gcc-cppcheck:
 # Build jobs not needed for tests
 
 alpine-3.24-x86_64-clang:
-  extends: .clang-x86-64-build
+  extends: .clang-x86_64-build
   variables:
     CONTAINER: alpine:3.24-x86_64
 
 alpine-3.24-x86_64-clang-debug:
-  extends: .clang-x86-64-build-debug
+  extends: .clang-x86_64-build-debug
   variables:
     CONTAINER: alpine:3.24-x86_64
 
 archlinux-x86_64-gcc:
-  extends: .gcc-x86-64-build
+  extends: .gcc-x86_64-build
   variables:
     CONTAINER: archlinux:current-x86_64
   allow_failure: true
 
 archlinux-x86_64-gcc-debug:
-  extends: .gcc-x86-64-build-debug
+  extends: .gcc-x86_64-build-debug
   variables:
     CONTAINER: archlinux:current-x86_64
   allow_failure: true
 
 debian-12-x86_64-gcc-ibt:
-  extends: .gcc-x86-64-build
+  extends: .gcc-x86_64-build
   variables:
     CONTAINER: debian:12-x86_64-gcc-ibt
     RANDCONFIG: y
@@ -544,42 +544,42 @@ debian-12-x86_64-gcc-ibt:
       CONFIG_XEN_IBT=y
 
 debian-12-x86_64-clang:
-  extends: .clang-x86-64-build
+  extends: .clang-x86_64-build
   variables:
     CONTAINER: debian:12-x86_64
 
 debian-12-x86_64-clang-debug:
-  extends: .clang-x86-64-build-debug
+  extends: .clang-x86_64-build-debug
   variables:
     CONTAINER: debian:12-x86_64
 
 debian-12-x86_64-gcc:
-  extends: .gcc-x86-64-build
+  extends: .gcc-x86_64-build
   variables:
     CONTAINER: debian:12-x86_64
 
 debian-12-x86_64-gcc-debug:
-  extends: .gcc-x86-64-build-debug
+  extends: .gcc-x86_64-build-debug
   variables:
     CONTAINER: debian:12-x86_64
 
 debian-12-x86_32-clang-debug:
-  extends: .clang-x86-32-build-debug
+  extends: .clang-x86_32-build-debug
   variables:
     CONTAINER: debian:12-x86_32
 
 debian-12-x86_32-gcc-debug:
-  extends: .gcc-x86-32-build-debug
+  extends: .gcc-x86_32-build-debug
   variables:
     CONTAINER: debian:12-x86_32
 
 debian-13-x86_64-clang:
-  extends: .clang-x86-64-build
+  extends: .clang-x86_64-build
   variables:
     CONTAINER: debian:13-x86_64
 
 debian-13-x86_64-clang-randconfig:
-  extends: .clang-x86-64-build
+  extends: .clang-x86_64-build
   variables:
     CONTAINER: debian:13-x86_64
     RANDCONFIG: y
@@ -587,136 +587,136 @@ debian-13-x86_64-clang-randconfig:
       CONFIG_COVERAGE=n # Disable coverage otherwise build times out.
 
 debian-13-x86_64-gcc:
-  extends: .gcc-x86-64-build
+  extends: .gcc-x86_64-build
   variables:
     CONTAINER: debian:13-x86_64
 
 debian-13-x86_64-gcc-randconfig:
-  extends: .gcc-x86-64-build
+  extends: .gcc-x86_64-build
   variables:
     CONTAINER: debian:13-x86_64
     RANDCONFIG: y
 
 debian-13-x86_32-clang-debug:
-  extends: .clang-x86-32-build-debug
+  extends: .clang-x86_32-build-debug
   variables:
     CONTAINER: debian:13-x86_32
 
 debian-13-x86_32-gcc-debug:
-  extends: .gcc-x86-32-build-debug
+  extends: .gcc-x86_32-build-debug
   variables:
     CONTAINER: debian:13-x86_32
 
 fedora-43-x86_64-gcc:
-  extends: .gcc-x86-64-build
+  extends: .gcc-x86_64-build
   variables:
     CONTAINER: fedora:43-x86_64
 
 fedora-43-x86_64-gcc-debug:
-  extends: .gcc-x86-64-build-debug
+  extends: .gcc-x86_64-build-debug
   variables:
     CONTAINER: fedora:43-x86_64
 
 ubuntu-18.04-x86_64-gcc:
-  extends: .gcc-x86-64-build
+  extends: .gcc-x86_64-build
   variables:
     CONTAINER: ubuntu:18.04-x86_64
 
 ubuntu-18.04-x86_64-gcc-debug:
-  extends: .gcc-x86-64-build-debug
+  extends: .gcc-x86_64-build-debug
   variables:
     CONTAINER: ubuntu:18.04-x86_64
 
 ubuntu-20.04-x86_64-gcc:
-  extends: .gcc-x86-64-build
+  extends: .gcc-x86_64-build
   variables:
     CONTAINER: ubuntu:20.04-x86_64
 
 ubuntu-22.04-x86_64-clang:
-  extends: .clang-x86-64-build
+  extends: .clang-x86_64-build
   variables:
     CONTAINER: ubuntu:22.04-x86_64
 
 ubuntu-22.04-x86_64-clang-debug:
-  extends: .clang-x86-64-build-debug
+  extends: .clang-x86_64-build-debug
   variables:
     CONTAINER: ubuntu:22.04-x86_64
 
 ubuntu-22.04-x86_64-gcc:
-  extends: .gcc-x86-64-build
+  extends: .gcc-x86_64-build
   variables:
     CONTAINER: ubuntu:22.04-x86_64
 
 ubuntu-24.04-x86_64-clang:
-  extends: .clang-x86-64-build
+  extends: .clang-x86_64-build
   variables:
     CONTAINER: ubuntu:24.04-x86_64
 
 ubuntu-24.04-x86_64-gcc:
-  extends: .gcc-x86-64-build
+  extends: .gcc-x86_64-build
   variables:
     CONTAINER: ubuntu:24.04-x86_64
 
 ubuntu-26.04-x86_64-clang:
-  extends: .clang-x86-64-build
+  extends: .clang-x86_64-build
   variables:
     CONTAINER: ubuntu:26.04-x86_64
 
 ubuntu-26.04-x86_64-clang-debug:
-  extends: .clang-x86-64-build-debug
+  extends: .clang-x86_64-build-debug
   variables:
     CONTAINER: ubuntu:26.04-x86_64
 
 ubuntu-26.04-x86_64-gcc:
-  extends: .gcc-x86-64-build
+  extends: .gcc-x86_64-build
   variables:
     CONTAINER: ubuntu:26.04-x86_64
 
 ubuntu-26.04-x86_64-gcc-debug:
-  extends: .gcc-x86-64-build-debug
+  extends: .gcc-x86_64-build-debug
   variables:
     CONTAINER: ubuntu:26.04-x86_64
 
 opensuse-leap-16.0-clang:
-  extends: .clang-x86-64-build
+  extends: .clang-x86_64-build
   variables:
     CONTAINER: opensuse:leap-16.0-x86_64
 
 opensuse-leap-16.0-clang-debug:
-  extends: .clang-x86-64-build-debug
+  extends: .clang-x86_64-build-debug
   variables:
     CONTAINER: opensuse:leap-16.0-x86_64
 
 opensuse-leap-16.0-gcc:
-  extends: .gcc-x86-64-build
+  extends: .gcc-x86_64-build
   variables:
     CONTAINER: opensuse:leap-16.0-x86_64
 
 opensuse-leap-16.0-gcc-debug:
-  extends: .gcc-x86-64-build-debug
+  extends: .gcc-x86_64-build-debug
   variables:
     CONTAINER: opensuse:leap-16.0-x86_64
 
 opensuse-tumbleweed-clang:
-  extends: .clang-x86-64-build
+  extends: .clang-x86_64-build
   variables:
     CONTAINER: opensuse:tumbleweed-x86_64
   allow_failure: true
 
 opensuse-tumbleweed-clang-debug:
-  extends: .clang-x86-64-build-debug
+  extends: .clang-x86_64-build-debug
   variables:
     CONTAINER: opensuse:tumbleweed-x86_64
   allow_failure: true
 
 opensuse-tumbleweed-gcc:
-  extends: .gcc-x86-64-build
+  extends: .gcc-x86_64-build
   variables:
     CONTAINER: opensuse:tumbleweed-x86_64
   allow_failure: true
 
 opensuse-tumbleweed-gcc-debug:
-  extends: .gcc-x86-64-build-debug
+  extends: .gcc-x86_64-build-debug
   variables:
     CONTAINER: opensuse:tumbleweed-x86_64
   allow_failure: true
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 2a7a0e513e72..fa3f776fc785 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -21,7 +21,7 @@
     job: microcode-x86
     ref: $ARTIFACTS_BRANCH
 
-.x86-64-test-needs: &x86-64-test-needs
+.x86_64-test-needs: &x86_64-test-needs
   - project: $ARTIFACTS_REPO
     job: $LINUX_JOB_X86_64
     ref: $ARTIFACTS_BRANCH
@@ -58,11 +58,11 @@
   tags:
     - arm64
 
-.qemu-x86-64:
+.qemu-x86_64:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:13-x86_64
-    LOGFILE: qemu-smoke-x86-64.log
+    LOGFILE: qemu-smoke-x86_64.log
   artifacts:
     paths:
       - smoke.serial
@@ -71,8 +71,8 @@
   tags:
     - x86_64
 
-.qemu-smoke-x86-64:
-  extends: .qemu-x86-64
+.qemu-smoke-x86_64:
+  extends: .qemu-x86_64
   variables:
     TEST_TIMEOUT_OVERRIDE: 120
 
@@ -141,7 +141,7 @@
   tags:
     - xilinx
 
-.adl-x86-64:
+.adl-x86_64:
   extends: .test-jobs-common
   variables:
     # the test controller runs on RPi4
@@ -164,9 +164,9 @@
   tags:
     - qubes-hw2
 
-.kbl-x86-64:
+.kbl-x86_64:
   # it's really similar to the ADL one
-  extends: .adl-x86-64
+  extends: .adl-x86_64
   variables:
     PCIDEV: "00:1f.6"
     PCIDEV_INTR: "MSI"
@@ -175,9 +175,9 @@
   tags:
     - qubes-hw3
 
-.zen2-x86-64:
+.zen2-x86_64:
   # it's really similar to the above
-  extends: .adl-x86-64
+  extends: .adl-x86_64
   variables:
     PCIDEV: "01:00.0"
     PCIDEV_INTR: "MSI-X"
@@ -186,9 +186,9 @@
   tags:
     - qubes-hw1
 
-.zen3p-x86-64:
+.zen3p-x86_64:
   # it's really similar to the above
-  extends: .adl-x86-64
+  extends: .adl-x86_64
   variables:
     PCIDEV: "01:00.0"
     PCIDEV_INTR: "MSI-X"
@@ -235,7 +235,7 @@ xilinx-smoke-dom0-x86_64-gcc-debug:
   script:
     - ./automation/scripts/xilinx-smoke-dom0-x86_64.sh ping 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
 xilinx-smoke-dom0-x86_64-gcc-debug-argo:
@@ -254,238 +254,238 @@ xilinx-smoke-dom0-x86_64-gcc-debug-argo:
       job: microcode-x86
       ref: master
 
-adl-smoke-x86-64-gcc-debug:
-  extends: .adl-x86-64
+adl-smoke-x86_64-gcc-debug:
+  extends: .adl-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh dom0pv 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh dom0pv 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-adl-smoke-x86-64-dom0pvh-gcc-debug:
-  extends: .adl-x86-64
+adl-smoke-x86_64-dom0pvh-gcc-debug:
+  extends: .adl-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh dom0pvh 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-adl-smoke-x86-64-dom0pvh-hvm-gcc-debug:
-  extends: .adl-x86-64
+adl-smoke-x86_64-dom0pvh-hvm-gcc-debug:
+  extends: .adl-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh dom0pvh-hvm 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh dom0pvh-hvm 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-adl-suspend-x86-64-gcc-debug:
-  extends: .adl-x86-64
+adl-suspend-x86_64-gcc-debug:
+  extends: .adl-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh s3 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh s3 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-adl-pci-pv-x86-64-gcc-debug:
-  extends: .adl-x86-64
+adl-pci-pv-x86_64-gcc-debug:
+  extends: .adl-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh pci-pv 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh pci-pv 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-adl-pci-hvm-x86-64-gcc-debug:
-  extends: .adl-x86-64
+adl-pci-hvm-x86_64-gcc-debug:
+  extends: .adl-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh pci-hvm 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-adl-pvshim-x86-64-gcc-debug:
-  extends: .adl-x86-64
+adl-pvshim-x86_64-gcc-debug:
+  extends: .adl-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh pvshim 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh pvshim 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-adl-tools-tests-pv-x86-64-gcc-debug:
-  extends: .adl-x86-64
+adl-tools-tests-pv-x86_64-gcc-debug:
+  extends: .adl-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh tools-tests-pv 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh tools-tests-pv 2>&1 | tee ${LOGFILE}
   artifacts:
     reports:
       junit: tests-junit.xml
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-adl-tools-tests-pvh-x86-64-gcc-debug:
-  extends: .adl-x86-64
+adl-tools-tests-pvh-x86_64-gcc-debug:
+  extends: .adl-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh tools-tests-pvh 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh tools-tests-pvh 2>&1 | tee ${LOGFILE}
   artifacts:
     reports:
       junit: tests-junit.xml
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-kbl-smoke-x86-64-gcc-debug:
-  extends: .kbl-x86-64
+kbl-smoke-x86_64-gcc-debug:
+  extends: .kbl-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh dom0pv 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh dom0pv 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-kbl-smoke-x86-64-dom0pvh-gcc-debug:
-  extends: .kbl-x86-64
+kbl-smoke-x86_64-dom0pvh-gcc-debug:
+  extends: .kbl-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh dom0pvh 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-kbl-smoke-x86-64-dom0pvh-hvm-gcc-debug:
-  extends: .kbl-x86-64
+kbl-smoke-x86_64-dom0pvh-hvm-gcc-debug:
+  extends: .kbl-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh dom0pvh-hvm 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh dom0pvh-hvm 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-kbl-suspend-x86-64-gcc-debug:
-  extends: .kbl-x86-64
+kbl-suspend-x86_64-gcc-debug:
+  extends: .kbl-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh s3 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh s3 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-kbl-pci-pv-x86-64-gcc-debug:
-  extends: .kbl-x86-64
+kbl-pci-pv-x86_64-gcc-debug:
+  extends: .kbl-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh pci-pv 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh pci-pv 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-kbl-pci-hvm-x86-64-gcc-debug:
-  extends: .kbl-x86-64
+kbl-pci-hvm-x86_64-gcc-debug:
+  extends: .kbl-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh pci-hvm 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-kbl-pvshim-x86-64-gcc-debug:
-  extends: .kbl-x86-64
+kbl-pvshim-x86_64-gcc-debug:
+  extends: .kbl-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh pvshim 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh pvshim 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-kbl-tools-tests-pv-x86-64-gcc-debug:
-  extends: .kbl-x86-64
+kbl-tools-tests-pv-x86_64-gcc-debug:
+  extends: .kbl-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh tools-tests-pv 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh tools-tests-pv 2>&1 | tee ${LOGFILE}
   artifacts:
     reports:
       junit: tests-junit.xml
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-kbl-tools-tests-pvh-x86-64-gcc-debug:
-  extends: .kbl-x86-64
+kbl-tools-tests-pvh-x86_64-gcc-debug:
+  extends: .kbl-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh tools-tests-pvh 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh tools-tests-pvh 2>&1 | tee ${LOGFILE}
   artifacts:
     reports:
       junit: tests-junit.xml
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-zen2-smoke-x86-64-gcc-debug:
-  extends: .zen2-x86-64
+zen2-smoke-x86_64-gcc-debug:
+  extends: .zen2-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh dom0pv 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh dom0pv 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-zen2-suspend-x86-64-gcc-debug:
-  extends: .zen2-x86-64
+zen2-suspend-x86_64-gcc-debug:
+  extends: .zen2-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh s3 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh s3 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-zen3p-smoke-x86-64-gcc-debug:
-  extends: .zen3p-x86-64
+zen3p-smoke-x86_64-gcc-debug:
+  extends: .zen3p-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh dom0pv 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh dom0pv 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-zen3p-smoke-x86-64-dom0pvh-gcc-debug:
-  extends: .zen3p-x86-64
+zen3p-smoke-x86_64-dom0pvh-gcc-debug:
+  extends: .zen3p-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh dom0pvh 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-zen3p-smoke-x86-64-dom0pvh-hvm-gcc-debug:
-  extends: .zen3p-x86-64
+zen3p-smoke-x86_64-dom0pvh-hvm-gcc-debug:
+  extends: .zen3p-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh dom0pvh-hvm 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh dom0pvh-hvm 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-zen3p-pci-hvm-x86-64-gcc-debug:
-  extends: .zen3p-x86-64
+zen3p-pci-hvm-x86_64-gcc-debug:
+  extends: .zen3p-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh pci-hvm 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-zen3p-pvshim-x86-64-gcc-debug:
-  extends: .zen3p-x86-64
+zen3p-pvshim-x86_64-gcc-debug:
+  extends: .zen3p-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh pvshim 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh pvshim 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-zen3p-tools-tests-pv-x86-64-gcc-debug:
-  extends: .zen3p-x86-64
+zen3p-tools-tests-pv-x86_64-gcc-debug:
+  extends: .zen3p-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh tools-tests-pv 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh tools-tests-pv 2>&1 | tee ${LOGFILE}
   artifacts:
     reports:
       junit: tests-junit.xml
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
-zen3p-tools-tests-pvh-x86-64-gcc-debug:
-  extends: .zen3p-x86-64
+zen3p-tools-tests-pvh-x86_64-gcc-debug:
+  extends: .zen3p-x86_64
   script:
-    - ./automation/scripts/qubes-x86-64.sh tools-tests-pvh 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86_64.sh tools-tests-pvh 2>&1 | tee ${LOGFILE}
   artifacts:
     reports:
       junit: tests-junit.xml
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
 qemu-smoke-dom0-arm64-gcc:
@@ -649,54 +649,54 @@ qemu-smoke-dom0less-arm32-gcc-debug-earlyprintk:
     - debian-12-arm32-gcc-debug-earlyprintk
 
 qemu-alpine-x86_64-gcc:
-  extends: .qemu-x86-64
+  extends: .qemu-x86_64
   script:
     - ./automation/scripts/qemu-alpine-x86_64.sh 2>&1 | tee ${LOGFILE}
   needs:
-    - *x86-64-test-needs
+    - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc
 
-qemu-smoke-x86-64-gcc:
-  extends: .qemu-smoke-x86-64
+qemu-smoke-x86_64-gcc:
+  extends: .qemu-smoke-x86_64
   script:
-    - ./automation/scripts/qemu-xtf.sh x86-64 pv64 example 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qemu-xtf.sh x86_64 pv64 example 2>&1 | tee ${LOGFILE}
   needs:
     - debian-13-x86_64-gcc-debug
 
-qemu-smoke-x86-64-clang:
-  extends: .qemu-smoke-x86-64
+qemu-smoke-x86_64-clang:
+  extends: .qemu-smoke-x86_64
   script:
-    - ./automation/scripts/qemu-xtf.sh x86-64 pv64 example 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qemu-xtf.sh x86_64 pv64 example 2>&1 | tee ${LOGFILE}
   needs:
     - debian-13-x86_64-clang-debug
 
-qemu-smoke-x86-64-gcc-pvh:
-  extends: .qemu-smoke-x86-64
+qemu-smoke-x86_64-gcc-pvh:
+  extends: .qemu-smoke-x86_64
   script:
-    - ./automation/scripts/qemu-xtf.sh x86-64 hvm64 example 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qemu-xtf.sh x86_64 hvm64 example 2>&1 | tee ${LOGFILE}
   needs:
     - debian-13-x86_64-gcc-debug
 
-qemu-smoke-x86-64-clang-pvh:
-  extends: .qemu-smoke-x86-64
+qemu-smoke-x86_64-clang-pvh:
+  extends: .qemu-smoke-x86_64
   script:
-    - ./automation/scripts/qemu-xtf.sh x86-64 hvm64 example 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qemu-xtf.sh x86_64 hvm64 example 2>&1 | tee ${LOGFILE}
   needs:
     - debian-13-x86_64-clang-debug
 
-qemu-smoke-x86-64-gcc-efi:
-  extends: .qemu-smoke-x86-64
+qemu-smoke-x86_64-gcc-efi:
+  extends: .qemu-smoke-x86_64
   script:
-    - ./automation/scripts/qemu-xtf.sh x86-64-efi pv64 example 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qemu-xtf.sh x86_64-efi pv64 example 2>&1 | tee ${LOGFILE}
   needs:
     - debian-13-x86_64-gcc-debug
 
 qemu-xtf-argo-x86_64-gcc-debug:
-  extends: .qemu-smoke-x86-64
+  extends: .qemu-smoke-x86_64
   variables:
     TEST_TIMEOUT_OVERRIDE: 60
   script:
-    - ./automation/scripts/qemu-xtf.sh x86-64 pv64 argo 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qemu-xtf.sh x86_64 pv64 argo 2>&1 | tee ${LOGFILE}
   needs:
     - alpine-3.24-x86_64-gcc-debug
 
diff --git a/automation/scripts/include/configs/xtf-x86-64-config b/automation/scripts/include/configs/xtf-x86_64-config
similarity index 100%
rename from automation/scripts/include/configs/xtf-x86-64-config
rename to automation/scripts/include/configs/xtf-x86_64-config
diff --git a/automation/scripts/include/configs/xtf-x86-64-efi-config b/automation/scripts/include/configs/xtf-x86_64-efi-config
similarity index 100%
rename from automation/scripts/include/configs/xtf-x86-64-efi-config
rename to automation/scripts/include/configs/xtf-x86_64-efi-config
diff --git a/automation/scripts/include/xtf-x86-64 b/automation/scripts/include/xtf-x86_64
similarity index 100%
rename from automation/scripts/include/xtf-x86-64
rename to automation/scripts/include/xtf-x86_64
diff --git a/automation/scripts/include/xtf-x86-64-efi b/automation/scripts/include/xtf-x86_64-efi
similarity index 100%
rename from automation/scripts/include/xtf-x86-64-efi
rename to automation/scripts/include/xtf-x86_64-efi
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86_64.sh
similarity index 100%
rename from automation/scripts/qubes-x86-64.sh
rename to automation/scripts/qubes-x86_64.sh
-- 
2.39.5


