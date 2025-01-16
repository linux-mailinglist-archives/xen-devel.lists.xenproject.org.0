Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE6CA14147
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 18:53:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873678.1284673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYU32-0007Sa-NV; Thu, 16 Jan 2025 17:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873678.1284673; Thu, 16 Jan 2025 17:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYU32-0007Qc-Jz; Thu, 16 Jan 2025 17:52:52 +0000
Received: by outflank-mailman (input) for mailman id 873678;
 Thu, 16 Jan 2025 17:52:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV9y=UI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tYU30-0007C4-Q9
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 17:52:50 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b306d240-d432-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 18:52:49 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d3d143376dso1878477a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 09:52:49 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db73683de7sm243751a12.42.2025.01.16.09.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 09:52:47 -0800 (PST)
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
X-Inumbo-ID: b306d240-d432-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737049968; x=1737654768; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/uapuiccaTxH7EAPivIv8o3YxFQp/soQ4UJlMTsG9c=;
        b=O/2JNqElh5xNd+RStDT21xcxV487992pG/yzLw+1TeuPYTfB+1uX+uR0ErhdlfzBpI
         pL80Vn+Q2n7BbBmySPqcC4+0gUfxd0tLtkEqc7GIa+UylBZWqyGaYeyoihW1XzF0bqeE
         0R4GWHrPSOoVZBO0RVd1fsRg59z9zDnx7SY+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049968; x=1737654768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/uapuiccaTxH7EAPivIv8o3YxFQp/soQ4UJlMTsG9c=;
        b=RolzNYnCqX3nHvY/S31qMbbpTwfYYzwmPTTBz9ZSLOtDpapjGJZz5InSIJaLN91aw4
         +B23xvTQ4CA9JKoqnrFGR8KoWpMtKwRATU0ZSxTJjRd0KJfNvpxFMnHNfL0HbdNiK+0r
         rjXHAmUdudj6YrzaHqyTSMsGSjAO9BvsFqvpFe6EuvNfgqBp49ZJ65VlbqKpKeT8SUGx
         SVtcnaYullke+ZsIAcKJLh5udTnc/yKOSS01a6UJ3LJm5vYaw7R89Zf7Nknp28A/8k6X
         Yv1dL1WYRNmiEz4LMH+RhXbbdsh2ly4czs+kuTzf7lE6w0MyZOYqNiC9Xmec9yOsFBLv
         mz5w==
X-Gm-Message-State: AOJu0YwFCZ0hVS55RLHMtjwmXMn7mYq66kUqR110eal0x2z68NssQPch
	5UMnxHUzthnteDKeHrShRgGsOHIbm8kgXxlR60NiIs/1nhqrricR07bTlW8xvw//YzevIhrb3eE
	u
X-Gm-Gg: ASbGncsG399MMxdUpraho/Zxjk+uy/FbpuJA7TDI7lLd5O2GbyBhbwIIPvM0fbsSSp1
	P1wEEhuZlV7LFHtD2Or7Iti5XMerKt51Q3DPWSr27GVxVvWcNaLJ9V9eGA5j7ZQoJBocaqEUYo4
	8Klyax8rkqQAviVE89KCgUaSPFKJYUCgH+4NZWpTF+aZ1ofxUlvv9N9jOYRt8kpdkKjHKyTUxKQ
	wSRV2uNF+g8fVEEIN3xkxaKZNI+1OJ2hEEtf4YD/XLzKxD1/tnun+i3kw4Tfw==
X-Google-Smtp-Source: AGHT+IGeIm8rBfa4224KwZC18X4+hgNPmw3wjFS1KC8gS4AtREa/j5SkB6WcvVr/HvK0A4HLRZN3Kg==
X-Received: by 2002:a05:6402:40d5:b0:5d9:f21e:ff5 with SMTP id 4fb4d7f45d1cf-5d9f21e18a0mr13175025a12.16.1737049968140;
        Thu, 16 Jan 2025 09:52:48 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Artem Savkov <asavkov@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/7] create-diff-object: ignore .cold.* suffixes in is_bundleable()
Date: Thu, 16 Jan 2025 18:52:08 +0100
Message-ID: <20250116175214.83742-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250116175214.83742-1-roger.pau@citrix.com>
References: <20250116175214.83742-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Artem Savkov <asavkov@redhat.com>

While building a gcc-consprop patch from integration tests gcc8 would place a
__timekeeping_inject_sleeptime.constprop.18.cold.27 symbol into
.text.unlikely.__timekeeping_inject_sleeptime.constprop.18 section. Because
section name doesn't have the '.cold.27' suffix this symbol fails
is_bundleable() check while still being bundleable and later exits early in
kpatch_rename_mangled_functions() without renaming the corresponding patched
function. All of this results in a create-diff-object errror:

  ERROR: timekeeping.o: symbol changed sections: __timekeeping_inject_sleeptime.constprop.18.cold.27
  /home/asavkov/dev/kpatch/kpatch-build/create-diff-object: unreconcilable difference

Fix by ignoring .cold.* name suffix in is_bundleable() for.text.unlikely
sections.

Signed-off-by: Artem Savkov <asavkov@redhat.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/common.c b/common.c
index 68a71f75ac7b..84ca14d3e397 100644
--- a/common.c
+++ b/common.c
@@ -126,7 +126,9 @@ static int is_bundleable(struct symbol *sym)
 
 	if (sym->type == STT_FUNC &&
 	    !strncmp(sym->sec->name, ".text.unlikely.",15) &&
-	    !strcmp(sym->sec->name + 15, sym->name))
+	    (!strcmp(sym->sec->name + 15, sym->name) ||
+			 (strstr(sym->name, ".cold.") &&
+			  !strncmp(sym->sec->name + 15, sym->name, strlen(sym->sec->name) - 15))))
 		return 1;
 
 	if (sym->type == STT_OBJECT &&
-- 
2.46.0


