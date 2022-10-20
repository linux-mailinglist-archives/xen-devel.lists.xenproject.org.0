Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 391DF60572F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 08:15:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426149.674418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olOpo-0002Dk-Jb; Thu, 20 Oct 2022 06:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426149.674418; Thu, 20 Oct 2022 06:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olOpo-0002BP-Gp; Thu, 20 Oct 2022 06:15:16 +0000
Received: by outflank-mailman (input) for mailman id 426149;
 Thu, 20 Oct 2022 06:15:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=umfN=2V=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1olOpn-0002BJ-NS
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 06:15:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8efec115-503e-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 08:15:14 +0200 (CEST)
Received: from AM6P192CA0063.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::40)
 by PAVPR08MB9137.eurprd08.prod.outlook.com (2603:10a6:102:30e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 06:15:11 +0000
Received: from VI1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::f7) by AM6P192CA0063.outlook.office365.com
 (2603:10a6:209:82::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Thu, 20 Oct 2022 06:15:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT034.mail.protection.outlook.com (100.127.144.165) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Thu, 20 Oct 2022 06:15:10 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Thu, 20 Oct 2022 06:15:10 +0000
Received: from cf1711abba75.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F9B7CC05-392E-4380-81A8-125A50B85496.1; 
 Thu, 20 Oct 2022 06:15:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cf1711abba75.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Oct 2022 06:15:04 +0000
Received: from DU2PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:10:3b::29)
 by AM7PR08MB5398.eurprd08.prod.outlook.com (2603:10a6:20b:103::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Thu, 20 Oct
 2022 06:14:53 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::f7) by DU2PR04CA0024.outlook.office365.com
 (2603:10a6:10:3b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.25 via Frontend
 Transport; Thu, 20 Oct 2022 06:14:53 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Thu, 20 Oct 2022 06:14:53 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Thu, 20 Oct
 2022 06:14:52 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Thu, 20 Oct 2022 06:14:49 +0000
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
X-Inumbo-ID: 8efec115-503e-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=h5PzYrAUuUUYPhhhIGzUBxy27LQ1fog/2Q/jTnKpwPGjw0+0ePbtUa2eR8MjvNvD45QQD4+AkTIaFL10NqqoFKlGORj/bRf1k8cOqoB/GlkyuDIiQpsd4+cAGt4znryADsB+L9WAzhLa/HfiGA+ivQ5y06ZNZApjU8zv84w+IlSc//9AXax4RnlfqBRQjmopn4pLNwZKMvd6lStIplSTvb5jIA4oWj6A+X43TG4g+WXYaDKeAO8cOnXP3uhH5tB+eWHbFPshPQmhXv69ch/hC4Se/tyc3FmrcQvaB4dtQEjXOdRPW8MA2LRTTDIHASdKkzYOGP16xro55GFooOHx0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoKMoz/76/MRfADVFAivdFQhXqVUJOOH6Y4EzA36OxA=;
 b=hoJzgsl6nJuFscgyTDFBijTOLcdS7hJs0YjizMUiLG4GTyLiZqAWoyclSoT790eaMd2s8rKiVzM/hE1sKWAcqO+NjJMPomq4zpprFBWrXOT4rysPrIjdNe1HD8a4Gtp06w+F8pDgKkqrtB3TOwtZyTXzNWEzTKfEfYbNb521J6tvcBR4oksd5Hbgs+ptYmA5+4LUm5W25wPSmnOq4IOMBiVbreJUpzIFWMwNh+7z7sCzkXHFHreq/6co8Xhk4+UXaCzmHaxX7gnFWIJR4Z2QmQ6uZQf0JLHELmFxgdnd69qdA0qgLIfl1kIcawfRn62QXLcUUxgWgjqxbRAYRqByIA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoKMoz/76/MRfADVFAivdFQhXqVUJOOH6Y4EzA36OxA=;
 b=tlUfp7a+uwdWIv4R9iceM6xlpsIDOR90y1GoU+ywEoaGdHqg2fjf8R2b/iBhsqCr/BCkPL4apU+hWqHgAvXayemWYq/xQ60RTgqOKqXfaFF9gkU0U14iYa4DnL+5gAR6MePFngtKW8k6EBXYUpW+znHX+pRkIPtlSM3sbPxQnN0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8c104a2a53f5f9d6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/vo/rQ9uX/kYYwYZjUPpC7oWm57kYzYYhrug2u13MNIsPJlAQW0t+jmFPk60Ku4DUOvOHauRK5FAmIrAHsDkPAUture8YN/Xn5ZWTwwvFCwwg7qvP3aAumB8whnIgRf5hN3aWLzWvI6zii0cXmMelpt8z8pSIhTm8YOtW+lMounns5g71bmLhYL4XtyBRypLThMazQKvuXMsYFl7EpzdZLTCePaDxL6AogAZL93RUxzNN0sgF7RELImz3dVTd+RozlwjnvdhImUHMWalheKiuRlNxzKPmv2MVwYMaHTaM7bXrfrPCG/AhCILI+e12JwGOgOD5zFuKtRUDdYY2F60A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoKMoz/76/MRfADVFAivdFQhXqVUJOOH6Y4EzA36OxA=;
 b=Vo0hambz0kJT8a0KFP3JFhjh8z4KzgKFNXQkjb/0VX9sAgdVhgF/jMpZqHZ+W0qjK/8jf3SW/EosrnTh81xgdV9tCroiqaSN2om/X3GS8N0ARfHO0V4a2OZ3qo3kkPR7wZcuMIb3pdhs6forgfKDUVUB4pOIAhzQOhMMWQYOk56onDX0zE8WdkutUb/xf4eujjlVnjtiqygZCzeV67UEtH4i5NqvRCGzW1eMkn6CnSszhx5qYbJ95i6ztAr+yHmGGjIS8iOrxgwKKPNA56wbEx3RWV1hRm4WDPXkWLA35gM9MfeBYRl6lb5HrVN5XEBrq+P9uIMdXo+JC2COPvRErw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoKMoz/76/MRfADVFAivdFQhXqVUJOOH6Y4EzA36OxA=;
 b=tlUfp7a+uwdWIv4R9iceM6xlpsIDOR90y1GoU+ywEoaGdHqg2fjf8R2b/iBhsqCr/BCkPL4apU+hWqHgAvXayemWYq/xQ60RTgqOKqXfaFF9gkU0U14iYa4DnL+5gAR6MePFngtKW8k6EBXYUpW+znHX+pRkIPtlSM3sbPxQnN0=
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
Subject: [PATCH v7 0/6] Device tree based NUMA support for Arm - Part#2
Date: Thu, 20 Oct 2022 14:14:39 +0800
Message-ID: <20221020061445.288839-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT010:EE_|AM7PR08MB5398:EE_|VI1EUR03FT034:EE_|PAVPR08MB9137:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6936eb-af4d-4a59-671c-08dab26271a0
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /ZH2Za04rsW29OO3CkXfqX4MDPrpHFQ35sRdyyJkhLr1ZtvFkp9NVKS7e+IFuRDfB+18fTbVYeYZLgPP2eVmJ1vSNLgq+0Lc4hW6m/Y5/X6PpBJeLfemAK6RgfLKAqgMei0savVNV4sp74aQTNR5Be7J6drDClEKMKnBceTO64kdq7a3+4n6XOOSQlKKWf9RElJEkENxiUMuomkSh+aLCn7eomlAPJAjraAtjiqw6Le7L/6TkhiOqDtApRlAyUIe3xx4VZ0XztuSdnxthOx/krOgYw6Jn3rS/1O9PMA1KphVDp3OqNoTCc5uXYTGfKBvVORsvGQPHD514+IutqKWVpAAFB1csIbhsVqbAiAqQvll8J2PvL2qIhH9ArmMf+s+ndyDnHK1t663BoJ3Br+wB04ZQHwItyKrEH8I8nhA2VwQVRu1MmTkJQyF+/zaUB7AaAlAnrkWlyzgiiPXKtScX1Uzn7J7Yd17OKwmDzHhuKZQShVDoq8eakS4vGhtexSbB/gBoqywYK2xkD4Xur6WoEthPdE/Vv6GU5iymbUkhD7H8v4pH6lXsdgpNFrOQ4Kt8ps79RbpPI+Ho6bEesoPUZ9TxSX8vRAd/W3LMogn/n415N6zb/87KZjXrQKWcu8JabviQtBfcJBmO/TcnOu+USv0oBkCKtM5cqHiFFcAoDlQQ+Z5zzaKFUgu2FL1MOOO5ftCe7IrkkimVDdohUyVrjroheEk7tGqXW1dI77DZW1onzzl5h+Mu3gzcdsOIHDQUdBEFnm/Pb6guUTftvMCj+jJlevPDRV4lENzhqSvdnToRLCQIpail8uj7Cdpjx/SDi2fcfziCFso/R+PvPdt5Sreo7vWZXVZk5+4Lh6BHB++WTMkgn6VqESW+YuPsAQi
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199015)(36840700001)(46966006)(40470700004)(82740400003)(41300700001)(44832011)(4326008)(5660300002)(8936002)(336012)(6916009)(478600001)(1076003)(186003)(26005)(426003)(36756003)(70586007)(2616005)(86362001)(47076005)(7696005)(6666004)(83380400001)(82310400005)(8676002)(2906002)(36860700001)(70206006)(54906003)(966005)(316002)(81166007)(356005)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5398
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4296eeea-31b9-4267-d681-08dab262673c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zGUu2+Le3lp+QG7cpCGsRszGMRtD90S9Sc2AuWMm5l0a7UGXlCWQNoPnsu8brioyp+v5aivHVX75Yxo/Bj+6OGLqmOFjcHjxStsG+vwltVwnx8zdYTJ1fAIsEdtHi+1Et8jx/tFmGlxgSqbFk+U735N9gosvgB92bcW4gbMoyLOVRotEWAw1jiBWf8RX+Rp3zsrYkgw/2eQXIMAzspbOYHnwAAezCvT+FoyJeLg5gIk5ZbU5AlESpMgBm7wGhaiw+qd05OOGFIMyaTDRcBorQwgfXhHbK+SUsbKgO0atW1GrFHzIIIJl+Vi9n9kffq2CuoQqyMfBuzymSBW2FfV6Acvo7punDVrvas4Cki2hE47FhBkgMuJPtK5V2LKQ8ZEohfZ3PqpMYz7IUhPJLd1qqy/u4in5kY7FoL986fIVezrrioq3TVClTEXolAJlPPmqak2Sv2myFNmAOI9tXDnOh4SD5gOqWOG0GGDujz54qGFMlCx8aNenBOfG1UxH1eGwnfJGoMfrYRnaQ1KjlCHeFc8HgTgCQ1aserFgPPicH8KrHw1qfBz0Mqd4LkIhg4EkkvSHZawDGkTd2RLXdbzQA4/RzF2fmC5qOGVyHTZfRB+tW1KKmIahtABrAVz6Ke2owZNvxdSDlH/+XprM7Hm9kDm0jxI3XAtijG9jZ41Y/GFbrBxrJylyKeEqEDYWH+m5QGMj382SVZy7zpE3fzU+zZrlomXI9Blrr6CgrQHr0+ckHPYEKoAOdLOhl7GDWkTDyfJYSVIL7CjSIaqfQtNgqtC/pqrxvXCN5WKQyhn96E+adr47S7DXx6J7MRsXyuSwXrdSeu6pgKArETakxU3eRw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199015)(36840700001)(40470700004)(46966006)(2616005)(1076003)(186003)(6666004)(107886003)(7696005)(36860700001)(47076005)(426003)(26005)(83380400001)(44832011)(336012)(40460700003)(2906002)(40480700001)(5660300002)(54906003)(316002)(478600001)(82310400005)(8676002)(8936002)(41300700001)(70586007)(4326008)(70206006)(966005)(6916009)(86362001)(36756003)(81166007)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 06:15:10.7973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6936eb-af4d-4a59-671c-08dab26271a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9137

