Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C605C04BF6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 09:36:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149959.1481319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCCLE-00054c-5h; Fri, 24 Oct 2025 07:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149959.1481319; Fri, 24 Oct 2025 07:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCCLE-000523-2C; Fri, 24 Oct 2025 07:36:04 +0000
Received: by outflank-mailman (input) for mailman id 1149959;
 Fri, 24 Oct 2025 07:36:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=66m1=5B=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vCCLC-00051x-2P
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 07:36:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13d7af00-b0ac-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 09:35:56 +0200 (CEST)
Received: from nico.lan (93-47-230-150.ip115.fastwebnet.it [93.47.230.150])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id F0BFA4EEBC5A;
 Fri, 24 Oct 2025 09:35:53 +0200 (CEST)
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
X-Inumbo-ID: 13d7af00-b0ac-11f0-980a-7dc792cee155
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=93.47.230.150
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1761291355;
	b=gECyHvzPvHH9Mm/5GniWMF1jCUe3PZ+VpD8RFlk0gvMNQaEI4je40X5YHdquxaZs7IuQ
	 ootzGnkZ3Bk1cETVD38uU2QWi4yI15DEN7DXd/yzvsW0HBsogBTaatpzhq7m8ahkZcKCA
	 PS7kiJ7p7M9zIluD4fwNRWF4jSAImZzSbWkAaeclZjDJ0PJP+B5I0Udj/ti9elI/+/nwX
	 mgsXaw1OLLcSrNPpIOhBOEBUTsdotEIbHJsbvEtbBjRVqanYfnNQ8oOS4rHM74YjnzUTz
	 wHjHfBvyjVCQhZC/+EAUTk9QmRttl/BhtfhLdVwii1kbNY3NXTNq07gz6hWDgNPxSBYGi
	 EEnZAEeCA8h4AB5/YK4Z56BzhtNHfHUI2RD8Xc7xD1gJKqcDUU6qYtyZKAZtW/Wc/tE60
	 kYYKbSxwAMaZIzj6EMAKSS/D2yfNAquuXjPTnCIgYx0GBbEe0IZEnG4LSmK2SaH1DJCxK
	 mNscpfi5g2X+1llX/qzR9+tfUVdFOfMCKcqP3eGOWJtjbw7za0fSNL/+aJm2P7iFBYe8b
	 LTleariyV//daN56uo1mgYAq9GfBvENWUleDDOO3GP+O+fnhseAN5TNTIK0zZbYdCY6UU
	 CQu9Q4u9kwfaof798UGzsAmWCWSES4LKNkQIE/OIoxiTL5gX31AS7wIE9W59hnY=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1761291355;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k47XGGcI1tgMdIHAXpNsDfUaNH+qQL8siZGHBgpYaEg=;
	b=f3RCFznSCBd1QzsEbvnkUudzggBKknCLx8PMEsBm2AlpQiiCkpSs5uy5iraBqaDGE3F/
	 jjEzDhgbBqwVUTERdjNIDKvxwFZKuHgSop/ggQKbAjICMZC/6xymjWBmPK3sFiZPKENtd
	 9U1FM1dHtIfmcILBN2YKpVqtxM/+mK448F/yXtXsDC+J03Xx9NWAZTaj3wnMWHruuJb5l
	 W5fGPbSVnGakYYDzZ6ir+PEOuY6X3Q+pLQgHTuNG8DUQHslZnEmIwan7WC0t0eB9T5WL1
	 V3gaoceQVGzFc//xBuwHzPeITFyWH9tFK9wjhCPlvPfUAKngxb3sq5dnMY5cJOKyMQNAG
	 zk/u0efRj5wZgMVRtLULq4mnyrscVfvijIh2r4nnNjzVEUIPMhNQXF4MpelBU6SM/212B
	 M42MmIQCaL1IhxHyoGhogVdK24wixPsbrlkS4clojdj4u4Q3RuTei3d8XILv7MhK90+cX
	 CKZ74v3XxqrDsxPMF0zqwxREMxbCwvg+gm/npEiXCSWWc4YHjs5ROUOssKIAPRH/vH1Dr
	 lTQZ/+6W9N9EWPoeIWderrfRatJAuzi4USucGnLfdYPA1RODfv+GRxniGSIQVUwATb07z
	 njKsiFjauSrq+9nIbL1DmhtEWL/Yk2vTwNYx/cDFf5MDR7tpJ0ykR26LambGuQ4=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=93.47.230.150
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1761291355; bh=6YytjT5w7M/Sjkgqzf7fCX2zPkVFUTx6aC7wbOe9n4w=;
	h=From:To:Cc:Subject:Date:From;
	b=SoalW89+G4oFy3ttoapptw4mjCL1vEvEA4QXKWG/s+mONhluUm2PaUvkuAXzMHzck
	 nhopm+zavFbnC6xknj98BntK3TM5gJwMeW4ftMLd3Bcv9bRuzSRAdeFkd9YMlMVjoT
	 C63vCsaAkdkW5xUBYM1LjNy6nRYN5Z158tdofQjZ7BHmdHK4xYvOTi/sUkpRL//LI/
	 +RDVQgVwllXRgHHlHfRAudPCMTwyJ0bkY19t+KzCZTK8LdJZoR0wkZE+JIbE32BPoQ
	 o0rRksEUGj4UIYtKCa2kq65iFkNuubu3saIWTSBfGFP5KOVY+JccsfmTAmPpq63FTO
	 XPaiz0HVzrJ0g==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: [XEN PATCH v2] automation/eclair: add new analysis jobs with differing configurations
Date: Fri, 24 Oct 2025 09:35:27 +0200
Message-ID: <1591f6a0c0f3524c4c613328293ed4e03cfc93ef.1761291003.git.nicola.vetrini@bugseng.com>
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
Changes in v2:
- rebased to current staging;
- fixed regex path issue.
---
 automation/gitlab-ci/analyze.yaml | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index d50721006740..7bd644d75074 100644
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
+    - if: $CI_PROJECT_PATH =~ /^xen-project\/hardware\/xen$/ && $CI_COMMIT_BRANCH =~ /^staging$/
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
+    - if: $CI_PROJECT_PATH =~ /^xen-project\/hardware\/xen$/ && $CI_COMMIT_BRANCH =~ /^staging$/
+      when: always
+    - !reference [.eclair-analysis, rules]
 
 .eclair-analysis:on-schedule:
   extends: .eclair-analysis
-- 
2.43.0


