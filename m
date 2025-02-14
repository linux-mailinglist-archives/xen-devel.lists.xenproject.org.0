Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B8AA353B2
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 02:28:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888260.1297689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tikVV-0006MQ-1s; Fri, 14 Feb 2025 01:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888260.1297689; Fri, 14 Feb 2025 01:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tikVU-0006IN-Ti; Fri, 14 Feb 2025 01:28:40 +0000
Received: by outflank-mailman (input) for mailman id 888260;
 Fri, 14 Feb 2025 01:28:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kkdH=VF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tikVT-0005Nm-9x
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 01:28:39 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0367de5e-ea73-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 02:28:37 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id EBE1B11401EC;
 Thu, 13 Feb 2025 20:28:36 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Thu, 13 Feb 2025 20:28:36 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Feb 2025 20:28:35 -0500 (EST)
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
X-Inumbo-ID: 0367de5e-ea73-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1739496516; x=1739582916; bh=q8B6ZSMLNS
	JBGfPmB3tWWzqZ7+U98kelJ1d0kjDhI2Q=; b=K5EeALrIaCXHv/QmcW8U1WqmwD
	MTTILqWKonIuPne37nGCC9ROjTSCUSt6lrSsmDR9IoT/3ZJQaUINyOPfMn/UX2tZ
	tv3kZ1i3Aok4x9130OatVVdD5ZKysHzm05UMucusakWN5psNEXJ8Cxj/9cJSWDfT
	Pz7xV3o59v5Qy6grGgYlCFd2KfNNkQGrm9V6i+XxFQWLPYh8p98grzVeRJEvz9Zn
	+TU+J1nJ1Kd3D9RZBne6fiaEri5g3dQ5tiFxHgzbDXYGXI33BMcuXLyMi7iGGwEY
	s4nxuStgd6+XfDVxj707YUbRVfByH1c06QC/nbjUJFD0mQHqe4A86wkHRfXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739496516; x=
	1739582916; bh=q8B6ZSMLNSJBGfPmB3tWWzqZ7+U98kelJ1d0kjDhI2Q=; b=d
	+afpIbZ+RgDpoyh4de+F+qZb3Qv+Vl9iLq3KGj0yMqMm2FyXiLt2gWAYQ7FLfcjH
	voICUTjQDu+WsWtAYFFwvsVq0Lf7mn7xodnpgS0WNqwp62Fz0Ub0ts+NLzwS4XS5
	HZYmMUjrHyg4qT6b30wXCD4uYdKdWq8b7J4GQEvFgybRaUJudTbXvTlhWP3bG90J
	u5KJKBhBR9C04E7Sdr3S/+zVGFS6wGhCAbKdJf2olcAxmZQf0gTUJJBji1DlnILO
	ZBDHIUUyliXXdV56/RDjTE1At2Rs2a8HjAjNlcjhe8yBO9E8WW49D2veV1KkqYXa
	dFBjDAnz1SHzPOC7rKZdQ==
X-ME-Sender: <xms:RJyuZ7kxna6vevbn2NoQDsFqY8C1wu68ohIOR4p8a9H_n4GKEdjEhQ>
    <xme:RJyuZ-19HCDDumNJyxzMgtwpFty1Wc3aVBI-a8Wf0xhGDcXU6E7SDjWVN9ypn3OFz
    kjF-HjtC8entQ>
X-ME-Received: <xmr:RJyuZxrkINmDxZMuq-oyxOzUyxgCKhRhjVyVieYDtMg9rZdP7knlEc5agzrWP1l6xCkffHjr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegkeeffecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevud
    etueeiudfggfffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigv
    nhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoh
    epmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgt
    phhtthhopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsg
    gvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:RJyuZznnyxgCnM583OnvIdjJpC5eaScpsErlDoKoIvokKa56JMfowQ>
    <xmx:RJyuZ51tXpMPeGX-YBztlJcOqPS5W5tNOZGsvM4zRmXddGiOfCAeFQ>
    <xmx:RJyuZytWUklwZnfSkEv8r5PugFdBV22WJdzoV7OMYeKclDchhy4h-Q>
    <xmx:RJyuZ9Xjul0CzwBLV3y-kO4zIxuwMb-hIrs26Qtzb7nhE-Kpji-6SA>
    <xmx:RJyuZ0Q4U7Y2AdgSw6WP-1-UBs-4qNhN9YuYbVMWLYK79D3UvGjkZXjc>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 4/4] automation: add tools/tests jobs on the AMD Zen3+ runner too
Date: Fri, 14 Feb 2025 02:28:10 +0100
Message-ID: <82cb819ef4d54705b3a79ce5b77003380382ebbf.1739496480.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <cover.36ee649a8537af1a5fb5b3c5b7ffc0d8a1369969.1739496480.git-series.marmarek@invisiblethingslab.com>
References: <cover.36ee649a8537af1a5fb5b3c5b7ffc0d8a1369969.1739496480.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
new in v2
If those tests are sensitive to underlying hardware, I guess it makes
sense to run them on other runners too. Are they?
Similarly - does it matter if dom0 is PV or PVH for those tests? If not,
probably better to put just one of those jobs (PV?) to save CI
time.
---
 automation/gitlab-ci/test.yaml | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 93632f1f9204..fc7663e3367a 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -162,6 +162,7 @@
     PCIDEV: "01:00.0"
     PCIDEV_INTR: "MSI-X"
     CONSOLE_OPTS: "console=com1 com1=115200,8n1,pci,msi"
+    SUT_ADDR: test-11.testnet
   tags:
     - qubes-hw11
 
@@ -340,6 +341,28 @@ zen3p-pvshim-x86-64-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.18-gcc-debug
 
+zen3p-tools-tests-pv-x86-64-gcc-debug:
+  extends: .zen3p-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh tools-tests-pv 2>&1 | tee ${LOGFILE}
+  artifacts:
+    reports:
+      junit: tests-junit.xml
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
+zen3p-tools-tests-pvh-x86-64-gcc-debug:
+  extends: .zen3p-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh tools-tests-pvh 2>&1 | tee ${LOGFILE}
+  artifacts:
+    reports:
+      junit: tests-junit.xml
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
 qemu-smoke-dom0-arm64-gcc:
   extends: .qemu-arm64
   script:
-- 
git-series 0.9.1

