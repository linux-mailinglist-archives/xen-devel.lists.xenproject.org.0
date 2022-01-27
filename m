Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B98449DBE9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 08:50:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261213.452029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYI-0008PR-7E; Thu, 27 Jan 2022 07:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261213.452029; Thu, 27 Jan 2022 07:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYI-0008Mo-3v; Thu, 27 Jan 2022 07:50:42 +0000
Received: by outflank-mailman (input) for mailman id 261213;
 Thu, 27 Jan 2022 07:50:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4dm=SL=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nCzYF-0008Mi-S5
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 07:50:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0822797-7f45-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 08:50:37 +0100 (CET)
Received: from AS9PR06CA0094.eurprd06.prod.outlook.com (2603:10a6:20b:465::7)
 by AM0PR08MB5345.eurprd08.prod.outlook.com (2603:10a6:208:18c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 07:50:35 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::a4) by AS9PR06CA0094.outlook.office365.com
 (2603:10a6:20b:465::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:35 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Thu, 27 Jan 2022 07:50:35 +0000
Received: from c467bad0aed4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 95CEA543-40F1-4CAE-B94F-1557D69121F8.1; 
 Thu, 27 Jan 2022 07:50:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c467bad0aed4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 07:50:28 +0000
Received: from AM6PR02CA0028.eurprd02.prod.outlook.com (2603:10a6:20b:6e::41)
 by GV1PR08MB7362.eurprd08.prod.outlook.com (2603:10a6:150:21::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 07:50:26 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::1d) by AM6PR02CA0028.outlook.office365.com
 (2603:10a6:20b:6e::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:26 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:25 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 27 Jan
 2022 07:50:24 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:23 +0000
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
X-Inumbo-ID: d0822797-7f45-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl/oq/OhINQflcQxakZqHEFozc0DjfnQy8kM1QkqYqI=;
 b=zBDjdKVpHSvcn11VcX76fceRM6n0t3CEZKEIJSRQapknxjTeF7ul7fIAJ2ziJFMEI+5DwZsLei+QGaIQeNqai/rYF35Ob0gOe3YI8AaUqVjbXwIx9qMESff2ki3zLcrMCNVnoGGWL6jYbX3+xVu8sxZ9F4KX2iPGwXZxYxsOAC8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7507fe5ac9449d5c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEpK3yrXn1NGO3189xEanHO2lwGniz+qKfjSIwazCzkwS7atRmTjqeNO8EyOGUY2VBP4xIrZ7hwIG0L9z43XdYNZrjZU1yIYKt4j0Xgdod1qmC+6wzho80UQqYNm9UKdU0M+x6p0GGIno+NrRrjW3wBycTij7qF2JwatEzcumOQdfSxioj83aIggNke2KA1jPTI5kFjzpU5uTeOMFTiBFkGrNDRYPxwtdvSKRl/aDLrRgCl9yhiUkNDkKqD1mm/iiBlCMcb6BvSjCM7JRo7LIxKuQiGJ4UHVo3CvJYgcjt10p/Z09CLjXn46YSxm4bq48e6SCd2JF76Q8pZ2++wB9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jl/oq/OhINQflcQxakZqHEFozc0DjfnQy8kM1QkqYqI=;
 b=hYONK/2PNWFPwnKv45E4QJdd2DjhZA4d3/Mym1DL/ZB+IaTVx3BmswuV1qwzz9BxF+N/hSGPWivNflJ8rz+/J4WAlqgUu2YxCokZdcvveP6jnmWKxM/pAMt2NzCXYvHsbYFZOw+Liu2pq40XcSZfq/2i/wymWjKeXa+xZWACFl6eZSDp4k+BRFL/Hsl/Ubn+ik5gZrfWwx5Fd0ERxB5enECGULjliogcCmQ27pgJPg7vHjkVR9W9n+N4flsi8AUVXmXvntuJWoCimxb2pBLW3T6wOZP14C9B0Cbb+1s3mE64hHzLoRtIzZeC2jIr8Nm4m75O2zNbr4qeddvlsMIISA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl/oq/OhINQflcQxakZqHEFozc0DjfnQy8kM1QkqYqI=;
 b=zBDjdKVpHSvcn11VcX76fceRM6n0t3CEZKEIJSRQapknxjTeF7ul7fIAJ2ziJFMEI+5DwZsLei+QGaIQeNqai/rYF35Ob0gOe3YI8AaUqVjbXwIx9qMESff2ki3zLcrMCNVnoGGWL6jYbX3+xVu8sxZ9F4KX2iPGwXZxYxsOAC8=
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
Subject: [PATCH v5 00/11] direct-map memory map
Date: Thu, 27 Jan 2022 07:49:18 +0000
Message-ID: <20220127074929.502885-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: dfa00458-766c-4875-5f59-08d9e169b3c0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB7362:EE_|AM5EUR03FT038:EE_|AM0PR08MB5345:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5345EC25935FBA6F03B6D92CF7219@AM0PR08MB5345.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jFydzVW6AHa+WsFcAOYp/2Oxj1J7E99osbKus5rCkr50eWO54N3o6/T6+m76tj9NNfnriRVeluAIWrlu7PmMTOtqR8hgABzr4kxYqSM9sJk6VeVncaur4c+HIZpkLl+dRzRNEaR8m4jrHGkl0B4uxt5rjAfvvDg1OnIDS0QFh75EwgziCtUn5LcklnqiWj+kud/Hi5i8ZVrjUsw6Pu/Renf8efoKL2KfF97EN96s2Nq9VIM0BWCMywfxK0Dn1KNK85ciQJHYwqcWGOVRf4OuvECNEnxOqC9gnsYoreiEs0lS3crPFQcIf1MWySq5SU3nYrcb2s/hFA0gw826V8MUJHY8VEaeEFxwGAkeDieqDplL0SbleUmRvxsR0b1ATzdEZL39RJf23/2MFogdA4PxNRkFHc5WfxbOUlbVOosSjnsuZg0NHK5UXyr1iPGZA3biU58GdAwm+eFjV9HR41i6/PXcBtFscHyAa4RkAjc1/S8KH3HiBAwpi0GR68Dl2OnDthOL7RIYu55K+htEBrkhVQ8MDHJPpsVlWbXvPM0F9qXIMc6zlaBtYrnBNa/65UVCgWHld+Ba1YxJOGRAsxJqz+WGeFxaoJMIYe5Be0bCmSwHhXZc062DSRbmVyKK/B5DV7mCJ0jXSVXRka1WmF0+Gx7IP29020eIAc7SdtHalOCai3lB6bLx5RzaO5kmX81S9jiyvoDmZjCVzr90zR+mPYTcrlZdQrLIpCVnZExhUxR0J8gMYH7lmEKxcdQBhVL2aUxdXLpLOXewXw4Bn8egLb5vwMX8mSk9tuqT/Y/PxC2T2Tga7dCBJezAHiS3ISKgWfDVQ4p5TgVlEVzGYi21ukiPaTrocElU7EXUvPwHb7Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(110136005)(36860700001)(316002)(54906003)(70586007)(70206006)(82310400004)(356005)(81166007)(5660300002)(186003)(1076003)(2616005)(44832011)(508600001)(966005)(7696005)(6666004)(2906002)(47076005)(26005)(40460700003)(8936002)(83380400001)(4326008)(8676002)(336012)(426003)(86362001)(36756003)(21314003)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7362
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba8e2949-c5aa-4792-a8df-08d9e169ae2e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qYlVhN+JK8ijSzOZF1N+3G7n+kVjLdjz4/6jUdPp5aFHLdO/P1pBUGmPMV2RQDqF82/+Zz56I0EJqZvLgXqXSGtqVrdOrQUntQcu6qDRJ4WQpvbtsGnOHMbG4GrDBqQc+6pCUkjJZ8QY7zOZz+hpD4vfq5PpJ/jNBW271fpdeoW1HteyV9zShIctYSum8FcOMKNYfzR+VT8j1Dzqxtx1v98ESVvIZ1ARrBmNUJm9uE+VF7TBq3LLob0nquHY6ZeXDhuRLNJ8lcTnO3uKtYbcs+J6sYtrnnJZqOClmKHVGSK7zMFL/hvHUkq+gIdsC3c0oQ5BrPzW8aXb+qvNe8AxjfWl1TMvHhWow72mxwkHDixNVO86S9//ZoD1Ae6G9UK50p/ay5vsGHv6jk/sasRIMspm1Z1ehcGc4qRGOcQH1JPG7PCfnwWsiwQYSRIEdHRDMJPo3AoGyk7l+LwCKQMa/IbXe5BiYmNBIWKAEFjmKO9XAW/gdmjdfC/NjZemIbU5Y3GwGRavDcPgbnI0wypxCUvNMSY8LxaHfdxH0devKuKDMNTfgikISfLnWfP22Y5wBxIqvJqM80necl2EFDGx/RTukAxiU3lMU2qqJEk9eN0SJrw/kCODoqtDY6SKXqHEmzI12c3W25v70CJ+Vl81vClzeIY2Wmn1kkZ3irxhmaasCkJTzPGCKOcArFcyL4199ArmCINivjjuss/EQJO3Mb9/mfO0sNnpKi+1KehG2HNHxGny2ItAb6eLo8GFkOIk2eDLbYts0P8mjRWtxVywHIR05JhmM3arG6t/0GtYm2jsts5K9tYxxFKS6j6YE4widQFkygW2RVv78S6LffkMxA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(4326008)(82310400004)(8936002)(8676002)(44832011)(110136005)(70206006)(36860700001)(47076005)(70586007)(54906003)(81166007)(5660300002)(86362001)(36756003)(6666004)(83380400001)(7696005)(508600001)(336012)(2906002)(2616005)(1076003)(426003)(186003)(316002)(26005)(40460700003)(966005)(21314003)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:50:35.2621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa00458-766c-4875-5f59-08d9e169b3c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5345

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
v5 changes:
- remove const constraint and strict "static allocation" check
- fix coding style
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


