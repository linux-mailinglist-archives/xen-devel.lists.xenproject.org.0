Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ioyuM27gImrTegEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 16:42:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E967648F0D
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 16:42:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=NbI0fW+K;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1329559.1593661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVVkj-0001mF-5I; Fri, 05 Jun 2026 14:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329559.1593661; Fri, 05 Jun 2026 14:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVVkj-0001id-1d; Fri, 05 Jun 2026 14:42:29 +0000
Received: by outflank-mailman (input) for mailman id 1329559;
 Fri, 05 Jun 2026 14:42:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVVkh-0001Xd-7A
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 14:42:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVVkg-00DUvd-D4
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 16:42:26 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a22e02e-5cb7-0a2a0a5109dd-0a2a4506a73e-48
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 16:42:26 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a22e052-7371-0a2a45060019-d155dd2ca9fa-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 16:42:26 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-45ee5cdbd28so1931761f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 07:42:26 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f3444fesm27983183f8f.20.2026.06.05.07.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 07:42:24 -0700 (PDT)
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
        d=citrix.com; s=google; t=1780670546; x=1781275346; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZlz51O0t73OlCkZ0qZkry3ZqTRl8BuEeVV/fnWcWO4=;
        b=NbI0fW+KuHBa177EAHlWfoXH9ZKzXB52JROWW0ycVHVC2xwVAEJizizkTubvWcl5R3
         SsizimqGl4tviz3+61HjJpHlA8hIlH1zzjPOKEGlTjS/C4lr6z3EjIPeVD6GjXE9LBd0
         6y/8V/HnmTbckODi1sg//EqVsgSgc/ckWDtiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780670546; x=1781275346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LZlz51O0t73OlCkZ0qZkry3ZqTRl8BuEeVV/fnWcWO4=;
        b=Tlef6lfQBHH4244VOlM8NHPeY+d+c9fwpADjAjzE7ItGOeNrcwH63BFLxr90hguojZ
         T++9sK8xDJWMCJa35l242Pm3EtgJOx+ZotGHW/5et05Dl5FIDTzQSzNIN3WVS7Eh1r8Q
         kdM/UNCxQEx+jl1LIINdI7XTtJFDDEZaRctfDfbAJjYPFQ4MrsyCqqvW7rszANufF5rc
         ZnEJLWEUED25ieiA887xdTwSlPywYbarD0TJ/I+ne5Kb/YXqhicLousajwmHUWyDK/c6
         MQWl0KD8zFa1YH7/cKPbfrTgrCJFHzMEKORjoj3S5cFgrqjRBM0XULN251IwLytD4G+m
         jx7g==
X-Gm-Message-State: AOJu0Yz8enwoQcQDPRZ3OIgVLmo/MtYlcXziPNtCJQqXRVu2dfTchaV4
	cmmm6M0AFdVo3BKoLmxi07yBk9aPVnHfUvrktuPkDfOnHINei/HXH1jlsUgoXVuG6UCjP48NEYV
	GW7IO
X-Gm-Gg: Acq92OFgoY200nrz5V6JoTQ2/GSsyEv3+/L0U/x4hnW+hz7iE3vlxUxQ3DU5AzKcqOr
	cgYKt1HKpHxKkPHZE0pxdfrWpUVn6GRoUPI2IMk+A+HQt+WmI5aMVjehieJcOL5dqIaOGMeaZxC
	Y+VfqlKnVFSLDkM/zFlEdX3LQu4HL3Prq7FeQb9pAGtAt4AGpLNdUOXoWBF+BAiTW28yd7xUH+B
	jgwhC0R6ufeHJOPxzwtJJLqV7gJnDwOfF16tMJ6j0h8h121GWQPUiNh6NfcRB6vKfTSjp+CkAT6
	dorMjS4qhvU0Fu/pxjuMm2p33O/WUzyrPWWYpN6JNJXPckbLUF5VvA8jeK1daziRCZbS7/675V2
	2W3Z46eSYhq6S9z+i/u2wpLGNiZpUjPZIqtxHz7NYuQNCFrhHcheGiWNaIK7jlAIdnVpNldpUsL
	TqdAEyowOs/MvrNsdNkUnKGa2IV/3u4M6IlgwRxCXoHgt2tK8l+2DeAs95c89feYTGdU1B3lnLX
	bdtwf9IPvI9fNpsGIIoARPnHw==
