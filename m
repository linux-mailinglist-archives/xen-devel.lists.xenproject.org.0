Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1715DA353B3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 02:28:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888259.1297672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tikVT-0005op-PG; Fri, 14 Feb 2025 01:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888259.1297672; Fri, 14 Feb 2025 01:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tikVT-0005ih-JM; Fri, 14 Feb 2025 01:28:39 +0000
Received: by outflank-mailman (input) for mailman id 888259;
 Fri, 14 Feb 2025 01:28:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kkdH=VF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tikVR-0005Nw-FW
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 01:28:37 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 029dd132-ea73-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 02:28:36 +0100 (CET)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 973761140207;
 Thu, 13 Feb 2025 20:28:35 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Thu, 13 Feb 2025 20:28:35 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Feb 2025 20:28:34 -0500 (EST)
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
X-Inumbo-ID: 029dd132-ea73-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1739496515; x=1739582915; bh=8M1xzm8hV9
	Um78SmNZrELAQJGXvbIf1E+3WQK8Hqgk0=; b=gmOcKtPjvElDelKwGCXU5UmSxd
	Ock1EECd78G1BedShiWbb/AC2Nd1vDfYaUcNPALpuO6uGQpw46pELOB9KUvdgvTy
	nORy0qAK0M4psISKccGsGt5L3IwPR9QXqHyE3CGM/kLHRBhcqrdfnbmdoALk8nKW
	8J0kRKL2E1qn+Ge4ck+z+RJ4JG1WGZvNnh6IhwnMl+rRg7r7W0lbNbsTulNKSEQM
	5Nju3b3Isp0XohglstKZkVbA7LhJtJ01qU6ZL0TSSd7IPJCg02NS3XgmTNq3VbyN
	KWIY5bTXvg4famv32da1JJyEPH+5ZD/yFDTUOiwRgZ6jP50cZZrPPAamRE6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739496515; x=
	1739582915; bh=8M1xzm8hV9Um78SmNZrELAQJGXvbIf1E+3WQK8Hqgk0=; b=0
	B/eq6H1epggdSxqjlwEj3Gc/SeN9DaZ0kw/yUj2A5ZnyW86FH4ylIpEEF/HWSGW+
	MdpGUc0LTUC60h+zGM+kZoUpb6jG3pIx1m3ujvhi79Q3vEeP5bpDjTv8vI4gYBAK
	Co/8Fbn/2Pab2xOZ96vnrrbsXNYYbzkYU2cLFRFOVSebHQ06IwKGbeLjO/29S6qi
	i6JrOYhNughGn9kvzIwXxSB3DHselQyfHwRYwU1hbiIbQfNmtHoJ2xO9OWShRkKJ
	vuBiwaKqc2uC3nkeSB8MrBhX9nKm3RuioYSvRbbqwqqC6UWZwpFbdaN8fYlXGVXv
	dxDPLizux1T0o32gUy2gQ==
X-ME-Sender: <xms:Q5yuZzJWqYG4-wNAmMUxkYocWhA6oRtNbO_IqAsf3jn-wiFRUOvttQ>
    <xme:Q5yuZ3K7mHJvgf5N_3uwhQ2rJDyd6FDEdPFk3hSyWLmi5Fzks9lvJ_8gnoAnZZ649
    64VVLJPGJBkLA>
X-ME-Received: <xmr:Q5yuZ7uT6KM9S3eiPIO_2mi8hKzO5Gzdxa8rP_E-apLkgjs97JDRB_DI9GdiuV0tyKqIkd_0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegkeefgecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:Q5yuZ8ZUCF7X0atxrCA9ydsP6P1-NhCQ6S0BvNYzKGZK5GL0rpWyig>
    <xmx:Q5yuZ6bAgZybakjLyR4gxUl8OTDvy0EIF8Cw0lzYl3086jxRDFRTBw>
    <xmx:Q5yuZwDHQkTEAL3qJbWfbfBLrL76ylkQVDG0kyNBCJHoqF9lDWby6w>
    <xmx:Q5yuZ4ZM1vXDv8YhcNuCbhNk97i9si4WlbxSfWW6KD_Fh9A2uuZCCw>
    <xmx:Q5yuZxWmdmhErqADfwedpeusM24Nu3NFc7cFBE7DCOdj7VDHnH_mVZF6>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/4] automation: allow selecting individual jobs via CI variables
Date: Fri, 14 Feb 2025 02:28:09 +0100
Message-ID: <53730b7d7120635ce9079b57fc7e25b610569316.1739496480.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <cover.36ee649a8537af1a5fb5b3c5b7ffc0d8a1369969.1739496480.git-series.marmarek@invisiblethingslab.com>
References: <cover.36ee649a8537af1a5fb5b3c5b7ffc0d8a1369969.1739496480.git-series.marmarek@invisiblethingslab.com>
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

