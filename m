Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8B17E4418
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 16:49:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628911.980852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0OKY-0004uB-Bw; Tue, 07 Nov 2023 15:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628911.980852; Tue, 07 Nov 2023 15:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0OKY-0004o2-71; Tue, 07 Nov 2023 15:49:30 +0000
Received: by outflank-mailman (input) for mailman id 628911;
 Tue, 07 Nov 2023 15:49:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2M1=GU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r0OKW-0004f1-Vp
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 15:49:28 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b954827-7d85-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 16:49:28 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40839652b97so43425785e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 07:49:28 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a1c721a000000b0040849ce7116sm15809852wmc.43.2023.11.07.07.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 07:49:26 -0800 (PST)
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
X-Inumbo-ID: 3b954827-7d85-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699372167; x=1699976967; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PH+ltmnAqqEVilWJSYQVlpn9gAh+kNEqLJKqQ8kDow=;
        b=F1rw5aUbAnsg3ci/ltsmy72UzPYihqy5pKD0OuAiPDyx1+XV2jNnm5hR+uOnzUDXwy
         adrcNEcKd2mgJJiJEiijqJYWgNSGGL9HldNHjxbLpEk/O+MAJSO5YLU6cLFi9teQv8+F
         rBsDzFla/v5kV458L14alaxpNMjiYBqjQQ/2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699372167; x=1699976967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PH+ltmnAqqEVilWJSYQVlpn9gAh+kNEqLJKqQ8kDow=;
        b=hFaRYxZrl5p47fE9IaYTDjyGY6rC/DhBPPmTPL3YmyY4mD8oekN4W4Pv0UwjqmHJsg
         e4GBhx9Vhd/FUF9kpq0pmsOBh1GkM7Fmmd5rxAE4X6NgyaBiCdpwLvhlDD4TIMb/80SH
         m2XTyQ09pSIlPT0ClcWNJ0xTzMGonxYBwjooUY2TUlO7VqLz5OQTTXoHSVNO0dVexCsE
         O3YRcPoao0YcesoMxe4xIMNW1C/18JUHfo0XAp9PI1X3D05pcCsBsT+9tHrr6b5IXRlx
         S19ykp1fjTX04mGiV3wWWedXNrbbwN+5PcqEfVp+OryRys+rmAp1HbNmzwf+PHYVMq1p
         DX8w==
X-Gm-Message-State: AOJu0YwngIF2Lw+J9crY8jA89Pqy14YAGeOih480bHgN24Mnp5hD60kE
	ERWvPqnFiQisJe342SlMgejfzsQNxtzLj+f+xYc=
X-Google-Smtp-Source: AGHT+IHbGl1ImjqsJJC/LtJ/XxrNw1Yq7Y39EFnxTRFMDZvidth2gihrppp3vxakaCZKl4LTvY/Ykg==
X-Received: by 2002:a05:600c:3112:b0:408:575e:f24f with SMTP id g18-20020a05600c311200b00408575ef24fmr2701397wmo.28.1699372166576;
        Tue, 07 Nov 2023 07:49:26 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/7] tools/xg: Simplify write_x86_cpu_policy_records()
Date: Tue,  7 Nov 2023 15:49:16 +0000
Message-Id: <20231107154921.54979-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107154921.54979-1-alejandro.vallejo@cloud.com>
References: <20231107154921.54979-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the policy automatically getting appropriate serialised buffer sizes,
we can remove boilerplate from this function. Furthermore, the extra
dynamic allocations aren't needed anymore as the serialised buffers inside
the policy can be used instead.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/libs/guest/xg_sr_common_x86.c | 55 +++++++++--------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common_x86.c b/tools/libs/guest/xg_sr_common_x86.c
index ad63c675ed..c8fd64775f 100644
--- a/tools/libs/guest/xg_sr_common_x86.c
+++ b/tools/libs/guest/xg_sr_common_x86.c
@@ -44,55 +44,36 @@ int handle_x86_tsc_info(struct xc_sr_context *ctx, struct xc_sr_record *rec)
 
 int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
 {
+    int rc = -1;
     xc_interface *xch = ctx->xch;
-    struct xc_sr_record cpuid = { .type = REC_TYPE_X86_CPUID_POLICY, };
-    struct xc_sr_record msrs  = { .type = REC_TYPE_X86_MSR_POLICY, };
-    uint32_t nr_leaves = 0, nr_msrs = 0;
-    xc_cpu_policy_t *policy = NULL;
-    int rc;
-
-    if ( xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs) < 0 )
-    {
-        PERROR("Unable to get CPU Policy size");
-        return -1;
-    }
+    struct xc_sr_record record;
+    xc_cpu_policy_t *policy = xc_cpu_policy_init(xch);
 
-    cpuid.data = malloc(nr_leaves * sizeof(xen_cpuid_leaf_t));
-    msrs.data  = malloc(nr_msrs   * sizeof(xen_msr_entry_t));
-    policy = xc_cpu_policy_init(xch);
-    if ( !cpuid.data || !msrs.data || !policy )
-    {
-        ERROR("Cannot allocate memory for CPU Policy");
-        rc = -1;
-        goto out;
-    }
-
-    if ( xc_cpu_policy_get_domain(xch, ctx->domid, policy) )
+    if ( !policy ||
+         (rc = xc_cpu_policy_get_domain(xch, ctx->domid, policy)) )
     {
         PERROR("Unable to get d%d CPU Policy", ctx->domid);
-        rc = -1;
-        goto out;
-    }
-    if ( xc_cpu_policy_serialise(xch, policy, cpuid.data, &nr_leaves,
-                                 msrs.data, &nr_msrs) )
-    {
-        PERROR("Unable to serialize d%d CPU Policy", ctx->domid);
-        rc = -1;
         goto out;
     }
 
-    cpuid.length = nr_leaves * sizeof(xen_cpuid_leaf_t);
-    if ( cpuid.length )
+    record = (struct xc_sr_record){
+        .type = REC_TYPE_X86_CPUID_POLICY, .data = policy->leaves.buf,
+        .length = policy->leaves.len * sizeof(*policy->leaves.buf),
+    };
+    if ( record.length )
     {
-        rc = write_record(ctx, &cpuid);
+        rc = write_record(ctx, &record);
         if ( rc )
             goto out;
     }
 
-    msrs.length = nr_msrs * sizeof(xen_msr_entry_t);
-    if ( msrs.length )
+    record = (struct xc_sr_record){
+        .type = REC_TYPE_X86_MSR_POLICY, .data = policy->msrs.buf,
+        .length = policy->msrs.len * sizeof(*policy->msrs.buf),
+    };
+    if ( record.length )
     {
-        rc = write_record(ctx, &msrs);
+        rc = write_record(ctx, &record);
         if ( rc )
             goto out;
     }
@@ -100,8 +81,6 @@ int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
     rc = 0;
 
  out:
-    free(cpuid.data);
-    free(msrs.data);
     xc_cpu_policy_destroy(policy);
 
     return rc;
-- 
2.34.1


