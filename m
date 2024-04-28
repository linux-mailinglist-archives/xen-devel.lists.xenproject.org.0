Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023AD8B4CE9
	for <lists+xen-devel@lfdr.de>; Sun, 28 Apr 2024 18:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713703.1114596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s17lo-0006VB-LO; Sun, 28 Apr 2024 16:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713703.1114596; Sun, 28 Apr 2024 16:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s17lo-0006Sz-HD; Sun, 28 Apr 2024 16:52:56 +0000
Received: by outflank-mailman (input) for mailman id 713703;
 Sun, 28 Apr 2024 16:52:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a4SJ=MB=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s17lk-0006D5-Gg
 for xen-devel@lists.xenproject.org; Sun, 28 Apr 2024 16:52:52 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf97f75c-057f-11ef-b4bb-af5377834399;
 Sun, 28 Apr 2024 18:52:50 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-346359c8785so3287017f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 28 Apr 2024 09:52:50 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056000188c00b00347eb354b30sm27850921wri.84.2024.04.28.09.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Apr 2024 09:52:49 -0700 (PDT)
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
X-Inumbo-ID: bf97f75c-057f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714323170; x=1714927970; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNif3eZYUBF7BnQ1Yw5FaGeiL/S3aKagQmr0I2wcHsM=;
        b=EG36Lj0ybMhd5j2PrQOKOul4oCYlJiBeuFc8prqNUaN6LgulW6m0242ESQPBpMolvc
         KOkk/4Z8NxiVsJceX8VV04kH677uBEG/l0B5YHEH6dQo/4XXUbiIMoytDozv8tUeH6/X
         t6KlnK4nyVjQvOBih0VLKYVXN/+tHxBPcQKmyFLR20mRdwCSKQaT3rLVdwFxG/t2S/3b
         gsOMKndfMAlbWTod3KydaGGli9OKgmqZV29AQxk/M7n4B2Kxz946y4vmAZrWWAiMv/vb
         qr3GHT0l0UtezQtJHoDKYwin9TOlmTL0wrj1nRjbmgYuZbIgG6iiHDKeiTdDj+L3c4hS
         MddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714323170; x=1714927970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNif3eZYUBF7BnQ1Yw5FaGeiL/S3aKagQmr0I2wcHsM=;
        b=M7MCq/8BflaUUjTraqEx4qBuPDm/23UjUOc0xkUOP7OLxvOzoFHDFBnZfxVfqj7YNt
         R2lGQwdIBNZ8b6Yfi+8l2toxNaRqVHHcUm31ZDvjJN176P53VP/QZeqq9p8lQ4/hWITA
         CvJ1C0sfany0jlOnbTCcDqdNkZPncQhvhZN70YdaRrjmtsKZQKyom2ZweyttDrD1brv2
         380DhmrzGmVqbUNum3i1E48coMAAJzzBc0CtuBWwlpG3koFsTlpEzljeez1UIIkO2CpP
         fjibRPuQspzbuu2bGsXrX5UXMZOWWTtMX15cG5PGm/byLfHL8YD34dGo9tUe2bA6iSaS
         Myyg==
X-Gm-Message-State: AOJu0YwejVFim9KPV6P6XSfu9QNAxqgsf5TsCn3rMcGudQntgVq9X+Ow
	McOhFCIrE9gXbeGfeGWWET/TPSa3ZblvdL15EcWLA+M9COvQiYp071WmiEOq
X-Google-Smtp-Source: AGHT+IHwI4f2/3EPYL3CVLZdm8bIPUwaOQTPxm+126HqOchO2GjyaTG96YOLuGT5acIOa0MzHkJm8w==
X-Received: by 2002:a5d:64cf:0:b0:34c:a95f:1114 with SMTP id f15-20020a5d64cf000000b0034ca95f1114mr3141383wri.40.1714323169770;
        Sun, 28 Apr 2024 09:52:49 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/7] x86/p2m: Add braces for better code clarity
Date: Sun, 28 Apr 2024 16:52:36 +0000
Message-Id: <90082c0aa2047edf5764840f1903d1797ca4b902.1714322424.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714322424.git.w1benny@gmail.com>
References: <cover.1714322424.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

No functional change.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 xen/arch/x86/mm/p2m.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index ce742c12e0..eb7996170d 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -106,6 +106,7 @@ void p2m_change_entry_type_global(struct domain *d,
         unsigned int i;
 
         for ( i = 0; i < MAX_ALTP2M; i++ )
+        {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
                 struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
@@ -114,6 +115,7 @@ void p2m_change_entry_type_global(struct domain *d,
                 change_entry_type_global(altp2m, ot, nt);
                 p2m_unlock(altp2m);
             }
+        }
     }
 
     p2m_unlock(hostp2m);
@@ -139,6 +141,7 @@ void p2m_memory_type_changed(struct domain *d)
         unsigned int i;
 
         for ( i = 0; i < MAX_ALTP2M; i++ )
+        {
             if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             {
                 struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
@@ -147,6 +150,7 @@ void p2m_memory_type_changed(struct domain *d)
                 _memory_type_changed(altp2m);
                 p2m_unlock(altp2m);
             }
+        }
     }
 
     p2m_unlock(hostp2m);
-- 
2.34.1


