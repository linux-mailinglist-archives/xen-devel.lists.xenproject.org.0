Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CBC87EE48
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:00:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694970.1084457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGLB-0005lx-4h; Mon, 18 Mar 2024 17:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694970.1084457; Mon, 18 Mar 2024 17:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGLB-0005jo-1L; Mon, 18 Mar 2024 17:00:01 +0000
Received: by outflank-mailman (input) for mailman id 694970;
 Mon, 18 Mar 2024 17:00:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHe-0002gq-ML
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:22 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 707d6999-e548-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:56:18 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41412411622so7208055e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:18 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:17 -0700 (PDT)
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
X-Inumbo-ID: 707d6999-e548-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780978; x=1711385778; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lK2cvliT/wP/P+dntCPCcmtTOpkXUdusD9n6Lp67sAk=;
        b=tW3C9f30kdt60lR85/Am5g4IJvgOtwUMgxtW3HxkSCrVDqxiS1fL3SdRPWYpUx8BQJ
         w8iMNpwOxXy1WC5aLbl68W046fIFTwHYb9up60tqSKvy1hQKLp6Dj3aEX1E6LWTPkDpe
         dnq8Afhk7dBuxeF6YwdM/Xp5EAagIpKXOYGy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780978; x=1711385778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lK2cvliT/wP/P+dntCPCcmtTOpkXUdusD9n6Lp67sAk=;
        b=NFsdnL0Sna9GLYsLXiH4oev/w+40O30M0SubH8hJqSSVK11hb8OQwU2MCv0QhrNhER
         yzgV2503KqKm34cfL7fPNcro0o3JIUwq7aAGx8Cc/sLOgUiiH6o0P8yLV1tXKlwdqz/Y
         a5aJdP4U0ApGqGLFLVN12G+wVHTqQ12PgJsj6mkDmwXTN5IV9VTx1CA94n4XRkdeikQq
         xfOvqIQZEoRsJ9UhezQYT3S1QDxz1Fvu19wAANUZKfpvrOkZq0uGwpRouu0pXz8UykPY
         kQY0eX0CPks82dtbtnQnjBFKNFSDx+TIX8YYyJh+kdwRFglsY62qHYxLcUgdeObF2a4s
         FXSA==
X-Gm-Message-State: AOJu0YwCoTR2dFm+Kt+pCh9igngas1ikJ2zRL3q9Nih5kcmOCCVt2TVC
	/+lGw+8bFu05a7x0Lp2vdeWadShzuvcSt4v20sxpn6ZG59QQpQdPODvqhFZyvbtO0kI/U8lxxX2
	c
X-Google-Smtp-Source: AGHT+IFPTCcS1tWzDisEsT1f0NHG2uvx3CWNDZzxVre6NX5O2l2B7vmONi9UUzvm02FKWwJeRPV7Hw==
X-Received: by 2002:a05:600c:35cd:b0:413:286c:4fcf with SMTP id r13-20020a05600c35cd00b00413286c4fcfmr8561862wmq.32.1710780977800;
        Mon, 18 Mar 2024 09:56:17 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 31/36] ts-debian-*-install: Replace dots in hostnames by dashs
Date: Mon, 18 Mar 2024 16:55:40 +0000
Message-Id: <20240318165545.3898-32-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running ./ts-debian-di-install, hostname on the command line is
interpreted by the debian installer. As the installer find it to be a
FQDN, it uses part of the hostname as the domain, thus overwriting the
value from the DHCP and from d-i netcfg/get_domain setting (maybe).

But the result is that /etc/resolv.conf contains "search
bookworm.guest.osstest" and can't find an IP for "cache". So the
installation fails.

Also replace ".guest.osstest" in a few other places, even if it
may not be an issue.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ts-debian-di-install  | 4 ++--
 ts-debian-hvm-install | 2 +-
 ts-debian-install     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/ts-debian-di-install b/ts-debian-di-install
index d84407cf..06c7e1f4 100755
--- a/ts-debian-di-install
+++ b/ts-debian-di-install
@@ -68,8 +68,8 @@ our $ram_mb= $r{arch} =~ m/^armhf/ ? 768 : 2048;
 our $disk_mb= 10000;
 
 our $guesthost= $gn.
-    ($r{"${gn}_suite"} ? ".".$r{"${gn}_suite"} : "").
-    ".guest.osstest";
+    ($r{"${gn}_suite"} ? "-".$r{"${gn}_suite"} : "").
+    "-guest-osstest";
 our $gho;
 
 sub prep () {
diff --git a/ts-debian-hvm-install b/ts-debian-hvm-install
index 60c95b37..99e9acae 100755
--- a/ts-debian-hvm-install
+++ b/ts-debian-hvm-install
@@ -46,7 +46,7 @@ our $ho= selecthost($whhost);
 our $ram_mb;
 our $disk_mb= 10000;
 
-our $guesthost= "$gn.guest.osstest";
+our $guesthost= "$gn-guest-osstest";
 our $gho;
 
 our ($kernel, $ramdisk);
diff --git a/ts-debian-install b/ts-debian-install
index a737bec9..62db487a 100755
--- a/ts-debian-install
+++ b/ts-debian-install
@@ -34,7 +34,7 @@ our $ram_mb=    512;
 our $swap_mb=  1000;
 our $disk_mb= 10000;
 
-our $guesthost= "$gn.guest.osstest";
+our $guesthost= "$gn-guest-osstest";
 our $gho;
 
 sub prep () {
-- 
Anthony PERARD


