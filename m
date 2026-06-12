Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZW3GKNORLGoBTAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 01:10:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5081D67D019
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 01:10:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=gBVZ1GUD;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1337051.1598716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYB0F-0002Cg-RR; Fri, 12 Jun 2026 23:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337051.1598716; Fri, 12 Jun 2026 23:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYB0F-00028S-M6; Fri, 12 Jun 2026 23:09:31 +0000
Received: by outflank-mailman (input) for mailman id 1337051;
 Fri, 12 Jun 2026 23:09:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wYB0E-0001mu-Ax
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 23:09:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYB0D-00HIs8-O7
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 01:09:29 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c91a7-5cb7-0a2a0a5109dd-0a2a45098b92-2
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 01:09:29 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c91a9-2497-0a2a45090019-d155802dc002-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 01:09:29 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490c1915793so12536025e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:09:29 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0d28sm10035907f8f.20.2026.06.12.16.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 16:09:28 -0700 (PDT)
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
        d=citrix.com; s=google; t=1781305769; x=1781910569; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9f8AM+tsFx7VUeIRhpy35Zn5mtNfQ2vEL4QF0LSn/Hk=;
        b=gBVZ1GUDE1eULvlgNBoZBsEp9EHW8ZZVKYIrdOHdfkVqjFIKqXkldSWYe+kJBhtqAL
         7jPNULD243vm99avT3QDuFe7KyL3XObGkMDKbBdKs9C3raWQvigLRHXS+4xSWsmchRWz
         vjkn+XBj9NzBDyYGZ9D4djkkxXTcQblNI9330=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781305769; x=1781910569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9f8AM+tsFx7VUeIRhpy35Zn5mtNfQ2vEL4QF0LSn/Hk=;
        b=N9Kdj5b8bgWuMWlkFOMErhshHB2M6KB06icSHhpfrHuiu+c0ipWUkpAjMT3H3hwEam
         XpDlTEHxGjBgAnlEvNd4XQzMlhWuNZWqGFoI9mMvBJq++/muObgzNoEXzWbuLJNv7lVz
         CvkdJH96vGe3BT4fL4EPx3oZxDZX6NBLJgMz2DX7he/hM6RbTtsNhK0NdvKTOboNEidb
         t331iPSZkHMKROBYweUKBO3NbGVQ6e3CqmRv1LlPjvJeujpsniplEWHXwqFx/ZwAqVIS
         Uh3BtfO9bVM6+UzmWfIwu6FWJqqGUCTmW3Ywg1vL0oLEROZaJNQQ9oBHP8vnL15Xhu50
         IGLQ==
X-Gm-Message-State: AOJu0Yz8w8s+y31gzWxmQaWD/aVoaPHIaK3sp222VbDke7ihd1KeWfDh
	fZq02axkCnH/kFH72fHuiVU+yyiLczhDqcJmBXxVeNU67xen626W9agrMzSAVwos/gft6OJutUN
	Al6co
X-Gm-Gg: Acq92OFLom6Wz74CQXhRjnCuzbxumTfMaM65le122eAvvo26nXHylXcIzkLf1Xe2f5b
	qzWMIVHVvuR9oTT0DU0qjM/8jyxHDxeyr0KZDumBG4XRgseeGuWoTGHpSyMQP1AQjhWC++tke0+
	jlKVD+u303zidAUYEmQaSm6BBgzAKZv8frHQG6SmMR+hkUO2fUFpJ+VylrNOCFtVv8JVwigRBSI
	1JoaDe1pVNX6b1cGiDhs9Dcn3KoYc4cI5JyLV1NplsLzspVD7kZJc0ntVHMGW6KZKh+Dbp3HfRD
	MaVdweLQPiEaqzakTTApDWWu6L34AVhz5zQ11JCelKBpoXzRPyqhh9JBab27SA2QK4RxlVfwY8y
	u7c8yTdVUy2MnW9mYVIz4VBzSNqrkDov7RZqnJZB7YCsCoDTzwAR+/fra67Y2ia5w08dNUL1ilY
	bx8InwU8wGp+puPX+OP/EXImw/0hBkHML7FyLpBGQWKvwKRifpyZOh+0cvg085JzuMkg/qfAoLA
	3PX
X-Received: by 2002:a05:600c:c107:b0:490:e196:eaee with SMTP id 5b1f17b1804b1-490ec509c52mr69174555e9.10.1781305769100;
        Fri, 12 Jun 2026 16:09:29 -0700 (PDT)
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
Subject: [PATCH 3/7] CI: Introduce new qubes-hw-runner.dockerfile
Date: Sat, 13 Jun 2026 00:09:20 +0100
Message-Id: <20260612230924.3181154-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
References: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1781305769-8816CA53-0008AE5E/10/63158204843
X-purgate-type: spam
X-purgate-size: 2351
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,vates.tech:email];
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
X-Rspamd-Queue-Id: 5081D67D019

This container is tied to gitlab-runner environment in the RPis driving the
test systems, not a specific version of Alpine.  Intentionally give it a
generic name so it need not change in the future.

Switch to Alpine 3.24 right away, as it doesn't interact with the 3.18 builds
under test.

The container needs to remain a root container.  By no longer using the
arm64v8 build container for dual-purpose, we can finally make the build
containers be non-root.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Posted previously, part of the prior CI series.
---
 .../build/alpine/qubes-hw-runner.dockerfile   | 21 +++++++++++++++++++
 automation/gitlab-ci/test.yaml                |  2 +-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 automation/build/alpine/qubes-hw-runner.dockerfile

diff --git a/automation/build/alpine/qubes-hw-runner.dockerfile b/automation/build/alpine/qubes-hw-runner.dockerfile
new file mode 100644
index 000000000000..8b111648721d
--- /dev/null
+++ b/automation/build/alpine/qubes-hw-runner.dockerfile
@@ -0,0 +1,21 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/arm64/v8 alpine:3.24
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+RUN apk --no-cache add bash
+
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    DEPS=(
+          expect
+          openssh-client
+    )
+
+    apk add --no-cache "${DEPS[@]}"
+EOF
+
+USER root
+WORKDIR /build
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 89760b24e63a..70bb4bbb3b45 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -145,7 +145,7 @@
   extends: .test-jobs-common
   variables:
     # the test controller runs on RPi4
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:qubes-hw-runner
     LOGFILE: smoke-test.log
     PCIDEV: "03:00.0"
     PCIDEV_INTR: "MSI-X"
-- 
2.39.5


