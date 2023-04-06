Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D01646D8E23
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 05:58:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518702.805491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkGkz-0008WM-3s; Thu, 06 Apr 2023 03:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518702.805491; Thu, 06 Apr 2023 03:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkGky-0008TX-W8; Thu, 06 Apr 2023 03:57:52 +0000
Received: by outflank-mailman (input) for mailman id 518702;
 Thu, 06 Apr 2023 03:57:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHTq=75=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pkGkx-0008TM-OO
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 03:57:52 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3244fcb9-d42f-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 05:57:49 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D583A5C016C;
 Wed,  5 Apr 2023 23:57:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 05 Apr 2023 23:57:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 23:57:46 -0400 (EDT)
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
X-Inumbo-ID: 3244fcb9-d42f-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1680753468; x=1680839868; bh=Fv
	CSUD7PDGeiswNRgMg7zZom3rqpEr1RXA0kWfFNpvs=; b=IRBTl0BZo62ArcDldO
	x5wTInwPltu0N3kqFHPdwIr4rnKyHDkUHIoZsFCs1JoZbbnNdcERcr/YpwchvPRm
	ByRBlIHB32C0sspNmaoMEbN56XIOQ3i9aITpYQCvwqtWCExxvzS58TNapl/wrx8R
	JlL6z1op0nqFBlPhBfrO3ea7pUp4J5sCL13lAR2hrHXmXYO3sSyG/xoZds59CFpl
	GhUeiXLMKM1XHpe58mSAuAKS1DXelBO4Y1+rBMciD4TQHJ8PkJx5QBAgWhDurx84
	ABvSzBULj8RGLoMdsBTs5QtFssgrHS3g8tBVqdtXuYdqvOHro9kYDknMnt5lTN3L
	AOtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680753468; x=1680839868; bh=FvCSUD7PDGeiswNRgMg7zZom3rqpEr1RXA0
	kWfFNpvs=; b=YYVk8sH4fMz6Huu3gzMg7puPpyyK0TDy0doCcaG+0OeGjI5O2BI
	HZtmjOT5fLWlfxIfFTK5DeUVDljFlaNts38BYk5T4ToxgLQvh85iETLm5L9jbcWf
	Sf4lcPOiH24srqsVZinLiIfYXvopyqiCh16eqZIelbMd+HtuonoSu3QgKSzGMv1p
	f2f/gKvZNguuMn80W0F5Uwsh2HbuxbilI33fZJb1LnhepLH9oTcPJxkcLCGJS2x4
	w1a3A2DezelWLI4nX7qmIDX5IopCH3o6I4gcB816eB2B1oUsZeuXFdyR+tFalPPQ
	o1DXE1ScJi8chnueuNYJoOmpMavDbpr3ADw==
X-ME-Sender: <xms:PEMuZLRdPwMbgum2Mv-s6JiXwL9qSlbmbZ0iYskCT03m1BfUKRO-Zg>
    <xme:PEMuZMy5EBJnjGtF70KG9zaB-883pXNLjTTv5AUHl48MKA5YH_32TlfJYHjmVj-Xg
    GCCxO05mVc5kQ>
X-ME-Received: <xmr:PEMuZA28fN-0D25-aGXs3p55YYyOEwLGQhVyInW4TXO74kIdT4G7wihzBKZnNHFEE5iMfO5fmfDWxad6jjjXQkqiu_lXlriLHXcloyy0gvcl7lE6BbAl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejvddgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:PEMuZLAr7x-Nnn_BfEt9xxU_2wPg7rCfxHbqkbp1mGYisQz6GUlJlw>
    <xmx:PEMuZEh-mZykwBXKSwBmrAMds_nTCkVgxxZIyD9JkRLTABkvhJ6vnw>
    <xmx:PEMuZPoQFvAri7jHMSiPsD2NNSHHAhsyRkHx_V8F4bNQvoTbCP-39Q>
    <xmx:PEMuZAhPjFrw3e4azr7bsWOiKlKgrKLnErIsFm_uUHfuyeYRwKbDNg>
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v3 1/4] x86/msi: passthrough all MSI-X vector ctrl writes to device model
Date: Thu,  6 Apr 2023 05:57:23 +0200
Message-Id: <f799fdc6b6899fa65a07eae0d6401753f7d61ef2.1680752649.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
References: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

QEMU needs to know whether clearing maskbit of a vector is really
clearing, or was already cleared before. Currently Xen sends only
clearing that bit to the device model, but not setting it, so QEMU
cannot detect it. Because of that, QEMU is working this around by
checking via /dev/mem, but that isn't the proper approach. It's just a
workaround which in fact is racy.

Give all necessary information to QEMU by passing all ctrl writes,
including masking a vector.

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
v3:
 - advertise changed behavior in XEN_DMOP_get_ioreq_server_info - make
   "flags" parameter IN/OUT
 - move len check back to msixtbl_write() - will be needed there anyway
   in a later patch
v2:
 - passthrough quad writes to emulator too (Jan)
 - (ab)use len==0 for write len=4 completion (Jan), but add descriptive
   #define for this magic value

