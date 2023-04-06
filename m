Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F646D8E26
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 05:58:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518704.805511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkGl5-0000dS-Js; Thu, 06 Apr 2023 03:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518704.805511; Thu, 06 Apr 2023 03:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkGl5-0000am-F9; Thu, 06 Apr 2023 03:57:59 +0000
Received: by outflank-mailman (input) for mailman id 518704;
 Thu, 06 Apr 2023 03:57:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHTq=75=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pkGl4-0000Z1-Dt
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 03:57:58 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3328af7d-d42f-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 05:57:52 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5D6E55C0176;
 Wed,  5 Apr 2023 23:57:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 05 Apr 2023 23:57:50 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 23:57:49 -0400 (EDT)
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
X-Inumbo-ID: 3328af7d-d42f-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1680753470; x=1680839870; bh=D/
	T8tgnYwHUEAgL2AzdECT/ODhwEEHPrmRQMVyr6mbY=; b=hs/M75R9CPozgbKmPG
	ZW08qrDVQJHKNs+NsRXrC1+vytZM6C+uNBHlzFOiJzbRZcqkAUHkOubllB0BMo6J
	YDhRjpmig6EYPzKKpIpx084EJM1bj4LWL2YqwqZwIK67jcZKZkc51kOuPBBxnOnE
	kk4WjXG8cOeAg5aWO48M7w8TN6UVi8uQBwUeK8v/uXOXP1WoMOPq4spa04Zyi0PH
	S8gnP/f9UBIZx9Ryu25UD5ocXPi5rbALRYgFokBstGm5S4KvjriSpztjeBAo/MzI
	XO4rP2Pc00B0wpTx35O5DVf5/eIB3UMbDKmPr6KsCBSfQef6wexgdM2xRh+qptiE
	hKUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680753470; x=1680839870; bh=D/T8tgnYwHUEAgL2AzdECT/ODhwEEHPrmRQ
	MVyr6mbY=; b=ktX93hm1t6Ke6dLk4j4QQ76cGOlhDm/ItUtXhq7etEB9b4c5AOQ
	TuzxDZceQlk6Qwcgn5hMJxR/pL1BpZnwpwDXKe1dJVFsUnanWwJ470j5fLoVijC0
	ZIfFFPoZHXDy7Uy8H2YpDGYRmC4dktVGxdRTUYaSPAgsH42ljyKI3L7hpe/dzGv4
	+pZNkNp+rAAPtGnp4BJU4mJrBCS4lRraZ37LBWNcQ0YOmGI0p0gWnyX6zAutbveo
	g7uH2l+31w9ldDheps02nXVGIgT+StN53MyXl5F5+Q7gpyp8M5CaTnlQzK25FZgF
	Lq0HCIUZiFVcPQr8Mk7H46u8DXBJEb7XHvg==
X-ME-Sender: <xms:PkMuZAYtOKAIHg127yE15lZ5qoINBKEJJkjjMaA1Bda8-OEXWYZqdw>
    <xme:PkMuZLar3K01E0RDg0mxBi7q0ZzPfAQds4VN1Oqj6tWfxC1-oqLuzQ0P0NNO0I-VA
    ZspoPWU2OY9NQ>
X-ME-Received: <xmr:PkMuZK_4YmBHmMvuchkNsCHDhLOMy4ITytwzXfVpnMjWZor_RdvQe3L0_JAmC1cMI29_VEjZ8Y6b07uFGvFgktKZ-DJ0UeCNK3bled5slXwK3arRAjhn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejvddgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:PkMuZKqIyD3xhLlfx0KqlOiO-PO65wOjCU85-yVCnDO3K4wNEfM77w>
    <xmx:PkMuZLqwJh7QsTH3bcNlA4e8DDfHPl0aTds_xwyfSLM8ZHmrjYoxvw>
    <xmx:PkMuZIT3nlEetB0dx4UA32dFKq5uG_WaY6q7ula3aZN85vO6jCaIbQ>
    <xmx:PkMuZC1bbbiqRNfh-rKy74iGLkJLcCDJR1C59ldEqgNRhF82cYqEDg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 2/4] tools/xendevicemodel: Introduce ..._get_ioreq_server_info_ext
