Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A596BCF9D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 13:37:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510568.788444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmr2-0002ou-Lg; Thu, 16 Mar 2023 12:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510568.788444; Thu, 16 Mar 2023 12:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmr2-0002nB-IW; Thu, 16 Mar 2023 12:37:12 +0000
Received: by outflank-mailman (input) for mailman id 510568;
 Thu, 16 Mar 2023 12:37:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zc16=7I=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pcmr1-0002n1-HK
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 12:37:11 +0000
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [2607:f8b0:4864:20::e33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 451220eb-c3f7-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 13:37:10 +0100 (CET)
Received: by mail-vs1-xe33.google.com with SMTP id x14so1342912vso.9
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 05:37:10 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:d4ec:4b3b:b86d])
 by smtp.gmail.com with ESMTPSA id
 j188-20020a3787c5000000b0074382b756c2sm5784451qkd.14.2023.03.16.05.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 05:37:08 -0700 (PDT)
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
X-Inumbo-ID: 451220eb-c3f7-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678970229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PpSriz9yauI72B0VsHuy0AGl6vDdBX4GDPk+xPJcAsk=;
        b=PVQ1fXaof9kYNIO0ogxfKB7bsrzKzRS4I1dyR8b1YgKRsPDdXh+VDzhtpw+4YtfbTO
         Iwh36pmTMJ4rNNNvziF/wCkePL6NDvSDf79NzsIw3DvxsnkF5u1/5mmU1nLbnYCExoYE
         jaVgt1mG3bKOKTG+a/2gvXmyDRoGyOu0vvGaOUTFdk8gIGkKT5pNCrS1sqkg9uPoAoPH
         39DstJmR0q9baP10ktDPipfCm1TbfjkNEqXqP2JFJ9ijNsNpaGsXQtBsnL4RVyuZ8n2d
         /ngzEs162FPceNgaIoe7AxaKVD4/YAyQ+ZZrYrkFJd0v/hPPxa+pK97Wys6QLPsXCfqC
         AqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678970229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpSriz9yauI72B0VsHuy0AGl6vDdBX4GDPk+xPJcAsk=;
        b=Nkw2JTSpnHdYVdFNYrSPkLHT2Dr1ffCe53rEzpJ3vrc4wMlj5ySZWnCrNDeqQWsGkB
         qxYK0UUrZ/u52voTn2v3HIDFkHHCTCecEOG+tcsuHiVo7jkG4an3aQXk+Nq0nL26ITZn
         4MszwYNrguXDrn0U3WyJoqp5eK9c6MIu439Q4M66WIYnSbsdrMHifjWAO4Q6dttkJq+0
         h1A2msYP9Fo/0N9DFlTFnWu+wnXR58Qgwl2qZDXxxbLK6mhXk7HwymIDM5zGEKIx5xtG
         TGB0hnZOB4hxAqrk16h2dlUOSEQ7EcgIbs/xLKqbc50ZuXsA63SD8uWHamuEmLNx9GgC
         f1Nw==
X-Gm-Message-State: AO0yUKVEBlq14XEp618Y4O3OPz33D+s9xZKs21awSZP1epaKmEI+H8tP
	bjE1pbCeZpWjFxXD70LElPXZCWWp6h8=
X-Google-Smtp-Source: AK7set84YfPBqlWCBYK0WInf76xwDhbkyHJ6cOj2Id6pR/RGlSV/0WsDdJRZwYq/MQOV4wZZFT8g0w==
X-Received: by 2002:a05:6102:441f:b0:3fd:5bd:72a with SMTP id df31-20020a056102441f00b003fd05bd072amr26267567vsb.0.1678970229192;
        Thu, 16 Mar 2023 05:37:09 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH] CHANGELOG: Mention xl/libxl SMBIOS support
Date: Thu, 16 Mar 2023 08:36:49 -0400
Message-Id: <20230316123649.8682-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry for the new xl/libxl SMBIOS support.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index b116163b62..c978cfd9b6 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -13,6 +13,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      livelocks, instead of crashing the entire server.
    - Bus-lock detection, used by Xen to mitigate (by rate-limiting) the system
      wide impact of a guest misusing atomic instructions.
+ - xl/libxl can customize SMBIOS strings for HVM guests.
 
 ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
 
-- 
2.39.2


