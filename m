Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCE98798EB
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 17:26:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691956.1078624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4x7-0005nE-BD; Tue, 12 Mar 2024 16:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691956.1078624; Tue, 12 Mar 2024 16:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4x7-0005kq-8c; Tue, 12 Mar 2024 16:26:09 +0000
Received: by outflank-mailman (input) for mailman id 691956;
 Tue, 12 Mar 2024 16:26:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jUN=KS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rk4x6-0005fl-Nx
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 16:26:08 +0000
Received: from wfhigh4-smtp.messagingengine.com
 (wfhigh4-smtp.messagingengine.com [64.147.123.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35fadccc-e08d-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 17:26:01 +0100 (CET)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfhigh.west.internal (Postfix) with ESMTP id B13131800098;
 Tue, 12 Mar 2024 12:25:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 12 Mar 2024 12:25:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Mar 2024 12:25:56 -0400 (EDT)
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
X-Inumbo-ID: 35fadccc-e08d-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1710260758; x=1710347158; bh=qF84mesdWl
	/lEGSQYlkmAm+QzNjClBgQx5p+iDQh+vg=; b=FfQK9LIzkOJqaMKwDtuRJehC+s
	4fHEDLOEMNUPfMWk0fdeiilK94BFmMhB13NNOh1mbzHFZd6TV2szJcZwYzRBtmzD
	0j4RwOwR+ulNKDZJXsQzsqgaqKLSkTPbtFFxBQPHwJZqrDKh6Hb6KkOIalY2wHb0
	GJmFK5LNdUJSdP4HkwjrOL2vZe+T7VLwy7rV59poei7o+jB6bdVNB3Njn1OLGy/i
	2//7tvUMTadqWkX1BUO41rLD0A+8HZNCQuvPZHESfmkZ2uA+zcqBICA0rF40uZ9u
	thBXjmNQNL2fWgGb6WZ8y9iYn5v35lEDduQJydtGEQHJfad3LBJoyPzx1DlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1710260758; x=
	1710347158; bh=qF84mesdWl/lEGSQYlkmAm+QzNjClBgQx5p+iDQh+vg=; b=o
	IdrArvWUvA6ePny+nor9rLKE/1485d1TMywDzezP8X7C8L51/p0nqoPErh9RIpgW
	f6FDy0dWEdKpcg9/prgHaSdfpHA9jkE6YKJrD9YlPVqA6dWMwXIv9hH2jGMbGB/9
	RmSmemXGZU5njVGh1jWRkJIA5vknCFx82sZwk51gZcBT2vDCL99Y4Euxtnhjg0bm
	/oIW0h+0aQHKXRyVUNqcMIFAxGXvqseuykiYISuY1veWF8dJhL7ylftoohz562Tf
	D5uCvEdvcChccMG/XHeIKcrl66iqSmizczNA1E8y4wh7jXSiicxtG4aPttHWzNT0
	1DwBzBz4hy3o/4WV0pdIA==
X-ME-Sender: <xms:FYLwZVotD9aTAFsWNyNIujpM9Gg8oXdyou9iKQH3HGZxsL72e-Hw4g>
    <xme:FYLwZXpHI-rXin2LaIIHS375frr6Zi7RfNErpscslH-D1Aw7i8AIVYoNGXNjpqg38
    W7q8HuluUYQHQ>
X-ME-Received: <xmr:FYLwZSNjFQuWw8TplJEBepPFwpzsvDYQ4Zyax2mshM8-uI-w3VGFKpV-XtiqTJsBnISlIFgdp239iDW-0RTulf7GcaOORjUbasxVb5ErBOaF7lWhzkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:FYLwZQ4UVPKP5CcNDo7sHswdEBTQDYFcwApKrPWaAp9wjjs-gWfn4w>
    <xmx:FoLwZU7i_JTpnsQT2wk6Z1_w7IfWd4FvZW7ZkK-YkRpoUt5QnlyJyw>
    <xmx:FoLwZYgLzWe4Aod1oD6L6QRYS56Y6QRSvW9aS6EwLvlKayXcvSNGuw>
    <xmx:FoLwZW6qp2736JxUh2TRrqPlWdB9rTKjGUTpygR1g4VeN44-lW6D6g>
    <xmx:FoLwZeSnCh-CEeqxeFTVI3_bEVksON04uW8naxQ9FQNonlFNN7x752DUWRg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/2] drivers/char: mark extra reserved device memory in memory map
Date: Tue, 12 Mar 2024 17:25:15 +0100
Message-ID: <20240312162541.384793-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240312162541.384793-1-marmarek@invisiblethingslab.com>
References: <20240312162541.384793-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The IOMMU driver checks if RMRR/IVMD are marked as reserved in memory
map. This should be true for addresses coming from the firmware, but
when extra pages used by Xen itself are included in the mapping, those
are taken from usable RAM used. Mark those pages as reserved too.

Not marking the pages as reserved didn't caused issues before due to
another a bug in IOMMU driver code, that was fixed in 83afa3135830
("amd-vi: fix IVMD memory type checks").

Failing to reserve memory will lead to panic in IOMMU setup code. And
not including the page in IOMMU mapping will lead to broken console (due
to IOMMU faults). The pages chosen by the XHCI console driver should
still be usable by the CPU though, and the console code already can deal
with too slow console by dropping characters (and console not printing
anything is a special case of "slow"). When reserving fails print an error
message showing which pages failed and who requested them. This should
be enough hint to find why XHCI console doesn't work.

Fixes: 3a1a7b809ffa "drivers/char: mark DMA buffers as reserved for the XHCI"
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Alternative error handling could be a panic, but with this version I
think it can be avoided. And not panicing gives a better chance to
actually see the error message (from the hopefully started dom0),
especially as the affected driver is the console one.

The reserve_e820_ram() is x86-specific. Is there some equivalent API for
ARM, or maybe even some abstract one? That said, I have no way to test
XHCI console on ARM, I don't know if such hardware even exists...

Changes in v2:
- move reserving to iommu_get_extra_reserved_device_memory() to cover
  all users of iommu_add_extra_reserved_device_memory()
- change error handling to not panic, as in this code layout it can skip
  sending the pages to the IOMMU driver
---
 xen/drivers/passthrough/iommu.c | 19 +++++++++++++++++++
 xen/include/xen/iommu.h         |  5 ++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 03587c0cd680..a311a37a2a03 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -21,6 +21,9 @@
 #include <xen/softirq.h>
 #include <xen/keyhandler.h>
 #include <xsm/xsm.h>
+#ifdef CONFIG_X86
+#include <asm/e820.h>
+#endif
 
 unsigned int __read_mostly iommu_dev_iotlb_timeout = 1000;
 integer_param("iommu_dev_iotlb_timeout", iommu_dev_iotlb_timeout);
@@ -715,6 +718,22 @@ int __init iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
 
     for ( idx = 0; idx < nr_extra_reserved_ranges; idx++ )
     {
+#ifdef CONFIG_X86
+        if ( !reserve_e820_ram(
+                &e820,
+                pfn_to_paddr(extra_reserved_ranges[idx].start),
+                pfn_to_paddr(extra_reserved_ranges[idx].start +
+                             extra_reserved_ranges[idx].nr)) )
+        {
+            printk(XENLOG_ERR "Failed to reserve [%"PRIx64"-%"PRIx64") for %s, "
+                   "skipping IOMMU mapping for it, some functionality may be broken\n",
+                   pfn_to_paddr(extra_reserved_ranges[idx].start),
+                   pfn_to_paddr(extra_reserved_ranges[idx].start +
+                                extra_reserved_ranges[idx].nr),
+                   extra_reserved_ranges[idx].name);
+            continue;
+        }
+#endif
         ret = func(extra_reserved_ranges[idx].start,
                    extra_reserved_ranges[idx].nr,
                    extra_reserved_ranges[idx].sbdf.sbdf,
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index b7829dff4588..875eaeb90167 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -324,7 +324,8 @@ struct iommu_ops {
 };
 
 /*
- * To be called by Xen internally, to register extra RMRR/IVMD ranges.
+ * To be called by Xen internally, to register extra RMRR/IVMD ranges for RAM
+ * pages.
  * Needs to be called before IOMMU initialization.
  */
 extern int iommu_add_extra_reserved_device_memory(unsigned long start,
@@ -334,6 +335,8 @@ extern int iommu_add_extra_reserved_device_memory(unsigned long start,
 /*
  * To be called by specific IOMMU driver during initialization,
  * to fetch ranges registered with iommu_add_extra_reserved_device_memory().
+ * This has a side effect of marking requested ranges as "reserverd" in the
+ * memory map.
  */
 extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
                                                   void *ctxt);
-- 
2.43.0


