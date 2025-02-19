Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D1CA3AFD4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 03:58:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892316.1301332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkaHP-0002pN-Kj; Wed, 19 Feb 2025 02:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892316.1301332; Wed, 19 Feb 2025 02:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkaHP-0002jp-G4; Wed, 19 Feb 2025 02:57:43 +0000
Received: by outflank-mailman (input) for mailman id 892316;
 Wed, 19 Feb 2025 02:57:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rZvE=VK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tkaHO-00020f-Iy
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 02:57:42 +0000
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48a9ebc6-ee6d-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 03:57:41 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id D80C11140205;
 Tue, 18 Feb 2025 21:57:40 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Tue, 18 Feb 2025 21:57:40 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Feb 2025 21:57:39 -0500 (EST)
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
X-Inumbo-ID: 48a9ebc6-ee6d-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1739933860; x=1740020260; bh=/fLCth7Q/1
	XRFnTxMsuFuruQj9l16HRepoNJ35BBnDA=; b=Jbf588YMjIlXs75RSWZRfr5EsR
	fGmEtntAgJh174aHoVQPB1/fXE7lP+7/BVyXwBGWlB+HCEduozMgWsFuEYT8htYu
	VUGmzjBEvU1F7wOJoXitXBfmasMLuyXRRrji44ZzdIRs5mGdDh3EiQJdvdOJCIBn
	h++yu+cUhuBbh8xSCVmw/c3FLsgHLXFrcSrfAMzFUtowTgeFcEMXWNkZmKGzCX0g
	cGt/sa0fevkCDhTyPwUUxX8iAoXtXBjZHVXh+pYaWiItGuvJj4bt1NmGRSOviwN+
	D+IXkLOkSu4aNTaz6IGU9rPWVCi4/Tqp+iHwGh8dtF7jWiVE+wFAfZCExArw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739933860; x=
	1740020260; bh=/fLCth7Q/1XRFnTxMsuFuruQj9l16HRepoNJ35BBnDA=; b=Y
	dE9G14zx4ysIsJPxLKdgqG8rBmPijE4Hpw/SI7iPaHniD68MXTn4Q77m/QOjGgXo
	UV6Ph/eIpn41j2kfoXqNDGj1mZxvZuWYl8wMH8wQGYCYuXriaqGp0kNQVm07V7rD
	qTOzUvctAcu4xMZyol9VOK332vrcZHs+1ZwxzPzM0t5O4Brt+edvxQRpqTZdIr6v
	h/bGUssoTyfLrGa0Khpp3wKmQ0j7x3O4V6GwvoW/ygRNeNQgB5SG+1s3yPcCCERN
	JVSDubA2lIOoRyE0cnGNu2eH1Woe2JJjA9X44rH8E5Hw4Lk3jJaLi3sU+0Shqf8t
	Cy+tQOaN9eQtuFECwQc4Q==
X-ME-Sender: <xms:pEi1Z0oGfcPEr-MW8A6XXYWp9c6H18cxF4xdNZ0R7PuCNWKFsJaLGQ>
    <xme:pEi1Z6pFENBT-AAUw7hzxZxcdrCJjaBqGfLSml6sM-s3KpvcJJuiEdPbu1IOzaxYQ
    irJIuMHlyS_AA>
X-ME-Received: <xmr:pEi1Z5O9nNHkAjnFotIS3MWMM64ITxGryCqMkJOlrNOAE6glRjxCfwG2LsFEs5X_XoNlMYoW3lTHw6vzrneMCtEZTxeakR_6c0tmshXroFc7n8kuiHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeifedtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepfeefjeeglefgtdefleevtdegtdegudelffetffeufeejveeife
    ejveefhfeikeevnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpghhithhlrggsrdgt
    ohdrjhhpnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgs
    pghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdqug
    gvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehmrghrmh
    grrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtohep
    rghnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopehmih
    gthhgrlhdrohhriigvlhesrghmugdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhes
    shhushgvrdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpth
    htoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgr
    sggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:pEi1Z741dpQaOcjCafcRu0xxutCLWj0Mx-TLk3iib_JvzTBgO15y2g>
    <xmx:pEi1Zz5aCfZMfREn1R_3cGCzjELzbgcI_-HUONlJEA3FBIWyjXMyVg>
    <xmx:pEi1Z7i8HZ-IztiBENFai-JxzOKn3c07rzXMPlAyQxMGSbDhSYF60A>
    <xmx:pEi1Z947dHPrXACGD0mRYe3gpGW05rfUCS5sHYfaywrUvvm_pR2d5A>
    <xmx:pEi1ZwFCnFXVQyIlpH6DtF5u6k2Aq9vlATcjfXSEAWXXWdiJqPXq8hQE>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 5/5] docs: add basic CI documentation
