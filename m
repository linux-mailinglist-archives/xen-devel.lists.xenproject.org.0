Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3953CB515D5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 13:35:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118155.1464070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwJ5i-0006UI-Af; Wed, 10 Sep 2025 11:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118155.1464070; Wed, 10 Sep 2025 11:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwJ5i-0006So-7e; Wed, 10 Sep 2025 11:34:22 +0000
Received: by outflank-mailman (input) for mailman id 1118155;
 Wed, 10 Sep 2025 11:34:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kMwI=3V=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwJ5g-0006Si-Kw
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 11:34:20 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 170fd537-8e3a-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 13:34:19 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3df2f4aedc7so3808957f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 04:34:19 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e752238832sm6343296f8f.31.2025.09.10.04.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 04:34:18 -0700 (PDT)
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
X-Inumbo-ID: 170fd537-8e3a-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757504059; x=1758108859; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j6+nn9UIr1kZR9BUz4wxS+TIl8oWXnDTOsT/TpLgGVU=;
        b=ApR4q8gW//nLJ2gW4KN2jPq13220Rom+2qrqcAN+V2LnSCZKpwLB4YYNezOf6klzCz
         OmHG2nX2gbUsKfCmK6x4uj9+rjB+EtImbYRaqtYy9WtvSR8qA1eshhkgrnxOndZJ6jjA
         SqzD7kFkfFyjh8AAyNyoRuyeqZB4nc6Xd8gYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757504059; x=1758108859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6+nn9UIr1kZR9BUz4wxS+TIl8oWXnDTOsT/TpLgGVU=;
        b=H7wEA+747TNlHvU9UorE6dTYMxupdaZelxqVQkhfkF88wM8zPXaAVQE0ND3h5z811R
         EMrJ4+TsJEhIfb9nZ+F6meqrNqU4k/KZlanTKAL03HPEm4ymX97OonBfoRCc+stWW/zT
         8zqRlvqKdZ/G2mwRf232GCx5Wo/rW1IDnw213vk99a+sEjKfPgWRxSYCymrs0hbJ7Zuf
         Suqg4v8nPysRwvSkpdSNYG+PQL+UKyriKQnHfsmgcIfa9CWY82xTcUezWSJdySVWypqM
         EZZLQ/IiOJjxPpQl2mELafpZVoTKfd42rL2fjgQ6e/0i1bN823JiGb2/OUDlYdTPe98V
         nhQw==
X-Gm-Message-State: AOJu0Ywz0EZ1y0K03bsubk4T+1clZCI4Yd24ZarnwB2Shtk666yviVjH
	8xpYyc8c9UUyp5HEG028vync895mQhtybdtP13Nt+Pg9Sok8nULA3ijukLS/wJ9NtdTjZMsoSh3
	8LtM/
X-Gm-Gg: ASbGncs1THVjkhxSTW3349h4+EDyPsvwVgSNkeG+dhxDGfcAkFrVhLjMJpRc+ja7NHs
	Wbbiyy5GB7xmT+JNgq7dwYrrx9JQKz5PGjpFR6kae4Ru13nMOSLWIF0V9QGOmtfFSQFOig2gHC4
	cJi/vZ3AFvj1gq8Kj5qXIPIufVsYlNx0TP1FyA986Ik+ZdrTgxrwb/HA74OtFhokcSPv4i86+r7
	6xFoucRS5cflodkgwC+bhJWeIhj73L5CDAoT1nD7EfBF6JLQfCIO0ueKedxMvwPQlbXXQ3QFrJI
	OyBcOUFzUpPU+H0pa7uzagIrGLM/6JYJpMJyeJgoOKkcbJO/NmAvPd3VSw+zQegGg6A1aDLnLW8
	u6WhzK4t8wQl/tamK8EK5zCSVvqsbLeblGtTEgFRycypntpuZRkQO5bxnm1Lq017HZ8S6Tg/KF1
	jrHHIhPaG17Vk=
X-Google-Smtp-Source: AGHT+IFIyERCIsO1mNcq6O6MZm9Fk5DxT0mcYLDk29QHvYrnzM7migljfZFkUPnIHU+XPBwztjETBQ==
X-Received: by 2002:a05:6000:420f:b0:3d9:70cc:6dd2 with SMTP id ffacd0b85a97d-3e64317eee0mr10039762f8f.40.1757504058633;
        Wed, 10 Sep 2025 04:34:18 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH] CI: Switch the alpine containers to be non-root
Date: Wed, 10 Sep 2025 12:34:16 +0100
Message-Id: <20250910113416.1835988-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Testing on staging-4.19 is hitting a reliable failure, caused by alpine/3.18
being a root build container, but debian/12-x86_64 being a non-root test
container.  Specifically, the test container can't copy XEN_PAGING_DIR and
XEN_DUMP_DIR (both 700) from the build root in order to construct the initrd.

staging-4.20 and later do not repack the initrd in this way, so are not
affected.

Switch both alpine containers to being non-root.  This is still slightly
fragile, but better than depending on using root containers for both.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Jan Beulich <JBeulich@suse.com>

The only less fragile option I can think of would be to backport the initrd
CPIO optimisations.  I backported it from 4.21 to 4.20, and can't remember if
there was a blocking reason on 4.19, or simply that it would be a lot of work.

I've rebuilt these containers in registry.gitlab.com/xen-project/people/andyhhp/xen

Runs using this registry:
  staging:
    https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2031831044
  staging-4.19:
    https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2031832855

(There will be a delay until these can run fully.  The CPPCheck container
takes an unreasonable amount of time to rebuild, and it's holding up a couple
of others.)
---
 automation/build/alpine/3.18-arm64v8.dockerfile | 16 ++++++++--------
 automation/build/alpine/3.18.dockerfile         | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/automation/build/alpine/3.18-arm64v8.dockerfile b/automation/build/alpine/3.18-arm64v8.dockerfile
index b8482d5bf43f..360da8281054 100644
--- a/automation/build/alpine/3.18-arm64v8.dockerfile
+++ b/automation/build/alpine/3.18-arm64v8.dockerfile
@@ -3,13 +3,10 @@ FROM --platform=linux/arm64/v8 alpine:3.18
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-# build depends
-RUN apk --no-cache add \
+RUN adduser -S user && \
+  mkdir /build && \
+  # build depends
+  apk --no-cache add \
   \
   # xen build deps
   argp-standalone \
@@ -48,4 +45,7 @@ RUN apk --no-cache add \
   # qubes test deps
   openssh-client \
   fakeroot \
-  expect \
+  expect
+
+USER user
+WORKDIR /build
diff --git a/automation/build/alpine/3.18.dockerfile b/automation/build/alpine/3.18.dockerfile
index 263e9e90d888..4ccbe8e5c1b3 100644
--- a/automation/build/alpine/3.18.dockerfile
+++ b/automation/build/alpine/3.18.dockerfile
@@ -3,13 +3,10 @@ FROM --platform=linux/amd64 alpine:3.18
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-# build depends
-RUN apk --no-cache add \
+RUN adduser -S user && \
+  mkdir /build && \
+  # build depends
+  apk --no-cache add \
   \
   # xen build deps
   argp-standalone \
@@ -49,4 +46,7 @@ RUN apk --no-cache add \
   ninja \
   pixman-dev \
   # livepatch-tools deps
-  elfutils-dev \
+  elfutils-dev
+
+USER user
+WORKDIR /build
-- 
2.39.5


