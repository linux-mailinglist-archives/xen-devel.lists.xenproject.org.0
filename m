Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14873A334AB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 02:28:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886998.1296601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiO1L-0003Qw-1o; Thu, 13 Feb 2025 01:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886998.1296601; Thu, 13 Feb 2025 01:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiO1K-0003ND-Uw; Thu, 13 Feb 2025 01:28:02 +0000
Received: by outflank-mailman (input) for mailman id 886998;
 Thu, 13 Feb 2025 01:28:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZTDb=VE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tiO1J-0002en-Vn
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 01:28:01 +0000
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c280dd4a-e9a9-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 02:28:00 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 0E96E2540229;
 Wed, 12 Feb 2025 20:27:59 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Wed, 12 Feb 2025 20:27:59 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Feb 2025 20:27:57 -0500 (EST)
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
X-Inumbo-ID: c280dd4a-e9a9-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1739410078; x=1739496478; bh=8M1xzm8hV9
	Um78SmNZrELAQJGXvbIf1E+3WQK8Hqgk0=; b=iLjcB+doguuTEFaTnkK6vUJjsa
	DPnKdkLLjYvS2HwcpPaVmcPJPdsddfn5ZY3oY3dG6jM2FBoACLFF5KvCviFS8m5o
	yFuTVR62czp4n6VR8169eMBtPDjUgR6CxdAjUXAqgWFdjzSErhs/N0nYw7CUkcoe
	d9O2bp0xjtZx+nlVUNaQmkMtbCK38sc2oW8ZfqSZwCxc/Nlw6yHICUc9H9pxgF1y
	cpmbyklXUDipvQOe43lUowi4Qh1o6JfCzHWvQZfSNPs8nB+31QuSe7h0HwY73tLH
	NE6rfmb0w5/zNrZni3nmpNyXgCyXuJGbpKuw/4KmvGshgGz8QnBiCEl44r2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739410078; x=
	1739496478; bh=8M1xzm8hV9Um78SmNZrELAQJGXvbIf1E+3WQK8Hqgk0=; b=i
	sYbeKuVh1bRNWGJPrJx22l/xR9HlLRFKQOZcLn4G54Nrvqm5t7rqiDt76Nknun0i
	AHHgvt+VNVMldaRi2tsvLgTtQd8YTdW0VjLxfrgFShUJrXrwjz0q4T05vXZRUgZv
	q4uJ2og491uL2k1wgUiyDX6aMMS5wPyVMo2L1xstO/KCsPFrZzvQmZ1hxlsIRyZW
	U4gKLkDXegP2SKjUq3650LmkdFX3eosfEdgoFvM0mNLMLle0RlAvS1C97YiBqEJB
	jnn9eYR7gDlUyRfj1mNi9W3wPgATgFRLM/Pd8WgP7Qic3CmfcqdesfKerl3Rtp30
	iE6qMPqrBRPltDzJgKiAA==
X-ME-Sender: <xms:nkqtZ9W61e0TJ9uW5LBXFtA9ssLLp1rQoJCYyFgTxeBXeYQlfbOjDA>
    <xme:nkqtZ9kGLoQjEvI_GlwBDbCQW5WG4Q0Mc1SzEewCJy3LmRjojhQrDFPC1MG3nbru-
    kdqp9s8BNsz1Q>
X-ME-Received: <xmr:nkqtZ5Y4LBe31T1j9wWPUoRe--iumarvuXTdNN26h4srNnxbgFb1BdoSIdl2KlQeoT8uKrqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegheeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepudeuheehtefghfelhfffheevffeftefhteehtddtfeevfedvle
    dvvdfhffevkeetnecuffhomhgrihhnpehgihhtlhgrsgdrtghordhjphdpghhithhlrggs
    rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgs
    pghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdqug
    gvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgr
    rhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtth
    hopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhl
    ihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:nkqtZwVI1htEc6CWkxKNI2GgOlk5GzhAVnvlkqfTV5N3EQUa99ymSQ>
    <xmx:nkqtZ3ns0FV431ABhZdbNomXG9720BHL0Ju7bCFLlnKp_XrQ1xlmqw>
    <xmx:nkqtZ9cB3Kzcu6tFNRsW_mNZlIAm5tCnlxpEALK_jHokIoasPxqqnA>
    <xmx:nkqtZxGEJdoSfWSsYhO86qIgYQKKO6FafvVXirOPxLlIMqPxhu5x5A>
    <xmx:nkqtZwAkQ2bEsYCCjV4LCikrK2mJK3dh3ZO_JUqA5Kyi7d_ilhSC2S-W>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 3/3] automation: allow selecting individual jobs via CI variables
