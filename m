Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE0967C431
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 06:13:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484743.751546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKuZo-0002O7-As; Thu, 26 Jan 2023 05:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484743.751546; Thu, 26 Jan 2023 05:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKuZo-0002M6-7J; Thu, 26 Jan 2023 05:13:32 +0000
Received: by outflank-mailman (input) for mailman id 484743;
 Thu, 26 Jan 2023 05:13:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0+3p=5X=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pKuZm-0002M0-M3
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 05:13:30 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a2f8711-9d38-11ed-91b6-6bf2151ebd3b;
 Thu, 26 Jan 2023 06:13:28 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id A89635C05B9;
 Thu, 26 Jan 2023 00:13:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 26 Jan 2023 00:13:26 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 00:13:25 -0500 (EST)
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
X-Inumbo-ID: 2a2f8711-9d38-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1674710006; x=1674796406; bh=si2CIeQHBvEuBg0GKAq7c57w/l0f6keWtZb
	ZENwz+Cg=; b=TU/TLoenO7nU4Zgag4pHQ9NDhmS5vEblIyIC4EpELdyspPyxEmK
	vsUJEPyhrTPE2dHGgRwzvEoQt7hIipuxkPcGo2FmyKYxNj/fstwpizlEQ8zwJByI
	0bohzchjPAywJTCw39Xs4U0IFz1+7l014ULWIRbSOtCzfh1ZER9HkH4B+bXzyF/j
	YRJqE00gCT/FzHmm/qySX6Vlg9SafclW/NaPbmwgy6SrVze5hw48f3JKwCnkfF1x
	QJIRy+lruJ/YYL+Sp8OJcOP8tjCSj8MzAMHr8OgrNU74iUyuPWeWNRm9ulRe9lzB
	HvsfiwG0rows11oEdF1Ncd3toEisNiWfrHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1674710006; x=1674796406; bh=si2CIeQHBvEuB
	g0GKAq7c57w/l0f6keWtZbZENwz+Cg=; b=YO8NH5dPFIM8uFLgeyEWKZ+X8ljlj
	k3N28Pkp8dSwiqlIzicRI2tK2elnHGj/Yb3giv7m8wRKUdjhwd1HGficyhm3xQXU
	fBbtUvMJ5g0qfmPvqAwlBUnOhxOzSzoVf4i2Vji1Bm6lRCM1kq2lWAMP2jVw+yne
	lAeb1hoMuwdYRyb7YXYgjXnPwWsvs+AwSTagAK4yYzfHMGg7OzWk8h9k+ay1oD+W
	7pN8Y5DiEWTmVZPTwBnHjKk7dNzdyeNtQ4C7n7QeI5o5i7JXhw83fkj5xCSem3QD
	c5UgP7hVWG0PUqcEmfiQw4fzTYm2aQgLgz4kS+Z08yhoCr02DiDhZnakQ==
X-ME-Sender: <xms:9gvSY9qUe1TGob5fDDdTEgKUKT4F17CK9aCpQW6yWeiTHH14Q6pB3Q>
    <xme:9gvSY_pYSI36pRCuodyysmPy9csENTepU83j7_zze7YtZhpSIBprTHXeGniYN58fJ
    mFt3VYeJO2wbA>
X-ME-Received: <xmr:9gvSY6PWlvHydTEMQJfYIFEyf3M-uHerzRtMifpON62Wb9v7m-FqF7YKOJS00crMrEuXW2G1A2epa-nPeforirbGSUQoTpvEc0WT01SNv0vAMlvWYWqm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvfedgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:9gvSY45BN99xpV5q7YvHznyVgbn9nAVqJyLaKYLBh1OwZpTG8Okm_A>
    <xmx:9gvSY85BmH5WKkTZbKZ27ug5ISgPJuv7L9F2nMCwQ0-YCXZEahiizQ>
    <xmx:9gvSYwi1wYAeX0qR_y2msvZUkO5Nahg38NO9h5jZ5Sj35X8LVlX4aw>
    <xmx:9gvSY6Sws963j1I7Wb2NkG1BTO3AlsI8RiSo93hBywUHMH9goeaEaw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/python: change 's#' size type for Python >= 3.10
Date: Thu, 26 Jan 2023 06:13:10 +0100
Message-Id: <20230126051310.4149074-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Python < 3.10 by default uses 'int' type for data+size string types
(s#), unless PY_SSIZE_T_CLEAN is defined - in which case it uses
Py_ssize_t. The former behavior was removed in Python 3.10 and now it's
required to define PY_SSIZE_T_CLEAN before including Python.h, and using
Py_ssize_t for the length argument. The PY_SSIZE_T_CLEAN behavior is
supported since Python 2.5.

Adjust bindings accordingly.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 tools/python/xen/lowlevel/xc/xc.c | 3 ++-
 tools/python/xen/lowlevel/xs/xs.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index fd008610329b..cfb2734a992b 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2003-2004, K A Fraser (University of Cambridge)
  */
 
+#define PY_SSIZE_T_CLEAN
 #include <Python.h>
 #define XC_WANT_COMPAT_MAP_FOREIGN_API
 #include <xenctrl.h>
@@ -1774,7 +1775,7 @@ static PyObject *pyflask_load(PyObject *self, PyObject *args, PyObject *kwds)
 {
     xc_interface *xc_handle;
     char *policy;
-    uint32_t len;
+    Py_ssize_t len;
     int ret;
 
     static char *kwd_list[] = { "policy", NULL };
diff --git a/tools/python/xen/lowlevel/xs/xs.c b/tools/python/xen/lowlevel/xs/xs.c
index 0dad7fa5f2fc..3ba5a8b893d9 100644
--- a/tools/python/xen/lowlevel/xs/xs.c
+++ b/tools/python/xen/lowlevel/xs/xs.c
@@ -18,6 +18,7 @@
  * Copyright (C) 2005 XenSource Ltd.
  */
 
+#define PY_SSIZE_T_CLEAN
 #include <Python.h>
 
 #include <stdbool.h>
@@ -141,7 +142,7 @@ static PyObject *xspy_write(XsHandle *self, PyObject *args)
     char *thstr;
     char *path;
     char *data;
-    int data_n;
+    Py_ssize_t data_n;
     bool result;
 
     if (!xh)
-- 
2.37.3


