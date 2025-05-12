Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1BAAB3B12
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 16:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981608.1368029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUQw-00058D-Vy; Mon, 12 May 2025 14:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981608.1368029; Mon, 12 May 2025 14:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUQw-00056g-Rv; Mon, 12 May 2025 14:47:10 +0000
Received: by outflank-mailman (input) for mailman id 981608;
 Mon, 12 May 2025 14:47:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WmCO=X4=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uEUQv-0004eT-F8
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 14:47:09 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb103bbf-2f3f-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 16:47:09 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ad238c68b35so432066366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 07:47:09 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd219sm634459366b.141.2025.05.12.07.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 07:47:07 -0700 (PDT)
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
X-Inumbo-ID: fb103bbf-2f3f-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747061228; x=1747666028; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m24oQdGhZQ3HdAHSB/EUXyg1ydozRabCfdfrnP4B+2U=;
        b=ElR5qTzyoUwABz4TsbgeWmfT8L9eFVNBQkXuMoKaNcQYRWVsADjZ8I7f/DWxOPOTqy
         ZdpYFN7V/0eKEzy3Awh5vN3M623PFeLcHbNCGghvhQ24OKvEfQm0STLPb6BRC1b4FZSY
         YdlQdg+M3GLYUvVgvYitTVKD2uc5/8DZNckFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061228; x=1747666028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m24oQdGhZQ3HdAHSB/EUXyg1ydozRabCfdfrnP4B+2U=;
        b=CusvXPfAXig9oqRSM13CWAavox0ikNVooUqyoZXW6KOU2ikOXGXzImY4W+aXg/gdhT
         K1VxZifdLSq5F+DCRjmkb555K6/Bb9JMajkXeBx2sGQApxyaRLhIbLBFBT8OgdlIXf0u
         +ZsU+d9A/eJgDG4HxITyrG+rCZZT1A2NCsYtN1aW3uIE4amQ3ndVOXKUVYVm17729SPT
         kG43pHaBSJXSFvytKD6rCxtsrENCPVAynnhLvkGGXIdwCyVSpEOlhJISmtVIQiX3Z+is
         YJkOrhycCZUg/dggHPcjQgXFZJoCuSQAYUTfeaNsmVhEq3hunw4YOV9eik/fbXhutJe5
         5rLA==
X-Gm-Message-State: AOJu0Yx7FCRD7rNbPH6yBRfFFuuc9istSgYc6bpRERJbipY34mX06UMI
	lMuu8uVoDFaJMCgLdx9rBMs0Y55chbZP+rUrI7n8/z8N9c58Ni8f7UTB/ahlTcO7RLq6V+fwpXU
	=
X-Gm-Gg: ASbGnctHje5yNDE5McFMCMjFxypinZK18jzxyJjXYI5+odhsvHacvrD26v0lWSqItys
	VJWmjwqdx6bT8/WZ1JkBNmzNWa8Q7Xj4/m34npyTlv8s3g+GO/KENRhvk4qxLIK2OnoDdgkASBG
	do96JoL5wWlg73D7Xc3SIuHA88dvSzSNrQ1zIj7u7pXqNvDXZGMUVfDgQTdQVLJ4e9reWK0FOvo
	5JkXlsgy793tnDBQYRrNOMCVbHs2NncQT46ugIqycADJB5eh0bS/3yCtAqy0r76e3bmTkXO6nZ4
	bxeAUuYevJZLjiRfN1Hx+wnbaD2amBCTyfUPcYv1+4w6eS9jbeBGQBKNj5On2kCSY/Z0INNatyY
	=
X-Google-Smtp-Source: AGHT+IGDg68Dia+Sb7azYtZ3RqgcJF32Yh0aCRJgxz8nmhA7pyfOvZlCoeeojNEcTdkODeO9dUl6+g==
X-Received: by 2002:a17:907:6c12:b0:ad2:4cac:46fc with SMTP id a640c23a62f3a-ad24cac5916mr605848566b.36.1747061228219;
        Mon, 12 May 2025 07:47:08 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/5] public/sysctl: Clarify usage of pm_{px,cx}_stat
