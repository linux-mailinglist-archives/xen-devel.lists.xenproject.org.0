Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED52B2FE48
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 17:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088814.1446524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Aq-0005qZ-0g; Thu, 21 Aug 2025 15:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088814.1446524; Thu, 21 Aug 2025 15:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Ap-0005nb-Ti; Thu, 21 Aug 2025 15:25:55 +0000
Received: by outflank-mailman (input) for mailman id 1088814;
 Thu, 21 Aug 2025 15:25:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PRvz=3B=bounce.vates.tech=bounce-md_30504962.68a73a80.v1-b26388fab1ef4df0bf0d61632d7da11d@srs-se1.protection.inumbo.net>)
 id 1up7Ao-0005nU-Jn
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 15:25:54 +0000
Received: from mail179-29.suw41.mandrillapp.com
 (mail179-29.suw41.mandrillapp.com [198.2.179.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fd633ea-7ea3-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 17:25:53 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-29.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4c76bN13Kkz7lmV4q
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 15:25:52 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b26388fab1ef4df0bf0d61632d7da11d; Thu, 21 Aug 2025 15:25:52 +0000
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
X-Inumbo-ID: 1fd633ea-7ea3-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1755789952; x=1756059952;
	bh=Zc917Cb8fY8/yfL65ARqArQPpJf0Hd7vGTKynVOYYc4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=o1zBDSwYzZiO6OuCjkC0875v8RXC7LUe4ElG2M6DfEazi4FPUk4dMorHf4xiABzCU
	 +XYveIkzr5LhdOv/Uon5qZUZxi5tjEldB3w9namWGMVyrOYxDlBb9DvsjiuOKbvadO
	 D4zI0GmGm6NT231gf+iUd0NCcI9d8nIJ0vTKinGgGfEvDQQitVSKDhUrJxTd7eXkCB
	 W5BYMzzCoue5Wo7/UlzBHcUoXVJmVlEfEy5edbZvNcjGcaM6lkvyZgPC5g7z9cPR9g
	 SwdeVfsJvUoJgXgeZmCBo2n7tt2wah/SyHMl0vhfdbye4H5jFf9AavRXFojNiT6oC4
	 am85Lz7NKMUvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1755789952; x=1756050452; i=teddy.astie@vates.tech;
	bh=Zc917Cb8fY8/yfL65ARqArQPpJf0Hd7vGTKynVOYYc4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SEVzliy1lDGye0rRf2GGHE9/wTL/Ui6IU7qtxpG+8S7W3A3gkStrde3lccke58+29
	 ztdcxK1YwpAQW6xkhiGOQNNSmsS8cH1TAv294ask29gHaAqr4Ysa2BTRwHOOUrrQX0
	 7k1BwyMmM60IrcL8dbp31NVqjA4KXLBCO4TVp+VqD+IYuuczWzbnjJkagAJlT9ZqiP
	 YX8au1opTniiaFNBKVno7QoIVATFUZ4AzMcLXSp8k/F0bz5vV18SdQD2mJiRB54KjY
	 3Ikpvn+axZpkue6Dbyu95Zh0HeEcGFkteeV9YTL3M7DfT/GF+cbZ/0dRbb1gGo3KnJ
	 uNasdZu8zWpKA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=202/9]=20common:=20Isolate=20XENVER=5Fget=5Ffeatures=20into=20a=20separate=20function?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1755789951011
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <0bbc0f2df1853bb60f4e93c55d1a0953c6a72496.1755785258.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1755785258.git.teddy.astie@vates.tech>
References: <cover.1755785258.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b26388fab1ef4df0bf0d61632d7da11d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250821:md
Date: Thu, 21 Aug 2025 15:25:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Make do_xen_version more readable by moving the main XENVER_get_features
into a separate function.

No functional changes intended.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/common/kernel.c | 84 +++++++++++++++++++++++++--------------------
 1 file changed, 46 insertions(+), 38 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 5be668ba85..eff6db6c8f 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -569,6 +569,50 @@ static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     return sz;
 }
 
