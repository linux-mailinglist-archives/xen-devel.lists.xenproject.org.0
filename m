Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 395C7A607AC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 04:07:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913698.1319622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsvNo-0005KV-E1; Fri, 14 Mar 2025 03:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913698.1319622; Fri, 14 Mar 2025 03:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsvNo-0005JS-Af; Fri, 14 Mar 2025 03:06:48 +0000
Received: by outflank-mailman (input) for mailman id 913698;
 Fri, 14 Mar 2025 03:06:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vjjD=WB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tsvNn-0005JI-5e
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 03:06:47 +0000
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b5e0f19-0081-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 04:06:44 +0100 (CET)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.stl.internal (Postfix) with ESMTP id 78AD81140186;
 Thu, 13 Mar 2025 23:06:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Thu, 13 Mar 2025 23:06:42 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Mar 2025 23:06:40 -0400 (EDT)
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
X-Inumbo-ID: 5b5e0f19-0081-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1741921602; x=1742008002; bh=0W9J08A9Ifq6aMXbixhqcaPih7lkqCUt
	zRxT6UKwgTc=; b=M77myQnHUrcphoeZjC9OnW1DjGwLFXU28ige53+IabMdrlby
	yOAxXB5+K0eyMOOEo9kUqvvNc7Epf/LSa5bZmQx+7twbOFCs1/gUggWvmPi7lDUM
	efo3spO138/p4DfqfetOdl7SQXJOckzgnekSVBO9+qQWAO57eWkQzi/jm7GPbLlp
	nlpqg4CcIZQhBHyUxAmJY+ANn3QlrVS6iVuVoUV9L40/FWtqU7JnPY1f66UesrpD
	l1HVp4OAWmkolpDFTUsuTv9YsvA9jsrtHEsinXAS2/oTCvV3GCcqfZJ2dtUUWVEn
	pdmsP1eHdquRz9vd8aAeNgxLlhVww72d28RSLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1741921602; x=1742008002; bh=0W9J08A9Ifq6aMXbixhqcaPih7lk
	qCUtzRxT6UKwgTc=; b=20itiBuvPOT2tfq2U2bewopSzJshBjqY5KB6TsXUU5uF
	dSOZHBHvtBBX+lBvd0U1QD96+YkbA/KjN4jhk71FJ5121NRkLMcrtNzIqkkPPGmW
	Zk8F1eeRJXR6nVBx9aYE+x/bhH+se+iGZssFo2Ga/smfEBk9I2lhr7jSpRFzdShX
	G/pKZCSPEYlFH+vjxdiePqD6f91XM14KB3wxyMecUt/EYB9v5HboKoGpTphxhuZ3
	SufWLKo9tYNFolAfBhbDYy8+XbqGcTJtcF4E/GXuRcdeoKNPMlDi6DmXI+aFncOq
	2UTXHQB5wvzi5XeBJBKJLq2KuP2xDA8YZZjt7Lrg1A==
X-ME-Sender: <xms:QZ3TZ7B1Y7dmxx5BJuHommGyOGzW-rKedtTCFMbzW5vID9L7Jn19yA>
    <xme:QZ3TZxhYS9cLq9ScmflZ0n0cIJl_ZzCaSuORJmfST3lKPugTvi2mmhJ_t1TWPq3xx
    2Ipr-VzLQtKhw>
X-ME-Received: <xmr:QZ3TZ2lqullPFNvcnIDnu4K5kyfvJSqgGsKobhUvOS1JtSOvokQFOUsOHMKwyiqOUzE4Ex5p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdeljeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpeejueefhfelieekgeeftdfgieeugefhudetjeethfefveehffejhf
    eigefgjeekleenucffohhmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepiedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnh
    hprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgs
    lhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhush
    gvrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidr
    tghomhdprhgtphhtthhopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtoh
    epshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:QZ3TZ9wQqRuJuflz4BiE75DNPMNgH2x-xTFq88ljWAhpVYCv7rb0CQ>
    <xmx:Qp3TZwSaNTtlPMqFmIAudVCQcT3KVGWfBLa3i1LVH09MJKRvRNYeyw>
    <xmx:Qp3TZwbIyFJI6tcDOAdKlHMDWayLrrd8FuN9PtgZ6jSbrvy_stiqzw>
    <xmx:Qp3TZxQgWK_8PBgPqSGGtsRolGmIdgn08ePIY-Q2I_wVWSon1N8tkA>
    <xmx:Qp3TZ_GmWVZf3YZIM7wtrPENiIhWXkXFHs8-dAE4-qBCi7WPgNdRdRYL>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] ci: add yet another HW runner
Date: Fri, 14 Mar 2025 04:06:26 +0100
Message-ID: <20250314030628.96166-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is AMD Zen2 (Ryzen 5 4500U specifically), in a HP Probook 445 G7.

This one has working S3, so add a test for it here.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>

The suspend test added here currently fails on staging[1], but passes on
staging-4.19[2]. So the regression wants fixing before committing this
patch.
For this to work, the runner needs to be added to relevant repositories
(especially hardware/xen one). Somebody with appropriate access need to
go to Settings->CI/CD->Runners and click "enable for this project" on
hal9001 runner.

[1] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408437140
[2] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408943441
---
 automation/gitlab-ci/test.yaml | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 9530e36e9aaa..6b8e1b830e3d 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -155,6 +155,16 @@
   tags:
     - qubes-hw2
 
+.zen2-x86-64:
+  # it's really similar to the above
+  extends: .adl-x86-64
+  variables:
+    PCIDEV: "01:00.0"
+    PCIDEV_INTR: "MSI-X"
+    CONSOLE_OPTS: "console=com1 com1=115200,8n1,pci,msi,04:00.0"
+  tags:
+    - qubes-hw1
+
 .zen3p-x86-64:
   # it's really similar to the above
   extends: .adl-x86-64
@@ -301,6 +311,22 @@ adl-tools-tests-pvh-x86-64-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.18-gcc-debug
 
+zen2-smoke-x86-64-gcc-debug:
+  extends: .zen2-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
+zen2-suspend-x86-64-gcc-debug:
+  extends: .zen2-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh s3 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
 zen3p-smoke-x86-64-gcc-debug:
   extends: .zen3p-x86-64
   script:
-- 
2.48.1


