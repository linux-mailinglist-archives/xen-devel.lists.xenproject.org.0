Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C16F0504E3C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 11:09:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307062.522348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNO1-0000IV-Rt; Mon, 18 Apr 2022 09:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307062.522348; Mon, 18 Apr 2022 09:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNO1-0000Ff-Mq; Mon, 18 Apr 2022 09:09:33 +0000
Received: by outflank-mailman (input) for mailman id 307062;
 Mon, 18 Apr 2022 09:09:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mice=U4=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ngNNz-0006ub-Mg
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 09:09:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4158a990-bef7-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 11:09:30 +0200 (CEST)
Received: from DB9PR02CA0004.eurprd02.prod.outlook.com (2603:10a6:10:1d9::9)
 by AM6PR08MB3016.eurprd08.prod.outlook.com (2603:10a6:209:44::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 09:09:27 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::ac) by DB9PR02CA0004.outlook.office365.com
 (2603:10a6:10:1d9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:09:27 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Mon, 18 Apr 2022 09:09:27 +0000
Received: from e5a766ff2263.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5E91799F-258E-49D9-A7AF-0C51ED3A79AF.1; 
 Mon, 18 Apr 2022 09:09:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e5a766ff2263.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Apr 2022 09:09:21 +0000
Received: from AM6PR0502CA0058.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::35) by PR3PR08MB5867.eurprd08.prod.outlook.com
 (2603:10a6:102:87::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 09:09:19 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::e) by AM6PR0502CA0058.outlook.office365.com
 (2603:10a6:20b:56::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.21 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:18 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:09:18 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 18 Apr
 2022 09:09:15 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:12 +0000
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
X-Inumbo-ID: 4158a990-bef7-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7upcQINO9FI5IlOhkk4nMfwI1rBCpr+XywVNSPgYPn8=;
 b=PIM8W0tLp9LpyVtpY0MQOwvdwEv7drh56TbvkwFuYs8nqi6VxplHfstgEaDA2var/kCF7COufc9CLilQ51SITm4drV/fpgTLwYkQQAMg5Qvbh/jshqss8N8iPXOaL55bPIAbhkfIYT1ZSKU03FRj1KnUP0sjK3UEgXCxrDjzoNk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b47319d808b60900
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/waVCtOtUlgsNeY60R1HtvU2s+XbInCZMbzhOgNGN8RTUBoUChExhGoUOCqviiXsVLw8GDEZTf/XcCUSqJd7hvOagX7pROMs6SaL5EilFu3jMHdEYOxDNrxiJmqlI0oaUhrJGWCdmIrljIhiHo7JXYvlCi7hn5DWaO5Vz8ekN1fSnscW0rsIImeuwJUlWxUpxtTvv0laPi0OSL3NIDfesYbp8jEiefXSqK+02+uVDIg7QZgFY68YFAJbw/ucpp+nmUVOhuhpQ4xhtlz2Qz+BgCWnbGlVx8KzjeM83DcYTPX+bdCt/Su3cHrtgGq6nTG4Rufz/2ZWszghx2CLUxcDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7upcQINO9FI5IlOhkk4nMfwI1rBCpr+XywVNSPgYPn8=;
 b=i8I/WeOTBLWOe2Zk5wdWS7jNQhMaHBtCAyXVa/V01hOt3KedOJrNQ3Ey7ro0M2ZymrkjK/H6vgSfPdGyOyk3Wayd91byreeyyWrIN4PMWz/UzRv2zfqS5HkeDxnK5cHWpUWL/hAURNLdw26Jb8IPuigOY4Io+sy435rIXlQPt41e4rytwuIbuXG0iNsibOmVRZXxt9V6U02RWonYdNl+72pTbZXBSS1LjgrZzDQ6aFVO1D7iWEsdNRu/QNDwf8aBkrW/CwO0fmPTGZ0JMjXYPShVltsbVYJU3NIZcwb5xoqBz72vgP5WTD3J1O27d7qOElYWksCjB0UumxfAuY5saQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7upcQINO9FI5IlOhkk4nMfwI1rBCpr+XywVNSPgYPn8=;
 b=PIM8W0tLp9LpyVtpY0MQOwvdwEv7drh56TbvkwFuYs8nqi6VxplHfstgEaDA2var/kCF7COufc9CLilQ51SITm4drV/fpgTLwYkQQAMg5Qvbh/jshqss8N8iPXOaL55bPIAbhkfIYT1ZSKU03FRj1KnUP0sjK3UEgXCxrDjzoNk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <--to=xen-devel@lists.xenproject.org>, <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 06/10] xen: introduce an arch helper for default dma zone status
