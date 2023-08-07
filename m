Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890DB772E57
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 20:57:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578867.906619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Q3-0004SV-PM; Mon, 07 Aug 2023 18:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578867.906619; Mon, 07 Aug 2023 18:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Q3-0004Qs-Ka; Mon, 07 Aug 2023 18:57:31 +0000
Received: by outflank-mailman (input) for mailman id 578867;
 Mon, 07 Aug 2023 18:57:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5LH-0004lg-T8
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 18:52:35 +0000
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [2607:f8b0:4864:20::f2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90970bbb-3553-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 20:52:32 +0200 (CEST)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-63d0f62705dso31217936d6.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 11:52:32 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 l3-20020a0ce503000000b00635fcd30ff9sm3077278qvm.40.2023.08.07.11.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 11:52:30 -0700 (PDT)
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
X-Inumbo-ID: 90970bbb-3553-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691434351; x=1692039151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th66OAkyXfCb+8rqcY7T1oi7fcMyAzOkt6nXPnMYefM=;
        b=U0SJXFmwB0QB3rzVbn18YtO4XaHbkLyqGMzTWNUlvx7WCmGcr9FcXhA4ZFd6qpPtzE
         C80gMNl5jXBBxFflxh3srBkXQIBe0oWgKbRXehv7ikL5aV2s4otKmk8fDbEillzSa2qj
         PK1Ah+xrGgEcGp5CzaF8z4VhEVva81qNj4pMRHuzTDG23UinMATTrPzg/rCnD7XJ+v/A
         p3AoK0eW/zRMhX+obmdScIdCMIFM+w31z3LCjyZye4QybbIDbcW2AjJ4d7hu/P9id7vx
         0crKCoyjRvT5/bJ3CGv7U/z2qgn4YhEW51seSS//QZJwhcrVz3giwLp9lwWxdQNHp9OP
         3IBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691434351; x=1692039151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=th66OAkyXfCb+8rqcY7T1oi7fcMyAzOkt6nXPnMYefM=;
        b=SaE4VYI/RLxi3ioqGPENhBA6vxxaxZufNV/41w71G2XVMxWIZmCQqe1VEWfOeWtM1X
         o4wds0YmEF2S2oNINC6N1MuUFK1ILj3M92h461kCFYfRGmQxMZeRSdYPf7rDraapoU3v
         mRF2dFyQvlL4f7ejgHwajGnPp7X1y9pv3a7qOX62yi28sBagZjwOcrCezEkKUUMSpl+2
         nH3RgVSOxVqb6NsNywjecqqLyIWdMMvwdioXibrMwEYP11v3gufmxQ8/E2afN8GdtgJz
         CU23T1Kbe5haRqJnnWsXXdizVq58cpdRXntgCP9jy1qnhJN5zTCCTB+RX29DKNDXkEa/
         xtZQ==
X-Gm-Message-State: AOJu0YxSO42XTK2kMn0TwkDCDePSoXU3jgYqBHqfk57NoOrpLm/lD027
	Rj7K7Gg1dVpibwfF038qt7mS9DS+RGU=
X-Google-Smtp-Source: AGHT+IH5PcmbQONWX0ET0Fwui98yNSXOY56/kwYGUa5lf37rZkMDqWFNhdyH6inHc/5YenFSgksxIA==
X-Received: by 2002:a0c:f24d:0:b0:635:dda5:bb88 with SMTP id z13-20020a0cf24d000000b00635dda5bb88mr9308623qvl.53.1691434351205;
        Mon, 07 Aug 2023 11:52:31 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v8 15/15] CHANGELOG: Add Intel HWP entry
Date: Mon,  7 Aug 2023 14:51:19 -0400
Message-ID: <20230807185119.98333-16-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807185119.98333-1-jandryuk@gmail.com>
References: <20230807185119.98333-1-jandryuk@gmail.com>
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
index 7e5efcabda..56921db79f 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -24,6 +24,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - xl/libxl can customize SMBIOS strings for HVM guests.
  - Add support for AVX512-FP16 on x86.
  - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
+ - Add Intel Hardware P-States (HWP) cpufreq driver.
 
 ### Removed
  - On x86, the "pku" command line option has been removed.  It has never
-- 
2.41.0


