Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 617D787EE81
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695060.1084613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGVr-0001c8-Jt; Mon, 18 Mar 2024 17:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695060.1084613; Mon, 18 Mar 2024 17:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGVr-0001ZN-GA; Mon, 18 Mar 2024 17:11:03 +0000
Received: by outflank-mailman (input) for mailman id 695060;
 Mon, 18 Mar 2024 17:11:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHj-0002gq-NK
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:27 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 724c0068-e548-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:56:21 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-413f76fcf41so33704655e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:21 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:20 -0700 (PDT)
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
X-Inumbo-ID: 724c0068-e548-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780981; x=1711385781; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sfVt8Xg23JpHHAPGe+eT+E0bwcscFUgALb2j8zZ/sQ=;
        b=M37dCuSMZTmRJh6f3u3SFKEzJPGbjvQg9Oj5X3bc0/6UTGnLDHsuIcWpM+EwxhPCSc
         PH/Laz8oE5ZQGzDE1IECLkajDO/JktHbuvcehMy+eV7fvXJgysVsn2HQJ0DikRxMB3Ir
         QeBcCtjmCDHrjusqMo24upertDPE/idlC8Rug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780981; x=1711385781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sfVt8Xg23JpHHAPGe+eT+E0bwcscFUgALb2j8zZ/sQ=;
        b=Of3i9shqpgc2vPuXJCc/6PP9MECT5PjcVwAqGx/2F41yfqR6AbCxKl5hqYeLoOfPp2
         1DbB3LVkx/SnlOvId8PDwPyK6cmEHK3QO5vY+zAeaRwE6gV054TnBY2e27ecVxfXqgt6
         sNzZrQLSrg2+a07gvGTFCwW7YrEzD/VCW/rY7mkLPojrbFzrkiW4S4QR3DrrmeO4w/jJ
         rZNUHval4OirIBSc89aWzloqGbm5VgrYYc7E5wZLesqDYzXfvMSCnOdwV8YM62p3zZi7
         VejHBvz16HxYttqv6mGh6xRltJH0NnAWPnt67/DdqctxD+Ue1YwM2B2pnvmkttiRATnV
         FHWQ==
X-Gm-Message-State: AOJu0YyplUZJg+hwFvF3IFsLYzbNJg5fpAvXC6VweEjP2iy3bgUvzAX8
	tcvVXwNPRcO17ZnkcY3dl64rn7YR8NWBvjqm6wcH9yWc3Ic3n5VtEShG+2eCtp743Q2R+nwJs/8
	Q
X-Google-Smtp-Source: AGHT+IEMiO/AgdmTkpOqiPg6/8IU763h7xjEO1zx085zwYqqGt7cc1QJOnPJDF+WPxzm9Tujczh2FQ==
X-Received: by 2002:a05:600c:5490:b0:414:846:4469 with SMTP id iv16-20020a05600c549000b0041408464469mr7010wmb.38.1710780980802;
        Mon, 18 Mar 2024 09:56:20 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 35/36] Switch to Debian Bookworm as default suite
Date: Mon, 18 Mar 2024 16:55:44 +0000
Message-Id: <20240318165545.3898-36-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen 4.17 doesn't build with Debian Bookworm. It fails to build
IPXE/etherboot, on "amd64". So we keep using Debian Buster on Xen 4.18
and earlier branches. Xen 4.18 builds 4.17 via job "build-amd64-prev".

Xen 4.17 would needs 18a36b4a9b08 ("tools: ipxe: update for fixing
build with GCC12") which is only in Xen 4.18.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Osstest.pm  | 2 +-
 make-flight | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/Osstest.pm b/Osstest.pm
index a559ca4e..9ac2dc5c 100644
--- a/Osstest.pm
+++ b/Osstest.pm
@@ -87,7 +87,7 @@ our %c = qw(
 
     Images images
 
-    DebianSuite buster
+    DebianSuite bookworm
     DebianMirrorSubpath debian
 
     TestHostKeypairPath id_rsa_osstest
diff --git a/make-flight b/make-flight
index 6e88cb13..0b528629 100755
--- a/make-flight
+++ b/make-flight
@@ -43,17 +43,13 @@ case "$xenbranch" in
   xen-4.3-testing) defsuite="wheezy"; defguestsuite="wheezy";;
   xen-4.9-testing)  defsuite="stretch"; defguestsuite="stretch";;
   xen-4.10-testing) defsuite="stretch"; defguestsuite="stretch";;
+  xen-4.1[1-8]-testing) defsuite="buster"; defguestsuite="buster";;
   *)
     defsuite=`getconfig DebianSuite`
     defguestsuite=`getconfig GuestDebianSuite`
     ;;
 esac
 
-# QEMU doesn't build on buster anymore, use bookworm for it.
-case "$branch" in
-    qemu-mainline) defsuite="bookworm" ;;
-esac
-
 # Pick default Debian Installer version to correspond to the chosen
 # suite.
 if [ -z "$defdi_version" ] ; then
-- 
Anthony PERARD