Date: Mon, 18 Apr 2022 17:07:31 +0800
Message-ID: <20220418090735.3940393-7-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418090735.3940393-1-wei.chen@arm.com>
References: <20220418090735.3940393-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 33871645-af97-441c-446a-08da211b23b3
X-MS-TrafficTypeDiagnostic:
	PR3PR08MB5867:EE_|DB5EUR03FT043:EE_|AM6PR08MB3016:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3016F7CB6F4A528DDB5E3BBC9EF39@AM6PR08MB3016.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 u2ou5bKMLU+wCecp/60EdU9X2Sc35AAL11VfPoZDhUfTeC+KgweShRK7lt3mMiwJJXRYxTVFvNkMtmtKO+pr307wYvcLYnnmknUeKHd9oodcK2uEJGAJn9uyPOT74tuz6ZS3j5IJX4YfdgCu8n8sAxFZ2XfAlWD+mLEwH4Mr+XZkPuzvBP4Ucpp75pDpwgyO8nbSyjCCfKA0cAj+WBw4lq6QDif6fke8nSNdhpZ6O6WPwiiZZTxfD2g4QPmnwVJZFeQeGuOSS7Xkiu/DNaOQPV+RuowTGk33Kw7p24axDddBEFwRjzBUNukj6KO/MXiodi2a75hFzAEDjtHQ02kh83cS7KacB59ne2BHy9kKdO1NCDTMq+PvlIpPKmwxeo6qkiISt442E8XUGDYvZqy+Q08SJDJ/tQJoy5zFQzPWRlMBIIkfPWyO+6qGA3pnC2fVg5Sw5HD9QqKJ/RcKiIB/cT+PDmlLVbGNzph+D0KNCQqu6KS9VDYbFF+b58ke9Kf73/cXfD185ympTsW3jD7ZcuExfqMQMX77uKxLCciSpeL899aKtA3kd3GVYUKt9Kk90V3tM2jgn3esdlYT9BcrrjKeegzU2zTOVauSxzLjxB6VyCLYYrydlgycMFfUZU9E0DSHMQgs+BPyOnV/9bl6WsVaa31WFzqBgIkdjY+ANBDVfEp4lDdqI+QVnqWXBWCADqP+2hbftjRIrDrApvuqcg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(81166007)(356005)(7696005)(86362001)(426003)(2616005)(1076003)(6666004)(47076005)(336012)(186003)(8936002)(4326008)(8676002)(36860700001)(26005)(83380400001)(44832011)(7416002)(70206006)(70586007)(5660300002)(36756003)(82310400005)(2906002)(110136005)(54906003)(316002)(40460700003)(508600001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5867
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5f895dc0-e219-4c8f-c810-08da211b1eaa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dHgqf7KBYEt5JNj8G/kREUDoEGqf9/XCzpQbEhsio9Vxvw/bi2NeRPPyc9L7cJ4Rzb23haAUWWV88AyQONxEDLEVvniHtx5CiRvd7dXBBF6l5sasMjdgN4dQDScJ66wbMZY5JhDZO5s2mOtYN7aw2Pol+HLa6jUL8/J22J/7Axer899nKegkxRMaaD4CZbr+b2bJ5SStk4ueP7n3+FU1KQEHHWAym49Jra0mq4TlW/Fd3bPe1hmJjge2Jzpb1WrYX8YIDkq+tV/qEOX7YKNnEYKUZJEI6xLNcvn+RrObYYLSkWeUMsrT1sGTk+0dpMAi9wjqKFKueEdzu8VP1Nod0kucNIY7eXl7+aVwX5WadnQHQa67qomnscLxKlSSiSVnWBpCmhReY+6PIMRVs5g1Ua+lF+/nsf0igC6SBWIxqumPMde1ZQIBPH4k0y2TvuxVOJ01ywBnY4/YhCAVuqqP+8MeUMctQ2/olhwiyRNIZEOr5+aePnF1PXzCYI9vYlqUB/OVVwF6T0CymlErZv/USN8LsX/VKPvQqearozFUwnxDy7o2rgcGo5hvMQkEHvQyFJSPrTSPANNGIonM36sfHXzQXFcWN95j7LBrRalVWy7Ps73sd/o1lXqa4rrLSURtadeBDMWjAzW8px61CJZ3JCa1b6sVawF6BG9QJJBLRLoMCm8M3s1ikd1x2lDiD6Tq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(186003)(7696005)(336012)(426003)(5660300002)(44832011)(47076005)(2906002)(508600001)(86362001)(107886003)(1076003)(2616005)(26005)(8936002)(316002)(82310400005)(6666004)(81166007)(54906003)(110136005)(8676002)(450100002)(4326008)(70206006)(70586007)(40460700003)(83380400001)(36756003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 09:09:27.2974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33871645-af97-441c-446a-08da211b23b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3016

In current code, when Xen is running in a multiple nodes
NUMA system, it will set dma_bitsize in end_boot_allocator
to reserve some low address memory as DMA zone.

There are some x86 implications in the implementation.
Because on x86, memory starts from 0. On a multiple-nodes
NUMA system, if a single node contains the majority or all
of the DMA memory, x86 prefers to give out memory from
non-local allocations rather than exhausting the DMA memory
ranges. Hence x86 uses dma_bitsize to set aside some largely
arbitrary amount of memory for DMA zone. The allocations
from DMA zone would happen only after exhausting all other
nodes' memory.

But the implications are not shared across all architectures.
For example, Arm cannot guarantee the availability of memory
below a certain boundary for DMA limited-capability devices
either. But currently, Arm doesn't need a reserved DMA zone
in Xen. Because there is no DMA device in Xen. And for guests,
Xen Arm only allows Dom0 to have DMA operations without IOMMU.
Xen will try to allocate memory under 4GB or memory range that
is limited by dma_bitsize for Dom0 in boot time. For DomU, even
Xen can passthrough devices to DomU without IOMMU, but Xen Arm
doesn't guarantee their DMA operations. So, Xen Arm doesn't
need a reserved DMA zone to provide DMA memory for guests.

In this patch, we introduce an arch_have_default_dmazone helper
for different architectures to determine whether they need to
set dma_bitsize for DMA zone reservation or not.

At the same time, when x86 Xen is built with CONFIG_PV=n could
probably leverage this new helper to actually not trigger DMA
zone reservation.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Extend the description of Arm's workaround for reserve DMA
   allocations to avoid the same discussion every time.
2. Use a macro to define arch_have_default_dmazone, because
   it's little hard to make x86 version to static inline.
   Use a macro will also avoid add __init for this function.
3. Change arch_have_default_dmazone return value from
   unsigned int to bool.
4. Un-addressed comment: make arch_have_default_dmazone
   of x86 to be static inline. Because, if we move
   arch_have_default_dmazone to x86/asm/numa.h, it depends
   on nodemask.h to provide num_online_nodes. But nodemask.h
   needs numa.h to provide MAX_NUMANODES. This will cause a
   loop dependency. And this function can only be used in
   end_boot_allocator, in Xen initialization. So I think,
   compared to the changes introduced by inline, it doesn't
   mean much.
---
 xen/arch/arm/include/asm/numa.h | 1 +
 xen/arch/x86/include/asm/numa.h | 1 +
 xen/common/page_alloc.c         | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 31a6de4e23..268ba93a92 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -24,6 +24,7 @@ extern mfn_t first_valid_mfn;
 #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
+#define arch_have_default_dmazone() (false)
 
 #endif /* __ARCH_ARM_NUMA_H */
 /*
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 1f268ce77d..6eeae02060 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -74,6 +74,7 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 #define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
 #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
 				 NODE_DATA(nid)->node_spanned_pages)
+#define arch_have_default_dmazone() (num_online_nodes() > 1)
 
 extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 319029140f..4c0dc3cb3c 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1889,7 +1889,7 @@ void __init end_boot_allocator(void)
     }
     nr_bootmem_regions = 0;
 
-    if ( !dma_bitsize && (num_online_nodes() > 1) )
+    if ( !dma_bitsize && arch_have_default_dmazone() )
         dma_bitsize = arch_get_dma_bitsize();
 
     printk("Domain heap initialised");
-- 
2.25.1


