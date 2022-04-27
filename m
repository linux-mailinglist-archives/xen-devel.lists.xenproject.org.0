Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E2151144A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:29:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314610.532755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdyU-0000pA-Dq; Wed, 27 Apr 2022 09:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314610.532755; Wed, 27 Apr 2022 09:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdyU-0000nF-A5; Wed, 27 Apr 2022 09:28:42 +0000
Received: by outflank-mailman (input) for mailman id 314610;
 Wed, 27 Apr 2022 09:28:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ksbQ=VF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1njdyS-0000n9-Gb
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:28:40 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b3ab4ae-c60c-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 11:28:38 +0200 (CEST)
Received: from FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::22)
 by DU0PR08MB8188.eurprd08.prod.outlook.com (2603:10a6:10:3ef::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 09:28:34 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:49:cafe::ca) by FR0P281CA0069.outlook.office365.com
 (2603:10a6:d10:49::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Wed, 27 Apr 2022 09:28:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 09:28:32 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Wed, 27 Apr 2022 09:28:32 +0000
Received: from e80068fc07bd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 668B4725-7378-4FF6-B55E-2C37948E30C0.1; 
 Wed, 27 Apr 2022 09:28:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e80068fc07bd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Apr 2022 09:28:25 +0000
Received: from AS9PR06CA0721.eurprd06.prod.outlook.com (2603:10a6:20b:487::7)
 by PAXPR08MB6848.eurprd08.prod.outlook.com (2603:10a6:102:132::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 09:28:24 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:487:cafe::d1) by AS9PR06CA0721.outlook.office365.com
 (2603:10a6:20b:487::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.18 via Frontend
 Transport; Wed, 27 Apr 2022 09:28:24 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 09:28:23 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Wed, 27 Apr
 2022 09:28:10 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 27 Apr 2022 09:28:06 +0000
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
X-Inumbo-ID: 6b3ab4ae-c60c-11ec-8fc2-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=K08o6O1AwpferyJhswLpdKBDSM0V/K1ozBzCSwVYV5LMVnMwtnzgzEnvzIhr1Yf8GEjCjIyzA9Af3bZJ67l0u0BnsDhuzmu5SRzSkfO3JzJDpFSNxUP9HUJQ6ALNK68NTadT9hE7NF+rrur0pGk0K4PPuX3vFYZx5jub9bE6ElhgH2vKwBb/lmoRP6PLarwiU1NHsiKNlfrD+GC7K5m88/P3T0Rw0/Yo042fc3y+iisD/bs5Jkn0g4/sXq1Qcj/frQbxlRdi+cuuHBPasBNU51k8f5JYZT8z+2doGuSXlONOCoMS/hOLG1sR4BWhJ13vuKiBGB0L1oL0AWOP9FrsZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThmgOFurEe0Rf5be44HpvcHVKFyzQoKYs/DLnSQbE24=;
 b=PaOnLmcxulfs4HP6Ub+TZ1zzrA6UiUnxeVUpJ4gHwZv615G1aWSUSVEcpgdd731HmsDtTuB97c2iTReYP5C1DEWKR6jy/cmg0k3ugS5Tgrd9WvE484Zz+u0VF4AEBm3Wt3ZILh3eDGhvYWJzSSN1iINqenapZ2coxRMwhGXxatxTC03f+K25xDUIyuSMHeEa+b7AZRSj+QRW3kvIB9sYfdCAX4m+RP0IqSg95rFCkd1qeGReEGuWa4eUFRx4P/oQrl48bpRxNpbWEll09nUDNgUvq//fvh7hCe4KKD+pvyHEuZyZP11KBg5R6monwXl9xAUDY3whXzkAmSorCIKWoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThmgOFurEe0Rf5be44HpvcHVKFyzQoKYs/DLnSQbE24=;
 b=d/y8uXtZ0SaqQYjjcrtcVW5fHX74YkRhgzGuvWnmFtRHSfVewsfG02ixnv0BaThcgETc49Es9nbK6rh+RZ2pWsuZ53tuWEk1A5DmcHjRSaIWZy4wJbTHy0mZPJ3LrnHznL0gZjt68Q8WEHJRUUWNiwOVNnej8yNnZTbaKLEjfx4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4703d742c6b2843c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SA66BvvohOxPwB61GD+ZOmlDMjU03Uz8CJdasnve97yQ0yWuvg8O5uciIzzVVQDm8LzOU3yCXi44fuk9S7nT0NR/hAvl9ergHUYlomRxZnkRLdJlxu9Iv4MCP20yrVn5lwAAhFqfIVZF4Cq9VKH3JIB5UJES/1+azyclZ26EqTMjTIcbnFELROMHvBDeo6QOpdeFqt+UlmGtL65H7QalOh2RFncydFoQTUnz9zY2vBUjPUwYO7Y+k4rH+Pie9/p7iYgkSoItSNfdMj31ropYV673bg26xGY8jhPhH0ZVGvYIXu04R+vxm+PnJADcbGMioJLmUTMoEaLE6cbVis8jvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThmgOFurEe0Rf5be44HpvcHVKFyzQoKYs/DLnSQbE24=;
 b=XXdLT8u9o8E14+lzXiEn88cTNvUh8yG2JqGQTS6Z4MM49zl1wtp4AUrcgFMirK1BKON8Ekp+O4agCh3yd3QvtnJofkwC0RJGEZGJkez+d5Kb4Uu4MJSL66dHdmbKW9Sr0S7jTElj/bM2/vBpVXHKKA/0FzpvJQbpGWLePIn0aDCaypfS4Kyj36ruCqAFs3vpSsZ7d+42QBTh4tvhCq3jWqvIHDrWdSbVaFnw6vXQlPVFWWD8P7Q31Uq9kY7sWuh4oCAwQ43KNB6XciHynaq6uocucQ6gkUF4br+wCiC399yE2fqvlg9rQ3AJ+AbzT1KDua6xbnxV3EsUWFJ9fwoUFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThmgOFurEe0Rf5be44HpvcHVKFyzQoKYs/DLnSQbE24=;
 b=d/y8uXtZ0SaqQYjjcrtcVW5fHX74YkRhgzGuvWnmFtRHSfVewsfG02ixnv0BaThcgETc49Es9nbK6rh+RZ2pWsuZ53tuWEk1A5DmcHjRSaIWZy4wJbTHy0mZPJ3LrnHznL0gZjt68Q8WEHJRUUWNiwOVNnej8yNnZTbaKLEjfx4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, <henry.wang@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH V3 0/6] populate/unpopulate memory when domain on static
Date: Wed, 27 Apr 2022 17:27:37 +0800
Message-ID: <20220427092743.925563-1-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: de60fa74-325e-4225-bfdb-08da28304c56
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB6848:EE_|VE1EUR03FT015:EE_|DU0PR08MB8188:EE_
X-Microsoft-Antispam-PRVS:
	<DU0PR08MB8188A38BCC8B66388FA54029F7FA9@DU0PR08MB8188.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NAyh367RXljibv3TngpBi5cuXJ2nKBWLxVfj2s6KBoNCaqkQZ8WdXV15YyRIYWaPBpylqCwhG9rQ1mE5yCX29NgNSnRqBzjDJEdoQOZHpA8VmqFD1v+2ygliFJeQfYxk60drDROGK473ak6RSHwX2cTJkTYc598gb7lMOjZ/UzXbBJHeISxNmGRL7LAOmS3cdg3y+HykVvaM+KQsiGM4c+ErLaxUoN3X4+O8IO3ffPFX9QT5ncYYBKev8njw3P8TTlGtd8NRbrUxHoBtXY+wpqMQNkL6twlEqtrZuDJ8IwRIH7SZtiEfXjcxhOYEhl8YZpV7l4p/ofBye0P05OOGtRhE8YIhAWZ+xhtcJI1ZTy4INkLu96C7bv16Xtr711J7egpZ3dUgnvI+imE90xs9UaB92GmDX7wHlQzn6Fdq+UXRNCxXfx0JVIsoCFRDFmbap7LQ+n/zvN1UflzowpglTnR5ufc8HYR/AOWU3y5+yQWByeZqCjLnw8RiukuKyZWYhMqzTkx9/0siWiXESVhHvSyHvtOC7mqVzOhX9ee000mmQQb0VPAqBAiuehS/9prpff351PED9XZQPInMuM9ShCdU9CWpwicyGVlVOSSPXxs3gXL5RdRayHMz28P+3EWSVLYnjk9yWjdJHHr9+wYZo/8hGwJQez5IWRW/T+w6b0a53dkspnO4eUhFS7fxXzQKtlZ62bDFZ3vFZ++j70lsOLLCflbwKMOjBKEuVVFsu1w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(316002)(26005)(8676002)(2616005)(47076005)(86362001)(508600001)(6916009)(54906003)(70206006)(70586007)(81166007)(82310400005)(40460700003)(356005)(6666004)(426003)(5660300002)(4326008)(7696005)(8936002)(336012)(36756003)(83380400001)(1076003)(186003)(2906002)(36860700001)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6848
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1a7321a1-4644-4da3-13ec-08da283046cc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xc5nn9u6MolxMoB0KAtyJolSg+DcStNgnyI16geSD2INiS6yyiGRNScK94mvK7kN/9vIk9kNUvpLhJIyszDOAw0tfDasqv533tiFNtuMzzqJcySDTfQjDbx0qSMJrehsgLtSYb4Fj3/jfbQCAxZAvsn4ILHhaVyuYGK79CTHdmTecIDrTWmpkS413EPdEEbAXZavF+kVRT9ZFCeZIUVaVn7+lBs5cFgqHnKtmjiZ1ZYrb2sCQN7eryDfcSIw4ooAgZ2cMqymf2yH55DRSqU919TSeFeITi1+bGNezhhfFWkdioGM7iFXR5E9psL0rUmuleeLa7o5tIQdYbVYasz/okb6CXTZOf4Gkhkq0WOi+Gg0cfhslqZUihOZwLiwt/G68ZI7A4YNzapwXJkNZ/OtD17RdemmHl2YDSLz84k2O9M9uCHXEdX6zELBFs7ee6+TV6H7J4R1gOTaDiC30vmEdbgE/0V/6JOWFm3t2MOoG5AI3h4qTl+JqenlOcpQWFNzso0jJGtZnoPDz17roql3Etc1tkNOd9SmB+hNKxwNRZwzBGeYRknghRce1OCRIflt72K/ZzqH2eGNkh12EvHdtbDHHiIv/ul0CoMQgg+bpmoULEBma0BP1IqHC/vOCqUeGtRuZmQFCwT1kFDIILY1Gm6kHQx7bqnxOe+mQFBOAC5iqDIMJRXbGCSSXFI32V261PcvEjlnKG9M0Y51e1j1hw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(107886003)(1076003)(2616005)(4326008)(86362001)(186003)(426003)(336012)(8676002)(47076005)(36756003)(83380400001)(82310400005)(2906002)(26005)(6666004)(5660300002)(316002)(7696005)(36860700001)(6916009)(8936002)(70586007)(70206006)(508600001)(81166007)(40460700003)(54906003)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 09:28:32.9547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de60fa74-325e-4225-bfdb-08da28304c56
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8188

Today when a domain unpopulates the memory on runtime, they will always
hand the memory over to the heap allocator. And it will be a problem if it
is a static domain.
Pages used as guest RAM for static domain shall always be reserved to this
domain only, and not be used for any other purposes, so they shall never go
back to heap allocator.

This patch serie intends to fix this issue, by adding pages on the new list
resv_page_list after having taken them off the "normal" list, when unpopulating
memory, and retrieving pages from resv page list(resv_page_list) when
populating memory.

---
v3 changes:
- fix possible racy issue in free_staticmem_pages()
- introduce a stub free_staticmem_pages() for the !CONFIG_STATIC_MEMORY case
- move the change to free_heap_pages() to cover other potential call sites
- change fixed width type uint32_t to unsigned int
- change "flags" to a more descriptive name "cdf"
- change name from "is_domain_static()" to "is_domain_using_staticmem"
- have page_list_del() just once out of the if()
- remove resv_pages counter
- make arch_free_heap_page be an expression, not a compound statement.
- move #ifndef is_domain_using_staticmem to the common header file
- remove #ifdef CONFIG_STATIC_MEMORY-ary
- remove meaningless page_to_mfn(page) in error log
---
v2 changes:
- let "flags" live in the struct domain. So other arch can take
advantage of it in the future
- change name from "is_domain_on_static_allocation" to "is_domain_static()"
- put reserved pages on resv_page_list after having taken them off
the "normal" list
- introduce acquire_reserved_page to retrieve reserved pages from
resv_page_list
- forbid non-zero-order requests in populate_physmap
- let is_domain_static return ((void)(d), false) on x86
- fix coding style

Penny Zheng (6):
  xen: do not free reserved memory into heap
  xen: do not merge reserved pages in free_heap_pages()
  xen: add field "flags" to cover all internal CDF_XXX
  xen/arm: introduce CDF_staticmem
  xen: unpopulate memory when domain is static
  xen: retrieve reserved pages on populate_physmap

 xen/arch/arm/domain.c             |  2 --
 xen/arch/arm/domain_build.c       |  5 ++-
 xen/arch/arm/include/asm/domain.h |  5 +--
 xen/arch/arm/include/asm/mm.h     | 12 +++++++
 xen/common/domain.c               |  7 ++++
 xen/common/memory.c               | 23 +++++++++++++
 xen/common/page_alloc.c           | 57 +++++++++++++++++++++++++++++--
 xen/include/xen/domain.h          |  6 ++++
 xen/include/xen/mm.h              |  3 +-
 xen/include/xen/sched.h           |  6 ++++
 10 files changed, 116 insertions(+), 10 deletions(-)

-- 
2.25.1


