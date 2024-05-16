Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 018558C7536
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 13:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723175.1127779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZHd-0006e0-1E; Thu, 16 May 2024 11:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723175.1127779; Thu, 16 May 2024 11:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZHc-0006bJ-UW; Thu, 16 May 2024 11:28:24 +0000
Received: by outflank-mailman (input) for mailman id 723175;
 Thu, 16 May 2024 11:28:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S52g=MT=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s7ZHb-0006b6-I7
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 11:28:23 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67415070-1377-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 13:28:22 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-572c65cea55so5922160a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 04:28:22 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574bcede889sm7083043a12.92.2024.05.16.04.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 04:28:21 -0700 (PDT)
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
X-Inumbo-ID: 67415070-1377-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858902; x=1716463702; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wb2Zg0RGsFll9U2ozXeIHtw+XG8+EPJB3Bp+jbvzsQ=;
        b=g7wKBayxZQW2hP/3F3o+/3QY0FMUX11Lolz56PlL1BcipTtCM8EU2dOfsMDF099u5I
         5/nSYuBv2hEjSCc8UKV56BN3HyjXWUDSTEypV251/IC0salJzWSCwzHIQChFveCkU9fK
         Xg1TIv0E0MMh0rLgg6OoyhRsk9y8Vt/OsDYukG6SjUUd2k8J5VLCjg9o4VLmDBb8Wx5c
         fNygT+MWsbcnmDheQrePOUJYtCp8k8s50eiNNOGplKuLywbUFYTRwk7d120BmSQ3oAcI
         nRY073JE+58KDWhXDFcSuJ3RNXgPSq4gcE43krDbX0hG+Uuad6YK3AlQM7lO7ZahrKyL
         w6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858902; x=1716463702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wb2Zg0RGsFll9U2ozXeIHtw+XG8+EPJB3Bp+jbvzsQ=;
        b=O1dgDcTsZV0h9uPukvovN41m7cOtKABh1gqhmgvqVzdDSwgz8kWSrWwZpGYkWuWjoZ
         N4Q5CV2naeiPvpZHNEhOCcnuJjSWplDv5L2VwgabSLe9Yy+vzJf4lHTsMK23lCAGaAcK
         Xo8dlSJSVQCyPdnyNbtO1Knpm96ZenF0Z4wO+iGBF0cGEQebvoIwHFsm0LteLLfnR4XJ
         jl7ZQGQNwz8NKvfNN6pQmbGGEAlxhCeFIIZn5/W6lVt54Ur/XMxRB9+SmtgBth1O7W2s
         7WeirwOeLywaeInf9d7pZdhOxIEOXfAAlJSJ6SAfP5PFugPY6BQWphdxTW3w1UhGQZ16
         TERw==
X-Gm-Message-State: AOJu0Yxu/YYQQ6INtWau/r+355I7c8THe7xX6vdSf0mwk4cv7SAEXDbo
	ZZn3dL6KmCNCVnGGkBOlxqc+axa9oHF7jRnxyu6fnzOfa9J8LuiKNPWSpE3J
X-Google-Smtp-Source: AGHT+IGSJea0rRaSHcwu8qEp0BoExYhQPeYNJ6GI0Qo2/ni19nG/mqFw9W2LQDFxddiHBZUnOB9Ueg==
X-Received: by 2002:a05:6402:278c:b0:574:eb36:9cf5 with SMTP id 4fb4d7f45d1cf-574eb369d9fmr7759577a12.11.1715858901825;
        Thu, 16 May 2024 04:28:21 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.19? v3 1/6] x86/p2m: Add braces for better code clarity
Date: Thu, 16 May 2024 11:28:08 +0000
Message-Id: <36cb7af0de191b6a8d64931225f21a42c2c04529.1715858136.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715858136.git.w1benny@gmail.com>
References: <cover.1715858136.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

No functional change.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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


