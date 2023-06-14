Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7E57304DC
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 18:27:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549035.857361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9TKs-0006sp-2O; Wed, 14 Jun 2023 16:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549035.857361; Wed, 14 Jun 2023 16:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9TKr-0006pw-Ul; Wed, 14 Jun 2023 16:27:05 +0000
Received: by outflank-mailman (input) for mailman id 549035;
 Wed, 14 Jun 2023 16:27:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiGM=CC=citrix.com=prvs=52225e267=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q9TKq-0006pW-9V
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 16:27:04 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4974450a-0ad0-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 18:27:01 +0200 (CEST)
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
X-Inumbo-ID: 4974450a-0ad0-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686760021;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XX7YppEKZlH1WqyJ0YIc01s0i6uoLco8Wx3ZU7yKGJU=;
  b=OMzhBa47OkOGA4WmfeeVJb0FbBN4tgJvnv4dBLlbHjbNmPh/ZM+L38BK
   o9LkCcYboFx37sO6hgGWhK1UMLmrEIQjopoXYd/1ZB8A97icXl1rDQpnb
   uJGDQx+rStvRi1mM4vUtu8DAUGd+tGNVPfVyrt3UHI84J5djpMeMgWUSZ
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112803798
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:qX/4d6BMRmoqChVW/9Xjw5YqxClBgxIJ4kV8jS/XYbTApGkg0WZRx
 2YcCD2CPvzeajehco13YdvkpB8HuMXVm9NrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1B4gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw+c1tWDBU6
 9AkEhsuSxzSl8DumbClc7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4XQFZ0OwRfIz
 o7A12/eL0gIP/ed82fbrDH3msTzgQDqWI1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaGsQQVX954Gugz+gaLjKHT5m6xBGIJUzpAY9wOr9ItSHoh0
 Vrht8jyGTVlvbmRSHSc3rSZtzW/PW4SN2BqTTAAZRsI5Z/kuo5bphDSStduFoalg9uzHiv/q
 xi0qyw5i6QWnNQ8/ayx9lDagBqhvpHMCAUy423/VG+/8hlwYoLjYoWy8EXa9t5JNoPfRV6E1
 EXogODHsrpIV8vU0nXQHqNURurBC+u53CP0gnV1Rsg76RiRwVWAWIwB8BMmfUV3C5NREdP2W
 3M/qT+99bcKYiv0M/UrO93tYyg55fO+TIq4D5g4evILO8EsL1HfoUmCcGbKhwjQfF4QfbbT0
 HtxWeKlFj4kBKtu11JarM9NgOZwlkjSKY4+LK0XLihLMpLEPhZ5sZ9fbDOzghoFxK2Fuh7J1
 N1UKtGHzR5SOMWnPHmJr95KdwxScyhmbXwTlyCwXrTaSjeK5Ul7U6OBqV/fU9ENc1tpehfgo
 SjmBx4wJKvXjnzbMwSaAk2Pm5u2NauTWUkTZHR2VX7xgihLXGpaxPtHH7MtY6Id/fBupdYtC
 aFtlzOoXq4eFVwqOl01MfHAkWCVXE/63l3eZHH7MGNXklwJb1Whx+IItzDHrEEmZhdbf+Nny
 1F8/ms3maY+ejk=
IronPort-HdrOrdr: A9a23:i+fX1qymQC6Ble5g78ZuKrPwIr1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I++rhBEDwexLhHPdOiOF6UItKNzOW21dAQrsSiLfK8nnNHDD/6/4Y9Y
 oISdkbNDQoNykZsfrH
X-Talos-CUID: =?us-ascii?q?9a23=3AFFBGCGjKM5/TGnbFdNyZBwsrETJucVbHlSbKPWO?=
 =?us-ascii?q?EM01KbbHEWX3IoaF6qp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3ATnJUqQ+bauPiSdru1jaIkfSQf8xPzv28A2sPq8h?=
 =?us-ascii?q?Y5YrfKQdMJxSMjDviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,243,1681185600"; 
   d="scan'208";a="112803798"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
	<jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v2] xen/grant: Purge PIN_FAIL()
Date: Wed, 14 Jun 2023 17:26:46 +0100
Message-ID: <20230614162646.3230716-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The name PIN_FAIL() is poor; it's not used only pinning failures.  More
importantly, it interferes with code legibility by hiding control flow.
Expand and drop it.

 * Drop redundant "rc = rc" assignment
 * Rework gnttab_copy_buf() to be simpler by dropping the rc variable

As a side effect, this fixes several violations of MISRA rule 2.1 (dead code -
the while() following a goto).

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

v2:
 * Fix indentation.
 * Reword the commit message a little.
