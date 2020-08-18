Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFA1248664
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 15:49:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k81yZ-0008It-8I; Tue, 18 Aug 2020 13:48:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTNL=B4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k81yY-0008Io-8Q
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 13:48:30 +0000
X-Inumbo-ID: 59ffaed8-8417-4e32-93bc-c859fa3dc4e1
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.82]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59ffaed8-8417-4e32-93bc-c859fa3dc4e1;
 Tue, 18 Aug 2020 13:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYJMbgCjsVtQxJDE4asG9d2dsFVlVeeCOTFbaGNEEng=;
 b=NOAVEIb63lyTt2hiyUL/nWk/29ELcfGdvl7LKVfwVGNCLu4Z1qH0OD/S27c/EcBZ9rnYBssiuIcsYhsHHwoAw14RLpVo7fDFDSK1Vw0ThPxWn0JRKYQVeoLr/ZfggakysRBU7iDzWZXfr4lpbMf6RpG+6VL815IR3TP31/Vo/ss=
Received: from AM0PR01CA0104.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::45) by DBBPR08MB4902.eurprd08.prod.outlook.com
 (2603:10a6:10:db::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Tue, 18 Aug
 2020 13:48:26 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:10e:cafe::57) by AM0PR01CA0104.outlook.office365.com
 (2603:10a6:208:10e::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Tue, 18 Aug 2020 13:48:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 13:48:26 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Tue, 18 Aug 2020 13:48:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1552c9917442d640
X-CR-MTA-TID: 64aa7808
Received: from c489e19bfa5c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C187B410-01ED-484A-BDA8-46240BDA449C.1; 
 Tue, 18 Aug 2020 13:48:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c489e19bfa5c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Aug 2020 13:48:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSf8XdxsnqCn2eNcKPjXCckMhFewXXXY1ZQeUBRma4P7t3QOhTCNL1O5I6XZxGdp7GS02GYloHmQH+yBZVotJnYbTVlSF4uarKTdnLI8xVkF9L1EisNjQAIiYJXvnHlkWuPBhuIcJeD+hGqCBxvjcp5pqYd51sA5BYzldGTJfgXGsxViVr1C2RomoJtX2m/ETm0BmwCQ6Yqm2YTlORJMfzs2lNNaXgpQLyYOSmsI8nJlcafDGzPi9xdrdhaTVp5cGDrQRkxIJ9IdcWYpV0x2esw4ZBZqefDFwKPsFArBebFpQB4ZvuRz1rVet92SvRCubxjvbXAnOo+r6ywKD4LljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYJMbgCjsVtQxJDE4asG9d2dsFVlVeeCOTFbaGNEEng=;
 b=TyJVdbKQt1F/NdU5CxMva6AkAEBI4+LV4hu8VEAjrFPKWyvWkADqlT1kpotY5gMartBYn74Gb03jtbJnrJg/CJ/Gpt6s/hGFYPOfnfdoXkXI3ZDD4gzCTXO5yn81yoDIyQ2hiKLglbKzWqKACHD8OKfo7LFXULZP9vvDz3r0Dw6Rdfm3HLU6Fe+M4nzfPOGLLtBXOch5mbrpE7J3fZn5T541NSP7WneTKt5PaQ6D+v5r0A3Au2Pb+Ru4mA6kZ3XvS7rq0sTc06npfyl2Qq6tWSV1hF1h9Cd3nQeDn5jOutDapGbaKdQOB3+X3BNqAVBI4PVJA+IimU2AMD6sk8h5Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYJMbgCjsVtQxJDE4asG9d2dsFVlVeeCOTFbaGNEEng=;
 b=NOAVEIb63lyTt2hiyUL/nWk/29ELcfGdvl7LKVfwVGNCLu4Z1qH0OD/S27c/EcBZ9rnYBssiuIcsYhsHHwoAw14RLpVo7fDFDSK1Vw0ThPxWn0JRKYQVeoLr/ZfggakysRBU7iDzWZXfr4lpbMf6RpG+6VL815IR3TP31/Vo/ss=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5322.eurprd08.prod.outlook.com (2603:10a6:10:114::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 13:48:16 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 13:48:16 +0000
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Wei Chen <wei.chen@arm.com>, Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 1/2] arm: Add Neoverse N1 processor identifation
Date: Tue, 18 Aug 2020 14:47:38 +0100
Message-Id: <46faecc92bee2a02490b926a636c3eafef1d185e.1597740876.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597740876.git.bertrand.marquis@arm.com>
References: <cover.1597740876.git.bertrand.marquis@arm.com>
Content-Type: text/plain
X-ClientProxiedBy: DM5PR07CA0093.namprd07.prod.outlook.com
 (2603:10b6:4:ae::22) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.49) by
 DM5PR07CA0093.namprd07.prod.outlook.com (2603:10b6:4:ae::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 18 Aug 2020 13:48:14 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 66bd987e-6a19-43af-ea16-08d8437d61e3
X-MS-TrafficTypeDiagnostic: DB8PR08MB5322:|DBBPR08MB4902:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB49029C5D3EEC4948DD757EFD9D5C0@DBBPR08MB4902.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:439;OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: A5SpGd3P+QdZWdU17QUzIRbaMBPzWQa1buqUBsYfS8+YT8wZb1TWYxT3cEV4AnR4muWJNlgujWBQDuVinXuN7JZBAmdkVXlgyIrI6J64x5f2uXtLzZ5DTDBHXvdLyU1EETB5NoqZjrOxa5fPi46VXQLVKgL/SPVmPKWQPiNC0+92JcSA+p911fKlUWJy6+MiSDuOiDcO0oPriqpBK9/mQPwM7bvOdcqaozOgsYzuxR03yf5EX86UIexJlh1vedY3iZEDe1zumxjUtV/B/SzKt1PEy/mE/nIuRmKktdsbDLY/kwosXs/soCGOefto9w3QWVYROs+u7AkC8jR+ZjhZvC7IiTOy4eZfHPYChCvonMPFdR7CV6/60QZGcCZb2Flk
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(36756003)(54906003)(16526019)(316002)(26005)(6486002)(2906002)(4326008)(52116002)(7696005)(186003)(6916009)(478600001)(66476007)(86362001)(2616005)(44832011)(6666004)(8676002)(66946007)(5660300002)(66556008)(956004)(8936002)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: My6zBsGZXdFar4jsK3gN61fmwGJoSqTmWmCnmWnGsmCtdWBi6R0i3waWUNVW8chHLNb6kdh3HLyL7w+mhoEaktxHW//LZszuq0jIxXJ0soNik12bOxMoL+qpu7Okh1TMGDIDag/Oogcf0/W4lkGLh7BpFWn6eCn8uM0+hYpRW+H5KUr2uowkGyZYQBtPY9CTd7UZGLW+LsQarU3wYgxAm/QaaMyzv/d2+BM9cCFfMX6Jd0VugUaalTtYZ7iM42uNs2o/SXmMn95CRFtnwktJ5K5YFcBrP2SpVG+eWsm5tW444RPi6gezuiqgKY0mF4j8IgO8lNoeqQWGeiZlcWCO2zhesC4wq22mEgruG8c0etsu+o09OXgFT+Xb34UiY38wXH03WT+3A5O7HyItNGuXi1bFLYSC3CT7C7Q0akEice1etgjvTzzuycB2xjxW2uwdjZ2Mxt4VSmpVzf8ESxRZKOhoD/abd4nyopkh4XtY0Px1rhOkaHNQf3F5KpCHlASUibLNS/VqKWk6FXkiDCSEB1fmxwz1NdZTU+ID2736/QsNzlsKlObBpASTtwlaOGokbo82CU3sFfVxGn00RwSW6dBrRm8HuJ0wCaFaKtVyvrtOpj1O4QDMRRWnLAD9Fxus/MP7FL2ibV9onWBxwMnNXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5322
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 519c516b-46f6-4220-b4a0-08d8437d5b7f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HpRxVDZ/tt0E5MfbnEPZQMEVwT+ZnDlPQuIj4CR1PaLp4c7YyK4deEn3GOeHQ0y0tX0tadjn7Vu9hTOkbLPcVw/jrfeQ0Fd9F6f0TsQ06YjcEJc3y/ViJsscuafoHbUKj4ckD/vglKfUAAuRtStpI2Er3jw2fiCVEMsxC++67bRwct8wlvsvQirheTZ7n+QewYYZq7ALpJ+gnBzslBf9PyEkmWlsoG1UqlosHm/pog0ZIBwexHdneEJ97B39M4sXMkl3wZynAekoYFNNJuHdzukY6Ke8wt8vh6VKchj6Wbty6moJ08R+DktjYtnGBUrHDbktmB7PWuksUdeuNJjlUolSequtT4IN8Su/z7/wd8C7YketSbkVw7K8g/9WdFLumKJffIFFcX6saeiAwOFTPGtKfV8dIhdv2Rkjtrzh1D6ehI4EMWv1+o3AsuvrnLh4
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966005)(36756003)(54906003)(4326008)(5660300002)(36906005)(2906002)(478600001)(7696005)(70206006)(70586007)(316002)(6486002)(44832011)(186003)(81166007)(82740400003)(336012)(8936002)(6666004)(47076004)(16526019)(2616005)(8676002)(82310400002)(6916009)(956004)(356005)(26005)(86362001)(136400200001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 13:48:26.4605 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66bd987e-6a19-43af-ea16-08d8437d61e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4902
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add MIDR and CPU part numbers for Neoverse N1

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/include/asm-arm/processor.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/processor.h
index aa642e3ab2..3ca67f8157 100644
--- a/xen/include/asm-arm/processor.h
+++ b/xen/include/asm-arm/processor.h
@@ -58,6 +58,7 @@
 #define ARM_CPU_PART_CORTEX_A73     0xD09
 #define ARM_CPU_PART_CORTEX_A75     0xD0A
 #define ARM_CPU_PART_CORTEX_A76     0xD0B
+#define ARM_CPU_PART_NEOVERSE_N1    0xD0C
 
 #define MIDR_CORTEX_A12 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A12)
 #define MIDR_CORTEX_A17 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A17)
@@ -68,6 +69,7 @@
 #define MIDR_CORTEX_A73 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A73)
 #define MIDR_CORTEX_A75 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A75)
 #define MIDR_CORTEX_A76 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A76)
+#define MIDR_NEOVERSE_N1 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N1)
 
 /* MPIDR Multiprocessor Affinity Register */
 #define _MPIDR_UP           (30)
-- 
2.17.1


