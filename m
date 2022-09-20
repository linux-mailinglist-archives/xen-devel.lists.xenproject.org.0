Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2E75BE186
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 11:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409249.652250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaZJL-0004Vz-Ta; Tue, 20 Sep 2022 09:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409249.652250; Tue, 20 Sep 2022 09:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaZJL-0004Td-QC; Tue, 20 Sep 2022 09:12:59 +0000
Received: by outflank-mailman (input) for mailman id 409249;
 Tue, 20 Sep 2022 09:12:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UnT0=ZX=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oaZJJ-0003bZ-Vs
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 09:12:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60049.outbound.protection.outlook.com [40.107.6.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a368fe5-38c4-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 11:12:57 +0200 (CEST)
Received: from AS9PR06CA0456.eurprd06.prod.outlook.com (2603:10a6:20b:49a::11)
 by AS2PR08MB8310.eurprd08.prod.outlook.com (2603:10a6:20b:555::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Tue, 20 Sep
 2022 09:12:54 +0000
Received: from AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49a:cafe::5a) by AS9PR06CA0456.outlook.office365.com
 (2603:10a6:20b:49a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT030.mail.protection.outlook.com (100.127.140.180) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 09:12:54 +0000
Received: ("Tessian outbound 88978e6d60db:v124");
 Tue, 20 Sep 2022 09:12:54 +0000
Received: from 6d011e1fd59d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 91E0E803-15F5-4B8D-8110-3CB6643F3017.1; 
 Tue, 20 Sep 2022 09:12:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6d011e1fd59d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Sep 2022 09:12:47 +0000
Received: from FR3P281CA0107.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a3::17)
 by AM7PR08MB5528.eurprd08.prod.outlook.com (2603:10a6:20b:dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 09:12:45 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a3:cafe::12) by FR3P281CA0107.outlook.office365.com
 (2603:10a6:d10:a3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:45 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 09:12:45 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 20 Sep
 2022 09:12:43 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:41 +0000
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
X-Inumbo-ID: 6a368fe5-38c4-11ed-9647-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=guKK/ohUM3x19f7hSMWC+RPepCAvA+tJMcnR9AHCCHu26CcH5vGW4C2Fgt8T03aL5XIB87GAw6ZOjv2SuhJzphUZ8GDDAmi07LfuuWpPkhRs3Z28zP+UOj7ms78YiSeUFSzh0GpsCJyF5ZkjAxi1wPiEDM2edfcQ7v4wD7rdAv/crNNcCnQHW6EtBgREpuJ0GRugugCpM4xt/Rc4j70wA4t4xvh2ppjlf3mqsBr6GdNPFE4o/JRV8vQBbzrQFopirNl10s10cgsGdCfXRECwpDh+P8MXYtHTBOyFzRI+fgeFn4ijmjnjfmLYZ52XDH6iJWH5ZxqCPAp4qXNcqkHj9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JApE89GTHtWh+1dMIVWR6H3QB3coBzTIxLdWe7grbWM=;
 b=nN8K+Od/nx+mmdfIkXl8J+mDRxaW5jWksrNT/Vo3awrpo3dcySXm1JL8rymmdVtkGU7X8D375vz0Swmf9BP+OGdNYrPmUekvbzhXG0b+tNtvrLpzSx1QgtsHr4T3vw66zmqy55BJehv1C26sqO2g48PYKezokijqas54+mRJOSqcJa8TIfqlHCGd5BHbb4eGe8lSPksqGZPLAgj6pwYcwq0l7a+tG+qODjgyQSRn/o+sUvvToDMbVf9RYJ+l8Go7uvMLjUxEMrGkTAQigXG+6vbQ3FrI2/zsPq/LPAEQrt89bVrr1/JWODPvJKhgje9I7tLxNitzMPzy4XGfyy/jxQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JApE89GTHtWh+1dMIVWR6H3QB3coBzTIxLdWe7grbWM=;
 b=H+KGwsWGpZkoFfradaN6Wkm/8r/On98Tl4yLFYeomJJXjjJwJxWvHW/cyTK2D1jTGrYEgY6OdDqf+brdCeYJk/WcvNzqtnJRv6o7/T3d7ZUpCxNiPMKjyHDq99Um9gZUaDjTluAX0Hh3sAdg30vb//xvIbqLokvsOozGUTLc900=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: aa4b101283b19735
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1OFLWjAlrPZ+NBOzbvg2fTQAx/LS5XDwOAmzX1P7PqEwqLEJTtOtm45UgdKpFl148JQKSpzDxoSMgz2+2HgAKRrTvmZap9J8ecjKb+XeHMsJndaZRWNCDZTe75BlIw5IEMZ3YLRS0f04FNIZdLHOT0LGzjL5Icu4IjewboXfXj//2dQdWTePIyUMnILNPFdTqHHjbIDobherrqxyw4kZ9KycaYuw4Oe9bX36oTIpmbd1Cp26RNTr2Dll3LbSCQO8C371XeH4pIyKpL3Qetx23RMyFBYzrEYxePic120B2FsOQdqv85LDU7HlmxYW1jE96+LCEtiO1FVksenSGVVpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JApE89GTHtWh+1dMIVWR6H3QB3coBzTIxLdWe7grbWM=;
 b=iNYO0qwRQlpOseLKWNca3lMyw6SJqN6iI1Q75yZTK00P41W186dyvFHcuztA4Rwgum42BdJMQyk/0nA0t4uB+HAoAFk4a0JlAcq+oqab09gZk5jIF5RhJMZKa8jwimviR/uxRRO2oYsTsdp3/g26yKCt2vALLNJRNK3YrKo1V0dUj1kJqq72g29SXmbvxzlVBJjmkUhMpHaSEMg1q9u8yTM6yYiUZ4NIdFiMFbIiMxQp+d+ZUJOrfH52zaJkOrcLclbwJqmqHxvlLwMdcIpf8mOzR1RAwRDASZR4W8yOa+9BfdEFQEm2TgtjvG2t63inEja9+EdsjghMQcnlOQkPxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JApE89GTHtWh+1dMIVWR6H3QB3coBzTIxLdWe7grbWM=;
 b=H+KGwsWGpZkoFfradaN6Wkm/8r/On98Tl4yLFYeomJJXjjJwJxWvHW/cyTK2D1jTGrYEgY6OdDqf+brdCeYJk/WcvNzqtnJRv6o7/T3d7ZUpCxNiPMKjyHDq99Um9gZUaDjTluAX0Hh3sAdg30vb//xvIbqLokvsOozGUTLc900=
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
Subject: [PATCH v5 4/6] xen/x86: use arch_get_ram_range to get information from E820 map
Date: Tue, 20 Sep 2022 17:12:16 +0800
Message-ID: <20220920091218.1208658-5-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920091218.1208658-1-wei.chen@arm.com>
References: <20220920091218.1208658-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VE1EUR03FT012:EE_|AM7PR08MB5528:EE_|AM7EUR03FT030:EE_|AS2PR08MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: f1666468-01fa-42a4-236a-08da9ae84d3c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MyIAm9fK9dQtPIJ47s4xFQ3VJ+zkSNhTf9EHCa97/T6lLoXTutJHXOL6tSdJs3kcz4fBJ5L3j4wfwNzHTHitdEzk94brp4ERiMPPbikZEH1Ph6YYDtUu4cG98QXfFKZ9LJ5YQsB3G7Kw35Cl6J88ndGuwOTPjJK0JxkGsm/vooYziCq/j9txqRlko4daWRTOKS+KXeq0oCudcOWHphLaagFRAnPSGvAMEWSW1ZmSVMQgHeqzSykkI0VXNlk5a8IEmHwkmsLaMcqoi7R2AKvmqO7VkMzNG+nl/TjAQnnoz7C2Q2VJqEHUipS53GyGvtwghkcaCjFrLwsiT0dtOphqBHad29y9rcAiNhLRTgrkiuxFhNVeZ7qGnV8fZAqYXGPVC+b3dfAas3uAgxjv2kF8XPQKQhLjt+/mOX6rFUTAt3fQL4W/v8WlO3ryrN6HebyTHTvC9V9XcvX2kaRZtyj8/Tf7I3Z7NnLWqMNm7zYCeduKn+B/U2DvgMOaWB/Su32cwCl7bUrVN5iQCqO6hlxzSpUxeeEtFPTnvUwCoWadT9z3SIXIPrwEtAsvzb2dxk8yFMwPG9XjGJ/fE8D7BTi22JD5Vd4RxUMNywjk4xRr4/YOPEjl/BCvgocB4WxAtir1Ozje4ha8sGF4C2u1nFdWYH+CPgt/EX9/UfmE7xMeB/JSk4EMlpiR0PxHAmYiHavU7bVwsb7BBME/9VrDiu1+Add+TkReGlcIllgtech9XSEtIksqgNVJaCxcmBFEuZrKb7bx5II7jQGSvnT3PCOtUHQaLgd4RbqxPUSdJOe7QPP1dpii4EjSFZM/wdwMDzar
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199015)(36840700001)(46966006)(40470700004)(44832011)(40480700001)(82310400005)(36756003)(2906002)(54906003)(316002)(426003)(36860700001)(47076005)(8676002)(82740400003)(4326008)(5660300002)(70206006)(70586007)(6916009)(8936002)(86362001)(336012)(1076003)(186003)(478600001)(2616005)(356005)(81166007)(26005)(41300700001)(6666004)(83380400001)(40460700003)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5528
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9ed78981-4bce-4eb7-b399-08da9ae847ce
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cgTVOb9QrxPjEq5P9DYtexRF0sylt6rmEdwdeU91goS68oA4kS+rlMZL1vKAoT6zqG9tnIZlpiK8EpeRThJr3PXf5c+b/Fg3LTOBdw7cV5B8cJlyLiqOo3R5/55G5Fw2aPMtjkuRBlSDFqc8OQN0ZZtbTc/p5Z/zaR5P1GXEsmCDn+vJmy7crid1ciaPKGtlO6pETullUJ/vrHlyle1CWipH1DRnTD4e/uCW4B+Lw/WVXBACflvzl/NZ5sF79jByd+ZYB2JRvRBb+DZLS3uLVRUgWhe7BD04COpU4kyXJ4EEpoAF2fiSX78JY9Aifwr64B1GpkZ6tUXfGdbQhZu5hv4E+bn6z7kU9vZ2XV0BPckMXlt91fQlcG+0anTq41DKzlQ5ZcgzQc4dq9yJpTgZj4wLMHAOK1DN7WNEHpqyYJZtvAlh9OHPyWDrvYwlHeZk1Y19Y0u6/RTvXvQEdMUa2mU+inHCHWkKOJxh5O5e1hKbGpZ1kKTKd++iHHbwDZN1AmSu8wcnoKXWmXAg8RONcB89jgo7QUfqZy8/3CccDwVjmthVm2RZ/WENH5jAR69vFRHDIaNpzozF0deOMtJ6jVEqMDnmL3zTuOMyCPvyEEtCOl66mqVqDjFTAMDsfqTcrbu3HwMGh/t1JmR/HjqVuNgid7r5P2M9JN8xQbKOmYh4Klywj/zahZxsH+0wdWdPfT0rsVEYAjxahXg1e9SXBDB5+frO9eq1kX7mYgYT8eXdpgDoDAphEuGYkAiP3WNEohJE+HMQTttqF3DkqKj1Tg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199015)(40470700004)(36840700001)(46966006)(40480700001)(336012)(4326008)(316002)(5660300002)(83380400001)(36756003)(54906003)(81166007)(6916009)(8676002)(7696005)(86362001)(82740400003)(70586007)(70206006)(41300700001)(2906002)(36860700001)(6666004)(82310400005)(186003)(478600001)(107886003)(1076003)(8936002)(2616005)(40460700003)(44832011)(47076005)(26005)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 09:12:54.4754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1666468-01fa-42a4-236a-08da9ae84d3c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8310

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
index 21efb1b1b3..6cf5c323af 100644
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
index 0d4f7cccb9..1603c415fd 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -428,37 +428,43 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
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
index 538b283d95..5c7abdb050 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -81,6 +81,19 @@ static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
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


