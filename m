Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9969ABBE9
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 04:54:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824395.1238543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3RWK-0005Qe-G2; Wed, 23 Oct 2024 02:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824395.1238543; Wed, 23 Oct 2024 02:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3RWK-0005Oj-Be; Wed, 23 Oct 2024 02:54:48 +0000
Received: by outflank-mailman (input) for mailman id 824395;
 Wed, 23 Oct 2024 02:54:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6MJf=RT=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1t3RWJ-00051s-Dp
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 02:54:47 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20623.outbound.protection.outlook.com
 [2a01:111:f403:2414::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27c64948-90ea-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 04:54:44 +0200 (CEST)
Received: from SJ0PR03CA0289.namprd03.prod.outlook.com (2603:10b6:a03:39e::24)
 by SJ0PR12MB8614.namprd12.prod.outlook.com (2603:10b6:a03:47d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Wed, 23 Oct
 2024 02:54:40 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::4d) by SJ0PR03CA0289.outlook.office365.com
 (2603:10b6:a03:39e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29 via Frontend
 Transport; Wed, 23 Oct 2024 02:54:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Wed, 23 Oct 2024 02:54:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Oct
 2024 21:54:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Oct
 2024 21:53:54 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 22 Oct 2024 21:53:53 -0500
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
X-Inumbo-ID: 27c64948-90ea-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XytwHAvdDHcr5eRiKnl1osTaOOwQ8Up/1c+apxrZcJzcFOKMOXjic5jQ6U1cDnu7Go65TYSwWzk2Se0SHuTTSgf+5VabhtHAzOU4s1CrqxBNsvDn5HP1GDW+lXXfjrgmCGIzNktIOLjUSZx88booIsEDikHC6OCoYQEUMWJpAzmwhVbMtkwJZ/wWp3qLhyMoLKZcP2avMI8FX795T7z/lDYJ8HflPJS39FJQ+MUgdsx38WH0bLmeczfsVPVqZJGFkvGqMo4BezaX2yLYHq8/AhFdPmqPhnhVOpVYesRU8FIwcuXmoSSN1tz20tpSNROmn7NWAeX0WcMr4WpcF4eG+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mF7ANZG41NOeCcW0ViemgBipnamMUigTtUgKtlTP+LU=;
 b=zEm6sGIny4LNy2UwaD38FRPDtKK+OfsaimFAwVOZFHIQ3QhQ+2p3OD9slhUHL3KeaWcoc4HquMhGWuzkPqMHrbsdTvWZh1rg6ehg3aW7hixRkSCF/3LdqhPsvq6lq7JgpdleYHCTIYuvzkUUfNSPXI93ejd1R4caxxp+Zz9SSygJ1AvuINK0aTheZJqC4xHFMxT4FvA6jwRuqT65gIHfmsUqXLqJfxGG2K+u64q7XPcLvV6Yz4bxQiYjmEXQwVvpawmZ6qC8M0fEOLhG7FWRdlGFsrEKq2bL4I0CfjTvGbi/kpSUAYXlsWGk1rvJEbeTHK4c1tVLqAi4bvQq6n1ZBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mF7ANZG41NOeCcW0ViemgBipnamMUigTtUgKtlTP+LU=;
 b=MhkDIJ7QBikIb87bSAzCfg92+VzoU90ZMzA9xMmtScg1a+kQ35rLUTqcLEp8Xuzsgb8AuZTloMwLt8F8ik1eRRRFnqQQbVz5RWoTE7GgpctJ46kp9EURaWO3FAiZFsjNXL8JzKimiuU/Lg5/JWpi8Mjh4/ZSpab3AxoO542DQw8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 2/2] automation: add xilinx test (linux argo)
Date: Tue, 22 Oct 2024 19:53:32 -0700
Message-ID: <17124c911858ccb2842598cd9b9b3c88c4d4dd28.1729649076.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <21a6030f352282d822c30de4a1e7ecab9a8c0a99.1729649255.git.victorm.lira@amd.com>
References: <cover.1729649255.git.victorm.lira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|SJ0PR12MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: fc9ee032-614c-4728-7758-08dcf30e0993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGJGTHp6bE84MWpEbkxrRlNxbTVjblZpUnhIQmQ3RDBiL2xndm5QZElselcv?=
 =?utf-8?B?SGNtdGFnSzc0QTQ1ZTNjdzZYWVQxSFlyZmlXRGdncDV0MCtoT2w0czY5Nk93?=
 =?utf-8?B?c25tR2lsdW9FMDhCV0VxK0VuSVQ1bHZSN3BlVmF5YUl6MERjWWZNQ2RUVzRu?=
 =?utf-8?B?NjhHTFpQVXVvVFpJTXRabm9ueW5kanhWejZNRzlOUlFlZnhjWDlLenBsaG9n?=
 =?utf-8?B?SWFzOUV1UFpuazBoTVVwYVFWMkI3YnZZRFBwQXd4QStBVkNrT3AxdFZkYm4w?=
 =?utf-8?B?WlAyU3dxRU5Da1ZEdHJsQkI1ZFJ0Z1BNMjJtRVduRGlKL2I4YTZuQXk4RzNq?=
 =?utf-8?B?MWJRUmEzdXdJOUJkbW1rUUMzNW9weXNSTWNOZWU1TGZ6TmFhbDNJVzVWcXJZ?=
 =?utf-8?B?T2p4Vi9lTi9yZkJpK2ZtK2lzN01nMEg2VUFHa2w2RnR4SGNveWtydUdVRU9v?=
 =?utf-8?B?ZjV5MTVQMXA3UEpQakxRWGxhbFpCMDZYZTFWUmdicHlUV050eExFcGJyUUVj?=
 =?utf-8?B?VGRrMnhJOGpXZDBRSXlwcTlweEM0SXErdVpVeHJ3Z0JvdTRqbTlkYkhESnR5?=
 =?utf-8?B?Uy90cUY0bXJSeWI3ZXZkeEt2anRqekZrQkN5Z2c5KzNMZUpGWmZnOUQ4SVM5?=
 =?utf-8?B?TnB5YzVLWVJqVGtkTmFrTXRzdVB5a0x3Yzd6QWNmNDIrYmNxaGxlWlVJVVJR?=
 =?utf-8?B?Q3JydGNodkVRaEpGSXBsM0xLNVdxcDlObnJJK2psUjlESXl0WlZROHUrRy9a?=
 =?utf-8?B?VWc0VGNjTCt5dnlPck1hbXc2bkdRNnMraWJWUWNtSlFDd0szSTNqY09CR1JS?=
 =?utf-8?B?NkJyZ3B3VHlab29rSCthN3BoOVJFckY4anFuYzVvckw3SGdwRm5aWVlpcEl6?=
 =?utf-8?B?NVVkMm9BamM1SzhqeDRwcWU4a1pCOURFUUlja1NDd2kxbCs1MnR0ZnhjVWto?=
 =?utf-8?B?UVlDNzkwNzBYVjhzZk9BUnNEbE9CZFFyOUM1cmxlWUlmengxS0hQTTNwUEdJ?=
 =?utf-8?B?aHc1ZkprY3RZM1VCV3JucHlxWCt5ZUhxUXIxOFlqVmtkSCtGNCswc1U5RmdL?=
 =?utf-8?B?Skl0d1RTRDc3dnNjbjd4L1EyUnZpVVlUSTBzb1h0Y2g0K1N1VlFMV1RVNzhZ?=
 =?utf-8?B?T01uQ3dvckhweXFWZjVMSHA1QTgvblJZZ3NMaGxRc3AxM0JqOS9PVjQvclM5?=
 =?utf-8?B?cTRQMFRkQSswaWZBNEhoT0hsMVoxR1VnaFhDbzN5S0pFKzNnSU5SSGx1LzRE?=
 =?utf-8?B?YmlKbWNrMUpzSUh4MnJlZ3RMU2piS1EvMk1qS251aTNNcHFUQVZDUnpUUm1r?=
 =?utf-8?B?bHFpV1h6YVhBTzJaMVNyaml3NTRlM3hjRkZlR0QrcXF5TXRhTkxFWWRwdWtU?=
 =?utf-8?B?SmlxaFoxUWd2K0daTXdnZng4TS9yblIxRmFyaWJXdnZkdnd4WDlZQ0crTGEw?=
 =?utf-8?B?ajc2cE9jbnVhRXpqRTEzcERESStDNXRjU3oranJRakdvMENHT2VxWXlNNFhJ?=
 =?utf-8?B?RVdXcGtNY2JET0hQZTJmVEQ5Z1JJMWJmM010em5EK0JiQUpOY09qV2Y5V2dS?=
 =?utf-8?B?UEpHVnFrWWc0V2F6anY4WXZlbk0vVXJUWWM1a1lpV3VsR0ZLK0tpRmlYM2dC?=
 =?utf-8?B?WXhDRTJBOG4vcENqajdZaGFObENiWUZlN2NCRVJ0SFhUTXFoM3M5QTF0VUJY?=
 =?utf-8?B?WS82aFZ1TVk4QnIzdVZRbi8yd3B4VFFiNFFRYkxoNldnTVl1QjB4bXlvaGYv?=
 =?utf-8?B?VlhPTW1JTGIyelZUNSsrUlRObEt6dDhYT0NGVUFUT284bkk3QitMeE1lbGpS?=
 =?utf-8?B?MEhQSGlOUVNTcXpLbnlqOFJITStLOUFqc0Fwem1FMGtBYU9MTGd3OVFadVI4?=
 =?utf-8?B?MnVqbWFjV1pjYTdmaXFEWFA4ZklVS2NFclRJaE82VUd5YWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 02:54:39.3643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9ee032-614c-4728-7758-08dcf30e0993
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8614

From: Victor Lira <victorm.lira@amd.com>

Add x86_64 hardware test that creates a Xen Argo communication
connection between two PVH domains. In the test, dom0 creates a domU and
listens for messages sent by the domU through Argo.

To accomplish this, build Xen with CONFIG_ARGO=y.

Update the xilinx x86_64 test script to support the new test, and add
"sync_console" to command line to avoid an issue with console messages
being lost.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 automation/gitlab-ci/build.yaml               |  6 ++
 automation/gitlab-ci/test.yaml                | 16 ++++
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 76 +++++++++++++------
 3 files changed, 73 insertions(+), 25 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index c2db69ecf8..f425744f8b 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -340,6 +340,12 @@ alpine-3.18-gcc-debug:
   variables:
     CONTAINER: alpine:3.18
     BUILD_QEMU_XEN: y
+    EXTRA_XEN_CONFIG: |
+      CONFIG_EXPERT=y
+      CONFIG_UNSUPPORTED=y
+      CONFIG_ARGO=y

 debian-bookworm-gcc-debug:
   extends: .gcc-x86-64-build-debug
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index b27c2be174..2d4709d393 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -192,6 +192,22 @@ xilinx-smoke-dom0-x86_64-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.18-gcc-debug

+xilinx-smoke-dom0-x86_64-gcc-debug-argo:
+  extends: .xilinx-x86_64
+  script:
+    - ./automation/scripts/xilinx-smoke-dom0-x86_64.sh argo 2>&1 | tee ${LOGFILE}
+  needs:
+    - alpine-3.18-gcc-debug
+    - project: xen-project/people/victormlira/test-artifacts
+      job: x86_64-kernel-linux-6.6.56
+      ref: vml-tests-separate-artifacts
+    - project: xen-project/people/victormlira/test-artifacts
+      job: x86_64-rootfs-alpine-3.18
+      ref: vml-tests-separate-artifacts
+    - project: xen-project/people/victormlira/test-artifacts
+      job: x86_64-argo-linux-6.6.56
+      ref: vml-tests-separate-artifacts
+
 adl-smoke-x86-64-gcc-debug:
   extends: .adl-x86-64
   script:
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 7027f083ba..f70cfdc155 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -9,6 +9,8 @@ fatal() {
     exit 1
 }

+WORKDIR="${PWD}"
+
 # Test parameter defaults.
 TEST="$1"
 PASS_MSG="Test passed: ${TEST}"
@@ -24,9 +26,10 @@ kernel = "/boot/vmlinuz"
 ramdisk = "/boot/initrd-domU"
 extra = "root=/dev/ram0 console=hvc0"
 memory = 512
-vif = [ "bridge=xenbr0", ]
-disk = [ ]
 '
+DOMU_CFG_EXTRA=""
+copy_domU_files () { :; }
+copy_dom0_files () { :; }

 # Select test variant.
 if [ "${TEST}" = "ping" ]; then
@@ -39,6 +42,14 @@ done
 echo \"${DOMU_MSG}\"
 "
     DOM0_CMD="
+brctl addbr xenbr0
+brctl addif xenbr0 eth0
+ifconfig eth0 up
+ifconfig xenbr0 up
+ifconfig xenbr0 192.168.0.1
+# get domU console content into test log
+tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
+xl create /etc/xen/domU.cfg
 set +x
 until grep -q \"${DOMU_MSG}\" /var/log/xen/console/guest-domU.log; do
     sleep 1
@@ -46,6 +57,34 @@ done
 set -x
 echo \"${PASS_MSG}\"
 "
+    DOMU_CFG_EXTRA='
+vif = [ "bridge=xenbr0", ]
+disk = [ ]
+'
+elif [ "${TEST}" = "argo" ]
+then
+    PASS_MSG="TEST: Message from DOMU"
+    XEN_CMD_EXTRA="argo=1,mac-permissive=1"
+    DOMU_CMD="
+insmod /root/xen-argo.ko
+until false
+do
+  echo \"${PASS_MSG}\"
+  sleep 1
+done | argo-exec -p 28333 -d 0 -- /bin/echo
+"
+    DOM0_CMD="
+insmod /root/xen-argo.ko
+xl create /etc/xen/domU.cfg
+argo-exec -l -p 28333 -- /bin/echo
+"
+copy_dom0_files ()
+{
+    cp "${WORKDIR}/binaries/xen-argo.ko" "root/"
+    cp -ar "${WORKDIR}/binaries/lib/"* "usr/local/lib/"
+    cp "${WORKDIR}/binaries/argo-exec" "usr/local/bin/"
+}
+copy_domU_files () { copy_dom0_files; }
 else
     fatal "Unknown test: ${TEST}"
 fi
@@ -54,18 +93,18 @@ fi
 mkdir -p rootfs
 cd rootfs
 tar xzf ../binaries/initrd.tar.gz
-mkdir proc
-mkdir run
-mkdir srv
-mkdir sys
+mkdir proc run srv sys
 rm var/run
 echo "#!/bin/sh
-
+set -x
+export LD_LIBRARY_PATH=/usr/local/lib
+PATH=/usr/local/bin:/usr/local/sbin:\$PATH
 ${DOMU_CMD}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
 echo "rc_verbose=yes" >> etc/rc.conf
 sed -i -e 's/^Welcome/domU \0/' etc/issue
+copy_domU_files
 find . | cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
 cd ..
 rm -rf rootfs
@@ -74,37 +113,24 @@ rm -rf rootfs
 mkdir -p rootfs
 cd rootfs
 tar xzf ../binaries/initrd.tar.gz
-mkdir boot
-mkdir proc
-mkdir run
-mkdir srv
-mkdir sys
+mkdir boot proc run srv sys
 rm var/run
 cp -ar ../binaries/dist/install/* .
 echo "#!/bin/bash
-
+set -x
 export LD_LIBRARY_PATH=/usr/local/lib
 bash /etc/init.d/xencommons start
-
-brctl addbr xenbr0
-brctl addif xenbr0 eth0
-ifconfig eth0 up
-ifconfig xenbr0 up
-ifconfig xenbr0 192.168.0.1
-
-# get domU console content into test log
-tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
-xl create /etc/xen/domU.cfg
 ${DOM0_CMD}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-echo "${DOMU_CFG}" > etc/xen/domU.cfg
+echo "${DOMU_CFG}${DOMU_CFG_EXTRA}" > etc/xen/domU.cfg
 echo "rc_verbose=yes" >> etc/rc.conf
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
 cp ../binaries/bzImage boot/vmlinuz
 cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
+copy_dom0_files
 find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
 cd ..

@@ -116,7 +142,7 @@ cp -f binaries/bzImage ${TFTP}/${TEST_BOARD}/vmlinuz
 cp -f binaries/dom0-rootfs.cpio.gz ${TFTP}/${TEST_BOARD}/initrd-dom0
 echo "
 net_default_server=10.0.6.1
-multiboot2 (tftp)/${TEST_BOARD}/xen ${XEN_CMDLINE}
+multiboot2 (tftp)/${TEST_BOARD}/xen ${XEN_CMDLINE} sync_console
 module2 (tftp)/${TEST_BOARD}/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
 module2 (tftp)/${TEST_BOARD}/initrd-dom0
 boot
--
2.25.1


