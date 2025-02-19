Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1554A3AFD5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 03:58:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892315.1301328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkaHP-0002kD-DX; Wed, 19 Feb 2025 02:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892315.1301328; Wed, 19 Feb 2025 02:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkaHP-0002iZ-6g; Wed, 19 Feb 2025 02:57:43 +0000
Received: by outflank-mailman (input) for mailman id 892315;
 Wed, 19 Feb 2025 02:57:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rZvE=VK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tkaHN-0002Sc-SM
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 02:57:41 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46a18624-ee6d-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 03:57:38 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 6811113809B4;
 Tue, 18 Feb 2025 21:57:37 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Tue, 18 Feb 2025 21:57:37 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Feb 2025 21:57:35 -0500 (EST)
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
X-Inumbo-ID: 46a18624-ee6d-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1739933857; x=1740020257; bh=egCiFo3q5O
	7GT+Ni7H7hTzWDUErl6ShDR+nSG2Zsoj4=; b=pDD7oeMWqugj/uVR6Rja/a/hUe
	Z6e7BdSwP5ibfuJ5DqbSnDyqhzqHNsaXMIhXxny6voKw66obQVUqRc2fB6xVqpqa
	mUu+P2H4iTQ079VfFfXMnROOIC6JF8RzXKjuH3Pn4wopMMjI1DsOUCZkUTLNVuk6
	AnNAhrJtgXXrq9EptEahFYP5QgNfLvY9Mw3EM1MCeo5ewCSw34u5pEGAKZG6AsvA
	l6xH/YGNZNOkrJyghF60Uo5q8eFxYjmsdK7cVRd9SMKjN4DToW1ERxrdUKna5Cec
	d350JPbdY+BZfAbqNdyq43Mrxuh7vx8hJBVwA3VpEQYdYm4NjVpopleRXLoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739933857; x=
	1740020257; bh=egCiFo3q5O7GT+Ni7H7hTzWDUErl6ShDR+nSG2Zsoj4=; b=W
	cb1P4zoeq5z0nC1HatoektibLxaFhWRIwlTymAWiJSLbnj5Zh67KBgxkcFQ2RGn/
	ctSDSpV3niF/ovqeYD0nz8GhsgrfOKwXITBEEonyNFjlZc9vN/dm8MUE51y2q2Kx
	eHf7RB4ZR1lZEFzjh8BTRXRzZJTxUJ8wczEuNV14jjCWx2CmjkXgD56B3luL71k/
	Mgmd/HFG0jMqcngcD5KqRJK2t1kpsIDXKunJr/ZK7VuTi4CZv5J9mV3iDSnhcG7A
	JJDSGH/Te88iXPA2zTAoDaaRFORnfCgSmlCB+mvm6XdK+Fkqd46kyC5N0rwMEvb4
	TBu71RHKiycWbVYQsQUzQ==
X-ME-Sender: <xms:oUi1ZxWyvQo1s390232-QM27rGuNpjBZephG2tzavAmoRGUCbx2sWQ>
    <xme:oUi1ZxnNFaphh4lDiCnAAuWkOjZP_8FGc1yqGSpE0QK4mxLRA6g_gzTctPgYIxglz
    Jywf6-kO6W1lg>
X-ME-Received: <xmr:oUi1Z9Yh-bnoVLCBJbICDs-RMmjMBZmAfLd9SMY9ylmgnM4ruu35iqfDgyUCZGRksu7AqIa3zymAM3neZtwzjzTiMmzQ1CCwfAT9XW8WP7UNynRVf88>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeifedtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepudeuheehtefghfelhfffheevffeftefhteehtddtfeevfedvle
    dvvdfhffevkeetnecuffhomhgrihhnpehgihhtlhgrsgdrtghordhjphdpghhithhlrggs
    rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgs
    pghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdqug
    gvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehmrghrmh
    grrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtohep
    tggrrhguohgvsegtrghrughovgdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinh
    hisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:oUi1Z0UYpQ0cHQQXqC7lVAxxiQ26yd4aLpenLM0QjRGBP1Jpzmm10g>
    <xmx:oUi1Z7kX-ZRtPYeoObdxceFqvdYh4SCDNJoY6UgQJFZTrIbK0Kn4IQ>
    <xmx:oUi1Zxfs0Qa4SZJ2u3uGegdrEhs5e3wNEUDQoVD30yheYdSb3xRwPA>
    <xmx:oUi1Z1HBT4t3qWzdmZWiQG2TL7HwoXBqLTJml4nv-wQU-IAQo0vR2A>
    <xmx:oUi1Z2smASEQ0l8zRwXvm9BHaNW7w5jMauJP4DpEP_i4wwCPEwct8Ust>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 3/5] automation: allow selecting individual jobs via CI variables
Date: Wed, 19 Feb 2025 03:56:53 +0100
Message-ID: <95088c06171ce140caf48029118dcb6fd2ac8d99.1739933790.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <cover.0fd3c8fb7cf6db337edfd5c5d6ea18bcc44bdef3.1739933790.git-series.marmarek@invisiblethingslab.com>
References: <cover.0fd3c8fb7cf6db337edfd5c5d6ea18bcc44bdef3.1739933790.git-series.marmarek@invisiblethingslab.com>
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
Changes in v3:
- include variable in Web UI for starting pipeline
---
 .gitlab-ci.yml                  |  2 ++
 automation/gitlab-ci/build.yaml |  6 ++++++
 automation/gitlab-ci/test.yaml  | 14 ++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5a9b8b722838..b3beb2ff9ddf 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,5 +1,7 @@
 variables:
   XEN_REGISTRY: registry.gitlab.com/xen-project/xen
+  SELECTED_JOBS_ONLY:
+    description: "Regex to select only some jobs, must be enclosed with /. For example /job1|job2/"
 
 workflow:
   rules:
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

