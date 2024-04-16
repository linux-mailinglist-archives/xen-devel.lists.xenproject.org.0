Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2F68A66DD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 11:16:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706795.1104177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwev9-0000lI-Gw; Tue, 16 Apr 2024 09:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706795.1104177; Tue, 16 Apr 2024 09:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwev9-0000j6-E1; Tue, 16 Apr 2024 09:16:07 +0000
Received: by outflank-mailman (input) for mailman id 706795;
 Tue, 16 Apr 2024 09:16:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qw+g=LV=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rwev8-0000j0-Nm
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 09:16:06 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3f36ab4-fbd1-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 11:16:05 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a5269c3f9c7so249524866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 02:16:05 -0700 (PDT)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u2-20020a17090657c200b00a524476aac9sm4654723ejr.108.2024.04.16.02.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 02:16:03 -0700 (PDT)
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
X-Inumbo-ID: f3f36ab4-fbd1-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713258965; x=1713863765; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMo9HfH+/6PT62gxIGHAj1EtchV4P4c0BEQDSxaYl8E=;
        b=VJEok3iEtIuwmTdUJzPtp1ihuKw0D7NcjP8Gb5OBw6Cg9Q2WNz13BveNZpueLRBpzm
         5B3eUEwjBxfTgDED4tygut7mHvXw4Pnqs33ekd599tE6tovSANBxNZBGKCRFNaHoCrd4
         czA7ZJI/AxEdHPjl6DE+U6W4ZpGgwgEYYtyC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713258965; x=1713863765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMo9HfH+/6PT62gxIGHAj1EtchV4P4c0BEQDSxaYl8E=;
        b=kbM/vrt1FgsQcXvaA0wsXNEK+sCJ8ZdgbAjHhN5Us0521WVnKZOaycgbHk5YJwm06y
         Yc0C6/xozr6pPp9L9bEVBtXETMwlmF+ZDg7B54+NWEHi+d5ruT386N1NmllMQ6GAtm5d
         T7V/2rH3pmB6kC87uNgcnx6zIZOsjYumiqD8KCQzLHBLjN/81ghSiDDTUysQvzfLqvgJ
         4f4Az0SEVfpR5OVgSj3ubHc3iAc1ug7NRZuPfLv/t3SXrKAWPoNB9uUtHz5Up1Z6nG6H
         hQWwsoOW+qiF6YMU9Yp9w0cDpEktB0U48vX3ckQvahUmgQiNuMkVjMUYZ07yQ4n8OCcD
         z0wQ==
X-Gm-Message-State: AOJu0Yzbuz9+rdStdh2Q9OTjVNdv9L39mdB6BMa27fWO/ml4bOvmZzsv
	KvkRZpADfa7LDxm1gmLJO13nzCqNF3cB4i1Jkam7XWB2lxP1MXirtsCOziIQ1mhn/BeAqSgAvq2
	5
X-Google-Smtp-Source: AGHT+IGiVFzED4vE2YgqcbK2WERtwlr9k7iUaPSamGBfKHXw9VfXOpLltOmof+L9ChbTrnrinumiKA==
X-Received: by 2002:a17:906:2dc5:b0:a52:225a:2ebe with SMTP id h5-20020a1709062dc500b00a52225a2ebemr6719632eji.71.1713258964803;
        Tue, 16 Apr 2024 02:16:04 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/5] x86: Update x86 low level version check of microcode
Date: Tue, 16 Apr 2024 10:15:42 +0100
Message-ID: <20240416091546.11622-2-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240416091546.11622-1-fouad.hilly@cloud.com>
References: <20240416091546.11622-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update microcode version check at Intel and AMD Level by:
Preventing the low level code from sending errors if the microcode
version provided is not a newer version. Other errors will be sent like before.
When the provided microcode version is the same as the current one, code
to point to microcode provided.
Microcode version check happens at higher and common level in core.c.
Keep all the required code at low level that checks for signature and CPU compatibility

[v2]
Update message description to better describe the changes

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
 xen/arch/x86/cpu/microcode/amd.c   |  8 ++------
 xen/arch/x86/cpu/microcode/intel.c | 11 +++--------
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 75fc84e445ce..4f805f662701 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -383,12 +383,8 @@ static struct microcode_patch *cf_check cpu_request_microcode(
                 goto skip;
             }
 
-            /*
-             * If the new ucode covers current CPU, compare ucodes and store the
-             * one with higher revision.
-             */
-            if ( (microcode_fits(mc->patch) != MIS_UCODE) &&
-                 (!saved || (compare_header(mc->patch, saved) == NEW_UCODE)) )
+            /* If the provided ucode covers current CPU, then store its revision. */
+            if ( (microcode_fits(mc->patch) != MIS_UCODE) && !saved )
             {
                 saved = mc->patch;
                 saved_size = mc->len;
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 060c529a6e5d..e65c02a57987 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -294,8 +294,7 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
 
     result = microcode_update_match(patch);
 
-    if ( result != NEW_UCODE &&
-         !(opt_ucode_allow_same && result == SAME_UCODE) )
+    if ( result != NEW_UCODE && result != SAME_UCODE )
         return -EINVAL;
 
     wbinvd();
@@ -354,12 +353,8 @@ static struct microcode_patch *cf_check cpu_request_microcode(
         if ( error )
             break;
 
-        /*
-         * If the new update covers current CPU, compare updates and store the
-         * one with higher revision.
-         */
-        if ( (microcode_update_match(mc) != MIS_UCODE) &&
-             (!saved || compare_revisions(saved->rev, mc->rev) == NEW_UCODE) )
+        /* If the provided ucode covers current CPU, then store its revision. */
+        if ( (microcode_update_match(mc) != MIS_UCODE) && !saved )
             saved = mc;
 
         buf  += blob_size;
-- 
2.42.0