X-Received: by 2002:a05:6000:2994:10b0:45e:8edc:dacc with SMTP id ffacd0b85a97d-46032dcf608mr3670650f8f.27.1780670545208;
        Fri, 05 Jun 2026 07:42:25 -0700 (PDT)
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
Subject: [PATCH 6/6] CI: Update Opensuse 15.6 to 16.0
Date: Fri,  5 Jun 2026 15:42:13 +0100
Message-Id: <20260605144213.2749656-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260605144213.2749656-1-andrew.cooper3@citrix.com>
References: <20260605144213.2749656-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1780670546-8576FD75-42794E0E/10/63158204843
X-purgate-type: spam
X-purgate-size: 3694
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,amd.com:email,vates.tech:email,cardoe.com:email,xenproject.org:email];
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
X-Rspamd-Queue-Id: 7E967648F0D

The default version of python is 3.13, so drop the 3.11 overrides.

Swap yajl for json-c, given the deprecation of the former.

bin86/dev86 are no longer available.

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
 ...64.dockerfile => leap-16.0-x86_64.dockerfile} | 16 ++++++----------
 automation/gitlab-ci/build.yaml                  | 16 ++++++++--------
 2 files changed, 14 insertions(+), 18 deletions(-)
 rename automation/build/opensuse/{leap-15.6-x86_64.dockerfile => leap-16.0-x86_64.dockerfile} (84%)

diff --git a/automation/build/opensuse/leap-15.6-x86_64.dockerfile b/automation/build/opensuse/leap-16.0-x86_64.dockerfile
similarity index 84%
rename from automation/build/opensuse/leap-15.6-x86_64.dockerfile
rename to automation/build/opensuse/leap-16.0-x86_64.dockerfile
index 33db3ecd634b..f88866bb8740 100644
--- a/automation/build/opensuse/leap-15.6-x86_64.dockerfile
+++ b/automation/build/opensuse/leap-16.0-x86_64.dockerfile
@@ -1,9 +1,8 @@
 # syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 opensuse/leap:15.6
+FROM --platform=linux/amd64 opensuse/leap:16.0
 LABEL maintainer.name="The Xen Project"
 LABEL maintainer.email="xen-devel@lists.xenproject.org"
 
-ENV PYTHON=python3.11
 ENV XEN_TARGET_ARCH=x86_64
 
 RUN <<EOF
@@ -26,7 +25,7 @@ RUN <<EOF
         gawk
         gcc
         make
-        python311
+        python3
 
         # Tools (general)
         cpio
@@ -46,17 +45,14 @@ RUN <<EOF
         acpica
         # libxl
         'pkgconfig(uuid)'
-        'pkgconfig(yajl)'
-        # RomBIOS
-        bin86
-        dev86
+        'pkgconfig(json-c)'
         # Header Check
         gcc-c++
         # xentop
         'pkgconfig(ncurses)'
         # Python bindings
-        python311-devel
-        python311-setuptools
+        python3-devel
+        python3-setuptools
         # Ocaml bindings/oxenstored
         ocaml
         ocaml-findlib
@@ -70,7 +66,7 @@ RUN <<EOF
         ninja
         'pkgconfig(glib-2.0)'
         'pkgconfig(pixman-1)'
-        python311-packaging
+        python3-packaging
     )
 
     zypper install -y --no-recommends "${DEPS[@]}"
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 061977872f5b..acd4acf13138 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -677,25 +677,25 @@ ubuntu-26.04-x86_64-gcc-debug:
   variables:
     CONTAINER: ubuntu:26.04-x86_64
 
-opensuse-leap-15.6-clang:
+opensuse-leap-16.0-clang:
   extends: .clang-x86-64-build
   variables:
-    CONTAINER: opensuse:leap-15.6-x86_64
+    CONTAINER: opensuse:leap-16.0-x86_64
 
-opensuse-leap-15.6-clang-debug:
+opensuse-leap-16.0-clang-debug:
   extends: .clang-x86-64-build-debug
   variables:
-    CONTAINER: opensuse:leap-15.6-x86_64
+    CONTAINER: opensuse:leap-16.0-x86_64
 
-opensuse-leap-15.6-gcc:
+opensuse-leap-16.0-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: opensuse:leap-15.6-x86_64
+    CONTAINER: opensuse:leap-16.0-x86_64
 
-opensuse-leap-15.6-gcc-debug:
+opensuse-leap-16.0-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: opensuse:leap-15.6-x86_64
+    CONTAINER: opensuse:leap-16.0-x86_64
 
 opensuse-tumbleweed-clang:
   extends: .clang-x86-64-build
-- 
2.39.5


