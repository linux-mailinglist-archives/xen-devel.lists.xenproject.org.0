Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CEA619430
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 11:08:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437420.691788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtcj-0001yC-08; Fri, 04 Nov 2022 10:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437420.691788; Fri, 04 Nov 2022 10:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtci-0001vl-TH; Fri, 04 Nov 2022 10:08:28 +0000
Received: by outflank-mailman (input) for mailman id 437420;
 Fri, 04 Nov 2022 10:08:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U/tm=3E=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oqtcg-0001vd-LW
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 10:08:26 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20076.outbound.protection.outlook.com [40.107.2.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dee8c09-5c28-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 11:08:24 +0100 (CET)
Received: from DB6PR07CA0194.eurprd07.prod.outlook.com (2603:10a6:6:42::24) by
 AS8PR08MB8183.eurprd08.prod.outlook.com (2603:10a6:20b:560::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Fri, 4 Nov
 2022 10:08:21 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::96) by DB6PR07CA0194.outlook.office365.com
 (2603:10a6:6:42::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:21 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Fri, 04 Nov 2022 10:08:21 +0000
Received: from 8521bc30d397.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2A65E369-9308-411A-B151-660E66C2AC38.1; 
 Fri, 04 Nov 2022 10:08:14 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8521bc30d397.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 10:08:14 +0000
Received: from DUZPR01CA0060.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::18) by DU0PR08MB8710.eurprd08.prod.outlook.com
 (2603:10a6:10:402::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 10:08:12 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:469:cafe::53) by DUZPR01CA0060.outlook.office365.com
 (2603:10a6:10:469::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:12 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:10 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 10:08:08 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:06 +0000
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
X-Inumbo-ID: 9dee8c09-5c28-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Vz/C8dLkKThIRElyaEJBWmdwRjzpTF3tTSI6dSMJgV9MbHMZqIJ72sWv3Ny+6RDri7mNtyjItTds6W8wLpw/vP+bASvytnCkfjMHl8guMgXx/vQ8QKujQV0aggEf7WIAnWh1TAHk5VP1NEl1ZEtxfftP0W1CURgIlaQxIaGef58diraHtWGwZlAimRcTrr3tyV/J+L1WdnqhR1AwY6wbAOVvbYJF3pYTBI0oFqib4o9P3APlgE0WGuPUMqWfPhl2k/IGj5H1xt+o6rlPgfrcgNvTToj70h5a+HsP6v87gy+ZQgWueYh6FXr7LSYADn+PemqM9CwlzTk13t7/vkHfag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3/EW3sqniXruvG4u4S9qwToDsD3nZPuOvy+sp1yapw=;
 b=h9A3raMbZ2FdwDRWpOCX4I3r/8oP/umeW/1P8q7SA6rhPUwv+fidKHKf9hWXHJxFe+yVo5HMfQvYDyvnQpoT1ENIg41W+aICJKim6ViwTJK5sMd2iUczJO178RWGtE2bidLBx92hD1oaoXUVW4MgFu/jR5U76dPxlfUHDCCpe8y6AIRAL2IIH8pi3dVuGA8ZSZwkg6bfKav1nRZ/MoMsIvfB355JDZVtkGcEVY4Qb7bqmMFJxiK46iuxA8yogEI+n71K2cDFSE4FzTXnbBcazUEGicQ/zAFDv7fuY/aV10S7hNM6fmy5YfIRFu3QPlyOIs2385tsNhmXwAOT8+l3cg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3/EW3sqniXruvG4u4S9qwToDsD3nZPuOvy+sp1yapw=;
 b=QGFy775mw4dtkFIAgXsmMGur0hVtX1weg9wbrPFlx2y7TDNzFpbeofL9/VtQUqzGyqeEBfluLE+bCH7WgvLZciU5Iu+yfzWKET14pPE80QosUIFcf7JA6DZznKeqHpnpIRJjBWNmsJs6KstKG4H2/BJRtf/7xqRSYP/Q9NkBDhs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 37e6e73037129028
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmQzWu7zKl2yaT1rL+LKWL3AKwM+vyPrrzEGdzRJk3ZuMK41GlFIKtwgUss/tj7f64xC9AD8p1wzjmfUUbEQcbgwHSJLLjRxMUTLLnEGZ0EEJ6V0vwGNhQyglW0UxHQQanLj9PvrDw1mBsRk5pxNFRqvzKR1kpRWGQSVd1vGk/xL3IapOASA08WRIcOlF95cf3a/6wbPBNubgLf9ge+6bIPGKddbNDjNXaQS5o6Y6oWOipXNxZaMqxfDxbfnpjXX7NxTnNSlEBgDn52KomiyFdIfd+VRdTG0v6g+/Qf/WJJsM+baaiwywvffzFGlQTw63n3A2Kf2osWFuRWQtQczKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3/EW3sqniXruvG4u4S9qwToDsD3nZPuOvy+sp1yapw=;
 b=GjH84YH4XoZ7DYGu9Qw/8PMiCPiqMVS3oITLzvq3mx1EAlt7geI4oNEA8CkI45E/jjnylL85QNOJcd3IuxH5h7umV1e9cegbs0ecvlL0Ej4u7UyQi2B1lfw23gJ+npd6ErgQh4AEzXd5LhFqkDrKCDa6tEor7XrUNV8smPG05HKZNue5iuxrd+bR6VVoQb03qcbyoCAzbuI08x14X+9mguRqnkKnyE8u4gZ0IvLQjWAAtZa2Fz/ayI9s48/dLmBAzBERbXIfv21m8bc2bo5nUVBNOeJCJgRJ7bwxQpwJsZdhysxsVp8Mfa2wKcV67/4vQeGt1evXBdnjwtinCq8MzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3/EW3sqniXruvG4u4S9qwToDsD3nZPuOvy+sp1yapw=;
 b=QGFy775mw4dtkFIAgXsmMGur0hVtX1weg9wbrPFlx2y7TDNzFpbeofL9/VtQUqzGyqeEBfluLE+bCH7WgvLZciU5Iu+yfzWKET14pPE80QosUIFcf7JA6DZznKeqHpnpIRJjBWNmsJs6KstKG4H2/BJRtf/7xqRSYP/Q9NkBDhs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 00/11] xen/arm: Add Armv8-R64 MPU support to Xen - Part#1
Date: Fri, 4 Nov 2022 18:07:30 +0800
Message-ID: <20221104100741.2176307-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT061:EE_|DU0PR08MB8710:EE_|DBAEUR03FT057:EE_|AS8PR08MB8183:EE_
X-MS-Office365-Filtering-Correlation-Id: cff1c07d-457a-4610-978e-08dabe4c80cd
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fydkYAjasSZ1yDtAksQdwOfLJwch3KrHJUfm3t/O1uGhAurWDa2RHJdwcTnqadBYGCjy9p2P+bu4bkTJ+t2Bov9zm4qnJjjpraBnsDcNTlpXQMRvYblOxDa/7zvh9I1qa2nnerRE1jOS+3vuYx7Hhj3TrddyyXB4pi3aypMzOKkypOX6C3E00wByUCO4gCwsVJ1adeC/1D55fVUBbgrz+OiDqq+GSaa0IrZ35fBAaSkfgkJ7fx6bxC0ir9sW0dgIcAXz5GG7KC+YuPjJIUm6thF/YqCQv8GmUiU9kzrXcyTYvDcDBCLlgJV2YriJfvJ9xuDUjn8v5CurZ3UCgXQv8BqnrgesGRE1x+dSniBLeV6jNkfda82BF/Ncv6pf90f+8RH0fFJ0k+b1CKXSNbr9gvdTc1DM/ycIGYve4H1y5tISgWlMV78MGIgh2U7moP+iPWIhwkAvNFKtbCjs7jmnZpzYAxtOb3BQK30afuD1YaDSK5LCG76xtJ8ooVWSgLNxgff2PN8I5Cb/Lx31fs1yMeQYv+quYBbwn+iAUJciDD3N9YmmQu0BYD1BO4mKQO9itjIHIZ5uFY5aMpyrRTULDet1K0W2JrDg3Kt0kHN0+biWTfqQLpaZgJPsJBWhvv4qcIiG0huy0nrPPy4BnKZYd2uRa99otZFUGc/hsBg2hqt534nyglzT9IvuKf5CB6baLnaEu2FARTI6QW7Hy4vE0a/hX+wH/96Gicc7sUxr6RPVURjm3HcCxf4Akn4UXCErIQUho8AcBTm50/xcm8EAqeQp0LyJHpl+26/2EKjePDPT9+cR3v0fgIInfdu3Hrtx9SOoIl9EAVGcUEVwAxqmJrySn+1TSFuRvgAVjoBPkaL5x6BinXNXWwI8v6FqeEWvGfY5gKxhD4dn0H/QrubsBg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(83380400001)(5660300002)(8936002)(426003)(47076005)(36860700001)(81166007)(2616005)(40460700003)(44832011)(54906003)(36756003)(41300700001)(186003)(1076003)(336012)(966005)(356005)(316002)(478600001)(7696005)(86362001)(40480700001)(2906002)(82310400005)(6666004)(26005)(70586007)(4326008)(70206006)(8676002)(6916009)(82740400003)(17413003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8710
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5481b931-21c8-405c-9039-08dabe4c7a5f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J2yELDOoWg4ndmHF1ZNcyU1rPxFHUe5LoxFj4Z2eaMEDtSensuMZLvJCWsso/flG9JI+uQ2NmPOgwJA59pzbYuctPqA69sZg6cdmV6nKwMHKky2VL6321U0SgqNSdb0yVzn2HB9KcmSWeHvjN5mfpL6KTVy58MJO1VoKr8Ru3ERfk83I15KDqm7w2yBMVW+fWSQD45Z6sLMEoTvZ2QUGEYZjWjk2su6YABzCliK84CazHtiLrH3pCEyOCzsvJX1NkKv8TgKEdxh4B/meKmtJHzbCg06aKLG8r/MPuG7MzPd/T6XFH/G+E/XMSB0R0gcSBnEOE4kdCf9QasTXDf0UomZAciT5uMv9amuFqSG35X9DVi6UoHPhA1MKO0l53Q8pAmMJO3nnuQyPfMUdS7Y6dF722BoJfDyNdRBLS/v8OCBOtyUVowUVwt+fwNvboLrwQmQ9fKoHx9ceBwNSrvZTXxtGfxlAtUQgHaXvSywImmJtrJlc8AbAIRc3wxziMekiykzh6ENXX3xnN4n9IOYQKHDbuO07IlazMY2Sl6vNj5tJHBpYjnsOX85/RHoIqIAchwlWDV2pMgDj3Oe511isXiD3/iQHnldAN15qpp5jig66sG46FZpcroUU9ynwBT+3wuwW1I+HytwWqPOje36u2TuWI0KKt+yipYYjv4gKjAamfFlittGc/TYHWi47hIqvmOTH+jNzhbLxYOBxpb3SNwk7m/Xq+4BSaol1ctaG9VK8DH00g6cVt9Lz6B9NY6QmpaF5wwTHG4jkhWyasVC7+11T5b2DXZbwgA1wMbLN/q3Tft71dymAtg9vcaRNC2GF72YHYcwAE7gdRYizx1ZXfp73BLRIHQ0U5d9ppdLRt2c=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(6916009)(54906003)(316002)(4326008)(36756003)(5660300002)(70206006)(7696005)(70586007)(40460700003)(8936002)(8676002)(41300700001)(44832011)(82310400005)(336012)(47076005)(36860700001)(426003)(81166007)(40480700001)(1076003)(186003)(2616005)(26005)(478600001)(966005)(82740400003)(83380400001)(107886003)(6666004)(86362001)(2906002)(17413003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 10:08:21.3939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cff1c07d-457a-4610-978e-08dabe4c80cd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8183

The Armv-R architecture profile was designed to support use cases
that have a high sensitivity to deterministic execution. (e.g.
Fuel Injection, Brake control, Drive trains, Motor control etc)

Arm announced Armv8-R in 2013, it is the latest generation Arm
architecture targeted at the Real-time profile. It introduces
virtualization at the highest security level while retaining the
Protected Memory System Architecture (PMSA) based on a Memory
Protection Unit (MPU). In 2020, Arm announced Cortex-R82,
which is the first Arm 64-bit Cortex-R processor based on Armv8-R64.
The latest Armv8-R64 document can be found [1]. And the features of
Armv8-R64 architecture:
  - An exception model that is compatible with the Armv8-A model
  - Virtualization with support for guest operating systems
  - PMSA virtualization using MPUs In EL2.
  - Adds support for the 64-bit A64 instruction set.
  - Supports up to 48-bit physical addressing.
  - Supports three Exception Levels (ELs)
        - Secure EL2 - The Highest Privilege
        - Secure EL1 - RichOS (MMU) or RTOS (MPU)
        - Secure EL0 - Application Workloads
 - Supports only a single Security state - Secure.
 - MPU in EL1 & EL2 is configurable, MMU in EL1 is configurable.

These patch series are implementing the Armv8-R64 MPU support
for Xen, which are based on the discussion of
"Proposal for Porting Xen to Armv8-R64 - DraftC" [1].

We will implement the Armv8-R64 and MPU support in three stages:
1. Boot Xen itself to idle thread, do not create any guests on it.
2. Support to boot MPU and MMU domains on Armv8-R64 Xen.
3. SMP and other advanced features of Xen support on Armv8-R64.

We will split these patches to several parts, this series is the
part#1, the full PoC can be found in [3]. More software for
Armv8-R64 can be found in [4];

[1] https://developer.arm.com/documentation/ddi0600/latest
[2] https://lists.xenproject.org/archives/html/xen-devel/2022-05/msg00643.html
[3] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/tree/poc/r82-mpu-v2
[4] https://armv8r64-refstack.docs.arm.com/en/v4.0/

Penny Zheng (3):
  xen/arm64: create boot-time MPU protection regions
  xen/arm64: introduce helpers for MPU enable/disable
  xen/arm64: add setup_fixmap and remove_identity_mapping for MPU

Wei Chen (8):
  xen/arm: remove xen_phys_start and xenheap_phys_end from config.h
  xen/arm: add iounmap after initrd has been loaded in domain_build
  xen/arm: disable EFI boot services for MPU systems
  xen/arm: adjust Xen TLB helpers for Armv8-R64 PMSA
  xen/arm: define Xen start address for FVP BaseR platform
  xen/arm: split MMU and MPU config files from config.h
  xen/arm: implement FIXMAP_ADDR for MPU systems
  xen/arm64: move MMU related code from head.S to head_mmu.S

 xen/arch/arm/Kconfig                          |  15 +-
 xen/arch/arm/arm64/Makefile                   |   5 +
 xen/arch/arm/arm64/head.S                     | 429 ++----------------
 xen/arch/arm/arm64/head_mmu.S                 | 364 +++++++++++++++
 xen/arch/arm/arm64/head_mpu.S                 | 154 +++++++
 xen/arch/arm/domain_build.c                   |   2 +
 xen/arch/arm/include/asm/arm64/flushtlb.h     |  25 +
 xen/arch/arm/include/asm/arm64/macros.h       |  52 ++-
 xen/arch/arm/include/asm/arm64/mpu.h          |  13 +
 xen/arch/arm/include/asm/arm64/sysregs.h      |  89 ++++
 xen/arch/arm/include/asm/config.h             |  99 +---
 xen/arch/arm/include/asm/config_mmu.h         | 119 +++++
 xen/arch/arm/include/asm/config_mpu.h         |  29 ++
 xen/arch/arm/include/asm/fixmap.h             |  25 +
 xen/arch/arm/include/asm/flushtlb.h           |  22 +
 .../arm/include/asm/platforms/fvp_baser.h     |  18 +
 xen/arch/arm/platforms/Kconfig                |  16 +-
 17 files changed, 976 insertions(+), 500 deletions(-)
 create mode 100644 xen/arch/arm/arm64/head_mmu.S
 create mode 100644 xen/arch/arm/arm64/head_mpu.S
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h
 create mode 100644 xen/arch/arm/include/asm/config_mmu.h
 create mode 100644 xen/arch/arm/include/asm/config_mpu.h
 create mode 100644 xen/arch/arm/include/asm/platforms/fvp_baser.h

-- 
2.25.1


