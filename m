Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9933951144D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:29:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314623.532798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdz8-0002bk-Qd; Wed, 27 Apr 2022 09:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314623.532798; Wed, 27 Apr 2022 09:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdz8-0002Y3-Ms; Wed, 27 Apr 2022 09:29:22 +0000
Received: by outflank-mailman (input) for mailman id 314623;
 Wed, 27 Apr 2022 09:29:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ksbQ=VF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1njdz6-0000n9-J9
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:29:20 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83515e1a-c60c-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 11:29:19 +0200 (CEST)
Received: from DB6PR0402CA0002.eurprd04.prod.outlook.com (2603:10a6:4:91::12)
 by DB7PR08MB3913.eurprd08.prod.outlook.com (2603:10a6:10:7c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 09:29:17 +0000
Received: from DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::c2) by DB6PR0402CA0002.outlook.office365.com
 (2603:10a6:4:91::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Wed, 27 Apr 2022 09:29:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT063.mail.protection.outlook.com (10.152.20.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Wed, 27 Apr 2022 09:29:17 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Wed, 27 Apr 2022 09:29:17 +0000
Received: from 9e0162dee0fb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 88035E24-03D7-4FEC-8848-972454D7FA5F.1; 
 Wed, 27 Apr 2022 09:29:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9e0162dee0fb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Apr 2022 09:29:10 +0000
Received: from AS9PR04CA0105.eurprd04.prod.outlook.com (2603:10a6:20b:50e::27)
 by AS4PR08MB8096.eurprd08.prod.outlook.com (2603:10a6:20b:58b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 09:29:08 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50e:cafe::e1) by AS9PR04CA0105.outlook.office365.com
 (2603:10a6:20b:50e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Wed, 27 Apr 2022 09:29:08 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 09:29:08 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Wed, 27 Apr
 2022 09:28:59 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 27 Apr 2022 09:28:50 +0000
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
X-Inumbo-ID: 83515e1a-c60c-11ec-8fc2-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Lp14PJgJSL8DfRY/vNVSTgnaJP2+SXMtOOaxSIdSN0G4aM5/fBYLJIYOAFjptaxa+83YZhxJED9CAGp+7zwj0E6fc0Qlfr9XBRJP+HDrXXEwd4Ow1xEiEMDKbnJ7J/lJednUxQsCAF02YPLXXpfaapzeuSYqvg7+RZ7RW4ZylLhZY/72Xkgp8AkvrpnQFr0iU+dLU40fgzOvBoBtIRlpg2qVviFOVl5Rv78ey7WWnNbIOqduYP8ZxAAxmXTGMv7Y0YYVT9SOsQz6xRROZUUw/yP/vleGtXsZ+DHJTxDCSFoJoZNHH2A1DxRF8SFld7T7EQ74K7FFjW8KvRrukTVJOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCND5tjX5cKrs7fmmCD71EclFIECccAGVb3ArYFdizM=;
 b=RBR5KkIyVp5gpUt7Eu4MJi3NvQluON6G3W3eywgyhW9bNwt1g4NZWmt+Ru31RFbvfYUP+cOPVrxUQzhhYIbfeMhuiMtCHxWidRRPsiCQOTKZTr9aRJWsN4QdXQp70SP2IX5J0n5I+F871AyI0ZYgG/7gLkjvdzIj+rQjYQk2hD+4oemlveXIL0XueuMvZuuprBHo7P6Qo+KoVopsWdw/NiHlxQd8me98rk05A5E0S5vzW712fPpDAqOBupprT9Dp1TgAAjboFl2n3C4R0ritHDUgNE+1ubPapzaadJDGYkTF34O8k4JVpq3oRS9S6EBPm5+7bZIbM8nYTjNhnmagPw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCND5tjX5cKrs7fmmCD71EclFIECccAGVb3ArYFdizM=;
 b=wkowdLebUts6R/rCfiZDkpGh6/X2YaY/K24k60FdILdg972WFRUaytQ1xDsAxyL86ms3pw2bSuuCPC0KKlCHw4oxLKQSnZCM7iZr3wqQFYaNDUJcJGON7L2t+PmYNa3ZUN8+9gyw7dVIl8Grp8gZL9Ed63tmK5ceo4u9F2WuH+c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: aafece6b67b8cb1f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DW8tuW/3PO3wj6ibJeBkmJxfFZgNLMjZ7tiByBHf0tda8nRNSZ3rplcFJROl57zqMDK5i9Zb/EPy8DzeA1ItH60aptA44Ok7GNKXGPSkuIpQPvBQQwZT/HvsAH5UXUEWd+DlpE+n3Oo0iaKwiFrrlnKY3k6isataHH7eQG6QNnsWKYG4p7tQPAYWFy9qhyCU0fGHnTimmMZYYhkxhyva1Q9CQMCzpcD0Vdj/o/EjOqdwb4g6lWjmzBNME9V6VKHFAo73/qhYRwLfVLqaqHi3SQnCHxetujQUsFNm17oZu7A56smfPc49t2Pjo0PO3nBakb+1PV9TgTscui6Rej1DIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCND5tjX5cKrs7fmmCD71EclFIECccAGVb3ArYFdizM=;
 b=mYTkotw3LsfsobX6sYZ/FfNfEwK2wW2W/6vpMvVudajP5GD65FAepkRcYH8f1b5CMBt8ORrtDJRvAxAYmblIm5bzQlQwfFbTZly71kA/muxJfGcC2uMFTKEkPAbn4cjNRwxVvKMuLou7rLSAIQmIE4VeRGrHSYCFNji7xZzLSBYY3NanwpPQmkf9BCR2vpix/JSxXgumoypDs8p1EOL6ncOSOTqXmhHZAu/xPSufOCJhV5tLsbCiEeELTIjqI5FIXzszeFRmYrz3Rj0O1WN+NF0Vxx7YayIvopDEHuhg03mWbut+GrAeZiudxFFyfLYbU3yZeZPt3TJ1teQ3/kJMVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCND5tjX5cKrs7fmmCD71EclFIECccAGVb3ArYFdizM=;
 b=wkowdLebUts6R/rCfiZDkpGh6/X2YaY/K24k60FdILdg972WFRUaytQ1xDsAxyL86ms3pw2bSuuCPC0KKlCHw4oxLKQSnZCM7iZr3wqQFYaNDUJcJGON7L2t+PmYNa3ZUN8+9gyw7dVIl8Grp8gZL9Ed63tmK5ceo4u9F2WuH+c=
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
Subject: [PATCH v3 5/6] xen/arm: unpopulate memory when domain is static
Date: Wed, 27 Apr 2022 17:27:42 +0800
Message-ID: <20220427092743.925563-6-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427092743.925563-1-Penny.Zheng@arm.com>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: f4131831-1799-4b14-1aad-08da283066d5
X-MS-TrafficTypeDiagnostic:
	AS4PR08MB8096:EE_|DB5EUR03FT063:EE_|DB7PR08MB3913:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3913943753B17E25B0951544F7FA9@DB7PR08MB3913.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DqS6UQL8zbObI10JODmPFKntvpE/EsMonDE2eqCLZxVxP8Abuf5MJrkGyL4EjwW+Y/w2tI+0XnzgFiTyGLhzvF6XIr2DG24yt8jT9bJqqlumkMeg2NBDmG2St3PUH1SuDJGw+nMxvbW5awgeAYbXBX2L0PPsHmz1Yw3DGmLJ1UWQBDv9oS9bECIXkPU+uKtx6jcJsEDygybn0Qs/Xahx4E13BVv+U5u7UH0sWF9XAN/E/iX9H7Q1jlosi+MzkowgOzQvMkKzheyN997mTVJlyy/44HUdKs1P8y9ZL3N2Tn/2IpOZm6AvBRjOPBJiAxoUz5XZcTD/5zTmu3lFP3XZxCj3QeBdoYKeEDSAexLoUPNUlanPSRvMVKi49dzvJFNstMOCQQ7pVXBbjVa6dl39TDwcGh7BmNcw4k7BA2uKeAo5ZSut3e1pl4QrcyTEaRMIDbGQqzptuEY4n5NvNlQ7m25rJQS1KApTUtLFfamvjOWLVuJCSH8hxe++7i6pCRUo82lFBC0ibfnaui2Zx5esk9Ya3ZVj/3DSp1XQCoihb+ddZbqUTxWZt+LJClcz5Hjx9jo2JDPGBevWlqh5Nc2+eTFFc4wOGDM94reWbkUPDIdbhyJ0rd0UzKiWVnN1ZGYI4GUWjOld4tZ7pmfhmYbYXhJo1TP+juQtmxH35OLPIbgMD7JNmY21Q9UBAinODzYQichS5nDfU95Cuy0dJXBTWw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(40460700003)(81166007)(70206006)(70586007)(47076005)(4326008)(8676002)(2906002)(356005)(54906003)(6666004)(316002)(36756003)(6916009)(7696005)(508600001)(83380400001)(5660300002)(336012)(82310400005)(2616005)(426003)(1076003)(86362001)(186003)(26005)(8936002)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8096
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b5be69e-92ff-44d8-95d7-08da2830616e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zRNPADpIKlJhypvZvuOdckqGNnMcN6kYoOSHTuQXffMVNngTfSRABTypNlW/1OkspLYmjqCAu8G+Iyqyt1wTHru2yYM5mdrwCR5fEvLnBv1SUFrKoJEr8wrU29QTjFo9vVMOLu6/ntAR0F3S2kNbscmEwi+ve3az2RIeS2kAReLYEYwiUiPa9dqX8k1bGQ+9qrk1qAlb7dEFoYcKKzqnk1HiXkk1HFg7m8faexs39MGvYxyOkXiwbGghdcqNXaEa4zauGlNsBfo0gDn21rLQ6dMWnznvJPnAGEk2pYX5idSj2JrylOi+1ZeRvqwR6hPLQ+YuM3F/5sgLPd8ld9B58a9sm/XJqs8EIKTmZP9PSQGMl/euzNDVnRxPBspcEf2x4nQ4Yj5f0ikwjdThYx1hFoR0vTkdr9S1zlbQtrwfXt+pXcRxfQcNbey1qEbdOFik9HC7MT/VZ8OSsmsZl0slEwg3ZWWXioUjI4tAwO1WDQppo131sijS1zWH2QRw7juEzlWn/SBJ0aO3mSVY8rjeSMJ3zZz8tq43fqPMMJeNoBARAbbeVwLjbeT7fCnDUlY48Gtaswf2Ce7oRiSlNp9UC0rCGzqgOPfjFuk+eUIaINrxMf4FGA4YBYUhL5y8q1aFRV5qEKVKOdAIjfdfaX4HNxk4bwCpf4S0v4xqKjoao2Yu8jxxoLCnr2AiAotWhe6M
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(2906002)(316002)(86362001)(81166007)(5660300002)(8936002)(70206006)(70586007)(4326008)(8676002)(6666004)(83380400001)(47076005)(40460700003)(1076003)(7696005)(336012)(26005)(186003)(426003)(54906003)(6916009)(2616005)(508600001)(36860700001)(82310400005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 09:29:17.4973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4131831-1799-4b14-1aad-08da283066d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3913

Today when a domain unpopulates the memory on runtime, they will always
hand the memory back to the heap allocator. And it will be a problem if domain
is static.

Pages as guest RAM for static domain shall be reserved to only this domain
and not be used for any other purposes, so they shall never go back to heap
allocator.

This commit puts reserved pages on the new list resv_page_list only after
having taken them off the "normal" list, when the last ref dropped.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 changes:
- have page_list_del() just once out of the if()
- remove resv_pages counter
- make arch_free_heap_page be an expression, not a compound statement.
---
v2 changes:
- put reserved pages on resv_page_list after having taken them off
the "normal" list
---
 xen/arch/arm/include/asm/mm.h | 12 ++++++++++++
 xen/common/domain.c           |  4 ++++
 xen/include/xen/sched.h       |  3 +++
 3 files changed, 19 insertions(+)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 424aaf2823..c6426c1705 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -358,6 +358,18 @@ void clear_and_clean_page(struct page_info *page);
 
 unsigned int arch_get_dma_bitsize(void);
 
+/*
+ * Put free pages on the resv page list after having taken them
+ * off the "normal" page list, when pages from static memory
+ */
+#ifdef CONFIG_STATIC_MEMORY
+#define arch_free_heap_page(d, pg) ({                   \
+    page_list_del(pg, page_to_list(d, pg));             \
+    if ( (pg)->count_info & PGC_reserved )              \
+        page_list_add_tail(pg, &(d)->resv_page_list);   \
+})
+#endif
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6373407047..13fe7cecff 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -604,6 +604,10 @@ struct domain *domain_create(domid_t domid,
     INIT_PAGE_LIST_HEAD(&d->page_list);
     INIT_PAGE_LIST_HEAD(&d->extra_page_list);
     INIT_PAGE_LIST_HEAD(&d->xenpage_list);
+#ifdef CONFIG_STATIC_MEMORY
+    INIT_PAGE_LIST_HEAD(&d->resv_page_list);
+#endif
+
 
     spin_lock_init(&d->node_affinity_lock);
     d->node_affinity = NODE_MASK_ALL;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 49415a113a..368e5c1c53 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -376,6 +376,9 @@ struct domain
     struct page_list_head page_list;  /* linked list */
     struct page_list_head extra_page_list; /* linked list (size extra_pages) */
     struct page_list_head xenpage_list; /* linked list (size xenheap_pages) */
+#ifdef CONFIG_STATIC_MEMORY
+    struct page_list_head resv_page_list; /* linked list (size resv_pages) */
+#endif
 
     /*
      * This field should only be directly accessed by domain_adjust_tot_pages()
-- 
2.25.1


