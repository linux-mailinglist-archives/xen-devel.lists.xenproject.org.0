Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D2BAABD57
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 10:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976747.1363895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDlK-0004H8-AC; Tue, 06 May 2025 08:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976747.1363895; Tue, 06 May 2025 08:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDlK-0004Fk-6p; Tue, 06 May 2025 08:34:50 +0000
Received: by outflank-mailman (input) for mailman id 976747;
 Tue, 06 May 2025 08:34:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCDlI-00041m-5G
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 08:34:48 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7235d67-2a54-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 10:34:46 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso5709969f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 01:34:46 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a099ae7cc6sm13132515f8f.55.2025.05.06.01.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 01:34:45 -0700 (PDT)
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
X-Inumbo-ID: f7235d67-2a54-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746520485; x=1747125285; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=st45ZJ9i+zKbNGPJ/gNiCriyCwXBLOobUVRy9hZSFAA=;
        b=a8ZLtsKkNfiDnWk9AHFIHBY98W9ixl0Z71swNHBGKXOBG4GnMUYVx+fLGP3tAj86yi
         gFECgZUXWV7kXkO1EYoqAmUnS2Pw3l3SrO6IC8i19OfpTCnNkHRR6KC61Nux3dIEgFA1
         Ee67in+25XPxQxgJ0q72BsyPcRlv/1YUW7hIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746520485; x=1747125285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=st45ZJ9i+zKbNGPJ/gNiCriyCwXBLOobUVRy9hZSFAA=;
        b=dGq9O4wPMzAzOemq3HKZTGbxnON8dWdtVTcNcuBf35KCyHL9s7R+HDkB0rnrfBQ+xx
         nejsUq5XU028k5o7yOC6UftlsCvjm3BCObobu9fpdeNbNRQ01pco+l0M/0MBj6oZ0a8E
         7yF7KSRm5DZcp6QLgB6a0V4/JTiwGIu9s3WqQwOG/OkmnUSj2vh2f9frCD4T/mbudqAu
         kemmO83jfrhjzF7mriEMOzLgOViOoOBNIlWDPw5XmBTakoU0LJXtu2BfBHZvVW3XKjkS
         xKVDb0W6ZXsuU3tC1CjvnKIKENG45yTasbmeTA2oQvINoju8CCusfMephHV7q8HHCgPg
         0Jpg==
X-Gm-Message-State: AOJu0YxeXIN8X/ohwUUdYv4vqJJLKULTN9079qH2/H1YI+7oP88qZO+u
	xPtl6zWNkOaAFFOH9f5KyNbfyXEUQzzGFcG0U7RN5svUy23PqHhfhvYVnDHYYccuaOQWVuGdkDh
	R
X-Gm-Gg: ASbGnct+zEM8EBXwl6ldZJaGujUoVjrfoK3L13LAwsl5ScUpRnIxri9+0wtNPaqZEh4
	37xCXPtfL5r927DO3Z4b/o1GhpMR5NflsZLcQQkm+IpvVMVa8gJPnw0SIafd54b4wWG0Gtxq7HI
	g3D5Y313vm04PI+tXFMzXwhN4HlQBqewOcQUIr0fHPycnz/m1M8ROftyUmNBYjQIsKd3iHho5Qk
	4pUUffYDRmGqz9i5aEUFs6RzDjryR/PK/nKWpQv7uxp9wOs7GsCxDifabRt3UtYGeixYvoLpeA1
	KITHmpNvSAfoXZ40bRaGzkVzO23TxXzxFFk11LTX89IZIA==
X-Google-Smtp-Source: AGHT+IHVj/uKcBnWhZL2WS4VG4BiWU+QA7k/IU9uSQePRA0qdu0xcCV8sfNEBXnjmr16UVzoeHKt1g==
X-Received: by 2002:a05:6000:4383:b0:39c:f0d:9146 with SMTP id ffacd0b85a97d-3a0ac1ff746mr1264138f8f.45.1746520485296;
        Tue, 06 May 2025 01:34:45 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/9] x86/pv: fix MMUEXT_FLUSH_CACHE to flush all pCPU caches
Date: Tue,  6 May 2025 10:31:40 +0200
Message-ID: <20250506083148.34963-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506083148.34963-1-roger.pau@citrix.com>
References: <20250506083148.34963-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The implementation of MMUEXT_FLUSH_CACHE is bogus, as it doesn't account to
flush the cache of any previous pCPU where the current vCPU might have run,
and hence is likely to not work as expected.

Fix this by resorting to use the same logic as MMUEXT_FLUSH_CACHE_GLOBAL,
which will be correct in all cases.

Fixes: 534ffcb416bb ("Fix WBINVD by adding a new hypercall.")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Alternatively, the hypercall could be made correct by keeping track of the
pCPUs the vCPU has run on since the last cache flush.  That's however more
work.  See later in the series.
---
 xen/arch/x86/mm.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 66c15a3c864f..38e214352201 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3805,14 +3805,11 @@ long do_mmuext_op(
             break;
 
         case MMUEXT_FLUSH_CACHE:
-            if ( unlikely(currd != pg_owner) )
-                rc = -EPERM;
-            else if ( unlikely(!cache_flush_permitted(currd)) )
-                rc = -EACCES;
-            else
-                wbinvd();
-            break;
-
+            /*
+             * Dirty pCPU caches where the current vCPU has been scheduled are
+             * not tracked, and hence we need to resort to a global cache
+             * flush for correctness.
+             */
         case MMUEXT_FLUSH_CACHE_GLOBAL:
             if ( unlikely(currd != pg_owner) )
                 rc = -EPERM;
-- 
2.48.1


