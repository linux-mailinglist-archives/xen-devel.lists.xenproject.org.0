Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705BB47A44E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 06:22:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249404.429822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7X-00084g-LG; Mon, 20 Dec 2021 05:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249404.429822; Mon, 20 Dec 2021 05:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7X-0007xi-De; Mon, 20 Dec 2021 05:21:59 +0000
Received: by outflank-mailman (input) for mailman id 249404;
 Mon, 20 Dec 2021 05:21:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ajqg=RF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mzB7W-0007eH-1E
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 05:21:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bec83e5c-6154-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 06:21:55 +0100 (CET)
Received: from AS9P194CA0010.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::10)
 by VE1PR08MB5711.eurprd08.prod.outlook.com (2603:10a6:800:1ae::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Mon, 20 Dec
 2021 05:21:53 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::9c) by AS9P194CA0010.outlook.office365.com
 (2603:10a6:20b:46d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:21:52 +0000
Received: ("Tessian outbound 1cd1a01725a6:v110");
 Mon, 20 Dec 2021 05:21:52 +0000
Received: from 8e9c536f6494.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 637C877E-C4B1-46CF-8277-3D64D7876232.1; 
 Mon, 20 Dec 2021 05:21:45 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e9c536f6494.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 Dec 2021 05:21:45 +0000
Received: from DB8PR09CA0014.eurprd09.prod.outlook.com (2603:10a6:10:a0::27)
 by PA4PR08MB7387.eurprd08.prod.outlook.com (2603:10a6:102:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Mon, 20 Dec
 2021 05:21:44 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::3e) by DB8PR09CA0014.outlook.office365.com
 (2603:10a6:10:a0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:44 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:21:43 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 20 Dec
 2021 05:21:42 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:40 +0000
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
X-Inumbo-ID: bec83e5c-6154-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiySk4xA5Oqc3oS1dWNHaJuJFN9T1T0igsh/4hIN4eo=;
 b=1Hl/4qQUOvKzXUnj9tHA6xrTibo4VvEAyk6lzRan7UJpFJ4UUD2Yc+qbtGeATNz0BLljX+A8iKDOEn7KAzWGMcCDqL7QMWfC+XNXC3kyH4Aom2xI1WMG5nuUjGXzXbnIXjWM8057V5V5t4CvceNZOPuh0jcATNCaUOWYlTzKRXw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d936d5487e872fb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdSVI4isv318ixqlTIGFyaeEpoaM6T/Rb4aBiGl18QpL6FeR6V+7PZoFZfWO3RN3gDVEHOLCRe039/lQXRqrJwn/82rZK6d3vetKgKA6W17KJPjWYVyMnmL9ZnfrmixcwI1I8jg5CwA3Bf9hQBjbDmMbBMwDwRgQ86pj8OI56W8SZUQHMtOv18rpK03Ffwl5Dx2MWIkpIBsdMT7EAL75VqVGkjXm0gFwp5U6Ab5Jk9vBaQ9rv+jnnCskeoYMLwG47xN0IGrZHx2uFsqfGSuBV0vFJXbOn34V3SMwN0rbwvqVLKBajBlLNl86eBbPPqBwlXlj2WasGGHnqqteblFiPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiySk4xA5Oqc3oS1dWNHaJuJFN9T1T0igsh/4hIN4eo=;
 b=i4nlxq8jZCL28497QodJdJFSvjV48xe1WdGc6e3I55eUgUvsda6+HmhNYvDCWNajmE+H9l+1FXk2rzxluTswRQ2hGehih3YdV1AZJ20Ae+6+FoqBKE0tWpH/T9a84P+Qo9rumtvPkF0UN+Wi8Sr5MuTcjxo5ESDiyPWwmRHC47ER2L2jIfuT/Ajqr43Tx7O9a10s+doaB+ywsItHrEKfCu3MO9QKJmYvAyGlWasYI1o0Eg6ylTaVlrDvhqVWb9jd0h2uT/WHAraQ1spPOr+xq8gjf4nEnvVAJq8FleCCDDsQM/CiKCxI68LWcF6wLY1eRjnpIf34GMF5YrPVC0Hcfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiySk4xA5Oqc3oS1dWNHaJuJFN9T1T0igsh/4hIN4eo=;
 b=1Hl/4qQUOvKzXUnj9tHA6xrTibo4VvEAyk6lzRan7UJpFJ4UUD2Yc+qbtGeATNz0BLljX+A8iKDOEn7KAzWGMcCDqL7QMWfC+XNXC3kyH4Aom2xI1WMG5nuUjGXzXbnIXjWM8057V5V5t4CvceNZOPuh0jcATNCaUOWYlTzKRXw=
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
Subject: [PATCH v4 02/11] xen: introduce CDF_directmap
Date: Mon, 20 Dec 2021 05:21:14 +0000
Message-ID: <20211220052123.969876-3-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220052123.969876-1-penny.zheng@arm.com>
References: <20211220052123.969876-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 24063700-3c33-4182-a20f-08d9c378a1c4
X-MS-TrafficTypeDiagnostic:
	PA4PR08MB7387:EE_|AM5EUR03FT058:EE_|VE1PR08MB5711:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB57115A77B76F5777E2E18B46F77B9@VE1PR08MB5711.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:213;OLM:213;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dlT7MlLDfJ7fxFemb/DixGnFdNf5hAh84eby4G7OrwxDpwD+7djHEAhDZcUvc015JUIk73oCerAgXoNjXWuv7tYioQQSzYHbfwzYPv9VCX/PP7KdpWG/bqS5tn6OLO/VHmap+rUvu2s/RT3XBUFztroquxqieBKH7gLBl3VJJ36UUaG1mrmygLklmIPf5OgHtfvDJ1kpA5YqxJt1ijCuetv2diiP2uYseaX/lmpsBLbVQ9gYFQG15smb9LXemmiVKAQEqzi4r1FQUhda4ES8k+1kYWKFQ3r8n9I6g6ODl8xzpqRi6RxPcAOGV7Wk19epfwZ3wlc5C+r+U1bcdW1RmIj2soMrZchAwuCeLL+38nok5TylNMmWdrcrxvdAGnJQA79yzehgPtPe5fV8ACEL8RaiVDKiNURK56DyLeUvAddiRw/RiSWzblfzGRjDV4j53+vQQWzvE99PewZaq2cUMzi/R1bDvVVhs18ZCl29NEg9tM/PV3TNBLYgH4LKRHgag9tb1CWc2WiIPPG30GbJma1jiq9UTtfEZ3eJW1cVt9U3WMKgbgF52WRpZci0aiCta/eDR99Fyo3gR9COcnVEOFPdBjSqyeNaQ9Q6oU+14x5RdN+Vkswxh/QoBkQDthvpKcCSRJaxYUzgfVDMIZHc0j4alaHs53f+LFk54DIm73wbkZZI6q1vnc2aK48heh4oTPlgZCsr6JG+D7Rj8QA84DpAW2dY7XCCkW5IyHGtgAW3POL4+5Scb40XQ8FuCTkYgLgsLAuu81vaGEOqmc+tG9wf8Jgdcu3w2yU+XttSv7LYawlgXYaHVXava6B0F5JFLJNgouaRVkx38XTBWk2dRA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(336012)(54906003)(110136005)(316002)(8936002)(26005)(83380400001)(36860700001)(7696005)(186003)(36756003)(8676002)(70206006)(70586007)(44832011)(426003)(1076003)(2616005)(356005)(40460700001)(82310400004)(508600001)(86362001)(81166007)(4326008)(47076005)(6666004)(5660300002)(2906002)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7387
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f0424a7c-b615-4b5f-0271-08d9c3789c5a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G8sAh/27n143Id5t5DtdWSamDPeg1ef2Tb/QttDRJxmJNhPZQXoLlDRLRUruTfuDgoZMAJusnTCwi/QYDitNyt+4L4v349IMXIS+Y0eTyN3S0mr/Gtixx4qj1j7EbVY7MaFlrVq2KctAuN/xCiZ5qSbcLDHOdgnyBqNpkodDLkk5+nwFZCBwhL+tEpqfSWAjYLYgLoF3XRWtTojhY+Kz+GRFVFT6wUKmR/1EkypXYgHY+9EWKJrsV1UH7SUYVZoh7OlN6xdnJ6UJzoBDJy74KEOJVrLg0YcjM7jwWPKNcUJef5pWQOggdpspNxnVwujCyYc6p8/HCW7n+yQlMLmn4IaxtAohkZCwcdVwhNIjDzBSFLcFclEaLH1pXc9ZbC1/WG39QMyoTbby0MXx7UpKvWypCbSd+BPIKBAKTMHgZsahEPdkrmgdYmDKIZNwcF2ojzuljICPWphmoImFuclwauiiuBQMqC5XpxYehJSm9o9qDE+hu0wu5cdZLsH0Y3dy7+TrUHSvUEksrOvKnB8BFXtPb9Wj+dZBJaBE5D67vQpuMI1QUI20H8WEq9CLz2+OilTnVQXEnjm0ZCvB4l6oVJv4RE4wUBUEp+LcDLLBwxXC5E9hTLW5oxpZdVQqS6mohUIbncTjVYSECBjrW8PUPW86T2VYvu3i5eVys38o+BZUjZwzwFGl0CWJBfBwkgfi52KMtLP/HyKuMtGh1LUPNq2d1d/FpnCgbv1eDnT9DY4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(81166007)(83380400001)(5660300002)(26005)(186003)(36756003)(508600001)(8936002)(8676002)(54906003)(316002)(82310400004)(86362001)(110136005)(2906002)(2616005)(1076003)(7696005)(6666004)(426003)(336012)(70206006)(70586007)(4326008)(36860700001)(44832011)(47076005)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 05:21:52.6208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24063700-3c33-4182-a20f-08d9c378a1c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5711

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

This commit introduces a new arm-specific flag CDF_directmap to specify
that a domain should have its memory direct-map(guest physical address
== physical address) at domain creation.

Also, add a directmap flag under struct arch_domain and use it to
reimplement is_domain_direct_mapped.

For now, direct-map is only available when statically allocated memory is
used for the domain, that is, "xen,static-mem" must be also defined in the
domain configuration.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v2 changes
- remove the introduce of internal flag
- remove flag direct_map since we already store this flag in d->options
- Refine is_domain_direct_mapped to check whether the flag
XEN_DOMCTL_CDF_directmap is set
- reword "1:1 direct-map" to just "direct-map"
---
v3 changes
- move flag back to xen/include/xen/domain.h, to let it be only available for
domain created by XEN.
- name it with extra "INTERNAL" and add comments to warn developers not
to accidently use its bitfield when introducing new XEN_DOMCTL_CDF_xxx flag.
- reject this flag in x86'es arch_sanitise_domain_config()
---
v4 changes
- introduce new internal flag CDF_directmap
- add a directmap flag under struct arch_domain and use it to
reimplement is_domain_direct_mapped.
- expand arch_domain_create to include internal-only parameter "const unsigned
int flags" for domain creation
---
 docs/misc/arm/device-tree/booting.txt |  6 ++++++
 xen/arch/arm/domain.c                 |  5 ++++-
 xen/arch/arm/domain_build.c           | 14 ++++++++++++--
 xen/arch/arm/include/asm/domain.h     |  5 +++--
 xen/arch/x86/domain.c                 |  3 ++-
 xen/common/domain.c                   |  2 +-
 xen/include/xen/domain.h              |  5 ++++-
 7 files changed, 32 insertions(+), 8 deletions(-)

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
 
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 92a6c509e5..fa18dfa544 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -692,7 +692,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 }
 
 int arch_domain_create(struct domain *d,
-                       struct xen_domctl_createdomain *config)
+                       struct xen_domctl_createdomain *config,
+                       const unsigned int flags)
 {
     int rc, count = 0;
 
@@ -708,6 +709,8 @@ int arch_domain_create(struct domain *d,
     ioreq_domain_init(d);
 #endif
 
+    d->arch.directmap = flags & CDF_directmap;
+
     /* p2m_init relies on some value initialized by the IOMMU subsystem */
     if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
         goto fail;
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 0fab8604de..9b1a5e38d3 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3029,10 +3029,20 @@ void __init create_domUs(void)
             .max_maptrack_frames = -1,
             .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
         };
+        unsigned int flags = 0U;
 
         if ( !dt_device_is_compatible(node, "xen,domain") )
             continue;
 
+        if ( dt_property_read_bool(node, "direct-map") )
+        {
+            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) )
+                panic("direct-map is not valid for domain %s without CONFIG_STATIC_MEMORY\n",
+                      dt_node_name(node));
+
+            flags |= CDF_directmap;
+        }
+
         if ( !dt_property_read_u32(node, "cpus", &d_cfg.max_vcpus) )
             panic("Missing property 'cpus' for domain %s\n",
                   dt_node_name(node));
