Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C561AB26BD6
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 18:04:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081977.1441950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umaR1-00012C-0x; Thu, 14 Aug 2025 16:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081977.1441950; Thu, 14 Aug 2025 16:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umaR0-000110-TT; Thu, 14 Aug 2025 16:04:10 +0000
Received: by outflank-mailman (input) for mailman id 1081977;
 Thu, 14 Aug 2025 16:04:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Upc=22=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1umaQz-0000md-FD
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 16:04:09 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f937e03-7928-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 18:04:09 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45a1b0c52f3so5799915e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 09:04:09 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45a1c749143sm28269975e9.16.2025.08.14.09.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 09:04:07 -0700 (PDT)
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
X-Inumbo-ID: 4f937e03-7928-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755187448; x=1755792248; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6B37Ba3gyt57gIs6nirOWojNHZXWUq/F0/HSDXW+MY=;
        b=gGQr3+xD/BTbo1c6cIZ8tBypqbIr4swDpXQTM0uT8zFx4YUer290zi5exTUHCmc8j8
         Poxm9A5lDiVe9/POBY3rbfcOdyjKK01bygZtHVVYWlZanWmOmvT13kYYgoHlFsWeLVNV
         T8rh9opjXdfdvqkC2iJrAXSLS5D1sWK76WNgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187448; x=1755792248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6B37Ba3gyt57gIs6nirOWojNHZXWUq/F0/HSDXW+MY=;
        b=M3Uu3NOG24NsmBsLNnlpX9m35OBhk44Qnq4AHdUiKmIIt7JmyhxqFe12RkziP2Khif
         QI4PRjWh0eRtJcqBHzsZPvDi1GbMpM407kp3pT+WO5OFP3T4Ga0UcApKDpO9o7hC8Xcz
         GamgIDgEeWgBXqUbSvgFsPBXjVXWZ4bgUgLGAJcpDhrap++whJNT3IRtdH82qVkKWyp3
         7rxc8w6LHKJ/CX9RT3bf0Rz9h4SpJh0vUhYoaI6PbYgUFNioPyGPVcwoKDF4N2IxUqWk
         nGrDSMcqaI8EAMJU5HPDJKcMaPuZzWLOaoNKa6ogkdONeycpekWky8UrltVhJnV9BkHO
         YMfA==
X-Gm-Message-State: AOJu0YyN8Dz/BIiuvHsbEBMpZgSGLVXt6DBYzBVPoVDlMb3Uz6Y8RXfy
	jtR8JR0vU3xtlPJ/I4yO+opMkGS0+hkZqJEgIlOKiNDi2egunPAyvAWp3E5IwuDlxWq1GNX1auR
	8aLJf
X-Gm-Gg: ASbGnctpvRASPjfFbyijsY2tmUZ/ZhmDis1av/ZP7j/eCfTorLaE/G2hEcbnXtqrFdb
	eVcrLm+gDIQIZPSsZrLApV/MY6gi1ZC7hdzj6xbvRbnKlb98xr+PrPjdAs1ylak4n7KRSbbgWKl
	6mm/jzJsdbt1m4Ltcn8EnYzvSMsc5qfL5pWD2o1wz+oms9Ej849LOetQO4R73Ra2014zLk7WrFz
	igMylqxeVQEwDF84q/sjcbo1pjUbf7arFqqOH5McM1gMONJdY/HgH8NpcOssRHDVdMlB0t2SpOz
	Hz9F40FPDLbL6mRghyqSBSbtgnRNfRmke1w80SF+bmaZcXN78JgQsQrTS2xWv4hSOLmJxOAnPP2
	dU22rhzFKkHw/bWwApiKeGtJzG07leFKHsyX80vr17H3bhoFagO3kh7ye/NcXTic79w==
X-Google-Smtp-Source: AGHT+IHz1EWE4bvPiHqh//WTyRN3eUMg7wkQwNpRCuR6tA5I9ANzFfbUOhz3S4ExD0/q0mmBuNpGvQ==
X-Received: by 2002:a05:600c:3b87:b0:459:d709:e5cf with SMTP id 5b1f17b1804b1-45a1b602b85mr34984975e9.3.1755187448072;
        Thu, 14 Aug 2025 09:04:08 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: stewart.hildebrand@amd.com,
	Jiqian.Chen@amd.com,
	jbeulich@suse.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 2/5] xen/vpci: make BAR mapping more resilient for the hardware domain
