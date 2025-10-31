Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3D3C239F6
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 08:57:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154061.1484184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEjzP-0005kY-DS; Fri, 31 Oct 2025 07:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154061.1484184; Fri, 31 Oct 2025 07:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEjzP-0005in-AT; Fri, 31 Oct 2025 07:56:03 +0000
Received: by outflank-mailman (input) for mailman id 1154061;
 Fri, 31 Oct 2025 07:56:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/6WH=5I=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vEjzN-0005ih-Ag
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 07:56:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a0bd2b2-b62f-11f0-9d16-b5c5bf9af7f9;
 Fri, 31 Oct 2025 08:55:59 +0100 (CET)
Received: from nico.lan (93-47-230-207.ip115.fastwebnet.it [93.47.230.207])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id B63264EEBC48;
 Fri, 31 Oct 2025 08:55:56 +0100 (CET)
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
X-Inumbo-ID: 0a0bd2b2-b62f-11f0-9d16-b5c5bf9af7f9
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=93.47.230.207
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1761897358;
	b=rJ/24UpygnSyHVDwSaYQJG2mOVK0B6pBaKcNkHBkD9o4wknzW74Z6jmfIZnP/F0N0ydw
	 Y/5+Tv+WLbW0OWV8Cu4OPYUNXaHGXt0kEUsAqiI/wQ/zdLuiUYGQeWWhQ8sgX1grnH0PU
	 Fy+HTUN4mihdEYO5R7a6Zzcgnd6AYS66MCsTMd69UmkoDDDrZ4Xr0wIcc/nzu2FQCX1U0
	 Z9h59CJncXQ87QN5eutjsGYdTEQ7PLnPisnNnylhRhfip/gNb/5FgXgOe5DWaB3tEyFQs
	 aJHjGuPIiBHEmyg1MRWqrx+DDhZegI7CfzsARJhvo6ZZEteLtn5aT+8ZneQj/+hcwWUB0
	 6D4DiULeweBrFm3pJtDveQIokYuJBmhva7IkoKYOCBiPsMy2FzqGrdtxR8pGlSHo0YDa7
	 ZsFO3CG78AaHqWczoBdF7V3CwEIJDn0/lhTv8dnw8aVKrvp30/RIe/nrb8TpT7cp7cSF9
	 x2WAvABJkB1yb20Taq7k1Q/sCy8c0bK2QDj75Dv8r5R4ESCrAhQrjr6f4aWmjEFM69ruK
	 nE/yGBJ+2gYfVFRm0y/IPxURQkr3Q1YUFRFLX/Dv+nWTaR9XzMH0a6fuAKvkRQ+YV1Y+D
	 OFcuVpljUKBJeN5xLtGj9fV2WkcD3ve8nPaTn1utWPqs8i4CPLJ0yu4uhwZDZ3c=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1761897358;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ME+0SCXxm8YQBolCBgj/0l4x8meUElYa/nRF4zoAzgw=;
	b=sx22his5U8vhlUxMPLB15BZN/j0kaltEDlvYuNOst/IHcVjx/XIwTX/TyjeUO0x2XBmc
	 ZGA3nmoOfv32BT0K0bAGKU+X6VRRqNHyEQcmkydrd8mTTxCTtyMkhLVedGhNYyJ8HcWQB
	 6+z1f/D3aEFbEJJBfSCd4ThRmoFp3OEi7WUBNiIkv7Qi1TVyWoj6ax6ns7PU5QtAb7az+
	 rhs4tBPHOkyAbdb9fAe81JMosF09KpkbFXaso5EOyT7TJxxIiY4ZhkcsVilS/1+gYuDy2
	 RX3hJw9D/S2uyq/9nJCOTp5pVHso2duHNL5f/Hvk1+ug5WynSKXEO5CGyzUSDXo/tsi1P
	 Q+jPem/eIpmL+0kBdQOxl5dnIOZ6FJDX3YT2vJc95xw/7YoUiwf+M5HSQoZILu8GjNxnF
	 ab3uVBy785lShsugK05ITLsPVcm39ByjSy+ZcvMbMOeKL2vIqJ93m0ZD3Wv3miPFMPs3V
	 11du538bG8LJ+A8UlEVT49mtKCATBS0GBnBY+S7x/0ueLGHq/Pu7x/CR0H8ptBhw/vZOJ
	 U3k6LG0iNlEDS9FTewl1PkhxOMxOmJo0/q/Tw/kZN3MU54l6AAg5O8zDHjielzb8qjCa/
	 k8C8j2viF3D45vxxeFsfflPmd4b0hHRKFexNXxugZZ4DOdRyBr25hOCFhq+x848=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=93.47.230.207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1761897358; bh=3IQ7K45greuYW2PnCxrmWyDaM1oM+6AG/sfoMH8BBOM=;
	h=From:To:Cc:Subject:Date:From;
	b=jL1A1z+Rslf+cYv5Nk43lUy4tXVnLLivOahuOcRqkU1/aVGYMBYcc38ndBDef5aAh
	 pCqvWHNzUT49bOmcjqz7uU/LguRDsCGymcnc6OEB74t4IpNpI2xhq2WGXZn64IJ4JV
	 vbVZHqH/P5Zf2hcPhxo2sBy8ouDsjD562ngSWuAv15xsrSyY00SGpdzahJc9heJ6nC
	 qLvXA6EAjdfHvOPGPWvTYrnTSRV+zld4kNxkmNTt00wIIgAxBKzX7zPWcjHx1pKH2C
	 vXDQ9rfgWisDtWTKWLW64Mffhh8ow4dReHXZfSsb5GIym6MvHHXpLuK2kGIrKlryKG
	 D2cQjZs8f4xow==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v3] automation/eclair: add new analysis jobs with differing configurations
