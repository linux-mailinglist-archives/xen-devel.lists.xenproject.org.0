Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB4BB22D91
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 18:30:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078917.1439942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulrsu-0005bj-BA; Tue, 12 Aug 2025 16:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078917.1439942; Tue, 12 Aug 2025 16:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulrsu-0005Zc-8h; Tue, 12 Aug 2025 16:30:00 +0000
Received: by outflank-mailman (input) for mailman id 1078917;
 Tue, 12 Aug 2025 16:29:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BkKW=2Y=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ulrss-0005ZW-QC
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 16:29:58 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 935490e1-7799-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 18:29:53 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-459eb4ae596so52370815e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 09:29:53 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5879d76sm325530775e9.24.2025.08.12.09.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 09:29:52 -0700 (PDT)
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
X-Inumbo-ID: 935490e1-7799-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755016193; x=1755620993; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DygpHkHCAWXEXJ0qnm84vWIJZfgiN67CPoChrR+iPFo=;
        b=deBJ/HpFKxfXLcGRTfqTnDdCJDNILhvo76sQWVtJrSA1hkFNs0HEUy2WsPDqWmQQIW
         h/TK5wad/vnIlh24iFYs55r1a2xeLw/6zpEUI7hmgPZgwgQkKcxnOMHtFz1I/g8ctFKZ
         sGm7vG49BzdBf/Ii1vP8xWxGEfakfxxbuZmS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755016193; x=1755620993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DygpHkHCAWXEXJ0qnm84vWIJZfgiN67CPoChrR+iPFo=;
        b=LbnsYWF3Hr0W2vuR9Hu/AaSrpMGnhf19oD3tWJIKk/0NFOgSLdr8rXyPadxuEs/ani
         oZy2WEDfSuOv94tbk1INRf540sGDSiENwkXXrzPhkvSrzNst6k4WbyhdynjoLrmmerqL
         tqDdvqZ8FKDLrt8WAeEY8S78tF2TF9T6RkFx4KnRP4DcisRcsD3dfOvdT1DADkxci4aJ
         G5HLRAeVY6WTjEwJHeuY+1ke5WgFZL3ztII6GBre9OWu/5u469Vx+TSv5enwQih2hCnR
         dgwK8RUEW6fljAgEEcb2h8KKfsDyRPxx03Xl81pBLMlPFPd7r3X3OllGQ2VoJKsqsqX+
         956Q==
X-Gm-Message-State: AOJu0YxhiOdAepEhUlV9Oec8o0PQRO3hKRaD8YELG+JMegiwwO47Cdwa
	0so3yeuLWoZvsukdxOpr/10s8rfn1UpRDXTGW61UWk4ZBhvO401k5vQSJl2Ufk+pP+X9DhGXVgL
	F9VB/P18=
X-Gm-Gg: ASbGncsUlSK91/aNZEe1+gZk/If6/ZVufXC0BFXn0rBWBQpqb5o6Ol8Gt+3Jymqqcmd
	7BDKHU3f3rLk3reNnXm4q0IFc+oS6suMWA1q5LKwzNt8hntNgXbmcvZokQPnHr+iqlgVHHU/sIM
	pnJNY0DLr6kVh6pNvljajAsFAFKswjCDKM1LkLkEBqm7wbisiizpiEVehglPnXUxB3ThFuWKJVM
	er/YuF45+QtHv21LIrZGTwbeEl5W1ZR61uhj8+16mQHEHSQK6HjZDEscxagaswrrkNmJErGe31M
	58qq16Q12qQQqdDp/CBwCr0XHLaE1UQOqqW6QnSGFHN95UtnrPTovft2WYfC+Kb7/kAM82VfI0o
	wH5HxCh/cuIidCsCPRO4ylBMxBF2uv6WbbFSam9Q3KtO0TXPGtseq+/atfWtXsK9LuDHIf8bhZU
	Ha
X-Google-Smtp-Source: AGHT+IFmDfvir2qjc9ospiCh7zAn+em9I2TqJPmRvwOrpBpEoxRJ6xPEfZNlbLYBr3GhhlULJqnFxA==
X-Received: by 2002:a05:600c:3ba7:b0:459:d8c2:80b2 with SMTP id 5b1f17b1804b1-45a15b0bc9amr4137825e9.7.1755016192673;
        Tue, 12 Aug 2025 09:29:52 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Javi Merino <javi.merino@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] CI: Turn debian/12-x86_64 into a non-root container
Date: Tue, 12 Aug 2025 17:29:50 +0100
Message-Id: <20250812162950.1903901-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Javi Merino <javi.merino@cloud.com>

Since commit 4611ae6fb8f9 ("CI: save toolstack artifact as cpio.gz"), the
various automation/scripts/* no longer need to be root to correctly repack the
initrd for test.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Anthony PERARD <anthony.perard@vates.tech>

Xen 4.20 and later uses debian:12-x86_64 and also contains 4611ae6fb8f9 so
this is safe to change generally.
---
 automation/build/debian/12-x86_64.dockerfile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/automation/build/debian/12-x86_64.dockerfile b/automation/build/debian/12-x86_64.dockerfile
index e26a19079e38..3cf99c730b61 100644
--- a/automation/build/debian/12-x86_64.dockerfile
+++ b/automation/build/debian/12-x86_64.dockerfile
@@ -9,6 +9,8 @@ RUN <<EOF
 #!/bin/bash
     set -eu
 
+    useradd --create-home user
+
     apt-get update
 
     DEPS=(
@@ -70,5 +72,5 @@ RUN <<EOF
     rm -rf /var/lib/apt/lists*
 EOF
 
-USER root
+USER user
 WORKDIR /build
-- 
2.39.5