Should flags on output include only "out" values (current version), or
also include those passed in by the caller unchanged?
---
 xen/arch/x86/hvm/vmsi.c        | 18 ++++++++++++++----
 xen/common/ioreq.c             |  9 +++++++--
 xen/include/public/hvm/dm_op.h | 12 ++++++++----
 3 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 3cd4923060c8..231253a2cbd4 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -272,6 +272,15 @@ out:
     return r;
 }
 
+/*
+ * This function returns X86EMUL_UNHANDLEABLE even if write is properly
+ * handled, to propagate it to the device model (so it can keep its internal
+ * state in sync).
+ * len==0 means really len==4, but as a write completion that will return
+ * X86EMUL_OKAY on successful processing. Use WRITE_LEN4_COMPLETION to make it
+ * less confusing.
+ */
+#define WRITE_LEN4_COMPLETION 0
 static int msixtbl_write(struct vcpu *v, unsigned long address,
                          unsigned int len, unsigned long val)
 {
@@ -283,8 +292,9 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
     unsigned long flags;
     struct irq_desc *desc;
 
-    if ( (len != 4 && len != 8) || (address & (len - 1)) )
-        return r;
+    if ( (len != 4 && len != 8 && len != WRITE_LEN4_COMPLETION) ||
+         (len && (address & (len - 1))) )
+        return X86EMUL_UNHANDLEABLE;
 
     rcu_read_lock(&msixtbl_rcu_lock);
 
@@ -345,7 +355,7 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
 
 unlock:
     spin_unlock_irqrestore(&desc->lock, flags);
-    if ( len == 4 )
+    if ( len == WRITE_LEN4_COMPLETION )
         r = X86EMUL_OKAY;
 
 out:
@@ -635,7 +645,7 @@ void msix_write_completion(struct vcpu *v)
         return;
 
     v->arch.hvm.hvm_io.msix_unmask_address = 0;
-    if ( msixtbl_write(v, ctrl_address, 4, 0) != X86EMUL_OKAY )
+    if ( msixtbl_write(v, ctrl_address, WRITE_LEN4_COMPLETION, 0) != X86EMUL_OKAY )
         gdprintk(XENLOG_WARNING, "MSI-X write completion failure\n");
 }
 
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index ecb8f545e1c4..bd6f074c1e85 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -743,7 +743,8 @@ static int ioreq_server_destroy(struct domain *d, ioservid_t id)
 static int ioreq_server_get_info(struct domain *d, ioservid_t id,
                                  unsigned long *ioreq_gfn,
                                  unsigned long *bufioreq_gfn,
-                                 evtchn_port_t *bufioreq_port)
+                                 evtchn_port_t *bufioreq_port,
+                                 uint16_t *flags)
 {
     struct ioreq_server *s;
     int rc;
@@ -779,6 +780,9 @@ static int ioreq_server_get_info(struct domain *d, ioservid_t id,
             *bufioreq_port = s->bufioreq_evtchn;
     }
 
+    /* Advertise supported features/behaviors. */
+    *flags = XEN_DMOP_all_msix_writes;
+
     rc = 0;
 
  out:
@@ -1374,7 +1378,8 @@ int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op)
                                    NULL : (unsigned long *)&data->ioreq_gfn,
                                    (data->flags & XEN_DMOP_no_gfns) ?
                                    NULL : (unsigned long *)&data->bufioreq_gfn,
-                                   &data->bufioreq_port);
+                                   &data->bufioreq_port, &data->flags);
+
         break;
     }
 
diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
index acdf91693d0b..490b151c5dd7 100644
--- a/xen/include/public/hvm/dm_op.h
+++ b/xen/include/public/hvm/dm_op.h
@@ -70,7 +70,9 @@ typedef struct xen_dm_op_create_ioreq_server xen_dm_op_create_ioreq_server_t;
  * not contain XEN_DMOP_no_gfns then these pages will be made available and
  * the frame numbers passed back in gfns <ioreq_gfn> and <bufioreq_gfn>
  * respectively. (If the IOREQ Server is not handling buffered emulation
- * only <ioreq_gfn> will be valid).
+ * only <ioreq_gfn> will be valid). When Xen returns XEN_DMOP_all_msix_writes
+ * flag set, it will notify the IOREQ server about all writes to MSI-X table
+ * (if it's handled by this IOREQ server), not only those clearing a mask bit.
  *
  * NOTE: To access the synchronous ioreq structures and buffered ioreq
  *       ring, it is preferable to use the XENMEM_acquire_resource memory
@@ -81,11 +83,13 @@ typedef struct xen_dm_op_create_ioreq_server xen_dm_op_create_ioreq_server_t;
 struct xen_dm_op_get_ioreq_server_info {
     /* IN - server id */
     ioservid_t id;
-    /* IN - flags */
+    /* IN/OUT - flags */
     uint16_t flags;
 
-#define _XEN_DMOP_no_gfns 0
-#define XEN_DMOP_no_gfns (1u << _XEN_DMOP_no_gfns)
+#define _XEN_DMOP_no_gfns         0  /* IN */
+#define _XEN_DMOP_all_msix_writes 1  /* OUT */
+#define XEN_DMOP_no_gfns         (1u << _XEN_DMOP_no_gfns)
+#define XEN_DMOP_all_msix_writes (1u << _XEN_DMOP_all_msix_writes)
 
     /* OUT - buffered ioreq port */
     evtchn_port_t bufioreq_port;
-- 
git-series 0.9.1

