Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172F72C30A7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 20:18:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36878.68959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khdp7-0003OF-QM; Tue, 24 Nov 2020 19:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36878.68959; Tue, 24 Nov 2020 19:17:57 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khdp7-0003Nb-IH; Tue, 24 Nov 2020 19:17:57 +0000
Received: by outflank-mailman (input) for mailman id 36878;
 Tue, 24 Nov 2020 19:17:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khdp6-0003NA-F5
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:17:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khdp4-00046z-Kd; Tue, 24 Nov 2020 19:17:54 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khdp4-0001af-B1; Tue, 24 Nov 2020 19:17:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdp6-0003NA-F5
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:17:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=RqaPp5RRZKIQZO8Gxl89YiDcr2otuNX/c8xlMGA/ZCE=; b=yJ8hF0LtYrkvPcfXjOOAI4Hbd2
	bEA2gcbXQKuVpMAEX7xvA4Eqba4XpXWP0mc22LSETae0jmhAvK1aeD+cVARRyppOF522fB1hF4mbF
	Rc/tGou53K/CT1R7+RFUGbg3RioqttSUTaJ2wYehxygC4Df8nsWYiENdUfmzjVw+AJCI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdp4-00046z-Kd; Tue, 24 Nov 2020 19:17:54 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com ([86.183.162.145] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdp4-0001af-B1; Tue, 24 Nov 2020 19:17:54 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Eslam Elnikety <elnikety@amazon.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 1/3] domctl: introduce a new domain create flag, XEN_DOMCTL_CDF_disable_fifo, ...
Date: Tue, 24 Nov 2020 19:17:49 +0000
Message-Id: <20201124191751.11472-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201124191751.11472-1-paul@xen.org>
References: <20201124191751.11472-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

...to control the visibility of the FIFO event channel operations
(EVTCHNOP_init_control, EVTCHNOP_expand_array, and EVTCHNOP_set_priority) to
the guest.

These operations were added to the public header in commit d2d50c2f308f
("evtchn: add FIFO-based event channel ABI") and the first implementation
appeared in the two subsequent commits: edc8872aeb4a ("evtchn: implement
EVTCHNOP_set_priority and add the set_priority hook") and 88910061ec61
("evtchn: add FIFO-based event channel hypercalls and port ops"). Prior to
that, a guest issuing those operations would receive a return value of
-ENOSYS (not implemented) from Xen. Guests aware of the FIFO operations but
running on an older (pre-4.4) Xen would fall back to using the 2-level event
channel interface upon seeing this return value.

Unfortunately the uncontrolable appearance of these new operations in Xen 4.4
onwards has implications for hibernation of some Linux guests. During resume
from hibernation, there are two kernels involved: the "boot" kernel and the
"resume" kernel. The guest boot kernel may default to use FIFO operations and
instruct Xen via EVTCHNOP_init_control to switch from 2-level to FIFO. On the
other hand, the resume kernel keeps assuming 2-level, because it was hibernated
on a version of Xen that did not support the FIFO operations.

To maintain compatibility it is necessary to make Xen behave as it did
before the new operations were added and hence the code in this patch ensures
that, if XEN_DOMCTL_CDF_disable_fifo is set, the FIFO event channel operations
will again result in -ENOSYS being returned to the guest.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Signed-off-by: Eslam Elnikety <elnikety@amazon.com>
---
Cc: Christian Lindig <christian.lindig@citrix.com>
Cc: David Scott <dave@recoil.org>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>

v4:
 - New in v4
---
 tools/ocaml/libs/xc/xenctrl.ml  |  1 +
 tools/ocaml/libs/xc/xenctrl.mli |  1 +
 xen/common/domain.c             |  2 +-
 xen/common/event_channel.c      | 17 +++++++++++++++++
 xen/include/public/domctl.h     |  4 +++-
 5 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index e878699b0a1a..9ccad9aece8c 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -65,6 +65,7 @@ type domain_create_flag =
 	| CDF_XS_DOMAIN
 	| CDF_IOMMU
 	| CDF_NESTED_VIRT
+	| CDF_DISABLE_FIFO
 
 type domain_create_iommu_opts =
 	| IOMMU_NO_SHAREPT
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index e64907df8e7e..8bb0f9e14b8e 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -58,6 +58,7 @@ type domain_create_flag =
   | CDF_XS_DOMAIN
   | CDF_IOMMU
   | CDF_NESTED_VIRT
+  | CDF_DISABLE_FIFO
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/xen/common/domain.c b/xen/common/domain.c
index f748806a450b..75aed7fd5b01 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -307,7 +307,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
-           XEN_DOMCTL_CDF_nested_virt) )
+           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_disable_fifo) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 54b2e2550e93..6a96ccf56c3a 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1193,10 +1193,27 @@ static long evtchn_set_priority(const struct evtchn_set_priority *set_priority)
     return ret;
 }
 
+static bool is_fifo_op(int cmd)
+{
+    switch ( cmd )
+    {
+    case EVTCHNOP_init_control:
+    case EVTCHNOP_expand_array:
+    case EVTCHNOP_set_priority:
+        return true;
+    default:
+        return false;
+    }
+}
+
 long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc;
 
+    if ( (current->domain->options & XEN_DOMCTL_CDF_disable_fifo) &&
+         is_fifo_op(cmd) )
+        return -ENOSYS;
+
     switch ( cmd )
     {
     case EVTCHNOP_alloc_unbound: {
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 666aeb71bf1b..70701c59d053 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -70,9 +70,11 @@ struct xen_domctl_createdomain {
 #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
 #define _XEN_DOMCTL_CDF_nested_virt   6
 #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
+#define _XEN_DOMCTL_CDF_disable_fifo  7
+#define XEN_DOMCTL_CDF_disable_fifo   (1U << _XEN_DOMCTL_CDF_disable_fifo)
 
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_nested_virt
+#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_disable_fifo
 
     uint32_t flags;
 
-- 
2.20.1


