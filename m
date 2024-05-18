Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3C68C907F
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2024 13:02:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724746.1129914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8Hpj-0006VP-0z; Sat, 18 May 2024 11:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724746.1129914; Sat, 18 May 2024 11:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8Hpi-0006Sd-Tc; Sat, 18 May 2024 11:02:34 +0000
Received: by outflank-mailman (input) for mailman id 724746;
 Sat, 18 May 2024 11:02:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v3Z6=MV=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s8Hpg-0006PW-L8
 for xen-devel@lists.xenproject.org; Sat, 18 May 2024 11:02:32 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dfccfdf-1506-11ef-b4bb-af5377834399;
 Sat, 18 May 2024 13:02:30 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-351ae94323aso759108f8f.0
 for <xen-devel@lists.xenproject.org>; Sat, 18 May 2024 04:02:29 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8969fbsm23777282f8f.37.2024.05.18.04.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 04:02:27 -0700 (PDT)
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
X-Inumbo-ID: 1dfccfdf-1506-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716030148; x=1716634948; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyu7N26K83JM6reFihsC9/TI9yx+pCoPayJ3wbx78AU=;
        b=F6sP0e23rHsdYO0kY9SABSvwScPX0t11n6RRu6qJxZRmcou9W5PRZ/XUYz8Q+x6rqj
         cW+70kij1F3Wc1NWz/jwbNHwqt/ZAfAI42S3c8rUAj4te9hidu02XdqKVzneYe8I7XLm
         NHZgypm/dkd7DkWYies6hENXyh4kHRXFJfzoQ22k/hKRiv4K8kfQLjvX8fIee/CSAZCS
         sBosLzZ+W3i5seF1RY0iY0ElToxpuWlAJ3L2s1+cijFB5iXMFRQQQtp15BC6qqyNVjOs
         1+HnnZTNs3Isz8VpE8X/Iv7CZt0FzTT1I5NkhvbQIcwrxCBu4CQYxbWLcXnNoECY3Al6
         OF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716030148; x=1716634948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyu7N26K83JM6reFihsC9/TI9yx+pCoPayJ3wbx78AU=;
        b=m4iBH5wPhh4n1HlOW0TS0CrvURNrsyEfF0XXz3kBlM5KPhoo89ZcTvDLp5xQTWvCNv
         1eI2PSW+CCa3Y6tSzS7FRuPhIIcdp6t/isKZ3vifQcj5INEjJWu24XfjrQV9/fZ8FSWg
         0SBywn3c05n+/xB4JpA5eeIENSU0YSQHgb+2E08U2+PD7wlRxtVnXeRoC2VpyD4szB4/
         hJQRpsf6zqR9z/UzKJT04nqt9l/HnwvU8VlNuuljbQ9+SspUUpscFIMH5QUrEuSpIYoa
         TuBJmRhuqTo479lAGuhXNYpFCsqfByvHHZ1HY1htd7pM5qUX4rVMjfcI4ia/UycX/8p4
         /WYA==
X-Gm-Message-State: AOJu0Yz01+G6UmVULjMaOwq1dwL8lY7E9wfcpeycu8Txw11bodJDGBd3
	ZRfQFQb/S1u12pHqMOSBgnI0Ldg8gTcDNDVSzJqkm2sLOFIBGJ6yP5u8G7F1
X-Google-Smtp-Source: AGHT+IGe35sLDZcm+WO6wUrfzATgQqu1v8ygaKKDXUdhBEi8r8o+WYGxnnwQfFBbIh2r8glPt7nrKQ==
X-Received: by 2002:adf:ebc2:0:b0:34c:925e:6c2c with SMTP id ffacd0b85a97d-3504a61c6c2mr19059826f8f.6.1716030148024;
        Sat, 18 May 2024 04:02:28 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.19? v4 1/6] x86/p2m: Add braces for better code clarity
Date: Sat, 18 May 2024 11:02:12 +0000
Message-Id: <36d1488857a595fd6a286ab2de26cd672df3f387.1716029860.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716029860.git.w1benny@gmail.com>
References: <cover.1716029860.git.w1benny@gmail.com>
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
index 4a4620e870..db5d9b6c2a 100644
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


