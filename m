Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBB9C2DE93
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 20:34:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155546.1485011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vG0Ji-0005gz-1c; Mon, 03 Nov 2025 19:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155546.1485011; Mon, 03 Nov 2025 19:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vG0Jh-0005eX-V5; Mon, 03 Nov 2025 19:34:13 +0000
Received: by outflank-mailman (input) for mailman id 1155546;
 Mon, 03 Nov 2025 19:34:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJ2K=5L=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vG0Jg-0005eN-FL
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 19:34:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 120d2b28-b8ec-11f0-9d16-b5c5bf9af7f9;
 Mon, 03 Nov 2025 20:34:10 +0100 (CET)
Received: from nico.lan (93-47-230-207.ip115.fastwebnet.it [93.47.230.207])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 11F824EEBC3F;
 Mon,  3 Nov 2025 20:34:07 +0100 (CET)
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
X-Inumbo-ID: 120d2b28-b8ec-11f0-9d16-b5c5bf9af7f9
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=93.47.230.207
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1762198449;
	b=qrHdFp9X+ih9VfDcSkpyaEakZ2zeSuppLf+z7SLWjm2dN6eQVjV/DSYTJzzO863Jf2GK
	 vY3YCRFPqRVUawxuany6SYqjRY01F8rEwK0X0N/NCBkaqZmVojThLONbdXiIjXub1gXqO
	 gnZa7B4LqQgoQfLKHGq49vwQoeaum+ea1RTZ25goBHholkjRiqL3PD8Q6ZLwLy5eRZLry
	 jz/MS1CsV50LH7n6xLrzv2pEbYoMDD9yusbVGh1Bu1waaAxS8pVoW0fhNCgnNOJrfzepn
	 DvuLyglQEf1DkjD+jlDV6DYC2B7kVJX5x8xKCfQmjoLJli2bB1/rKtkgxOz0TQm6iGmbr
	 3LLCWHdACyodpiYbBQUd48jSr9v+SAKJoHqLODx89Evdn7TnBSj0/oaSMohvPvm73dOJv
	 T7SVBQmnWy5zQJXlFVQUoYC46RDWtkWDvJCTX3FC5+490IJvDIlNiC5der0QMwwDv6OJi
	 3/aVkV7WYOUjxzK9KOE1gZz9PK0LQJS4NmkwWZ+svcb+zkPlKn7BliawnY4iRRsEfQyrc
	 /Y2r0aZ9L8CVSClW1sD0H/+g/a6DjIcwrf6m3AHcpk0qD0P3ywcuipFFxvXYrudhyCf3B
	 PzIMOIbAW2oRuCADXX98aCkPwAPmcpHs6wEXmHpvkY3EioVOQMa1c2XSkQYckQ8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1762198449;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dAtDayeHDE09ZUdvwZTqspDwxJzsTV1TTp3E2eju5KM=;
	b=w2F4spGxWQ/B5ckt+u0vlznQARhXUuvMMBNGB3DD0gzeKOPauEZE364tTGl64f+vtmo6
	 d322ZoVzbJoLQGqFGjyw0Z5pKZlt8sCSl1hlmFRTQhn6u2xoi9aokUClxzLOxlsKPB76U
	 sEgnQJ9/3Jacb+G1wurGoAHV9yP45zV4HQuLP03+5grX8b1sf+k8Ls1qEA7x3ETzC7MNj
	 6Yt3v9Pr/QgYTSqepSv/qzKo5gA3q8vJUMI2rXzx9pF8BzRA+283LL3UBQZc8JRAg2FV8
	 f4xKrwUPStoNznl7DqfLY2IYZW7Ll9ZT47eKGHIfZ4WzVEshaf1RvuY3/OANUz9uZ/0E+
	 hbVNgR3t1lYjMzxX2or8w0QT0RpfF/aljzk7pbHiDVonQHW12iJFXQSLl8TJ1+f9hzENK
	 9PSK7AEMDlQ+HA+1mX8kDVx15VLuOotmaC6SVWUkGtFh4NcxMbNSJu8h9p5/8qIR0e8OQ
	 Wi8+4P6KcroVqxh1eV5EudctWQvcjyvACamxzQyEhweT/5X9DltD8Q3d9UY8wqU30oWAO
	 JOOull+NbkCr89GA0zNrXykGSdx3bTV1nB1Rqgt6dVAqQO1jRiVpzhn+3xH3FgIwmm175
	 6Mj3mtICywEFe8F76XWI8Yk8j7Jo807kJBlgasyBye5BPCqg4xy92yl9zv14d+w=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=93.47.230.207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1762198449; bh=n2KvhSyyYZELIeQypXP1VynbbTN5spCKqN1M2riE0io=;
	h=From:To:Cc:Subject:Date:From;
	b=rz0OjJelpMKOAsGj0vnJGT9NqJETMuQdGcPHQDaZtcbiaeD78jtlmYBJJJBlbTpgh
	 tj035XuI709824zp0uhpFEOtP1UUvtjNtRjSbRQkK529m/5+tmj3yVrpsCKmXgNGkZ
	 VtKeEhY+SOk/3+EcKfGOdzLwlHGr/+ufZnblcbtGoheG7+XJ51xxilfpfnCsJVkdhx
	 MdJzDdarAw115gL8RSGbdBu1b/RGYfzjk7rBMU48LbnnnTyE6lVDFPZA17tRwD9I6w
	 dzSWfWvRhM3Ra9CPCMfQnCQNWPMlIqlKw7e/2ANIBVSE9FSbL/WEMlFxuEWZJt8r1H
	 RefSCp+rKDeJA==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v4] automation/eclair: add new analysis jobs with differing configurations