(The Arm device tree based NUMA support patch set contains 35
patches. In order to make stuff easier for reviewers, I split
them into 3 parts:
1. Preparation. I have re-sorted the patch series. And moved
   independent patches to the head of the series - merged in [1]
2. Move generically usable code from x86 to common - this series.
3. Add new code to support Arm.

This series only contains the second part patches. As the whole NUMA
series has been reviewed for 1 round in [2], so this series would
be v7)

Xen memory allocation and scheduler modules are NUMA aware.
But actually, on x86 has implemented the architecture APIs
to support NUMA. Arm was providing a set of fake architecture
APIs to make it compatible with NUMA awared memory allocation
and scheduler.

Arm system was working well as a single node NUMA system with
these fake APIs, because we didn't have multiple nodes NUMA
system on Arm. But in recent years, more and more Arm devices
support multiple nodes NUMA system.

So now we have a new problem. When Xen is running on these Arm
devices, Xen still treat them as single node SMP systems. The
NUMA affinity capability of Xen memory allocation and scheduler
becomes meaningless. Because they rely on input data that does
not reflect real NUMA layout.

Xen still think the access time for all of the memory is the
same for all CPUs. However, Xen may allocate memory to a VM
from different NUMA nodes with different access speeds. This
difference can be amplified in workloads inside VM, causing
performance instability and timeouts.

