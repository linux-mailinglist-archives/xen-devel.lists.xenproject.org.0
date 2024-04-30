Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 266F98B7D96
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715053.1116515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgV-0004RX-SO; Tue, 30 Apr 2024 16:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715053.1116515; Tue, 30 Apr 2024 16:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgV-0004OG-KC; Tue, 30 Apr 2024 16:50:27 +0000
Received: by outflank-mailman (input) for mailman id 715053;
 Tue, 30 Apr 2024 16:50:26 +0000
Received: from [94.247.172.50] (helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/Z8=MD=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s1qgU-0003oL-Lx
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:50:26 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7785fee-0711-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 18:50:14 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2dd6c14d000so73581731fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 09:50:14 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a19e045000000b0051bf283570dsm2372896lfj.254.2024.04.30.09.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:50:10 -0700 (PDT)
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
X-Inumbo-ID: b7785fee-0711-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714495814; x=1715100614; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwamhPCUJY+N7YTIaqBuMDMNKLfZW1hiEtgPXWAFdNA=;
        b=fEwZHCpuVwYdInTgp+ATzSHvKMD61A0rfFvyC23+fWdzizH95yI1KvoWNv1pnSBGoj
         qv6ntGYnb6bnU6FMxURJdsrWY8c1ikv1sqGKsUh4Xkm+8a1MCB2Rh+VHqllzq9CyeSJT
         P6T5mSzsa0VoK+4AM5nYo5MiIRFdN/bxU92rVCreibzlN5rQWu65No5NFQcm3trCSDo8
         iOKvRRRrixfF3qUqKsQOOlHu+zZrPbWDbcZT5TrLeu8eqYfJ+fX3AC1D119PlKMiYhoy
         hd4PgGMvGh9luUmSkaTUVxzSLvT0qSFuUwpZYnVqZB97TbkI/pml4Dr6cT+p9VssDCwN
         qGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714495814; x=1715100614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwamhPCUJY+N7YTIaqBuMDMNKLfZW1hiEtgPXWAFdNA=;
        b=d3rEsn4NhSw3iphvcZNpZxpDDxIFjGklJlGp0o2/SNQDlC9mc9f2iNECNLR5BvaG8r
         Gi4vliZM1Mrv96CymbNlqeErWSS9Aj50L8KdNKd4BrGy5Yez2f88kbqEvxMt+t3N56jI
         icfbpG/+byTJi9rPUMzoQTvU6nKbx3E7sDesYlP9tc0O9BxPGeQSzXQX3yH+SNiHLdH2
         C+nlQZuWvBTW7h8sOdafpEJe7mvHeUDZhWTZ9PvnekhwKq59gRrBAvpd3IjRbMGPxwW2
         gXTjX3+L3dyuukbuaJkh0dkk6s6j0RWXN20mGEIr+ctgd2dmapND76i+6uG2flSLFBF3
         pKIA==
X-Forwarded-Encrypted: i=1; AJvYcCXLBcrfoDyEvm1dc+lrJZlogJbMxLomDJ2G5Xj9aVFg7QiN/AR+++I4apSpbo5stz6eV1OAorBd3hkhcUKUMWyusnePmmTv20ySnboFmvU=
X-Gm-Message-State: AOJu0YwfDjLubz6NpAwdRtoNu0VS1nXDpZQ7LbbdcCGO1C8z4J3yuy9V
	RkNeZi8joXRAW3ul8lvqIh38O5cjHjLL13Uxl8ZitpnIQ3dCXpdf
X-Google-Smtp-Source: AGHT+IHoJlSMsC6sfM5UXupD/S6braHFg22PmZ7CRhw+67o7aWoTbAdWexTYOX7plCeimOm047+9GQ==
X-Received: by 2002:ac2:5a5b:0:b0:519:6a93:ed3a with SMTP id r27-20020ac25a5b000000b005196a93ed3amr25393lfn.23.1714495812082;
        Tue, 30 Apr 2024 09:50:12 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 02/17] xen: let xen_ram_addr_from_mapcache() return -1 in case of not found entry
Date: Tue, 30 Apr 2024 18:49:24 +0200
Message-Id: <20240430164939.925307-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240430164939.925307-1-edgar.iglesias@gmail.com>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Juergen Gross <jgross@suse.com>

Today xen_ram_addr_from_mapcache() will either abort() or return 0 in
case it can't find a matching entry for a pointer value. Both cases
are bad, so change that to return an invalid address instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 7f59080ba7..b7cefb78f7 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -394,13 +394,8 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
         }
     }
     if (!found) {
-        trace_xen_ram_addr_from_mapcache_not_found(ptr);
-        QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
-            trace_xen_ram_addr_from_mapcache_found(reventry->paddr_index,
-                                                   reventry->vaddr_req);
-        }
-        abort();
-        return 0;
+        mapcache_unlock();
+        return RAM_ADDR_INVALID;
     }
 
     entry = &mapcache->entry[paddr_index % mapcache->nr_buckets];
@@ -409,7 +404,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
     }
     if (!entry) {
         trace_xen_ram_addr_from_mapcache_not_in_cache(ptr);
-        raddr = 0;
+        raddr = RAM_ADDR_INVALID;
     } else {
         raddr = (reventry->paddr_index << MCACHE_BUCKET_SHIFT) +
              ((unsigned long) ptr - (unsigned long) entry->vaddr_base);
-- 
2.40.1


