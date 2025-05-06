Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298A3AACD3A
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 20:27:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977940.1364837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCN0R-0002jp-Cs; Tue, 06 May 2025 18:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977940.1364837; Tue, 06 May 2025 18:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCN0R-0002gp-9K; Tue, 06 May 2025 18:27:03 +0000
Received: by outflank-mailman (input) for mailman id 977940;
 Tue, 06 May 2025 18:27:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7voa=XW=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uCN0P-0002gj-Ci
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 18:27:01 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3014f70-2aa7-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 20:27:00 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-549963b5551so6790988e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 11:27:00 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee173sm2093370e87.127.2025.05.06.11.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 11:26:57 -0700 (PDT)
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
X-Inumbo-ID: b3014f70-2aa7-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746556019; x=1747160819; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulkQy97n87PM4Cu6oVIfWw2jKyekJRa0XlxEPEhm5IE=;
        b=NcKQrG9o3xfpAHbzg3YPYbbtgPJ0OHUJBu1sluaNzoXLYTKgsllZSBUigZqCU24D4z
         fU4vcyaJObOCaAmCSSi7q/0iBjVpjwQFqcBTI4FsHEiipkfcRN6z588hP4mO1uFM+rjs
         WdybpgL4S1kzNpkonR9j/BCVoXAdb3zp67JHYn4twLmm/UxZxSg42jgwSRUesr8era3I
         79LnB6dmlEwm3cA+Oqo12Bf3jRJrVJV6515Yy5/yukFzD06ImDFLv+ydyCakP4M/5u+3
         1jUJBQSVsFYwnOfh+ODllqIatiA7/sqf+x1JmJcb214ZMKsWlS0Ptv+v6jCICntPS2aX
         4qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746556019; x=1747160819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ulkQy97n87PM4Cu6oVIfWw2jKyekJRa0XlxEPEhm5IE=;
        b=HWFCl3GAPw/IFQJRo+mo0VpS0JINGsRmqeVk7TGA6QPBxCM9twBGaEWoALKsNVX8vC
         8yXsrYEt7+YZ5UlYOEcbqkFFPk+4+RpXTa+hzXPaFnEH8/c9x8BQc9s88DvzDCzXU0WK
         i+TdxO6/q9+KXPm9oFAsOeg9Eoh5nZQIVDxOFFMW2ZyalkNxsFjFZtPCNQSXYslSbdV0
         5PHlXq2P1zevf04HUGVJOuMsjRwJW6awpoqHMRiTmdJAWB8P3ALi3cYGjqevK7BLreQT
         +yZtprkkepTY9C5IUAghoFGJo/rHdO54LTi8OIpujt2SW7EOtlN3D0Z14Zycw9eVTbXe
         C/SA==
X-Forwarded-Encrypted: i=1; AJvYcCVLwsrYvSdjutD9XjxSlMO67QGFGJo04JuJ4mm8yCuTwi9BDX9iFYf6Cf6LD4GycgMrQbNEM3OMR9c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxswo14l73huCEGrZRRvQYHdfbMDeznumK81tmEo0mn9rFdnzHL
	+oCUCkRjV24t+tVfLW09Bi+dIGFKEA3UmApu208ZipZ9ni43iZfC
X-Gm-Gg: ASbGnctxtQrtITDM7be510ONn1YcLYAT1vU0NmLKPCqzxC6X1WcHCtSERt1x24+VCid
	vb5vqxw9g0/UO+ps2yRUEUAAmLci1cQTES+X1zVRdCCKENVHOV6QXgDM0jtHgAk1q4uT6VODWGq
	Y/bcd/BKmD1XdinpVUg9Ik5rDvJueJ7IrmD0dlLZQvD35Fg21Gp2+88bzeZrxUylLSdENuXRDJO
	vo4NEw/nxydHxa9UicDsuMc/cE5DGHmJqqrMH3anV50N0WlHG2BUCS/8X02qhCUGQgxzzpYT6Dy
	rRxVwP3VlzqmMRup0pnPZl91Jc27pzE21LAMww8jR4EgXt5VQKNKohTwv22VQy50VDrZ/yF5bDw
	wZGi597Itzx/+
X-Google-Smtp-Source: AGHT+IHzaJIdUGZqVsMqaaLKD2N5KnA7xk6kTtRN63mmTk/vnTIZ/huHbnC5q5MQJQGLHrEoa/muAg==
X-Received: by 2002:a05:6512:20d8:b0:54b:117b:952e with SMTP id 2adb3069b0e04-54fb95ba664mr159760e87.55.1746556019187;
        Tue, 06 May 2025 11:26:59 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	alex.pentagrid@gmail.com,
	peter.maydell@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PULL v1 1/2] xen: mapcache: Fix finding matching entry
Date: Tue,  6 May 2025 20:26:46 +0200
Message-ID: <20250506182647.302961-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506182647.302961-1-edgar.iglesias@gmail.com>
References: <20250506182647.302961-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aleksandr Partanen <alex.pentagrid@gmail.com>

If we have request without lock and hit unlocked or invalid
entry during the search, we remap it immediately,
even if we have matching entry in next entries in bucket.
This leads to duplication of mappings of the same size,
and to possibility of selecting the wrong element
during invalidation and underflow it's entry->lock counter

Signed-off-by: Aleksandr Partanen <alex.pentagrid@gmail.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 698b5c53ed..2c8f861fdb 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -376,12 +376,12 @@ tryagain:
 
     entry = &mc->entry[address_index % mc->nr_buckets];
 
-    while (entry && (lock || entry->lock) && entry->vaddr_base &&
-            (entry->paddr_index != address_index || entry->size != cache_size ||
+    while (entry && (!entry->vaddr_base ||
+            entry->paddr_index != address_index || entry->size != cache_size ||
              !test_bits(address_offset >> XC_PAGE_SHIFT,
                  test_bit_size >> XC_PAGE_SHIFT,
                  entry->valid_mapping))) {
-        if (!free_entry && !entry->lock) {
+        if (!free_entry && (!entry->lock || !entry->vaddr_base)) {
             free_entry = entry;
             free_pentry = pentry;
         }
-- 
2.43.0


