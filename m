Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD84693727C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 04:34:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760835.1170784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUdRo-00029o-LN; Fri, 19 Jul 2024 02:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760835.1170784; Fri, 19 Jul 2024 02:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUdRo-00027V-IO; Fri, 19 Jul 2024 02:34:16 +0000
Received: by outflank-mailman (input) for mailman id 760835;
 Fri, 19 Jul 2024 02:34:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a+sj=OT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sUdRn-0001tG-CY
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2024 02:34:15 +0000
Received: from fhigh2-smtp.messagingengine.com
 (fhigh2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61b5b205-4577-11ef-bbfd-fd08da9f4363;
 Fri, 19 Jul 2024 04:34:12 +0200 (CEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 3DBA5114026D;
 Thu, 18 Jul 2024 22:34:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 18 Jul 2024 22:34:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Jul 2024 22:34:08 -0400 (EDT)
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
X-Inumbo-ID: 61b5b205-4577-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721356451; x=1721442851; bh=295JPg7IQt
	Dkp5dvhP0fy0GSyAQJ2jLNGYtHNK1RIsM=; b=BHSpjF7xqAYkGMUrdvS1RJ+fSn
	Kv0Io3ezVIeVXBLyib8vOeRjymWnJSlY8ou1xJy/ihwd4limbIseforhDNCRxYAM
	EKWYYndOGzT9weVVoIpzE7q9584DA9wewO2JSaOPUYLjdx4sG49nSetTf+3FbMSh
	DcpBTXkhLj67HQF3kDGpKMOvoHOhXklaXRdJBMEMNdsvWhghkKXai7rKw591PKm9
	4ixIbOBMcg74iA7Tb81B6FdllRdfx/S6/hTXlt2j3D80rEYPwzyAQxMlOwX6Nhcb
	6x5KdjOK74amBrka28tF1dQDeMStc6MUnTQBxrQEafOg7PSRa4cvRXbmB+EA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1721356451; x=
	1721442851; bh=295JPg7IQtDkp5dvhP0fy0GSyAQJ2jLNGYtHNK1RIsM=; b=m
	hCStaCj27+X9rrmQlGc8Yiuanf3Zl1mSJCUjxXqFVacCW0fmrPH2OLEIlGaCxp5o
	rMvBMK9X1omCMbFCiZMiU4BpHpT3IUuzi5HV48gGrEvnCo5CaBe4QFfgJYy7UzDF
	FB096Hu48u1NjiaT27QaQRrTlzHXT4zQrGz6Sa0j1tWcULJgZApJ7FGzW9Ho8GEV
	1jPYayAb5YIIG76+trBdgoQtSKP+XyAO48R5Maz4MWiEzl0i4jbZ6/zg/dSoElyQ
	rVl9HYEKxl5IYxEZlo93Aj5o4ltCFWkgVKzOjag9k6+9mHfWBQDA2tkdKk89hbmy
	a75AYiIareqke/JsImqAg==
X-ME-Sender: <xms:otCZZmMbqy5HhPSKYXNtnK9f21rc2pezizsKa07HYla0CxqUj1K9Bw>
    <xme:otCZZk-3r_qQzBN_5I_PRBDz7-YN19r7M3pxcoJdyJYY6Gx8GKNBXCZHXFvSwJe-S
    USqBrcxj4ILyg>
X-ME-Received: <xmr:otCZZtRethGt4jJvhfFvHrEl8gj7SFdpoEAjBx-6RULGqNYlS4cmXH7Qd-M0iZZWiioE-7WZA9UsEgjZpcAAOONbrVFvc_3xKl2tY8UuGB3ANUdZzLM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrhedtgdeitdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:otCZZmtELOwvzBDSZ-tWTilnM_bcIotXSFutCrUyHzTW99aaLuJWyw>
    <xmx:otCZZucHOW27TpT0Wq6gz4Y449DS6hru5GNjLUUWpjfddh8S6f_4vw>
    <xmx:otCZZq2DPNpDWDWgViliBebnq2Koln61vS5OJbUxaE7L2muT1u-MUQ>
    <xmx:otCZZi8QKyZknDi6GL4_C6c3bBGgOp_RBQb6qVCmig9pUKaxz1eblA>
    <xmx:o9CZZrF5D4Ut0aJe9dDPX0EHT2poXfiJ5cSj1HzgLBWdSvGozfBKzhbB>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 1/3] xen/list: add LIST_HEAD_RO_AFTER_INIT
Date: Fri, 19 Jul 2024 04:33:36 +0200
Message-ID: <1994087de901c7520db559724ae95b2b0e1b1f5d.1721356393.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.8c9972382c46fce22682bcec2ee28fe2501dd18f.1721356393.git-series.marmarek@invisiblethingslab.com>
References: <cover.8c9972382c46fce22682bcec2ee28fe2501dd18f.1721356393.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Similar to LIST_HEAD_READ_MOSTLY.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
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

