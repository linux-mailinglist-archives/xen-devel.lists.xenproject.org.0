Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD8987AA47
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:17:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692557.1079817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQLk-0005k0-Df; Wed, 13 Mar 2024 15:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692557.1079817; Wed, 13 Mar 2024 15:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQLk-0005gx-AN; Wed, 13 Mar 2024 15:17:00 +0000
Received: by outflank-mailman (input) for mailman id 692557;
 Wed, 13 Mar 2024 15:16:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIWB=KT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rkQLj-0005e0-8l
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:16:59 +0000
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com
 [103.168.172.146]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb051b42-e14c-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 16:16:57 +0100 (CET)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfout.nyi.internal (Postfix) with ESMTP id 74D8513800A7;
 Wed, 13 Mar 2024 11:16:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 13 Mar 2024 11:16:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Mar 2024 11:16:54 -0400 (EDT)
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
X-Inumbo-ID: bb051b42-e14c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1710343016; x=1710429416; bh=G9GKN9B8dH
	TGd4PXNPHUeKZSdjSUiY5pvs4yUwY572k=; b=THMohA7j8GCuaUm4OWNqJ5qAIr
	SXO34opW77Frm+pxeTW1cCtAzJzFnTbuDH7gT9NfZFj+HnIjEKOeHzQMxHRdDJzY
	6WKM/VKkvfnymn3rwX2XDnowvXKgXw1VSlYeGL0qzjBVvPJ/3kcjqX+RpgPrfWpO
	53pCjlREs6rB5CxWcvKJFYGWl6ioeaH/JdXH6ufHtEmR/8idKYURJSLggVVgjegZ
	b6q7rrZg4FqLyhE9D/fCIi/LAekJCjBcGnAfFouqtNRc127+aEPSYjAQcIJyBY4m
	gWaS6fLPAHGRS1L/XCcVo0PAXTuewCdkgQr6HlOoCVQmPnxg/koDmUEe2VXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1710343016; x=
	1710429416; bh=G9GKN9B8dHTGd4PXNPHUeKZSdjSUiY5pvs4yUwY572k=; b=Y
	jNN8vNAoZxGkodc9tFNvuGk/xsa6iFmhUdjCk+f89GqBVHtN38gBq/39lGMJnAU2
	2A2NUZOKjYvTpqcNYzXvKauNjxl92Lr8ETfExGTQRLu1PAseutIJLDfteUqWxvVX
	0IqRmljTxclqjhgaVGaU66Tk98rZ71O6KvVXMqqnvFVaqMDOhDd1BZc9o3SbWEn5
	GbqauV7lfC4SlpkpGgjqpnG+iWTt/JmXj6Mt4jyh9k7GbiTQifIpT2Nafmgc9qu8
	iPW0WimKaWdlbGe6gnyDwdBW7eiLu99X8StfXznuL8RRY/gs05iOQnd7bRkCu/wL
	t/q/2PY2NgjUJek/T3K/A==
X-ME-Sender: <xms:aMPxZS7M9rMFI24Sp7z22i8hJFl_kt8zOHNmR_CEvgwMztOGJyGgHQ>
    <xme:aMPxZb5f5ME_J_lklhCBQFThKGkQu8M9fEwQMHE6QhqSaepLboFGHCBcAeMAIuza1
    uzRWVEkMRKR_w>
X-ME-Received: <xmr:aMPxZRfQybqPtiv38iOfbLZYowVj03YHQVWgEyrjkXq0mw8FmDGkSPxJEBkVZIo_op2kjtbZqSYdhA9wsuGAyKc1MO2nJkYCYA6YG35tfZmsA1Az8Bs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeehgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:aMPxZfKv-eSQdZw0tiMeAgZ5GDAnw8GADhlbKnML-F1ETErrEdlYmA>
    <xmx:aMPxZWIavx0aPL1-V4Xmnqd9CvgXZIU2zwwwMy-iBeAiOqd5iGrJ2A>
    <xmx:aMPxZQzkUCufg0C97IOCxPqGFSiulTLbQZ-5Ed0EWbfdkyCNjzwEmQ>
    <xmx:aMPxZaJyATS39qSY1POnU2JFwGp8IE9BfaE54mVylfli04m2csPQHg>
    <xmx:aMPxZTWxgq3E0xRF2g0CmThGjknxJrDBvXoaAkdLUiyXrqyp3EIi5Q>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 1/7] x86/msi: passthrough all MSI-X vector ctrl writes to device model
Date: Wed, 13 Mar 2024 16:16:06 +0100
Message-ID: <3e1150560a41bd567049627d684cd4e754530869.1710342968.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
References: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
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

