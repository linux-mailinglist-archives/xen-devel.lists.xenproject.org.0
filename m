Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C338B3EB5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 19:56:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712994.1113923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Pn3-0004d5-97; Fri, 26 Apr 2024 17:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712994.1113923; Fri, 26 Apr 2024 17:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Pn3-0004aC-4W; Fri, 26 Apr 2024 17:55:17 +0000
Received: by outflank-mailman (input) for mailman id 712994;
 Fri, 26 Apr 2024 17:55:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/r3b=L7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s0Pn0-0004Xj-Sy
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 17:55:14 +0000
Received: from wfhigh5-smtp.messagingengine.com
 (wfhigh5-smtp.messagingengine.com [64.147.123.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2133c0c6-03f6-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 19:55:13 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.west.internal (Postfix) with ESMTP id 20807180017C;
 Fri, 26 Apr 2024 13:55:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 26 Apr 2024 13:55:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 13:55:08 -0400 (EDT)
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
X-Inumbo-ID: 2133c0c6-03f6-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1714154110; x=1714240510; bh=wnwLHJjK04
	m7/9icyRhj8AsJLZNROamjl2zOStksx24=; b=UHC1s2f/T0/3E2+PWJe0soraOF
	+OrZF0FjpLmSpgoGC5lfSc1geZuWuK++8i6AXPWLnHWNPDMfp7E4ax/mi5J+iDlJ
	ur6IbDVeN6C/g4Pj6VKhc2CgksLABGmqcgOZWww1JbJp6OZSinwllqnJvt7+kg9u
	ux130D3+/1Tg/jk6l7yA0+5pcdnsG80jGIk0B+1xuM+vhj7HLg6nzcRyqfoOsyuw
	GpDOrCDDHF8ZkD1Mhvsrw4p344NLVxvPouUgoYR1FeLVVuN9JHNr7PZTr2pDd6BM
	7oupxhGbA+1bJHvadrpc7Z+c1+lOho5p+FJhEe1/i71lHMDMuPhjGPV5vR8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714154110; x=
	1714240510; bh=wnwLHJjK04m7/9icyRhj8AsJLZNROamjl2zOStksx24=; b=I
	/iG1QotweSKdUqu7tjOIW4uzc1PpIA45z6jzSPvYDB6SI3jM1Pmp+9M/RgLYzvQF
	X31sy9gaZ5S+VaTZrg80hvl/xnnLJ5hK/FG++Ak20TMVi2MRkAAPzJ9b2pXE2WD+
	sADIDlBJ0wQXYJ15mZCeVyvkGi8Y/Iml6k0QQX22meWBngq0Um4+qEsvA1+895ur
	48g8UstUs9z6N/+W8H3b370xZBEGhWu/DPkVw9/ThvfmxipFWu00Qan7hF/znQrV
	o5bq0ncsIKBZaP1HXLHENWoF8PiUPhDBW4Aj7feEwy4cU7L69olayyX+tjdaJpn8
	Vl9H7lMAlmh9wfu/XkpCA==
X-ME-Sender: <xms:fuorZlGhc3lTIR1jFJwpg7IWNIYWHESHfD4QJBf6axHjW94_TYuXAg>
    <xme:fuorZqWRzNU4IWMLc1NJ2NKaGUT0_0evsks2rkjAAx4W5DWElK4J3zVp5FpVIU8tw
    UUHuMO4dmhL2g>
X-ME-Received: <xmr:fuorZnKZcCQJMDxmzuwobZOJSOTrpufM28uK6Qmme4GnfbVogCgyoC0yofNy8lIWEUDA74-qfo3zsd0R3FIoj9NN8OvnnSuHwJqrC2RsVraQHl7vigw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelledguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    gfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghr
    vghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:fuorZrEtyUONk3fJKga20BWdOKFlnOYRAL3klZPkqC9F4x8Sr1sNyA>
    <xmx:fuorZrU-JXVuRBNz2aF2vwxViFknDXWBW8zntrIRrrOh1VoJx5nCTQ>
    <xmx:fuorZmPt9JyGYGjy3qQRoyd7dn8SmHvHuY5cwv07f19TM82KrxBvJg>
    <xmx:fuorZq2WcQWpx8DKVzkAXtdmwqDge2BgDyEVa6X9x-sfyeYGi3bENw>
    <xmx:fuorZiHPQbMQcWV5ZqxUwbGrWAfdMmSLXVaLgQq72PqVT6dUKQhaepzD>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 1/7] x86/msi: passthrough all MSI-X vector ctrl writes to device model
Date: Fri, 26 Apr 2024 19:53:58 +0200
Message-ID: <db19b939bd56ea822a8149c5e7d46505b81d34a3.1714154036.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
References: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

QEMU needs to know whether clearing maskbit of a vector is really
clearing, or was already cleared before. Currently Xen sends only
clearing that bit to the device model, but not setting it, so QEMU
cannot detect it. Because of that, QEMU is working this around by
checking via /dev/mem, but that isn't the proper approach.

Give all necessary information to QEMU by passing all ctrl writes,
including masking a vector. Advertise the new behavior via
XENVER_get_features, so QEMU can know it doesn't need to access /dev/mem
anymore.

While this commit doesn't move the whole maskbit handling to QEMU (as
discussed on xen-devel as one of the possibilities), it is a necessary
first step anyway. Including telling QEMU it will get all the required
information to do so. The actual implementation would need to include:
 - a hypercall for QEMU to control just maskbit (without (re)binding the
   interrupt again
 - a methor for QEMU to tell Xen it will actually do the work
Those are not part of this series.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
I did not added any control to enable/disable this new behavior (as
Roger have suggested for possible non-QEMU ioreqs). I don't see how the
new behavior could be problematic for some existing ioreq server (they
already received writes to those addresses, just not all of them),
but if that's really necessary, I can probably add a command line option
to restore previous behavior system-wide.

Changes in v5:
- announce the feature only on x86
- style fixes

Changes in v4:
- ignore unaligned writes with X86EMUL_OKAY
- restructure the code to forward all writes in _msixtbl_write() instead
  of manipulating return value of msixtbl_write() - this makes
  WRITE_LEN4_COMPLETION special case unnecessary
- advertise the changed behavior via XENVER_get_features instead of DMOP
v3:
 - advertise changed behavior in XEN_DMOP_get_ioreq_server_info - make
   "flags" parameter IN/OUT
 - move len check back to msixtbl_write() - will be needed there anyway
   in a later patch
v2:
 - passthrough quad writes to emulator too (Jan)
 - (ab)use len==0 for write len=4 completion (Jan), but add descriptive
   #define for this magic value
---
 xen/arch/x86/hvm/vmsi.c       | 19 ++++++++++++++-----
 xen/common/kernel.c           |  1 +
 xen/include/public/features.h |  8 ++++++++
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index adbac965f9f7..999917983789 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -283,8 +283,8 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
     unsigned long flags;
     struct irq_desc *desc;
 
-    if ( (len != 4 && len != 8) || (address & (len - 1)) )
-        return r;
+    if ( !IS_ALIGNED(address, len) )
+        return X86EMUL_OKAY;
 
     rcu_read_lock(&msixtbl_rcu_lock);
 
@@ -345,8 +345,7 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
 
 unlock:
     spin_unlock_irqrestore(&desc->lock, flags);
-    if ( len == 4 )
-        r = X86EMUL_OKAY;
+    r = X86EMUL_OKAY;
 
 out:
     rcu_read_unlock(&msixtbl_rcu_lock);
@@ -357,7 +356,17 @@ static int cf_check _msixtbl_write(
     const struct hvm_io_handler *handler, uint64_t address, uint32_t len,
     uint64_t val)
 {
-    return msixtbl_write(current, address, len, val);
+    /* Ignore invalid length or unaligned writes. */
+    if ( (len != 4 && len != 8) || !IS_ALIGNED(address, len) )
+        return X86EMUL_OKAY;
+
+    /*
+     * This function returns X86EMUL_UNHANDLEABLE even if write is properly
+     * handled, to propagate it to the device model (so it can keep its
+     * internal state in sync).
+     */
+    msixtbl_write(current, address, len, val);
+    return X86EMUL_UNHANDLEABLE;
 }
 
 static bool cf_check msixtbl_range(
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 08dbaa2a054c..b44b2439ca8e 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -637,6 +637,7 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
                 fi.submap |= (1U << XENFEAT_hvm_safe_pvclock) |
                              (1U << XENFEAT_hvm_callback_vector) |
                              (has_pirq(d) ? (1U << XENFEAT_hvm_pirqs) : 0);
+            fi.submap |= (1U << XENFEAT_dm_msix_all_writes);
 #endif
             if ( !paging_mode_translate(d) || is_domain_direct_mapped(d) )
                 fi.submap |= (1U << XENFEAT_direct_mapped);
diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index 4437f25d2532..880193094713 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -120,6 +120,14 @@
 #define XENFEAT_runstate_phys_area        18
 #define XENFEAT_vcpu_time_phys_area       19
 
+/*
+ * If set, Xen will passthrough all MSI-X vector ctrl writes to device model,
+ * not only those unmasking an entry. This allows device model to properly keep
+ * track of the MSI-X table without having to read it from the device behind
+ * Xen's backs. This information is relevant only for device models.
+ */
+#define XENFEAT_dm_msix_all_writes        20
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
-- 
git-series 0.9.1