Date: Fri, 31 Oct 2025 08:55:47 +0100
Message-ID: <876da816d5aacdb688599fd1d50efca2f856d080.1761897244.git.nicola.vetrini@bugseng.com>
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
CI pipeline: https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/2130873833

Note: the eclair-ARM64 and eclair-x86_64 jobs are allowed to fail because the
configuration is not (yet) clean for all checked MISRA guidelines.

Changes in v3:
- Use a variable instead of testing the repository PATH to decide whether a job
  should be run for *-testing and *-safety analyses;
- Allow eclair-{x86_64,ARM64} default configurations to fail, as the configuration
  is not yet clean for MISRA.
Changes in v2:
- rebased to current staging;
- fixed regex path issue.
---
 automation/gitlab-ci/analyze.yaml | 42 ++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index d50721006740..fae55a23dbb5 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -45,6 +45,22 @@ eclair-x86_64:
     LOGFILE: "eclair-x86_64.log"
     VARIANT: "X86_64"
     RULESET: "monitored"
+  allow_failure: true
+
+eclair-x86_64-testing:
+  extends: eclair-x86_64
+  tags:
+    - eclair-analysis-testing
+  rules:
+    - if: $ECLAIR_TESTING
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
@@ -75,6 +91,10 @@ eclair-x86_64:
       CONFIG_DEBUG_LOCKS=n
       CONFIG_SCRUB_DEBUG=n
       CONFIG_XMEM_POOL_POISON=n
+  rules:
+    - if: $ECLAIR_SAFETY && $CI_COMMIT_BRANCH =~ /^staging$/
+      when: always
+    - !reference [.eclair-analysis:triggered, rules]
 
 eclair-ARM64:
   extends: .eclair-analysis:triggered
@@ -82,6 +102,22 @@ eclair-ARM64:
     LOGFILE: "eclair-ARM64.log"
     VARIANT: "ARM64"
     RULESET: "monitored"
+  allow_failure: true
+
+eclair-ARM64-testing:
+  extends: eclair-ARM64
+  tags:
+    - eclair-analysis-testing
+  rules:
+    - if: $ECLAIR_TESTING
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
@@ -120,13 +156,17 @@ eclair-ARM64:
       CONFIG_DEBUG_LOCKS=n
       CONFIG_SCRUB_DEBUG=n
       CONFIG_XMEM_POOL_POISON=n
+  rules:
+    - if: $ECLAIR_SAFETY && $CI_COMMIT_BRANCH =~ /^staging$/
+      when: always
+    - !reference [.eclair-analysis, rules]
 
 .eclair-analysis:on-schedule:
   extends: .eclair-analysis
   rules:
     - if: $CI_PIPELINE_SOURCE != "schedule"
       when: never
-    - !reference [.eclair-analysis, rules]
+    - !reference [.eclair-analysis:triggered, rules]
 
 eclair-x86_64:on-schedule:
   extends: .eclair-analysis:on-schedule
-- 
2.43.0


