Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XsX9AG7gImrQegEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 16:42:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A61A3648EFA
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 16:42:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=PPL3yOFC;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1329558.1593651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVVkg-0001SB-Kx; Fri, 05 Jun 2026 14:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329558.1593651; Fri, 05 Jun 2026 14:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVVkg-0001QS-Gx; Fri, 05 Jun 2026 14:42:26 +0000
Received: by outflank-mailman (input) for mailman id 1329558;
 Fri, 05 Jun 2026 14:42:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVVkf-0000zx-1R
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 14:42:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVVke-00E0r2-An
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 16:42:24 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a22e03d-2eae-0a2a0a5409dd-0a2a450c8d14-30
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 16:42:24 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a22e050-62f1-0a2a450c0019-d1558035bcf2-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 16:42:24 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490b4e1ade7so21898635e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 07:42:24 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f3444fesm27983183f8f.20.2026.06.05.07.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 07:42:22 -0700 (PDT)
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
        d=citrix.com; s=google; t=1780670544; x=1781275344; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Imr40tIWzjtp7/WEsCHL96//Q/hvgqYPNPpF2o2oPkk=;
        b=PPL3yOFCkFZS3u8DJCYH4jpSd9dQy7PGMVWgUVah3U/tH/eLdgkwuAUUU9bF/8yDEZ
         kDKi8BC5scvBW1UNSXkSgNWT9ZHKYGNC+dmveVhWYlS999drf8u2O7HawG0kTLtaLUqm
         lG3omwq/BFsa+cxGueGYZq2zWw3/1gxcuFeTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780670544; x=1781275344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Imr40tIWzjtp7/WEsCHL96//Q/hvgqYPNPpF2o2oPkk=;
        b=k6dllhz/J9IqEMkI6IQSUmFawJLPfl5Npa4tntGMOJh70CBdAirEP5/835NNe3qKIB
         RwDqmAWEJQluCnlXHxvsR0GrmzRZl9FhtSqBT3d3LIhhY6vwYcqwZFx+JzksjF4XYyIt
         jc68fOzoWmR3yqTtrk0smJD+5kM234yZwEXQ444nu2/ccSm7OwLzeoyN3j0I/wpnOWM9
         40M6JlVkEqkmSqROIbApxTbfV4kAqPlwQN7/59isLAuvyuAxhFIhwoNLPbfaNIy2P0WL
         d/Wk4ZuScy3PWjDMGkoSavxNwcu6YSMqHfXxmkMQgXhztIKt/eQxkhot+8VVvNI446nM
         bk+g==
X-Gm-Message-State: AOJu0YylGi7vyCZJ+TLX412Q3zP7CSeMvhMCh91ZPvOWdJo5OP+GNu3G
	rzuH9REQTyKYFHRzzL7T80WDABx/PNKjFOtVbjXyJjTe5M4mJ53qXFXUBxxftoafimD02ZSGoxq
	iLfJG
X-Gm-Gg: Acq92OEpZ05d6a3qfS/Fzqke33LB5o/UcBzz79S4sZIN68D/DvWtG2pc8DvJZe0fSoY
	4gIX8g+9wec41zqgGaSqcx3O9uHsQ8sEtDRl2zpyxHRBjgL93thDHVBxflGcJ3lBMOiWhLqHPkJ
	LLNqg/MDEhKYqvtKFUStM/oPzHCZZLjwZPVrdfGoqCzo59K/kokm6oxiFEZ9j18cPAU8X1fMc+w
	ADJLViJZorcE2KZjMBBOy/TFVYN0iRVX4tAnKL65ZrE/gJFZ/vYnjHOWy2MD7QDWaa+DxVROPy3
	gWi6a8dMIprg6qmv6o7BQyPJN7sIhvOp8vzWny9TkqRQp+o/WCl5YhtzmAPqkKp8DqYv+IjWqMy
	q29Yhcw9LeJrhOIT0TleTBYI5dO21Y1w+/yofT9T+8EkMtYUTSKfc2XNCd9KCuO9ZuRnJYx6+kB
	/MDg/ZrXlcvuzWQsxVldGYzowqSEbGDNWGmUBBWZoSIkrUm7rcHLIDfvxWncGB1XabYa2n4xAHQ
	0ffQO84Db1v/fjuUTBBAB6/zg==
X-Received: by 2002:a05:600c:3153:b0:490:b8c0:d46a with SMTP id 5b1f17b1804b1-490c2604790mr63419865e9.22.1780670543616;
        Fri, 05 Jun 2026 07:42:23 -0700 (PDT)
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
Subject: [PATCH 5/6] CI: Update Fedora to 43
Date: Fri,  5 Jun 2026 15:42:12 +0100
Message-Id: <20260605144213.2749656-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260605144213.2749656-1-andrew.cooper3@citrix.com>
References: <20260605144213.2749656-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1780670544-E3F7ACF5-F76269E8/10/63158204843
X-purgate-type: spam
X-purgate-size: 2265
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,amd.com:email,xenproject.org:email,cardoe.com:email,suse.com:email];
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
X-Rspamd-Queue-Id: A61A3648EFA

Swap yajl for json-c, given the deprecation of the former.

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
 .../fedora/{41-x86_64.dockerfile => 43-x86_64.dockerfile} | 4 ++--
 automation/gitlab-ci/build.yaml                           | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename automation/build/fedora/{41-x86_64.dockerfile => 43-x86_64.dockerfile} (95%)

diff --git a/automation/build/fedora/41-x86_64.dockerfile b/automation/build/fedora/43-x86_64.dockerfile
similarity index 95%
rename from automation/build/fedora/41-x86_64.dockerfile
rename to automation/build/fedora/43-x86_64.dockerfile
index e33329aedc9e..b748ef09cf3c 100644
--- a/automation/build/fedora/41-x86_64.dockerfile
+++ b/automation/build/fedora/43-x86_64.dockerfile
@@ -1,5 +1,5 @@
 # syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 fedora:41
+FROM --platform=linux/amd64 fedora:43
 LABEL maintainer.name="The Xen Project"
 LABEL maintainer.email="xen-devel@lists.xenproject.org"
 
@@ -41,7 +41,7 @@ RUN <<EOF
         acpica-tools
         # libxl
         libuuid-devel
-        yajl-devel
+        json-c-devel
         # xen-foreign
         diffutils
         # RomBIOS
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 6d27cc8eb613..061977872f5b 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -607,15 +607,15 @@ debian-13-x86_32-gcc-debug:
   variables:
     CONTAINER: debian:13-x86_32
 
-fedora-41-x86_64-gcc:
+fedora-43-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: fedora:41-x86_64
+    CONTAINER: fedora:43-x86_64
 
-fedora-41-x86_64-gcc-debug:
+fedora-43-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: fedora:41-x86_64
+    CONTAINER: fedora:43-x86_64
 
 ubuntu-18.04-x86_64-gcc:
   extends: .gcc-x86-64-build
-- 
2.39.5