---
 xen/common/grant_table.c | 154 ++++++++++++++++++++++++++++-----------
 1 file changed, 111 insertions(+), 43 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index d87e58a53d86..89b7811c51c3 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -270,13 +270,6 @@ struct gnttab_unmap_common {
 #define GNTTAB_UNMAP_BATCH_SIZE 32
 
 
-#define PIN_FAIL(_lbl, _rc, _f, _a...)          \
-    do {                                        \
-        gdprintk(XENLOG_WARNING, _f, ## _a );   \
-        rc = (_rc);                             \
-        goto _lbl;                              \
-    } while ( 0 )
-
 /*
  * Tracks a mapping of another domain's grant reference. Each domain has a
  * table of these, indexes into which are returned as a 'mapping handle'.
@@ -785,9 +778,13 @@ static int _set_status_v1(const grant_entry_header_t *shah,
         /* If not already pinned, check the grant domid and type. */
         if ( !act->pin && (((scombo.flags & mask) != GTF_permit_access) ||
                            (scombo.domid != ldomid)) )
-            PIN_FAIL(done, GNTST_general_error,
+        {
+            gdprintk(XENLOG_WARNING,
                      "Bad flags (%x) or dom (%d); expected d%d\n",
                      scombo.flags, scombo.domid, ldomid);
+            rc = GNTST_general_error;
+            goto done;
+        }
 
         new = scombo;
         new.flags |= GTF_reading;
@@ -796,8 +793,12 @@ static int _set_status_v1(const grant_entry_header_t *shah,
         {
             new.flags |= GTF_writing;
             if ( unlikely(scombo.flags & GTF_readonly) )
-                PIN_FAIL(done, GNTST_general_error,
+            {
+                gdprintk(XENLOG_WARNING,
                          "Attempt to write-pin a r/o grant entry\n");
+                rc = GNTST_general_error;
+                goto done;
+            }
         }
 
         prev.raw = guest_cmpxchg(rd, raw_shah, scombo.raw, new.raw);
@@ -805,8 +806,11 @@ static int _set_status_v1(const grant_entry_header_t *shah,
             break;
 
         if ( retries++ == 4 )
-            PIN_FAIL(done, GNTST_general_error,
-                     "Shared grant entry is unstable\n");
+        {
+            gdprintk(XENLOG_WARNING, "Shared grant entry is unstable\n");
+            rc = GNTST_general_error;
+            goto done;
+        }
 
         scombo = prev;
     }
@@ -840,9 +844,13 @@ static int _set_status_v2(const grant_entry_header_t *shah,
          ((((scombo.flags & mask) != GTF_permit_access) &&
            (mapflag || ((scombo.flags & mask) != GTF_transitive))) ||
           (scombo.domid != ldomid)) )
-        PIN_FAIL(done, GNTST_general_error,
+    {
+        gdprintk(XENLOG_WARNING,
                  "Bad flags (%x) or dom (%d); expected d%d, flags %x\n",
                  scombo.flags, scombo.domid, ldomid, mask);
+        rc = GNTST_general_error;
+        goto done;
+    }
 
     if ( readonly )
     {
@@ -851,8 +859,12 @@ static int _set_status_v2(const grant_entry_header_t *shah,
     else
     {
         if ( unlikely(scombo.flags & GTF_readonly) )
-            PIN_FAIL(done, GNTST_general_error,
+        {
+            gdprintk(XENLOG_WARNING,
                      "Attempt to write-pin a r/o grant entry\n");
+            rc = GNTST_general_error;
+            goto done;
+        }
         *status |= GTF_reading | GTF_writing;
     }
 
@@ -870,9 +882,11 @@ static int _set_status_v2(const grant_entry_header_t *shah,
              (!readonly && (scombo.flags & GTF_readonly)) )
         {
             gnttab_clear_flags(rd, GTF_writing | GTF_reading, status);
-            PIN_FAIL(done, GNTST_general_error,
+            gdprintk(XENLOG_WARNING,
                      "Unstable flags (%x) or dom (%d); expected d%d (r/w: %d)\n",
                      scombo.flags, scombo.domid, ldomid, !readonly);
+            rc = GNTST_general_error;
+            goto done;
         }
     }
     else
@@ -880,8 +894,9 @@ static int _set_status_v2(const grant_entry_header_t *shah,
         if ( unlikely(scombo.flags & GTF_readonly) )
         {
             gnttab_clear_flags(rd, GTF_writing, status);
-            PIN_FAIL(done, GNTST_general_error,
-                     "Unstable grant readonly flag\n");
+            gdprintk(XENLOG_WARNING, "Unstable grant readonly flag\n");
+            rc = GNTST_general_error;
+            goto done;
         }
     }
 
@@ -1050,8 +1065,12 @@ map_grant_ref(
     /* Bounds check on the grant ref */
     ref = op->ref;
     if ( unlikely(ref >= nr_grant_entries(rgt)))
-        PIN_FAIL(unlock_out, GNTST_bad_gntref, "Bad ref %#x for d%d\n",
+    {
+        gdprintk(XENLOG_WARNING, "Bad ref %#x for d%d\n",
                  ref, rgt->domain->domain_id);
+        rc = GNTST_bad_gntref;
+        goto unlock_out;
+    }
 
     /* This call also ensures the above check cannot be passed speculatively */
     shah = shared_entry_header(rgt, ref);
@@ -1062,9 +1081,13 @@ map_grant_ref(
          ((act->domid != ld->domain_id) ||
           (act->pin & GNTPIN_incr2oflow_mask(pin_incr)) ||
           (act->is_sub_page)) )
-        PIN_FAIL(act_release_out, GNTST_general_error,
+    {
+        gdprintk(XENLOG_WARNING,
                  "Bad domain (%d != %d), or risk of counter overflow %08x, or subpage %d\n",
                  act->domid, ld->domain_id, act->pin, act->is_sub_page);
+        rc = GNTST_general_error;
+        goto act_release_out;
+    }
 
     /* Make sure we do not access memory speculatively */
     status = evaluate_nospec(rgt->gt_version == 1) ? &shah->flags
@@ -1465,9 +1488,13 @@ unmap_common(
 
     if ( op->dev_bus_addr && (flags & GNTMAP_device_map) &&
          unlikely(op->dev_bus_addr != mfn_to_maddr(act->mfn)) )
-        PIN_FAIL(act_release_out, GNTST_bad_dev_addr,
+    {
+        gdprintk(XENLOG_WARNING,
                  "Bus address doesn't match gntref (%"PRIx64" != %"PRIpaddr")\n",
                  op->dev_bus_addr, mfn_to_maddr(act->mfn));
+        rc = GNTST_bad_dev_addr;
+        goto act_release_out;
+    }
 
     if ( op->host_addr && (flags & GNTMAP_host_map) )
     {
@@ -2560,8 +2587,11 @@ acquire_grant_for_copy(
     grant_read_lock(rgt);
 
     if ( unlikely(gref >= nr_grant_entries(rgt)) )
-        PIN_FAIL(gt_unlock_out, GNTST_bad_gntref,
-                 "Bad grant reference %#x\n", gref);
+    {
+        gdprintk(XENLOG_WARNING, "Bad grant reference %#x\n", gref);
+        rc = GNTST_bad_gntref;
+        goto gt_unlock_out;
+    }
 
     /* This call also ensures the above check cannot be passed speculatively */
     shah = shared_entry_header(rgt, gref);
@@ -2571,9 +2601,13 @@ acquire_grant_for_copy(
     if ( act->pin &&
          ((act->domid != ldom) ||
           (act->pin & GNTPIN_incr2oflow_mask(pin_incr))) )
-        PIN_FAIL(unlock_out, GNTST_general_error,
+    {
+        gdprintk(XENLOG_WARNING,
                  "Bad domain (%d != %d), or risk of counter overflow %08x\n",
                  act->domid, ldom, act->pin);
+        rc = GNTST_general_error;
+        goto unlock_out;
+    }
 
     if ( evaluate_nospec(rgt->gt_version == 1) )
     {
@@ -2596,16 +2630,24 @@ acquire_grant_for_copy(
             goto unlock_out;
 
         if ( !allow_transitive )
-            PIN_FAIL(unlock_out_clear, GNTST_general_error,
+        {
+            gdprintk(XENLOG_WARNING,
                      "transitive grant when transitivity not allowed\n");
+            rc = GNTST_general_error;
+            goto unlock_out_clear;
+        }
 
         trans_domid = sha2->transitive.trans_domid;
         trans_gref = sha2->transitive.gref;
         barrier(); /* Stop the compiler from re-loading
                       trans_domid from shared memory */
         if ( trans_domid == rd->domain_id )
-            PIN_FAIL(unlock_out_clear, GNTST_general_error,
+        {
+            gdprintk(XENLOG_WARNING,
                      "transitive grants cannot be self-referential\n");
+            rc = GNTST_general_error;
+            goto unlock_out_clear;
+        }
 
         /*
          * We allow the trans_domid == ldom case, which corresponds to a
@@ -2618,9 +2660,13 @@ acquire_grant_for_copy(
         /* We need to leave the rrd locked during the grant copy. */
         td = rcu_lock_domain_by_id(trans_domid);
         if ( td == NULL )
-            PIN_FAIL(unlock_out_clear, GNTST_general_error,
+        {
+            gdprintk(XENLOG_WARNING,
                      "transitive grant referenced bad domain %d\n",
                      trans_domid);
+            rc = GNTST_general_error;
+            goto unlock_out_clear;
+        }
 
         /*
          * acquire_grant_for_copy() will take the lock on the remote table,
@@ -2928,8 +2974,11 @@ static int gnttab_copy_claim_buf(const struct gnttab_copy *op,
         rc = get_paged_frame(ptr->u.gmfn, &buf->mfn, &buf->page,
                              buf->read_only, buf->domain);
         if ( rc != GNTST_okay )
-            PIN_FAIL(out, rc,
+        {
+            gdprintk(XENLOG_WARNING,
                      "source frame %"PRI_xen_pfn" invalid\n", ptr->u.gmfn);
+            goto out;
+        }
 
         buf->ptr.u.gmfn = ptr->u.gmfn;
         buf->ptr.offset = 0;
@@ -2972,25 +3021,29 @@ static int gnttab_copy_buf(const struct gnttab_copy *op,
                            struct gnttab_copy_buf *dest,
                            const struct gnttab_copy_buf *src)
 {
-    int rc;
-
     if ( ((op->source.offset + op->len) > PAGE_SIZE) ||
          ((op->dest.offset + op->len) > PAGE_SIZE) )
-        PIN_FAIL(out, GNTST_bad_copy_arg, "copy beyond page area\n");
+    {
+        gdprintk(XENLOG_WARNING, "copy beyond page area\n");
+        return GNTST_bad_copy_arg;
+    }
 
     if ( op->source.offset < src->ptr.offset ||
          op->source.offset + op->len > src->ptr.offset + src->len )
-        PIN_FAIL(out, GNTST_general_error,
+    {
+        gdprintk(XENLOG_WARNING,
                  "copy source out of bounds: %d < %d || %d > %d\n",
-                 op->source.offset, src->ptr.offset,
-                 op->len, src->len);
+                 op->source.offset, src->ptr.offset, op->len, src->len);
+        return GNTST_general_error;
+    }
 
     if ( op->dest.offset < dest->ptr.offset ||
          op->dest.offset + op->len > dest->ptr.offset + dest->len )
-        PIN_FAIL(out, GNTST_general_error,
-                 "copy dest out of bounds: %d < %d || %d > %d\n",
-                 op->dest.offset, dest->ptr.offset,
-                 op->len, dest->len);
+    {
+        gdprintk(XENLOG_WARNING, "copy dest out of bounds: %d < %d || %d > %d\n",
+                 op->dest.offset, dest->ptr.offset, op->len, dest->len);
+        return GNTST_general_error;
+    }
 
     /* Make sure the above checks are not bypassed speculatively */
     block_speculation();
@@ -2998,9 +3051,8 @@ static int gnttab_copy_buf(const struct gnttab_copy *op,
     memcpy(dest->virt + op->dest.offset, src->virt + op->source.offset,
            op->len);
     gnttab_mark_dirty(dest->domain, dest->mfn);
-    rc = GNTST_okay;
- out:
-    return rc;
+
+    return GNTST_okay;
 }
 
 static int gnttab_copy_one(const struct gnttab_copy *op,
@@ -3373,9 +3425,17 @@ swap_grant_ref(grant_ref_t ref_a, grant_ref_t ref_b)
 
     /* Bounds check on the grant refs */
     if ( unlikely(ref_a >= nr_grant_entries(d->grant_table)))
-        PIN_FAIL(out, GNTST_bad_gntref, "Bad ref-a %#x\n", ref_a);
+    {
+        gdprintk(XENLOG_WARNING, "Bad ref-a %#x\n", ref_a);
+        rc = GNTST_bad_gntref;
+        goto out;
+    }
     if ( unlikely(ref_b >= nr_grant_entries(d->grant_table)))
-        PIN_FAIL(out, GNTST_bad_gntref, "Bad ref-b %#x\n", ref_b);
+    {
+        gdprintk(XENLOG_WARNING, "Bad ref-b %#x\n", ref_b);
+        rc = GNTST_bad_gntref;
+        goto out;
+    }
 
     /* Make sure the above checks are not bypassed speculatively */
     block_speculation();
@@ -3386,11 +3446,19 @@ swap_grant_ref(grant_ref_t ref_a, grant_ref_t ref_b)
 
     act_a = active_entry_acquire(gt, ref_a);
     if ( act_a->pin )
-        PIN_FAIL(out, GNTST_eagain, "ref a %#x busy\n", ref_a);
+    {
+        gdprintk(XENLOG_WARNING, "ref a %#x busy\n", ref_a);
+        rc = GNTST_eagain;
+        goto out;
+    }
 
     act_b = active_entry_acquire(gt, ref_b);
     if ( act_b->pin )
-        PIN_FAIL(out, GNTST_eagain, "ref b %#x busy\n", ref_b);
+    {
+        gdprintk(XENLOG_WARNING, "ref b %#x busy\n", ref_b);
+        rc = GNTST_eagain;
+        goto out;
+    }
 
     if ( evaluate_nospec(gt->gt_version == 1) )
     {
-- 
2.30.2


