Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CAA5B0285
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 13:09:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401273.643103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsw8-0007jU-Gr; Wed, 07 Sep 2022 11:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401273.643103; Wed, 07 Sep 2022 11:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsw8-0007hG-CL; Wed, 07 Sep 2022 11:09:40 +0000
Received: by outflank-mailman (input) for mailman id 401273;
 Wed, 07 Sep 2022 11:09:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiom=ZK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oVsw6-0006sS-9A
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 11:09:38 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ebea0e9-2e9d-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 13:09:36 +0200 (CEST)
Received: from BN9PR03CA0696.namprd03.prod.outlook.com (2603:10b6:408:ef::11)
 by SA1PR12MB7040.namprd12.prod.outlook.com (2603:10b6:806:24f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Wed, 7 Sep
 2022 11:09:33 +0000
Received: from BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::9b) by BN9PR03CA0696.outlook.office365.com
 (2603:10b6:408:ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Wed, 7 Sep 2022 11:09:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT081.mail.protection.outlook.com (10.13.177.233) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 11:09:32 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 06:09:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 04:09:10 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Wed, 7 Sep 2022 06:09:09 -0500
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
X-Inumbo-ID: 8ebea0e9-2e9d-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyizDEj4QX0RgRefJMzJqbSM3X0sbqKCSEsHy/VXq6L95MpnAdRog/Nn4bXx+wJMa14GbZf9+m6EmdxgwB6Zd0Eo8Os63XWTngBNvlhfsrnrnXVc0pKnox3YxG7e3fqZM4u0AunbHvcJf6JeOdgFc+ULZL8EKnazJTYyp/zR3DcfYIbzd1+RFE/N0o4BUTrriGyftCR//UmerfL9MhpDRvg/WmzWBc2CK9RDdutcdpqd7EiQ/u3KHP/wrhUIjBZB/Eo7KBeD+vTmCYHpEXBHJHNthIXsA8KXrpe0VKXdErOgPwfO7Pwsi4qw5YvgDpSVXMKQ7mJXTDg035nVwMURKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJW3qR7odDPSqUonwDmetw28GI7gbKhgJQOD46P0QTw=;
 b=GF8gp7EbyYkNOXRe4ZLweSwco53Y0xjOsDBlF0HN6lIb/3EAOQuosArWOoyGSRX1KL+4QKnWhN6vw4DNyOZOEglOs2hj6aydKALon+pATb04gwGrYxg2VuaBP3Pb2lEeTbm23seMRjNfjSMUkIc3Fj3Za12Uc/QIURfTw2pEt8KUC40H59BPcoTIUddq0gOtYPnc3Q9SFzCMIUTw2lLizMPnOSAi0yJHB5gTRMU/OPU/7GvKD8FJYNSBqFIrGQvJyQDJmqAVgYZ9O5ffNu6Rj5ZQK1JYhhFc6YVfmYhG1dLNmUSXMWoicdHRxn7B3Sjr0rNODIUkIuOwCuIyCLxUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJW3qR7odDPSqUonwDmetw28GI7gbKhgJQOD46P0QTw=;
 b=mp3Acd6uIUMMvkxnddZwS2ud2Kl1IfiNHLyveIN/T18zQKQXyVmh6YIGr4WLmGIgxR55O1WTitZpOjMYmgovPrRmfbiaIFHn/nA5NINfIN9G3OrZQgNugUT0bpsw/a9Uyl4yXeac2QCbqYoekFF9PoHcxPIRAMH5+klbcnqpkwM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder v2 2/2] Add support for Xen boot-time cpupools
