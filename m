Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66104452B01
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 07:33:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226078.390613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms19-0002q6-Pe; Tue, 16 Nov 2021 06:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226078.390613; Tue, 16 Nov 2021 06:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms19-0002mf-LH; Tue, 16 Nov 2021 06:32:31 +0000
Received: by outflank-mailman (input) for mailman id 226078;
 Tue, 16 Nov 2021 06:32:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dk95=QD=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mms17-0001yg-CV
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 06:32:29 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe06::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7d418b7-46a6-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 07:32:28 +0100 (CET)
Received: from DB6PR07CA0010.eurprd07.prod.outlook.com (2603:10a6:6:2d::20) by
 DBAPR08MB5591.eurprd08.prod.outlook.com (2603:10a6:10:1ae::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.16; Tue, 16 Nov 2021 06:32:25 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::b7) by DB6PR07CA0010.outlook.office365.com
 (2603:10a6:6:2d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.17 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Tue, 16 Nov 2021 06:32:25 +0000
Received: ("Tessian outbound de6049708a0a:v110");
 Tue, 16 Nov 2021 06:32:25 +0000
Received: from ddebec59dc0d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 30344C3B-6828-4C08-B442-E2019DF20579.1; 
 Tue, 16 Nov 2021 06:32:19 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ddebec59dc0d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Nov 2021 06:32:19 +0000
Received: from DB7PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:10:52::30)
 by PAXPR08MB7188.eurprd08.prod.outlook.com (2603:10a6:102:20a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 06:32:17 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::1d) by DB7PR02CA0017.outlook.office365.com
 (2603:10a6:10:52::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:17 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Tue, 16 Nov 2021 06:32:17 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 06:32:16 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:14 +0000
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
X-Inumbo-ID: f7d418b7-46a6-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkcqqN5Zem+x6JLUp8DfQrKdm7HXvI0sldsfin8E4B4=;
 b=18zcGAxCz7QN0h0xTgYnRl/v21J6iKgZHCTVIbPaWuMXc6YF61uDVj88czyBEUdCO6xgvKFAGNLbABK/imlizugkuM+etumaPCmW0qdUM/u58PDtIWuNeBhPQaVBaMFkS8lllzW2pNkzadLwoh7Unudn2aoZv3zoQWQOB84JlZE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 80ca79f1eb9fea95
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hH1cK7fW0KjoBc0bZgXW0DwsBXstKolDTKjrDMjWbntQ1PcSwL9E+UxdZq5Zp+M4+AG5AZvZ2VLiW1SPZW8TqyFBAHIpbU8B9wK9usyshGeC9LcXCgs8wURFd8cqW+JGF9YvLlvK/MhQn0ATyHr1xplc13ug6ZKRFpi+N/9GRqD+GFaUqKt+RgD85Hf/kVTkI0P660tDes/4doy/219Vih6Esau+z6/UQFKhJyeEBgMeyALsaTT0gPHwklJw/6d9yLuLubg+KLzzpwUZjiDQPBTyc1AJISWX+hLs05sCWZRLXsIqMYNWEITSMDfP2nkvQx8aLhc9/6+gNFDm5fIH9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkcqqN5Zem+x6JLUp8DfQrKdm7HXvI0sldsfin8E4B4=;
 b=PjT27tU2DJiFzqNvdWLZFbB6cS5MSSl1QcisC2EEJV5o7sEz8LeyWY5ilZ6mjvDVYoVNfw94fwJyXNFJicAmlT34IeanB/0hS+rItWmp9wQmww2Jt0m0dPyffgZYfeEeiFuAZ8TtSTM20nvznlr3HjCPBegxnQWTYRUnlU6A6vAkwAGyzlh5a03CMT79aL2hK1tVSnGQTpZ5w/yHBobRn45zga7A+N/QTByYelbUybwM1hFksc1W2jAOAQM8evI/SEcrF9qQY7hr6f1RliqcIaYOwL9UE71WJvHFxUJtEptwHE1fyosrQA5fAjgli/Iei+/itnj6NOHy7/owhowvsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkcqqN5Zem+x6JLUp8DfQrKdm7HXvI0sldsfin8E4B4=;
 b=18zcGAxCz7QN0h0xTgYnRl/v21J6iKgZHCTVIbPaWuMXc6YF61uDVj88czyBEUdCO6xgvKFAGNLbABK/imlizugkuM+etumaPCmW0qdUM/u58PDtIWuNeBhPQaVBaMFkS8lllzW2pNkzadLwoh7Unudn2aoZv3zoQWQOB84JlZE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH v3 04/10] xen/arm: introduce direct-map for domUs
