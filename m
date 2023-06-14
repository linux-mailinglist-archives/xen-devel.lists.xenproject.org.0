Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF32730718
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 20:09:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549192.857611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Uw4-00056T-7J; Wed, 14 Jun 2023 18:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549192.857611; Wed, 14 Jun 2023 18:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Uw4-00053k-3S; Wed, 14 Jun 2023 18:09:36 +0000
Received: by outflank-mailman (input) for mailman id 549192;
 Wed, 14 Jun 2023 18:09:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nA9c=CC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9Uqn-0005LA-IT
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 18:04:09 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db60b4f6-0add-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 20:04:08 +0200 (CEST)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-62fe188255eso5285766d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 11:04:08 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a05621412c500b006262de12a8csm4851613qvv.65.2023.06.14.11.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 11:04:06 -0700 (PDT)
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
X-Inumbo-ID: db60b4f6-0add-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686765847; x=1689357847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXCdosE1xzkZrcu7sJ9kEjSlEgbAAlcqZ3LQutJHGBw=;
        b=JK5vcixb8Wt41QBAZT/fOy/v5bOsxStCpDCeZkSiQ8PB6fNvhaRF7NiKjBtYrfUOoR
         YCNpam/Zb0PPQ8iRsGPUpawZ2URLSYcBIjxA3MPP3DNCGsxwvFJuaGCyrNECYN7BU32j
         hmTtrMmB6y6tswrR737I0CPEaL5T85eglImsljaxHHW2KjcFVLC2Z6GXcvC3wXIcNkn3
         JBHtcr9W0TlWXh2nbgrLD1gegF0/BVptSf/eSPWcSEt4c1iqHrBSjFpEXPolSNbanyU1
         RTHUKgOJS8N0iFj2LKzAxMKwmwoM9XrhSioFRtl+60uYO8zNMZ764S0hhzWHZfdkbdJd
         XW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765847; x=1689357847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXCdosE1xzkZrcu7sJ9kEjSlEgbAAlcqZ3LQutJHGBw=;
        b=MS+VH31r5vnoifUKzF3RpdWbOSzL6MN1fV53PhCXg9msFTQOOqEg44uiVNQ2ZZwT0K
         f1yLLa4BtzSSliZQ7YafE05jqlUpbJWrAZ2zhR6nIsrSTsygzEsaitQsMS3yBdlIRIci
         0zZRxYdvTJ8RuvpKsn9JcSRmKV6YYeGnyg3EO+BuInhz4A+tDVVFdcP3SfgN2G9Ccb6q
         1j4YuVgoz3S7MtBe9Abn+5C5zhcFvyyS4HDQQaFVcUwwXl3exzplV0AbTP84AK4pfe9N
         yGnqEMgZuxBHs0ovQoKEkz1gEOZe69Ae6PeVl2+d7wwGWHiVsXl6EyAb3OGTVJDNRiQg
         4n1A==
X-Gm-Message-State: AC+VfDxGJLGk2psHqR0AIiH9FJVLA3iPWVqL/+z8d2253wV5yReOliC6
	gsD5Km5Cj5g3S/valWToORNWIFfSkXE=
X-Google-Smtp-Source: ACHHUZ46Tf7BnAy/jyT3co960LbUrB7XqzZxSw0x0mXK2jOrH69DJNsDWu7WWv6LxF6h+BEQn0xopw==
X-Received: by 2002:a05:6214:27ee:b0:62d:ed66:7ad1 with SMTP id jt14-20020a05621427ee00b0062ded667ad1mr2251672qvb.28.1686765846844;
        Wed, 14 Jun 2023 11:04:06 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v4 15/15] CHANGELOG: Add Intel HWP entry
Date: Wed, 14 Jun 2023 14:02:53 -0400
Message-Id: <20230614180253.89958-16-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614180253.89958-1-jandryuk@gmail.com>
References: <20230614180253.89958-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Henry Wang <Henry.Wang@arm.com>
---
v3:
Position under existing Added section
Add Henry's Ack

v2:
Add blank line
---
 CHANGELOG.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7d7e0590f8..8d6e6c3088 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -24,7 +24,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - xl/libxl can customize SMBIOS strings for HVM guests.
  - Add support for AVX512-FP16 on x86.
  - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
-
+ - Add Intel Hardware P-States (HWP) cpufreq driver.
 
 ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
 
-- 
2.40.1


