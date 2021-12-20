Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8A147A44D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 06:22:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249402.429803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7V-0007hb-QO; Mon, 20 Dec 2021 05:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249402.429803; Mon, 20 Dec 2021 05:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7V-0007eN-Kj; Mon, 20 Dec 2021 05:21:57 +0000
Received: by outflank-mailman (input) for mailman id 249402;
 Mon, 20 Dec 2021 05:21:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ajqg=RF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mzB7T-0007eG-LQ
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 05:21:56 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe02::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc91936c-6154-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 06:21:52 +0100 (CET)
Received: from AM5PR0101CA0026.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::39) by AM0PR08MB3587.eurprd08.prod.outlook.com
 (2603:10a6:208:dd::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 05:21:48 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::67) by AM5PR0101CA0026.outlook.office365.com
 (2603:10a6:206:16::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:21:47 +0000
Received: ("Tessian outbound a33f292be81b:v110");
 Mon, 20 Dec 2021 05:21:47 +0000
Received: from 15a868e231fc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7955E9D2-6AF5-4EFB-9FF9-8D47464FDDC2.1; 
 Mon, 20 Dec 2021 05:21:41 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 15a868e231fc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 Dec 2021 05:21:41 +0000
Received: from DB7PR05CA0043.eurprd05.prod.outlook.com (2603:10a6:10:2e::20)
 by PR3PR08MB5850.eurprd08.prod.outlook.com (2603:10a6:102:92::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Mon, 20 Dec
 2021 05:21:39 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e::4) by DB7PR05CA0043.outlook.office365.com
 (2603:10a6:10:2e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:39 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:21:38 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 20 Dec
 2021 05:21:38 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:36 +0000
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
X-Inumbo-ID: bc91936c-6154-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VI2S3WrwoHVYVm8HTqP/yL+yoeOQEd8YqDWRYEzzS+g=;
 b=DQAKuV5g+TzsjZDy+Vlt+0Fxrd57RC+Lumf4ZGg10mtkZEOAGNj7p/qFTym+V03+pwaF51alYCnLsbHsmeLXA4D4u7dtirUpAQe7mt1QK6Q0RjT5LfbrV2Ms/8XT7cYFa+oN02abUjsxqi+ox76HWYBzVFtGAdI6aE8u/X3Ya+U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 30303dda52213c14
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpuFtM862LG7VOxRK7N2ULxdwEbOf2rJaQccg890le5APglEwHx14DCZ5H3NP7bc4/Inlb7WAuDlG3Z39Enovwwe1WLq7scfIVctO3A+X+RjNo+1qYjNy8JlEmF2pHLBEMSdbkwZGkSVPdH0rdz8B3jvjDUbr6mhM0xkBsWleAEVQzAapncHWqfAl7bwpTRIcQltVCHIEUw/gOg/GPXM+dFXhfaMq5ayOG2mrZ+/VFupcSjKgnVo9QJxBpMWSOIAeiFLaGzPLAXdt1md6dMpkPRRd9yRiJe8WxnNQTvgQpro95+0fiDQYSI4Efk5iWdw1vkLyRrcMU3wD/l+E87nog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VI2S3WrwoHVYVm8HTqP/yL+yoeOQEd8YqDWRYEzzS+g=;
 b=jRNINBx6fjatPgwumgPdWmHzh22W9jkbmHKzK+069+Sg6KoM/Iq3qeAeD9Q872Z3X64f37mUNrcTKOROqglIrfS9J9NIuKM7sAHemK25WQAoFuy0c/gN+B5KjPkkpY0s9rd9a1eA4v2c08oZOh2IuyTugpbz5ArC4DHYYn0G/si/QLUMnC+3oyf1cZ/U1tWQsu12AK45M3ksH63qACP4CGJcK5MgAL3PHuZFrKTYf7gbVZ3s2BSy7EGZAMdd3dMeWqyp8SqEhrtyy6Ua+WJowVZkVG4ypl+7PMtVDMNJgCOWaIUOr2MUne8V5B1Tof8q3S1WAk1bKByJ4D6l7pv3dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VI2S3WrwoHVYVm8HTqP/yL+yoeOQEd8YqDWRYEzzS+g=;
 b=DQAKuV5g+TzsjZDy+Vlt+0Fxrd57RC+Lumf4ZGg10mtkZEOAGNj7p/qFTym+V03+pwaF51alYCnLsbHsmeLXA4D4u7dtirUpAQe7mt1QK6Q0RjT5LfbrV2Ms/8XT7cYFa+oN02abUjsxqi+ox76HWYBzVFtGAdI6aE8u/X3Ya+U=
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
Subject: [PATCH v4 00/11] direct-map memory map
Date: Mon, 20 Dec 2021 05:21:12 +0000
Message-ID: <20211220052123.969876-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 0bca1365-3f02-43a4-7259-08d9c3789efb
X-MS-TrafficTypeDiagnostic:
	PR3PR08MB5850:EE_|VE1EUR03FT044:EE_|AM0PR08MB3587:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3587ADA35AA37894604CDCDCF77B9@AM0PR08MB3587.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NDN6eEc1TTdRZlV5bDJEWlJSMEp0VklORVNweEZvVnd5R3JsV2VjNlBwMUdG?=
 =?utf-8?B?N3dZTVprdjZhdkhyUnlnV3lzZXE3enk2QWlWUTZpQ2k4YWl6Ym5NcVZhTW5G?=
 =?utf-8?B?cG03Z3JiWlVoWEtFb1lPNTBpZEJBMXNPRDVsVnk2SVpsbGt0cStmVVVMbHda?=
 =?utf-8?B?cVpmSXlxYTdlWGY3ZjlGbEVEaXYxdlRmV3JRVXpkdCsxc3lCa0VFbDJqVlRC?=
 =?utf-8?B?b3lxdzVoSFZxUEN5QVhSN3EzeDlRY1IxeUZHVVJ6V1FnMzl3eExjSWNwZENq?=
 =?utf-8?B?OUMvOVMzUjE0eWFLNzA3cU5ZKzJXKzZ3UEx1cE4rcEQrVDdNQmxTeWV0VEMz?=
 =?utf-8?B?RlhCd0doVVBFWXdiY1QvdytWTXlxMzh4YSsyU1M3RitzWkMwbWtFRDdJalNo?=
 =?utf-8?B?dmZxZmVzb1YxRko0QnlEdGFieEpoQ2dId3V1alc0WmhSWkpFZkxPeUcydi9J?=
 =?utf-8?B?cElBZmlEZEEvUGE5VlZTL3JkeTNBSktacDNrK0pCY3VBYk1aVy9ORG5ldkpR?=
 =?utf-8?B?RitHT09QUzJ3Mi9ncGFjdDNUQzQzRUVwWGZwZWV1ODFSbXViYmVFanl4bTFC?=
 =?utf-8?B?RWY0OHJ4aEt6NG5RYlAwWnF5Mms4WFBKNVNkY0RmbGxmWXgzK0p1T090ZnA2?=
 =?utf-8?B?eENyY0J6MjF3SnM5SkxzQ2RYWGk4dkwvTmtMdmxKem9HWFh1b1pSTFhqOEFS?=
 =?utf-8?B?cnV1REw2OHJjOStSMm9TcjBWRlVMc0kwMFNwa3diZGtlTDFjL2xwWDVqZEps?=
 =?utf-8?B?QVhESnIxdm1GMmpZWTlKWU92dkZoUkZzMUxNQzN0UUJXRElBdURuWFFiUytH?=
 =?utf-8?B?NGNnZmVKSm9FSGZRQmV4dkFQc2kvRDhQeldTc0VLQmNvd1JlQnRRNWZEQUdF?=
 =?utf-8?B?aGZmTGdKNUl4aGxRYWhZOHpjTCtVVFZNbWU4c3ZKRlgwNWZobEU5NERreGVx?=
 =?utf-8?B?VWhCdE1GczZPbGt1dURnRU8wU2gySXJFejVoOUVnb1pVMktyTDRENTlDbmEv?=
 =?utf-8?B?ZGlENTNCRUMxandZbitpRUpUM0p3L1VSVnBNSDZGSzMyZ2lMeit1OTBRZTVG?=
 =?utf-8?B?cTd2L09jVzNYekVJeDFlQ3pMNzN0cHY3SHdTU2FiZDBudUliV3kwQm9wWGNG?=
 =?utf-8?B?dVBMdVZlcGcxbStVdUppQWtQTW1YR29Ta2dnTHExTnNLVVJhRm5DRlZBWUdM?=
 =?utf-8?B?QUdHWU8vOElnQkRtNWZPRldCNlFncEJDc3lSWDlJTExqSDl4WnVTT0YzTHhX?=
 =?utf-8?Q?hQ7gKbarJmxMUA1?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(81166007)(2906002)(966005)(70206006)(8936002)(70586007)(356005)(508600001)(83380400001)(47076005)(44832011)(2616005)(5660300002)(1076003)(336012)(426003)(26005)(6666004)(186003)(7696005)(8676002)(4326008)(86362001)(36756003)(110136005)(54906003)(36860700001)(40460700001)(316002)(82310400004)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5850
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b086600c-cc1d-4cbc-fd93-08d9c378998a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yta5XsGH9Ly20L4hQwTtcwihlf60Cqpqho+iGCqOh3tDHxdG5yb310gQd21sQrrZ0tB7aQFdGeDxMIEaXV8Nf6SN3lw9D6/E9exEuUMBzMuccGI2l0rEwtvCm92n/t+T/1/SJHKzIAMQ127b6/d2EuDVzt2BdNttg1iGqR3gX+NTtIJlFkgxcrP77Y6Mm0eC2SbizA2oTebHmDQwAR/dWH+ptWmlcjIqRNnt0DwTTRE0GQeWZ7yF3ufCuEMofMcVxJerXZqnsa0TjnkhNtxmePM1MRJLpW1bGUC4a1JI+ehqxkyTXK0nL8PHcHx4pZRz5VepPueqOTa7Ocktzhh1N0vEd+nS4AsOn/kuteAUS2f1tqeF4VxGXA/yokHrGMi35iaCq7sVS77vIFQHH0DKZmYwCOVAweWfM/sU+RtrnXxhCUdFta5vhsdye2jsuR5ToN/1wDQa+fYpCwFe566pgLVIkTknMgpbWLAsY65ZtHD/+Q0ngxKuMUT2LKjIRGPs/Ky7b17E+Ff5kAGipW3Fgiq8xZ2+EiZCt63Dftab8Eqa7vI/ApeHu+IYIRbW95COFTWW8qo5JfgAsbo94UNXBVhGOpFimaWleLFciLAgYsAYQQIzKomyeZAx81ds5LtOsp6vgi9etubGZBxFcKBZY3Owk2uub9z6ft542CLCH+paTFXHGREkvqwUjn0sT35So/XwYClgt7awYfESTQfDnFcnyP7lVLjtCXhBC68+/O+P8VABqdQxHIMNKaTVMzwaKWZp4yhRmwx6xKBYg6yC7lI+U2yfNyCXivvoaBiSEblGtPD/EVI1h2jZE3ecxvti/SHpEshRESELlil363Z3NyGlvgDQzjV5JBQ451DBewg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(426003)(2616005)(2906002)(336012)(508600001)(36860700001)(54906003)(110136005)(70586007)(5660300002)(966005)(86362001)(36756003)(316002)(4326008)(83380400001)(44832011)(47076005)(186003)(70206006)(6666004)(8676002)(82310400004)(26005)(7696005)(8936002)(1076003)(81166007)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 05:21:47.9156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bca1365-3f02-43a4-7259-08d9c3789efb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3587

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

"direct-map" property shall be added under the appropriate domain node,
when users requesting direct-map memory mapping for the domain.

Right now, direct-map is only supported when domain on Static Allocation,
that is, "xen,static-mem" is also necessary in the domain configuration.

Looking into related [design link](
https://lists.xenproject.org/archives/html/xen-devel/2021-05/msg00882.html)
for more details.

The whole design is about Static Allocation and direct-map, and this
Patch Serie only covers parts of it, which are direct-map memory map.
Other features will be delievered through different patch series.

See https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg00855.html
for Domain on Static Allocation.

This patch serie is based on
https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00822.html\
---
v4 changes:
- introduce internal const CDF_xxx flags for domain creation
- introduce internal flag CDF_privileged
- introduce new internal flag CDF_directmap
- add a directmap flag under struct arch_domain and use it to
reimplement is_domain_direct_mapped.
- expand arch_domain_create/domain_create to include internal-only parameter
"const unsigned int flags"
- use mfn_eq() instead, because it is the only value used to indicate
there is an error and this is more lightweight than mfn_valid()
- rename function allocate_static_memory_11() to assign_static_memory_11()
to make clear there is actually no allocation done. Instead we are only
mapping pre-defined host regions to pre-defined guest regions.
- remove tot_size to directly substract psize from kinfo->unassigned_mem
- check kinfo->unassigned_mem doesn't underflow or overflow
- remove nested if/else
- remove ASSERT_UNREACHABLE() to avoid breaking compilation on prod build with
CONFIG_GICV3=n
- comment and commit message refinement
---
v3 changes:
- move flag XEN_DOMCTL_CDF_INTERNAL_directmap back to xen/include/xen/domain.h,
to let it be only available for domain created by XEN.
- name it with extra "INTERNAL" and add comments to warn developers not
to accidently use its bitfield when introducing new XEN_DOMCTL_CDF_xxx flag.
- reject this flag in x86'es arch_sanitise_domain_config()
- add ASSERT_UNREACHABLE to catch any misuse in allocate_static_memory()
and allocate_static_memory_11()
- add another check of validating flag XEN_DOMCTL_CDF_INTERNAL_directmap only
when CONFIG_STATIC_MEMORY is set.
- simply map the CPU interface at the GPA vgic_v2_hw.cbase
- drop 'cells += (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS)'
- rename 'is_domain_use_host_layout()' to 'domain_use_host_layout()'
---
v2 changes:
- remove the introduce of internal flag
- Refine is_domain_direct_mapped to check whether the flag
XEN_DOMCTL_CDF_directmap is set
- reword "1:1 direct-map" to just "direct-map"
- split the common codes into two helpers: parse_static_mem_prop and
acquire_static_memory_bank to deduce complexity.
- introduce a new helper allocate_static_memory_11 for allocating static
memory for direct-map guests
- remove panic action since it is fine to assign a non-DMA capable device when
IOMMU and direct-map both off
- remove redistributor accessor
- introduce new helper "is_domain_use_host_layout()"
- explain why vpl011 initialization before creating its device tree node
- error out if the domain is direct-mapped and the IRQ is not found
- harden the code and add a check/comment when the hardware UART region
is smaller than CUEST_VPL011_SIZE.
Penny Zheng (4):
  xen/arm: introduce new helper parse_static_mem_prop and
    acquire_static_memory_bank
  xen/arm: introduce direct-map for domUs
  xen/arm: add ASSERT_UNREACHABLE in allocate_static_memory
  xen/arm: gate make_gicv3_domU_node with CONFIG_GICV3

Stefano Stabellini (7):
  xen: introduce internal CDF_xxx flags for domain creation
  xen: introduce CDF_directmap
  xen/arm: avoid setting XEN_DOMCTL_CDF_iommu when IOMMU off
  xen/arm: if direct-map domain use native addresses for GICv2
  xen/arm: if direct-map domain use native addresses for GICv3
  xen/arm: if direct-map domain use native UART address and IRQ number
    for vPL011
  xen/docs: Document how to do passthrough without IOMMU

 docs/misc/arm/device-tree/booting.txt |   6 +
 docs/misc/arm/passthrough-noiommu.txt |  52 +++++
 xen/arch/arm/domain.c                 |   5 +-
 xen/arch/arm/domain_build.c           | 308 +++++++++++++++++++++-----
 xen/arch/arm/include/asm/domain.h     |  19 +-
 xen/arch/arm/include/asm/new_vgic.h   |  10 +
 xen/arch/arm/include/asm/vgic.h       |  11 +
 xen/arch/arm/include/asm/vpl011.h     |   2 +
 xen/arch/arm/vgic-v2.c                |  34 ++-
 xen/arch/arm/vgic-v3.c                |  26 ++-
 xen/arch/arm/vgic/vgic-v2.c           |  34 ++-
 xen/arch/arm/vpl011.c                 |  60 ++++-
 xen/arch/x86/domain.c                 |   3 +-
 xen/arch/x86/setup.c                  |   2 +-
 xen/common/domain.c                   |  12 +-
 xen/common/sched/core.c               |   2 +-
 xen/include/xen/domain.h              |   9 +-
 xen/include/xen/sched.h               |   2 +-
 18 files changed, 490 insertions(+), 107 deletions(-)
 create mode 100644 docs/misc/arm/passthrough-noiommu.txt

-- 
2.25.1


