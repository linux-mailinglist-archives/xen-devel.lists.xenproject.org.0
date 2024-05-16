Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2978C8C7042
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 04:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722778.1127084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Qky-0000co-Cm; Thu, 16 May 2024 02:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722778.1127084; Thu, 16 May 2024 02:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Qky-0000aF-A4; Thu, 16 May 2024 02:22:08 +0000
Received: by outflank-mailman (input) for mailman id 722778;
 Thu, 16 May 2024 02:22:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t9d+=MT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1s7Qkx-0000Zq-Gz
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 02:22:07 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16c4c973-132b-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 04:22:06 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-79305314956so11837585a.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 19:22:06 -0700 (PDT)
Received: from shine.lan
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a32e640233sm47296986d6.5.2024.05.15.19.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 19:22:03 -0700 (PDT)
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
X-Inumbo-ID: 16c4c973-132b-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715826124; x=1716430924; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+LlVXVnOsbp9AhquhYqJUISTf8i2JBzvpJscD8RA+R4=;
        b=NLQV/fRVQbP+idHvsmD/PsLUCtHd4smLff1fhNvZJ1mEuG2j8CS/rY9eQQxFglFlxW
         mUZiOureGv8me2DcJ5xQYOjPGgrN4fHza8+j1MJYAv63lC3W6nVuiJfTDzN2IVymhzaM
         DM+hYyg+Qu6ozxxjHmlKQXXEdM0rtMuqf0bh8iKt6inLDnff2aZx+EhFPLHaNMUTgXJh
         ZySUyJfH7lQHk8urg4mlZzl4v6KAc2CpE+am+qwdzYDs2iVRTW4XDEPTFBy/wy11LbKa
         gnLtzb25pjpghXyCiYvHwjNz8OludhUN7yG+TqdUxLXAgsHWZGuJglRaUJ996vq4fTGH
         DLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715826124; x=1716430924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LlVXVnOsbp9AhquhYqJUISTf8i2JBzvpJscD8RA+R4=;
        b=jFLdSks89EnDdCTWMeLWyp72yK29fxrXmCtHYdPxhnzK13320XkVBtEYcL+Z5zwWZO
         E1V54iiD9nDWKKOqRNgRS6RdzM2ClqFs/VZSTWxrEalT28kR7XV7U5MmPmOYnn2urLrq
         5LyhJJnfBnfyGgsqDXbo/VfBc1odTjzOmfkWp4oSQwAtGrRyQQr5HcYygXZIsJcAlybn
         jSvpmqTJvMXK06IgF7+jWVfee5oiTEzej/rF8b+HU5kC7jjCBiVdvXVi6/rsygf7gmtV
         3ndHC1+wl8smAMcmBA7+8kYLWNqk5BIZpRYaN7RGduYtdCkHyWzTeEWOHerJv8Zz+cpI
         8Ilw==
X-Gm-Message-State: AOJu0Yy55yVsSNiLoEhZuok59r3X0vqOGQMsX5aeepGmFfra57Qqh9vF
	SQCPO9k8qCjubk/FNvzJZIU0FoqxFZRTECKrk9Jvjj6OQkla+x3rC0KfwA==
X-Google-Smtp-Source: AGHT+IGm4UkkoJyHu/MIRkY0KnFaw1Je1nQ+WJBSgRfsD8C9T0DAVqGpScorH3s07/4R6N1nc2noDg==
X-Received: by 2002:a05:6214:3bc2:b0:6a0:7df4:90b8 with SMTP id 6a1803df08f44-6a1681db1b5mr194253356d6.35.1715826124317;
        Wed, 15 May 2024 19:22:04 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH] CHANGELOG: Mention libxl blktap/tapback support
Date: Wed, 15 May 2024 22:21:53 -0400
Message-Id: <20240516022153.5008-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Andryuk <jason.andryuk@amd.com>

From: Jason Andryuk <jason.andryuk@amd.com>

Add entry for backendtype=tap support in libxl.  blktap needs some
changes to work with libxl, which haven't been merged.  They are
available from this PR: https://github.com/xapi-project/blktap/pull/394

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c43c45d8d4..438e307253 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -23,6 +23,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      for IPIs and Physical addressing mode for external interrupts.
  - Add a new 9pfs backend running as a daemon in dom0. First user is
    Xenstore-stubdom now being able to support full Xenstore trace capability.
+ - libxl support for backendtype=tap with tapback.
 
 ### Removed
 - caml-stubdom.  It hasn't built since 2014, was pinned to Ocaml 4.02, and has
-- 
2.40.1


