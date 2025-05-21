Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05081ABFED2
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 23:18:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992596.1376293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHqpR-00006Q-BI; Wed, 21 May 2025 21:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992596.1376293; Wed, 21 May 2025 21:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHqpR-0008V3-7E; Wed, 21 May 2025 21:18:21 +0000
Received: by outflank-mailman (input) for mailman id 992596;
 Wed, 21 May 2025 21:18:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q6H9=YF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uHqpQ-000898-62
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 21:18:20 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e5e67e6-3689-11f0-a2fb-13f23c93f187;
 Wed, 21 May 2025 23:18:19 +0200 (CEST)
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
X-Inumbo-ID: 1e5e67e6-3689-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747862299; x=1748121499;
	bh=/UcRWNMCCCUoiYtm7Wrs8tukKW7vOxsjOSokpJV8UrA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=M3JWmX/vfI44QNSMSA28PYxC3uwhrg8XMn3OXTG5SbJx9VXtw3ly1JAd4pq4GgN11
	 MGO3rCDJjXPsZgsgFxKS1doAXuIEghczcIc+bphZ4jO9Dxe1mO/yZ9snAIAXkzklPE
	 PxfNRHMincYzljL9MHA+a1kqZtWbHfKak5kDubIGmZ7iAwaSTXEg9SaxjW6CjIwgb5
	 ygBRfwTXZtK2Phf/hBlpHm/AHB5tkJuBgVeYEDxh1Uv8feWgq46FDmTrloQznceXNI
	 SbKKrJPiV96DV0s94CGEeq4WeZYkKoR0avxKGMpiWDSSonCLEFYoBBpulkIn+H+NUp
	 dm/XdJ9sYYX/g==
Date: Wed, 21 May 2025 21:18:07 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, christopher.w.clark@gmail.com, dpsmith@apertussolutions.com, michal.orzel@amd.com, persaur@gmail.com, dmukhin@ford.com
Subject: [XTF PATCH v2 2/2] tests/argo: use event channel to get own domain ID
Message-ID: <20250521211742.2997890-3-dmukhin@ford.com>
In-Reply-To: <20250521211742.2997890-1-dmukhin@ford.com>
References: <20250521211742.2997890-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 46d7215b2575f92a98c23629adea5ebfe1e15c92
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

The existing argo test depends on xenstore to retrieve the domain ID.

Also, test does not perform peer-to-peer communication using Argo hypercall=
, it
communicates with itself.

Since xenstore currently runs in dom0, xenstore adds unnecessary dependency=
 on
dom0 for the test in x86 QEMU environment.

Use event channel to identify the domain ID which eliminates dom0 dependenc=
y
for the test.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- dropped hack of hardcoding test's own domain ID to 0, reworked getting ow=
n
  domain ID by relying on message channel.

Thanks to Michal Orzel and Andrew Cooper for helping with that.
---
 common/lib.c                | 34 +++++++++++++++++++++++++++++++++-
 include/xen/event_channel.h | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/common/lib.c b/common/lib.c
index 58f4965..c37347a 100644
--- a/common/lib.c
+++ b/common/lib.c
@@ -3,6 +3,7 @@
 #include <xtf/traps.h>
 #include <xtf/hypercall.h>
 #include <xtf/xenstore.h>
+#include <xen/event_channel.h>
=20
 #ifndef isdigit
 /* Avoid pulling in all of ctypes just for this. */
@@ -44,12 +45,43 @@ int xtf_probe_sysctl_interface_version(void)
     return -1;
 }
=20
+static domid_t get_domid_from_evtchn(void)
+{
+    union {
+        struct evtchn_alloc_unbound alloc;
+        struct evtchn_status status;
+        struct evtchn_close close;
+    } op;
+    evtchn_port_t port;
+    int rc;
+
+    op.alloc.dom =3D DOMID_SELF;
+    op.alloc.remote_dom =3D DOMID_SELF;
+    rc =3D hypercall_event_channel_op(EVTCHNOP_alloc_unbound, &op.alloc);
+    if ( rc )
+        return -1;
+
+    port =3D op.alloc.port;
+
+    op.status.dom =3D DOMID_SELF;
+    op.status.port =3D port;
+    rc =3D hypercall_event_channel_op(EVTCHNOP_status, &op.status);
+    if ( !rc )
+        rc =3D op.status.u.unbound.dom;
+
+    op.close.port =3D port;
+    /* NB: no need to check the return code */
+    (void)hypercall_event_channel_op(EVTCHNOP_close, &op.close);
+
+    return rc;
+}
+
 int xtf_get_domid(void)
 {
     int rc =3D xenstore_init();
=20
     if ( rc )
-        return -1;
+        return get_domid_from_evtchn();
=20
     const char *str =3D xenstore_read("domid");
     unsigned int domid =3D 0;
diff --git a/include/xen/event_channel.h b/include/xen/event_channel.h
index bef0f46..7d89ac3 100644
--- a/include/xen/event_channel.h
+++ b/include/xen/event_channel.h
@@ -3,7 +3,9 @@
=20
 #include <xen/xen.h>
=20
+#define EVTCHNOP_close            3
 #define EVTCHNOP_send             4
+#define EVTCHNOP_status           5
 #define EVTCHNOP_alloc_unbound    6
 #define EVTCHNOP_init_control    11
 #define EVTCHNOP_expand_array    12
@@ -32,6 +34,38 @@ struct evtchn_expand_array {
     uint64_t array_gfn;
 };
=20
+struct evtchn_close {
+    /* IN parameters. */
+    evtchn_port_t port;
+};
+
+#define EVTCHNSTAT_closed       0  /* Channel is not in use.              =
   */
+#define EVTCHNSTAT_unbound      1  /* Channel is waiting interdom connecti=
on.*/
+#define EVTCHNSTAT_interdomain  2  /* Channel is connected to remote domai=
n. */
+#define EVTCHNSTAT_pirq         3  /* Channel is bound to a phys IRQ line.=
   */
+#define EVTCHNSTAT_virq         4  /* Channel is bound to a virtual IRQ li=
ne */
+#define EVTCHNSTAT_ipi          5  /* Channel is bound to a virtual IPI li=
ne */
+
+struct evtchn_status {
+    /* IN parameters */
+    domid_t  dom;
+    evtchn_port_t port;
+    /* OUT parameters */
+    uint32_t status;
+    uint32_t vcpu;                 /* VCPU to which this channel is bound.=
   */
+    union {
+        struct {
+            domid_t dom;
+        } unbound;                 /* EVTCHNSTAT_unbound */
+        struct {
+            domid_t dom;
+            evtchn_port_t port;
+        } interdomain;             /* EVTCHNSTAT_interdomain */
+        uint32_t pirq;             /* EVTCHNSTAT_pirq        */
+        uint32_t virq;             /* EVTCHNSTAT_virq        */
+    } u;
+};
+
 #endif /* XEN_PUBLIC_EVENT_CHANNEL_H */
=20
 /*
--=20
2.34.1



