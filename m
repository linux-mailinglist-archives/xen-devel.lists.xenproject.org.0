Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3635AE646
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 13:12:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399797.641120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVWVT-0000UR-Ii; Tue, 06 Sep 2022 11:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399797.641120; Tue, 06 Sep 2022 11:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVWVT-0000S1-G4; Tue, 06 Sep 2022 11:12:39 +0000
Received: by outflank-mailman (input) for mailman id 399797;
 Tue, 06 Sep 2022 11:12:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BE3u=ZJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oVWVS-0000Rt-2W
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 11:12:38 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cee82a46-2dd4-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 13:12:36 +0200 (CEST)
Received: from BN0PR04CA0141.namprd04.prod.outlook.com (2603:10b6:408:ed::26)
 by BL0PR12MB5505.namprd12.prod.outlook.com (2603:10b6:208:1ce::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 11:12:32 +0000
Received: from BN8NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::e5) by BN0PR04CA0141.outlook.office365.com
 (2603:10b6:408:ed::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Tue, 6 Sep 2022 11:12:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT097.mail.protection.outlook.com (10.13.176.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 11:12:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 6 Sep
 2022 06:12:31 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 6 Sep
 2022 06:12:31 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 6 Sep 2022 06:12:30 -0500
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
X-Inumbo-ID: cee82a46-2dd4-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MP8dAIYHMz1qG40QR/9itPE8lWxRrza29OrXX7xUZiiydtx4tizVlUs55LqolcK2B2Y6rKx+38o8mAHjFCK4MN5gHwwUIt4wLZ7QCrTPZsCurFtJegbjJ3HXXB4UyadrLs3aZjTv/3ypxS+XqFhhI+RpJnfMkTUec2nyjCI6c+w2Foq4qPZQam42hNL9KFZpy/HRT4LTBN+ucGvx1QYz6GLoTsoBUMZvVmPPa1cBVl/l9Hl77ULu5yktH+SEjm9gmzfbaKgdEpQjyPwK50UqsBk+jk9kEs/IWnn8HcQ6gXgbQYWdI5hr+ntGFUpBASQcaUQB9I1MYer1WL8cIRdrWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYKTdce6Ew412qpvPFGnseQ1fl2n0OwYuljDeeAumP8=;
 b=b8d/vhOC8J28+Iuvlz9UbBScp7AhwFvbLvpQ4nv/TVnfmbuys0IK+Z1b51qqiOtXvb8CsP5Mgww6A6PjbbCS/alBoDwUbb4OU4gR7VH0+iqg7yGd4nzhwP5egHJmHb+4UbVK8+Mfq86NXA8OOQQxZSNq1z+3AiGH6SO/GrRN/5eVbGnhTAg6d1AZMkJNjUPN2VfNwcCVruID+bfxmWCv35jiDT9YUVLREYUesiM9zfxMz8GHByRhNx894Vk0WEnCbdSaFkmJco55sAu8g2VS8J73sQUiKduJXcbTLb9xqviqreCt59QRz+81s+9LnVxLcTVYlVwCISg7IPfAJm+j6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYKTdce6Ew412qpvPFGnseQ1fl2n0OwYuljDeeAumP8=;
 b=xedWu0lAuRoAPxKb0yM6290CZvaNOObBQ0NKBprUfF6FC9i/sZHxJ2CaMymIWYJ+b/0tekk9YeV1MYfs7Ecp+AIxGvx3zpbsVObBDoCIPqp4huU6VS/IwzQLgvN685zqSvSAmDnHrD+diM5b1n+Lho0N+EaS2DJlLLu8T7yBBWI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder] Add support for Xen boot-time cpupools
Date: Tue, 6 Sep 2022 13:12:14 +0200
Message-ID: <20220906111214.26912-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b132ea86-d376-4cf4-844d-08da8ff8b180
X-MS-TrafficTypeDiagnostic: BL0PR12MB5505:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+2M1Cw+hBvXo9Rl+t9CMyvawXxf7cUsHsfBo/tYR6JUq4T8bSF7dVqnGDSiHBzBSMjmewOrTp4m5JXUGmiDOV86jDekJNj1ravzNm5kgNWbUT2B5OqR6KfJxffO0VEgQeGYSFAiK6gfqALFu3eND/70rrOGS8w3NB0bCY2ygjRyzZAs3I8hVoMtkf6lqOVGjGSMUqL9aWMJtVZfrfWLNeOByay3MtpbAY5vO+wOqFCi9dslpWFht2P3ZsNUthpE4ZzRqyYMykEBrus0oGC2UOlaYxVolUvMQakcjnGJ1skrJNLYLut5Uv7mZVjbao8Iw1+Lz0oUFnUQsmKXl/f6sBa9lxL5rnzMaH4CUbpiC0OGsxOsmHMTilkVEjOa1/qjQcxw1c/fIZ2rwhVqVd3sB/C1QqpGultIa2g4uBxStzOMaYJvrYjAnRyL/L5GvSFlW8nRUBKyeeEU0UJXAiCQA+G0rqWHEXDMzCootKlJs4Pq26u22t8j2CaoapVtBoB1tnazLX9/e5Kyyb9RJdXAbZpDtYqEDk51kOJfAEK2qZilFcXpC+FX1xDmwl2LVEOcgr8ZeC2Dw8kN0tvIov83VW/8PsFxWmhnJQ+WCAuhaOX2Uac3vB3yvV6C1BFRV/Bc625XRYsJZUIN2LnTd/PSdBA2449JtSo4D8NEjlYhyn5IT8UQRhiZ+UIKKfLZrSg1jeuCzfJbK+Cl10tXDnWukUwbzqxC3K2OQ8qjd9mrn007PeEJhd2I1lv9XnjJ/OUqyc6/BCCpp0rsYxW7bikA+VHqyeHxqaFB1+Re+i/zVUwo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(376002)(346002)(40470700004)(46966006)(36840700001)(316002)(36860700001)(356005)(81166007)(83380400001)(1076003)(6916009)(2616005)(2906002)(70586007)(82740400003)(8676002)(82310400005)(70206006)(54906003)(4326008)(26005)(5660300002)(426003)(44832011)(40480700001)(47076005)(86362001)(40460700003)(186003)(478600001)(8936002)(41300700001)(6666004)(336012)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 11:12:31.8372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b132ea86-d376-4cf4-844d-08da8ff8b180
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5505

Introduce support for creating boot-time cpupools in the device tree and
assigning them to dom0less domUs. Add the following options:
 - CPUPOOL[number]="cpu1_path,...,cpuN_path scheduler" to specify the
   list of cpus and the scheduler to be used to create cpupool
 - NUM_CPUPOOLS to specify the number of cpupools to create
 - DOMU_CPUPOOL[number]="<id>" to specify the id of the cpupool to
   assign to domU

Example usage:
CPUPOOL[0]="/cpus/cpu@1,/cpus/cpu@2 null"
DOMU_CPUPOOL[0]=0
NUM_CPUPOOLS=1

The above example will create a boot-time cpupool (id=0) with 2 cpus:
cpu@1, cpu@2 and the null scheduler. It will assign the cpupool with
id=0 to domU0.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 README.md                | 10 +++++
 scripts/uboot-script-gen | 80 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/README.md b/README.md
index bd9dac924b44..44abb2193142 100644
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
 
+- CPUPOOL[number]="cpu1_path,...,cpuN_path scheduler"
+  specifies the list of cpus (separated by commas) and the scheduler to be
+  used to create boot-time cpupool. If no scheduler is set, the Xen default
+  one will be used.
+
+- NUM_CPUPOOLS specifies the number of boot-time cpupools to create.
+
 Then you can invoke uboot-script-gen as follows:
 
 ```
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 18c0ce10afb4..2e1c80a92ce1 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -176,6 +176,81 @@ function add_device_tree_static_mem()
     dt_set "$path" "xen,static-mem" "hex" "${cells[*]}"
 }
 
+function add_device_tree_cpupools()
+{
+    local num=$1
+    local phandle_next="0xfffffff"
+    local cpus
+    local scheduler
+    local cpu_list
+    local phandle
+    local cpu_phandles
+    local i
+    local j
+
+    i=0
+    while test $i -lt $num
+    do
+        cpus=$(echo ${CPUPOOL[$i]} | awk '{print $1}')
+        scheduler=$(echo ${CPUPOOL[$i]} | awk '{print $NF}')
+        cpu_phandles=
+
+        for cpu in ${cpus//,/ }
+        do
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
+                phandle=$(printf "0x%x" $phandle_next)
+                phandle_next=$(( $phandle_next -1 ))
+            fi
+
+            dt_set "$cpu" "phandle" "hex" "$phandle"
+            cpu_phandles="$cpu_phandles $phandle"
+            cpu_list="$cpu_list $cpu"
+        done
+
+        # create cpupool node
+        phandle="$(printf "0x%x" $phandle_next)"
+        phandle_next=$(( $phandle_next -1 ))
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
@@ -252,6 +327,11 @@ function xen_device_tree_editing()
         fi
         i=$(( $i + 1 ))
     done
+
+    if test "$NUM_CPUPOOLS" && test "$NUM_CPUPOOLS" -gt 0
+    then
+        add_device_tree_cpupools "$NUM_CPUPOOLS"
+    fi
 }
 
 function linux_device_tree_editing()
-- 
2.25.1


