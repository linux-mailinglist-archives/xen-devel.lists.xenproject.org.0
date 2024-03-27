Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F5588D4D4
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 03:55:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698290.1089805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpJRh-0001d1-0Q; Wed, 27 Mar 2024 02:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698290.1089805; Wed, 27 Mar 2024 02:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpJRg-0001XF-RL; Wed, 27 Mar 2024 02:55:20 +0000
Received: by outflank-mailman (input) for mailman id 698290;
 Wed, 27 Mar 2024 02:55:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Klda=LB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rpJRf-0001U3-AL
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 02:55:19 +0000
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com
 [103.168.172.146]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 715e788f-ebe5-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 03:55:18 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.nyi.internal (Postfix) with ESMTP id 92C8A13800E8;
 Tue, 26 Mar 2024 22:55:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 26 Mar 2024 22:55:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Mar 2024 22:55:16 -0400 (EDT)
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
X-Inumbo-ID: 715e788f-ebe5-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1711508117; x=1711594517; bh=LiC4Z64sJk
	XXdBeM3YC2/qtZwTqDVcXAvB76UdMIB6E=; b=K2ftxsJJzomkCyFgiJgByLl/xK
	oKD4ATDU8MstCYvnAq/+OAhi9GiauT5CUorT5VY1UYVsi74KrYISb4yMtSMu/zFe
	2t8BmJi5lCiuaHnabxhy7EmagiJDfdKrbs2LjLY9Rg5WwdD2Idd4WmP6sxKgRS9u
	5uhA+KMe5Uf/6ziymZOzqXhDy/TIIeF8vaCkZjkIs0CEwggr1cjDLdxmNkIZq/rc
	3BuQIettA9/D3wVslDDv67/3i2zBHCFa9XI7kGXW1fVJjlwLqFvfxKLn8rtyVZM7
	hmgZFAjZtl8VhQYCIEfOvemexgS1L0X5hf4/9Y8Sd0fEEhVAbSdatBi7p0bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1711508117; x=
	1711594517; bh=LiC4Z64sJkXXdBeM3YC2/qtZwTqDVcXAvB76UdMIB6E=; b=e
	kk1ZYL/QpapogfJtBdhdVtL/HagSRkqIrd6DiwWMzoToiiPZB+sVx47IfcAktwTD
	nPVV+UDN7sL+c81SJsgBjaYw8Nkz4ZdtfRsSJGwUI7A3OZ2BCfeY9BzQ6TQhXXAW
	AzPJ5CLxrevGw8ohALkUlFyfxjsmdbs/+Rlm6ixO8ry2ozrd8UXWHcGmE+vsgY6H
	tg6VK5O78naj+d/Y50ImDJKCV1FZB0r0O2bf8OTSgsegW1CfvNFB7Xzy/NxMpq+e
	/FVGv0AgwvENiSE8HnJKA7v/eOoGGsoXXefdhmyjyiAL9Z8uliD48AjsojHg+y2M
	yc+CzAdlHmuuHDBQ09hWA==
X-ME-Sender: <xms:lYoDZoleu0tYKlYavhiq7Gv_iTJV5uuSEMmdlYbUj0iebs1OzIypqQ>
    <xme:lYoDZn1y-NG4RZ-vlKCBVKsVKK57LwU8q4q58KydmI9ZCDvm1QNGnuikHQkIiaVpG
    dbTh7mfGzlD2A>
X-ME-Received: <xmr:lYoDZmplQYbScjnBq9oQ7MMuNiKWuHkHrsEwwRp2YpLI4BtKJJnVD3xl67lN6LNJpQCZx8_TGOnfOSTcqeYXp6P4WchsG2JfXHl2S3RtSYGdIxhxN08>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddugedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:lYoDZknWkJlP49UzQYvNm70ztPAzMsTO1thRSJzW3HVUWBfvID4JwQ>
    <xmx:lYoDZm2XwJj56ibxEVLiPKbT1LLbDLszqkapkf8AVLumqXHJY7vyAg>
    <xmx:lYoDZrsDb7HwoCrp11_7pcM0459w5fyFnBwuVkVLnGn1NEx_TAZlXw>
    <xmx:lYoDZiUqoFaTPOoCRchCAYaGdW7GZZAu4pFQh6u_jX-5euUASA-ZWA>
    <xmx:lYoDZi_FY-QinA8M0ZEWwO-VxUwn-SDhS3ej5N746xjvja6CE2oEjw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 2/2] drivers/char: mark extra reserved device memory in memory map
Date: Wed, 27 Mar 2024 03:53:11 +0100
Message-ID: <20240327025454.514521-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240327025454.514521-1-marmarek@invisiblethingslab.com>
References: <20240327025454.514521-1-marmarek@invisiblethingslab.com>
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
Changes in v3:
- code style, typo
---
 xen/drivers/passthrough/iommu.c | 17 +++++++++++++++++
 xen/include/xen/iommu.h         |  5 ++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 03587c0cd680..ba18136c461c 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -22,6 +22,10 @@
 #include <xen/keyhandler.h>
 #include <xsm/xsm.h>
 
+#ifdef CONFIG_X86
+#include <asm/e820.h>
+#endif
+
 unsigned int __read_mostly iommu_dev_iotlb_timeout = 1000;
 integer_param("iommu_dev_iotlb_timeout", iommu_dev_iotlb_timeout);
 
@@ -715,6 +719,19 @@ int __init iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
 
     for ( idx = 0; idx < nr_extra_reserved_ranges; idx++ )
     {
+#ifdef CONFIG_X86
+        paddr_t start = pfn_to_paddr(extra_reserved_ranges[idx].start);
+        paddr_t end = pfn_to_paddr(extra_reserved_ranges[idx].start +
+                                   extra_reserved_ranges[idx].nr);
+
+        if ( !reserve_e820_ram(&e820, start, end) )
+        {
+            printk(XENLOG_ERR "Failed to reserve [%"PRIx64"-%"PRIx64") for %s, "
+                   "skipping IOMMU mapping for it, some functionality may be broken\n",
+                   start, end, extra_reserved_ranges[idx].name);
+            continue;
+        }
+#endif
         ret = func(extra_reserved_ranges[idx].start,
                    extra_reserved_ranges[idx].nr,
                    extra_reserved_ranges[idx].sbdf.sbdf,
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index b7829dff4588..1f56a6cf456a 100644
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
+ * This has a side effect of marking requested ranges as "reserved" in the
+ * memory map.
  */
 extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
                                                   void *ctxt);
-- 
2.43.0