+static long xenver_get_features(struct domain *d, uint32_t submap_idx, uint32_t *submap)
+{
+    switch ( submap_idx )
+    {
+    case 0:
+        *submap = (1U << XENFEAT_memory_op_vnode_supported) |
+#ifdef CONFIG_X86
+                  (1U << XENFEAT_vcpu_time_phys_area) |
+#endif
+                  (1U << XENFEAT_runstate_phys_area);
+        if ( VM_ASSIST(d, pae_extended_cr3) )
+            *submap |= (1U << XENFEAT_pae_pgdir_above_4gb);
+        if ( paging_mode_translate(d) )
+            *submap |=
+                (1U << XENFEAT_writable_page_tables) |
+                (1U << XENFEAT_auto_translated_physmap);
+        if ( is_hardware_domain(d) )
+            *submap |= 1U << XENFEAT_dom0;
+#ifdef CONFIG_ARM
+        *submap |= (1U << XENFEAT_ARM_SMCCC_supported);
+#endif
+#ifdef CONFIG_X86
+        if ( is_pv_domain(d) )
+            *submap |= (1U << XENFEAT_mmu_pt_update_preserve_ad) |
+                      (1U << XENFEAT_highmem_assist) |
+                      (1U << XENFEAT_gnttab_map_avail_bits);
+        else
+            *submap |= (1U << XENFEAT_hvm_safe_pvclock) |
+                       (1U << XENFEAT_hvm_callback_vector) |
+                       (has_pirq(d) ? (1U << XENFEAT_hvm_pirqs) : 0);
+        *submap |= (1U << XENFEAT_dm_msix_all_writes);
+#endif
+        if ( !paging_mode_translate(d) || is_domain_direct_mapped(d) )
+            *submap |= (1U << XENFEAT_direct_mapped);
+        else
+            *submap |= (1U << XENFEAT_not_direct_mapped);
+        break;
+    default:
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     bool deny = xsm_xen_version(XSM_OTHER, cmd);
@@ -675,45 +719,9 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( copy_from_guest(&fi, arg, 1) )
             return -EFAULT;
 
-        switch ( fi.submap_idx )
-        {
-        case 0:
-            fi.submap = (1U << XENFEAT_memory_op_vnode_supported) |
-#ifdef CONFIG_X86
-                        (1U << XENFEAT_vcpu_time_phys_area) |
-#endif
-                        (1U << XENFEAT_runstate_phys_area);
-            if ( VM_ASSIST(d, pae_extended_cr3) )
-                fi.submap |= (1U << XENFEAT_pae_pgdir_above_4gb);
-            if ( paging_mode_translate(d) )
-                fi.submap |=
-                    (1U << XENFEAT_writable_page_tables) |
-                    (1U << XENFEAT_auto_translated_physmap);
-            if ( is_hardware_domain(d) )
-                fi.submap |= 1U << XENFEAT_dom0;
-#ifdef CONFIG_ARM
-            fi.submap |= (1U << XENFEAT_ARM_SMCCC_supported);
-#endif
-#ifdef CONFIG_X86
-            if ( is_pv_domain(d) )
-                fi.submap |= (1U << XENFEAT_mmu_pt_update_preserve_ad) |
-                             (1U << XENFEAT_highmem_assist) |
-                             (1U << XENFEAT_gnttab_map_avail_bits);
-            else
-                fi.submap |= (1U << XENFEAT_hvm_safe_pvclock) |
-                             (1U << XENFEAT_hvm_callback_vector) |
-                             (has_pirq(d) ? (1U << XENFEAT_hvm_pirqs) : 0);
-            fi.submap |= (1U << XENFEAT_dm_msix_all_writes);
-#endif
-            if ( !paging_mode_translate(d) || is_domain_direct_mapped(d) )
-                fi.submap |= (1U << XENFEAT_direct_mapped);
-            else
-                fi.submap |= (1U << XENFEAT_not_direct_mapped);
-            break;
-        default:
+        if ( xenver_get_features(d, fi.submap_idx, &fi.submap) )
             return -EINVAL;
-        }
-
+            
         if ( __copy_to_guest(arg, &fi, 1) )
             return -EFAULT;
         return 0;
-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


