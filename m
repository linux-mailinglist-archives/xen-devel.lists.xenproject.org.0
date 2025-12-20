Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C464CD2E16
	for <lists+xen-devel@lfdr.de>; Sat, 20 Dec 2025 12:24:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1191379.1511262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWv31-0002te-T7; Sat, 20 Dec 2025 11:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191379.1511262; Sat, 20 Dec 2025 11:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWv31-0002rp-M2; Sat, 20 Dec 2025 11:22:55 +0000
Received: by outflank-mailman (input) for mailman id 1191379;
 Sat, 20 Dec 2025 11:22:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RPos=62=gmail.com=zhangwt1997@srs-se1.protection.inumbo.net>)
 id 1vWv30-0002rh-3V
 for xen-devel@lists.xenproject.org; Sat, 20 Dec 2025 11:22:54 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 387d98ba-dd96-11f0-9cce-f158ae23cfc8;
 Sat, 20 Dec 2025 12:22:51 +0100 (CET)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-8b29ff9d18cso290534085a.3
 for <xen-devel@lists.xenproject.org>; Sat, 20 Dec 2025 03:22:51 -0800 (PST)
Received: from shizuku.. ([2620:0:e00:550a:f33a:6f3:d481:4882])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d9a44e314sm38580296d6.49.2025.12.20.03.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 03:22:49 -0800 (PST)
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
X-Inumbo-ID: 387d98ba-dd96-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766229770; x=1766834570; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gurlBj0az6nKf7nLhbMlzuYQLnMCetWmYEsYsoO0utk=;
        b=EvAbGFL8kLiGQh+fS2x9ZqQC1lqem5AcONj/xShjigVXMplLbWRJ9ILYdXWQDw7KAw
         n6zwNEFbQFrAleUOA13BkMgQ48em/eW8cSCJvojYg/843nBg1Bt7cqvbi+C1FEIJzaCE
         Up/+LpPJeiHbBWRToJ+6TA0rWB8MPO52rc+v4yB2o8Ge3vhlRQ8GrLDnCtLNer1kEju+
         6yOBUIWg/jpGB76t6SJG87Jjnph+5q8lhdnk2isXSRA7E0RWVwvr8Z8kwxTC5hMn/Zog
         JjqKw/VhS7s9SVKtsjb3LOg46wMks3bSpBarBYTZa9n6zzq4i9kSsrXt1QOEd/WBDI8c
         G/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766229770; x=1766834570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gurlBj0az6nKf7nLhbMlzuYQLnMCetWmYEsYsoO0utk=;
        b=gaJlkx6wEJg4VgKekXm2QJ/xaFEEqmIXJ7w1yPzBNJH0+tWrueWEKcJ1+MV4ZmEvZh
         wc0NRF4TKyQz12fu0MAEPlBJxSPZZkAuEEffZ+DLZ81mjryMRbeiOXQCBaKZaPY24jvk
         BmUTNtA/pBqqKMAjCsBB42JtgyucKGdB34lFwO6uHLa1kgld5ngLQWIKwfRo2T5EwvCC
         ffrXJtL+rz1gbluJw6GFEBsaWERyw/fM85zLK7nq1oLYB0dWZ2JBT22GrHLvv3PQaH65
         ZlTIyNIjylycBzGWn/WXwnGnIQpYB1bgft05PE9vAWVE7JKGXx0KVqjinvIsrieLGnH6
         UmYg==
X-Forwarded-Encrypted: i=1; AJvYcCWclhpW0F9s61/Rg1n9VlN6DKjtvoRkUCVxxeloy93BamzVgbQwM6rAeU2nXR0zspTSJ89NLQDtSyk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywoZjGE6iisRhmeW4vcyoo5nWPgeEqSlJNAGIz+YprpOGuhbNm
	rmuRGs8tS7wuJ8M4uk5iyANxhriZsHn7bSh+F4uJLS4mqw7DvOLMH/h6
X-Gm-Gg: AY/fxX4AWCcrQQsld9NUz8ShkuNv2CFfb8GfTOatZJBcA6/EOt7varU1zdS5IOQ1FXD
	yvK4uOaajAKqiiJOAPN5j3uvFbDrXaa6uLo4eOS8yTTG6FoQS3DZTs132l38C59VI8vp0YPe8Ny
	B3QE0NSa1p9++Idr/79bes2ndMOg2yoiU9ofDMdVhCssl6EQzAdcdLUDTKUtcxnIxphsDBiDUuv
	iELyhcW0dFqaDFmP3/ixLxDeyot15P12k6dao47GTyGvXD6A2cYIz7It1Nv5JFU7DlYQ1FV/Iiv
	Dn3Stz0F+TyT+86EJmc6MkCaX3SIj1x6zmj0eMkqdbqrZIPlKzikhOZQhEyVUUePm6Vf5YPNcLk
	XVeFaWkmHckeXiT+xZYhSIrUjtWvu85bmD/OqiEwtjnyHaMpx1PlHtxmZ1gvveOQ3qErcQI4M7G
	1wQwjNyjE=
