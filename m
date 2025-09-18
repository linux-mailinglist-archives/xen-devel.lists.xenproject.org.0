Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0F6B86DF6
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 22:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126621.1468125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzL3F-00056Z-50; Thu, 18 Sep 2025 20:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126621.1468125; Thu, 18 Sep 2025 20:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzL3F-000555-28; Thu, 18 Sep 2025 20:16:21 +0000
Received: by outflank-mailman (input) for mailman id 1126621;
 Thu, 18 Sep 2025 20:16:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/FRX=35=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uzL3D-00054z-Vs
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 20:16:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 530c9be5-94cc-11f0-9809-7dc792cee155;
 Thu, 18 Sep 2025 22:16:13 +0200 (CEST)
Received: from localhost.localdomain (93-57-251-12.ip167.fastwebnet.it
 [93.57.251.12]) (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id BD90C4EE8C90;
 Thu, 18 Sep 2025 22:16:12 +0200 (CEST)
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
X-Inumbo-ID: 530c9be5-94cc-11f0-9809-7dc792cee155
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=93.57.251.12
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1758226573;
	b=gNkY2VaE/7oBZxEsIgxcjDha0yAGUgSuHrdhCk7l7/tEYBz9Y0XLftEVIChZXSWlsccV
	 XPr2irK0NdVchg4KrRejGtnbERvLXERzbS0foCB86G9gohzMyJcvIWMAWRrj7CSYDlctq
	 O8pOR6+8rnqKxLVK7jSU1oLC4NfNb+Ej7+mvyz5DoSXZyoTWKCz6P2e3YP5fX5jfiMgUg
	 I0BEjbEdJpQQh30khhOrJyCYytcn85Odh4l8Mn740QOT3k0l1STjgLj2B0tQMiZiUWwfC
	 UAC3SA85LYKVYK95X3QzaJs9lsXtugHE2GajL3Jh7iCjlZoxbd5kFHsJfrAmO5dF/Wnjn
	 TLDBsmm0TsbqrBeVRY54EqpB3/mQUXIBFdmvtpSFwWsgkrOJ+Zj+xq6JoXE/J/Lbkd7O+
	 LQVohEFutwwMeJbwjaWyscScguhg/ox4m7nNZGyR0IH7BCT9u/S0nQJmSsLc5Kj6chZlE
	 SYv6wG96UwnSgH2h/HnZj8tr2HB2b8pKWGwcfOv+G3AlRAvwsHKYdjEyG9cavXDXgWz/n
	 NXKrUT1vlYELCSAgdL2tPjClZmXDN9qcwtRv5rchedm0T8WJljjKcXBxuz1PA940xCRyH
	 ct17RGS/GXfsx8j6LmbpKj4Ue/clJzp70zURpHluiPU1iWtA7q4gNS6nhzxhwjA=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1758226573;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qPTBLZ8UJbfLqGPM8eHSSCnZOzSzmEdxISP7KOJYQnI=;
	b=F86wEK5OXq3o/kvZ8NK5ogCZstzDRy0xuEjBe+neVQ5/QQmJdQl+WqoqBvtnyjHitJOL
	 B93/UCmFeUrMfWD6TTdN5TX3ecw/5/+r9W9PHXve92jEYzAV0HOzAr4W4wE9sHd7Fiotl
	 SytYkebyixWWXl4COKrzP3sQ9lhClWvr4+VTM0cXGYpWxWEj+HHndJQmv2VMWZpH2pjpJ
	 qIm+J8QtIiN0EjaJfNUAFVcnJd/0PzdK4ONmgj3KCHrvg8NCanw4bS6WryZBtnIlu7PC8
	 +I0o8BZ+31V/+iIVeSZGZbh2Jii6yOPkndhzDHFNaqHZhIV1T3BjBNmUiSL8QIjn6w3dE
	 9qds+Ul8yHjQziP94B8sFojDU4ejR64SVjjXI1e/foGOY/9CWMQ3EE28PRRrjsS3AQyV7
	 GTWrH+pmduA8lQf0E8tw9QYrB0eOdoj3hpkcNCM6UvcieywGTwdsnvWS7imgouiJo9e4P
	 jEM2wnDbnV3rdZkOVoW/3SWe/qTjXmZtK7m/IY3OitygFQD9td7aVHNlUuvuLTMF2TbeN
	 ocVbfZBZsibIOMoe4TPeUL7DAAu7y0w5fQ79YJUj8FctyBgTITA55FaMEWuqVMFpfTJN1
	 mYEVTk7XrLx7w8SiaarXnYxKmfqNcuK9inmTkcNwFwiqpUpvsghZGy0MPKJoo/I=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=93.57.251.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1758226573; bh=OuWNAloEC753OlhWTV9Q2rSFc2tQrl8vXxKS5qP4ONU=;
	h=From:To:Cc:Subject:Date:From;
	b=Bjr04aUGu7aW4qJYDw2N5wViVjX/HwoyYg8CvNgOYWnBzp05MARHC+zbirlKLYl3F
	 ZKtRzs9Nwfn4RkeA13Sg4yYCCBl1MTNMHTAEA4JeMmIj1umfV1d2uVJr2QNp/lZAxe
	 MmYd0t84piSg22Qfel6bdVD3lf+ljAkhWs7lF7Ua0JL0yAyMmbuUXZyiYfInLeNiN6
	 HUMi24AcUqUk+q956CtyKfJXZom/BVxoZEM0DgOoxNVLGumJrhohTu0bYUbALNRn9z
	 rI+gkuuYUCb3rNk4+dHLzoQ1cqHv4Kyn+2+Ju2rQMBPGGXIR7G41TCdJfvQqYCQ4uo
	 QlWwwhAVYLHvA==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH] automation/eclair: add new analysis jobs with differing configurations
