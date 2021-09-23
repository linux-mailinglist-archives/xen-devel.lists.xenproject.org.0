Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E126A4155CE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 05:12:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193309.344318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9G-0004CN-T6; Thu, 23 Sep 2021 03:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193309.344318; Thu, 23 Sep 2021 03:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9G-0004AJ-Pw; Thu, 23 Sep 2021 03:11:46 +0000
Received: by outflank-mailman (input) for mailman id 193309;
 Thu, 23 Sep 2021 03:11:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qvJY=ON=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mTF9F-0004AD-EB
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 03:11:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.43]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a9ce09e-c628-4d60-80c5-337842705fda;
 Thu, 23 Sep 2021 03:11:42 +0000 (UTC)
Received: from DU2PR04CA0313.eurprd04.prod.outlook.com (2603:10a6:10:2b5::18)
 by PAXPR08MB6638.eurprd08.prod.outlook.com (2603:10a6:102:df::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 03:11:39 +0000
Received: from DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::80) by DU2PR04CA0313.outlook.office365.com
 (2603:10a6:10:2b5::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:39 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT019.mail.protection.outlook.com (10.152.20.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:39 +0000
Received: ("Tessian outbound 8b24208353e0:v103");
 Thu, 23 Sep 2021 03:11:38 +0000
Received: from e1e21acaab68.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3C225115-2288-43D4-BBD2-EDE3A62BF579.1; 
 Thu, 23 Sep 2021 03:11:25 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e1e21acaab68.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 03:11:25 +0000
Received: from FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::17)
 by PAXPR08MB7188.eurprd08.prod.outlook.com (2603:10a6:102:20a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 03:11:23 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:49:cafe::bb) by FR0P281CA0060.outlook.office365.com
 (2603:10a6:d10:49::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:23 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:22 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 03:11:21 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:19 +0000
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
X-Inumbo-ID: 0a9ce09e-c628-4d60-80c5-337842705fda
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAeAMVF5g6MVjQKqmQi4d01qiiA0tPwK6j/l9Ubz7bc=;
 b=7ifj2UjVWtACj8FNlNiFQj2z0Czaqa6uCMEriQwsRASyNiQi04+q2n8SAatsWG7oV2G6M5x5sO98PMpYtwrOtRCpPhr1tX4Dr7rQsaGyure8wmkJBi9/Y/gmNYCN6PLnAZxYRgaemc1stFoCoVVdnri3YxdvgjqSy8fzodPGkyY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f50ebabb71f23e03
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnWi49FVyhZfhVGKqJN6eObkVj2pjqinxpwZuQhMi+lzt+HZ7Kxa5NHmMcKatxOQaNQCRJ5RKdKmOwC6R538ZiD6+h0vVbFBpQvXCvP8J6pdyEWMAWle9faqzJ2g56y4rDPVqeJHL2TbTkJ9n5iPFABU5SmcN+0/vHKElxA5mwvFIFxSu7k10dy31a3wx2D5Q4vQnnPmLBkiSyZtXt24GZ22eZOxcci9a9s+A6ONE0ILdSwKW6ZW4fWdry9LUF+afPiSM68ngW4YYMRc+EtY1xwnvbMSnTLSap3X6OJ5zBPtkZg/1t91YbFg/jnbjW9Y1JmancymEoqtF/UYUG1CmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=UAeAMVF5g6MVjQKqmQi4d01qiiA0tPwK6j/l9Ubz7bc=;
 b=l4jZ0ylVLBSshdnKzuOk+6a8MEEYor4TK7hkByV6kZhPEPFqSMcVjezyX0dK0kMxiSfvGTsveQw9DNDXS17y4/bPc4G7jzQjgzUmg893VH5MibSg5w/k6a37E9gsNA/gagZbavNBuogGaVRVBIRjB3dFg/Al2TsimVMp3mLeTcTiLZ3ZtVxN1VeAteSV3Yt/cwucwQ1fD70a3VdkdpBbIaeaZXIFhBAJkEGfhAkQcCYHFK2VzcEtJXcmXlQY86eWxTIKE53bmkAzxCtVqanijMFrcdp1h5QbIOu9x+V+L+IHu4NPUvyMOwCoWkYx3JGpn4hZRWrS1PymXsa2Jca//g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAeAMVF5g6MVjQKqmQi4d01qiiA0tPwK6j/l9Ubz7bc=;
 b=7ifj2UjVWtACj8FNlNiFQj2z0Czaqa6uCMEriQwsRASyNiQi04+q2n8SAatsWG7oV2G6M5x5sO98PMpYtwrOtRCpPhr1tX4Dr7rQsaGyure8wmkJBi9/Y/gmNYCN6PLnAZxYRgaemc1stFoCoVVdnri3YxdvgjqSy8fzodPGkyY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH 00/11] 1:1 direct-map memory map
Date: Thu, 23 Sep 2021 03:11:04 +0000
Message-ID: <20210923031115.1429719-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56ef7f50-d3be-4561-68e1-08d97e3fdc60
X-MS-TrafficTypeDiagnostic: PAXPR08MB7188:|PAXPR08MB6638:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB663897C90127CB2E9493852CF7A39@PAXPR08MB6638.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 S3rdXHINb2KiAHWnOVyWOcyCMRXg/ATHFPyFjx0/u4f5ra8hBMUVzrmhdftBERiSMKT4j87TMBaM3WTIe3cUhiEw/WufpJ8MtQcSuzSEyXB8QNAkpkY5F1c67r7B+A8BCeVPG6iMotEzCi2nrqa0hf28Aw4R+r4soOUDk7c5gUnPfRPEvfVfT0NU9dL/fsVumvOXk1n55bEeTJZ2Az7w1D7QiiYS9+pMNDdYngmtmBCZF2Z/vXq3xBRb7bsrN8nvEzHAFIfffHUngD3xtdCv92S3UIxFs/69oE9hQGOfY7TtdgSWiABIC6dZOBcVQMl5X/6sC1Efu/weWC+HxDr9DsfIiaS8CWZXWQFGSwektYiqdp/P7Ke5xXfBcHZw98nePLLocHPVSbzbN5ZrhnhqIbZJHRpXjdbIEM7ifLnvQEX0bEnlfzoTjcQsyr0D8EAJGuKAMT/m5q5Gpv8TCC0hGcCvF4VmagwaxwN+8tzk3FYumgXg9SzPCJ0JrYV23zMHbsg8aBkxtPxzesTx7iRyK1PKVmv+bvBpf1WYVC6YilHUUzTzxSGWDPz0YpjgtupnQI8yf57JQAFO16+UxKsJdjd7f2BYuzAu0qp0EOSKBfZNbY2MUXNTh0KR2DsRV4hqUHtdCFp8aPbkpja0tDrmXWq5M1QWAVB202AEwGWxntrEbsO3+qi8tOfq16tMF2iTrqhvkScurDz/uGq0oCDw9h8QKvwCUdkXjHYDNmSOot6nXo3tMdmJU6xIPgmdLClfCb9m+EUUQYy7qlEyez6kMAO3aZxbB5kkXaBr/ruLhwStSwwY32eIa9xk4SPYn6Q8sG5GC8vU8X5VvMzgz1BdzDhLqIBRslU+DBt1n8bLShI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(83380400001)(6666004)(70206006)(7696005)(2906002)(36756003)(8676002)(81166007)(356005)(508600001)(110136005)(966005)(8936002)(47076005)(1076003)(54906003)(86362001)(26005)(336012)(36860700001)(5660300002)(316002)(4326008)(44832011)(70586007)(2616005)(186003)(426003)(82310400003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7188
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	88378815-0ee5-47a6-3559-08d97e3fd273
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4WffGx/xVimjsSiPPHUU0M3/L+4OHBYfdNxHdly5LY+B1fyT0zmaanJwP8u6FfSjEhvmLIDN99pBkjN8Ae0bX+MMt48adIP/K4fVPFQ8m6XYoyZDfp6IXlqlfAmo+xm/5lh1Cqf8gFp+gkuCuuGfpQfcVZxst1hNLZWx+e1y98+scwj/1dTG/2Fjztva8Sq/Hd5bjP7pSMbDxlu6/eK8mFC07NoAp2lGOd5Z0unh4gLw4gAA8jcLzrXzca6TISe+sdKcTElCoxo2QasszxgiJB3F7o3ZkIpA27Lbg+KGXS26vw2ILtC7Om0klRP5LZx6NO+w0B8P6z9kQm7yocvYGDQ+q3vs38HedeRdHxwsnlGBRZ9Nc1NFSaDBeFV39S9YhHjQ2aJ/qTuVz942tQd7AQP9snsBjq3Cp2acwx+QJiFP9z2CI0fsC9UA/vE4CyrhWtj5auBs571cIYbE4p6yG2YMOcmo3cnfhomaKAW+jjfEzsI0jqBJFu/ozIjJkZkD9YIgxioNkhVp//czljdNaNUmyIvXbM9OXfYuwQhKoH4/QcDQlGaLSYGdOS3sAUmfV+uiUK6m70dOozZKm9QIdIzI+C+hAUJS3uJn8sk6bFb7BQiyzH6pstGVPR+XE9swr77E8gplkVWhYk7EX0d4NET5ocivYAMdvhKGI4i6WM+13rM5HGFM3ot+fKuME/7iNNXNziwxtoe4TeLYHS3CmPW4VliPUejbbp5pL/q/m8gghksuMTWxq3ybE43K0w3GyARHWXtPFHDARemB9NLPLCHjyKeRD3Rqi3odD0Pg1m09TrtG6yR6JakulQOHSi0QcPd1G/prdsG+ENJ6gGITdw==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(110136005)(336012)(70586007)(81166007)(966005)(186003)(36860700001)(82310400003)(1076003)(36756003)(54906003)(2906002)(7696005)(8936002)(86362001)(70206006)(8676002)(508600001)(5660300002)(6666004)(26005)(316002)(83380400001)(2616005)(426003)(47076005)(44832011)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 03:11:39.4921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ef7f50-d3be-4561-68e1-08d97e3fdc60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6638

Cases where domU needs 1:1 direct-map memory map:
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

*WARNING:
Users should be aware that it is not always secure to assign a device without
IOMMU protection.
When the device is not protected by the IOMMU, the administrator should make
sure that:
 1. The device is assigned to a trusted guest.
 2. Users have additional security mechanism on the platform.

Requesting 1:1 memory mapping for the domain, when IOMMU is absent from the
system or it is disabled (status = "disabled" in device tree). In which
case, "direct-map" property is added under the appropriate domain node.

Right now, 1:1 direct-map is only supported when domain on Static Allocation,
that is, "xen,static-mem" is also necessary in the domain configuration.

Looking into related [design link](
https://lists.xenproject.org/archives/html/xen-devel/2021-05/msg00882.html)
for more details.

The whole design is about Static Allocation and 1:1 direct-map, and this
Patch Serie only covers parts of it, which are 1:1 direct-map memory map.
Other features will be delievered through different patch series.

See https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg00855.html
for Domain on Static Allocation.

Penny Zheng (1):
  xen/arm: device assignment on 1:1 direct-map domain

Stefano Stabellini (10):
  xen: reserve flags for internal usage in xen_domctl_createdomain
  xen/arm: introduce XEN_DOMCTL_INTERNAL_directmap
  xen/arm: introduce 1:1 direct-map for domUs
  xen/arm: introduce accessors for vgic dist, cpu, and rdist base
    addresses
  xen/arm: vgic: introduce vgic.cbase
  xen/arm: new vgic: update vgic_cpu_base
  xen/arm: if 1:1 direct-map domain use native addresses for GICv2
  xen/arm: if 1:1 direct-map domain use native addresses for GICv3
  xen/arm: if 1:1 direct-map domain use native UART address and IRQ
    number for vPL011
  xen/docs: add a document to explain how to do passthrough without
    IOMMU

 docs/misc/arm/device-tree/booting.txt |   9 ++
 docs/misc/arm/passthrough-noiommu.txt |  54 +++++++
 xen/arch/arm/domain.c                 |   3 +-
 xen/arch/arm/domain_build.c           | 219 ++++++++++++++++++--------
 xen/arch/arm/vgic-v2.c                |  26 ++-
 xen/arch/arm/vgic-v3.c                |  10 +-
 xen/arch/arm/vgic/vgic-v2.c           |  27 +++-
 xen/arch/arm/vpl011.c                 |  34 +++-
 xen/arch/x86/setup.c                  |   4 +-
 xen/common/domain.c                   |  19 ++-
 xen/common/domctl.c                   |   3 +-
 xen/common/sched/core.c               |   2 +-
 xen/include/asm-arm/domain.h          |   9 +-
 xen/include/asm-arm/new_vgic.h        |  24 +++
 xen/include/asm-arm/vgic.h            |  42 +++++
 xen/include/asm-arm/vpl011.h          |   2 +
 xen/include/public/domctl.h           |   3 +
 xen/include/xen/domain.h              |   8 +
 xen/include/xen/sched.h               |   3 +-
 19 files changed, 394 insertions(+), 107 deletions(-)
 create mode 100644 docs/misc/arm/passthrough-noiommu.txt

-- 
2.25.1


