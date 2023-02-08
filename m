Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA7468EE7E
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 13:06:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491726.761041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjDQ-0007gF-EK; Wed, 08 Feb 2023 12:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491726.761041; Wed, 08 Feb 2023 12:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjDQ-0007c6-4q; Wed, 08 Feb 2023 12:06:20 +0000
Received: by outflank-mailman (input) for mailman id 491726;
 Wed, 08 Feb 2023 12:06:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3BG=6E=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pPjDO-0005Yt-E0
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 12:06:18 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fccd4b8a-a7a8-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 13:06:16 +0100 (CET)
Received: from MW4P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::27)
 by MN0PR12MB6293.namprd12.prod.outlook.com (2603:10b6:208:3c2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Wed, 8 Feb
 2023 12:06:13 +0000
Received: from CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::1f) by MW4P223CA0022.outlook.office365.com
 (2603:10b6:303:80::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36 via Frontend
 Transport; Wed, 8 Feb 2023 12:06:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT103.mail.protection.outlook.com (10.13.174.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.16 via Frontend Transport; Wed, 8 Feb 2023 12:06:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 06:06:10 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 06:06:10 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 8 Feb 2023 06:06:08 -0600
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
X-Inumbo-ID: fccd4b8a-a7a8-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdLENqq37b9ZYS3K+BNukeD6w/d9RlR0+JxnIuDsvpZHVWYahTxZAzqgphCTZLOzdpFbXAp8ZwB2ZcROhhebuVSHu/i9Q8IwabjeEntX+DHHD+U8igBqUE8onbNuFdoP4iG7mUGEY719BflVBpg3VIMHhYoghlrjMLIPyDOYKqwwcFma7oUK1J8nhiiCxN23I0NCJZgDLSeN1vm+cZqU4/nsXlGnaw0RMN4bJT9Jwj5nzeGMBeoguWT7VsrY/hLh9J3SgAM4xgK7fX0siyIJutXVttIFtgYTIhaWcgRNAjGYshVuB2q9vj7CtJGKIGyOwBKA6/YRdjVar5MqkBvjiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgrLGCe1IsqVgkkGPjJAA41OS8EEq9GuzCIZagEB9xo=;
 b=kya3y9szk6te3w8BCWZ/VLhZ2QdBvR4NlX1gQSWE9jbvh27QM3A3apwxO0gXWpxvs60fSGeB0mRP2mn3kebBtGoBH4S62GQ/q+b/tvNoM1mWNjWSCaP8H65fjn1A1QPMeEtCO0RWXPftYBY6DNveFXjKUBaBkvn0NRyxhvAnxP+y09JtlRn/kfqt/NnbN0JDLmWIUI3r32Kc6FvQiKiuq7yc2s8CxKpUfWwNsQu0P6tdWMF1T+3jBQQVnHSgozHU0LECByJP1SiTttF3zOF5uVIgEtICnv4cBNnZ/pSjNRKVlWzSWkGmyhKDZ1etcfUTpFaRRBufYJrKb3AvEMyqiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgrLGCe1IsqVgkkGPjJAA41OS8EEq9GuzCIZagEB9xo=;
 b=a8XaQJqbRgWKD8Ol06vHLGOtYU7D0zMphxDmtznMbRlo3jg07T2BBuoEg4Z0u2jTSc08mB6myZB6sdn9WuEzMWRgv8QfgqVwNo8ToY4fGpY2RqDkiEtX4Hl9XmIh3MSklbn+HSeY3upChd7G1ayu27Ie+9NcoM3q5UmB7fsg5VI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v3 7/9] xen/arm: guest_walk: LPAE specific bits should be enclosed within "ifndef CONFIG_ARM_PA_32"
Date: Wed, 8 Feb 2023 12:05:27 +0000
Message-ID: <20230208120529.22313-8-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT103:EE_|MN0PR12MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4f4065-f167-4b38-1f25-08db09ccdf62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a3D7XVw8xXkZxZS1H1ZxfEfHJU4ZzptkepB6BD4RMIy/T+s7FSO7PWc03nIdzERBVeEq6LQ0gHLPZbR1329iX6yJG9eYkrRss+J2ZfCjtIB3cM3Qp3GxxOU+dhJnbuJ3CST/FNZRrMUSk6DoQapUxj4dNAFl6I7qpFVcJyPhzH+n9kKOxSnu7bwKg7gCJOQ4AS1ysj7a2t6tAGRQ4g1iA1h50RRzsULdLdeiin435tlP7c1nxPEUo3O6qJRH7waRRZAuB9cRhdXUzozVPAE/AF6WExUevdgjOGjqk43xT7k0Y+MAeUymdd7FJV69Xty3AJzenK8UICyKoe99X3LL9JEpWQhqlpQRimXr0Tg0GzjUfh6zrpIdrizo0d5jl4oJ5vE1Hgek1bTvKdnO+NCIw0au9dkvKV6mpdMYFt7wxcpUrZCDiRbjIiadjPSLbQG1iPavDLcQW/aEMsYcK1NFQAMPtToDCEsZbc27lh792oFU0w5eklu0u8bn7I0z7HVJVxQajN0h8OY3ye8vqzwccj1CPKWOJ+5SwZxEB0ySATf5y0hOoJszNGsVhmb3TjpYSXhgnSdUFALaVckfmAsHPqL5o7tSevHk/CvN7NxCedS4l2Eq0XVFdmdrbUukBJ/bKgjk6T6Ky1PKhG9u425N7mBacmkYP/epQMwMXgeT/yDikw0Fhfk79qwcnWm+3r0IAB3U+xLX10MWlwQMfSitIhBu/hhi/NnSZz/YjnSL0WI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199018)(40470700004)(36840700001)(46966006)(316002)(54906003)(83380400001)(36860700001)(103116003)(336012)(40480700001)(426003)(47076005)(81166007)(86362001)(356005)(82310400005)(82740400003)(26005)(1076003)(40460700003)(2616005)(36756003)(6666004)(7416002)(478600001)(186003)(5660300002)(41300700001)(2906002)(8936002)(6916009)(8676002)(70206006)(4326008)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 12:06:12.7379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4f4065-f167-4b38-1f25-08db09ccdf62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6293