Date: Wed, 7 Sep 2022 13:08:52 +0200
Message-ID: <20220907110852.5673-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220907110852.5673-1-michal.orzel@amd.com>
References: <20220907110852.5673-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT081:EE_|SA1PR12MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d8cd43-63b3-426c-bcc5-08da90c17139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lCcG+R+O36ApvBBnsntxzwPqfzo3YU2fk+w4gwDV948Rd1hU6HPACkvz97fI1hbWJD8Q8TlUJxcGY4KHvNTQpbDh2V+2RE33vqhGttJ/42eI/4TKW0aGMlBmc57hMwOaLXZH9kvPgpzy5ImQAXYb+oBcVbR2thWJ/e4zT3u1qvzuaoYac1i+vG+WbbM41lKntx8qniXYpLt8FX++VGKZrXV8Js4aPEnvuHyGR2hqmJKVn1qaWp0VpQ4Zbc0PqHFSvnRZWs6ZEhW3bNj7IAMKi62Moy7lre1CVMxpkwAcscoJZcRNlX0hDE3hoXdtZl27p8dyR49z8+ci8aUtixwnLmie3WvR0PzbN8Nos4XvgtUJFt1aW0Krnk0q0F3t5rtMMA6W+u+k0l6MWBi2oaUZ05TGZ5S331VqRBUp7mtQu5tSrU8MVnAXseKQcSvek0tF17rtAJa+aKBWishmTxXTC8uZkJujQ4bIK8fzxzmtN1kJtk4wVOPemhcvhTJpxrSXSSgU1lE2rRkXnGpEy1yggtiHvXZPVW1KAR9tNX48rRfV+PhXeSxSGyT2t1V6VoNE6A30T/7woJHRSysJM094l0Mbfek3h23iQwpLep14SbIzGAbLqs0ud7py7a6vOL5uxuPdAn/SIFnVDHaDuLnpb6JF0O9tAtdnS4aQ/r3EQ0bwlUQEZSj8T8xMCb8kMs8/VKCiImFLNs5Q6LlsTlziykZCweaJF0J50GqnHdUA9ovmmS/jtPHohSi9V0MGgaoK2583rpsyKNpNHB0LJFBCC2Cvjr0FkfCEFBl+Q16WZPs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(136003)(376002)(46966006)(40470700004)(36840700001)(70586007)(8936002)(316002)(26005)(40480700001)(2906002)(5660300002)(82310400005)(41300700001)(36860700001)(478600001)(40460700003)(54906003)(426003)(4326008)(336012)(44832011)(6916009)(86362001)(82740400003)(2616005)(186003)(70206006)(36756003)(81166007)(356005)(6666004)(83380400001)(1076003)(8676002)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 11:09:32.8262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d8cd43-63b3-426c-bcc5-08da90c17139
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7040

Introduce support for creating boot-time cpupools in the device tree and
assigning them to dom0less domUs. Add the following options:
 - CPUPOOL[number]="cpu@1,...,cpu@N scheduler" to specify the
   list of cpus' node names and the scheduler to be used to create cpupool
 - NUM_CPUPOOLS to specify the number of cpupools to create
 - DOMU_CPUPOOL[number]="<id>" to specify the id of the cpupool to
   assign to domU

Example usage:
CPUPOOL[0]="cpu@1,cpu@2 null"
DOMU_CPUPOOL[0]=0
NUM_CPUPOOLS=1

The above example will create a boot-time cpupool (id=0) with 2 cpus:
cpu@1, cpu@2 and the null scheduler. It will assign the cpupool with
id=0 to domU0.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
- make use of get_next_phandle
- pass cpus' node names instead of paths to CPUPOOL
- do not pass NUM_CPUPOOLS as an argument to add_device_tree_cpupools
---
 README.md                | 10 +++++
 scripts/uboot-script-gen | 79 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/README.md b/README.md
index bd9dac924b44..041818349954 100644
--- a/README.md
+++ b/README.md
@@ -181,6 +181,9 @@ Where:
   present. If set to 1, the VM can use PV drivers. Older Linux kernels
   might break.
 
+- DOMU_CPUPOOL[number] specifies the id of the cpupool (created using
+  CPUPOOL[number] option, where number == id) that will be assigned to domU.
+
 - LINUX is optional but specifies the Linux kernel for when Xen is NOT
   used.  To enable this set any LINUX\_\* variables and do NOT set the
   XEN variable.
