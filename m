Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 995528B14D1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 22:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711651.1111787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzjRZ-0004YB-97; Wed, 24 Apr 2024 20:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711651.1111787; Wed, 24 Apr 2024 20:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzjRZ-0004VR-5Q; Wed, 24 Apr 2024 20:42:17 +0000
Received: by outflank-mailman (input) for mailman id 711651;
 Wed, 24 Apr 2024 20:42:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q5fc=L5=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rzjRY-0004VD-3n
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 20:42:16 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 220f9bda-027b-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 22:42:14 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-417f5268b12so2931075e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 13:42:14 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 cd9-20020a170906b34900b00a5264576138sm8740067ejb.35.2024.04.24.13.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 13:42:13 -0700 (PDT)
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
X-Inumbo-ID: 220f9bda-027b-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713991334; x=1714596134; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNif3eZYUBF7BnQ1Yw5FaGeiL/S3aKagQmr0I2wcHsM=;
        b=Y2b9qzWL2MJ/3Abwm59/U8BCH/32r/XgZc0ej7URKqcFouGFL+XZZtNeXht25HxjW3
         XmGEkuzTjsTAW9i4zsiek9cdx8oYe1zXIHkWTKkJQJeOwCobxa1cgCDEcvwuXajuwugd
         5IQEU5lfSw/dFRnGs6ZQKjX3RX24OqUgZeie4/psHI3apqUu5EyJH0iDGSXj3+wyZBWj
         XKyVNWjWMVMoxESendBtIHu/Ti92z896NuZ4eyvk4Jsfmti/tsPUlhuqVgpGDA284DBT
         z0xq38zLJs4P/0lTiaXN6gMrqn518NEffI/vN3lFUY+4vQUan5RtxRypRpR8+pmNiubo
         Js+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713991334; x=1714596134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNif3eZYUBF7BnQ1Yw5FaGeiL/S3aKagQmr0I2wcHsM=;
        b=N/B3EEO8hAd0RymcOfT5aTl76yp7MxQeuBTNOU4K7Pg1MOlwi7TYZQHdvy7qryeg9/
         vYL9Wh5tqpBfjvVakUNd2YVG8Sl6wQu7v9wk2W/mzjyxtPZtihLTTkdLfshPAQLeZXaJ
         Xo6oQq8BaEJ9KceWEkgpoRX2kKfE0SpMfuSipouaShBfsibPTsxwinBC+YUapnZU2i+M
         QYDkqiK7F5EmtamDg1DUMqyk7fC/v8oT0ov7/w9crEkp6R8rXtxqk3sGRUlR5dmSSKcp
         ipY7VfSCoJUe5u0XS7rR9Y5IrbvTTYiXJaMu/43mSAZM88V9VVMxRnh+Q26jtYrzqN6G
         evRA==
X-Gm-Message-State: AOJu0YxiXgF5n5qsJDaIaKytxI3NJWEruB0inr7o97gph1hxPupcj7oi
	NePmh4h1isYlf3IpFvwNfORppR/IEM0Sqj6AKbJk83IVnOC/4pZE1LvmedoP
X-Google-Smtp-Source: AGHT+IEr1q6Hh6qsszswB55jxWD2BOHUU9L25Wm0Mrr0J5+StMuOuFvWwTlUvqoBvCcmp3IiMLAgWA==
X-Received: by 2002:a05:600c:1c1e:b0:418:f6b7:429a with SMTP id j30-20020a05600c1c1e00b00418f6b7429amr2721049wms.27.1713991334081;
        Wed, 24 Apr 2024 13:42:14 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/7] x86/p2m: Add braces for better code clarity
Date: Wed, 24 Apr 2024 20:41:59 +0000
Message-Id: <2e6e4f07b9e8f50ae65697c8644995aa4851cdac.1713990376.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713990376.git.w1benny@gmail.com>
References: <cover.1713990376.git.w1benny@gmail.com>
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


