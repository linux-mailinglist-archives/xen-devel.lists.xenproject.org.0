Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F8489B408
	for <lists+xen-devel@lfdr.de>; Sun,  7 Apr 2024 22:50:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701685.1096037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtZSw-0006KR-Eb; Sun, 07 Apr 2024 20:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701685.1096037; Sun, 07 Apr 2024 20:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtZSw-0006Hq-B9; Sun, 07 Apr 2024 20:50:14 +0000
Received: by outflank-mailman (input) for mailman id 701685;
 Sun, 07 Apr 2024 20:50:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CRZ/=LM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rtZSu-00060u-7h
 for xen-devel@lists.xenproject.org; Sun, 07 Apr 2024 20:50:12 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cc60001-f520-11ee-afe6-a90da7624cb6;
 Sun, 07 Apr 2024 22:50:11 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-78d61097b43so72429585a.2
 for <xen-devel@lists.xenproject.org>; Sun, 07 Apr 2024 13:50:11 -0700 (PDT)
Received: from shine.lan
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 op3-20020a05620a534300b0078a593b54e6sm2512745qkn.96.2024.04.07.13.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 13:50:09 -0700 (PDT)
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
X-Inumbo-ID: 6cc60001-f520-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712523010; x=1713127810; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9H+mU0bLmZTRtNgxQVgRCM+6MXvTvK1Onu3sx791QI=;
        b=W/tk6lgd0bpcFlogxU0c+j58pe1reo1bvCwjztZLd6f+967waoZGdLPXgBekH4Dag+
         sczs48ywsiOaSJBMN+1B2Q7qHvsIoT2GP1kds/sJlp8ImpvTMQ51jO3FAY2/1Rwq8gz9
         TzuyQsNo1GSu2jEq+EA9XpkpJVyYSh8K2lizTYOHlP1+nXpLOcwcuFpEwHxul8tqM5qW
         F8B1C1glBERQh3PQpfUuR/8/phwxHAl3yimGXNFAbeiyL1aVQczPGdC4Y0uII+xYH4Gm
         a/rO3h6Zy4ZTRk8hKk4HC2IT/UhDbq7MilBFvP70uug4syZI981n9KN4EscVNbH8D0XR
         PbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712523010; x=1713127810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9H+mU0bLmZTRtNgxQVgRCM+6MXvTvK1Onu3sx791QI=;
        b=GSBUrYx7ggX8ZkB0n9eyI7Gp7eq+Cadc73vigZ+ugHBVdBKRtmCvRPpOtG2tidLSst
         edxCQAxBODpg6ovv470vIb3jK8B7gf5VDCEnE/zSWQVIAxzmKMk/kFeNmKTyG/x5sbjE
         5MuzLSZXZIB9pgU6h4vk8zwmUwtn6GnfR5lRk5gXTAQ09uZ39xJRmZVnClH1RThxn4po
         6Vsy38AI9XbHdV31ld1fdu+2xB+Dc8o6uSTpEVhTtBK6M/3gSX5yow9F97DifhZ8WLZo
         BjCzfJQ/n6d4lZa2vFQsiD+YVGGzQ2aryX4uh8+vOwceEQ8gXkXIAympumTEFytbQLVY
         bxgw==
X-Gm-Message-State: AOJu0Yzg0luQECms0+ocqgE/fQiWJ9FsQHFjdLgNXlAr4EO6+sjDdL8w
	FmIlHI6n/pfYwG175fl2nuVRbFoh3A0B0aw3FAnPh37aS5N9xgWI3aucBg+S
X-Google-Smtp-Source: AGHT+IHcns52DCC0jjOr+gA6C8H/QKjEfs7rBKTpCr/3hXX/JmLDxjiPsumMGa7TEzNKUlNe/d/KcQ==
X-Received: by 2002:a05:620a:4092:b0:78d:33f2:c165 with SMTP id f18-20020a05620a409200b0078d33f2c165mr9041350qko.49.1712523009832;
        Sun, 07 Apr 2024 13:50:09 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 3/3] CHANGELOG: Mention libxl blktap/tapback support
Date: Sun,  7 Apr 2024 16:49:53 -0400
Message-Id: <20240407204953.60442-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240407204953.60442-1-jandryuk@gmail.com>
References: <20240407204953.60442-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Andryuk <jason.andryuk@amd.com>

Add entry for backendtype=tap support in libxl.  blktap needs some
changes to work with libxl, which haven't been merged.  They are
available from this PR: https://github.com/xapi-project/blktap/pull/394

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8041cfb7d2..036328433d 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -21,6 +21,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      for IPIs and Physical addressing mode for external interrupts.
  - Add a new 9pfs backend running as a daemon in dom0. First user is
    Xenstore-stubdom now being able to support full Xenstore trace capability.
+ - libxl support for backendtype=tap with tapback.
 
 ### Removed
 - caml-stubdom.  It hasn't built since 2014, was pinned to Ocaml 4.02, and has
-- 
2.39.2


