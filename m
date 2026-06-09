Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7i1eIe9NKGqdBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 19:31:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC29662F98
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 19:31:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=jnl18aJG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1333727.1596909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX0IA-000484-RF; Tue, 09 Jun 2026 17:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333727.1596909; Tue, 09 Jun 2026 17:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX0IA-00043s-NL; Tue, 09 Jun 2026 17:31:10 +0000
Received: by outflank-mailman (input) for mailman id 1333727;
 Tue, 09 Jun 2026 17:31:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wX0I9-0003pe-Cg
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:31:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wX0I8-005CfS-PD
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 19:31:08 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a284dd2-5cb7-0a2a0a5109dd-0a2a45029f1e-20
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 19:31:08 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a284ddc-af86-0a2a45020019-d155802bdd4b-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 19:31:08 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490d1e54b3bso21260295e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:31:08 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351ac0sm113509696f8f.27.2026.06.09.10.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 10:31:07 -0700 (PDT)
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
        d=citrix.com; s=google; t=1781026268; x=1781631068; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaVpHtkT0XSlUk2rDGpamTLWDkRogaQpIZrdOR6KAfE=;
        b=jnl18aJGBa/my6FnXRAM8MUoOjy528yp/PAyLFC/vnJ275tnVIrMpvhJw+0DRbJeHu
         0lCQp0/osWM0zjKKLY52X9yMhcLoQ8/hDWNUBoL293ht7iwIzdxKutLa1QgxI3g0kO1i
         1TcLHOvSJuyyeeGvlhO8zCGp61zL8YJwjH98Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026268; x=1781631068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uaVpHtkT0XSlUk2rDGpamTLWDkRogaQpIZrdOR6KAfE=;
        b=EZStuvT0NNdlANUH2/ex3QSiyY0+HECUZTKyVMLnCDoLQWiBayg7QN1Hr4k+bgMmao
         Vmx/5ofrXYMYVTD2FFa8E7Rb/0Lbj5s/+JJkJx5JgFEjeVCBS5ODw8+TcsArzhkCeTor
         sJxwzshFjlHZlPyG1VbmxC5YWosls/o3ojAR4BQuYXObH6ALPhghEKK3ad+iGcM+KOO9
         Z0SkK+eACJUL34q4uxr6gegZKTs3m/w02je/rO5jt2dhnXSLdZBTMRp6gXrYs6g1EzyI
         4NYy3pqh5C47lDDEGr3GdUskOcT8+8cw5XpnaOUsqPeHHAffV8stQgnPTmgfnd3Y3xtH
         saYQ==
X-Gm-Message-State: AOJu0Yze86t4x5xzgd0gE1F/+m4Ncb+vciHqwk6RqVAYqX9Tcj+dsCCA
	OUMATx02m603r7cHvZvSH0067U61Y8wxiPQWe5xwYPYqzmGhwxbBCRV0QCB4UItq+PUZkPQ9x77
	HVJbQ
X-Gm-Gg: Acq92OFmKx3CJXBpHgruodHwU37j26EpkDPgVkrZe7Kp2SyS9cFbC8/0XTfjUydWRMA
	W8XbFK0Z9RbyS+uLKnkeo2BzBm0bhrjRc7LQtz8+qx2iPnHkYTfcpXEWWUgXF+Hwg6vQZ8KL8LU
	dg2ZZXPKcX7votticy3+GT6uwR1fJwxgymnubjAsan5Xti5RFSsb6nWIshIhxKWzLxdtkIKSwGm
	+rvRcv2o72DknCbn10i/ApdM66/95g/AoAvwrYG7R0iCFBtcAiwfNFstIamwJ9Vj0AY9+Ls9Rgg
	rMY1G8Qd2FglFvO++xC1+YsBhJomFiKnyqWK8mUfqtm02Xr/o2G/k+FeyxutxM7buYJYVFknplM
	1W76s3mQNlImIV2V72mxyCo0RoQ7ZN079pxnnsBBznqqq+QMNK9DBubTMTP3Ya7HDzaiqkaTdh4
	H3eG/co7faCZfks1uq3NQHTfekue4v/0vI4yHAAN2mGT2PMjNGwRXJLragl8kBrGY9K3EGRsgLU
	MBLbZ401gAPclQ=
X-Received: by 2002:a05:600c:8183:b0:490:958c:46dc with SMTP id 5b1f17b1804b1-490c25b0a60mr316999875e9.17.1781026268063;
        Tue, 09 Jun 2026 10:31:08 -0700 (PDT)
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
Subject: [PATCH 3/4] CI: Introduce new qubes-hw-runner.dockerfile
Date: Tue,  9 Jun 2026 18:31:01 +0100
Message-Id: <20260609173102.2908514-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260609173102.2908514-1-andrew.cooper3@citrix.com>
References: <20260609173102.2908514-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1781026268-81D77161-E648CE47/10/63158204843
X-purgate-type: spam
X-purgate-size: 2429
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,kernel.org,amd.com,cardoe.com,invisiblethingslab.com,gmail.com];
	TO_DN_ALL(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:email,xenproject.org:email,cardoe.com:email,invisiblethingslab.com:email];
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
X-Rspamd-Queue-Id: CCC29662F98

We want to make the build containers be non-root, but the hardware runner
needs to continue being root.  Split it out into a dedicated container.
Intentionally give it a generic name so it need not change in the future.

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

I need to backport this patch to all trees (4.18 and later) before
alpine:3.18-arm64v8 can be converted to be be non-root.

In all other cases we've been renaming the containers to bypass this problem,
but alpine:3.18-arm64v8 is in the correct new form.

Alternatively, I could see about combining it with the Alpine update (which is
long overdue and needs doing).
---
 .../build/alpine/qubes-hw-runner.dockerfile   | 21 +++++++++++++++++++
 automation/gitlab-ci/test.yaml                |  2 +-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 automation/build/alpine/qubes-hw-runner.dockerfile

diff --git a/automation/build/alpine/qubes-hw-runner.dockerfile b/automation/build/alpine/qubes-hw-runner.dockerfile
new file mode 100644
index 000000000000..0af17c6aabc6
--- /dev/null
+++ b/automation/build/alpine/qubes-hw-runner.dockerfile
@@ -0,0 +1,21 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/arm64/v8 alpine:3.18
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