So in this patch series, we implement a set of NUMA API to use
device tree to describe the NUMA layout. We reuse most of the
code of x86 NUMA to create and maintain the mapping between
memory and CPU, create the matrix between any two NUMA nodes.
Except ACPI and some x86 specified code, we have moved other
code to common. In next stage, when we implement ACPI based
NUMA for Arm64, we may move the ACPI NUMA code to common too,
but in current stage, we keep it as x86 only.

This patch serires has been tested and booted well on one
Arm64 NUMA machine and one HPE x86 NUMA machine.

[1] https://lists.xenproject.org/archives/html/xen-devel/2022-06/msg00499.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg01903.html

---
v6 -> v7:
 1. Restore %d for nodeid_t in dump_numa.
 2. Use sizeof(page_num_node) for page_num_node size in memset.
 3. Add description for using min(PADDR_BITS, BITS_PER_LONG - 1)
    to calculate the shift when only one node is in the system.
 4. Use %pd for domain print in dump_numa.
 5. Add __init for arch_numa_unavailable.
 6. Use __ro_after_init for mem_hotplug.
 7. Use "???" instead of "NONAME" for unset numa_fw_nid_name.
 8. Fix code-style.
v5 -> v6:
 1. Revert arch_numa_broken to arch_numa_disabled, as acpi_numa
    can be set to -1 by users. So acpi_numa < 0 does not mean
    a broken firmware.
 2. Replace numa_scan_node to numa_process_nodes in commit log.
 3. Limit the scope of page_num_node, vnuma and page of numa_setup
    function.
 4. Use memset to init page_num_node instead of for_each_online_node.
 5. Use %u instead of %d for nodeid_t and j in numa_setup print
    messages.
 6. Use min(PADDR_BITS, BITS_PER_LONG - 1) to calculate the shift
    when only one node is in the system.
 7. Drop the marco: node_to_first_cpu(node)
 8. Use arch_numa_unavailable to replace arch_numa_disabled for
    acpi_numa <= 0.
 9. Remove Kconfig for HAS_NUMA_NODE_FWID.
