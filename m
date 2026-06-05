Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J5vkMXLgImrYegEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 16:42:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 466C0648F18
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 16:42:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=MZdTXcHe;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1329555.1593624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVVkd-0000no-Sv; Fri, 05 Jun 2026 14:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329555.1593624; Fri, 05 Jun 2026 14:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVVkd-0000mG-Q5; Fri, 05 Jun 2026 14:42:23 +0000
Received: by outflank-mailman (input) for mailman id 1329555;
 Fri, 05 Jun 2026 14:42:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVVkb-0000ca-Q1
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 14:42:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVVkb-007rPg-6g
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 16:42:21 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a22e044-5cb7-0a2a0a5109dd-0a2a450ac698-20
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 16:42:21 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a22e04c-56b3-0a2a450a0019-d1558029ed4b-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 16:42:20 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so24191315e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 07:42:20 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f3444fesm27983183f8f.20.2026.06.05.07.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 07:42:18 -0700 (PDT)
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
        d=citrix.com; s=google; t=1780670540; x=1781275340; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQEQfqBsSeliopGBCIw5LmeQFTkv0Y/GgRDYWXBZgps=;
        b=MZdTXcHeukN/N/iRasFwrXSfUyuJc2HUspQHYAwQ8lCrpfvdPio3F3n5knpt/zNpq4
         TbwflCj3MTU76CDZLv8NDPynpSLWUloZRuTR1X4SZw2R2vFz31DzducnjzRVqyGIQiZV
         uGStxtJIjbVjPCpDv4uOtKSGknhc6NF62OtYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780670540; x=1781275340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mQEQfqBsSeliopGBCIw5LmeQFTkv0Y/GgRDYWXBZgps=;
        b=E6FiBSvGDOJc1+E3BgfxWjoGjoFs9MMW0fUx6dcZ7WFlLqNe7Ltl+EOh2CBp0nOR4Q
         NkeK86SZRldvaTl0/iVM9Wg+8/OnOCAN7svYJrDzZgCWw8cViF4CFXGqQK2FlZYpS8CD
         MR1JdovEZx0D0f5OwnilpDb0i44K529x+3Z0O3d+985qNkRmqVIC4koE5uFoBEVs/KlI
         E0LvwqatLf84YIEdd2APsoiXwxB2F1CJ3omkvBDw5niCmsoWsx2eDCOcFfQ10eWRAmlE
         Rn+0B/9hxZgEYkRig8GZm7ffchHuZWE4hQc0SnkS5cTC8F89fhzIG5CzvHQGDElk+OgU
         rD6w==
X-Gm-Message-State: AOJu0Yw3iRfer/xgSNtlyqvUGiNgrfgQYlKYP7iUY3kHlh1+xLIP0NK9
	Ut8PiA+lfmYDqr5djtU+VjfrnwQqTUWtb/57Y/+0W4zhbHSp6alGPs9x1uMZbw5As3TbB+IfRot
	/u2kA
X-Gm-Gg: Acq92OFKJa2mkwseMzYicXGZQQubPCob2xV2GpgbY1ipPhyTw0FB+plfj/RMWP1jFH+
	MYWXI0hEzIlToGvbZJazWo0qywXLzKw2UAfShQRM3Ft+/1fC+D2KStslRdM+Oqr9Ut9/mIWvxXI
	Q7Yx2ShhZkWul8xdM7NkqyVMbXV7RxTOrIvhzyG0fBSKJ0lgOhUqTQZN5XwsDtrPQwbMFSf3Q5g
	IfjYfLF9vvjObxOle5HEJVbd+fRmPISdZzw50hRVPGnA5wqvNAc3HUauMDO9Y/+qRmOutKXgIDM
	U4usSrYQ6yFl0obwL+Wo+1AB5fEqf0P+HlDMIB0ey+p/ygip23HxZ4edPIDiYyoJUdRnYMZczfx
	o9ltHfyk/laRaSEMvGjzosSfcfhwHSsk7S0A781HG2DUB/UuBPiKqaXrDOr8VVfUPcN6A41BVv9
	irkfU8fkiVOI3dzsS29xBHgqDDnefloXKe6xY7JXZXnbXh0h0eX0qg3SHpuqwvaUWebC1hMdq7V
	0U4mMD4ll8FwFs=
X-Received: by 2002:a05:600c:358d:b0:490:958f:2a5e with SMTP id 5b1f17b1804b1-490c25b22d7mr71221475e9.13.1780670539833;
        Fri, 05 Jun 2026 07:42:19 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/6] CI: Swap ocaml-nox for ocaml in newer Debian/Ubuntu
Date: Fri,  5 Jun 2026 15:42:09 +0100
Message-Id: <20260605144213.2749656-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260605144213.2749656-1-andrew.cooper3@citrix.com>
References: <20260605144213.2749656-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1780670540-7D1848B7-51E8B651/10/73395122804
X-purgate-type: spam
X-purgate-size: 5304
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
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,kernel.org,amd.com,cardoe.com,suse.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:jgross@suse.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,amd.com:email,suse.com:email,cardoe.com:email];
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
X-Rspamd-Queue-Id: 466C0648F18

Ocaml 4.08 and earlier had the compiler package depend on graphics, and
therefore on X.  Ocaml 4.09 and later dropped this dependency.