Date: Thu,  6 Apr 2023 05:57:24 +0200
Message-Id: <1f6dc87eebe5d1c27ae15ec8f5d8006e5aa1c36d.1680752649.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
References: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add xendevicemodel_get_ioreq_server_info_ext() which additionally
returns output flags that XEN_DMOP_get_ioreq_server_info can now return.
Do not change signature of existing
xendevicemodel_get_ioreq_server_info() so existing users will not need
to be changed.

This advertises behavior change of "x86/msi: passthrough all MSI-X
vector ctrl writes to device model" patch.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
v3:
 - new patch

Should there be some HAVE_* #define in the header? Does this change
require soname bump (I hope it doesn't...).
---
 tools/include/xendevicemodel.h | 23 +++++++++++++++++++++++
 tools/libs/devicemodel/core.c  | 16 ++++++++++++++--
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/tools/include/xendevicemodel.h b/tools/include/xendevicemodel.h
index 797e0c6b2961..77a99e670551 100644
--- a/tools/include/xendevicemodel.h
+++ b/tools/include/xendevicemodel.h
@@ -72,6 +72,29 @@ int xendevicemodel_get_ioreq_server_info(
     evtchn_port_t *bufioreq_port);
 
 /**
+ * This function retrieves the necessary information to allow an
+ * emulator to use an IOREQ Server, including feature flags.
+ *
+ * @parm dmod a handle to an open devicemodel interface.
+ * @parm domid the domain id to be serviced
+ * @parm id the IOREQ Server id.
+ * @parm ioreq_gfn pointer to a xen_pfn_t to receive the synchronous ioreq
+ *                  gfn. (May be NULL if not required)
+ * @parm bufioreq_gfn pointer to a xen_pfn_t to receive the buffered ioreq
+ *                    gfn. (May be NULL if not required)
+ * @parm bufioreq_port pointer to a evtchn_port_t to receive the buffered
+ *                     ioreq event channel. (May be NULL if not required)
+ * @parm flags pointer to receive flags bitmask, see hvm/dm_op.h for details.
+ *             (May be NULL if not required)
+ * @return 0 on success, -1 on failure.
+ */
+int xendevicemodel_get_ioreq_server_info_ext(
+    xendevicemodel_handle *dmod, domid_t domid, ioservid_t id,
+    xen_pfn_t *ioreq_gfn, xen_pfn_t *bufioreq_gfn,
+    evtchn_port_t *bufioreq_port,
+    unsigned int *flags);
+
+/**
  * This function registers a range of memory or I/O ports for emulation.
  *
  * @parm dmod a handle to an open devicemodel interface.
diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
index 8e619eeb0a1f..337622e608c2 100644
--- a/tools/libs/devicemodel/core.c
+++ b/tools/libs/devicemodel/core.c
@@ -189,10 +189,10 @@ int xendevicemodel_create_ioreq_server(
     return 0;
 }
 
-int xendevicemodel_get_ioreq_server_info(
+int xendevicemodel_get_ioreq_server_info_ext(
     xendevicemodel_handle *dmod, domid_t domid, ioservid_t id,
     xen_pfn_t *ioreq_gfn, xen_pfn_t *bufioreq_gfn,
-    evtchn_port_t *bufioreq_port)
+    evtchn_port_t *bufioreq_port, unsigned int *flags)
 {
     struct xen_dm_op op;
     struct xen_dm_op_get_ioreq_server_info *data;
@@ -226,9 +226,21 @@ int xendevicemodel_get_ioreq_server_info(
     if (bufioreq_port)
         *bufioreq_port = data->bufioreq_port;
 
+    if (flags)
+        *flags = data->flags;
+
     return 0;
 }
 
+int xendevicemodel_get_ioreq_server_info(
+    xendevicemodel_handle *dmod, domid_t domid, ioservid_t id,
+    xen_pfn_t *ioreq_gfn, xen_pfn_t *bufioreq_gfn,
+    evtchn_port_t *bufioreq_port)
+{
+    return xendevicemodel_get_ioreq_server_info_ext(
+        dmod, domid, id, ioreq_gfn, bufioreq_gfn, bufioreq_port, NULL);
+}
+
 int xendevicemodel_map_io_range_to_ioreq_server(
     xendevicemodel_handle *dmod, domid_t domid, ioservid_t id, int is_mmio,
     uint64_t start, uint64_t end)
-- 
git-series 0.9.1

