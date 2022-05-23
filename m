Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AA1530985
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 08:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335354.559552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1WI-0000io-5L; Mon, 23 May 2022 06:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335354.559552; Mon, 23 May 2022 06:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1WI-0000ed-10; Mon, 23 May 2022 06:26:22 +0000
Received: by outflank-mailman (input) for mailman id 335354;
 Mon, 23 May 2022 06:26:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eb4B=V7=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nt1WF-0007pn-QL
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 06:26:20 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4165afca-da61-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 08:26:19 +0200 (CEST)
Received: from DBBPR09CA0001.eurprd09.prod.outlook.com (2603:10a6:10:c0::13)
 by DB6PR0801MB1847.eurprd08.prod.outlook.com (2603:10a6:4:3c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Mon, 23 May
 2022 06:26:12 +0000
Received: from DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::7) by DBBPR09CA0001.outlook.office365.com
 (2603:10a6:10:c0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15 via Frontend
 Transport; Mon, 23 May 2022 06:26:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT023.mail.protection.outlook.com (100.127.142.253) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 06:26:12 +0000
Received: ("Tessian outbound 32b886dfa5b9:v119");
 Mon, 23 May 2022 06:26:12 +0000
Received: from b5eab67ce7ec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D0DB6EC1-099D-4C69-856F-F6F8094BDFE1.1; 
 Mon, 23 May 2022 06:26:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b5eab67ce7ec.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 May 2022 06:26:06 +0000
Received: from DU2PR04CA0261.eurprd04.prod.outlook.com (2603:10a6:10:28e::26)
 by DB8PR08MB4153.eurprd08.prod.outlook.com (2603:10a6:10:a2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 06:26:05 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::a) by DU2PR04CA0261.outlook.office365.com
 (2603:10a6:10:28e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22 via Frontend
 Transport; Mon, 23 May 2022 06:26:05 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 06:26:05 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 23 May
 2022 06:26:04 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 23 May 2022 06:26:01 +0000
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
X-Inumbo-ID: 4165afca-da61-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NdPYEV01QDiACvm/kmTgxYwzuqpZSLww43AgDcfdiqeDKk4h9W9+YtikM7cPYFocVtbKZ77YksZJo7NYXDo3+Ykm443huQZuve9l4IGJQ+eV9PMuPYQ0+JA8Xi3XxkYzCEyvrcFt08vEYr22oOK4MV35waRN7+YNBhZaE9rkUsXkLx71ecedD3YBANE/iEp5+/rof9L1OnELgiJPHhD7jtlIF5JShexHrMovCPww8Wt/FDOqXV09mMoYfuy+Q37ebWbuOPwcBjm7N90sAvkqF3N3tCpgdBFYuokDvTSRI4P9ifTrIKI/bAt/WBSOE1Ht+wqkmCB36EzJPf5P8/6n0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZH7C2DqN/PCll0sk/Ops4kNowCdYB+hJ4yS3CHVcHc=;
 b=YNwzrFL2s6lTcTt3cPm0qPOXXZN2vqxOWi22N5IT1BJU+Dr3iAt0Axw0OnIMpo9Cv3vguIXuojGLyqOVuF82Sfg/coEqSk5A9FweKVHo9TKA4V+aQHtRublAz1QwIMQCDY6SLv3SbrwlLOQViYVnGMGoFncXWFsZ57dz/U9SkxT7lM5Hthhup9T6P1B18mynaL5Nx/hGFlq/jeqVYVJkJh2iLOi7BB1gHT9xvFAxSgrih2G7mwgwZCj7h+OD3gZxNc5M2hspk8De8uB+cn9djpmjV6khrRdOQPd35ctKCViSxnkBROLN6XPzThtk9Gd5OyEzXOSGyDqhcKWR+LXMbg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZH7C2DqN/PCll0sk/Ops4kNowCdYB+hJ4yS3CHVcHc=;
 b=R78yTLitvo0Flswj6c3nZ0LS3eifhq/mKyVmdGjjdsYjxEl25CdARYWsV4NT7D9TTHHt+tn2Y5i80dPb0cGChAVmX+ynuaqK4T157cuGc8GO2O6tE5p36yqhLHbkh92kieqWTWby5gaz3U/nLnjMclYIi0MyMa0Yb52bnCrl+3s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a65b5303d344cfe3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAIFWLCjmQXthbN4ZoXQ5i+lsYqPxahW7b65r617zFULgmhpfYu9t2KzeorjQkzjnVedT7vod5nFkEUmO0CkCzwDxvGxIMjLB4YCyM2G6hQvMKpRrkEiq7UKOElzKYdM6nzOuxGOJwXNGd3yeZ0BKWKyUSWhDgX8WjL/ac6INSikg2bxavXEemtWw2eLMAsB4WRZi7bIkZ7ESJ+woM/2llDX8U44rl6bKuiY9f5TCZ88S2L694oX0pzlkxLXXAdDCcGbjQH06od803ynBt2IntLmQd2WR4bwVC/DmOfwnS7IdOIlK7RA7pDBkpb3aD+gMBkF6chqSfCGzGY3Ij451Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZH7C2DqN/PCll0sk/Ops4kNowCdYB+hJ4yS3CHVcHc=;
 b=iUBDpgBhVclV4KsQGSwFbi8ePEOen9jplc1ia9my5ex/knSDDcOhuWu+RQbehPqCmGEYtNsQ/id04iAGFcOpJTI/dZiGT1sxSVZrZMk/+vF9/qMRFtxzWNwffcUcODaZ+vZgGMamXr9SSuooYkHngkwUM0HB10CRaFJaEWAdxtXKFNhzwLazCnSwh/5HbveFYKh9I8l19F575BJ/hcrteoXzBfx9vqyvyJA38G3KiUdXGuEhw19UReCJIVqJv4oWoDOlPIlwBsmHlAZFAPIxFRlWHap7p5LSTUg/Pzqq2+xpbvV2JLTwu9/GAS28oPc5MCLjB+f8jcYxQoJASCHthg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZH7C2DqN/PCll0sk/Ops4kNowCdYB+hJ4yS3CHVcHc=;
 b=R78yTLitvo0Flswj6c3nZ0LS3eifhq/mKyVmdGjjdsYjxEl25CdARYWsV4NT7D9TTHHt+tn2Y5i80dPb0cGChAVmX+ynuaqK4T157cuGc8GO2O6tE5p36yqhLHbkh92kieqWTWby5gaz3U/nLnjMclYIi0MyMa0Yb52bnCrl+3s=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v4 5/8] xen/arm: use !CONFIG_NUMA to keep fake NUMA API
Date: Mon, 23 May 2022 14:25:22 +0800
Message-ID: <20220523062525.2504290-6-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523062525.2504290-1-wei.chen@arm.com>
References: <20220523062525.2504290-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 526069b3-284d-44d5-69e7-08da3c8521f7
X-MS-TrafficTypeDiagnostic:
	DB8PR08MB4153:EE_|DBAEUR03FT023:EE_|DB6PR0801MB1847:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB1847FE8D442C935F463DD1A09ED49@DB6PR0801MB1847.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EWaPCoDYcZaTPJMKbRtZdzJucY/XFqnRmG/TQSEKGr2d6jSAeGhlka710iN9dAXCr7iIsHXOvSbYwhI3+FR3+O5RDlNwkImxNTBshVYBr3Xtv9n3j8jGKRqUd+DCjnp4XV7sAqKB0iwRgQs2bhVdPaEBE4KZ6t2i1XvrdQn4jgK8ke/Tij9M/LWmSm+rXi5RbH9xQwj9crutKzQqztFjxEmC0q+33r/K22zAcTrZZdCvay0a3/tg+VJZKNYrNwVSr3HoKZeczSs1kJl8+kXpxtCSPcf9dpLa3RVjXnm+dfGFW91OBdfjKrdoZ/6zuO082RdsTTu0l0PTCkMauX3MhZmIxwqmIPa5f4TDeiA42DkHfwygNsGFDX4XaxgC5XBIYMEmIkESjgO4+05nyZsy7uyvoYjFC8jMn+ZW7uKhnQtawQx37CQrVjEypG5lzdQxmsahQbbwdUUqOscNj77mvUeQ2qxD0vlOSi7NZ5l5/IKddeMcXu3aen9CJm30A5BAJv12UEXYl4nzNXc5BTAzeQWRhUdYFdFoI2CBDev2ZOWyngOzjPtEwJXBU5L7/7906AJgMFTbxHXeBn7gJteRfQm3mqIiE+BjYv3Ie+cXF3MnrIUlqbqc88ajjG5UJNNDgG2TyVZIdcR+w0DcVlPlr5lGjQztv7Dk1rTdIL151+ESsGzGoeE1mBrLWAfx0XRyYtsjr/yHAQ1qFSnK2t/cLg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(356005)(40460700003)(81166007)(1076003)(2616005)(70586007)(70206006)(6666004)(26005)(8676002)(4326008)(44832011)(86362001)(7696005)(8936002)(5660300002)(54906003)(36860700001)(6916009)(316002)(186003)(82310400005)(83380400001)(336012)(508600001)(47076005)(426003)(36756003)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4153
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	798b3546-7772-48c9-e5e4-08da3c851d8b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U6cHKa6fau1rZm9lniL+OXs5fiYhvHRugZ7Ff/eanHw3R3/Wg3+v7jbcSo835vUg38HzkBQeBhR8zypLr0wIr8Y8ClJXE8P0XQ14xHJ/GnKu9SgM58XrccpDqiKJWPj8OZEL5pC4GKyrvF+CYr61VAr8DHJdwS+ZxYbjZvLFYdqifcGCZKu96cL5Et/WAIbZNcTu6csCzjqZclaj2hlvCrz9UifbGYlA9z6gjm6Y86zPUPV5NVZKR2U1sYyTVOMFTvXA5v9iwY/50rrHJ09b+/Xcd1KtL77emzAWVMwLGDElbXE6DiWSIJ28k/+4koPvl42ahvpIuedUfe7v+J2MBcDQ1cLWrKCJN7+HIq8GdY+EdgfjQ/SwUm/APIDAQscrnMOVJB4e6OP/bKKxnCQh10KHUoc0OnczcDeustQ+mSzXl2YtLYWikFkWmHEiBAYzV7iK9YcLav84dnkoO4pctRUIfGhMsXPhSy84BkJr+3+WVtmQxFNEX1F1jYExG5boYxfdc3s9lPBR9ghwnX5Lmag2RHGw0vQ26NBfWj6fkDeuPkwX6q9iSNi/k43vjHJ3e6VBFfvTC/i2LvvoisYanuofF6G831aoaslDepQfutrZQY54qfz7DnvmsSuplKrJpeaHezjJnSyIh5j8UZGMMw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(44832011)(6666004)(82310400005)(36756003)(86362001)(5660300002)(316002)(36860700001)(26005)(2906002)(7696005)(83380400001)(8676002)(4326008)(2616005)(6916009)(54906003)(47076005)(70206006)(426003)(186003)(81166007)(8936002)(508600001)(1076003)(336012)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 06:26:12.4369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 526069b3-284d-44d5-69e7-08da3c8521f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1847

We have introduced CONFIG_NUMA in a previous patch. And this
option is enabled only on x86 at the current stage. In a follow
up patch, we will enable this option for Arm. But we still
want users to be able to disable the CONFIG_NUMA via Kconfig. In
this case, keep the fake NUMA API, will make Arm code still
able to work with NUMA aware memory allocation and scheduler.

Change-Id: I595b4c84f61f0b827ad9dfbeef03aae30f4752f0
Issue-Id: SCM-2240
Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v3 -> v4:
no change
v2 -> v3:
Add Tb.
v1 -> v2:
No change.
---
 xen/arch/arm/include/asm/numa.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index e4c4d89192..268a9db055 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -5,6 +5,8 @@
 
 typedef u8 nodeid_t;
 
+#ifndef CONFIG_NUMA
+
 /* Fake one node for now. See also node_online_map. */
 #define cpu_to_node(cpu) 0
 #define node_to_cpumask(node)   (cpu_online_map)
@@ -24,6 +26,9 @@ extern mfn_t first_valid_mfn;
 #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
+
+#endif
+
 #define arch_want_default_dmazone() (false)
 
 #endif /* __ARCH_ARM_NUMA_H */
-- 
2.25.1