Date: Mon,  3 Nov 2025 20:34:04 +0100
Message-ID: <6244858973ae88195405630b4a6847085ffce638.1762198392.git.nicola.vetrini@bugseng.com>
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
CI pipeline: https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/2136967775

Note: the eclair-ARM64 and eclair-x86_64 jobs are allowed to fail because the
configuration is not (yet) clean for all checked MISRA guidelines.

Changes in v4:
- Do not allow *-safety jobs to fail, as they should be clean
- Drop check on CI_COMMIT_BRANCH for *-safety analyses
Changes in v3:
- Use a variable instead of testing the repository PATH to decide whether a job
  should be run for *-testing and *-safety analyses;
- Allow eclair-{x86_64,ARM64} default configurations to fail, as the configuration
  is not yet clean for MISRA.
Changes in v2:
- rebased to current staging;
- fixed regex path issue.
---
 automation/gitlab-ci/analyze.yaml | 42 +++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index d50721006740..d22d1dbbc3de 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -45,6 +45,23 @@ eclair-x86_64:
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
+  allow_failure: false
+  variables:
     EXTRA_XEN_CONFIG: |
       CONFIG_AMD=y
       CONFIG_INTEL=n
@@ -75,6 +92,10 @@ eclair-x86_64:
       CONFIG_DEBUG_LOCKS=n
       CONFIG_SCRUB_DEBUG=n
       CONFIG_XMEM_POOL_POISON=n
+  rules:
+    - if: $ECLAIR_SAFETY
+      when: always
+    - !reference [.eclair-analysis:triggered, rules]
 
 eclair-ARM64:
   extends: .eclair-analysis:triggered
@@ -82,6 +103,23 @@ eclair-ARM64:
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
+  allow_failure: false
+  variables:
     EXTRA_XEN_CONFIG: |
       CONFIG_NR_CPUS=16
       CONFIG_GICV2=n
@@ -120,6 +158,10 @@ eclair-ARM64:
       CONFIG_DEBUG_LOCKS=n
       CONFIG_SCRUB_DEBUG=n
       CONFIG_XMEM_POOL_POISON=n
+  rules:
+    - if: $ECLAIR_SAFETY
+      when: always
+    - !reference [.eclair-analysis, rules]
 
 .eclair-analysis:on-schedule:
   extends: .eclair-analysis
-- 
2.43.0


