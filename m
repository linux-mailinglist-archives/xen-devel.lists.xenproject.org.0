Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7302F3AFE
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 20:49:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65961.116984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPfL-0006PU-Py; Tue, 12 Jan 2021 19:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65961.116984; Tue, 12 Jan 2021 19:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPfL-0006Ob-Kg; Tue, 12 Jan 2021 19:49:19 +0000
Received: by outflank-mailman (input) for mailman id 65961;
 Tue, 12 Jan 2021 19:49:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh5d=GP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kzPfJ-00064W-9l
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 19:49:17 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 106c2de9-507a-4377-82bf-b3d0916aba17;
 Tue, 12 Jan 2021 19:49:03 +0000 (UTC)
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
X-Inumbo-ID: 106c2de9-507a-4377-82bf-b3d0916aba17
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610480943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dQKNhP8sDS8/NNw+FPEKxJTqs+cEaD8DbMzBYrGIXcA=;
  b=etVESbrJmCDNsvpGpRab3vaCtGtXJx0Xy7TkGzCKOZhC/D8ZzkCa9WQk
   pG4ISFTsUoQ8fdlXNc3YNDHlDhC0FoFW5R/SwQQ/xLOvo4ixBh/O/4aWC
   cvXd5tpcSWMNK4Hwu6iO5ZE1iJir/co6At4J0VF0NAUSegxdCmzLahQZe
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QYqpyNo1SW6zUx9eaBUQRfimvj8kxiucS0ZbUabB7XlyEZIiGlwxOJLgQJp9IXVzaYy1Dqi6tB
 gZqfG0U4K4O6WfCLUGNmbzp8SIJdpsFPts1Ww+C0WEmqMKAM2/rJi/LBdLTuAKj9P30Bhh6WVp
 hC9G/QsEOWMUbMdrmNBCsb2EZ7/F5dsE7ogbTqXOFGFziRg1iFIeLj+LaMVfy17o0RIKC1ztK3
 dCI8udxBVAlSKCsINIyV3WwFr8bZjfIXOb1ySQ6RdvG15ppa3nJDZGpaxGDdGuAvyuQqKMdmK8
 Ujw=
X-SBRS: 5.2
X-MesageID: 36235810
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,342,1602561600"; 
   d="scan'208";a="36235810"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: [PATCH v3 5/7] xen/memory: Improve compat XENMEM_acquire_resource handling
Date: Tue, 12 Jan 2021 19:48:39 +0000
Message-ID: <20210112194841.1537-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210112194841.1537-1-andrew.cooper3@citrix.com>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The frame_list is an input, or an output, depending on whether the calling
domain is translated or not.  The array does not need marshalling in both
directions.

Furthermore, the copy-in loop was very inefficient, copying 4 bytes at at
time.  Rewrite it to copy in all nr_frames at once, and then expand
compat_pfn_t to xen_pfn_t in place.

Re-position the copy-in loop to simplify continuation support in a future
patch, and reduce the scope of certain variables.

No change in guest observed behaviour.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Paul Durrant <paul@xen.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/common/compat/memory.c | 65 ++++++++++++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 25 deletions(-)

diff --git a/xen/common/compat/memory.c b/xen/common/compat/memory.c
index ed92e05b08..834c5e19d1 100644
--- a/xen/common/compat/memory.c
+++ b/xen/common/compat/memory.c
@@ -55,6 +55,8 @@ static int get_reserved_device_memory(xen_pfn_t start, xen_ulong_t nr,
 
 int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
 {
+    struct vcpu *curr = current;
+    struct domain *currd = curr->domain;
     int split, op = cmd & MEMOP_CMD_MASK;
     long rc;
     unsigned int start_extent = cmd >> MEMOP_EXTENT_SHIFT;
@@ -399,7 +401,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
 
         case XENMEM_acquire_resource:
         {
-            xen_pfn_t *xen_frame_list;
+            xen_pfn_t *xen_frame_list = NULL;
             unsigned int max_nr_frames;
 
             if ( copy_from_guest(&cmp.mar, compat, 1) )
@@ -417,28 +419,10 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
             if ( cmp.mar.nr_frames > max_nr_frames )
                 return -E2BIG;
 
-            if ( compat_handle_is_null(cmp.mar.frame_list) )
-                xen_frame_list = NULL;
-            else
-            {
+            /* Marshal the frame list in the remainder of the xlat space. */
+            if ( !compat_handle_is_null(cmp.mar.frame_list) )
                 xen_frame_list = (xen_pfn_t *)(nat.mar + 1);
 
-                if ( !compat_handle_okay(cmp.mar.frame_list,
-                                         cmp.mar.nr_frames) )
-                    return -EFAULT;
-
-                for ( i = 0; i < cmp.mar.nr_frames; i++ )
-                {
-                    compat_pfn_t frame;
-
-                    if ( __copy_from_compat_offset(
-                             &frame, cmp.mar.frame_list, i, 1) )
-                        return -EFAULT;
-
-                    xen_frame_list[i] = frame;
-                }
-            }
-
 #define XLAT_mem_acquire_resource_HNDL_frame_list(_d_, _s_) \
             set_xen_guest_handle((_d_)->frame_list, xen_frame_list)
 
@@ -446,6 +430,31 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
 
 #undef XLAT_mem_acquire_resource_HNDL_frame_list
 
+            if ( xen_frame_list && cmp.mar.nr_frames )
+            {
+                /*
+                 * frame_list is an input for translated guests, and an output
+                 * for untranslated guests.  Only copy in for translated guests.
+                 */
+                if ( paging_mode_translate(currd) )
+                {
+                    compat_pfn_t *compat_frame_list = (void *)xen_frame_list;
+
+                    if ( !compat_handle_okay(cmp.mar.frame_list,
+                                             cmp.mar.nr_frames) ||
+                         __copy_from_compat_offset(
+                             compat_frame_list, cmp.mar.frame_list,
+                             0, cmp.mar.nr_frames) )
+                        return -EFAULT;
+
+                    /*
+                     * Iterate backwards over compat_frame_list[] expanding
+                     * compat_pfn_t to xen_pfn_t in place.
+                     */
+                    for ( int x = cmp.mar.nr_frames - 1; x >= 0; --x )
+                        xen_frame_list[x] = compat_frame_list[x];
+                }
+            }
             break;
         }
         default:
@@ -590,8 +599,6 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
 
         case XENMEM_acquire_resource:
         {
-            const xen_pfn_t *xen_frame_list = (xen_pfn_t *)(nat.mar + 1);
-            compat_pfn_t *compat_frame_list = (compat_pfn_t *)(nat.mar + 1);
             DEFINE_XEN_GUEST_HANDLE(compat_mem_acquire_resource_t);
 
             if ( compat_handle_is_null(cmp.mar.frame_list) )
@@ -601,9 +608,18 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
                                            compat_mem_acquire_resource_t),
                          nat.mar, nr_frames) )
                     return -EFAULT;
+                break;
             }
-            else
+
+            /*
+             * frame_list is an input for translated guests, and an output for
+             * untranslated guests.  Only copy out for untranslated guests.
+             */
+            if ( !paging_mode_translate(currd) )
             {
+                const xen_pfn_t *xen_frame_list = (xen_pfn_t *)(nat.mar + 1);
+                compat_pfn_t *compat_frame_list = (compat_pfn_t *)(nat.mar + 1);
+
                 /*
                  * NOTE: the smaller compat array overwrites the native
                  *       array.
@@ -625,7 +641,6 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
                                              cmp.mar.nr_frames) )
                     return -EFAULT;
             }
-
             break;
         }
 
-- 
2.11.0


