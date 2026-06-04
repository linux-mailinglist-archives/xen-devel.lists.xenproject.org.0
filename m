Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xqWuCrcRImqwSAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 02:00:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F98644132
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 02:00:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=oBUDndcL;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328786.1593113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVHzK-0008DO-Dm; Fri, 05 Jun 2026 00:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328786.1593113; Fri, 05 Jun 2026 00:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVHzK-0008An-Ad; Fri, 05 Jun 2026 00:00:38 +0000
Received: by outflank-mailman (input) for mailman id 1328786;
 Fri, 05 Jun 2026 00:00:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wVHzI-0008Ah-N8
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 00:00:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVHzI-005jwN-3j
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 02:00:36 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a22118a-5cb7-0a2a0a5109dd-0a2a450ae7ce-48
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 02:00:35 +0200
Received: from [52.101.48.71]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a2211a1-56b3-0a2a450a0019-3465304704a8-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 02:00:35 +0200
Received: from MW4P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::24)
 by PH8PR12MB6794.namprd12.prod.outlook.com (2603:10b6:510:1c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 00:00:26 +0000
Received: from MWH0EPF000C618B.namprd02.prod.outlook.com
 (2603:10b6:303:115:cafe::a4) by MW4P220CA0019.outlook.office365.com
 (2603:10b6:303:115::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Fri, 5
 Jun 2026 00:00:25 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C618B.mail.protection.outlook.com (10.167.249.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 00:00:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 19:00:24 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 19:00:24 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 4 Jun 2026 19:00:23 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3gyqK7Xmw7Y32add8NOPcpJPD+yTaGRSuBa2Ml5a6drXLg+ZKa8C1zIB40c1TTtixdKU0rN074pQhrZtmxy6V0l6HlUCjrVuswpcofAQrhGG7rEF7gl72/AZyxg1yK+tCW9FKwkwrD6CYVtCfPGp5sKVl3dFAnQ1LHjUlk21hVu+7i688XrrYJl+EMydRwgCeMWLBp4uy5OqRK8AiCRZa2+woXbEjBGS/zEKWxzHZ7F08JWR6Xtc1J3YdURCyLw790AJZCV3y7dsno7sG9knC2T1LzfWuECZLBfKyVIiU9HugCJRce2MPu4m6vlFRE9MeJEfSrGS+pJZNzpYSIyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3ZAX5zHzltcsneFLuRK9xQYApH/8L0XRz3ExNJ6YiI=;
 b=rhXGIff6dnj1JlXaRDdPR+kj2RTwgYX97keRE9FRurlFQMUnh1L14I1sNSKcY1/WljlXRqqYnUAmJpxlZpfZwxNwgQTvV9v8D91hl+acV3fVxKoYbnAAF+ILxV6Y/UUozT6c3yO4HHGDYxQFifbvLj+23LtlBfCNbdw0VcSh5QlfHmVWnm9pmGkenNDhg05BqZRdQVPsvoLEFElxVSTkAkfsabTrIfRCuWbFU+uJE5uvjR7PhyCUXlnAMRwPKCx6S9cLxs100pgReuBANi6Jg02bAn8xxMHCLeEXmmfcDA6dL1jze7J/q0PzL6tLfi+KajZ6wHIrG8pGBozkABFDCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3ZAX5zHzltcsneFLuRK9xQYApH/8L0XRz3ExNJ6YiI=;
 b=oBUDndcLuJvTKF013+T+nGf4jBWCFnoPe+ZjL2nhFHbmdWVvAS3fWaHNk81XI6emPIrASKJ8A+ea9D7xi7EJ3pcDwvCHB6ltH0EVwlLJKaKGiEGZY7yYpCMto1HafIEYorB4b3lZtcGcUyAa6JY9GDJRFMTag5KqgdJY9xQIf+U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] automation: Add C xenstored and stubdom tests
Date: Thu, 4 Jun 2026 19:33:28 -0400
Message-ID: <20260604233328.805829-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618B:EE_|PH8PR12MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb72e32-d7fc-442f-66b5-08dec2957258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Z0bTijIZe8vd0sdWXr12r2iBm4W/GxVIcENLsZof155H0jlcuqdriBsYCRWog6Yoc0BjlZND+md3tnpHHKaQf5RiA4TGgw6wXlYe9jQR5nHk/7VdEUARyPE8G2svuiBkGBLvj3sZhMeXADKazCUXCaMZ7pRKV13zaNE8sc7jjIGZYT20j15Xo649iPFbylG7DzRlEvuspFMeKnrW5eCSfTcqGiBg5YeL/t4XVcpQqeQnRlkrsPdlZB1Ir/KrU533feGiFcE4Yk0YFhYsFi7kFxwH1opc+N5tcicyao6hhz7zEkHg5hlk7PyxtwN2qlHTOqiL2v9Fx/4V6pmmu/BwJPDVw0b03Gxm7m8W6pnteaFuYCBYoZ21u4ANF/5w4dPDBbfNW2qoXdaCeaQL9lEXYpa0mSuBGzYUWwcgGDjgCDfQN9vCFjW/+kLcYqxmtDTlTvxZv1ysOS31ldGn7wYC5Bvcii9JZ7JGAo2XHBYhGq02J+pdRgC9afTFP92nvWafU+PpJg853lNZ2g8b72pNPuklymEGRMeKS7jOPnTizRYYuQJLrpLlaq8F0C7t26LyFOWM/rapLqMtZB11bzzYrK2pKNP/KMtIq8Ok8K81Z8qhIBsQQ0cU7F6jb6AIdYSKZt7hkXb+iayx9nHZlV4bCYHWfSkCeIYGw1imkmVT7Rar/oC6KwTR3KwSUnFvsYvQk5NsH2vfyaLysN6HqBBfU6XQRqX6eeiUm0/NTVinPbY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	M3gyea7wQCaTSd2F99AoUlbNtVcO4TRlaye8eEcgK9Y49wQC0J72yul+Ghv+6X3OVAWLppQKWn069ceD8C83SlQPVwhpWzW+qpWJSVEZ7fqfilcP0T7xzbA//yWkUDK0KfVNHOBZIzjThJk8ojzusGBaPbzvQrRPhAG64quDLqJNEcUkVhmgkDQlnJV6Cg+fqY1kArlnFzCKHnd8g2DHjUcSVZY9n+M7ZoWuTgWGkwpGQE2Rn252hu9R4HcUHyEHrYhXSY5Fbbu8vPDcv9sJjU/TPnOTd76EwiQgI0YN3EaSG211Ep8gH8q4apvJmN6PzWA/wTHNciQh8yi1VqgjropZ/leWIG7a//QBpsBMbr736hGgCmssY+qVSYwewVKLSjwZDQT6qXeJnUoZKu9buvLtczwy/Yy92fyDi3M7Fx1BdnoKCDPnGwETb/QwmuiR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 00:00:25.6173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb72e32-d7fc-442f-66b5-08dec2957258
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6794
X-purgate-ID: tlsNG-4011c0/1780617635-7C67F8B7-09FBC061/0/0
X-purgate-type: clean
X-purgate-size: 2352
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jason.andryuk@amd.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81F98644132

Expand testing to include C xenstored and xenstore stubdom tests.  OCaml
oxenstored is run by default.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
Pipeline
https://gitlab.com/xen-project/people/jandryuk-amd/xen/-/pipelines/2577925467
C Xenstored job
https://gitlab.com/xen-project/people/jandryuk-amd/xen/-/jobs/14704763517
Stubdom job
https://gitlab.com/xen-project/people/jandryuk-amd/xen/-/jobs/14704763518

 automation/gitlab-ci/test.yaml           | 16 ++++++++++++++++
 automation/scripts/qemu-alpine-x86_64.sh | 20 ++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 1722800c15..dfe5555154 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -656,6 +656,22 @@ qemu-alpine-x86_64-gcc:
     - *x86-64-test-needs
     - alpine-3.18-gcc
 
+qemu-alpine-x86_64-gcc-cxenstored:
+  extends: .qemu-x86-64
+  script:
+    - ./automation/scripts/qemu-alpine-x86_64.sh cxenstored 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc
+
+qemu-alpine-x86_64-gcc-xenstore-stubdom:
+  extends: .qemu-x86-64
+  script:
+    - ./automation/scripts/qemu-alpine-x86_64.sh xenstore-stubdom 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc
+
 qemu-smoke-x86-64-gcc:
   extends: .qemu-smoke-x86-64
   script:
diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 242ffca693..0105a3b001 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -2,6 +2,25 @@
 
 set -ex -o pipefail
 
+test_variant=$1
+
+xenstore_selection=""
+
+case "${test_variant}" in
+    xenstore-stubdom)
+        xenstore_selection='echo "XENSTORETYPE=domain" > /etc/default/xencommons'
+        ;;
+    cxenstored)
+        xenstore_selection='echo "XENSTORED=/usr/sbin/xenstored" > /etc/default/xencommons'
+        ;;
+    "")
+        ;;
+    *)
+        echo "Unrecognised test_variant '${test_variant}'" >&2
+        exit 1
+        ;;
+esac
+
 # DomU Busybox
 cd binaries
 mkdir -p initrd
@@ -49,6 +68,7 @@ echo "#!/bin/bash
 
 set -x
 
+$xenstore_selection
 bash /etc/init.d/xencommons start
 
 xl list
-- 
2.54.0


