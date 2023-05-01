Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE5B6F3851
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:40:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528216.821149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZNV-0007Of-BS; Mon, 01 May 2023 19:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528216.821149; Mon, 01 May 2023 19:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZNV-0007II-3C; Mon, 01 May 2023 19:40:05 +0000
Received: by outflank-mailman (input) for mailman id 528216;
 Mon, 01 May 2023 19:40:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lARM=AW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ptZF7-0000m4-8s
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:31:25 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1497016-e856-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 21:31:23 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-74e1745356dso122713385a.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:31:23 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d6-20020ac80606000000b003bf9f9f1844sm9351784qth.71.2023.05.01.12.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:31:20 -0700 (PDT)
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
X-Inumbo-ID: c1497016-e856-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969481; x=1685561481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Y4+dyjBVr8IC4wKpAH33RVK4Uwk38u6mRfHXdnUc88=;
        b=El+j9CYH92/VkKvU0xX/iezFblXzbQBrsLh2hY6wa/mKGGMU40Uw1TuWpMCuy0pgxJ
         5j25wvX86m18bmSl4JWCZOcYJgk4pkihBGHshqS6ZFUQ3VIwp5N3Sx3TYb8/S1ZWaUXX
         gi9MXhzcIjciT/IIbb4Y2gqBo4BOTJvuvt1CgX8wloUt0Cha3xzpy4q068L65lQYB+0O
         goNpAjrDRmeJjVeFBsddApKCxJ5eMSmOy5WS24SN7q1UKc5j3TwAvJKKYLQod5Fyz23R
         p0iYFyedNbgM2llrYVboI5n03letvmTsNNr+ABaInQsOGR85gbcJJeGWwNcalW1N833h
         C7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969481; x=1685561481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Y4+dyjBVr8IC4wKpAH33RVK4Uwk38u6mRfHXdnUc88=;
        b=cQEWzQZcnc3tyGx2ESF2u1OO5bHyg7fA220AhbA1id46OJ1SZnzdWq8bncFcmOEOXJ
         SY73NsjvdjD2G+uSabkXcTmQYMeh+g+MsPxIAWSQLgxa/RDhxBc+gfZ9iDH369VRACT/
         5Qn8KPOAWV5o8y+OlYWcPGLVqn9g8h/R9hO6DpJ6Wve2jcNs89byEcPsGHKOO3/C7imO
         LNJHu0JRd52Ht6l7Jtr+P1EC2k3XJLkS4RlqMojsUEcpM9Rk/bXBq7/abh2p3JgqynPB
         oVZrdyHx+D/tqQmaCBGnaBkQLhS/O+fvQbiBLWxtXNHTHZzaoLUiJ5XdTdJOxHWFakEG
         VsAA==
X-Gm-Message-State: AC+VfDwdl+hoM7Bsspho8fSWT16oionsMF0VrdstzPl/jE4x3U2w7U6V
	Hyu7LDggm3APUEAIyuEsJvbaSPCqByQ=
X-Google-Smtp-Source: ACHHUZ7oF2OrgJXKm39RGRVXI1vKWuuYqbfsPQUZk89HXKREDFLA2mFb9YF3y3DhBgK9OOK1C/WqCg==
X-Received: by 2002:ac8:5747:0:b0:3f2:1f2f:dc80 with SMTP id 7-20020ac85747000000b003f21f2fdc80mr6028725qtx.9.1682969481554;
        Mon, 01 May 2023 12:31:21 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v3 14/14 RESEND] CHANGELOG: Add Intel HWP entry
Date: Mon,  1 May 2023 15:30:34 -0400
Message-Id: <20230501193034.88575-15-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501193034.88575-1-jandryuk@gmail.com>
References: <20230501193034.88575-1-jandryuk@gmail.com>
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
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5dbf8b06d7..2eb9e2cfd0 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -18,6 +18,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Bus-lock detection, used by Xen to mitigate (by rate-limiting) the system
      wide impact of a guest misusing atomic instructions.
  - xl/libxl can customize SMBIOS strings for HVM guests.
+ - Add Intel Hardware P-States (HWP) cpufreq driver.
 
 ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
 
-- 
2.40.0


