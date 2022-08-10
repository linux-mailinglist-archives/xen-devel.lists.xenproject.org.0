Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A73358F346
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383962.619233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrYJ-0005pD-FC; Wed, 10 Aug 2022 19:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383962.619233; Wed, 10 Aug 2022 19:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrYJ-0005mY-CQ; Wed, 10 Aug 2022 19:39:39 +0000
Received: by outflank-mailman (input) for mailman id 383962;
 Wed, 10 Aug 2022 19:39:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxBI=YO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLrPg-00067E-6s
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:30:44 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eabc46a6-18e2-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 21:30:40 +0200 (CEST)
Received: by mail-qk1-x736.google.com with SMTP id i24so11901699qkg.13
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 12:30:40 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:b898:c7de:df6c])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05620a0f0600b006af10bd3635sm537231qkl.57.2022.08.10.12.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:30:38 -0700 (PDT)
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
X-Inumbo-ID: eabc46a6-18e2-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ZVyxx+81E7lUFgUdbheKS4DtvqtlloOOvzDpUFkNgHU=;
        b=b9SSycSXr2T/kBrMVg2g6/0gFR08Le8iiib9o0Jy6q5p9CL7Z+wDLFDWdxGzPyzFGL
         xTHyT8f17772PdU1IbuULI9EiLekKrC70SL0nsH9O8mjUHVt9uW73dSBeF9yU0iwcqWq
         +vCsZpEjBOckf0HODXM3UuL1Xoyiwz/XYB8DOntsK8XCS8yMr0w8/lUnEJiXI3q4gxNa
         CRHGOJVw9bNySb2mL3nmcL7sdUzgeazQO6il2XnEkWSlI17/FWAgt3Y9IviaUyfljpkQ
         1UDqMIJHfALZ6fBXI+CMp+TMC2It2mlTKoeX3hv7h+G5efB8IehCk41dGjAeldwzW2mb
         MbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ZVyxx+81E7lUFgUdbheKS4DtvqtlloOOvzDpUFkNgHU=;
        b=l4Ms4t662R5HWbROilCAFl7+lkBRbaUy61VNC93QEfMBfPTa2uD+fN6FYHGThuXCdM
         fhaikAkuCjXwA/xnK4J0OCmcTiAAUDQ4DC6OMhAizodxEDsXPwFcasUqAxAVxZVtRStz
         0bJr6YY50RdiIpve1uQcGo9PiMa0sRAofqWmeSPmkOFM5D8rseSIu6QaXWWltXHCxGCs
         aJ61ifgNxKF+za3RLfrFyg4cRJgTL3+scOQQHnOUQmt2ZUNqdpkdqfmdz0FJFvQqTVmN
         2vVZvxojIM4klY/Bv0KW5+WuP0P5vHfuQMoNuY/czbROHEn7h8YW0ZvIhstdIf3dinVY
         mKsA==
X-Gm-Message-State: ACgBeo2EqvZPMb4aSyI9vlqwrsSOfCPUmq1dQFuA5khiB+evM+Q6RO5e
	tbXkKbMNLHzXg06RVRzRjL7TGPEOVDs=
X-Google-Smtp-Source: AA6agR7r32NDisgo1x2kSfxJb5FUC7I8Dh9FaL30qP+g8vq30mkw/k7TEbsBhxNG/n/TC8Ac+c2AAg==
X-Received: by 2002:a05:620a:2b8b:b0:6b9:43ca:4a6 with SMTP id dz11-20020a05620a2b8b00b006b943ca04a6mr12469847qkb.346.1660159839109;
        Wed, 10 Aug 2022 12:30:39 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 13/13] CHANGELOG: Add Intel HWP entry
Date: Wed, 10 Aug 2022 15:29:44 -0400
Message-Id: <20220810192944.102135-14-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810192944.102135-1-jandryuk@gmail.com>
References: <20220810192944.102135-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

---
v2:
Add blank line
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index a87a193e15..3d982bf96b 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -6,6 +6,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
 ## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
+### Added
+ - Intel Hardware P-States (HWP) cpufreq driver
+
 ### Changed
  - On x86 "vga=current" can now be used together with GrUB2's gfxpayload setting. Note that
    this requires use of "multiboot2" (and "module2") as the GrUB commands loading Xen.
-- 
2.37.1


