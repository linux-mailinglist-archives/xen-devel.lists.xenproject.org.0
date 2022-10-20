Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774A6605733
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 08:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426151.674439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olOpr-0002je-AZ; Thu, 20 Oct 2022 06:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426151.674439; Thu, 20 Oct 2022 06:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olOpr-0002hF-6t; Thu, 20 Oct 2022 06:15:19 +0000
Received: by outflank-mailman (input) for mailman id 426151;
 Thu, 20 Oct 2022 06:15:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=umfN=2V=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1olOpp-0002Ja-6e
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 06:15:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70055.outbound.protection.outlook.com [40.107.7.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90379fd6-503e-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 08:15:16 +0200 (CEST)
Received: from AS9PR06CA0600.eurprd06.prod.outlook.com (2603:10a6:20b:486::35)
 by AS2PR08MB9523.eurprd08.prod.outlook.com (2603:10a6:20b:60d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 06:15:07 +0000
Received: from AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:486:cafe::f) by AS9PR06CA0600.outlook.office365.com
 (2603:10a6:20b:486::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Thu, 20 Oct 2022 06:15:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT020.mail.protection.outlook.com (100.127.140.196) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Thu, 20 Oct 2022 06:15:05 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Thu, 20 Oct 2022 06:15:05 +0000
Received: from c7705e2c8b9e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6E1C670D-88B7-4137-AAC2-83C9E54A50C5.1; 
 Thu, 20 Oct 2022 06:14:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7705e2c8b9e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Oct 2022 06:14:58 +0000
Received: from DB8PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:10:110::14)
 by PR3PR08MB5642.eurprd08.prod.outlook.com (2603:10a6:102:8b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 20 Oct
 2022 06:14:56 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::13) by DB8PR04CA0004.outlook.office365.com
 (2603:10a6:10:110::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29 via Frontend
 Transport; Thu, 20 Oct 2022 06:14:56 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Thu, 20 Oct 2022 06:14:56 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Thu, 20 Oct
 2022 06:14:55 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Thu, 20 Oct 2022 06:14:53 +0000
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
X-Inumbo-ID: 90379fd6-503e-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=F9UCUmUwD3kv9LcrU1oZr+TsjCm5DEI5lu45oqlaSC/8JZZXF+psqyRtYmKePLJG0LDzTOPRCsPKIZnWN0MGQHGjqG64J88pia3uZI3Kk0kMAb6uoRNQRxfaMSAlt7yi9ZdQ8S6zRU9xEjbjRNeD0y6DAeOvlGVHYHC6oaAcrIVZOYN4MFzMzFcnOph5pvAv5wAHIz4VD8nvPdpjUlOn7hqMvYFE4/RYj03y76eCjxnglIyW10kLF5547SVdOZ/eR/9bnTOH/P+Rj0fjyErLaf4kgiEgVNJ9xZAEX0Wo27l21flTXRR3Jel/1Jr9PE/WDekMnQxqAmQC6U8vgLATmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCpgI2W9EASjdF75FsifWclntiKlW1ihr8b+D4Reccc=;
 b=fKDuq2TerZiaKILJq7lECO+5RA2uwe96ie4+L2CarvCA1nPkd+bF/r8GdJThtzAS0fVyGAjoBbYUlFRz2JpezBBhTuJsqAI7Q3XLk2IXo0Z5eNv/aw7lqaBl7lwBD7if3CzdR0IDDvoyWLZwxHKrIKqUxDxc5tnI+EuO1Q+5Kzu6Wh2WKNDzD/sW4GumfNmewjoTsR2gOe8rJlbjF4FExxTYD7et6dFETnaoPiGzPeeP2wjfPs4UFU1nM3W76GHwqy9AYlw6OWzhJOPf3mjYGF32dHpM95UlNRGdaoFal9F8XUiIXgzCu1u7R7YmBUrvQRMtcGiIYSvBWPCqnAPFog==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCpgI2W9EASjdF75FsifWclntiKlW1ihr8b+D4Reccc=;
 b=7bAdbaTtf0ki3Z2qGXNYOlv7LGqMrDhAQ4C2aIwXzt7HkElbothVOdIJ4GpAl5viPp1ZI+S8uYEBgxTx8oXHMxW83v1mBbRgDNBrpV/KlOyCd1E0lfWwRxg7YcXjifS3oMaEPuEOe+WzSC6u7GCJWqUD8YOUSaWbgfMDoq7jPl4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5c0d0de74e907bae
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0Z7qYDZxGjtyv9RlveFmv+nLNcG9N+Ke1QQsz3+1SygO4n7trk66ZudCsTG+QF6TE51qdeV858R2UzX/XqJiyMEV2zWQqy5e8S1qpkupzoMZzqRFzUGEdK3QF69AwT8hITiNiFxkUk7xZjuwqAXDm884iWcLiNXhdmPtLFVGN11q0NMWvw0FspCw3j3BApaST1QqLsxeIIu8Vn1IrBHGETRlKY5QKAj05oK5LC6k0CZHbJK1zWxPJDmw8NAm38nxZiKFm+hoadMfQIQTSZ1KOjym7/t2pFhyEHsdVHKKAOCWdToa42rE1Sx+3Gs1SmkY/ksoDO42uGeqWhM15ue8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCpgI2W9EASjdF75FsifWclntiKlW1ihr8b+D4Reccc=;
 b=Y+8CjqoiUqMWuwxExIOZ2Oogv4UHOL5OBfMwJx4lyyJTfyz9halL7x0EhQHYYWniz5s6BR8oWBQvGFDr4dcHCZiqDENUXx4CB7k/brJpjQ64lfmDKryDgTY6MegxYv8RQR8NiInJXXhTZABypKkqHDa7QBO9bZBZpWphPiwpgLICDXsobvWoCNRtg20GDnlOiN5/y1agSegLe6RVKDAt2j1/M3kw8gfclgfPTJ0gI3xcl/7gfyBV03jwmwBuEIPZAuEPqTR3FZT3tdMx64tiYD4OxBjqKaNLIFBdTCohDfohVzeOuVZlMUxkFUgm8SdGlfZ9bzadbnnCMCb5f8sZsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCpgI2W9EASjdF75FsifWclntiKlW1ihr8b+D4Reccc=;
 b=7bAdbaTtf0ki3Z2qGXNYOlv7LGqMrDhAQ4C2aIwXzt7HkElbothVOdIJ4GpAl5viPp1ZI+S8uYEBgxTx8oXHMxW83v1mBbRgDNBrpV/KlOyCd1E0lfWwRxg7YcXjifS3oMaEPuEOe+WzSC6u7GCJWqUD8YOUSaWbgfMDoq7jPl4=
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
Subject: [PATCH v7 1/6] xen/x86: Provide helpers for common code to access acpi_numa
Date: Thu, 20 Oct 2022 14:14:40 +0800
Message-ID: <20221020061445.288839-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020061445.288839-1-wei.chen@arm.com>
References: <20221020061445.288839-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT025:EE_|PR3PR08MB5642:EE_|AM7EUR03FT020:EE_|AS2PR08MB9523:EE_
X-MS-Office365-Filtering-Correlation-Id: fddc3ec7-ecd5-4c15-fb4f-08dab2626ea3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mrqJPOZx7rRf6s2jlvisqvhrBuzzn5cMsL8cp49f2P52a2LyLPLHSUpdzPiFtWfTcFdfeUiq2TXS3bcWI11aQylzjmXzePXJDA7RAzK+s0kSDs9UAFyo5Vj8bMyRu9RESYY0jNU+BC927AgY3tTwd7gf2nMnGWOrmhLnJ4HPehosChiBy1RhWPZYWaYP6qk5QFhrx7w9VdO9WgWsjJWZP02Imb88I62gUGmE65GlNtvI621ih4xgwV4KdPxkfCGzNCMSTrBbJ+hB6bjRA3x5zZuBHiYLIsDgqzTnRGYFI7AVJl5YmXXlKOaADt7jT0RsbLFkjzqkfK8fGTEjtKxqMsUWYXxXlGmM9wwBiaVNV6fa+1ovXIHcoZAUSQH4FnBz78heeV70r4p3njLjUH9GUhKShchqwtiGIOVa+7Z5ndDKJ7hxU/V8eDlIKivndPpyaxXFjbuSr2mwhf7Z0Uu5a8wH/Twthxm7MReiJjE3DBTm4Rkpyg31FPFsE2ZxLq5aoG7MIW7TGiffjk3xuJrzYEBXPSdyMXBO8bZ21Kh/kC9TsjSAnr/QC7YBHSF18S5aW4H8YSNw+9+RcDuYUpgvOumfvOSRGiYg9Q6rkr40kx73iUsynx8FzHYCKa2wFnU1O/5fNOdKYDsjwZAuiER8i6lGbz4sp/AY0yQKonc0Gtv81L+8HotklXKU0hhg4a4f29HOB2AHYxL1B87mj2l5oG2PHBPKt6sorRjcrF5um+RmdrvGicC5JEBmHgC4sBLOzZcgCgO8eziOjsBwH3CGOjNV3D8yC6P/tLTGylKjWX3xKYh4P01wap3XPvZGuinl
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(36840700001)(40470700004)(46966006)(2616005)(336012)(6666004)(186003)(1076003)(26005)(7696005)(36860700001)(426003)(83380400001)(2906002)(47076005)(5660300002)(40480700001)(44832011)(40460700003)(316002)(82310400005)(54906003)(6916009)(478600001)(8936002)(41300700001)(70206006)(4326008)(8676002)(70586007)(36756003)(86362001)(82740400003)(81166007)(356005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5642
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	201be532-b962-4700-1e54-08dab26268f4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+7hvon9wLcW8xm4p3d76k/preWyibXB/PDCqTRGUHATY9fLnyqcimXY9vC/2dWzv83lK9U57ptR80vBmRGe2dYuzw2RkgFi/9WPRk4dg96/of3QerzCE9cDY2JQUNAfk1U9dOsHCq+n3KOzPcbQNjARwzjS4cQBLFZGfyfT+ve1QB3CTJDI7r3MRtVYgvTqTvbhHE8mCdYcuhzEKe5uEDFPe6vLsVbMr5rm4gpuxroWeSmMjdWq1otEmgN4TJh3xIndWmMeqi1caHClNfisgLrvSaul6jEV7qLGNT5QGxxpCBCXYg9yrkepQP6APY8ti957spX2bDGkyU2oaCN6nARZF7BhQsD6iNOqSekZKDgWT6DYap+wyfIXXUUxKXm0QGQJPETXXBYYD15VphGPVfYPQu1ZUP2DOwOquKYI/lkkzdfRJUcgBSGm2HIr+kKXe90qmq5JT4iTpMxrmV3+c1ZUSXSO2jZ4bAngBJoNrya/Us0Bf/v0QO6vKHL/aXA3nXqOVwXv4CFsgooaXLq5mWXVMLQItka/fEJ+xEawqz8XVTGFXjm368xIv6fKadxp5DSXHXD/Sca1nCKXzpBelqwJUQMssJd8bMAiHN/JAeN1dkeZO6PVCX34hpSpTlhs93NszxYeY9o8jFr5zIuZof5DIHC96sfPOdd/I1RGfZF79KyX3IMfbW/iFOg96khexnwHKQi7dIUUK4DhcR4zXMXhOyL6yU7daU3dL7sRnGLqrF8/xClGffyBGfT4QmPpgvfnIm6tVCF6HydI5JYCRBQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(46966006)(40470700004)(36840700001)(26005)(2616005)(6666004)(36860700001)(7696005)(83380400001)(186003)(1076003)(336012)(426003)(47076005)(2906002)(5660300002)(40480700001)(44832011)(40460700003)(8676002)(82310400005)(316002)(6916009)(478600001)(54906003)(41300700001)(70206006)(4326008)(70586007)(8936002)(86362001)(36756003)(82740400003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 06:15:05.8501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fddc3ec7-ecd5-4c15-fb4f-08dab2626ea3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9523

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