Date: Thu, 14 Aug 2025 18:03:55 +0200
Message-ID: <20250814160358.95543-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814160358.95543-1-roger.pau@citrix.com>
References: <20250814160358.95543-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The logic in map_range() will bubble up failures to the upper layer, which
will result in any remaining regions being skip, and for the non-hardware
domain case the owner domain of the device would be destroyed.  However for
the hardware domain the intent is to continue execution, hopping the
failure to modify the p2m could be worked around by the hardware domain.

To accomplish that in a better way, ignore failures and skip the range in
that case, possibly continuing to map further ranges.

Since the error path in vpci_process_pending() should only be used by domUs
now, and it will unconditionally end up calling domain_crash(), simplify
it: there's no need to cleanup if the domain will be destroyed.

No functional change for domUs intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/vpci/header.c | 51 +++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 23 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index b9756b364300..1035dcca242d 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -64,7 +64,8 @@ static int cf_check map_range(
             printk(XENLOG_G_WARNING
                    "%pd denied access to MMIO range [%#lx, %#lx]\n",
                    map->d, map_mfn, m_end);
-            return -EPERM;
+            rc = -EPERM;
+            goto done;
         }
 
         rc = xsm_iomem_mapping(XSM_HOOK, map->d, map_mfn, m_end, map->map);
@@ -73,7 +74,7 @@ static int cf_check map_range(
             printk(XENLOG_G_WARNING
                    "%pd XSM denied access to MMIO range [%#lx, %#lx]: %d\n",
                    map->d, map_mfn, m_end, rc);
-            return rc;
+            goto done;
         }
 
         /*
@@ -87,17 +88,27 @@ static int cf_check map_range(
 
         rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(map_mfn))
                       : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(map_mfn));
-        if ( rc == 0 )
-        {
-            *c += size;
-            break;
-        }
         if ( rc < 0 )
         {
             printk(XENLOG_G_WARNING
                    "Failed to %smap [%lx %lx] -> [%lx %lx] for %pd: %d\n",
                    map->map ? "" : "un", s, e, map_mfn,
                    map_mfn + size, map->d, rc);
+            goto done;
+        }
+        if ( rc == 0 )
+        {
+ done:
+            if ( is_hardware_domain(map->d) )
+            {
+                /*
+                 * Ignore failures for the hardware domain and skip the range.
+                 * Do it as a best effort workaround to attempt to get the
+                 * hardware domain to boot.
+                 */
+                rc = 0;
+                *c += size;
+            }
             break;
         }
         ASSERT(rc < size);
@@ -213,28 +224,22 @@ bool vpci_process_pending(struct vcpu *v)
             return true;
         }
 
-        if ( rc )
+        if ( rc && !is_hardware_domain(v->domain) )
         {
-            spin_lock(&pdev->vpci->lock);
-            /* Disable memory decoding unconditionally on failure. */
-            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
-                            false);
-            spin_unlock(&pdev->vpci->lock);
-
-            /* Clean all the rangesets */
-            for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
-                if ( !rangeset_is_empty(header->bars[i].mem) )
-                     rangeset_purge(header->bars[i].mem);
-
-            v->vpci.pdev = NULL;
-
             read_unlock(&v->domain->pci_lock);
 
-            if ( !is_hardware_domain(v->domain) )
-                domain_crash(v->domain);
+            domain_crash(v->domain);
 
             return false;
         }
+        ASSERT(!rc);
+        /*
+         * Purge rangeset to deal with the hardware domain having triggered an
+         * error.  It shouldn't be possible, as map_range() will always shallow
+         * errors for hardware domain owned devices, and
+         * rangeset_consume_ranges() itself doesn't generate any errors.
+         */
+        rangeset_purge(bar->mem);
     }
     v->vpci.pdev = NULL;
 
-- 
2.49.0