10. Use numa_fw_nid_name for NUMA implementation to set their fw
    NUMA node name for print messages.

v4 -> v5:
 1. Use arch_numa_broken instead of arch_numa_disabled for
    acpi_numa < 0 check. Because arch_numa_disabled might
    include acpi_numa < 0 (init failed) and acpi_numa == 0
    (no data or data no init) cases.
 2. Use nodeid_t instead of uint8_t for memnodemap.
 3. Restore to use typeof(*memnodemap) for _memnodemap, this will avoid the
    further adjustments for _memnodemap's type.
 4. Use __ro_after_init for numa_off.
 5. Use pointer-to-const for proper function parameters.
 6. Use unsigned int for variables that are not realy used for node ID.
 7. Fix code comments code-style and adjust the length.
 8. Fix code-styles.
 9. Rename numa_scan_nodes to numa_process_nodes.
10. Defer introduce arch_numa_disabled for acpi_numa <= 0. And remove
    the paramter init_as_disable of arch_numa_disabled.
11. Fix typo "expandsion".
12. Fix Indentation for l1tf_safe_maddr.
13. Remove double blank lines.
14. Add a space between for_each_node_mask and '('.
    Add a space page_list_for_each and '('.
15. Use bool for nodes_cover_memory return value.
16. Use a plain "int ret" to record compute_hash_shift return value.
17. Add a blank line before the function's main "return".
18. Add new Kconfig option HAS_NUMA_NODE_FWID to common/Kconfig.

v3 -> v4:
 1. Add init_as_disable as arch_numa_disabled parameter in the patche
    where use it.
 2. Drop unnecessary "else" from arch_numa_setup, and fix its
   indentation.
 3. Restore compute_hash_shift's return value to int.
 4. Remove unnecessary parentheses for macros.
 5. Use unsigned int for proper variables.
 6. Fix some code-style.
 7. Move arch_get_ram_range function comment to header file.
 8. Use bool for found, and add a new "err" for the return
    value of arch_get_ram_range.
 9. Use -ENODATA instead of -EINVAL for non-RAM type ranges.
10. Use bool as return value for functions that only return
    0/1 or 0/-EINVAL.
11. Move mem_hotplug to a proper place in mm.h
12. Remove useless "size" in numa_scan_nodes.
13. Add CONFIG_HAS_NUMA_NODE_FWID to gate print the mapping
    between node id and architectural node id (fw node id).

