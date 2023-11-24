Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE827F6A42
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 02:49:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640072.997878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6LJ5-0001sF-1I; Fri, 24 Nov 2023 01:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640072.997878; Fri, 24 Nov 2023 01:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6LJ4-0001mG-Rl; Fri, 24 Nov 2023 01:48:34 +0000
Received: by outflank-mailman (input) for mailman id 640072;
 Fri, 24 Nov 2023 01:48:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uC13=HF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1r6LJ2-0001id-OI
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 01:48:32 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fd474e0-8a6b-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 02:48:28 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 33CEE3200A4C;
 Thu, 23 Nov 2023 20:48:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 23 Nov 2023 20:48:27 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Nov 2023 20:48:24 -0500 (EST)
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
X-Inumbo-ID: 8fd474e0-8a6b-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1700790505; x=1700876905; bh=3J
	KKOIM2Nz4Vj4VaBllPeeub5rgQRGqwurOAqkObw3w=; b=sB+ENd5v0/NOttHP2V
	9MBQ3FuxRsST6OScRMKrRtQ0ZciacTM5hBw+s9CfNuB8NSM8ioIlLa6j8Y11lh7c
	G5KZH3vowVq0IuIto6FRUwnwstNdXjFNF1Is2Kj+MgfBpjYiNQIBrc+kVrFW/cnE
	hoMJ3gpMsCkF+Yrrg8FTLzwx+15w+Z5vW5zewy23fD2zjYcY9uW5xVITVFZ/X/IV
	WCDVeUVBLe/UYjJcecu6cPNmLFNdr6/dYkwpzkPOg33yQeQSPN8VxAXxtXAHmJRO
	LykLovvFRmXmBOZpfTSBwpcrvoB+aC733dk1T2cno3UHbPR6WUabogMcaFZ+jj4U
	XRxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1700790505; x=1700876905; bh=3JKKOIM2Nz4Vj4VaBllPeeub5rgQRGqwurO
	AqkObw3w=; b=RtStN/0xsNETKwmkUsv7uyWt6o3dlO455ML68m1IkDEj97ayjZe
	qFF89JchV7eoZj8xQ9YQNaOQFpHqrI99LW93whwbmYIov6qISpk7vKi6wM6H2P/6
	GchrwAlNWT5MKrmR9dCO9IyvYDVXUd75PEuIg9hO979JnbHEhJgh33oKDvyefLDy
	ZwebOgXZbS/zmAkP8pmNqA/vjSuR/OzfqmbpJaiFt4LGzfFtmfcXibLr+tviEY4W
	YrEiOSIEgX0QRDtSs0m7iOkqppo5ZKq31hIZp8oVs6TSwZn5IuQ8+gBOWsawtqTV
	YzHoy9KBUbMNzF5M+p+D8tioWIQovS+MUKQ==
X-ME-Sender: <xms:6QBgZYfDFGJ3pT4-8-72fPkg5DhPozaJTKGvKoxVX21ToCDidzjjZQ>
    <xme:6QBgZaOm7AQSibwKNUm70vMfz4htbrOzJ866jU_BaiwLdKQ3wfql_lONZBElMDCHa
    1xgv_ih7ZoQKQ>
X-ME-Received: <xmr:6QBgZZi9HaZNfqNZfmlwxhZE4YF0U9vaNrc3ZBmzLcqo1UITHpca1SVDckHraLt0xyTOnQqVhJp94BErc0V1s2Lze93sYxZn3fo-mpj6f08R6eE1QWKJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehgedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:6QBgZd-1A1BsgSElcqEz5_qHUMIXaRaY9D7vhu6LuNUupdnOSrlCjg>
    <xmx:6QBgZUuO0q5-ZJRFZ97q-A6gF_eOjIL7LRsvOm39SqjQdM4lrBfC1A>
    <xmx:6QBgZUGUiFPBGqzkGjetL4CkLQ_1uRMRhT9oXL8ILJLYeUpGF3xaBg>
    <xmx:6QBgZYgYZvViCoDtxLfs2Fu-0KQINqyXYASV5wRiogFEzPpOtYRC7Q>
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
Subject: [PATCH v4 1/6] x86/msi: passthrough all MSI-X vector ctrl writes to device model
Date: Fri, 24 Nov 2023 02:47:05 +0100
Message-ID: <6c030c703fcd37d7dfae3c488c21b5bca540e352.1700790421.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.e8ee4f1e4458c19070007220034a9bfdc34190d5.1700790421.git-series.marmarek@invisiblethingslab.com>
References: <cover.e8ee4f1e4458c19070007220034a9bfdc34190d5.1700790421.git-series.marmarek@invisiblethingslab.com>
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
index 128f23636279..2436154c40b6 100644
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
+    /* ignore invalid length or unaligned writes */
+    if ( len != 4 && len != 8 || !IS_ALIGNED(address, len) )
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
index 08dbaa2a054c..229784c6ce52 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -642,6 +642,7 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
                 fi.submap |= (1U << XENFEAT_direct_mapped);
             else
                 fi.submap |= (1U << XENFEAT_not_direct_mapped);
+            fi.submap |= (1U << XENFEAT_dm_msix_all_writes);
             break;
         default:
             return -EINVAL;
diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index 36936f6a4ee0..634534827d43 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -120,6 +120,14 @@
 #define XENFEAT_runstate_phys_area	  18
 #define XENFEAT_vcpu_time_phys_area	  19
 
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

