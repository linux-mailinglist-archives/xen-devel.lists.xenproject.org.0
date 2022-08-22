Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1659059B7D6
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 05:00:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391099.628812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPxf8-0005gS-VE; Mon, 22 Aug 2022 02:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391099.628812; Mon, 22 Aug 2022 02:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPxf8-0005bf-R7; Mon, 22 Aug 2022 02:59:38 +0000
Received: by outflank-mailman (input) for mailman id 391099;
 Mon, 22 Aug 2022 02:59:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t9b2=Y2=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oPxf7-0005FA-3o
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 02:59:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 747193e3-21c6-11ed-bd2e-47488cf2e6aa;
 Mon, 22 Aug 2022 04:59:36 +0200 (CEST)
Received: from DU2PR04CA0350.eurprd04.prod.outlook.com (2603:10a6:10:2b4::22)
 by PAVPR08MB9062.eurprd08.prod.outlook.com (2603:10a6:102:32d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Mon, 22 Aug
 2022 02:59:32 +0000
Received: from DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::cc) by DU2PR04CA0350.outlook.office365.com
 (2603:10a6:10:2b4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22 via Frontend
 Transport; Mon, 22 Aug 2022 02:59:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT012.mail.protection.outlook.com (100.127.142.126) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 02:59:32 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Mon, 22 Aug 2022 02:59:32 +0000
Received: from 9a1e56fe7d71.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A21DB36C-C314-442C-A33C-5B8F18B36122.1; 
 Mon, 22 Aug 2022 02:59:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9a1e56fe7d71.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Aug 2022 02:59:25 +0000
Received: from DB6PR07CA0001.eurprd07.prod.outlook.com (2603:10a6:6:2d::11) by
 VE1PR08MB5646.eurprd08.prod.outlook.com (2603:10a6:800:1a9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20; Mon, 22 Aug
 2022 02:59:22 +0000
Received: from DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::f6) by DB6PR07CA0001.outlook.office365.com
 (2603:10a6:6:2d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.15 via Frontend
 Transport; Mon, 22 Aug 2022 02:59:21 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT044.mail.protection.outlook.com (100.127.142.189) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 02:59:21 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 22 Aug
 2022 02:59:20 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Mon, 22 Aug 2022 02:59:17 +0000
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
X-Inumbo-ID: 747193e3-21c6-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dyS0Xc3cmuyYKaud0hRFjrq5mJI+9DUY65/RFVYq/tDAWMkEAkBiEea4x1tjF9hF6SDaxyT4vXxbzd/5sYQ1cRekX3Ky/rP48z5MDtQth+Oj7Zri57zDY5/YrMEVGiMeSpAFqL7QM4rVBrI9GMOuL9enWUTMGoGazuJMmEKafEJobxe53jjqu70TvDImD/GN2a8dCUCSY35jB3NBRT0w1tylRzy9GdtZcmHIfIGXig269YhAc0ZwsPWas7AdEh7ulaGGib0ivsEBMomeCJ1SD15mi1FuN6OjRVxkS8a8q3zrwq36bnDdczYoK0uZPpe2eDCVp8Uct7Gc6sLwKH2Pyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aO0eR2JiviKwTq0b191QwsRxcYqLc/8IFPWe53IzyX4=;
 b=UACoZ4YclbKw6YEqf747WGVDGawlPLZMh5LbBpFa+4CrCo0+KZ+CXmMnjjQxtihBf5VhuZIbqVEoz6t5rp0J3dn95tshBnfsyRjAGalY3ltChOZmBuxBBVsMyju3ZHRg5Sb+Fvv3SSr88GDD5sbZog+v2/yz0LKkDjLlLFygQgcLgSe6Q1M0S7+F5CWlB4TEAiIwlEIc3NmWsjF3Q+DKzcxqTI3JU+H8HvP+OC1ZbfDmu4eKXDAQ9vpQSy7NMYfpNf6OijojoRay1UqQKv9wSRSo6zJy5GPcBKTQ16mugav8qtDGmjHcD6iiRiHWQsVbtOBYSBZjxjFiWLJQyaIDjg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aO0eR2JiviKwTq0b191QwsRxcYqLc/8IFPWe53IzyX4=;
 b=4EIxLx/UClUyZbyoph2+WhxvqejKQITJ8i+5tiqNzCy4reqUEqKuIjpel9iTx4VB0lxzNtmWNhFbBOfVoGML3m/j/o2hhLmLaEgYXdmZeEfiKbNKgGXfAfzmHcCs43Mh6rNf7Ll+kmESnOI5nxtG2Tvs96FlA6PGI3yFX5jW2x0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c7603a9d374704d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZVaRQo0kiwoi6qPpDpFTBFCxKo1W1vRhktTpxK1P5NlwqS2fJbMiKqzUULO6qpt40HqoHNQNMwpJJSncD7jIeLkTAKWzi/T4I/tyaIUNRXqMy4cFicjVchW//wlFhzOYBQmnIEiJkCHaFZREjXTkk9jxaPKFV79PIiq+D2B7GgJ4esPXY70iMtOeX7ZiK7xBVpmn2Jc4RmdrxyfWqL5BkoYLMOnW7EmNRWUAyngnTD7rZGI6zGDfGo6l/OmxA3PmXXorNX/lDdZ4EfrJtFI9C7N7D3xPT9xa0VElA9GCwAQ2ImlTm5YXpoblrN2LwrkW2nhuTOJbLFUWfF6pONSiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aO0eR2JiviKwTq0b191QwsRxcYqLc/8IFPWe53IzyX4=;
 b=QbhXcmlYeehALAyPnZ+G8puqWPbeRKBA95e9xw1Vd/H9fFDHTB2lgXI6JqSeQp8SSo5HsyYeBR6RTgQQDJHSFELEleL1MrmNeM/Eh5ndtXuGdYwcm8XT8IWVG0UwOBZdrSGaPF3S39FubGoacYikxgeprpQ6ers7lpDa6ja2YHSr9Fy2F5cwue7m8ZyHcU9vzcCmVlAeyt0vJNOeQtxWKcsUaZ5mQidzcqoT+Ye5dFpt2NGzt3hKQPfaATyVs+zfZ+QIOmyrvD6Mbm54Nvb2fUyjyX20d1zEjDGIHKbyLkqpQD4Qaj0unFmEJE7/UOfYupX5AKSnQ4aAsGzTt8Fs1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aO0eR2JiviKwTq0b191QwsRxcYqLc/8IFPWe53IzyX4=;
 b=4EIxLx/UClUyZbyoph2+WhxvqejKQITJ8i+5tiqNzCy4reqUEqKuIjpel9iTx4VB0lxzNtmWNhFbBOfVoGML3m/j/o2hhLmLaEgYXdmZeEfiKbNKgGXfAfzmHcCs43Mh6rNf7Ll+kmESnOI5nxtG2Tvs96FlA6PGI3yFX5jW2x0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Jiamei Xie
	<jiamei.xie@arm.com>
Subject: [PATCH v3 3/6] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
Date: Mon, 22 Aug 2022 10:58:07 +0800
Message-ID: <20220822025810.2240707-4-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822025810.2240707-1-wei.chen@arm.com>
References: <20220822025810.2240707-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: d6b4088e-efd6-446f-337b-08da83ea565b
X-MS-TrafficTypeDiagnostic:
	VE1PR08MB5646:EE_|DBAEUR03FT012:EE_|PAVPR08MB9062:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MRlwl6fatWzMUmydXL5iBZxjCTQZ98C2nUSGBdw+xz0mL8juHrcYchaUIk5AoQrtkogXrEb8ys1cqJHzNYjoQ+JviptL0xAEq7v9U9EcF/b9yb33aRIIhj93sKNF3XL4fSvjgRxCa15fFoVvGTNAQgU5sJSCBfZj771qJkmXNmycN1yC3n3d7kQlvAoWs80i+lxSZYHYycoxc7FxhKdwcihJlO20byK8hA1MmyoJxALCcYXXYL5cCloOvP58ldzjhz4lOCkqHvI7zg7LbgsAfOOwuEzHs2+65SVK4+Pkdbi+OiN42/797s35ElV5bmdxocnwe+KYUKGEtnvhKowytJ2mkzaZZOoC4Y4GO5IKQjjRvhNnDTNuPmt25M/rHInv15nyuDH91SSxyDAZy6DyHixmdVgaqjgF8wbMzSB823s0o4GCzk0B30wdHZ5ppSxEpty62XRg4wqBpazoBbt3daZANcEhyqRRmDQdXT+b9zD8BzrxR0/QU+QkLNK6JsOv5agp0tqD2mSJkMBwT7AAEY1Ns9vyV9pdw4ojSpKQqVTCl7iBXiSO0CIQObjbvEIzorqoSQutiTYyMX2HBkPrdKkkCdlz3o+1EuNUCG9KTCCIqrUp2ixsyENjHkMQ8+1ehjnRYXHXAjveXnV5WghCPm8XniDfuhxSY7X3pHWl4eNGWNf6pMOogvl3230sQ0yWytYSrCRgQdahGiTLaM4vNucYng0RPU6iWn5ByGxeJFE/u//tdpInsaY9mf0RYLsL4uiBoGkk8yjHeEldzKrKbw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(39850400004)(36840700001)(46966006)(81166007)(40480700001)(2616005)(82740400003)(83380400001)(36756003)(70586007)(54906003)(316002)(4326008)(6916009)(70206006)(8676002)(26005)(86362001)(82310400005)(2906002)(5660300002)(36860700001)(7696005)(186003)(336012)(426003)(47076005)(1076003)(356005)(6666004)(44832011)(41300700001)(478600001)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5646
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f37b2508-52d1-44ea-739c-08da83ea5016
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MaBSFwjuUjxK+cRbkDjSGLqZk46NdJndP0qN4EPxhSmRBLON2Rzp2I64vU4XRrGSz+dnRZId1J3wUQNJklToMgUDj5B9OAqd69TH9s3X/MemT+U/v01t4J1KKZOh6IknZxK/x3TKDPmgglDxPtFM0D6HwuXMo96Y/UnXCyaF+jQJ2+td2uOBLqLb4bRhbBNeu8P4Dl092Bv73mdd89n5SZYZKF0aWxAxfVZwVpxbi2Y3nHhhXFMA70sLkTjeZM71IUBjVbWwhm7Vg/OuvhWS/1r356+eRjkIQQFUk5l7vF7o2+yYoLxAUiCM2tk1BZp96QTkiTnrF2pubpqz43kmKmAPREExIn41U56RXsDmo5l0UbmwxwbBmWJ4Ry1iacl+9+469eQNw2/K5qwRD3SZozl750fpDUquQOSnKjIR29ormB8L/ZWtQ/Zd7RViLzCIRsh3VfQqScNMSPBwqP8Jyu9WSwF3/85LQS2WegsRClDW6Z3iNZ8DmVI532BO+SWilHIut+yF89RL2nSYiQ72UyC8ZFasCwLQUXbJNH/3s6FsXr0iDiAwqw+4+VkbPWWTxfZFZT3hfhm2tnkgmv36DIOPvSE0OpTVUcOUhtdrZ/jW9xD+QCg7ToDNGHjgIMImVojoJ12HUev9Kw9eDh8PEe2Ijdt7h66iqwcYct3jVB7Ha/T1bpT53lnn0E3dmaQL9rbwJzbGuI3NU7x94PW+mnl9tQz6QqaiyNogB5blOBi/sGSxoqlb3APWEoEgxujlVty7JwbH9lVpSfi1jhUL8MwVr4TFI6ZFxV8zoiEk/0I=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(396003)(136003)(376002)(346002)(36840700001)(46966006)(6666004)(86362001)(83380400001)(36756003)(36860700001)(82740400003)(426003)(47076005)(336012)(81166007)(26005)(7696005)(186003)(2616005)(1076003)(6916009)(478600001)(54906003)(40480700001)(2906002)(4326008)(41300700001)(5660300002)(44832011)(70206006)(70586007)(8676002)(8936002)(82310400005)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 02:59:32.0749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b4088e-efd6-446f-337b-08da83ea565b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9062

VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
results in two lines of error-checking code in phys_to_nid
that is not actually working and causing two compilation
errors:
1. error: "MAX_NUMNODES" undeclared (first use in this function).
   This is because in the common header file, "MAX_NUMNODES" is
   defined after the common header file includes the ARCH header
   file, where phys_to_nid has attempted to use "MAX_NUMNODES".
   This error was resolved after we moved the phys_to_nid from
   x86 ARCH header file to common header file.
2. error: wrong type argument to unary exclamation mark.
   This is because, the error-checking code contains !node_data[nid].
   But node_data is a data structure variable, it's not a pointer.

So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
enable the two lines of error-checking code. And fix the left
compilation errors by replacing !node_data[nid] to
!node_data[nid].node_spanned_pages. Although NUMA allows one node
can only have CPUs but without any memory. And node with 0 bytes
of memory might have an entry in memnodemap[] theoretically. But
that doesn't mean phys_to_nid can find any valid address from a
node with 0 bytes memory.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v2 -> v3:
1. Remove unnecessary change items in history.
2. Add Acked-by.
v1 -> v2:
1. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
2. Adjust the conditional express for ASSERT.
3. Refine the justification of using !node_data[nid].node_spanned_pages.
---
 xen/include/xen/numa.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index bae534bb04..b779e68787 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -36,8 +36,6 @@ struct node {
 extern unsigned int compute_hash_shift(const struct node *nodes,
                                        nodeid_t numnodes, nodeid_t *nodeids);
 
-#define VIRTUAL_BUG_ON(x)
-
 extern bool numa_off;
 extern void numa_add_cpu(unsigned int cpu);
 extern void numa_init_array(void);
@@ -69,9 +67,9 @@ extern struct node_data node_data[];
 static inline __attribute_pure__ nodeid_t phys_to_nid(paddr_t addr)
 {
     nodeid_t nid;
-    VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
+    ASSERT((paddr_to_pdx(addr) >> memnode_shift) < memnodemapsize);
     nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
-    VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
+    ASSERT(nid < MAX_NUMNODES && node_data[nid].node_spanned_pages);
     return nid;
 }
 
-- 
2.25.1