@@ -223,6 +226,13 @@ Where:
   include the public key in.  This can only be used with
   FIT_ENC_KEY_DIR.  See the -u option below for more information.
 
+- CPUPOOL[number]="cpu@1,...,cpu@N scheduler"
+  specifies the list of cpus' node names (separated by commas) and the scheduler
+  to be used to create boot-time cpupool. If no scheduler is set, the Xen
+  default one will be used.
+
+- NUM_CPUPOOLS specifies the number of boot-time cpupools to create.
+
 Then you can invoke uboot-script-gen as follows:
 
 ```
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 18c0ce10afb4..1f8ab5ffd193 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -176,6 +176,80 @@ function add_device_tree_static_mem()
     dt_set "$path" "xen,static-mem" "hex" "${cells[*]}"
 }
 
+function add_device_tree_cpupools()
+{
+    local cpu
+    local cpus
+    local scheduler
+    local cpu_list
+    local phandle
+    local cpu_phandles
+    local i
+    local j
+
+    i=0
+    while test $i -lt $NUM_CPUPOOLS
+    do
+        cpus=$(echo ${CPUPOOL[$i]} | awk '{print $1}')
+        scheduler=$(echo ${CPUPOOL[$i]} | awk '{print $NF}')
+        cpu_phandles=
+
+        for cpu in ${cpus//,/ }
+        do
+            cpu="/cpus/$cpu"
+
+            # check if cpu exists
+            if ! fdtget "${DEVICE_TREE}" "$cpu" "reg" &> /dev/null
+            then
+                echo "$cpu does not exist"
+                cleanup_and_return_err
+            fi
+
+            # check if cpu is already assigned
+            if [[ "$cpu_list" == *"$cpu"* ]]
+            then
+                echo "$cpu already assigned to another cpupool"
+                cleanup_and_return_err
+            fi
+
+            # set phandle for a cpu if there is none
+            if ! phandle=$(fdtget -t x "${DEVICE_TREE}" "$cpu" "phandle" 2> /dev/null)
+            then
+                get_next_phandle phandle
+            fi
+
+            dt_set "$cpu" "phandle" "hex" "$phandle"
+            cpu_phandles="$cpu_phandles $phandle"
+            cpu_list="$cpu_list $cpu"
+        done
+
+        # create cpupool node
+        get_next_phandle phandle
+        dt_mknode "/chosen" "cpupool_$i"
+        dt_set "/chosen/cpupool_$i" "phandle" "hex" "$phandle"
+        dt_set "/chosen/cpupool_$i" "compatible" "str" "xen,cpupool"
+        dt_set "/chosen/cpupool_$i" "cpupool-cpus" "hex" "$cpu_phandles"
+
+        if test "$scheduler" != "$cpus"
+        then
+            dt_set "/chosen/cpupool_$i" "cpupool-sched" "str" "$scheduler"
+        fi
+
+        j=0
+        while test $j -lt $NUM_DOMUS
+        do
+            # assign cpupool to domU
+            if test "${DOMU_CPUPOOL[$j]}" -eq "$i"
+            then
+                dt_set "/chosen/domU$j" "domain-cpupool" "hex" "$phandle"
+            fi
+            j=$(( $j + 1 ))
+        done
+
+        i=$(( $i + 1 ))
+    done
+}
+
 function xen_device_tree_editing()
 {
     dt_set "/chosen" "#address-cells" "hex" "0x2"
@@ -252,6 +326,11 @@ function xen_device_tree_editing()
         fi
         i=$(( $i + 1 ))
     done
+
+    if test "$NUM_CPUPOOLS" && test "$NUM_CPUPOOLS" -gt 0
+    then
+        add_device_tree_cpupools
+    fi
 }
 
 function linux_device_tree_editing()
-- 
2.25.1


