Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1127522925
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 03:47:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326081.548966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobRt-0007Ub-J1; Wed, 11 May 2022 01:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326081.548966; Wed, 11 May 2022 01:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobRt-0007Mi-6r; Wed, 11 May 2022 01:47:33 +0000
Received: by outflank-mailman (input) for mailman id 326081;
 Wed, 11 May 2022 01:47:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMk+=VT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nobRq-0004GM-PB
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 01:47:31 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe05::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50fedb6d-d0cc-11ec-a406-831a346695d4;
 Wed, 11 May 2022 03:47:29 +0200 (CEST)
Received: from AM6P191CA0099.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::40)
 by DB9PR08MB6571.eurprd08.prod.outlook.com (2603:10a6:10:25b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 11 May
 2022 01:47:27 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::e2) by AM6P191CA0099.outlook.office365.com
 (2603:10a6:209:8a::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 01:47:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 01:47:26 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Wed, 11 May 2022 01:47:26 +0000
Received: from 68f414d756f5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 25623349-8630-422B-A945-4B0CB7E35660.1; 
 Wed, 11 May 2022 01:47:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 68f414d756f5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 01:47:20 +0000
Received: from DB6P193CA0013.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::23) by
 DB7PR08MB3355.eurprd08.prod.outlook.com (2603:10a6:5:18::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.22; Wed, 11 May 2022 01:47:18 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::9e) by DB6P193CA0013.outlook.office365.com
 (2603:10a6:6:29::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Wed, 11 May 2022 01:47:18 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 01:47:18 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Wed, 11 May
 2022 01:47:19 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 11 May 2022 01:47:16 +0000
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
X-Inumbo-ID: 50fedb6d-d0cc-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=oV5j7ZYIkeRVvk11DYaw0fTklNgsogFNxhOf4/XHTIn5JzS7593K5t6thKKqowa4OVmJkuFTZwRA5rEFaLtZrFpXasgrDlwAHw26zodjoRMLhVu6/UjylJwAts+pNE1JZ+/rckJgyaoh9RWCtyI3Vy+Fkm3UJIDg+OkW+GAasg2m/Xex/hCC+CHJV4y2bTa9QYMzycrV0+Rvb+pyJAGOip3RTUmFtd9Lk+Az1IVZJRmNqhc8r+bKr+zWZ9Pe9yj2oaOYU/Of339TbPUkofOxbeoc5COkA/5A4Q2XJh8tNh1+Gx/PFVKPD1RRvGJshP6R8vuNBbNOATeZF7Hq2nWPmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oq8z5BQ/mKL1DPmKTInyHTA5bNRXdCnGU2Y2WkTA6Sw=;
 b=A52DrO1Xik5qegCDhLqoKbjtKBW1/th3zYhH/ucVY3VOAhw97aLFbOWHGVfTSyb0UZl1un3uhUJCIzTUE7XY6TzYVwSa3ORcdJusPKXynS/04IwRRW4TC/o6Y1xagZD8d/DvI2RjDEznk6Ofyr2RIVHziHtk5aTIAIITXCf3azafd/tx4NhW/5FbyOCFozAPk6y6q6kwrbccx8GlG6l3Fm8mKp3iccqWBeM/TbVhytUHymfgQ39DOCBm1+UdS8hFKJQ7GWxoaUzHqECEs0IOlyU4eLV56tZ1mnrs2MCuQogTYeiH3bEnANULm/HqAtujETotlsvUwjXlr7ZVYm+H1A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq8z5BQ/mKL1DPmKTInyHTA5bNRXdCnGU2Y2WkTA6Sw=;
 b=ElnQyV4vg23T9YU3nZsm2v5RYFcP/3Drs9nUuf2YLopcnUcRw14nWjeX9fj+1euIGuEPlOcjPjPtNLfMjGN2fch00mmzwjuMajuCa97beRLgbyIk6Q1TYNN+wSU5v3sfS3USlsvFunoEo3xaW1oCBNrBwnztx37dVOEowyyWB9U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6a0f21928d7e6863
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDzO566/WTtwdBvlANSZRebPv1+1MfOEznij5Cl4ycuMWMyRbzMjBvRN4O90ETdSXNJ68u0g5X5HSS3PnMYAZ23HlfbBCxX8W1d2VvZPWR2GPIODqFZ8PNIFFn0AOO6Ckbtw6W9x/xO9w0idMeqcf1BYDFZyWID3pn7KnSHKUJ/sVc1XKpquo7RYXpCayEzpkgZvuiUIY8hCmUwraM5uN0jRBJX5NHJs5aXOTUbleZrOoXBqwnvAwxunSII5+571lDV3EWdn+UjQij+1Q6PAd5LzqwAFfP+WL3DfegeLYoMJtloZlkD2SVTre+j5zmNHld/qKwnacHUIxqoeGEGHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oq8z5BQ/mKL1DPmKTInyHTA5bNRXdCnGU2Y2WkTA6Sw=;
 b=T6vbOtBaH+T/afHD6LUTkz8eqjfW7npbPT81mya+l/dG/RFIN7p063+bbokB2eEedyEnpQk4vDohIIjxWXoZ/pcy7Eua5/C133skTn/IgAYnniO9EKILP2GG7UQvPXq6sHw255pI/wg4uCj5qipvlu1vEIbxwGWBhSdjot5VWVf+rO8D+E/1QtWr440tgMFa+xwx8JqXMVOq5faAcBx++Vax4bFqW7NGnQ2MR+oUAaw5UCOCG3wvngtxUckWq+I8E4u9cUp1DLNzwPJMs5Y3Q9pPOoNyEINWROabQSVNgx9hihBmY940TWT5JdEw3fIENs3zO5kSNUcBTzxN03RgCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq8z5BQ/mKL1DPmKTInyHTA5bNRXdCnGU2Y2WkTA6Sw=;
 b=ElnQyV4vg23T9YU3nZsm2v5RYFcP/3Drs9nUuf2YLopcnUcRw14nWjeX9fj+1euIGuEPlOcjPjPtNLfMjGN2fch00mmzwjuMajuCa97beRLgbyIk6Q1TYNN+wSU5v3sfS3USlsvFunoEo3xaW1oCBNrBwnztx37dVOEowyyWB9U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v3 8/9] xen/x86: add detection of memory interleaves for different nodes
