Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 809F3AC51FE
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 17:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998559.1379290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwCX-0000pd-Ph; Tue, 27 May 2025 15:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998559.1379290; Tue, 27 May 2025 15:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwCX-0000o4-Mk; Tue, 27 May 2025 15:26:49 +0000
Received: by outflank-mailman (input) for mailman id 998559;
 Tue, 27 May 2025 15:26:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wzHE=YL=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uJwCW-0000Yz-71
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 15:26:48 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 011ee120-3b0f-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 17:26:47 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-603fdd728ccso5129860a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 08:26:47 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6049d482cc7sm3442712a12.19.2025.05.27.08.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 08:26:46 -0700 (PDT)
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
X-Inumbo-ID: 011ee120-3b0f-11f0-a2fd-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748359607; x=1748964407; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTriMCUpsmVzD3Jivpx0DCt9g1tummWqKXoec3hAy9A=;
        b=gXnb4CsWQqhjfuAPOKpuGa3LrOWxPjlU0tx4QjfbpqirRKIyrl6VtyKPmv4BQISD2m
         MzRafvAq2FRv6qjC32W6gCYQzubiCw5OYDxdV392YBgNEnXbbvdWGiT0OZc02x5EBO3Z
         PVzB8NGBDDDj9kBCqAh0a3yYRxBiSOwgWK+fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748359607; x=1748964407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTriMCUpsmVzD3Jivpx0DCt9g1tummWqKXoec3hAy9A=;
        b=jEF/WuVuk3ZUS5EFR+b1P75/8LWWPxIDLMpmOMU+ko5/jUSGycfDMr+h6olwrxjUKd
         +3bS/bvNQEb47nDT+JiiyCCcFMHl6+e2jrkm3WwYSqIQmvqxPBgyEFVSpsLhkXfvw+ja
         hPxnpef1M1/rl/o1dkroZhKM1BiUPC1l3RF4Q9JpTmwsi7pzaJws5JZuFD6um5AeB7j1
         RzbkQ7utOsatsjy0qdqiYg3fP/LXShu+trSMUhNEKjSTxVtCHsL5AL3Q2rHCjwI6eDiv
         +0vLD5pQKVH4WGjnH9Ic+o6uo2APW6Es+C/Im5BT1Qe1JIR7ko3FtcmwKV6OvRuxHjpz
         +qYw==
X-Gm-Message-State: AOJu0YwkGMMVbvNMAZXHyozvKPeYoSeyUdsJcr0fzMjaauMCofIqcHDJ
	SvqwsQe3NHfGPPy4D3OhHJWBdGt3zi2cesNt5u7t0+cOwD+MO+QNUIvx93+djULg3/ANCJgtSHJ
	zOe8=
X-Gm-Gg: ASbGnctepFZWtoq+sWix6w4DvuGZG7+HOKZWP4zbWACxoUc9lvLXPu+4Y1U6l0B03LN
	QEBG2i1yco+TBokKRBVcJDuzuSHeyNkhvQJuDmVPUUwg2ALzItiTjARuaqkD+Pwvs86J3GelR3d
	LXKFsG9Maez1/ko37ultR88KW06XxBxdYIRg8xc6TmMM63H8ueUiJrMqBUpmU8krChbAPpsz1a8
	OphVltAp0srYq7Hm3JhURuIOTK/AI40jOYv9NgWASc4KVXuLPXz+56Mu/Z1glJpEzZ813ZZXQCY
	OFKE8N3JKIhITw4v6CyWRTg9c3Xe1fUjkI46adiMj8UsHJlYidGkuzWLOsKUQJXYm/fuVxqRx1Q
	=
X-Google-Smtp-Source: AGHT+IGPiRyn9Jyzp+w5FlpiZc0eFrl84dMxOvxZYx6V5NsGForpQSY6lEG2moiGtlnV3uaoTQHBYQ==
X-Received: by 2002:a05:6402:520b:b0:604:e33f:e5ac with SMTP id 4fb4d7f45d1cf-604e33fe6efmr4416878a12.2.1748359606947;
        Tue, 27 May 2025 08:26:46 -0700 (PDT)
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
Subject: [PATCH v3 2/5] public/sysctl: Clarify usage of pm_{px,cx}_stat
Date: Tue, 27 May 2025 16:26:32 +0100
Message-ID: <20250527152635.2451449-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527152635.2451449-1-ross.lagerwall@citrix.com>
References: <20250527152635.2451449-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v3:

* Moved some changes to patch 1
* Clarified some comments

 xen/include/public/sysctl.h | 39 +++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 906a3364fbd9..b1e3a48194d8 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -221,9 +221,9 @@ struct pm_px_stat {
      * OUT: total Px states (PMSTAT_get_max_px, PMSTAT_get_pxstat)
      */
     uint8_t total;
-    uint8_t usable;       /* usable Px states */
-    uint8_t last;         /* last Px state */
-    uint8_t cur;          /* current Px state */
+    uint8_t usable;       /* OUT: usable Px states (PMSTAT_get_pxstat) */
+    uint8_t last;         /* OUT: last Px state (PMSTAT_get_pxstat) */
+    uint8_t cur;          /* OUT: current Px state (PMSTAT_get_pxstat) */
     /*
      * OUT: Px transition table. This should have total * total elements.
      *      As it is a 2-D array, this will not be copied if it is smaller than
@@ -235,14 +235,33 @@ struct pm_px_stat {
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
+     * OUT: Required size of pc[] for all known to Xen entries to be written
+     *      (PMSTAT_get_cxstat)
+     */
+    uint32_t nr_pc;
+    /*
+     * IN: entry nr in cc[] (PMSTAT_get_cxstat)
+     * OUT: Required size of cc[] for all known to Xen entries to be written
+     *      (PMSTAT_get_cxstat)
+     */
+    uint32_t nr_cc;
+    /*
+     * OUT: (PMSTAT_get_cxstat)
      * These two arrays may (and generally will) have unused slots; slots not
      * having a corresponding hardware register will not be written by the
      * hypervisor. It is therefore up to the caller to put a suitable sentinel
-- 
2.49.0


