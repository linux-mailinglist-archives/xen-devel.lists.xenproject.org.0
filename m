Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514BAB10F98
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 18:23:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056345.1424597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueyj0-0000An-Cf; Thu, 24 Jul 2025 16:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056345.1424597; Thu, 24 Jul 2025 16:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueyj0-00008i-8q; Thu, 24 Jul 2025 16:23:18 +0000
Received: by outflank-mailman (input) for mailman id 1056345;
 Thu, 24 Jul 2025 16:23:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSid=2F=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ueyiy-0007fi-95
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 16:23:16 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80793573-68aa-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 18:23:15 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a522224582so602247f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 09:23:15 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fcc2bc8sm2615965f8f.72.2025.07.24.09.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 09:23:14 -0700 (PDT)
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
X-Inumbo-ID: 80793573-68aa-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753374195; x=1753978995; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlmGeXFYLb39H+GEEKv36aG5ffX0auy3m86JuL+WpVY=;
        b=LprrL5Bp80PwkABcHSE9Pmpl4qiqkOiFtxK0/ybOlWtyhlvVBtqNml4M6Ou+xqVGVn
         RwFwZtC2rZnyYYTFyBvusWbrkMvATmBOA8IoWBdwoQEm0FE4DlMfSb8TWxINWM+VV/Fv
         3LAbyWty4mj3zydLoGjM7n0G5fZleRfb9/bXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753374195; x=1753978995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlmGeXFYLb39H+GEEKv36aG5ffX0auy3m86JuL+WpVY=;
        b=tliONApLbBOCvNkuwycUTSaF6kwN/9Wu0JXa5t/yABJxngLsPAhRr8SxR6jbd0+4qb
         cE9wSxkO00ul/9S+6yXqM5/EEPSLHeq7bDRJAmzieILZPXMCavb6/XhTvHsLnB/WmfKT
         GSV64dWaRkGOZ3l8iGf9o00TlCflko9ieAIDzTN/TaszMyhjROutT8G3AbwZPLYmnyPP
         iUHXATHm66nP/MkGk+dd2hcqeH46U0E7lzGdJrhrxtAQxTiclPnfaWlVp6L2oV86lD91
         tmKPc7HuYPHFV+sG4Oy5ujI5nuafDhJN3ELsdiy6KD2M3Y1/u9824aP4MNgL29IstZcx
         sYfg==
X-Gm-Message-State: AOJu0YyIaGXN0OPwxcfZXfimyoHqjmFE1J1KvexJVAzzumHeSAi6G8DU
	ecEyuJkkOd93X4a+oQVhw2m3pOaFAtqbidP/O4uNVdtXv37Q7DJNnZfnNxo56iw0tDyuicpKeUK
	k6wC1cV9nXg==
X-Gm-Gg: ASbGncvfP8k0RSl0P1oyP2M1Ztw0UUBh+fqz5o3ZHqY1NJajAmoD7uXjt7xNmSvxhxz
	YNMx9vkTUveheaDVm7hmbL/a6yAGRMm5YmJgJuXNmakp4MXE9P07luyQquOdBJKVFQvxMGzTPBt
	PdFmwY7CaHTqye7JIYVKE/bjkM/ADo+KSqxhNSPbrEKpf4w/rTVeXrJWOXLXIbqef+0z1lmvHI8
	6PJ8qiMnO11eYCojLLcX2kIAokYBM06H42O0CnOZbk8rS6QHwdVVEUidfIRNKAtReP8ml3jXLDX
	BV7a0bm+FDPHDav8QXJ7J6TmihxELm67HvLKiId9BuyIo+/SAgAlCVR3XYiYH/Eu+raJpzqFBdZ
	Cbjo3OUcYWDvYUWPAqJn6dw6QCXX+aGKAxQxSzAoD6iKCzYhSyf/Xuyg5vHIt7ZGPQU+2rH2jhm
	8c
X-Google-Smtp-Source: AGHT+IGlciWHsJdS5c5LMXfknK7zCMqqgaqPs/pTnB1/yRAM/VEU09Qs12PGjwmaiiYsFkCGj3qHAA==
X-Received: by 2002:a05:6000:2209:b0:3b5:e6bf:5e0c with SMTP id ffacd0b85a97d-3b768ef952bmr6253895f8f.31.1753374194954;
        Thu, 24 Jul 2025 09:23:14 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH 4/4] tools/libxl: Remove unconditional XEN_DOMCTL_set_llc_colors hypercall
Date: Thu, 24 Jul 2025 17:23:06 +0100
Message-Id: <20250724162306.2978741-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250724162306.2978741-1-andrew.cooper3@citrix.com>
References: <20250724162306.2978741-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hypercalls are not free; cache colouring is an experimental feature, and
ignoring an -EOPNOTSUPP is bad form.

Now that Xen has been fixed to initialise colouring information correctly for
domains, xc_domain_set_llc_colors() only needs calling for domains with
explicit configuration.

Rearrange the logic to avoid the hypercall in the general case, leaving a
comment explaining why it is performed so early.

Fixes: 748bd725fbec ("tools: add support for cache coloring configuration")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Carlo Nonato <carlo.nonato@minervasys.tech>
CC: Marco Solieri <marco.solieri@minervasys.tech>
---
 tools/libs/light/libxl_create.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 4301f17f901a..4042ae1a8957 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -699,19 +699,21 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             /* A new domain now exists */
             *domid = local_domid;
 
-            ret = xc_domain_set_llc_colors(ctx->xch, local_domid,
-                                           b_info->llc_colors,
-                                           b_info->num_llc_colors);
-            if (ret < 0) {
-                if (errno == EOPNOTSUPP) {
-                    if (b_info->num_llc_colors > 0) {
+            /*
+             * If Cache Coloring is wanted for the guest, it must be
+             * communicated to Xen prior to allocating guest memory.
+             */
+            if (b_info->num_llc_colors) {
+                ret = xc_domain_set_llc_colors(ctx->xch, local_domid,
+                                               b_info->llc_colors,
+                                               b_info->num_llc_colors);
+                if (ret < 0) {
+                    if (errno == EOPNOTSUPP) {
                         LOGED(ERROR, local_domid,
-                            "LLC coloring not enabled in the hypervisor");
-                        rc = ERROR_FAIL;
-                        goto out;
+                              "LLC coloring not enabled in the hypervisor");
+                    } else {
+                        LOGED(ERROR, local_domid, "LLC colors allocation failed");
                     }
-                } else {
-                    LOGED(ERROR, local_domid, "LLC colors allocation failed");
                     rc = ERROR_FAIL;
                     goto out;
                 }
-- 
2.39.5


