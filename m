Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5918B3EB1
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 19:56:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713000.1113987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0PnL-0006jR-6V; Fri, 26 Apr 2024 17:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713000.1113987; Fri, 26 Apr 2024 17:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0PnL-0006h0-1v; Fri, 26 Apr 2024 17:55:35 +0000
Received: by outflank-mailman (input) for mailman id 713000;
 Fri, 26 Apr 2024 17:55:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/r3b=L7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s0PnJ-0005IL-1C
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 17:55:33 +0000
Received: from wfout3-smtp.messagingengine.com
 (wfout3-smtp.messagingengine.com [64.147.123.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b343baf-03f6-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 19:55:31 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.west.internal (Postfix) with ESMTP id 3E7111C0019D;
 Fri, 26 Apr 2024 13:55:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 26 Apr 2024 13:55:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 13:55:26 -0400 (EDT)
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
X-Inumbo-ID: 2b343baf-03f6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm3; t=1714154127; x=1714240527; bh=kqv3XxPnwBq6tyJeE7l4A
	gxpNVKGtZJ7FW7pxlbH88o=; b=wKCwcpVAZvyu4pg/zrW3j5/5MjojIED1bThbZ
	7YlEM0+JSrEe3qV7dFe81VQVNUwb8ZKbKQ4s10DfGz/uq7NUSFrC0Q2+2AWdzztw
	PBVjQXfAEYq0q268DARHej5DmxBJTl9/sP02hFog2YIp6C88iYAXErLX4WvLTKW5
	ufGgsx4nwPujWqS6xPm4HV5tXMyNCwZyPRJE1/NvwQuBGk8v2ktzPGyWAcp2M4FG
	EydCiMI/7VoYLuiHjNdIiFs0bWGIF4C2duTjoijvEajrfV/5UurCcPXx1ugC2Fw+
	GGHKAEvP6rCoNwlZXNktV/cTEa8xnjAwr+VKXIHXaX4AccAcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714154127; x=
	1714240527; bh=kqv3XxPnwBq6tyJeE7l4AgxpNVKGtZJ7FW7pxlbH88o=; b=P
	ve7k2xM9Qj1ZrR6uUb2WyfVSY5KpAEnsKA8cAsLsrYgOmB9svO+dULd4/YyJSDXo
	QTQhaRR725DJaNs8wyAOxwT6d5ENpVeScTx41lt3ksNT6ROijyG1YF7/XfRqcgBq
	hUWBwzsEpfBwaskAS2xbxSefNVHyRgu5pVZ/wWdW29YkqHTlRR08aVX7pIEybWJf
	D+3EXXfGUP1OAlejfNE1Lf62zBe9xqnhihtbIUNhR9Ka81PceyInIVBNMCliEb4/
	lbbZpfZu2W7MQUGDscsUgWE1f0DZewL6JBDTTzIpYPrf9Hyg5Pq9bIN4NP9gzKgN
	abL6H6fA8ss/Q8m1nNaLw==
X-ME-Sender: <xms:j-orZmfIbjO1sujNcl8iCQTDKaMR6AjM2BMYVyy_tnAR9vtlBwWpsg>
    <xme:j-orZgP6Ice9x-_2NEodSHtyWRX8LsearozX5H0OLNiSvtpfsgIxbhgYVbi3Chxxc
    aWDj2h-XBaXkA>
X-ME-Received: <xmr:j-orZnh9OlwPsdAXWhr6X9zB0D0fSq-RTjKjUhD6iZRTuOCm6LABOsE6qcBpBZ8acu-C0Y2RfABSXV8x8VyEWz_A8nYmfRedVSKX5vZi2RnLRvYpT7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelledguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeu
    teehgfeiheehfedtueeludfhgfeileeujefhgffgieeiveethfeffffffedtheenucffoh
    hmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomh
X-ME-Proxy: <xmx:j-orZj-oJNEXsBY9GsNo1_2zqGLOXa7L8i_yCJBpahMwWelDgnNjmA>
    <xmx:j-orZisBHPRvd2hZPBhhBuZEp0Qa1g02-7Ly9t1c7ZSwSQwL1L3KSQ>
    <xmx:j-orZqG9g_cCQHo7pEjNrVGv5irgONQ2skceRDtsEWv3_3lZxl38_g>
    <xmx:j-orZhP1f6CVGspMaM9f1Tf_DFkJ9x48-EVOsx8v_6I-SxwhgHQ73w>
    <xmx:j-orZmLWrwfJ3qml84zuSaty43HNXnOODFaiUVPT6h7RnsxVASx8kFiz>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 7/7] [DO NOT APPLY] switch to alternative artifact repo
Date: Fri, 26 Apr 2024 19:54:04 +0200
Message-ID: <4634c2b7d08997b38521f0fa82e37a4fca0d6e2c.1714154036.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
References: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For testing, switch to my containers registry that includes containers
rebuilt with changes in this series.
---
 automation/gitlab-ci/build.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index aac29ee13ab6..6957f06016b7 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -320,7 +320,7 @@ qemu-system-ppc64-8.1.0-ppc64-export:
 
 alpine-3.18-rootfs-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.18
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/tests-artifacts/alpine:3.18
   script:
     - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
   artifacts:
@@ -331,7 +331,7 @@ alpine-3.18-rootfs-export:
 
 kernel-6.1.19-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/tests-artifacts/kernel:6.1.19
   script:
     - mkdir binaries && cp /bzImage binaries/bzImage
   artifacts:
-- 
git-series 0.9.1