Date: Wed, 11 May 2022 09:46:38 +0800
Message-ID: <20220511014639.197825-9-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511014639.197825-1-wei.chen@arm.com>
References: <20220511014639.197825-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 1ffc81a7-0d17-4762-f01f-08da32f033c6
X-MS-TrafficTypeDiagnostic:
	DB7PR08MB3355:EE_|VE1EUR03FT051:EE_|DB9PR08MB6571:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB65713A22091003584C6A0BBB9EC89@DB9PR08MB6571.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6S1QDcss7gzOhkrE9xVM1G4YAPn5IUfjvFr7g9pUbNXFL7B7XVjJIR41fOL3odLJGtu9Mi1jaOD2S26jLmht++LOFb6hEkMyohUGqBgQctaizEN+tsMW/nJG1Ep1/s0SqA1+XQnxNpEgo1JTSym2E4e7wD9XSepnHIrAHS0REWM9rj3GWvOcoxPni0lcnFuR5TeMXdPT9AwhQc4DWOgAueFp4bAvLnsfRlC8ue+KvfP43+CLbSpbAN9QVrZXC6+K7+mY5tiwSL2niXdwoxOG9Ek/JMg4WgEro59sCSPeXLTgqAchcOrkZXoyOjTZH3VqbDsatlUDPPCMKj2zDaPc44bmxxoN3eX/z3IrM9dW+2cVVz8ZLHTMahOSMy79fFwoAU4OcyBXRX1x1Ncto1Ub3NyVUeNQRwcstrIIn0PwpFeWJNtDTV/7scJ3ZaHleLhLo+gm6QWflTM+9f7EhYr3RhOhqy5kpk7mV9TovuJiAM1DVWRLdHuTc8ttJNEb1xXepJmkNGMOXHQvYR5iiUOU+sxoyX9APvoxzCFsseNY7sZqI7G3AokVAZuykyQnYqSQquYkpZHQD2w5Re7xMr6e8FAtR4n8ux96UDNfWOM8BS4V0vgAOOGrVO239iF732EGvrZv51jsiGrRFfW9KT9z0tHcCmpu3/0zCeAnkTS8/S4JThpFwDVG8eNrYXKmsCGj6A0ZiZUJvtsiYVvVMhXqVw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(82310400005)(1076003)(2906002)(36860700001)(36756003)(8936002)(5660300002)(44832011)(8676002)(70206006)(4326008)(70586007)(186003)(6916009)(83380400001)(54906003)(86362001)(40460700003)(2616005)(26005)(336012)(7696005)(47076005)(6666004)(426003)(81166007)(316002)(356005)(508600001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3355
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31acf92d-5c68-4993-663f-08da32f02ed5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bCcgO4B++ppF3FpvhMCbK2IRMrBeznYvWUHNzHPSgRkNoxgxP9EMZMoe98Po0G1OdWVVf/v2M35pIqnqTGL563MUIqHMumi6+VbAEHQxqlDLmAO6un7YNtlNPpi2kxfS342/dbryvO+5ue1ML+cd9U0+Y9ba/x1FWixeonTmwDOWu2nUMLg9Tt6/YskrBGVwUXuSaj0/yb1lhnisaMO3cBNPCDCBlGgBauZfnWhV0P650YzgoVHvHFfH8haJmjxOQpYV8tZTZ7B5YftOsX78LNarG/3lztTa+nsweELvXPBJDLPttYTOW5mJJsOSkdP4xtKQithzHlbURHCHdVATm8jF9NS3RkFB22nTcsFq2nC1DEt7TGqzdBxihYeB8CT4n6DlscrxUSH0r1im86QxaCQn4OYFt7rohZYrBA0iQ6O9cdgRfSzlrX5H2RZL+/XdsqC3MOc80skG7keRyYPq4vap9qpLxJAAfQ/DCzaFvToXHk9a8TUcb2BR2fF3MLrqWtY5K34QtLGp2DSH+RhljMgfmDMs58Z0Qy7wBNUItQTwCJzgfrwpBqsR3zeA3p5vN1efp8ZKZISf56hIzk/4APFjMoKynJg722FFnq7Q7vSlBAHI1NDxVmlaMsExgTDSoz8DG+qIhd2gyiAL8AYom+D2DeNWowoUMsRMz1uZUyu6+f0ff0VAN/AGFBJey9aa
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(81166007)(83380400001)(336012)(426003)(47076005)(82310400005)(2616005)(1076003)(6666004)(7696005)(6916009)(54906003)(186003)(40460700003)(8936002)(5660300002)(26005)(36860700001)(70206006)(70586007)(2906002)(316002)(8676002)(4326008)(44832011)(36756003)(508600001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 01:47:26.7624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffc81a7-0d17-4762-f01f-08da32f033c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6571

One NUMA node may contain several memory blocks. In current Xen
code, Xen will maintain a node memory range for each node to cover
all its memory blocks. But here comes the problem, in the gap of
one node's two memory blocks, if there are some memory blocks don't
belong to this node (remote memory blocks). This node's memory range
will be expanded to cover these remote memory blocks.

One node's memory range contains other nodes' memory, this is
obviously not very reasonable. This means current NUMA code only
can support node has no interleaved memory blocks. However, on a
physical machine, the addresses of multiple nodes can be interleaved.

So in this patch, we add code to detect memory interleaves of
different nodes. NUMA initialization will be failed and error
messages will be printed when Xen detect such hardware configuration.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
---
v2 -> v3:
1. Merge the check code from a separate function to
   conflicting_memblks. This will reduce the loop
   times of node memory blocks.
2. Use an enumeration to indicate conflict check status.
3. Use a pointer to get conflict memory block id.
v1 -> v2:
1. Update the description to say we're after is no memory
   interleaves of different nodes.
2. Only update node range when it passes the interleave check.
3. Don't use full upper-case for "node".
---
 xen/arch/x86/srat.c | 115 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 86 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 8ffe43bdfe..53835ae3eb 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -42,6 +42,12 @@ static struct node node_memblk_range[NR_NODE_MEMBLKS];
 static nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
 static __initdata DECLARE_BITMAP(memblk_hotplug, NR_NODE_MEMBLKS);
 
+enum conflicts {
+	NO_CONFLICT = 0,
+	ERR_OVERLAP,
+	ERR_INTERLEAVE,
+};
+
 static inline bool node_found(unsigned idx, unsigned pxm)
 {
 	return ((pxm2node[idx].pxm == pxm) &&
@@ -119,20 +125,43 @@ int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
 	return 0;
 }
 
-static __init int conflicting_memblks(paddr_t start, paddr_t end)
+static enum conflicts __init
+conflicting_memblks(nodeid_t nid, paddr_t start, paddr_t end,
+		    paddr_t nd_start, paddr_t nd_end, int *mblkid)
 {
 	int i;
 
+	/*
+	 * Scan all recorded nodes' memory blocks to check conflicts:
+	 * Overlap or interleave.
+	 */
 	for (i = 0; i < num_node_memblks; i++) {
 		struct node *nd = &node_memblk_range[i];
+		*mblkid = i;
+
+		/* Skip 0 bytes node memory block. */
 		if (nd->start == nd->end)
 			continue;
+		/*
+		 * Use memblk range to check memblk overlaps, include the
+		 * self-overlap case.
+		 */
 		if (nd->end > start && nd->start < end)
-			return i;
+			return ERR_OVERLAP;
 		if (nd->end == end && nd->start == start)
-			return i;
+			return ERR_OVERLAP;
+		/*
+		 * Use node memory range to check whether new range contains
+		 * memory from other nodes - interleave check. We just need
+		 * to check full contains situation. Because overlaps have
+		 * been checked above.
+		 */
+	        if (nid != memblk_nodeid[i] &&
+		    (nd_start < nd->start && nd->end < nd_end))
+			return ERR_INTERLEAVE;
 	}
-	return -1;
+
+	return NO_CONFLICT;
 }
 
 static __init void cutoff_node(int i, paddr_t start, paddr_t end)
@@ -275,6 +304,9 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 {
+	enum conflicts status;
+	struct node *nd;
+	paddr_t nd_start, nd_end;
 	paddr_t start, end;
 	unsigned pxm;
 	nodeid_t node;
@@ -310,42 +342,67 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		bad_srat();
 		return;
 	}
+
+	/*
+	 * For the node that already has some memory blocks, we will
+	 * expand the node memory range temporarily to check memory
+	 * interleaves with other nodes. We will not use this node
+	 * temp memory range to check overlaps, because it will mask
+	 * the overlaps in same node.
+	 *
+	 * Node with 0 bytes memory doesn't need this expandsion.
+	 */
+	nd_start = start;
+	nd_end = end;
+	nd = &nodes[node];
+	if (nd->start != nd->end) {
+		if (nd_start > nd->start)
+			nd_start = nd->start;
+
+		if (nd_end < end)
+			nd_end = nd->end;
+	}
+
 	/* It is fine to add this area to the nodes data it will be used later*/
-	i = conflicting_memblks(start, end);
-	if (i < 0)
-		/* everything fine */;
-	else if (memblk_nodeid[i] == node) {
-		bool mismatch = !(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
-		                !test_bit(i, memblk_hotplug);
-
-		printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
-		       mismatch ? KERN_ERR : KERN_WARNING, pxm, start, end,
-		       node_memblk_range[i].start, node_memblk_range[i].end);
-		if (mismatch) {
+	status = conflicting_memblks(node, start, end, nd_start, nd_end, &i);
+	if (status == ERR_OVERLAP) {
+		if (memblk_nodeid[i] == node) {
+			bool mismatch = !(ma->flags &
+					ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
+			                !test_bit(i, memblk_hotplug);
+
+			printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
+			       mismatch ? KERN_ERR : KERN_WARNING, pxm, start,
+			       end, node_memblk_range[i].start,
+			       node_memblk_range[i].end);
+			if (mismatch) {
+				bad_srat();
+				return;
+			}
+		} else {
+			printk(KERN_ERR
+			       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
+			       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
+			       node_memblk_range[i].start,
+			       node_memblk_range[i].end);
 			bad_srat();
 			return;
 		}
-	} else {
+	} else if (status == ERR_INTERLEAVE) {
 		printk(KERN_ERR
-		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
-		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
+		       "SRAT： Node %u: (%"PRIpaddr"-%"PRIpaddr") interleaves with node %u memblk (%"PRIpaddr"-%"PRIpaddr")\n",
+		       node, nd_start, nd_end, memblk_nodeid[i],
 		       node_memblk_range[i].start, node_memblk_range[i].end);
 		bad_srat();
 		return;
 	}
-	if (!(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE)) {
-		struct node *nd = &nodes[node];
 
-		if (!node_test_and_set(node, memory_nodes_parsed)) {
-			nd->start = start;
-			nd->end = end;
-		} else {
-			if (start < nd->start)
-				nd->start = start;
-			if (nd->end < end)
-				nd->end = end;
-		}
+	if (!(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE)) {
+		node_set(node, memory_nodes_parsed);
+		nd->start = nd_start;
+		nd->end = nd_end;
 	}
+
 	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
 	       node, pxm, start, end,
 	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
-- 
2.25.1


