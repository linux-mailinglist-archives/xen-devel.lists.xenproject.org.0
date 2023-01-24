Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B172678EAD
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 04:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483382.749540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK9Xr-0006xV-LE; Tue, 24 Jan 2023 03:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483382.749540; Tue, 24 Jan 2023 03:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK9Xr-0006uU-HA; Tue, 24 Jan 2023 03:00:23 +0000
Received: by outflank-mailman (input) for mailman id 483382;
 Tue, 24 Jan 2023 03:00:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25we=5V=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pK9Xq-0006f9-K0
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 03:00:22 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d75b405-9b93-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 04:00:21 +0100 (CET)
Received: by mail-qt1-x82c.google.com with SMTP id s4so12094747qtx.6
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 19:00:21 -0800 (PST)
Received: from shine.lan ([2001:470:8:67e:5892:c1fa:86fb:7cb6])
 by smtp.gmail.com with ESMTPSA id
 72-20020a37074b000000b00706c1fc62desm602498qkh.112.2023.01.23.19.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 19:00:19 -0800 (PST)
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
X-Inumbo-ID: 3d75b405-9b93-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDbawZVEY3jBvUgz9K9gvtm7R7rDYX5K3Ot9S9z7cig=;
        b=MHD/JtlfEqStqBh+yCZtzngw1xHVqiOzbqmjhd8w9HNoP+GXjhvizrYupqqDeBIHC5
         x633tJJEvo66bFPww/tnXiGxdAjJtTZz7YG5d53mb0c6JwRp+cSwAUNokY1Eb6g/ohbv
         MNMf+Dpav/aaFIk7t+pxltnJgD0bkMaiZ56xZjqAx39s4gHZwhjfHeWQB4Z0x6pdp1in
         qEWp2lr8Yfs8jX6ZdFJQvMI6PzBT4VZVKjgf9088py2YBQPovTANAQdm/T6ja3G4Z1pZ
         czGL5ylXxbGtg6rFRM27zp81tvZYA1jEsN1fG8IvbJW5IAIiWYcKySc2CNy6KpHMLa7E
         VG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDbawZVEY3jBvUgz9K9gvtm7R7rDYX5K3Ot9S9z7cig=;
        b=TB9gKg+KERwB1KmFTAHmRXpnS/xus85IlEqHfEG4l+OvNsFPh7nCaWxRvhz5rXR0/2
         Tf+6DzOD275sc5/3fskxH1/TK3i4kpQY2W2zMuwvJuBUfL9KHBGtdKl2WKP41ZQm1R+o
         jCeAOj2NVz5NfmHpvGdGDER1zaSwQ4DGrmXQa488r2G/JrMTRyESJp5shNPnSO0H7i4b
         Vzc1HUVczKBXwpP2rPIp6aGVAW7XIzhrI8V51NKak3pvtK/Nh/Qh0IxRUKZjZlid/dQ9
         g2ofr0EP7BuS5HSrRFDwWeSYCzO2VZvJl7GGN5Stz1QzBjwX9xfjtGOyekdZ8/Nw9QXt
         vfow==
X-Gm-Message-State: AFqh2kqWCP7pswZSEGbfe4wHNZfqmH7FB4+D4e9xei1leHjTIQNEB5lS
	6/ACV7B7SxaBcLqaRKZT+ig6w661Uts=
X-Google-Smtp-Source: AMrXdXtnkBHLKvp/flqj7tgP9/6lYdP+rXUE59Yvba55shD0LwH1z/pwFUvgaf34vrDWDTPPyjKX3Q==
X-Received: by 2002:a05:622a:5c8c:b0:3ab:b632:fa95 with SMTP id ge12-20020a05622a5c8c00b003abb632fa95mr43253195qtb.44.1674529220123;
        Mon, 23 Jan 2023 19:00:20 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Dongli Zhang <dongli.zhang@oracle.com>
Subject: [PATCH v2 1/2] libxl: Fix guest kexec - skip cpuid policy
Date: Mon, 23 Jan 2023 21:59:38 -0500
Message-Id: <20230124025939.6480-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124025939.6480-1-jandryuk@gmail.com>
References: <20230124025939.6480-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a domain performs a kexec (soft reset), libxl__build_pre() is
called with the existing domid.  Calling libxl__cpuid_legacy() on the
existing domain fails since the cpuid policy has already been set, and
the guest isn't rebuilt and doesn't kexec.

xc: error: Failed to set d1's policy (err leaf 0xffffffff, subleaf 0xffffffff, msr 0xffffffff) (17 = File exists): Internal error
libxl: error: libxl_cpuid.c:494:libxl__cpuid_legacy: Domain 1:Failed to apply CPUID policy: File exists
libxl: error: libxl_create.c:1641:domcreate_rebuild_done: Domain 1:cannot (re-)build domain: -3
libxl: error: libxl_xshelp.c:201:libxl__xs_read_mandatory: xenstore read failed: `/libxl/1/type': No such file or directory
libxl: warning: libxl_dom.c:49:libxl__domain_type: unable to get domain type for domid=1, assuming HVM

During a soft_reset, skip calling libxl__cpuid_legacy() to avoid the
issue.  Before the fixes commit, the libxl__cpuid_legacy() failure would
have been ignored, so kexec would continue.

Fixes: 34990446ca91 "libxl: don't ignore the return value from xc_cpuid_apply_policy"
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Probably a backport candidate since this has been broken for a while.

v2:
Use soft_reset field in libxl__domain_build_state. - Juergen
---
 tools/libs/light/libxl_create.c   | 2 ++
 tools/libs/light/libxl_dom.c      | 2 +-
 tools/libs/light/libxl_internal.h | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 5cddc3df79..2eaffe7906 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -2210,6 +2210,8 @@ static int do_domain_soft_reset(libxl_ctx *ctx,
                               aop_console_how);
     cdcs->domid_out = &domid_out;
 
+    state->soft_reset = true;
+
     dom_path = libxl__xs_get_dompath(gc, domid);
     if (!dom_path) {
         LOGD(ERROR, domid, "failed to read domain path");
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index b454f988fb..f6311eea6e 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -382,7 +382,7 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
     /* Construct a CPUID policy, but only for brand new domains.  Domains
      * being migrated-in/restored have CPUID handled during the
      * static_data_done() callback. */
-    if (!state->restore)
+    if (!state->restore && !state->soft_reset)
         rc = libxl__cpuid_legacy(ctx, domid, false, info);
 
 out:
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 0dc8b8f210..ad982d691a 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -1411,6 +1411,7 @@ typedef struct {
     /* Whether this domain is being migrated/restored, or booting fresh.  Only
      * applicable to the primary domain, not support domains (e.g. stub QEMU). */
     bool restore;
+    bool soft_reset;
 } libxl__domain_build_state;
 
 _hidden void libxl__domain_build_state_init(libxl__domain_build_state *s);
-- 
2.34.1


