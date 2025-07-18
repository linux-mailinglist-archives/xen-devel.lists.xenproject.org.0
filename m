Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8959EB0A610
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 16:20:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048843.1419054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uclwd-0006FD-Ls; Fri, 18 Jul 2025 14:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048843.1419054; Fri, 18 Jul 2025 14:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uclwd-00069d-Gc; Fri, 18 Jul 2025 14:20:15 +0000
Received: by outflank-mailman (input) for mailman id 1048843;
 Fri, 18 Jul 2025 14:20:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uclwb-0005sv-WC
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 14:20:14 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50dd1b5c-63e2-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 16:20:12 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso1601779f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 07:20:12 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca48cb9sm2005490f8f.45.2025.07.18.07.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 07:20:10 -0700 (PDT)
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
X-Inumbo-ID: 50dd1b5c-63e2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752848411; x=1753453211; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Dd0w/YkSH/FDbEpEMowhfozFRDqaxbwtwJrk5OT7EU=;
        b=ZpjjHRw3P4Jzn7bcK1kTO/10FYok+bew7lH1DJvDg1NeIMwRvFtb83108gBzf4wCSh
         HBrgop+dArEwibzwd56Tt1GI286DWvHHe0xrJLQUbQeWJVduyTJUW41MyNnQSl/DbQAX
         tOAtuNALTiK0pzm8ZnZkUyp8mny7ALqno0zmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752848411; x=1753453211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Dd0w/YkSH/FDbEpEMowhfozFRDqaxbwtwJrk5OT7EU=;
        b=WsSuZPn2vp1fAY7rnOlpOiqfLCn79FVe95TWJVFeQIXmz4mF3qEikfaoJ/ekQ4xzom
         8MfDn59+1pq9GnPj44GatMrY3LMVAxkcF/b+nLqNZkHwZwAKU1OgjfesPZ8cvhCkbXNL
         KhE72jz7a2/Ba85vrAFQZLlVEp5Gdc9ZBwCAIky0zkb7rSTKbBsKUTGAHsbBxZXza5hs
         w2cMKlLBMk+RaO0hgYB1UwiyA3XMgt/K9I3qlVyD+3GJq6rrIsrl5lYWodWU0FRcccMX
         LrGhrzDad/WVVmgUeZsQuNv9VnKhp6iVKvQnjHJ+95LGE4eKEPlvyifgGu1CQuqTE3Iy
         6UAw==
X-Gm-Message-State: AOJu0YwtmwrfLqLrxTvEzY0jLJZd5XFtlbHCRgmzjVfq3xBQGuZWKSIm
	b9dJdKhdQ2gf8gAuTFlVE5aCko6XP2qzxcyvenA/Fy2vheKykQcLah6EMb9AyXWodUbDuupgIRt
	mY6w1oHQrnQ==
X-Gm-Gg: ASbGncupgO8xT9+E/wamcKnqqAMrjGE4q2bW/IrgcsWlhTeatQfvY8jVRmxH8WDBeZp
	p2sJqzAQy3aIfa4leFntz5EtkH/su3H0fBc/gRou0H9wZzM2POkufsDa0KO8b+6Zv0WR3+NzMrB
	cKaFdmejtlxTBY0OaxV0JpSht/JSJ2LeCIEx90efK2b3ubllLs1PLgKbjpGLTWK0IPHDToYgA/L
	w2QtJl01zSejZXP909mUSWaD37hxoo3YjICG7JxbX3okG0QBJjWZ/Vhinkyct2OxrA1nhjiRAss
	fy3E37rZ6Zy3xEef41xV34YqiIOFHa9Dnf63mr5TRWQQRXF11NEJJD6qq88WFgUeC7T5/0nqJXd
	bKkLjyRXh3emGgAlhW6YpQgIJ2XliXrReMoyC9Pj89UIYVOgw+7Ii7s2NhNbrE6Ke/ShF41XJSV
	xfHWGY1OcJIO4=
X-Google-Smtp-Source: AGHT+IE9nGXTZitxr81meInQyut8aU/u+gVr7Mes1WvVubhCsLQRqZXy5l2rWotlZ0sdQizDg1wgjA==
X-Received: by 2002:a05:6000:2882:b0:3b4:9721:2b19 with SMTP id ffacd0b85a97d-3b60e4b8693mr9647013f8f.11.1752848411159;
        Fri, 18 Jul 2025 07:20:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/3] x86/match-cpu: Improvements to x86_match_cpu()
Date: Fri, 18 Jul 2025 15:20:04 +0100
Message-Id: <20250718142006.2471129-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250718142006.2471129-1-andrew.cooper3@citrix.com>
References: <20250718142006.2471129-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Xen's use of struct x86_cpu_id is a bit different to Linux's, so we can
simplify the loop termination condition.  Leave a comment explaining Xen's
assumptions.

Switch to Xen style, as we've properly devated from Linux, and switch to the
new vendor/family/model names.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New

There is a marginal code generation improvement, because of not needing to
hold as many registers live over the loop termination check.
---
 xen/arch/x86/cpu/common.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index f221b9497c61..a659ea7bf604 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -1007,19 +1007,26 @@ void cpu_uninit(unsigned int cpu)
 
 const struct x86_cpu_id *x86_match_cpu(const struct x86_cpu_id table[])
 {
-	const struct x86_cpu_id *m;
-	const struct cpuinfo_x86 *c = &boot_cpu_data;
+    const struct x86_cpu_id *m;
+    const struct cpuinfo_x86 *c = &boot_cpu_data;
 
-	for (m = table; m->vendor | m->family | m->model | m->feature; m++) {
-		if (c->x86_vendor != m->vendor)
-			continue;
-		if (c->x86 != m->family)
-			continue;
-		if (c->x86_model != m->model)
-			continue;
-		if (!cpu_has(c, m->feature))
-			continue;
-		return m;
-	}
-	return NULL;
+    /*
+     * Although derived from Linux originally, Xen has no valid rows where
+     * ->vendor is nonzero, so used this in place of checking all metadata.
+     */
+    for ( m = table; m->vendor; m++ )
+    {
+        if ( c->vendor != m->vendor )
+            continue;
+        if ( c->family != m->family )
+            continue;
+        if ( c->model != m->model )
+            continue;
+        if ( !cpu_has(c, m->feature) )
+            continue;
+
+        return m;
+    }
+
+    return NULL;
 }
-- 
2.39.5


