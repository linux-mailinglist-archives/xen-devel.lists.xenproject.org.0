Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0E4605730
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 08:15:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426153.674457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olOpv-00037g-4N; Thu, 20 Oct 2022 06:15:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426153.674457; Thu, 20 Oct 2022 06:15:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olOpu-000342-Qw; Thu, 20 Oct 2022 06:15:22 +0000
Received: by outflank-mailman (input) for mailman id 426153;
 Thu, 20 Oct 2022 06:15:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=umfN=2V=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1olOps-0002BJ-US
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 06:15:20 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2058.outbound.protection.outlook.com [40.107.247.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91d8ca22-503e-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 08:15:18 +0200 (CEST)
Received: from DU2PR04CA0204.eurprd04.prod.outlook.com (2603:10a6:10:28d::29)
 by DU0PR08MB7812.eurprd08.prod.outlook.com (2603:10a6:10:3b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Thu, 20 Oct
 2022 06:15:16 +0000
Received: from DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::24) by DU2PR04CA0204.outlook.office365.com
 (2603:10a6:10:28d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26 via Frontend
 Transport; Thu, 20 Oct 2022 06:15:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT054.mail.protection.outlook.com (100.127.142.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Thu, 20 Oct 2022 06:15:16 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Thu, 20 Oct 2022 06:15:16 +0000
Received: from a8e266bfd540.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6C428D65-0EF9-486D-9B67-1C8579B16092.1; 
 Thu, 20 Oct 2022 06:15:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8e266bfd540.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Oct 2022 06:15:10 +0000
Received: from DB8PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:10:110::35)
 by AS8PR08MB6407.eurprd08.prod.outlook.com (2603:10a6:20b:33e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 20 Oct
 2022 06:15:07 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::d8) by DB8PR04CA0025.outlook.office365.com
 (2603:10a6:10:110::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Thu, 20 Oct 2022 06:15:07 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Thu, 20 Oct 2022 06:15:07 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Thu, 20 Oct
 2022 06:15:06 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Thu, 20 Oct 2022 06:15:03 +0000
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
X-Inumbo-ID: 91d8ca22-503e-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=efy58adiWwYTGTczPal7Cvifrq1HYP5JdkiHjID1EerqCEb2xMwQO95hADd7R5F324QSJFGjvd1gN342ao2pepRRN8HNk5cD7vIaXAHMT274SN82VWrX2X9Z4Byoc+OgkIB8tn3GISl3Jx7fNRl1DB0TxaJyOqmUCK+uw4WVlxFvYxWo3p+lh8gzpdejtrkFTULWoxZ0jOSUi5PX3lECMmXo0ZZpOknuUsxacZ6pFFmsGEZk/GHf4b+PHz8vcyTvW/Qp90ZEj9J+V0sU8cyAwEkqUh8N3/X0/HvSBcpIOXbzigseFqw0aHrh8g4DCdF0QIt+Rz+8l5rhbwhe6pp2Ww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=me1rkhKCFKXNKIcsR7o38t7l8niAuonnluIDnY1Civo=;
 b=efue8/Ou9uxfQ6HHLIcfafO8troP/OU0sddfdTtxI5l6odcGO9kH/a6ikuZr0Pjfmf6daKWCgdmgnrv1x+SdL6pimyChJybDrD30CNU1qIqcll5B/Bt3lkjzkV36/bcByd+uvn7GL/KLCb0xFLfmWoX3UnBXINZZdtRU/6kQQ/Jc+dPqY5VEwOF7yNgp/VYk9G1cRA6cKmlCLFjzHq27+JGSWKn4voJq+dzRr4/UGnO62MTS6rP+nLhd/z6WLfYONr3EvaL3jUnf0ksMBulnpD80iH+rVkuXZsV1gahHVMO8EWDvsUFv0trYXVjPoN8GM1EBBaFAncFbrs6/MWoz1Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=me1rkhKCFKXNKIcsR7o38t7l8niAuonnluIDnY1Civo=;
 b=tzkyRq5k4e05UQIDGwgLNl05EhKXCtPfBQggGLCseoCln7evwA5UNZCiQ8r4YGmrPPJuTlf3qT7hljjX2Cb9Lboi8JnQ0zt28QyW+5MCDwRIPcXnmhp21vRtIb6uL90lRRITzK/7PUp/+BAQGvqchmXcE4MwidWgoxHgHuVvaiA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e869cceb156bf5f0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgvyGxIemSj9Nrt7W5fm1iLNFTXfmGpBp9cZkNZk3CmCyChRoTIECOsm4fAyZyaOQ2fWAS8KQq5XvfeNLDrVziOyOmKd2D9T/vcSpyXgDKHUPefjiTiy1EL7OiNuT3h2SsenLjHaYe81iiMr4y60h6YGM+Kt/vdbkiMs93gND/UxJE7pRGhKLLOUWPbc7JTrpIXHrGvB4N3HMUYq2bx53Ok6v2iSwLbz6r66yXJUdmRls+y2lpWGEJekw7abKw8EApliDylv2Ydhjx9FmRxxdgCWnuBssIhex2Vxb20wApglRklHHtWcoIOQpxVbw1NuCT5OIBVROICeesrAHtIKbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=me1rkhKCFKXNKIcsR7o38t7l8niAuonnluIDnY1Civo=;
 b=TT4wxpuHHQDRZhDFiiK2Zrtw7jpAfbpjuGJUqXi+uyibIPLHI0T5UqQ13mCORUXwLNwWD4RoNON6BiDe4H6MdXU4s69w3KmvxujbW/EzxfvEd94800CI0eQJVteC+kDzkPWGfQUm8o8/u1cxMO8LKG65yugLMRJ6FI8mNSoLLIbr2IVAaHWZD2p38uJQO9O4VNHTVbrdwjl/ywfh7U3aydrFVViRq32YEIryoWlSb1ZUlDzDQltTNbcGHtkMjBAztffrQdd9K+SU6vHrsAuQfrH6o83R7UC0OaeiOfOPUbixGc4QnH+IwZmAqoKNOGuSyzy79TLPPJird3W57SK4Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=me1rkhKCFKXNKIcsR7o38t7l8niAuonnluIDnY1Civo=;
 b=tzkyRq5k4e05UQIDGwgLNl05EhKXCtPfBQggGLCseoCln7evwA5UNZCiQ8r4YGmrPPJuTlf3qT7hljjX2Cb9Lboi8JnQ0zt28QyW+5MCDwRIPcXnmhp21vRtIb6uL90lRRITzK/7PUp/+BAQGvqchmXcE4MwidWgoxHgHuVvaiA=
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
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 4/6] xen/x86: use arch_get_ram_range to get information from E820 map
Date: Thu, 20 Oct 2022 14:14:43 +0800
Message-ID: <20221020061445.288839-5-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020061445.288839-1-wei.chen@arm.com>
References: <20221020061445.288839-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT025:EE_|AS8PR08MB6407:EE_|DBAEUR03FT054:EE_|DU0PR08MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f67739-1db8-4cd3-6241-08dab26274e9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Lz7x1CWnLpzFV8qQUpXXqgeUkcH4Hi9HhOfj9HfKeAa3pOYVGlVJJe5b16SWv4thl5iw9jzHfgUcVOa4/YdutS9NUkOZZWO+be3len1cSIBT9RYCILB57euyfBnCBhKH5Tp4+8Itkp2RURdkr75RGPYZtYuT/SLvHHXWdgww57Ic/EnDOWOuG2WSxIWNFfDCq+Idk5wUnzgrOssRUSY8FgaqYvZNDuMQRIjt/dpHAeWt2q7ePxw6iidxatvykoGfc2V8EFO5sYX3LXHTmEpsqPHoJZtNSGOA8qeEYRHZ2Ycvus4l+w9CMWbIleBw15/XBv9j8pYgXIAe6jfuU1r4ZfOiVNrs41B0ApeDIqdlPTlYatejsi+LvviqKvsphxmN6oKxH2/QKNM7SrcaP3qL5hodnz9tDmDEKcFu10i4w90u2gJjqNS54oNhZW3L4zXnvMpg8LpSeL182bKWtCznDK/EU+dXeh7lzD6+SfTn7DN7nvnqvWy2phEw0KJlCyA4mMegusU1mZRlwXOEBftRvEKA0qBfzsq1Kg08ZQCQA2up3cWUZ2KkyCxrD0zpOC/bt3WJ8QqadBt4Y6w62I4bjoJCsqR2Gkdu/GlIXUi9jVJTDqn7oxeOdzCdDbtmdLcZvhV+SGwbGFJ2IPEUzUAPU12c7VAaJB87iEKgY4iSdaiQ7C3jFLbohu1t83RTh8KDSq1NYZ3/bsKOnwZ8DugfI9U1ojBgrApFOBTQ/tDHNGaABHbsgJwoBE1fukTAvMuU4BNxXC7IIgpFtj849lqAARVFgyIfgj3aVvTXu2CP+U0uYgbQL7KSGwTCMLduzC51
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199015)(36840700001)(40470700004)(46966006)(36756003)(86362001)(82740400003)(356005)(81166007)(2906002)(83380400001)(426003)(44832011)(40460700003)(5660300002)(47076005)(40480700001)(1076003)(186003)(26005)(2616005)(6666004)(336012)(36860700001)(7696005)(6916009)(478600001)(54906003)(316002)(82310400005)(8936002)(8676002)(70586007)(4326008)(41300700001)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6407
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b0ef59ff-758a-41a8-750c-08dab2626fa1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XiaYPmKNfvupWOz6uVGq6m+DzzSDfeCacc9h0YQ9778PXR6Nl39MGT5pbwO8M8CQ9jopteotrt732R9OJLyfbPpzogRfUOK675HK/Fi2/DmEHA1X7VHR/UdqrRdUgQf0sRGvRzq7mCWeJElK4jYo8d1Jx+IQKgqZ7xaxlonJkE4veiXsrdHU73Kkhca7nreiGVE6D55vtTXdlrtyjsjXE0W5Fm1Fkl+RSI+79aKx2FPMSR4JAbz+99ZWjf2XryL/4C84QXEIx3WzosM+BMDuwc2DO4UlcXw28Nspef0FgjTASg8nvar/tuKQPMltDx9ZHID3V+ZYY6tFwuGqWa4V6FyeUAeMroYqzlnzn9SPWtn/X226NtDffJ6e+DUB4sOeD9kxJv6s2okYzsnyQxMGmpG7WgofEbkgKefxDfUcHE47w5FDlMEybzsiTkncniCsdBI3hTYP7ytwJrK0m/OU8nm2zGpiWzf3xDAWZUa+5WrT1Nn6c37KcvTZkgCkP9RFzTAKJY4Unng1Md3AMQYMadMsIARU4thSdlgSyKX+pBd8T5A6oKNPapn88auqA0MBQy32A2+UpnrWDmoUgbNeVtzpsIOoxoJEauzHNBnH9wwIWKxgU+xv98401+gtdwLJVxQ7vQpMLI9frH8XqCFxF6XKE823vFu+xWaB21PcjQjJZiGH8JN1IKfsCPsliyDKuUysaz8A7Ti+aLOabItC5YjWdYH/rCuQt7K+nry8UT6gr2Pm7v5xTun9vef38Cm1I3mUsATq5V/omvCiwY9ntQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199015)(46966006)(40470700004)(36840700001)(70206006)(86362001)(40480700001)(1076003)(6916009)(54906003)(316002)(70586007)(6666004)(81166007)(2906002)(5660300002)(186003)(40460700003)(8676002)(4326008)(7696005)(336012)(2616005)(107886003)(47076005)(426003)(36756003)(44832011)(82740400003)(83380400001)(41300700001)(478600001)(82310400005)(26005)(8936002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 06:15:16.4337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f67739-1db8-4cd3-6241-08dab26274e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7812

The sanity check of nodes_cover_memory is also a requirement of
other architectures that support NUMA. But now, the code of
nodes_cover_memory is tied to the x86 E820. In this case, we
introduce arch_get_ram_range to decouple architecture specific
memory map from this function. This means, other architectures
like Arm can also use it to check its node and memory coverage
from bootmem info.

Depends arch_get_ram_range, we make nodes_cover_memory become
architecture independent. We also use neutral words to replace
SRAT and E820 in the print message of this function. This will
to make the massage seems more common.

As arch_get_ram_range use unsigned int for index, we also adjust
the index in nodes_cover_memory from int to unsigned int.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v6 -> v7:
1. No change.
v5 -> v6:
1. No change.
v4 -> v5:
1. Add Rb.
2. Adjust the code comments.
v3 -> v4:
1. Move function comment to header file.
2. Use bool for found, and add a new "err" for the return
   value of arch_get_ram_range.
3. Use -ENODATA instead of -EINVAL for non-RAM type ranges.
v2 -> v3:
1. Rename arch_get_memory_map to arch_get_ram_range.
2. Use -ENOENT instead of -ENODEV to indicate end of memory map.
3. Add description to code comment that arch_get_ram_range returns
   RAM range in [start, end) format.
v1 -> v2:
1. Use arch_get_memory_map to replace arch_get_memory_bank_range
   and arch_get_memory_bank_number.
2. Remove the !start || !end check, because caller guarantee
   these two pointers will not be NULL.
---
 xen/arch/x86/numa.c    | 15 +++++++++++++++
 xen/arch/x86/srat.c    | 30 ++++++++++++++++++------------
 xen/include/xen/numa.h | 13 +++++++++++++
 3 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 90b2a22591..fa8caaa084 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -9,6 +9,7 @@
 #include <xen/nodemask.h>
 #include <xen/numa.h>
 #include <asm/acpi.h>
+#include <asm/e820.h>
 
 #ifndef Dprintk
 #define Dprintk(x...)
@@ -93,3 +94,17 @@ unsigned int __init arch_get_dma_bitsize(void)
                  flsl(node_start_pfn(node) + node_spanned_pages(node) / 4 - 1)
                  + PAGE_SHIFT, 32);
 }
