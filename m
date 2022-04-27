Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF58A51144B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314616.532777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdys-0001eM-5s; Wed, 27 Apr 2022 09:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314616.532777; Wed, 27 Apr 2022 09:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdys-0001b6-0d; Wed, 27 Apr 2022 09:29:06 +0000
Received: by outflank-mailman (input) for mailman id 314616;
 Wed, 27 Apr 2022 09:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ksbQ=VF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1njdyq-0000n9-8I
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:29:04 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7953a565-c60c-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 11:29:02 +0200 (CEST)
Received: from FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::17)
 by DB9PR08MB7116.eurprd08.prod.outlook.com (2603:10a6:10:2c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 09:29:00 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1c:cafe::ab) by FR3P281CA0026.outlook.office365.com
 (2603:10a6:d10:1c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.6 via Frontend
 Transport; Wed, 27 Apr 2022 09:29:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 09:28:59 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Wed, 27 Apr 2022 09:28:59 +0000
Received: from eae4235bb0d5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 77FF16C7-2200-46AB-9358-7ABC31E92AE4.1; 
 Wed, 27 Apr 2022 09:28:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eae4235bb0d5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Apr 2022 09:28:52 +0000
Received: from AM6P192CA0086.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::27)
 by VI1PR08MB5453.eurprd08.prod.outlook.com (2603:10a6:803:132::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 09:28:49 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::bc) by AM6P192CA0086.outlook.office365.com
 (2603:10a6:209:8d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Wed, 27 Apr 2022 09:28:49 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 09:28:48 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Wed, 27 Apr
 2022 09:28:39 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 27 Apr 2022 09:28:30 +0000
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
X-Inumbo-ID: 7953a565-c60c-11ec-8fc2-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ca957iFd3GwcadLwUBIDY2Xk61wjByJebQxyw/mmKDb2q7Lh7ol7sDSmTmR+2Nwcy+Bvy/gez8fYIiZyrGpXL7M4llq5SrqjBJg6ofioBE9OIUE1LMalh7b1CSrh4L039WY0wtqfSAw/rmPVWG1KwWWW+0ci7BkmsfdKmC8zI2/TMcsSnR55zcLzAm9E445ecNlybVKsurELMx8Rz9zkZhjraIvjit3beCjljzJMUisgnH/O5QmZAlpU5DNxHofDV5zsQGgVebT8x1kKUCi6dA4pcN1/3fQF4UYkPN6Pm8rI6mpwsTLrI8X/gUSCW/yhtoFvc0sEkk3smr4h6huzLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKV5xiCmhipxoNF2c34Y3bk6wQOs8dxWyNC/VQODx1s=;
 b=iyTOPSfCeh1M3ZF4i1u6E685Nd0i9+Z7Gk+YOSKwh/uUcXYKvA5b2FAvrcSpgfs41GFE8aF89XShXRQbWDERhGtpQElMvzPW3Ki8IVGx6Gnb3JMqTHGc4vcPkS4JgfLS+SuIQ0Tn8Sv5nxJ7o9/nP6wP6qZ9d8h0ASyp2G0TAqprEFR6M16nGK4Ba5dxMO+b4R8SYORo6Efzq1eKkXC5eeUTFdKlmcQPO7rXVREz0oIR9GyRPnYKTXCVgbur+fz5SRgkEGHDwbj1wKBVj1EIvsSrLjcDG4+2saV+TsUUXIRjV+gmAyuuqe7s95LVzhTeV0l/axZLvhYLwOApTWyoNA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKV5xiCmhipxoNF2c34Y3bk6wQOs8dxWyNC/VQODx1s=;
 b=k83bgoeH6Jm7PC8uN4PicxtmnmTachNYARFHrkVtBnRB8GUpcdzh81NOQiO7vxnHx+Fosgep6kT+96mgbb07DHsczyTxyhOSRV5Dg3q17mGiyvYBvE37aNkinQvRU9BH3DwK6mL8HJAy2KiXvb+ctC6d70jDk6TfdeeaFghqx4M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b0351bf2feed9c09
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSLOTXDgBsOyagF0KTsSY8SYlON3Zr/TSjLE/RM73no0g98EKxpShw9hVHGsSm6w4IV41y0FvlBefX6wgllPHlkNMYgUXps+/gQj9uFxcSaIJhq0yHFtPHHKo6mPbExs5l8DGS8BdNo79MUVxbHGbtmNAU418R5JkCmYu35OwJauJGjXIYOgjKYBP0tNMhHapZtRiZyCgS4I/pC+bT8cZemSafM+UX7RiY+EKwRxkIMD2E4bil2AmuaEkKKEQ45W64DbGCuptsDjyo+as/biqdH+vMqSu917KJTCtlGSC4zd1XRCuWhgoGJs7dPUbuTntqwo6DzCaxV2sRfj8WZUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKV5xiCmhipxoNF2c34Y3bk6wQOs8dxWyNC/VQODx1s=;
 b=NAQEzoOpN30dQe3a5WB1YHDHkrcOVZ5h4X7W+2dFKuAPZPsJ6rIKtiAhfiNrs7bpvhWJZL65912LxhJ+T6YqkIKnqSkFYFDHCmx4GZo+rqVljPCoKdlGG8iI+Dy4PAaIVeLdDTllIyl40ckau6iyRO3otr95ATrYXRUEUZFnTAtI+PVFatnzt2dkR/Cp/1dHeYSQsRc55hAo6Y9H9JrG4Eb5nz5G2jxz+ljrIB24i9YC1npziFyHoIvZVeCE4BR0SDAEaUrr6pIcOtcoiiEj1uuQqmoYe/kBuAI4Ts213nc0k7m/mN+aE4eeLqoVm7pxxoyBQ2YOc8AbkfHdXbe6tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKV5xiCmhipxoNF2c34Y3bk6wQOs8dxWyNC/VQODx1s=;
 b=k83bgoeH6Jm7PC8uN4PicxtmnmTachNYARFHrkVtBnRB8GUpcdzh81NOQiO7vxnHx+Fosgep6kT+96mgbb07DHsczyTxyhOSRV5Dg3q17mGiyvYBvE37aNkinQvRU9BH3DwK6mL8HJAy2KiXvb+ctC6d70jDk6TfdeeaFghqx4M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, <henry.wang@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Penny Zheng
	<penny.zheng@arm.com>
Subject: [PATCH v3 3/6] xen: add field "flags" to cover all internal CDF_XXX
Date: Wed, 27 Apr 2022 17:27:40 +0800
Message-ID: <20220427092743.925563-4-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427092743.925563-1-Penny.Zheng@arm.com>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: cc2d2d35-9304-4bf6-c4d2-08da28305c34
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB5453:EE_|VE1EUR03FT057:EE_|DB9PR08MB7116:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7116DCF4CE8D30A6AE170F2DF7FA9@DB9PR08MB7116.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LPrdKLX2hlNxyN93t931MKCbSZb/Fau2N51CeW6V9aPu9cTp1mH0/QIG4d1JkB9I4KxCWPROI0hEk+Df4x1L0JWtRFq3ZbWEL8Fzo6HVDlIQIwexvvBjEwf1a6xAnXCJf51/BZ2eu1dBydGp7n6ER0cUiv33BRyi1QWlcnyEYlCdGr3j1KHs0aUL7OlkPvkmiNKw5Ci8qQBcW1haindCBmEm2EohDTNsTGbokPUSy2o88cN7jcDv0t++nHo4bHPb25jYkm7BbONbV5gDhxxwtOBfXdu9+jpmle2MzxOdHyGLYyKzmkP2xlJaRftY5/0Z0DtIi8jbKJkylmDVrs9933v7sX5lmyoa+QHIfy3150SFBQFjCj/JGTKYf4SC+G/+FPcXv4UvVnoEbe5Mu10oMefCFKQp09Kxi4pMU4KhR7EfNZoqUBtiQR4PteUvnsnFZdVcNatMZc0LmADgxgYTk2d2pPJMco+O6OsWK+fetZ9R4lTLqkEu7pWFu0n6Y0OHTj8v+ej6sOP1F3Y5yqWjH0qHx25MvPQHWyaWwQottYCo4wVduxByjAlpxIeoCY7FvkQRJL4Qxreg8KF78Pw9rgME6p34HNJZgPZScw4pZwrqmXIrty/OHKloNayHd4ndsy+nWEv2AsnIJX3ppKH2/hdLg0z6/KZUw+In5GaQQ4EUUH48DXXIJHzqqoaBq+W6oQDHmmnjSbcCOLXokh8k8xuq+fGANlcFtAaukGLhbDk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(426003)(336012)(508600001)(82310400005)(2616005)(47076005)(86362001)(40460700003)(1076003)(26005)(356005)(81166007)(6666004)(7696005)(186003)(2906002)(316002)(36860700001)(70206006)(36756003)(5660300002)(8936002)(70586007)(54906003)(4326008)(83380400001)(6916009)(8676002)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5453
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fcf7d022-2bed-4ff2-1992-08da283055b7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wJa8vUXa5eCEqu7ecyfTe8VMJbdBIBjxpTRdrxEnh83UBVsA7CQ8kC4UyRpZ2UaNsT7U1R2cOyP5M14p7cB6B0ekwbsIQ/WNbVj6XybJR98k+vpOVpoOPOyFJzSM6HGm446HEmwdNObx42wkUO/ETsmMeF6d991rvWDbeQK7f5+JaO/g+LR4MBpLsVn4T/tnt3XJ5aBbxA566Sh4vA1dxQbOygXvXN5aSKa6ZLGF1CF0NETocCMiCYXXw8shaFebDrBiPfHbG6lsxB+TFlwsg2vt8WoOS57Ftv6brOb9P1kOpOw9wltq6mJMuDffObOfA3i3rz1Cfi+aUZcyuiWDg9isIE/ECeVpb2owNbJ1JqIP7+gDq3T7d/j5k2wnSV2WmgAf89+An6cyujhTH8LuTj0kz2r20tRbobz14oDaGMmCSjOVxqYEK9UY8u6Qyk5myy+jnD+hTwkTqG7CHHuqN16iXctqNcHOie2wIiW+nfrWXbnTYNTAnwlOpPZ0YiQ3MXV3lNl0Kz6q3UZFm187rCGOlOO4lslHKdcczbJ+XZGGEYl8QOOtC2vBKkzFA5xiMOI0pAEbvlpsQJqOsZOxhwmwXBcQAUoEeg/QboIKRFflf50M/vxlQEaWt4EKLiecnC3lSwHSa9QXKrSnFgDdsCsqO+eFw5OBcEYXnEgA+Uz3dxzePuFMft9VsSqLMZLC5x4Ehgb/Vba0ffzVv7lJRA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36860700001)(26005)(7696005)(6666004)(54906003)(83380400001)(86362001)(47076005)(336012)(2616005)(186003)(426003)(1076003)(8936002)(4326008)(40460700003)(8676002)(2906002)(5660300002)(82310400005)(36756003)(81166007)(508600001)(70586007)(6916009)(316002)(70206006)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 09:28:59.5443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2d2d35-9304-4bf6-c4d2-08da28305c34
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7116