v2 -> v3:
 1. Drop enumeration of numa status.
 2. Use helpers to get/update acpi_numa.
 3. Insert spaces among parameters of strncmp in numa_setup.
 4. Drop helpers to access mem_hotplug. Export mem_hotplug for all arch.
 5. Remove acpi.h from common/numa.c.
 6. Rename acpi_scan_nodes to numa_scan_nodes.
 7. Replace u8 by uint8_t for memnodemap.
 8. Use unsigned int for memnode_shift and adjust related functions
    (compute_hash_shift, populate_memnodemap) to use correct types for
    return values or parameters.
 9. Use nodeid_t for nodeid and node numbers.
10. Use __read_mostly and __ro_after_init for appropriate variables.
11. Adjust the __read_mostly and __initdata location for some variables.
12. Convert from plain int to unsigned for cpuid and other proper 
13. Remove unnecessary change items in history.
14. Rename arch_get_memory_map to arch_get_ram_range.
15. Use -ENOENT instead of -ENODEV to indicate end of memory map.
16. Add description to code comment that arch_get_ram_range returns
    RAM range in [start, end) format.
17. Rename bad_srat to numa_fw_bad.
18. Rename node_to_pxm to numa_node_to_arch_nid.
19. Merge patch#7 and #8 into patch#6.
20. Move NR_NODE_MEMBLKS from x86/acpi.h to common/numa.h
22. Use 2-64 for node range.

v1 -> v2:
 1. Refine the commit messages of several patches.
 2. Merge v1 patch#9,10 into one patch. Introduce the new functions
    in the same patch that this patch will be used first time.
 3. Fold if ( end > mem_hotplug ) to mem_hotplug_update_boundary,
    in this case, we can drop mem_hotplug_boundary.
 4. Remove fw_numa, use enumeration to replace numa_off and acpi_numa.
 5. Correct return value of srat_disabled.
 6. Introduce numa_enabled_with_firmware.
 7. Refine the justification of using !node_data[nid].node_spanned_pages.
 8. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
 9. Adjust the conditional express for ASSERT.
10. Move MAX_NUMNODES from xen/numa.h to asm/numa.h for x86.
11. Use conditional macro to gate MAX_NUMNODES for other architectures.
12. Use arch_get_memory_map to replace arch_get_memory_bank_range
    and arch_get_memory_bank_number.
13. Remove the !start || !end check, because caller guarantee
    these two pointers will not be NULL.
14. Add code comment for numa_update_node_memblks to explain:
    Assumes all memory regions belonging to a single node
    are in one chunk. Holes between them will be included
    in the node.
15. Merge this single patch instead of serval patches to move
    x86 SRAT code to common.
16. Export node_to_pxm to keep pxm information in NUMA scan
    nodes error messages.
17. Change the code style to target file's Xen code-style.
18. Adjust some __init and __initdata for some functions and
    variables.
19. Replace CONFIG_ACPI_NUMA by CONFIG_NUMA. Replace "SRAT" texts.
20. Turn numa_scan_nodes to static.
21. Change NR_NUMA_NODES upper bound from 4095 to 255.

Wei Chen (6):
  xen/x86: Provide helpers for common code to access acpi_numa
  xen/x86: move generically usable NUMA code from x86 to common
  xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
  xen/x86: use arch_get_ram_range to get information from E820 map
  xen/x86: move NUMA process nodes nodes code from x86 to common
  xen: introduce a Kconfig option to configure NUMA nodes number

 xen/arch/Kconfig                 |  11 +
 xen/arch/x86/include/asm/acpi.h  |   2 -
 xen/arch/x86/include/asm/mm.h    |   2 -
 xen/arch/x86/include/asm/numa.h  |  61 +--
 xen/arch/x86/include/asm/setup.h |   1 -
 xen/arch/x86/mm.c                |   2 -
 xen/arch/x86/numa.c              | 441 +----------------
 xen/arch/x86/smpboot.c           |   2 +-
 xen/arch/x86/srat.c              | 335 +------------
 xen/common/Makefile              |   1 +
 xen/common/numa.c                | 803 +++++++++++++++++++++++++++++++
 xen/common/page_alloc.c          |   2 +
 xen/include/xen/mm.h             |   2 +
 xen/include/xen/numa.h           |  96 +++-
 14 files changed, 960 insertions(+), 801 deletions(-)
 create mode 100644 xen/common/numa.c

-- 
2.25.1