Debian and Ubuntu versions with Ocaml 4.08 and earlier (which are Debian
Bullseye/11, and Ubuntu Focal/20.04 and earlier) had ocaml-nox packages with
this dependency stripped, which we use to keep the size of the containers
down.

In newer versions of Debian and Ubuntu, ocaml-nox is just a transitional
package referring back to ocaml.  Ubuntu Resolute/26.04 has finally removed
this transitional package.  For all versions where ocaml-nox is just a
transitional package, swap to the ocaml package.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/build/debian/12-arm64v8.dockerfile   | 2 +-
 automation/build/debian/12-x86_32.dockerfile    | 2 +-
 automation/build/debian/12-x86_64.dockerfile    | 2 +-
 automation/build/debian/13-arm64v8.dockerfile   | 2 +-
 automation/build/debian/13-x86_32.dockerfile    | 2 +-
 automation/build/debian/13-x86_64.dockerfile    | 2 +-
 automation/build/ubuntu/22.04-x86_64.dockerfile | 2 +-
 automation/build/ubuntu/24.04-x86_64.dockerfile | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/automation/build/debian/12-arm64v8.dockerfile b/automation/build/debian/12-arm64v8.dockerfile
index c0e08a010f6a..5cc4de822cc6 100644
--- a/automation/build/debian/12-arm64v8.dockerfile
+++ b/automation/build/debian/12-arm64v8.dockerfile
@@ -46,7 +46,7 @@ RUN <<EOF
         # Golang bindings
         golang-go
         # Ocaml bindings/oxenstored
-        ocaml-nox
+        ocaml
         ocaml-findlib
 
         # for test phase, qemu-* jobs
diff --git a/automation/build/debian/12-x86_32.dockerfile b/automation/build/debian/12-x86_32.dockerfile
index 447152d7e5e4..3457eca78203 100644
--- a/automation/build/debian/12-x86_32.dockerfile
+++ b/automation/build/debian/12-x86_32.dockerfile
@@ -38,7 +38,7 @@ RUN <<EOF
         python3-dev
         python3-setuptools
         # Ocaml bindings/oxenstored
-        ocaml-nox
+        ocaml
         ocaml-findlib
     )
 
diff --git a/automation/build/debian/12-x86_64.dockerfile b/automation/build/debian/12-x86_64.dockerfile
index 4e533ee879fd..afb16f371126 100644
--- a/automation/build/debian/12-x86_64.dockerfile
+++ b/automation/build/debian/12-x86_64.dockerfile
@@ -50,7 +50,7 @@ RUN <<EOF
         # Golang bindings
         golang-go
         # Ocaml bindings/oxenstored
-        ocaml-nox
+        ocaml
         ocaml-findlib
 
         # for test phase, qemu-* jobs
diff --git a/automation/build/debian/13-arm64v8.dockerfile b/automation/build/debian/13-arm64v8.dockerfile
index b9062ee8b443..1a29ad153cea 100644
--- a/automation/build/debian/13-arm64v8.dockerfile
+++ b/automation/build/debian/13-arm64v8.dockerfile
@@ -46,7 +46,7 @@ RUN <<EOF
         # Golang bindings
         golang-go
         # Ocaml bindings/oxenstored
-        ocaml-nox
+        ocaml
         ocaml-findlib
 
         # for test phase, qemu-* jobs
diff --git a/automation/build/debian/13-x86_32.dockerfile b/automation/build/debian/13-x86_32.dockerfile
index 464b4fc55e38..204d3c1e6dd0 100644
--- a/automation/build/debian/13-x86_32.dockerfile
+++ b/automation/build/debian/13-x86_32.dockerfile
@@ -38,7 +38,7 @@ RUN <<EOF
         python3-dev
         python3-setuptools
         # Ocaml bindings/oxenstored
-        ocaml-nox
+        ocaml
         ocaml-findlib
     )
 
diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
index 2c6c9d4a5098..ebf28a69e278 100644
--- a/automation/build/debian/13-x86_64.dockerfile
+++ b/automation/build/debian/13-x86_64.dockerfile
@@ -50,7 +50,7 @@ RUN <<EOF
         # Golang bindings
         golang-go
         # Ocaml bindings/oxenstored
-        ocaml-nox
+        ocaml
         ocaml-findlib
 
         # for test phase, qemu-* jobs
diff --git a/automation/build/ubuntu/22.04-x86_64.dockerfile b/automation/build/ubuntu/22.04-x86_64.dockerfile
index 6ae7f4faa859..47aadc0548ab 100644
--- a/automation/build/ubuntu/22.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/22.04-x86_64.dockerfile
@@ -51,7 +51,7 @@ RUN <<EOF
         python3-dev
         python3-setuptools
         # Ocaml bindings/oxenstored
-        ocaml-nox
+        ocaml
         ocaml-findlib
 
         # Stubdom download/extract
diff --git a/automation/build/ubuntu/24.04-x86_64.dockerfile b/automation/build/ubuntu/24.04-x86_64.dockerfile
index 84777d188c0d..a41632d5cf6c 100644
--- a/automation/build/ubuntu/24.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/24.04-x86_64.dockerfile
@@ -51,7 +51,7 @@ RUN <<EOF
         python3-dev
         python3-setuptools
         # Ocaml bindings/oxenstored
-        ocaml-nox
+        ocaml
         ocaml-findlib
 
         # Stubdom download/extract
-- 
2.39.5


