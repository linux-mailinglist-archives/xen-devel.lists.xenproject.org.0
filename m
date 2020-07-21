Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB2E228873
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 20:42:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxxDl-00020c-9M; Tue, 21 Jul 2020 18:42:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8efX=BA=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jxxDj-0001xV-MS
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 18:42:31 +0000
X-Inumbo-ID: e7f1f129-cb81-11ea-85a2-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7f1f129-cb81-11ea-85a2-bc764e2007e4;
 Tue, 21 Jul 2020 18:42:20 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jxxDX-0001u7-TP; Tue, 21 Jul 2020 19:42:19 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 03/14] schema: Provide indices for sg-report-flight
Date: Tue, 21 Jul 2020 19:41:54 +0100
Message-Id: <20200721184205.15232-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
References: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

These indexes allow very fast lookup of "relevant" flights eg when
trying to justify failures.

In my ad-hoc test case, these indices (along with the subsequent
changes to sg-report-flight and Executive.pm, reduce the runtime of
sg-report-flight from 2-3ks (unacceptably long!) to as little as
5-7s seconds - a speedup of about 500x.

(Getting the database snapshot may take a while first, but deploying
this code should help with that too by reducing long-running
transactions.  Quoted perf timings are from snapshot acquisition.)

Without these new indexes there may be a performance change from the
query changes.  I haven't benchmarked this so I am setting the schema
updates to be Preparatory/Needed (ie, "Schema first" as
schema/README.updates has it), to say that the index should be created
before the new code is deployed.

Testing: I have tested this series by creating experimental indices
"trial_..." in the actual production instance.  (Transactional DDL was
very helpful with this.)  I have verified with \d that schema update
instructions in this commit generate indexes which are equivalent to
the trial indices.

Deployment: AFter these schema updates are applied, the trial indices
are redundant duplicates and should be deleted.

CC: George Dunlap <George.Dunlap@citrix.com>
Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 schema/runvars-built-index.sql    | 7 +++++++
 schema/runvars-revision-index.sql | 7 +++++++
 schema/steps-job-index.sql        | 7 +++++++
 3 files changed, 21 insertions(+)
 create mode 100644 schema/runvars-built-index.sql
 create mode 100644 schema/runvars-revision-index.sql
 create mode 100644 schema/steps-job-index.sql

diff --git a/schema/runvars-built-index.sql b/schema/runvars-built-index.sql
new file mode 100644
index 00000000..94f85ed8
--- /dev/null
+++ b/schema/runvars-built-index.sql
@@ -0,0 +1,7 @@
+-- ##OSSTEST## 007 Preparatory
+--
+-- This index helps sg-report-flight find relevant flights.
+
+CREATE INDEX runvars_built_revision_idx
+    ON runvars (val)
+ WHERE name LIKE 'built_revision_%';
diff --git a/schema/runvars-revision-index.sql b/schema/runvars-revision-index.sql
new file mode 100644
index 00000000..a2e3be13
--- /dev/null
+++ b/schema/runvars-revision-index.sql
@@ -0,0 +1,7 @@
+-- ##OSSTEST## 008 Preparatory
+--
+-- This index helps Executive::report__find_test find relevant flights.
+
+CREATE INDEX runvars_revision_idx
+    ON runvars (val)
+ WHERE name LIKE 'revision_%';
diff --git a/schema/steps-job-index.sql b/schema/steps-job-index.sql
new file mode 100644
index 00000000..07dc5a30
--- /dev/null
+++ b/schema/steps-job-index.sql
@@ -0,0 +1,7 @@
+-- ##OSSTEST## 006 Preparatory
+--
+-- This index helps sg-report-flight find if a test ever passed.
+
+CREATE INDEX steps_job_testid_status_idx
+    ON steps (job, testid, status);
+
-- 
2.20.1