@@ -3058,7 +3068,7 @@ void __init create_domUs(void)
          * very important to use the pre-increment operator to call
          * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
          */
-        d = domain_create(++max_init_domid, &d_cfg, 0);
+        d = domain_create(++max_init_domid, &d_cfg, flags);
         if ( IS_ERR(d) )
             panic("Error creating domain %s\n", dt_node_name(node));
 
@@ -3160,7 +3170,7 @@ void __init create_dom0(void)
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
-    dom0 = domain_create(0, &dom0_cfg, CDF_privileged);
+    dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
     if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
         panic("Error creating domain 0\n");
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 9b3647587a..cb37ce89ec 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -29,8 +29,7 @@ enum domain_type {
 #define is_64bit_domain(d) (0)
 #endif
 
-/* The hardware domain has always its memory direct mapped. */
-#define is_domain_direct_mapped(d) is_hardware_domain(d)
+#define is_domain_direct_mapped(d) (d->arch.directmap)
 
 struct vtimer {
     struct vcpu *v;
@@ -89,6 +88,8 @@ struct arch_domain
 #ifdef CONFIG_TEE
     void *tee;
 #endif
+
+    bool directmap;
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ef1812dc14..f6de7a9697 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -722,7 +722,8 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
 }
 
 int arch_domain_create(struct domain *d,
-                       struct xen_domctl_createdomain *config)
+                       struct xen_domctl_createdomain *config,
+                       const unsigned int flags)
 {
     bool paging_initialised = false;
     uint32_t emflags;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 023c89c0ea..c9bcd77e00 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -659,7 +659,7 @@ struct domain *domain_create(domid_t domid,
         radix_tree_init(&d->pirq_tree);
     }
 
-    if ( (err = arch_domain_create(d, config)) != 0 )
+    if ( (err = arch_domain_create(d, config, flags)) != 0 )
         goto fail;
     init_status |= INIT_arch;
 
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index cfb0b47f13..2f1e172957 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -31,6 +31,8 @@ void arch_get_domain_info(const struct domain *d,
 /* CDF_* constant. Internal flags for domain creation. */
 /* Is this a privileged domain? */
 #define CDF_privileged           (1U << 0)
+/* Should domain memory be directly mapped? */
+#define CDF_directmap            (1U << 1)
 
 /*
  * Arch-specifics.
@@ -65,7 +67,8 @@ int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
 void unmap_vcpu_info(struct vcpu *v);
 
 int arch_domain_create(struct domain *d,
-                       struct xen_domctl_createdomain *config);
+                       struct xen_domctl_createdomain *config,
+                       const unsigned int flags);
 
 void arch_domain_destroy(struct domain *d);
 
-- 
2.25.1


