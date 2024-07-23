Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231199398A1
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 05:25:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762546.1172712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW68o-0005mw-G7; Tue, 23 Jul 2024 03:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762546.1172712; Tue, 23 Jul 2024 03:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW68o-0005hS-BC; Tue, 23 Jul 2024 03:24:42 +0000
Received: by outflank-mailman (input) for mailman id 762546;
 Tue, 23 Jul 2024 03:24:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xgPy=OX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sW68n-0005f5-Fr
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 03:24:41 +0000
Received: from fhigh6-smtp.messagingengine.com
 (fhigh6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17732e67-48a3-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 05:24:39 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 09960114027C;
 Mon, 22 Jul 2024 23:24:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 22 Jul 2024 23:24:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jul 2024 23:24:35 -0400 (EDT)
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
X-Inumbo-ID: 17732e67-48a3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721705078; x=1721791478; bh=5mBbeJ3IgD
	DqpZgnQ/L6S/O0FCGdtdLv+JP7rpu5cRQ=; b=vrqmjrav9JygAnUk/Smp9aPtN3
	+Y4Isu6Oy6TEAaDSK8dtH+tighNDS9vKRmcDVKuJ3i+zgpDdS9j7/j1YsfzqmUbc
	eKXfka44UGJ8Jeb5OxfZt/jqz4ZbdrlWRY2NK7jJbpsfVyeVu8mMIr+kgjP0fztk
	fqenkX8GVg9Jcl0341NEL0I2HIG5GXX4DuRuy13wTbiO/Y4L+VVdTHOWH421CLGr
	1mBtHBh3vYEgbSw/ZGrv7WfQL4eu/g7ByfzaqtYi7iMUOZB44gfVPVMRk1M/3Mei
	oxat8QZS9G2R//2QmFpUKp7+8WXWjAND9P3HzPBe/HbrwkmTrwbSPxGx8YVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1721705078; x=
	1721791478; bh=5mBbeJ3IgDDqpZgnQ/L6S/O0FCGdtdLv+JP7rpu5cRQ=; b=B
	U8hV5yrhzpKs2+YbqSB3+/YKwg5zPuHeI7eKoNdgO8NMk4MSncpRAKn3IXofNIG9
	Nd1DYw7jABwQKg5D/J1x35rTNJOTuBNMPwppS+IrYCdVZntORqE+uqmAI8wNSTOF
	k1b1FBAaKW5AN8jv5yrxmWjtAx0PO6Zv1MMgsqxmxF9JrW/fhzRVUCDwHaORoZVp
	IzFN/DJpJzhmtMxrQpvAP/PUQPiMVs3qDlkkkSuSGYulVdXZrTjquME3Wa+uQx3U
	d/MKbBzyuqWNLlCeIxp4UVWVlQ8zDJKxaeTNDLiWzHOvTkuvo5H1SshfqTyoharr
	MQvJWZTdMQbJEFqGyI6lg==
X-ME-Sender: <xms:dSKfZmscrzgGQukhowVeyd6z95BQ4f4mxHTrWvHuMBvcrKNzwJN1eQ>
    <xme:dSKfZrdXsbqfjbDI6s8k2-QrOTJ3BB6pL_bmeq4UvlnTaY1ENF3gpMLa9Ip0ZWOl3
    BcFXrmNwJoIoA>
X-ME-Received: <xmr:dSKfZhwbZVggYUoWrEErqGttoi9kCv3eLBQkuQOfOyJ0xFxLFjJqDNdpHhRRvoD3U81vfRbzJyHLvMVJBxWuYi955xf4AuOoOcUVe74L_1dIfh3c_lM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheekgdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:dSKfZhMfGwTzXwIEHzWwnGu1VYw1nCbeUgbQU3MHtkagEw0Sw9qC6Q>
    <xmx:dSKfZm8RP3n5hHAK7M4W7HM2UHVs40w62t8j8cGYrL_vARfibqXJ8g>
    <xmx:dSKfZpXCvh56SV6PKRi55dj5ivYJViEN4pEusxkXNWoNl5aa3bcF-g>
    <xmx:dSKfZvdIBISc4i9lDwV33LNM2T1KX2FIwajWx62mY4-z-rEemHqRFA>
    <xmx:diKfZtnTL8D101g0nJQoJvNFLz941Fh-u01Pn4vOFKsCOeJ_OcLOEgIn>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 1/3] xen/list: add LIST_HEAD_RO_AFTER_INIT
Date: Tue, 23 Jul 2024 05:24:12 +0200
Message-ID: <dec7790f13e9abfed6fad2d4bb3af0c38bcbd2fd.1721704980.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.66bd16d0134f9664ea3e0f4d56f7c127afc308c8.1721704980.git-series.marmarek@invisiblethingslab.com>
References: <cover.66bd16d0134f9664ea3e0f4d56f7c127afc308c8.1721704980.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Similar to LIST_HEAD_READ_MOSTLY.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
New in v5
---
 xen/include/xen/list.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/include/xen/list.h b/xen/include/xen/list.h
index 6506ac40893b..62169f46742e 100644
--- a/xen/include/xen/list.h
+++ b/xen/include/xen/list.h
@@ -42,6 +42,9 @@ struct list_head {
 #define LIST_HEAD_READ_MOSTLY(name) \
     struct list_head __read_mostly name = LIST_HEAD_INIT(name)
 
+#define LIST_HEAD_RO_AFTER_INIT(name) \
+    struct list_head __ro_after_init name = LIST_HEAD_INIT(name)
+
 static inline void INIT_LIST_HEAD(struct list_head *list)
 {
     list->next = list;
-- 
git-series 0.9.1