Date: Tue, 16 Nov 2021 06:31:49 +0000
Message-ID: <20211116063155.901183-5-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116063155.901183-1-penny.zheng@arm.com>
References: <20211116063155.901183-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7dd38a2-86f6-4ae0-6908-08d9a8cadaa5
X-MS-TrafficTypeDiagnostic: PAXPR08MB7188:|DBAPR08MB5591:
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5591D7B637F2F09EEDF95E61F7999@DBAPR08MB5591.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:628;OLM:628;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IQfjE8X1RLCbFk27gAvCwD6Yi/P7DnTQT0/3c+kBTmHvGtr7N4fgzdjnhSN9rXR/sOFIhPTGGt/iEmJJ3lgUw/D35R6Perhrj6I/i2MqaQK+XgfTisiNRtR1bp8Fh/1v0c5QjF5n9bdo50sw6pYEBSXmBCgTahmHErRn/T9EkfQpZYw4jOVJBDLXeEME9yFzKAckklL9dy6X3+cw1lxo1HtkFGbWHIpditZC8gt/VWD4nA5CxJC5Horgbx7S/GhRkEWC3YTRTKL4an/ABvVOsqlVX5ZlQcK4YTHgm9+uWDRFd2P1nTg0NwYlx7aCNv8c3uQx2iDJdVsl38SKVXeY8hCds/0dCurhgEVMXhqQe/xutTfCWE7QHDWvPN9pBiJT1kzudy3sB1u2a1KrSkkBEjeLTRFOnt94VsTT55tGOzJxOlfusBm9jkSQahvHjxS8ouf73KKBGty/+VaKiYovgAcS6JDuWwmkD5ED5MNMxXMLBE0yBBZ9uNCVf7ShtoyWBN8FJh6wQTLUxxx3Jw5Ng8kA4mmSuDoKdZa+VMFPy61MLSen+yFgwn5TVbEyQq62uHh7mMlwQYRn5p8gaJFf5wpazHH6gLdOvZIo0KkQEuwPlDTLeaSKyyUVaJDo9G0MJe2S+8foo+ukGCchDMXtkp54Kt3I8GYl3RcTFrSEyDYFOIKzTFYwT3GN+khfmSzfVls1UyADMEIKeyGPRDn+PJA8xgMddMuUqAk9Yz0y8ys=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36756003)(70206006)(70586007)(82310400003)(54906003)(508600001)(4326008)(47076005)(186003)(1076003)(44832011)(426003)(36860700001)(86362001)(6666004)(8936002)(26005)(336012)(110136005)(316002)(2906002)(83380400001)(7696005)(8676002)(356005)(2616005)(5660300002)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7188
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3d245f33-05e2-493f-b64f-08d9a8cad5c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JFyLRJuvv+WX+sTbrKW+Ipe5YNrez6D6gBC3mZpykl4eTfzjgSyWxUEYLzacIgNKkl5VO0+POnaVPKnDKhTWqWovRjrGYZAL4+iCoSoX83gSQQ19hvo3YuxPuugxWRPZThgujpxCepDD7ksLPat7kd60HTTxAzq0GlrsWpESZGCDmOYthxYAxxpV6Xw5vgL05G+TKqlIY+BSozLq7xWoVXsCnZ5EXXurIZTKgYGwfMSqELkmPjjrq8BdBoeZyenCYxd2uuzfPiGr5dY0XpJq3l9G8jP+uiXQRrqfGuuRqn5IJ0OrtFtKNONL3IxCR3NacvEkEHqQ8CE9QsJWSWqf8VOusFzHf1LBIO+grjMh1b19R/5x1nFc1Iq84C6GsIXPK8GfcA3ssgsAHTLLEI3icJkMZg1l651TuSMmbIaIexP58hu6ftzgga/qIxR1rgt4SvcH4O5xlWPFmKE6PniH4/aShf6cg1RWRTt4kLXIqlWV/rrFBJR54s3a2TDwioJFbRd98XGlHrkem1sRMncYaFn5usfFOF2JABl8o6/YUz4lc/2/rysczIeh8Upm3GJILqltyHU9F6xvSLmfwEyXpACIMC+qn0VaO4wixzaREMVVCaDQ4z6FVQirIqvts+Za2agXwjeNMILdWtNJfSvURAM+JzIKFBaTem3Tz0zdYEnTgEl07aLByACO0DTounyVg5NxdvKeW8YH/BCVYpHlCQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(336012)(86362001)(7696005)(4326008)(1076003)(70206006)(26005)(426003)(47076005)(70586007)(8676002)(81166007)(2616005)(5660300002)(316002)(44832011)(508600001)(186003)(6666004)(110136005)(8936002)(36860700001)(54906003)(36756003)(2906002)(82310400003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 06:32:25.4689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dd38a2-86f6-4ae0-6908-08d9a8cadaa5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5591

Cases where domU needs direct-map memory map:
  * IOMMU not present in the system.
  * IOMMU disabled if it doesn't cover a specific device and all the guests
are trusted. Thinking a mixed scenario, where a few devices with IOMMU and
a few without, then guest DMA security still could not be totally guaranteed.
So users may want to disable the IOMMU, to at least gain some performance
improvement from IOMMU disabled.
  * IOMMU disabled as a workaround when it doesn't have enough bandwidth.
To be specific, in a few extreme situation, when multiple devices do DMA
concurrently, these requests may exceed IOMMU's transmission capacity.
  * IOMMU disabled when it adds too much latency on DMA. For example,
TLB may be missing in some IOMMU hardware, which may bring latency in DMA
progress, so users may want to disable it in some realtime scenario.
  * Guest OS relies on the host memory layout

This commit introduces a new helper allocate_static_memory_11 to allocate
static memory as guest RAM for direct-map domain.

For now, direct-map is only available when statically allocated memory is
used for the domain, that is, "xen,static-mem" must be also defined in the
domain configuration.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
v2 changes:
- split the common codes into two helpers: parse_static_mem_prop and
acquire_static_memory_bank to deduce complexity.
- introduce a new helper allocate_static_memory_11 for allocating static
memory for direct-map guests
- remove redundant use "bool direct_map", to be replaced by
d_cfg.flags & XEN_DOMCTL_CDF_directmap
- remove panic action since it is fine to assign a non-DMA capable device when
IOMMU and direct-map both off
---
v3 changes:
- doc refinement
- drop the pointless gbank
- add check of the size of nr_banks shall not exceed NR_MEM_BANKS
- add ASSERT_UNREACHABLE to catch any misuse
- add another check of validating flag XEN_DOMCTL_CDF_INTERNAL_directmap only
when CONFIG_STATIC_MEMORY is set.
---
 docs/misc/arm/device-tree/booting.txt |   6 ++
 xen/arch/arm/domain_build.c           | 105 +++++++++++++++++++++++++-
 2 files changed, 108 insertions(+), 3 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 71895663a4..a94125394e 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -182,6 +182,12 @@ with the following properties:
     Both #address-cells and #size-cells need to be specified because
     both sub-nodes (described shortly) have reg properties.
 
+- direct-map
+
+    Only available when statically allocated memory is used for the domain.
+    An empty property to request the memory of the domain to be
+    direct-map (guest physical address == physical address).
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 1dc728e848..97a5b5dedd 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -500,8 +500,13 @@ static bool __init append_static_memory_to_bank(struct domain *d,
 {
     int res;
     unsigned int nr_pages = PFN_DOWN(size);
-    /* Infer next GFN. */
-    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);
+    gfn_t sgfn;
+
+    if ( !is_domain_direct_mapped(d) )
+        /* Infer next GFN when GFN != MFN. */
+        sgfn = gaddr_to_gfn(bank->start + bank->size);
+    else
+        sgfn = gaddr_to_gfn(mfn_to_maddr(smfn));
 
     res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
     if ( res )
@@ -674,12 +679,94 @@ static void __init allocate_static_memory(struct domain *d,
  fail:
     panic("Failed to allocate requested static memory for domain %pd.", d);
 }
+
+/*
+ * Allocate static memory as RAM for one specific domain d.
+ * The static memory will be directly mapped in the guest(Guest Physical
+ * Address == Physical Address).
+ */
+static void __init allocate_static_memory_11(struct domain *d,
+                                             struct kernel_info *kinfo,
+                                             const struct dt_device_node *node)
+{
+    u32 addr_cells, size_cells, reg_cells;
+    unsigned int nr_banks, bank = 0;
+    const __be32 *cell;
+    u64 tot_size = 0;
+    paddr_t pbase, psize;
+    mfn_t smfn;
+    int length;
+
+    if ( parse_static_mem_prop(node, &addr_cells, &size_cells, &length, &cell) )
+    {
+        printk(XENLOG_ERR
+               "%pd: failed to parse \"xen,static-mem\" property.\n", d);
+        goto fail;
+    }
+    reg_cells = addr_cells + size_cells;
+    nr_banks = length / (reg_cells * sizeof (u32));
+
+    if ( nr_banks > NR_MEM_BANKS )
+    {
+        printk(XENLOG_ERR
+               "%pd: exceed max number of supported guest memory banks.\n", d);
+        goto fail;
+    }
+
+    for ( ; bank < nr_banks; bank++ )
+    {
+        smfn = acquire_static_memory_bank(d, &cell, addr_cells, size_cells,
+                                          &pbase, &psize);
+        if ( !mfn_valid(smfn) )
+            goto fail;
+
+        printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
+               d, bank, pbase, pbase + psize);
+
+        /* One guest memory bank is matched with one physical memory bank. */
+        kinfo->mem.bank[bank].start = pbase;
+        if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[bank],
+                                           smfn, psize) )
+            goto fail;
+
+        tot_size += psize;
+    }
+
+    kinfo->mem.nr_banks = nr_banks;
+
+    kinfo->unassigned_mem -= tot_size;
+    /*
+     * The property 'memory' should match the amount of memory given to the
+     * guest.
+     * Currently, it is only possible to either acquire static memory or let
+     * Xen allocate. *Mixing* is not supported.
+     */
+    if ( kinfo->unassigned_mem )
+    {
+        printk(XENLOG_ERR
+               "Size of \"memory\" property doesn't match up with the sum-up of \"xen,static-mem\". Unsupported configuration.\n");
+        goto fail;
+    }
+
+    return;
+
+ fail:
+    panic("Failed to allocate requested static memory for direct-map domain %pd.",
+          d);
+}
 #else
 static void __init allocate_static_memory(struct domain *d,
                                           struct kernel_info *kinfo,
                                           const struct dt_device_node *node)
 {
 }
+
+static void __init allocate_static_memory_11(struct domain *d,
+                                             struct kernel_info *kinfo,
+                                             const struct dt_device_node *node)
+{
+    ASSERT_UNREACHABLE();
+}
 #endif
 
 static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
@@ -2983,7 +3070,12 @@ static int __init construct_domU(struct domain *d,
     if ( !dt_find_property(node, "xen,static-mem", NULL) )
         allocate_memory(d, &kinfo);
     else
-        allocate_static_memory(d, &kinfo, node);
+    {
+        if ( is_domain_direct_mapped(d) )
+            allocate_static_memory_11(d, &kinfo, node);
+        else
+            allocate_static_memory(d, &kinfo, node);
+    }
 
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
@@ -3024,6 +3116,13 @@ void __init create_domUs(void)
             panic("Missing property 'cpus' for domain %s\n",
                   dt_node_name(node));
 
+        if ( dt_property_read_bool(node, "direct-map") )
+        {
+            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) )
+                panic("direct-map not valid without CONFIG_STATIC_MEMORY\n");
+            d_cfg.flags |= XEN_DOMCTL_CDF_INTERNAL_directmap;
+        }
+
         if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") &&
              iommu_enabled )
             d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
-- 
2.25.1


