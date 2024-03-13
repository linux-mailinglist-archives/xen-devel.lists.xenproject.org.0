Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6F087AD29
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 18:27:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692672.1080040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkSO0-0002lz-AS; Wed, 13 Mar 2024 17:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692672.1080040; Wed, 13 Mar 2024 17:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkSO0-0002j0-7i; Wed, 13 Mar 2024 17:27:28 +0000
Received: by outflank-mailman (input) for mailman id 692672;
 Wed, 13 Mar 2024 17:27:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9/O=KT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rkSNy-00023P-LF
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 17:27:26 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5b98a74-e15e-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 18:27:26 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-513173e8191so163351e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 10:27:26 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f15-20020a170906048f00b00a42ee62b634sm5005732eja.106.2024.03.13.10.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 10:27:24 -0700 (PDT)
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
X-Inumbo-ID: f5b98a74-e15e-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710350845; x=1710955645; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpSUgnXdBHSAZ/JHJssOPkagB6hKViTaNFdB8Xxbxeo=;
        b=jup611V9n936X50ItOtQ+kutj8v0i4d45mzKYThumoTM/qDp+2SklQJOcbsTXy0fBC
         fbUOX05OEqllNd3bt09xr5XjygSRR/ZV8KbwbBXSjI/oaAmgj17nZOrL9ZwLQnQOKyPG
         hT7Hlq52yOhSRdJNt43j2SEnH9WtnhO9UxCbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710350845; x=1710955645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mpSUgnXdBHSAZ/JHJssOPkagB6hKViTaNFdB8Xxbxeo=;
        b=jHPA9HSw2GqnxJul/U94nxdhNNVJQSaCQF0WXWPwjjpe3wp5GbZRU3OzROWJ4DrMXM
         fXqzqZavS6QL+5ExMHFBlZyuHVpYZ4Pk8Rxjrt0ZTM0oFIYdHLitks9UXYQPfYE9ajyS
         7BX1gPc4F7eDlwI2sTAMvcThZJO+DLyjhbCNCvcOV/Wbk3j9OXDCvV6QGgRme71uIG+r
         7qqUpDzqZ47mvSTasMUtDjMg1mc4JrggAWWVd55b+cUL6mNitUoWpAb3Ajo7WB4k5D3a
         Xe8XwtZMWVyTXooxsNAq6x0W7UfNvmbyY/5D6US7zzsg5vOgdpquf9/EjQNA3daSA5ya
         NTNQ==
X-Gm-Message-State: AOJu0YxxteFCekwyfCbMoLNQJjNaQwUcWDijReibM2TkASBd8coADFMg
	OTkNgdlMF3uL16ETsWkh+tntwOYa+Ulk/Y+d7g34QvmpNc/nppkHeg28PovSH8CaBUyvoiWZQNN
	M
X-Google-Smtp-Source: AGHT+IHHS2BbxMFp3fPdXZlAelFUvd7kXhHTdQ6kdTtsszbGnCM2NvEXDlSzwIEv0B4ltQUsCO1dZA==
X-Received: by 2002:a05:6512:3e20:b0:513:acc5:47e with SMTP id i32-20020a0565123e2000b00513acc5047emr3211066lfv.22.1710350845342;
        Wed, 13 Mar 2024 10:27:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 4/7] xen/bitops: Delete generic_ffs{,l}()
Date: Wed, 13 Mar 2024 17:27:13 +0000
Message-Id: <20240313172716.2325427-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No more users.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Simone Ballarin <simone.ballarin@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/include/xen/bitops.h | 41 ----------------------------------------
 1 file changed, 41 deletions(-)

diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index a37b42342bc5..b85b35c40781 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -14,41 +14,6 @@
 #define GENMASK_ULL(h, l) \
     (((~0ULL) << (l)) & (~0ULL >> (BITS_PER_LLONG - 1 - (h))))
 
-/*
- * ffs: find first bit set. This is defined the same way as
- * the libc and compiler builtin ffs routines, therefore
- * differs in spirit from the above ffz (man ffs).
- */
-
-static inline int generic_ffs(unsigned int x)
-{
-    int r = 1;
-
-    if (!x)
-        return 0;
-    if (!(x & 0xffff)) {
-        x >>= 16;
-        r += 16;
-    }
-    if (!(x & 0xff)) {
-        x >>= 8;
-        r += 8;
-    }
-    if (!(x & 0xf)) {
-        x >>= 4;
-        r += 4;
-    }
-    if (!(x & 3)) {
-        x >>= 2;
-        r += 2;
-    }
-    if (!(x & 1)) {
-        x >>= 1;
-        r += 1;
-    }
-    return r;
-}
-
 /*
  * fls: find last bit set.
  */
@@ -84,11 +49,6 @@ static inline int generic_fls(unsigned int x)
 
 #if BITS_PER_LONG == 64
 
-static inline int generic_ffsl(unsigned long x)
-{
-    return !x || (u32)x ? generic_ffs(x) : generic_ffs(x >> 32) + 32;
-}
-
 static inline int generic_flsl(unsigned long x)
 {
     u32 h = x >> 32;
@@ -97,7 +57,6 @@ static inline int generic_flsl(unsigned long x)
 }
 
 #else
-# define generic_ffsl generic_ffs
 # define generic_flsl generic_fls
 #endif
 
-- 
2.30.2


