Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7116275F8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 07:35:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443089.697515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouT3t-00012Y-1O; Mon, 14 Nov 2022 06:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443089.697515; Mon, 14 Nov 2022 06:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouT3s-0000z7-UM; Mon, 14 Nov 2022 06:35:16 +0000
Received: by outflank-mailman (input) for mailman id 443089;
 Mon, 14 Nov 2022 06:35:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CFvb=3O=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ouT3r-0000jp-Lj
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 06:35:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7eb9acab-63e6-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 07:35:14 +0100 (CET)
Received: from AS9PR06CA0254.eurprd06.prod.outlook.com (2603:10a6:20b:45f::29)
 by PA4PR08MB7594.eurprd08.prod.outlook.com (2603:10a6:102:270::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Mon, 14 Nov
 2022 06:35:11 +0000
Received: from AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::27) by AS9PR06CA0254.outlook.office365.com
 (2603:10a6:20b:45f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Mon, 14 Nov 2022 06:35:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT045.mail.protection.outlook.com (100.127.140.150) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 06:35:11 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Mon, 14 Nov 2022 06:35:11 +0000
Received: from bb2e14286891.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 63C7EE23-4EA2-4853-85DD-8BDF269879A3.1; 
 Mon, 14 Nov 2022 06:35:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bb2e14286891.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Nov 2022 06:35:04 +0000
Received: from AM6PR0202CA0058.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::35) by GV2PR08MB8076.eurprd08.prod.outlook.com
 (2603:10a6:150:7a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Mon, 14 Nov
 2022 06:35:01 +0000
Received: from VI1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::7a) by AM6PR0202CA0058.outlook.office365.com
 (2603:10a6:20b:3a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Mon, 14 Nov 2022 06:35:01 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT006.mail.protection.outlook.com (100.127.144.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 06:35:00 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 14 Nov
 2022 06:34:59 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 14 Nov
 2022 06:34:59 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Mon, 14 Nov 2022 06:34:56 +0000
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
X-Inumbo-ID: 7eb9acab-63e6-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BX3altsA9WE+7OQp4hlskOrTm04k11y2EFC28HI9J0=;
 b=jQqGCu64+aQExqPelXrAqV8V1HyZhOYUtMcjIFW91GdeHjbLeSzpXHIbTW9uLmHFrKaq/Pwx58du2YAFzFLa67Ab0HP/BSaQkpVyiq6jXmtK/cPLl5IivojDx66ZDcnBpSG3doejhf9UfY2uam8Q0J52f7AiKMsRVo58xQie/5I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 959ea5b20c4765b5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UR4DZGFV8EMQb3YEjOKATkifgzx3LtJ/6wmN8qEsm+JV873T13T/xgV9IbsRMZ+JmyDcsxeDQ4eJmNhkg4ZMQG5lAR+dQrUdlgasNwUAOag0pRBxKGn8/uU3pK8R28c3XoHry4LQsUbG6C3QNkcpYiFHRhVYibcG/UkHvlLOPQs1+9J3oUvoGCta/VF7+IVBbRVRTVZbHgQ5rHEJlVPBqOKTRSM6vRR0frPli0SlYPxidy7HMspdsrHpLz4kL2t2X471yv2LZdPpOyioKeu/KLa8Cex8yWgntt4rB9knZWD5MfVY4grdEjG6haEDO3Cv+4nbwzAhrrmrvuCnNzrCAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BX3altsA9WE+7OQp4hlskOrTm04k11y2EFC28HI9J0=;
 b=FdL4j92CsAm5eItSkO+Ju5xGW3LBgMuHnjU+iTa4DfOfIEkZywQhm7HO0xYzU3XC33UoGrQ6hzFpvdiHwWcA2+FfZL5Xxt8fssfEwMZmKjd4G/gpA5DXaVXdR88h++NXBE0DySPAPVaP6OFINEcASnKLfo0IBtfcFPtbDlLpv36/kd4rmfVhNV3VSxlhXGykgoSwYtVWR33TEOUNOJ2KulvvU1BCYBJBtirP9dAWGfDAQCPLJBUjsQUQIGvftbV5zX6cO3cU33yAATZBUcA0sCpNw/f0fc3MXXm0SHS6R0CRW2uoNFMatHlLPCe+M2S2gnPlFydO+9nHdPbHG9I+EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BX3altsA9WE+7OQp4hlskOrTm04k11y2EFC28HI9J0=;
 b=jQqGCu64+aQExqPelXrAqV8V1HyZhOYUtMcjIFW91GdeHjbLeSzpXHIbTW9uLmHFrKaq/Pwx58du2YAFzFLa67Ab0HP/BSaQkpVyiq6jXmtK/cPLl5IivojDx66ZDcnBpSG3doejhf9UfY2uam8Q0J52f7AiKMsRVo58xQie/5I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v8 1/6] xen/x86: Provide helpers for common code to access acpi_numa
Date: Mon, 14 Nov 2022 14:34:46 +0800
Message-ID: <20221114063451.473711-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114063451.473711-1-wei.chen@arm.com>
References: <20221114063451.473711-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT006:EE_|GV2PR08MB8076:EE_|AM7EUR03FT045:EE_|PA4PR08MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: abefe6af-4272-4586-476e-08dac60a61a7
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZDbOr2LrNHVBwdXeWEazDd91g+IwyFTQNZQHQpDnexUrKgmyvTb/bno1PdZ+hQ5omI3tZgTKf5SMSieqmfodCVQ9wurx9Y+Tceoxu3YwibKWBVpKHagSK7BeY4RPYmWOBBaPakd6EECNUDOYD8+t05Z++6puX0tMcES/1TWq0PXZkIri0XcQcU6TsHNhPPrVJaBqlVs5bkkI7ISllrX/257kbfpGuiWG5K+nb5SaZPhPcHucX9ZxHK4rCOw24MJ3fIu+oxOjL4ZOG5fgH5GSKTu+37RqLR0UBeBYeXK1Hwaq77roxAxtUcGr5pcTrd7CjIIGpif9+xVVPZanr2mNgWTkesEEt/01PL3n2ujMdFTMoxzOI7IWBCgggP/vj8UDaSXdnOzbccIDwXB/mkMA53xSECmQDG24F+q8h25X952KgemXgmanMh+mLyYLNazpKL6z+EAFTFELbRlEVGymYI8WmIJ/13sp+bgYTd6khxB1krtgzkDXsAqeTOnjcctiOLBCjAdzdP2IbTrkPKg/SuzD+iVk/AnascM2Mhp7CQLPxDS6SkoB7QUUnpI1H+vVsS7dkGU43ucABtwIOvB0ULmmv3AtGwdSXNept85MEySKjx+YOdPe5rMu4rGsjh/Cy+d6Zvm4dd8ikSzZ3pXz80VFv69R3h6SE5GeEDPpfsOrBpGIMbzf8+myEPykryFR6DibvYqnom6wNfX4sD8CF73cVkE/SxDGTPmARLEiJYlLawLWqMxoUEcZTiU36iTANpxRd0aQkA6K3Ql7zIcl8djW5UX/otP0KE6vF8y4v0uxpf4zYeYTUPCPPJaSQ/2Y
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(6666004)(40480700001)(36860700001)(478600001)(54906003)(6916009)(1076003)(5660300002)(41300700001)(336012)(44832011)(36756003)(47076005)(426003)(2906002)(8936002)(70206006)(186003)(316002)(26005)(4326008)(8676002)(70586007)(7696005)(2616005)(40460700003)(83380400001)(86362001)(82740400003)(82310400005)(81166007)(356005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8076
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5aec99bc-82b9-45db-7e3e-08dac60a5b28
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eU7WKeXIafYyzgYg9H5F101ZRlsKxL9Rb2Pc5iygWknuVg+V2dyTS8IMWQj2dfDEF5BbZFtqCP9wQeFPWKu6AFlwVJXZ6ycykwCU1nkmlUhMgjZOHqkRNx5kXQPB2apmWfrz6cKMEzAWTrTE0pwrWJOrI+IkvfFpgp2amX+cEIszPtWAMD44lA/QUGJRWnfG5A5G05mh+NcutDLwpd0MoaqNcNgW/o3jXAu7d8GC6/0bol6wQEyuDh3OpRRj1Ow04pF7b1LIYYDqG/WBLrsxnOQZfjaAm1OK18wjFK+Wttdz8/nslBTidEmCjiXWxokPvlzTQ4lxpYweBo2nnjB4hvu0SieO2/iyctxmQ5zAsAcAA0aTQI7urHIkqRl64+9AuQsiFnLodkEiOX0ymV8CZsEWcprOU2NBoCzk5GCmZ2w6XKuuHpyBs9eOpazkUtWT6/GWttd43ZYI2a4HkWNRDm4apzqSu2mnTBD1zLDmqmpXMqw6yEKnZSptppKAMFDaJLtvzdtz2YqcW1IQo2qZBjXi033cszvUZneRNpggUhNh7UwFCyTAZLS478ZZvilpykHE17PkgbWx9cKJwHuMKLR6zjgJBJyP5zGkdU2oICpOtpqdNr2Dt3Rc/ezkpgikN4+LLIYwKTjwOOZHppEse7avNd+444vzxY34Z9HJOrMGzF3b3DRVdZ9aHHryWsfT+o7T32CQ2OVAmJ2M2z7qbXBYr087SVA1IrX8WBkz5+I+HLPAv1KFqGKYyV/SOqtm1pBoYEpJ+nmNGZmLXiSHjQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(2906002)(86362001)(36756003)(40460700003)(40480700001)(81166007)(336012)(47076005)(426003)(82310400005)(82740400003)(478600001)(316002)(186003)(54906003)(7696005)(6916009)(8676002)(70586007)(44832011)(1076003)(2616005)(4326008)(70206006)(26005)(8936002)(6666004)(41300700001)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 06:35:11.6046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abefe6af-4272-4586-476e-08dac60a61a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7594

acpi_numa is a specific NUMA switch for ACPI NUMA implementation.
Other NUMA implementation may not need this switch. But this switch is
not only used by ACPI code, it is also used directly in some general
NUMA logic code. So far this hasn't caused any problem because Xen only
has x86 implementing ACPI NUMA, but now Arm is implementing device tree
based NUMA. Accesssing acpi_numa directly in some functions will be a
block of reusing NUMA common code. It is also difficult for us to replace
it with a new generic switch, because it is hard to prove that the new
switch states can guarantee the original code will work correctly.

So in this patch, we provide two helpers for common code to update and
get states of acpi_numa. And other new NUMA implementations just need
to provide the same helpers for common code. In this case, the generic
NUMA logic code can be reused by all NUMA implementations.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v7 -> v8:
1. No change.
v6 -> v7:
1. Add Rb.
v5 -> v6:
1. Revert arch_numa_broken to arch_numa_disabled, as acpi_numa
   can be set to -1 by users. So acpi_numa < 0 does not mean
   a broken firmware.
v4 -> v5:
1. Use arch_numa_broken instead of arch_numa_disabled for
   acpi_numa < 0 check. Because arch_numa_disabled might
   include acpi_numa < 0 (init failed) and acpi_numa == 0
   (no data or data no init) cases.
v3 -> v4:
1. Drop parameter from arch_numa_disabled, the parameter will be
   introduced in later patch where use it.
2. Drop unnecessary "else" from arch_numa_setup, and fix its
   indentation.
v2 -> v3:
1. Drop enumeration of numa status.
2. Use helpers to get/update acpi_numa.
3. Insert spaces among parameters of strncmp in numa_setup.
v1 -> v2:
1. Remove fw_numa.
2. Use enumeration to replace numa_off and acpi_numa.
3. Correct return value of srat_disabled.
4. Introduce numa_enabled_with_firmware.
---
 xen/arch/x86/include/asm/numa.h |  5 +++--
 xen/arch/x86/numa.c             | 38 ++++++++++++++++++++++-----------
 2 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index c32ccffde3..237f2c6dbf 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -32,8 +32,9 @@ extern void numa_add_cpu(int cpu);
 extern void numa_init_array(void);
 extern bool numa_off;
 
-
-extern int srat_disabled(void);
+extern int arch_numa_setup(const char *opt);
+extern bool arch_numa_disabled(void);
+extern bool srat_disabled(void);
 extern void numa_set_node(int cpu, nodeid_t node);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 322157fab7..1c3198445d 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -50,9 +50,28 @@ nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 bool numa_off;
 s8 acpi_numa = 0;
 
-int srat_disabled(void)
+int __init arch_numa_setup(const char *opt)
 {
-    return numa_off || acpi_numa < 0;
+#ifdef CONFIG_ACPI_NUMA
+    if ( !strncmp(opt, "noacpi", 6) )
+    {
+        numa_off = false;
+        acpi_numa = -1;
+        return 0;
+    }
+#endif
+
+    return -EINVAL;
+}
+
+bool arch_numa_disabled(void)
+{
+    return acpi_numa < 0;
+}
+
+bool srat_disabled(void)
+{
+    return numa_off || arch_numa_disabled();
 }
 
 /*
@@ -294,28 +313,21 @@ void numa_set_node(int cpu, nodeid_t node)
 /* [numa=off] */
 static int __init cf_check numa_setup(const char *opt)
 {
-    if ( !strncmp(opt,"off",3) )
+    if ( !strncmp(opt, "off", 3) )
         numa_off = true;
-    else if ( !strncmp(opt,"on",2) )
+    else if ( !strncmp(opt, "on", 2) )
         numa_off = false;
 #ifdef CONFIG_NUMA_EMU
     else if ( !strncmp(opt, "fake=", 5) )
     {
         numa_off = false;
-        numa_fake = simple_strtoul(opt+5,NULL,0);
+        numa_fake = simple_strtoul(opt + 5, NULL, 0);
         if ( numa_fake >= MAX_NUMNODES )
             numa_fake = MAX_NUMNODES;
     }
-#endif
-#ifdef CONFIG_ACPI_NUMA
-    else if ( !strncmp(opt,"noacpi",6) )
-    {
-        numa_off = false;
-        acpi_numa = -1;
-    }
 #endif
     else
-        return -EINVAL;
+        return arch_numa_setup(opt);
 
     return 0;
 } 
-- 
2.25.1