With more and more CDF_xxx internal flags in and to save the space, this
commit introduces a new field "flags" in struct domain to store CDF_*
internal flags directly.

Another new CDF_xxx will be introduced in the next patch.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 changes:
- change fixed width type uint32_t to unsigned int
- change "flags" to a more descriptive name "cdf"
---
v2 changes:
- let "flags" live in the struct domain. So other arch can take
advantage of it in the future
- fix coding style
---
 xen/arch/arm/domain.c             | 2 --
 xen/arch/arm/include/asm/domain.h | 3 +--
 xen/common/domain.c               | 3 +++
 xen/include/xen/sched.h           | 3 +++
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 8110c1df86..74189d9878 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -709,8 +709,6 @@ int arch_domain_create(struct domain *d,
     ioreq_domain_init(d);
 #endif
 
-    d->arch.directmap = flags & CDF_directmap;
-
     /* p2m_init relies on some value initialized by the IOMMU subsystem */
     if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
         goto fail;
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index ed63c2b6f9..fe7a029ebf 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -29,7 +29,7 @@ enum domain_type {
 #define is_64bit_domain(d) (0)
 #endif
 
-#define is_domain_direct_mapped(d) (d)->arch.directmap
+#define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
 
 /*
  * Is the domain using the host memory layout?
@@ -103,7 +103,6 @@ struct arch_domain
     void *tee;
 #endif
 
-    bool directmap;
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8d2c2a9897..6373407047 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -567,6 +567,9 @@ struct domain *domain_create(domid_t domid,
     /* Sort out our idea of is_system_domain(). */
     d->domain_id = domid;
 
+    /* Holding CDF_* internal flags. */
+    d->cdf = flags;
+
     /* Debug sanity. */
     ASSERT(is_system_domain(d) ? config == NULL : config != NULL);
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ed8539f6d2..49415a113a 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -591,6 +591,9 @@ struct domain
         struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
     } ioreq_server;
 #endif
+
+    /* Holding CDF_* constant. Internal flags for domain creation. */
+    unsigned int cdf;
 };
 
 static inline struct page_list_head *page_to_list(
-- 
2.25.1