In the subsequent patch, we introduce "CONFIG_ARM_PA_32" to support
32 bit physical addresses. Thus, the code specific to
"Large Physical Address Extension" (ie LPAE) should be enclosed within
"ifndef CONFIG_ARM_PA_32".

Refer xen/arch/arm/include/asm/short-desc.h, "short_desc_l1_supersec_t"
unsigned int extbase1:4;    /* Extended base address, PA[35:32] */
unsigned int extbase2:4;    /* Extended base address, PA[39:36] */

Thus, extbase1 and extbase2 are not valid when 32 bit physical addresses
are supported.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from -
v1 - 1. Extracted from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".

v2 - 1. Reordered this patch so that it appears after CONFIG_ARM_PA_32 is
introduced (in 6/9).

 xen/arch/arm/guest_walk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
index 43d3215304..0feb7b76ec 100644
--- a/xen/arch/arm/guest_walk.c
+++ b/xen/arch/arm/guest_walk.c
@@ -154,8 +154,10 @@ static bool guest_walk_sd(const struct vcpu *v,
             mask = (1ULL << L1DESC_SUPERSECTION_SHIFT) - 1;
             *ipa = gva & mask;
             *ipa |= (paddr_t)(pte.supersec.base) << L1DESC_SUPERSECTION_SHIFT;
+#ifndef CONFIG_ARM_PA_32
             *ipa |= (paddr_t)(pte.supersec.extbase1) << L1DESC_SUPERSECTION_EXT_BASE1_SHIFT;
             *ipa |= (paddr_t)(pte.supersec.extbase2) << L1DESC_SUPERSECTION_EXT_BASE2_SHIFT;
+#endif /* CONFIG_ARM_PA_32 */
         }
 
         /* Set permissions so that the caller can check the flags by herself. */
-- 
2.17.1


