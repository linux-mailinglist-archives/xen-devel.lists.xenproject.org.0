Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F35E16BD6D8
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 18:17:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510753.789066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcrDl-0002y2-Dn; Thu, 16 Mar 2023 17:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510753.789066; Thu, 16 Mar 2023 17:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcrDl-0002wC-AY; Thu, 16 Mar 2023 17:16:57 +0000
Received: by outflank-mailman (input) for mailman id 510753;
 Thu, 16 Mar 2023 17:16:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItE1=7I=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pcrDj-0002vv-32
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 17:16:55 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5666fe0e-c41e-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 18:16:51 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 51C2F5C003F;
 Thu, 16 Mar 2023 13:16:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 16 Mar 2023 13:16:49 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Mar 2023 13:16:48 -0400 (EDT)
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
X-Inumbo-ID: 5666fe0e-c41e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1678987009; x=1679073409; bh=+9fb1hmJCPKv+iZdAg0qfVtiR
	/aKkEjFEePF5ANBzoE=; b=aw1BvQ1D2gmdu4ZpckMPFHyh8LKgKfv1jKR9si1f6
	PmdaY2/uS3Z9gl3fNJGo3vsMRhFSB1O/xkBEOq0P7ih0RDCTS3LUqmH+VJJCQssc
	IMd1LAvcTVmb9/f2HkZC0i0hpp+rrVLXKdPxpKmvKqx5Wgle0Gc5bUzc8A3u/MdX
	Uvi3O7gTNTaaKNoz430BG27Jqi2iT6Ti1Mk7zw6w76QRwi0jYNeTQ7FA9VxDshFA
	VZpMUYo8gCuohgsahSNxIyc+qmID+Uzlr/pY/AwJ5/CnrIsrFbOp3X+gjFsanFXY
	IwNCg6LZpi713AX21162sbOYxY9RqQOxPA66HIicbaruA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1678987009; x=1679073409; bh=+
	9fb1hmJCPKv+iZdAg0qfVtiR/aKkEjFEePF5ANBzoE=; b=AjSQTRNVLwos6dFwM
	PfGUG5S89wEKRG20Kf3ADW5yCihAAwLGIBMihUvXM8ZtKEXN5eeFfgZBZDTjjwRY
	cypOvF/i0kuNcI9PQ7FIcZqd1yDQXDJNYiktvxwTpdZLDHmO82U+VGxOrrvGko3q
	QAxWyyGa/zUqkRIzQRtWOTWhT5SafdP1yBr0mVH5z4UAKYuBddc1xTSp90m4FS5Y
	InV6p46sOi8BFzktKfXA+OpzQGdU84GOhWkdi4a5vdQYrPQ7aWEcxkfViSkUiuia
	+UQC6fH8guV280EVZQ8K10WdQXXBC0vN5hSzia+WWnhEq32lHbL7VKsW+wtlnYbC
	iwFeg==
X-ME-Sender: <xms:AU8TZJuO3vC-KTXiKzgO6I9H_JzkzLj2zaHRAqvkuLXKizhB5n-Jxw>
    <xme:AU8TZCcWvKtN_B2sCEp-fZcmX7pFcuWT5yrhQ-MitRXvaiw3FpQS-SIKLuQC4QPSf
    nyXC2vHHJaxVQ>
X-ME-Received: <xmr:AU8TZMzQUFBE870xfvQclydbpuv94xvBTNB4K3AR0F5_sJb75YT-Hv_orn883IVsrq2yZaoyl2o4wrN2wi6SXF0k5L7p67fQzkNSc96MBplTbfYR5TMN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeftddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleek
    hfduleetleelleetteevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:AU8TZAOb83aGBZgSJgHSHW_3-F7noGPD5On7m4pv4d-v-zoHon7Xow>
    <xmx:AU8TZJ92BUDGJiJzFXO3dIxmr-ll0yOpHjnHdbi5cd3_-AFOFBOO5g>
    <xmx:AU8TZAX4YOgp_6dO8u-9TjEDzlT0PVqwFGGV__pSra6wjPbTjaM2yA>
    <xmx:AU8TZLnjcwLQSqMLBBFOQ7i-ubq41Wu6c_KNzPcp_hqvGtHK_cjdHg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/4] tools: convert setup.py to use setuptools
Date: Thu, 16 Mar 2023 18:16:31 +0100
Message-Id: <20230316171634.320626-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Python distutils is deprecated and is going to be removed in Python
3.12. Migrate to setuptools.
Setuptools in Python 3.11 complains:
SetuptoolsDeprecationWarning: setup.py install is deprecated. Use build and pip and other standards-based tools.
Keep using setup.py anyway to build C extension.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 tools/pygrub/setup.py | 3 +--
 tools/python/setup.py | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/pygrub/setup.py b/tools/pygrub/setup.py
index 0e4e3d02d372..5db743180713 100644
--- a/tools/pygrub/setup.py
+++ b/tools/pygrub/setup.py
@@ -1,5 +1,4 @@
-from distutils.core import setup, Extension
-from distutils.ccompiler import new_compiler
+from setuptools import setup, Extension
 import os
 import sys
 
diff --git a/tools/python/setup.py b/tools/python/setup.py
index 721a3141d7b7..7d57ccfbfffb 100644
--- a/tools/python/setup.py
+++ b/tools/python/setup.py
@@ -1,5 +1,4 @@
-
-from distutils.core import setup, Extension
+from setuptools import setup, Extension
 import os, sys
 
 XEN_ROOT = "../.."
-- 
2.39.2