Date: Mon, 12 May 2025 15:46:53 +0100
Message-ID: <20250512144656.314925-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512144656.314925-1-ross.lagerwall@citrix.com>
References: <20250512144656.314925-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

* New in v2.

 xen/include/public/sysctl.h | 52 ++++++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index b0fec271d36f..449f0161920a 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -215,23 +215,51 @@ typedef struct pm_px_val pm_px_val_t;
 DEFINE_XEN_GUEST_HANDLE(pm_px_val_t);
 
 struct pm_px_stat {
-    uint8_t total;        /* total Px states */
-    uint8_t usable;       /* usable Px states */
-    uint8_t last;         /* last Px state */
-    uint8_t cur;          /* current Px state */
-    XEN_GUEST_HANDLE_64(uint64) trans_pt;   /* Px transition table */
+    /*
+     * IN: Number of elements in pt, number of rows/columns in trans_pt
+     *     (PMSTAT_get_pxstat)
+     * OUT: total Px states (PMSTAT_get_max_px, PMSTAT_get_pxstat)
+     */
+    uint8_t total;
+    uint8_t usable;       /* OUT: usable Px states (PMSTAT_get_pxstat) */
+    uint8_t last;         /* OUT: last Px state (PMSTAT_get_pxstat) */
+    uint8_t cur;          /* OUT: current Px state (PMSTAT_get_pxstat) */
+    /*
+     * OUT: Px transition table. This should have total * total elements.
+     *      This will not be copied if it is smaller than the hypervisor's
+     *      Px transition table. (PMSTAT_get_pxstat)
+     */
+    XEN_GUEST_HANDLE_64(uint64) trans_pt;
+    /* OUT: This should have total elements (PMSTAT_get_pxstat) */
     XEN_GUEST_HANDLE_64(pm_px_val_t) pt;
 };
 
 struct pm_cx_stat {
-    uint32_t nr;    /* entry nr in triggers & residencies, including C0 */
-    uint32_t last;  /* last Cx state */
-    uint64_aligned_t idle_time;                 /* idle time from boot */
-    XEN_GUEST_HANDLE_64(uint64) triggers;    /* Cx trigger counts */
-    XEN_GUEST_HANDLE_64(uint64) residencies; /* Cx residencies */
-    uint32_t nr_pc;                          /* entry nr in pc[] */
-    uint32_t nr_cc;                          /* entry nr in cc[] */
     /*
+     * IN:  Number of elements in triggers, residencies (PMSTAT_get_cxstat)
+     * OUT: entry nr in triggers & residencies, including C0
+     *      (PMSTAT_get_cxstat, PMSTAT_get_max_cx)
+     */
+    uint32_t nr;
+    uint32_t last;  /* OUT: last Cx state (PMSTAT_get_cxstat) */
+    /* OUT: idle time from boot (PMSTAT_get_cxstat)*/
+    uint64_aligned_t idle_time;
+    /* OUT: Cx trigger counts, nr elements (PMSTAT_get_cxstat) */
+    XEN_GUEST_HANDLE_64(uint64) triggers;
+    /* OUT: Cx residencies, nr elements (PMSTAT_get_cxstat) */
+    XEN_GUEST_HANDLE_64(uint64) residencies;
+    /*
+     * IN: entry nr in pc[] (PMSTAT_get_cxstat)
+     * OUT: Index of highest non-zero entry set in pc[] (PMSTAT_get_cxstat)
+     */
+    uint32_t nr_pc;
+    /*
+     * IN: entry nr in cc[] (PMSTAT_get_cxstat)
+     * OUT: Index of highest non-zero entry set in cc[] (PMSTAT_get_cxstat)
+     */
+    uint32_t nr_cc;
+    /*
+     * OUT: (PMSTAT_get_cxstat)
      * These two arrays may (and generally will) have unused slots; slots not
      * having a corresponding hardware register will not be written by the
      * hypervisor. It is therefore up to the caller to put a suitable sentinel
-- 
2.49.0


