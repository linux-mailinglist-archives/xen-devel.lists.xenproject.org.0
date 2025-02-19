Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D53A3AFD8
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 03:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892314.1301317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkaHO-0002W1-1m; Wed, 19 Feb 2025 02:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892314.1301317; Wed, 19 Feb 2025 02:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkaHN-0002TD-Sp; Wed, 19 Feb 2025 02:57:41 +0000
Received: by outflank-mailman (input) for mailman id 892314;
 Wed, 19 Feb 2025 02:57:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rZvE=VK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tkaHM-00020f-94
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 02:57:40 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 477ca3c0-ee6d-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 03:57:39 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id E0B9C13809B8;
 Tue, 18 Feb 2025 21:57:38 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Tue, 18 Feb 2025 21:57:38 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Feb 2025 21:57:37 -0500 (EST)
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
X-Inumbo-ID: 477ca3c0-ee6d-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1739933858; x=1740020258; bh=do5qlXv4Af
	CHjiJyaew1l6a1bkT7B3D+R0jIARcUMHQ=; b=hjGqFdqXPoFCMdQm5RfLItOLd1
	K8tOlW1MEJHtjf/SpX5AUAFjsRJcCEZ9ZYup9mQv0rDLlUAwNLMs5vDUC507iUaT
	gM6b4pizdneFaOY7Ga2rvsmHtVpjU1/PSQhSx67F2CJMyxSJVaUrqfuwExTZAvBD
	xQ+aIcKgza62gEnuMXncSf26sHBNaIWlfsmziU6jW0F4Ev8JIar1NeBnB09Ajqyd
	ZF71Gz1P+lb9SD2CD7TavNKWLleeR7XmepGbnASw0VTmjpf4vVAl9kSM8xK7Ou0x
	5l5fhck34g31ssMyPtcDLqyY23F7DUpx/4N8DxstgY+nZXoBSACHpeVm3x4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739933858; x=
	1740020258; bh=do5qlXv4AfCHjiJyaew1l6a1bkT7B3D+R0jIARcUMHQ=; b=U
	7CXIpBWYAS7SpKo4sxWfsk4oY0nOstgtNVAmrIbCPJQXnJxVVAddoxPUijAoSL1C
	BL1LByks53sLV3em9sl+vn71kP4c59XAnVqjIENB2GEK9BuAJp8MMsGL7YiPRBQj
	yVx3I4qmBtCrM5Qgh/MwUk7ALDsZHZo3KGSGkp9VqdClom+hHOOpPlXOj7MHkgHY
	hmCnm0IlaVJffKKw3b8e74G3b0f+Psx+8VKGRR/uIktEtPjB8bHb5Tceyzs+KaZ6
	50KI/19iTXBPXVGHBJ7Hd3GmCX2jtZV+2UPLkSiYyqqX256+L521HeuHdr+yJoa8
	sc3V/dsnWFa+YQ9Fno9JQ==
X-ME-Sender: <xms:oki1Z8U2-TKD-U1OwaFx6nX7r8A7HSX5HTVS6049kwc5730nkEr-0g>
    <xme:oki1Zwls4zbq2I_WCnjakJs_ey44coXNE9Hn5MJfFnIZbr3ITL_eGjvxxODLyf7Zf
    roDfGrMDSSkJw>
X-ME-Received: <xmr:oki1ZwZukQ-NV4Z6pqNlYEpRYDAvrh_2fg5jnMT9jkyWSttPx9ay1MkSmz8po0KsrY1bCDp4QClvEqNNKMSqyi7qblh5q64HjaepcCizzKVSxtSkQ1I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeifedtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevud
    etueeiudfggfffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigv
    nhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoh
    eprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehm
    rghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpth
    htohepshhtvghfrghnohdrshhtrggsvghllhhinhhisegrmhgurdgtohhmpdhrtghpthht
    oheptggrrhguohgvsegtrghrughovgdrtghomhdprhgtphhtthhopehsshhtrggsvghllh
    hinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:oki1Z7WoMDB8g3Z1DNynQ3Uhz-VTQDFUs8v5gY3PSr5yOh8vt7Gbsg>
    <xmx:oki1Z2k3avVNO6at3DtEZ39LeqJUZA4Cxtf3AynP5TSYGkZUY0Rr5Q>
    <xmx:oki1ZweKtI-zB3yL7960hrHg6UkV5HpBgICRJPUfTI9un06SYdkNUQ>
    <xmx:oki1Z4Gg8iawjVb0PuDY3CSASgMnK9S0hxwDe12OxS32uAho3OI1cQ>
    <xmx:oki1Z0bXZUA_Vuk3pAEMmyxR_O3oCDNg2XlTG9q_qp9OzaaWmSGS6zBZ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 4/5] automation: add tools/tests jobs on the AMD Zen3+ runner too
Date: Wed, 19 Feb 2025 03:56:54 +0100
Message-ID: <4aa64c6e2393c66b9310b29b8be03c15b7e59c27.1739933790.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <cover.0fd3c8fb7cf6db337edfd5c5d6ea18bcc44bdef3.1739933790.git-series.marmarek@invisiblethingslab.com>
References: <cover.0fd3c8fb7cf6db337edfd5c5d6ea18bcc44bdef3.1739933790.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
new in v2
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