+
+int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
+{
+    if ( idx >= e820.nr_map )
+        return -ENOENT;
+
+    if ( e820.map[idx].type != E820_RAM )
+        return -ENODATA;
+
+    *start = e820.map[idx].addr;
+    *end = *start + e820.map[idx].size;
+
+    return 0;
+}
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index ce507dac9e..1a108a34c6 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -452,37 +452,43 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
    Make sure the PXMs cover all memory. */
 static int __init nodes_cover_memory(void)
 {
-	int i;
+	unsigned int i;
 
-	for (i = 0; i < e820.nr_map; i++) {
-		int j, found;
+	for (i = 0; ; i++) {
+		int err;
+		unsigned int j;
+		bool found;
 		paddr_t start, end;
 
-		if (e820.map[i].type != E820_RAM) {
-			continue;
-		}
+		/* Try to loop memory map from index 0 to end to get RAM ranges. */
+		err = arch_get_ram_range(i, &start, &end);
 
-		start = e820.map[i].addr;
-		end = e820.map[i].addr + e820.map[i].size;
+		/* Reached the end of the memory map? */
+		if (err == -ENOENT)
+			break;
+
+		/* Skip non-RAM entries. */
+		if (err)
+			continue;
 
 		do {
-			found = 0;
+			found = false;
 			for_each_node_mask(j, memory_nodes_parsed)
 				if (start < nodes[j].end
 				    && end > nodes[j].start) {
 					if (start >= nodes[j].start) {
 						start = nodes[j].end;
-						found = 1;
+						found = true;
 					}
 					if (end <= nodes[j].end) {
 						end = nodes[j].start;
-						found = 1;
+						found = true;
 					}
 				}
 		} while (found && start < end);
 
 		if (start < end) {
-			printk(KERN_ERR "SRAT: No PXM for e820 range: "
+			printk(KERN_ERR "NUMA: No NODE for RAM range: "
 				"[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
 			return 0;
 		}
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 04556f3a6f..9da0e7d555 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -80,6 +80,19 @@ static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
 #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
                                  NODE_DATA(nid)->node_spanned_pages)
 
+/*
+ * This function provides the ability for caller to get one RAM entry
+ * from architectural memory map by index.
+ *
+ * This function will return zero if it can return a proper RAM entry.
+ * Otherwise it will return -ENOENT for out of scope index, or other
+ * error codes, e.g. return -ENODATA for non-RAM type memory entry.
+ *
+ * Note: the range is exclusive at the end, e.g. [*start, *end).
+ */
+extern int arch_get_ram_range(unsigned int idx,
+                              paddr_t *start, paddr_t *end);
+
 #endif
 
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