X-Google-Smtp-Source: AGHT+IE4QNxEJtO3gqKqn7yAVdEiBnTpTSuzeJ0gj2gnoL4oxSU+EsTiTmJl5ZUcxr1ZgffcECTM3Q==
X-Received: by 2002:a05:620a:414b:b0:8b2:e6b1:a9b6 with SMTP id af79cd13be357-8c08fc0114cmr899908885a.2.1766229770484;
        Sat, 20 Dec 2025 03:22:50 -0800 (PST)
From: Wentao Zhang <zhangwt1997@gmail.com>
To: samaan.dehghan@gmail.com
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [XEN PATCH] xen: add paddings after bitmap section in LLVM coverage profile
Date: Sat, 20 Dec 2025 05:22:43 -0600
Message-Id: <71775ef5c267b3888ddf3e4a55bdb5914cf1f890.1766228666.git.zhangwt1997@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aa144043d4e0592fbbeaf0a3d5e9cad6e9226d8a.1763989809.git.samaan.dehghan@gmail.com>
References: <aa144043d4e0592fbbeaf0a3d5e9cad6e9226d8a.1763989809.git.samaan.dehghan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The layout of LLVM coverage profile is like

  header
  data section
  (padding #1)
  counter section
  (padding #2)
  bitmap section
  (padding #3)
  name section
  (padding #4)

Padding areas #1 and #2 are always zeroed on 64-bit platforms, but that
is not the case for padding area #3 and #4. See LLVM docs [1] and
compiler-rt's own version of "get_size()" [2].

The implementation in 08c787f "xen: Enable MC/DC coverage for Clang"
partly considers padding #4 in get_size() but not in dump(). It worked
because in the header .padding_bytes_after_bitmap_bytes is also
initialized to zero so a reader may still know how to parse the profile.
But we should probably not base ourselves on such assumption. Instead
let's be as close as possible to hosted environment generated profiles,
i.e. those generated by compiler-rt.

In this patch, get_size() implementation is mathematically the same but
changed to reflect the layout somewhat better. For dump(), padding #4 is
added both in the header and in the payload.

[1] https://llvm.org/docs/InstrProfileFormat.html
[2] https://github.com/llvm/llvm-project/blob/llvmorg-20.1.8/compiler-rt/lib/profile/InstrProfilingBuffer.c#L223

Signed-off-by: Wentao Zhang <zhangwt1997@gmail.com>

---

As an aside, an alternative way that has better long-term
maintainability would be [3]. I ran it with Xen and could unofficially
confirm it works, modulo implementation nitty-gritties.

[3] https://github.com/llvm/llvm-project/pull/167998
---
 xen/common/coverage/llvm.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
index 5663fb1..f15ec11 100644
--- a/xen/common/coverage/llvm.c
+++ b/xen/common/coverage/llvm.c
@@ -141,11 +141,11 @@ static void cf_check reset_counters(void)
 
 static uint32_t cf_check get_size(void)
 {
-    uint32_t size = ROUNDUP(sizeof(struct llvm_profile_header) + END_DATA - START_DATA +
-                   END_COUNTERS - START_COUNTERS + END_NAMES - START_NAMES, 8);
-    if ( IS_ENABLED(CONFIG_CONDITION_COVERAGE) )
-        size += ROUNDUP(END_BITMAP - START_BITMAP, 8);
-    return size;
+    return sizeof(struct llvm_profile_header) +
+           END_DATA - START_DATA +
+           END_COUNTERS - START_COUNTERS +
+           ROUNDUP(END_BITMAP - START_BITMAP, 8) +
+           ROUNDUP(END_NAMES - START_NAMES, 8);
 }
 
 static int cf_check dump(
@@ -167,6 +167,7 @@ static int cf_check dump(
 #if defined(CONFIG_CONDITION_COVERAGE) && LLVM_PROFILE_VERSION >= 9
         .num_bitmap_bytes = END_BITMAP - START_BITMAP,
         .bitmap_delta = START_BITMAP - START_DATA,
+        .padding_bytes_after_bitmap_bytes = (-(END_BITMAP - START_BITMAP)) & 7,
 #endif
     };
     unsigned int off = 0;
@@ -183,6 +184,7 @@ static int cf_check dump(
     APPEND_TO_BUFFER(START_COUNTERS, END_COUNTERS - START_COUNTERS);
 #if defined(CONFIG_CONDITION_COVERAGE)
     APPEND_TO_BUFFER(START_BITMAP, END_BITMAP - START_BITMAP);
+    off += header.padding_bytes_after_bitmap_bytes;
 #endif
     APPEND_TO_BUFFER(START_NAMES, END_NAMES - START_NAMES);
 #undef APPEND_TO_BUFFER
-- 
2.34.1