Date: Wed, 19 Feb 2025 03:56:55 +0100
Message-ID: <f5fd85826a24bb6d7048d2db1c9c8417bf13c026.1739933790.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <cover.0fd3c8fb7cf6db337edfd5c5d6ea18bcc44bdef3.1739933790.git-series.marmarek@invisiblethingslab.com>
References: <cover.0fd3c8fb7cf6db337edfd5c5d6ea18bcc44bdef3.1739933790.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Include info how to get access/enable hardware runners and how to select
individual jobs.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
new in v3
Definitely there can be more content here, but lets start somewhere.
---
 docs/index.rst   |  1 +
 docs/misc/ci.rst | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 docs/misc/ci.rst

diff --git a/docs/index.rst b/docs/index.rst
index 1bb8d02ea357..bd87d736b9c3 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -51,6 +51,7 @@ kind of development environment.
    :maxdepth: 2
 
    hypervisor-guide/index
+   misc/ci
 
 
 Unsorted documents
diff --git a/docs/misc/ci.rst b/docs/misc/ci.rst
new file mode 100644
index 000000000000..2803574fa2c0
--- /dev/null
+++ b/docs/misc/ci.rst
@@ -0,0 +1,35 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Continuous Integration
+======================
+
+Xen Project uses Gitlab-CI for automated testing. Test pipelines for official
+staging branches are at
+`<https://gitlab.com/xen-project/hardware/xen/-/pipelines>`_. Developers can
+schedule test pipelines in their repositories under
+`<https://gitlab.com/xen-project/people/>`_.
+
+Hardware runners
+****************
+
+Some of the tests are using dedicated hardware runners. Those are not available freely, but the access is granted to individual developers. To get access to them, ask on the ``#XenDevel:matrix.org`` Matrix channel.
+After getting access to relevant runners, few extra changes are necessary in settings of the relevant "xen" gitlab project (under your `<https://gitlab.com/xen-project/people/>`_ namespace):
+
+1. Go to Settings -> CI/CD, expand the "Runners" section and enable relevant runners for your project.
+2. Expand "Variables" section and add ``QUBES_JOBS=true`` variable for Qubes runners, and ``XILINX_JOBS=true`` for Xilinx runners.
+3. Go to Settings -> Repository, expand "Branch rules" section and add a rule for protected branches - only those branches will get tests on the hardware runners. It's okay to use a pattern for branch name, and it's okay to allow force push.
+
+Selecting individual tests
+**************************
+
+Normally, all build and test jobs are scheduled in a pipeline. When working on a specific patches, it is sometimes useful to run only jobs relevant for the current work - both to save time and to save CI resources. This can be done by seeting ``SELECTED_JOBS_ONLY`` variable when starting the pipeline. The variable holds a regular expression, enclosed with ``/`` that matches jobs to be included. The variable can be set via the gitlab.com web UI or directly when pushing changes to gitlab::
+
+   git push -o ci.variable=SELECTED_JOBS_ONLY="/job1|job2/"
+
+Note if a test job requires some build job, both need to be included in the regex. For example, ``adl-smoke-x86-64-gcc-debug`` requires ``alpine-3.18-gcc-debug``, so to run just this test the command will look like this::
+
+   git push -o ci.variable=SELECTED_JOBS_ONLY="/adl-smoke-x86-64-gcc-debug|alpine-3.18-gcc-debug/"
+
+More details at `<https://docs.gitlab.co.jp/ee/user/project/push_options.html>`_.
+
+Alternatively, irrelevant jobs can be removed from respective yaml files in ``automation/gitlab-ci`` by adding temporary commit on top of the branch.
-- 
git-series 0.9.1