Date: Thu, 18 Sep 2025 22:16:08 +0200
Message-ID: <d4a0924c84e78b3f677b0d987c2f8e4b3f6b80a5.1758226234.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following analysis jobs are performed:
- eclair-{x86_64,ARM64}: analyze Xen using the default configuration for
  that architecture; runs on runners tagged `eclair-analysis'.

- eclair-{x86-64,ARM64}-safety: analyze Xen using the configuration for
  safety, which is more restricted; runs on runners tagged
  `eclair-analysis-safety`.

- eclair-{x86_64,ARM64}-testing: analyze Xen using the default
  configuration for the purposes of testing new runner updates; runs on
  runners tagged `eclair-analysis-testing`.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Naturally the right tags to the runners should be set beforehand for
this to work as intended:

xen-eclair-runner -> eclair-analysis-testing 
xen-eclair-runner2 -> eclair-analysis, eclair-analysis-safety
TBD -> eclair-analysis-safety

The last runner is not set up yet, but due to the redundancy can be
brought up anytime.
---
 automation/gitlab-ci/analyze.yaml | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index d50721006740..a4cca00fd100 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -45,6 +45,21 @@ eclair-x86_64:
     LOGFILE: "eclair-x86_64.log"
     VARIANT: "X86_64"
     RULESET: "monitored"
+
+eclair-x86_64-testing:
+  extends: eclair-x86_64
+  tags:
+    - eclair-analysis-testing
+  rules:
+    - if: $CI_PROJECT_PATH =~ /^xen-project\/people\/bugseng.*$/
+      when: always
+    - !reference [.eclair-analysis:triggered, rules]
+
+eclair-x86_64-safety:
+  extends: eclair-x86_64
+  tags:
+    - eclair-analysis-safety
+  variables:
     EXTRA_XEN_CONFIG: |
       CONFIG_AMD=y
       CONFIG_INTEL=n
@@ -75,6 +90,10 @@ eclair-x86_64:
       CONFIG_DEBUG_LOCKS=n
       CONFIG_SCRUB_DEBUG=n
       CONFIG_XMEM_POOL_POISON=n
+  rules:
+    - if: $CI_PROJECT_PATH =~ /^xen-project\/hardware\/xen$/ && /$CI_COMMIT_BRANCH =~ /^staging$/
+      when: always
+    - !reference [.eclair-analysis:triggered, rules]
 
 eclair-ARM64:
   extends: .eclair-analysis:triggered
@@ -82,6 +101,21 @@ eclair-ARM64:
     LOGFILE: "eclair-ARM64.log"
     VARIANT: "ARM64"
     RULESET: "monitored"
+
+eclair-ARM64-testing:
+  extends: eclair-ARM64
+  tags:
+    - eclair-analysis-testing
+  rules:
+    - if: $CI_PROJECT_PATH =~ /^xen-project\/people\/bugseng.*$/
+      when: always
+    - !reference [.eclair-analysis:triggered, rules]
+
+eclair-ARM64-safety:
+  extends: eclair-ARM64
+  tags:
+    - eclair-analysis-safety
+  variables:
     EXTRA_XEN_CONFIG: |
       CONFIG_NR_CPUS=16
       CONFIG_GICV2=n
@@ -120,6 +154,10 @@ eclair-ARM64:
       CONFIG_DEBUG_LOCKS=n
       CONFIG_SCRUB_DEBUG=n
       CONFIG_XMEM_POOL_POISON=n
+  rules:
+    - if: $CI_PROJECT_PATH =~ /^xen-project\/hardware\/xen$/ && /$CI_COMMIT_BRANCH =~ /^staging$/
+      when: always
+    - !reference [.eclair-analysis, rules]
 
 .eclair-analysis:on-schedule:
   extends: .eclair-analysis
-- 
2.43.0


