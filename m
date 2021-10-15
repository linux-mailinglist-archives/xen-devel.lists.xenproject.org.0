Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7956642E717
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 05:11:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209666.366196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbDbw-00033y-3G; Fri, 15 Oct 2021 03:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209666.366196; Fri, 15 Oct 2021 03:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbDbv-00031s-UY; Fri, 15 Oct 2021 03:10:19 +0000
Received: by outflank-mailman (input) for mailman id 209666;
 Fri, 15 Oct 2021 03:10:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lHOs=PD=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mbDbt-00031m-N9
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 03:10:17 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::60f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4df48ce2-e5af-461f-9ad0-efc45ad7a94c;
 Fri, 15 Oct 2021 03:10:14 +0000 (UTC)
Received: from AS8P250CA0019.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::24)
 by DB7PR08MB4588.eurprd08.prod.outlook.com (2603:10a6:10:75::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 03:10:12 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::b7) by AS8P250CA0019.outlook.office365.com
 (2603:10a6:20b:330::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 03:10:11 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Fri, 15 Oct 2021 03:10:11 +0000
Received: from 15e1fc9dc923.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A70C9E0B-4206-43F7-8817-F5545D433722.1; 
 Fri, 15 Oct 2021 03:10:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 15e1fc9dc923.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 03:10:04 +0000
Received: from AM6P193CA0130.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::35)
 by DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Fri, 15 Oct
 2021 03:10:03 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::2d) by AM6P193CA0130.outlook.office365.com
 (2603:10a6:209:85::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:03 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 03:10:02 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 15 Oct
 2021 03:10:10 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:08 +0000
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
X-Inumbo-ID: 4df48ce2-e5af-461f-9ad0-efc45ad7a94c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBYPsV10Pj0YiSpLBJG2gkfU1JF6UmqHwHsJEG2dSnE=;
 b=9/IQHDAQ2/65X8zkD5HRpqevcFyN+aEBCJh59ZL1O0bRbgfYNm7wVBHhvUtkgNfpCO4am6cwqyesUWeVT9546QN+kK/MFSISs2dOvxU+dZyF2LaDyW0TGY+DnG9a34oK3TUh6EQZVW5fpGuWTRTtL2TzInsxRCE06z3/rGB8rBU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 56f31b58c5c0ad3c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExZIgGj0J7GndyddY97s09t8TxJoeQAUFPE6uwlJ9viwS5DnPPTLlKi+XTT+qe0k86ye+Ym9NnTe3DUhVeGtvb+9rIKAcOOnF+nEMU+fSxUz5k8mDtPr24+e8W6etg5qQBDugkGHplaBrGMzGk+3SeCcg4Bk30n5TQMABtCsdGo/ejhR/y1PWaBhUXQZLxNs7fOrXnu4BplXlfPLiwVLPzy9TFOEvs92aSzPfz8LgXi8jbYzmdKrJ7X5mhcAWe9IGhu4HsakVOvAkpKEMZ42h3A5gUl5BW+s+o4ItzQ3/pfrztF9O9PLjX1n8xlZyHCJMZMGeIn0WJcD2Cwto8ChCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBYPsV10Pj0YiSpLBJG2gkfU1JF6UmqHwHsJEG2dSnE=;
 b=I9QZRU0X2kso3zaJABqhlyH006eYgSc/AxB4KCu8Tqm4hPtH44TIhGrcesitArU11xCt19DlQ0+4hwXL95hxJs/zAkmgu4wF8JoUOJipdQanKvRV6v5iCbSLo/frLg9j37Q5r+P1HdbyHmERSWJahKeKG3jdglmVX9rBqwKkHysJ2MFf66ShcMhzD8GWAI5oTaK3SG7RpokrW8KNuaPK8OeidUwXAjb+Hz6efQPV0mOtGMVNdTBtUKrZwodsxDzN+DcfUmmAkFlwGMOSGnX1RgEtDCQRnBfeM7CcPFJS29yd0AMXLVftrkU+u7lKMGRJn6+iMiQMlIc7l7Wx3cTJJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBYPsV10Pj0YiSpLBJG2gkfU1JF6UmqHwHsJEG2dSnE=;
 b=9/IQHDAQ2/65X8zkD5HRpqevcFyN+aEBCJh59ZL1O0bRbgfYNm7wVBHhvUtkgNfpCO4am6cwqyesUWeVT9546QN+kK/MFSISs2dOvxU+dZyF2LaDyW0TGY+DnG9a34oK3TUh6EQZVW5fpGuWTRTtL2TzInsxRCE06z3/rGB8rBU=
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
CC: <Wei.Chen@arm.com>, <Bertrand.Marquis@arm.com>
Subject: [PATCH v2 0/6] direct-map memory map
Date: Fri, 15 Oct 2021 03:09:39 +0000
Message-ID: <20211015030945.2082898-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb88ae11-c27c-47f2-f486-08d98f894d04
X-MS-TrafficTypeDiagnostic: DB9PR08MB6857:|DB7PR08MB4588:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB4588DE507E33FAB09A764F45F7B99@DB7PR08MB4588.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 S4e32w94XA3ORPvlg+s0QisE69/1Lcg2VxNP/iCgTilXMl3Tkb74lsANOm1bXVaC8GWXJd8dbf9DKECAIY5w6KlJet5J6VjQYS127vW0c3a1dTala/GBZbGbI+f8FGk0BJWO6WXvwUTdhiUEcKWOfZAtIPKLgEbEiazEmFUadL9/vN5pi8reWBn/5+3VRzKkvB8BN1pJNEcTSLDE1AFMzbJWwi0DK1cTJUZZyP+xS4nO6jzjMVdySyj2d742fSM6RM0NI3tRGQN7Ts9uxSuw5BZToAnoqE1+KdP1ZZG39wUzsGWBka6vA2FxbJzmfXEzG0IQ86KjB+yGCETBc2djy2KsUBCNRC5Yi/MVK+EYaCLyM9wU/yVv9Pnq9or6N/w1bYqeyOIrAzqWqy6IeavHK9gfFzrymJ/Ir5OdMXvafbKyicL6m7yLjnYKbHFTO3hvTI9X2Pfw9zqfFC8XXhL9aUnkkUib7SPAcAR4Cz5pERk5k48IC5wdgUjcb/WVq7vN3wzS76lZUK9fV6t+Df7eoWejzqYcNaZ1wL1NCusKIDUrEf3Kie/M7mMhlckTBW9ya3g7C3T9uB/sKUM3knDmAt2YSCcyICEawwWOwTWCNEu2LgcB1j5qKxCksDVWmn+V4VAhbWJ/EdcK9dF0KigLm9oJgor76k6hn+MSCyWsQ0VdG4v6aj3tM3Mdt2fO9JeGGM2kuik2dXIgyQPm3O4mikPMnpkWC1SFotxwpInXRf7MPsc8HrutHi5f7r2Cq3OhopAUxeztMiG783OLc7EBb0mnsRF/15VB1LXozoJtvsKJBrWpvjfUz8h34K+JnEIVbcPm2XE/sT0+3GN/oL0U3YUhdFdDjr0BA5wgYThHq6E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70206006)(36860700001)(54906003)(1076003)(6666004)(4326008)(86362001)(47076005)(70586007)(36756003)(110136005)(2616005)(336012)(8676002)(316002)(508600001)(186003)(7696005)(44832011)(8936002)(5660300002)(83380400001)(82310400003)(426003)(26005)(356005)(81166007)(2906002)(966005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6857
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d96c6363-9f45-4c43-24bb-08d98f8947c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uE+WUx6uHPeY/tEu3usnKN2yB/NrozNDAO81PzhxifpenFZZm02WhwXdsl+Z3UwSOkYgKKAsPcGncD0Gf7VahFfz+2CMvg4fpv8MKnB7JW8YMsEzmOzIzwF+oEMonI89TRGXy2+oGaZya/KNZAiBBswoq8uN3XF9h/MSGc/t0B+doyp3huvc8ZGZ0vP6uaJt9lHNKsUjDOjV4nl7iu+xBBQUccxwylVdOfrviDPogs0bO5C7uvUDr857EzS4z+udJMMruKt18JxnYbz5DUMWS7Am/zIDUuDCF9DF81AiUZ4EmHm2ct4wsAVXewUub3R7Ls+bFVpT6oaDFqvZBFQsRqD7GY+Y1zn6oW7fbyIgQcv+lcEUy8ufc4fVSQJpZi3b58cdsin1m5JRiXVd9djkHKlcFGDBr3+0y8mA2rtqfFAlYgWiPPx5v3S19m8NPG0Un3AYtZOZS/V0tRLpIlkZxCGjobvm8AkxWc9TZeSnhKc1vzwEcGTg8fmGsFRQ23nOtbsaYkc2byUB823PzSB8RYlmn/q5j9PAqroYV6sqiqR5rtMpCJ47FHuvEm9xnfg5FjzkTvgx+TanqrEPMwaPXRMxmF0NRHmhAa7KNN9M0Fi5r8geh5AdzTL7kEzkTofBAPuOUooy2vWprlwwVx6CyDyOWkMV74vVLJuNplTNJu2pPlIdVZ95WyOgjjpGmWji+MUr8MsS9fxPuJoesf1ENKVpsFQDWydfoe75IldAAr2Pz1/nOLPYQrjiJ+igGhtGi6R9ZUnDsNqNoejR8tTOeGWJMS46lhJmw9GfF2S7jKdXnwk0ovmaaIA7+PiJqlOPgehxauaKUXrc01A1O6CEMw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(47076005)(82310400003)(8936002)(6666004)(1076003)(508600001)(4326008)(7696005)(2906002)(36756003)(70586007)(2616005)(70206006)(186003)(83380400001)(5660300002)(966005)(316002)(54906003)(44832011)(110136005)(8676002)(26005)(86362001)(336012)(81166007)(426003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 03:10:11.4008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb88ae11-c27c-47f2-f486-08d98f894d04
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4588

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

*WARNING:
Users should be aware that it is not always secure to assign a DMA-capable
device without IOMMU protection.
When the device is not protected by the IOMMU, the administrator should make
sure that:
 1. The device is assigned to a trusted guest.
 2. Users have additional security mechanism on the platform.

Requesting direct-map memory mapping for the domain, when IOMMU is absent from
the system or it is disabled (status = "disabled" in device tree), In which
case, "direct-map" property is added under the appropriate domain node.

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
https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00822.html

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

Stefano Stabellini (6):
  xen: introduce XEN_DOMCTL_CDF_directmap
  xen/arm: introduce direct-map for domUs
  xen/arm: if direct-map domain use native addresses for GICv2
  xen/arm: if direct-map domain use native addresses for GICv3
  xen/arm: if direct-map domain use native UART address and IRQ number
    for vPL011
  xen/docs: add a document to explain how to do passthrough without
    IOMMU

 docs/misc/arm/device-tree/booting.txt |  10 +
 docs/misc/arm/passthrough-noiommu.txt |  54 +++++
 xen/arch/arm/domain.c                 |   3 +-
 xen/arch/arm/domain_build.c           | 316 ++++++++++++++++++++------
 xen/arch/arm/vgic-v2.c                |  26 ++-
 xen/arch/arm/vgic-v3.c                |  20 +-
 xen/arch/arm/vgic/vgic-v2.c           |  27 ++-
 xen/arch/arm/vpl011.c                 |  54 ++++-
 xen/common/domain.c                   |   3 +-
 xen/include/asm-arm/domain.h          |   7 +-
 xen/include/asm-arm/new_vgic.h        |  10 +
 xen/include/asm-arm/vgic.h            |  12 +-
 xen/include/asm-arm/vpl011.h          |   2 +
 xen/include/public/domctl.h           |   4 +-
 14 files changed, 449 insertions(+), 99 deletions(-)
 create mode 100644 docs/misc/arm/passthrough-noiommu.txt

-- 
2.25.1


