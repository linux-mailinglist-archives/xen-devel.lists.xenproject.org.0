Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C573663BEF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:55:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474467.735723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAPY-0003EY-NU; Tue, 10 Jan 2023 08:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474467.735723; Tue, 10 Jan 2023 08:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAPY-0003AT-Jl; Tue, 10 Jan 2023 08:55:12 +0000
Received: by outflank-mailman (input) for mailman id 474467;
 Tue, 10 Jan 2023 08:55:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K1Mu=5H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFAP6-0005s6-5Q
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:54:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2083.outbound.protection.outlook.com [40.107.7.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c11ee8f-90c4-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 09:54:42 +0100 (CET)
Received: from DB6PR0402CA0024.eurprd04.prod.outlook.com (2603:10a6:4:91::34)
 by AM7PR08MB5350.eurprd08.prod.outlook.com (2603:10a6:20b:101::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:38 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::7e) by DB6PR0402CA0024.outlook.office365.com
 (2603:10a6:4:91::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:38 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132");
 Tue, 10 Jan 2023 08:54:38 +0000
Received: from 046c96facb57.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 28559E46-02F6-4DE6-8E01-5DBAA055C8FF.1; 
 Tue, 10 Jan 2023 08:54:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 046c96facb57.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:54:29 +0000
Received: from FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::20)
 by DBAPR08MB5671.eurprd08.prod.outlook.com (2603:10a6:10:1a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:27 +0000
Received: from VI1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:48:cafe::ae) by FR0P281CA0052.outlook.office365.com
 (2603:10a6:d10:48::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.11 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:27 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT047.mail.protection.outlook.com (100.127.144.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:27 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:54:25 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:23 +0000
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
X-Inumbo-ID: 6c11ee8f-90c4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFycWCyr9eafMdsIRMXDpPfZgceLANbgQsKdH29zQUg=;
 b=FUgjPEH3SDw0CgNr7/SQou9XAWOj4pzs2LG6xfK7CTKzT+fl9NmbGQ2WAvdWJDAdd/UWS9wwkup5u8/3AUI2eWytTN4kXUJN69bmq/J4+GeyMXIKdG04QsrS3dZJBQrPXAUWpFmMvrTlGoifsmdjtpxbld8UT5fegDKGHD3Wdh8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8325e71c2a7c0b30
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlmSe6nJSBejfbUbmXXV7b0fPyc1BbokKF+EBW8tapVmuweOXelR7KLstQ3g8Y5PpR/HR0FnJXbPEWqUaKjDQ6+P+S4hcCjcdGRYWtUxrnlaQG1p+Ftq8KveKUOLY1VlISXdAi9LaGvS53CgT1Hm/6PscyYl5XAx8RdkgqSNdIbvhAwSrhl1ryyL5hoavca3qoF5TobrhtyQg0X4ncWrytQIJab4vhOXCPRYuEbQQVRa7IinOM+9yIqE58FQIA9ZNjgBqed8g9HW3N7KGjvUewco1A95twxwAy7EtzOE9vDJvPMvfMp4+ehtJMlwfK3JqomfZvf6RHDZjerDKSdvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFycWCyr9eafMdsIRMXDpPfZgceLANbgQsKdH29zQUg=;
 b=IeSbP0rIOSno/G6f4Qp2LgoGkCZC49cfkV4eUVi5WoxPHaYApMCrdjZzh6mSGWTM4hBS3I/Uv1/LDM6ULoBE7Q+zjDSePxMfaB13AiFaODMdsEv7VghGVIB9WUHIG77o/PPLb1qNuBpj5L335rJVSZcpiDYSNydf0MwIL1+kP+Hqvn9Y+A/zQVPqRYLmayQrHoo8pxjhGpont7mPoOnfnXfekSTdLtfs6cJIS1yE7opdJPwb5fo6KB/HtVTUUM+aSF7M2Qx3XFYey5giisGDW61CX3rdzb1PqrgCxDmva0PdROvAoKQ9LEd/M+tFKbVKU6rNzhtBPE/SjcdUhy+JEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFycWCyr9eafMdsIRMXDpPfZgceLANbgQsKdH29zQUg=;
 b=FUgjPEH3SDw0CgNr7/SQou9XAWOj4pzs2LG6xfK7CTKzT+fl9NmbGQ2WAvdWJDAdd/UWS9wwkup5u8/3AUI2eWytTN4kXUJN69bmq/J4+GeyMXIKdG04QsrS3dZJBQrPXAUWpFmMvrTlGoifsmdjtpxbld8UT5fegDKGHD3Wdh8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Henry Wang <Henry.Wang@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 15/17] xen/arm: Set correct per-cpu cpu_core_mask
Date: Tue, 10 Jan 2023 16:49:28 +0800
Message-ID: <20230110084930.1095203-16-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230110084930.1095203-1-wei.chen@arm.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT047:EE_|DBAPR08MB5671:EE_|DBAEUR03FT057:EE_|AM7PR08MB5350:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f7d896-3a2e-4a1b-a068-08daf2e84e16
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1nVaoo9E+GFvT+cClWsW/NG/w3IzVI+3KObds7Prvv0MZgL3umrok29TqA/gqKByCXR7gsQOZSP85XS5mPn1DKM7qYyWQalFFc6miKFk0Ok/WSXu1GNDvZfdJAEDl7wdS/b3AMB2n6smdTJ8IAomyMO5PDmypf5SMN+0kOP0GeBXd2s+A/WzH4IDhfScDyNSCzzNvvpuyuqrFIf9h6fU4hC2D0d0IO1huIE2Wz+Zc7HoUk6LfUbxlR+hwi/TGbzCGgVBqYQIygKav9jC6HmH1OvpqrpVsev6RdvffLb2r5vdM9oi6YzXfcQxRRZjzJT+5D7N4/9VhdV4E08k0ZXGrsyBkmn8CtNNFsVvScCtalPfHNP3fTW/INL9B4xOZs1WAo3mz2KM/ng76ndQfal0V72PuWyodnn/+ys8+Z0FeD0ZejLEuIAzbqlsBjyqgCJiRY8MAcbB1JuAEgtN4A0Arqwun3/4RhqVcHa7/PCs8M1h4MpGG67qPev9q2DlmplBRHZZVm7qDLA63ng/2bhukBd3n7HWmmSJeO0pf3s71EM81+1tncuYmiq1s3nXgkFWDFPVWGgDxOaWMdbqeBHn6EIUAXhWxo5NdNcQ9VhwRLft19grdmi8iSrir9ELGuE8G0q/KlodOkZ+RVDUUll8wb11+ln9DU/bo412ip0g4KrlkZptPGDeISw8OlW+5c18egnVfp9/h9mXTWTR6OX4Zw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199015)(46966006)(36840700001)(83380400001)(40480700001)(47076005)(44832011)(426003)(82310400005)(36860700001)(5660300002)(336012)(2616005)(356005)(2906002)(81166007)(54906003)(86362001)(8936002)(1076003)(6916009)(316002)(8676002)(36756003)(186003)(4326008)(478600001)(41300700001)(7696005)(70586007)(82740400003)(70206006)(26005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5671
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2dce9913-8214-4290-eb64-08daf2e847ba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CEB9qhTi6/UWTS54LBvP+c+c/wgi2X12rvajZwqx0nJSbg6b6nWaHG0N43VAohOvXNSkpysg1OAwGB4LjLfz8U6wmYL3eNvVZzwgz3DNwK8ChHBFrC8p60RiWCHkmI8IxqOG4yqgplhY+vwRf07onIdkJdCuNL1gopPlhC5igNk1QWwKGmOYRp9axNix5gzXu2VIv7FfeYHyEE7UjvdnW1nEh7zOiNSAvG8c3fGYyw+Uqf8UKZETFDgzZWnrItsrvbCdDhYlgUPHIjZaOLDQqbIA8CoiX1sgh/QJ9vth/j0jGCXMmePdCcMLd1IsItEYBGstwSiLmJBup+XqL+mX22Je8bj9yWU6yYMV3QtMNdjuo2+sHDx6rpChSic9aW2ccuzkj6g7ZK5uhgbIoNWPxXaseah2qVPPa6DpyDXJsPx7Bh3i3etEK8mL6kd6IO3HoR1rACm2yko7SCy4K7LKIU8ZIrF+GcQYtSZo483OoSHI5EyKIk7D/WEus5UQdCrKRKMbT099DKhEEyuhPHuU9pWScDMEC9GD+By7XvsLiNiq0vG3SZLIQTC3yYsVtEKLutqDhkjzlOBrFGaQoSNKzNXSd478TkjfP6lk1VLj95UxPAaLh1vmeYjYj66if39mOgwqpyCD5cXRabssu61IdR1lMA07A50DVVIKBKoHXwDQlSXz/zkYJgaG6MDh4OK/yqtnjceXVizEJ8zjPWE0Tw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(44832011)(2906002)(5660300002)(36860700001)(7696005)(41300700001)(8936002)(36756003)(70206006)(83380400001)(70586007)(4326008)(8676002)(316002)(47076005)(86362001)(2616005)(336012)(82310400005)(426003)(40460700003)(1076003)(81166007)(478600001)(186003)(40480700001)(26005)(6916009)(54906003)(107886003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:54:38.2786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f7d896-3a2e-4a1b-a068-08daf2e84e16
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5350

From: Henry Wang <Henry.Wang@arm.com>

In the common sysctl command XEN_SYSCTL_physinfo, the cores_per_socket
is calculated based on the cpu_core_mask of CPU0. Currently on Arm
this is a fixed value 1 (can be checked via xl info), which is not
correct. This is because during the Arm cpu online process,
set_cpu_sibling_map() only sets the per-cpu cpu_core_mask for itself.

cores_per_socket refers to the number of cores that belong to the same
socket (NUMA node). Therefore, this commit introduces a helper function
numa_set_cpu_core_mask(cpu), which sets the per-cpu cpu_core_mask to
the cpus in the same NUMA node as cpu. Calling this function at the
boot time can ensure the correct cpu_core_mask, leading to the correct
cores_per_socket to be returned by XEN_SYSCTL_physinfo.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v1 -> v2:
1. New patch

---
 xen/arch/arm/include/asm/numa.h |  7 +++++++
 xen/arch/arm/numa.c             | 11 +++++++++++
 xen/arch/arm/setup.c            |  5 +++++
 3 files changed, 23 insertions(+)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index a0b8d7a11c..e66fb0a11f 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -46,6 +46,7 @@ extern void numa_set_distance(nodeid_t from, nodeid_t to,
 extern void numa_detect_cpu_node(unsigned int cpu);
 extern int numa_device_tree_init(const void *fdt);
 extern void numa_init(void);
+extern void numa_set_cpu_core_mask(int cpu);
 
 /*
  * Device tree NUMA doesn't have architecural node id.
@@ -62,6 +63,12 @@ static inline unsigned int numa_node_to_arch_nid(nodeid_t n)
 #define cpu_to_node(cpu) 0
 #define node_to_cpumask(node)   (cpu_online_map)
 
+static inline void numa_set_cpu_core_mask(int cpu)
+{
+    cpumask_or(per_cpu(cpu_core_mask, cpu),
+               per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+}
+
 /*
  * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
  * is required because the dummy helpers are using it.
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index e9081d45ce..ef245e39a8 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -52,6 +52,17 @@ int __init arch_numa_setup(const char *opt)
     return -EINVAL;
 }
 
+void numa_set_cpu_core_mask(int cpu)
+{
+    nodeid_t node = cpu_to_node[cpu];
+
+    if ( node == NUMA_NO_NODE )
+        node = 0;
+
+    cpumask_or(per_cpu(cpu_core_mask, cpu),
+               per_cpu(cpu_core_mask, cpu), &node_to_cpumask(node));
+}
+
 void __init numa_set_distance(nodeid_t from, nodeid_t to,
                               unsigned int distance)
 {
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 4cdc7e2edb..d45becedee 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1136,6 +1136,11 @@ void __init start_xen(unsigned long boot_phys_offset,
     }
 
     printk("Brought up %ld CPUs\n", (long)num_online_cpus());
+
+    /* Set per-cpu cpu_core_mask to cpus that belongs to the same NUMA node. */
+    for_each_online_cpu ( i )
+        numa_set_cpu_core_mask(i);
+
     /* TODO: smp_cpus_done(); */
 
     /* This should be done in a vpmu driver but we do not have one yet. */
-- 
2.25.1


