Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52740C73A32
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 12:10:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166865.1493357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2Y9-00048P-Tp; Thu, 20 Nov 2025 11:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166865.1493357; Thu, 20 Nov 2025 11:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2Y9-00046G-NP; Thu, 20 Nov 2025 11:10:05 +0000
Received: by outflank-mailman (input) for mailman id 1166865;
 Thu, 20 Nov 2025 11:10:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2mUT=54=bounce.vates.tech=bounce-md_30504962.691ef709.v1-c483da0948f24feab05d81858fa32721@srs-se1.protection.inumbo.net>)
 id 1vM2Y8-0001P8-0K
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 11:10:04 +0000
Received: from mail180-15.suw31.mandrillapp.com
 (mail180-15.suw31.mandrillapp.com [198.2.180.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7557369c-c601-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 12:10:02 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-15.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4dBwc91dwXzPm1CGs
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 11:10:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c483da0948f24feab05d81858fa32721; Thu, 20 Nov 2025 11:10:01 +0000
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
X-Inumbo-ID: 7557369c-c601-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763637001; x=1763907001;
	bh=qKPhb2hXtbAfqWjmWJKnX0A4SzctJuOE8fF03rvyg9I=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FTLge2cHpiKJnRrHDJ64MR5X79WaTt/46yLUsLJ/IkjJo6bBMcQDcr0ZJ+73JkNPx
	 5IRHzQ1uP+dbYCgnhGrgzqxT5C0j8H7MPDfdZQSN+9cL/5Cdb/mxN2OQUAtIJ8qGcL
	 bIsLTeVE/1DoG2lCekEmau3uGIBvSAXv+MTIHCdqVqHxHa8lPTozn/m5YKaVg4KXlD
	 wanSpmcnN2Gsiu0jY3fwXISq/kaP3yBItQC88Ec3kk2/qDvntp0oqfWDebLA2buarW
	 7x+Jj6ZKfHuvG9kVfXXoXPUer8l020osO3/C6f0RMfveVAEUcPv1WkkIss5oVHx2pb
	 QRbx1L+fP4fBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763637001; x=1763897501; i=teddy.astie@vates.tech;
	bh=qKPhb2hXtbAfqWjmWJKnX0A4SzctJuOE8fF03rvyg9I=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gwmx7H9UBGXIJ+ejSPA3g9q4F97LbnTMialepsat3rAEf+1L7HHXoacLOmpAGMmWK
	 q+ReRr1OqytsIeXklVcidxI7SV90ZIJsVoBtn165vfxUF4g+6MUasdnKrTmBOeXlAq
	 oarzUSaRYI3bOK8p8xl6OyVWc4OId22Yk6XSBNEGtUCb4PwhDTTsjOIFzQ7C/pfANH
	 8bbGR6t+8ylsyRlg3EGkPG5ScXrUquiw5FY/W0b8pCUIkN7wbmetNkJlboYbAsrIs9
	 T3ilDvIpKSwPj0dU1xK2xlTplgooAmaz8KvBYlBeET5913icfBwotY0cYe8l9Bd9qe
	 +vvcuLj3NTQQQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v7=2009/14]=20iommu:=20Provide=20'X'=20debug=20key=20to=20dump=20IOMMU=20context=20infos?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763637000187
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>
Message-Id: <6433e2b223d610ee7705abaa49bb27fc4233bf60.1763569135.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1763569135.git.teddy.astie@vates.tech>
References: <cover.1763569135.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c483da0948f24feab05d81858fa32721?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251120:md
Date: Thu, 20 Nov 2025 11:10:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

It is often useful to know the state of all contexts and what devices
are in it. It can also be used to know what device belong to which domains.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v7: introduced

 xen/drivers/passthrough/amd/iommu_init.c | 46 ++++++++++++++++++++++++
 xen/drivers/passthrough/vtd/iommu.c      | 45 ++++++++++++++++++++++-
 2 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index bf32b6c718..1c38ac0369 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -1332,6 +1332,51 @@ static int __init cf_check amd_iommu_setup_device_table(
     return 0;
 }
 
+static void cf_check amd_dump_domain_iommu_contexts(struct domain *d)
+{
+    unsigned int i, iommu_no;
+    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx;
+    struct pci_dev *pdev;
+
+    if (d == dom_io)
+        printk("d[IO] contexts\n");
+    else
+        printk("d%hu contexts\n", d->domain_id);
+
+    for (i = 0; i < (1 + hd->other_contexts.count); ++i)
+    {
+        if ( (ctx = iommu_get_context(d, i)) )
+        {
+            printk(" Context %d (%"PRI_mfn")\n", i,
+                   mfn_x(page_to_mfn(ctx->arch.amd.root_table)));
+
+            for (iommu_no = 0; iommu_no < nr_amd_iommus; iommu_no++)
+                printk("  IOMMU %u (used=%lu; did=%hu)\n", iommu_no,
+                       ctx->arch.amd.iommu_dev_cnt[iommu_no],
+                       ctx->arch.amd.didmap[iommu_no]);
+
+            list_for_each_entry(pdev, &ctx->devices, context_list)
+            {
+                printk("  - %pp\n", &pdev->sbdf);
+            }
+
+            iommu_put_context(ctx);
+        }
+    }
+}
+
+static void cf_check amd_dump_iommu_contexts(unsigned char key)
+{
+    struct domain *d;
+
+    for_each_domain(d)
+        if (is_iommu_enabled(d))
+            amd_dump_domain_iommu_contexts(d);
+
+    amd_dump_domain_iommu_contexts(dom_io);
+}
+
 /* Check whether SP5100 SATA Combined mode is on */
 static bool __init amd_sp5100_erratum28(void)
 {
@@ -1486,6 +1531,7 @@ int __init amd_iommu_init(bool xt)
         register_keyhandler('V', &amd_iommu_dump_intremap_tables,
                             "dump IOMMU intremap tables", 0);
 
+    register_keyhandler('X', amd_dump_iommu_contexts, "dump iommu contexts", 1);
     return 0;
 
 error_out:
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 3319903297..a602edd755 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1954,6 +1954,49 @@ static int __must_check init_vtd_hw(bool resume)
     return iommu_flush_all();
 }
 
+static void cf_check vtd_dump_domain_contexts(struct domain *d)
+{
+    unsigned int i, iommu_no;
+    struct pci_dev *pdev;
+    struct iommu_context *ctx;
+    struct domain_iommu *hd = dom_iommu(d);
+
+    if (d == dom_io)
+        printk("d[IO] contexts\n");
+    else
+        printk("d%hu contexts\n", d->domain_id);
+
+    for (i = 0; i < (1 + hd->other_contexts.count); ++i)
+    {
+        if ( (ctx = iommu_get_context(d, i)) )
+        {
+            printk(" Context %d (%"PRIx64")\n", i, ctx->arch.vtd.pgd_maddr);
+
+            for (iommu_no = 0; iommu_no < nr_iommus; iommu_no++)
+                printk("  IOMMU %u (used=%lu; did=%hu)\n", iommu_no,
+                       ctx->arch.vtd.iommu_dev_cnt[iommu_no],
+                       ctx->arch.vtd.didmap[iommu_no]);
+
+            list_for_each_entry(pdev, &ctx->devices, context_list)
+            {
+                printk("  - %pp\n", &pdev->sbdf);
+            }
+
+            iommu_put_context(ctx);
+        }
+    }
+}
+
+static void cf_check vtd_dump_contexts(unsigned char key)
+{
+    struct domain *d;
+
+    for_each_domain(d)
+        if (is_iommu_enabled(d))
+            vtd_dump_domain_contexts(d);
+
+    vtd_dump_domain_contexts(dom_io);
+}
 
 static struct iommu_state {
     uint32_t fectl;
@@ -2088,7 +2131,7 @@ static int __init cf_check vtd_setup(void)
     iommu_ops.page_sizes |= large_sizes;
 
     register_keyhandler('V', vtd_dump_iommu_info, "dump iommu info", 1);
-
+    register_keyhandler('X', vtd_dump_contexts, "dump iommu contexts", 1);
     return 0;
 
  error:
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


