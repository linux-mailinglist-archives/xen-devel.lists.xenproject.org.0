Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8184620D3
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 20:45:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234824.407493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrmaL-0008QK-Nk; Mon, 29 Nov 2021 19:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234824.407493; Mon, 29 Nov 2021 19:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrmaL-0008OT-Ke; Mon, 29 Nov 2021 19:45:09 +0000
Received: by outflank-mailman (input) for mailman id 234824;
 Mon, 29 Nov 2021 19:45:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=le4t=QQ=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1mrmaK-0008ON-5U
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 19:45:08 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9ea6b4f-514c-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 20:45:07 +0100 (CET)
Received: from SN6PR2101CA0017.namprd21.prod.outlook.com
 (2603:10b6:805:106::27) by BYAPR02MB5880.namprd02.prod.outlook.com
 (2603:10b6:a03:11d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Mon, 29 Nov
 2021 19:45:01 +0000
Received: from SN1NAM02FT0063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:106:cafe::96) by SN6PR2101CA0017.outlook.office365.com
 (2603:10b6:805:106::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.2 via Frontend
 Transport; Mon, 29 Nov 2021 19:45:01 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0063.mail.protection.outlook.com (10.97.5.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.20 via Frontend Transport; Mon, 29 Nov 2021 19:45:00 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 29 Nov 2021 19:44:59 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 29 Nov 2021 19:44:59 +0000
Received: from [10.108.8.223] (port=56545 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1mrmaA-0006R3-3Z; Mon, 29 Nov 2021 19:44:58 +0000
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
X-Inumbo-ID: d9ea6b4f-514c-11ec-b941-1df2895da90e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqMyGFq2LOMTjD1RI7rduDy21GRUQOo0E4IOEPI0vxcKTvSZdeUeUmzyL5VRogQE+NsFDBvTpuRzanFEMOl+nPkGhmj7yz/f9WW+obpciWDRmo4bPKqeOx0RxRumMXHl0eHnmrk/PmpGE0I0/QmFSMFTmaYm2eNMZ7PVgiMflPB9b8lGUzZEpvOAJ2vYdgJWwdNti/bC7utc9O3ODAElWdzv26egVUxDf4z91fisPA/Nuij4SjORdbBKQCVIQkomD/oAMSRo8NEHtsLGnJX18N9MAxu5HXCYC9NS5c2mgQ71/7//LKTnSayQeqsNDMJZrY+hiauyS56oFqKvSBypEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1WywC68EA581AYnU/R7Bcq/tS73rxBUtJBSIVMMoEw=;
 b=G/lJ8JVuj5xaHVAAzFO3z5WhAgTEgXNjFli8yIP7L+xjLTRuW29Hg695Kuis4wgBKIY0ZN9qV1Mk7dhwHyY8zI//mKM1yOD+7QUVDee8j8KUSun8diEqyytC6dXGqzdGHBU2Jg6EpCuL03PRJ88nD7EUKuCq7Zy2T5JlBLdqfC2OzOvpm3Awo62sxBE/XWOVNtwiUsE8XPq8H/cIA4Y/WyAFASObIWfurnXWryyH0fqIxOUbTe0oappyYe9SCLgDvH3wwzqyiiMMzSBBn2vwwGTKRjSJTgEvH1O+hUyfuwVoUlQb+HjWaDX/us9XUyihW/PDe4n3xdI8NOBo+54auQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1WywC68EA581AYnU/R7Bcq/tS73rxBUtJBSIVMMoEw=;
 b=ARhEXagzsymxUuWDM7Scu459UkPjccSFR08psdz0bSWvF5tCP1xK+woYY04wriwIA3RNbhZyt4djh2t9FSHj58q1lvgODKwwT8ASB0k7jq9IFMf3dy8xhxx1dYEX29XSicfrv2tuMRHE5I+T/juBZOnrkPEC5qa9Y8yQ/jR+Ydc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<jbeulich@suse.com>, Ayan Kumar Halder <ayankuma@xilinx.com>
Subject: [PATCH] Fixed an incorrect value
Date: Mon, 29 Nov 2021 19:44:50 +0000
Message-ID: <20211129194450.62467-1-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55213599-7dd7-43be-45ce-08d9b370bb32
X-MS-TrafficTypeDiagnostic: BYAPR02MB5880:
X-Microsoft-Antispam-PRVS:
	<BYAPR02MB588008ACB82608A01723F25CB2669@BYAPR02MB5880.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VJrGttyGYlvy/UrakmUb5IFyDkrjOOowwOiHh+ygOMkqlvo+n9Q09NzTVEXjlZSaPUcC2kMf2lbjiipcEFutJd1F43Hqj5x/aDPMF8F2AJih13rj1Hf1ApOI4CqBgkUznj8Khfi4SKWmABQ6hluCqOgsBrx5fJEY0Ik/iYnaGUFpYlnw5XU7Wn/+RkGPCuAznAsTQDYteJZfs9714wCL1uYJJTOM3zw+xl747RP8CD0XzFiq/WyKizNTQwwwI2ywynQDty419cq11OVN00QiBrQxf1UOeYT8CQER89+vJK32OG3JgxfsEsrduZy9uhL4MI4p9ad64q4rn409qT07vxvg8QjfpV5WgQsIAqklKnP81qYYtXMYUu2q8Eykm3dMUO/aCjEYyOn9SJIhoeOyn7sUDgLbkWJQ6FSxTKn5GH0qxB8lubX8RA9uMmNGZRSZDkNNu4wLoYvAdOn5ep/BSXCU6QM0R8tpUmiUOdjtDSsgDeBpGddy4Qdhjp+kdMIBJhTsbbPDzslYSkPT2WYDU0z6oU3LVjtxlcziyiRgMxCJ5RLJiprWc3yZemBfkPmD61nViRi8bWuIqZvYEHe0l+qkgAWn75ufLnJQTlyo7U7KM/3V1KH0dauoCgDiiFi2KG7bxyr6AloBcq7o86s0HmXovXTjM2QSWxvZp8eCsABUSl/k5yJM3FaKGQeXK0xHBaeaum6JgLxQQfuJezsEeCZlSLXLnpjNFXEJJllTWD0=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(6916009)(107886003)(82310400004)(47076005)(54906003)(4744005)(356005)(6666004)(8676002)(336012)(1076003)(70206006)(508600001)(5660300002)(8936002)(426003)(36860700001)(7696005)(70586007)(316002)(7636003)(9786002)(83380400001)(2906002)(186003)(26005)(2616005)(36756003)(4326008)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 19:45:00.5290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55213599-7dd7-43be-45ce-08d9b370bb32
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0063.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5880

GENMASK(30, 21) should be 0x07fe00000

Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
---

 xen/include/xen/bitops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index a64595f68e..2c8522d218 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -5,7 +5,7 @@
 /*
  * Create a contiguous bitmask starting at bit position @l and ending at
  * position @h. For example
- * GENMASK(30, 21) gives us the 32bit vector 0x01fe00000.
+ * GENMASK(30, 21) gives us the 32bit vector 0x07fe00000.
  */
 #define GENMASK(h, l) \
     (((~0UL) << (l)) & (~0UL >> (BITS_PER_LONG - 1 - (h))))
-- 
2.17.1