Date: Thu, 13 Feb 2025 02:23:56 +0100
Message-ID: <90a256242870d1772bade171a7171d4e889f4e02.1739409822.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <cover.068c7421003863de7fca1cbe6aed2af000f061a7.1739409822.git-series.marmarek@invisiblethingslab.com>
References: <cover.068c7421003863de7fca1cbe6aed2af000f061a7.1739409822.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Debugging sometimes involves running specific jobs on different
versions. It's useful to easily avoid running all of the not interesting
ones (for given case) to save both time and CI resources. Doing so used
to require changing the yaml files, usually in several places.
Ease this step by adding SELECTED_JOBS_ONLY variable that takes a regex.
Note that one needs to satisfy job dependencies on their own (for
example if a test job needs a build job, that specific build job
needs to be included too).

The variable can be specified via Gitlab web UI when scheduling a
pipeline, but it can be also set when doing git push directly:

    git push -o ci.variable=SELECTED_JOBS_ONLY="/job1|job2/"

More details at https://docs.gitlab.co.jp/ee/user/project/push_options.html

The variable needs to include regex for selecting jobs, including
enclosing slashes.
A coma/space separated list of jobs to select would be friendlier UX,
but unfortunately that is not supported:
https://gitlab.com/gitlab-org/gitlab/-/issues/209904 (note the proposed
workaround doesn't work for job-level CI_JOB_NAME).
On the other hand, the regex is more flexible (one can select for
example all arm32 jobs).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
This probably wants documenting beyond this commit message. I don't
think we have any CI-related docs anywhere, do we? Some new file in
docs/misc?

And also, it's possible to extend web ui for starting pipelines to
include pre-defined variables. I use it in qubes here if you want to
see:
https://gitlab.com/QubesOS/qubes-continuous-integration/-/pipelines/new
Does it make sense to include SELECTED_JOBS_ONLY this way too?
Personally, I'll probably use it via cmdline push only anyway, but I
don't know what workflows other people have.
---
 automation/gitlab-ci/build.yaml |  6 ++++++
 automation/gitlab-ci/test.yaml  | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 35e224366f62..f12de00a164a 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -12,6 +12,12 @@
       - '*/*.log'
     when: always
   needs: []
+  rules:
+  - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
+    when: always
+  - if: $SELECTED_JOBS_ONLY
+    when: never
+  - when: on_success
 
 .gcc-tmpl:
   variables: &gcc
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index c21a37933881..93632f1f9204 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -1,6 +1,11 @@
 .test-jobs-common:
   stage: test
   image: ${XEN_REGISTRY}/${CONTAINER}
+  rules:
+  - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
+  - if: $SELECTED_JOBS_ONLY
+    when: never
+  - when: on_success
 
 .arm64-test-needs: &arm64-test-needs
   - alpine-3.18-arm64-rootfs-export
@@ -99,6 +104,9 @@
       - '*.dtb'
     when: always
   rules:
+    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
+    - if: $SELECTED_JOBS_ONLY
+      when: never
     - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
   tags:
     - xilinx
@@ -117,6 +125,9 @@
       - '*.log'
     when: always
   rules:
+    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
+    - if: $SELECTED_JOBS_ONLY
+      when: never
     - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
   tags:
     - xilinx
@@ -137,6 +148,9 @@
       - '*.log'
     when: always
   rules:
+    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
+    - if: $SELECTED_JOBS_ONLY
+      when: never
     - if: $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
   tags:
     - qubes-hw2
-- 
git-series 0.9.1

