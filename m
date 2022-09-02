Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572C15AA66C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 05:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397249.637789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTxPq-0006LW-2F; Fri, 02 Sep 2022 03:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397249.637789; Fri, 02 Sep 2022 03:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTxPp-0006JB-US; Fri, 02 Sep 2022 03:32:21 +0000
Received: by outflank-mailman (input) for mailman id 397249;
 Fri, 02 Sep 2022 03:32:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UH2R=ZF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oTxPn-0004Wz-G3
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 03:32:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70057.outbound.protection.outlook.com [40.107.7.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7ef4871-2a6f-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 05:32:17 +0200 (CEST)
Received: from DB6PR07CA0172.eurprd07.prod.outlook.com (2603:10a6:6:43::26) by
 AS2PR08MB9500.eurprd08.prod.outlook.com (2603:10a6:20b:60c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.11; Fri, 2 Sep 2022 03:32:13 +0000
Received: from DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::90) by DB6PR07CA0172.outlook.office365.com
 (2603:10a6:6:43::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.6 via Frontend
 Transport; Fri, 2 Sep 2022 03:32:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT033.mail.protection.outlook.com (100.127.142.251) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 03:32:13 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Fri, 02 Sep 2022 03:32:13 +0000
Received: from 84a4feb24c14.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F41608C2-F044-4E42-86CF-FFE7CC9B61D1.1; 
 Fri, 02 Sep 2022 03:32:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 84a4feb24c14.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 03:32:07 +0000
Received: from DB8P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::21)
 by AS8PR08MB9573.eurprd08.prod.outlook.com (2603:10a6:20b:61b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 03:32:02 +0000
Received: from DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::25) by DB8P191CA0011.outlook.office365.com
 (2603:10a6:10:130::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12 via Frontend
 Transport; Fri, 2 Sep 2022 03:32:02 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT012.mail.protection.outlook.com (100.127.142.126) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 03:32:01 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.9; Fri, 2 Sep 2022
 03:31:59 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.9; Fri, 2 Sep
 2022 03:31:58 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 2 Sep 2022 03:31:54 +0000
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
X-Inumbo-ID: d7ef4871-2a6f-11ed-934f-f50d60e1c1bd
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SieV/NNbADK7PX3lbkaS5+U4k1E/eD8+Ikt23Qy9l+o5P8Rveh501H5QTJZ/NYkZ4igD2c+ddh/O96Z43SdzgEVZMQQW+EPIvGSDJSqTL2ox/CPaiwGiHzTs7LyOlrz0LymAkc8Q3mrf3ngD1rVKYztzDaDQet08aSkctVkiAytZKXAUw1sNZ3y7HahuPsDSqFFU4J/FP5MEAXkkLW/jQmQtLHygyl0V4p3gBwpcNv0EBIcIe+4dEJeY7CQZN//xrCI7Y3To3QXPHnMfEDsyTGRFBECRLCCoa8F/C18tFhL97vW3RYdev7JjLfNjWGB2x7SUHKRK5raO8KoUA+O2ig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfSjviedwydQI2bCgX6A66sdP/EsoIsoIF3RlFpRa0g=;
 b=gsLV3743baK1rIkfAhW2LH0q8DTnNmwKA/CHYCg7VpyhZ2GO8d1VpAsRmabWTOqzeOOU53oezPNixme0XiKoKdSh1iT8bMvP6o+Gi0EmbCUeujIfrly9WZyFSLyaSeu4pWCjnkrhhE2Hzmlc8+OjQHjFgh8Tv6Sn2ectIwIVUCU5hnnO+YLJ02N7wznqKo8zFwgv+xO5T7u8WsIzIvnl3FHHP4Ss5l7eFMe4KjpK6HHEMBsZHVxPT0zHcRtOGi8UUDe6b6+8nOOmXYCxMnKJLlnOVwewT3C3tNACOdjK4RsxBkkJRSDDm1s3yasWx9XiSyVuDWM91pakxqNGrROlPg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfSjviedwydQI2bCgX6A66sdP/EsoIsoIF3RlFpRa0g=;
 b=NinzuUHC9sxeXoGMociqzoWVX11fNnfxSxrIryTLrn4jbFyG35WdRuDuhiuVK01ZS9EIIsdn8V58NrbNhmdqnknQHLVl2NZ+JCLAJ0V6gTCKskz46fGd/cX/8DvMT+mvwu7BCwPMCwlQgiyvKi4GTRT8HgbWhd54t3StrB6RQiI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 53b8b6652d082267
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdGtVitsJpsZbgY8QkdW7GtaWh72m0aP1UhuphU9TF142OLcfH99sok5Mo1dFjRfiwXwCg6aek6ogULXChB/mPGrcICnFH3DVrkphOHCI8KKn3ZqpTvh5jiqwY29Wba+1Je0jj/qszUX+ISsAh7Y8Ip+qzblLm8rjwtrqm8SUSDFM/A8EShl6kadXhNvJCGI1T3dgN45Jg5Wos4T2Ddqmw/FNUy6F5xQisaOBRU7bAYlbZ4EirtdL1wkcmMTvJM1BiZo0xAK0Eq2XuUdrCWgdNzHaFjXOtofHp6UPcXLemn6CXpuNyBLv6ignpfuA1WMH/cPIbOGLiBWqhPQbmUSvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfSjviedwydQI2bCgX6A66sdP/EsoIsoIF3RlFpRa0g=;
 b=V4I6STe/OFejiryIewBq9WmTg46+j7W2q81h895oGZ1x1vUs7NTVWsCDm6CjR8e/TIPVSiBNafsHb1JtjFbj/2HidhBaGXhft1tCaITC4y0WN0rsEXFv7NrX5/d9/wLd9q6V2clpGiaH1c86pMGNtzpP0ie19ifVA9m8QyLY4Qsemp9/PhoZldiMSDTkU7YoKeJ/Zyh/0XSKNgUG4VuUovpgoQs/ReBG4R65wJ959v15/xARzbhBb1kQMhz85mcOmRgFjAY/YTXt74UHU4ezhC/ZRz3msLb1wOPGGOsaGT96igIIB79XceTWYb6S/yHpmAB0i4cx6FF1wewW/OR0Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfSjviedwydQI2bCgX6A66sdP/EsoIsoIF3RlFpRa0g=;
 b=NinzuUHC9sxeXoGMociqzoWVX11fNnfxSxrIryTLrn4jbFyG35WdRuDuhiuVK01ZS9EIIsdn8V58NrbNhmdqnknQHLVl2NZ+JCLAJ0V6gTCKskz46fGd/cX/8DvMT+mvwu7BCwPMCwlQgiyvKi4GTRT8HgbWhd54t3StrB6RQiI=
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
Subject: [PATCH v4 5/6] xen/x86: move NUMA scan nodes codes from x86 to common
Date: Fri, 2 Sep 2022 11:31:20 +0800
Message-ID: <20220902033121.540328-6-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902033121.540328-1-wei.chen@arm.com>
References: <20220902033121.540328-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: b5e62c34-bdf8-4adb-f570-08da8c93ba20
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB9573:EE_|DBAEUR03FT033:EE_|AS2PR08MB9500:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 p/tSO5tBxJdEeD6tsVuaTWavthIVwj2OC4InpAmhPcu+Az8qBgME+zt6hH0aO6JDNP0s7LfohUJynUry3ipBIW018/HSYO4g3iG0sb/Ja06QrQbJ0eSmvji424YNvyIKQDcYM+fzk8pWIS5C01Npkwubz7DIiBykyQcbVhxUnQmm6DWysb8/+b8zWZY1jyIaKfT+/9Vk+w/Lzy6WnI1Cs5Bf7hvPYer85vyOS2WZOWyk8j6an8SagbFOh5StfPZbF8Ejarq8j2SvsjHyunGQOfw+0ek58uJVVRoGIJdVAsuIPsYeTtyqTzhuMigeDneCq2cUHGArU7W344YaE/sDiX6wZ/Pzjs7CZNPK30glcA7cBkJ8eOlnaxxkKB+opXSeYbEX9Z4BlTRVQ4FiSfc7RjR8qXVAkINVoGPy5ObqAYaDmBYpAYzSiguLYPmLze67iYaU/yyaylztO6gxeNan6gUbE8gbXFk30p3vsxNpFSs2sDBYTmAbEgreUdjYHGP/0CORlnAizBpMt3xPnaHcEuzXfz42FOskxpoIqzQBB3NSGlGMeC43xLCp1LzFfXVN7TN1hQ4nbsU2LKY1cB9z7lUDRtwL+fo4VOBkl+gpCgjXhkO+zcW3CrYe495yahjQcJOqRTvpcDPwntc6qgP6671mwVXx1iS6FsA48+JBFzyQiQjGm0JCREHciJgLUdwZB0MR+vsm3rylrVtfjPpSkmA7GWQ296l3HSIvD6cLwjErq2hzu9Xu0WvIE/l8GIhqKB1Q4Xp01S5mKCjLa8K8DreSdZpkJ2RAxLlqTBi4BRJ8E7HmpW0G5k3Aa6+x99m+
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966006)(40470700004)(36840700001)(356005)(86362001)(36756003)(36860700001)(83380400001)(47076005)(426003)(7696005)(2616005)(1076003)(186003)(26005)(6666004)(336012)(41300700001)(316002)(82310400005)(40480700001)(4326008)(70586007)(8676002)(478600001)(54906003)(2906002)(82740400003)(5660300002)(70206006)(6916009)(81166007)(44832011)(30864003)(40460700003)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9573
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b80815d-6faa-4aef-e9ca-08da8c93b2f6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xuNmryb7W3Pk04e3z49enxlOsftrDW+ppKPfIHiY2c/j9IlNK93XGxcG2TxDJOjbkEjlB0GYGZc1vVL2jNh4AwZj75mUjBCqs92Kam1+7l3tB2GhhThcJRekpynwsn/ndZYJn8Y694lMDvjyXgF0JIBQWyKqC37SmeYxLlxBunWdRC/T0s/hscasgmXIYErOaJq9851ytr81OFSkVOYgwuNZd74V2uDXYC6g+fVaYNJWfRKcaX0tz3ONLmxoU/Z8kmc84Mn/4j5xM6wSlC56xWDsOWG+T1e+rgJqimQCeuv+A53tB0AN5q+LHkab81Xavg1HV+9Vo8Yo4AEYAgRK8fB/wcy0XS0t5ibu/UMug8A8hOuvYUhX9zVKsKZCZo7mXoI8PMTccjLhHeqVVca89dKacvSvHO9ICsoEgG29AjTHnSBtP0pRmNQIDU9hfZs2pTQpsNaBiL2szMocA+5xLt5dJEefQ+BPBAo1E8SNdq9xitO/qGzMgk3qSZ3qekdkCwk/MSIWWg3BZK+ekbvHOIlWKF5MhiM48jnKEK+kvfHUrwTzG3GNdJcdjtrSLy3dope/jiYcGmCTD/ev+lhKZwVc24uerKqIEevotfxC+abR5EpNX32k+zsgVhSbMc9yniEL2DCX+o7v+/IhBrxxsI7DhmsONXeopIOy4qIYypcBVCAz0jg54DrLvIXTGlgSni1IPCGzY5qeYkQrHTGt6IulA+idk7IUn23oF5R3Aa9FudhoZE0gmDARm82EPLfxK28SGVYK9r4rQpMgo5bk4A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(39860400002)(376002)(36840700001)(40470700004)(46966006)(82740400003)(5660300002)(41300700001)(8936002)(40460700003)(26005)(2906002)(107886003)(7696005)(86362001)(6666004)(30864003)(36860700001)(44832011)(40480700001)(82310400005)(1076003)(336012)(47076005)(81166007)(83380400001)(70586007)(426003)(186003)(2616005)(54906003)(70206006)(6916009)(478600001)(4326008)(316002)(36756003)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 03:32:13.6993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e62c34-bdf8-4adb-f570-08da8c93ba20
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9500

x86 has implemented a set of codes to scan NUMA nodes. These
codes will parse NUMA memory and processor information from
ACPI SRAT table. But except some ACPI specific codes, most
of the scan codes like memory blocks validation, node memory
range updates and some sanity check can be reused by other
NUMA implementation.

So in this patch, we move some variables and related functions
for NUMA memory and processor to common as library. At the
same time, numa_set_processor_nodes_parsed has been introduced
for ACPI specific code to update processor parsing results.
With this helper, we can reuse most of NUMA memory affinity init
code from ACPI. As bad_srat and node_to_pxm functions have been
used in common code to do architectural fallback and node to
architectural node info translation. But it doesn't make sense
to reuse the functions names in common code, we have rename them
to neutral names as well.

PXM is an ACPI specific item, we can't use it in common code
directly. As an alternative, we extend the parameters of
numa_update_node_memblks. The caller can pass the PXM as print
messages' prefix or as architectural node id. And we introduced
a CONFIG_HAS_NUMA_NODE_FWID to prevent print the mapping between
node id and architectural node id for those architectures do not
have architectural node id. In this case, we do not need to retain
a lot of per-arch code but still can print architectural log
messages for different NUMA implementations.

mem_hotplug also has been accessing by common code, except x86,
other architectures like Arm will also want to implement memory
hotplug in future. We export mem_hotplug to common will not bring
any harm for Arm and we also can reduce some per-arch helpers to
access mem_hotplug.

As asm/acpi.h has been removed from common/numa.c, we have to
move NR_NODE_MEMBLKS from asm/acpi.h to xen/numa.h in this patch
as well.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3 -> v4:
1. Use bool as return value for functions that only return
   0/1 or 0/-EINVAL.
2. Move mem_hotplug to a proper place in mm.h
3. Remove useless "size" in numa_scan_nodes.
4. Use unsigned int or const for proper variables.
5. Fix code-style.
6. Add init_as_disable as arch_numa_disabled parameter.
7. Add CONFIG_HAS_NUMA_NODE_FWID to gate print the mapping
   between node id and architectural node id (fw node id).
v2 -> v3:
1. Add __ro_after_init to proper variables.
2. Rename bad_srat to numa_fw_bad.
3. Rename node_to_pxm to numa_node_to_arch_nid.
4. Merge patch#7 and #8 into this patch.
5. Correct int to unsigned int in proper places.
6. Move NR_NODE_MEMBLKS from x86/acpi.h to common/numa.h
7. Drop helpers to access mem_hotplug, we export mem_hotplug
   from x86/mm.c to common/page_alloc.c
v1 -> v2:
1. Add code comment for numa_update_node_memblks to explain:
   Assumes all memory regions belonging to a single node
   are in one chunk. Holes between them will be included
   in the node.
2. Merge this single patch instead of serval patches to move
   x86 SRAT code to common.
3. Export node_to_pxm to keep pxm information in NUMA scan
   nodes error messages.
4. Change the code style to target file's Xen code-style.
5. Adjust some __init and __initdata for some functions and
   variables.
6. Merge two patches into this patch:
   1. replace CONFIG_ACPI_NUMA by CONFIG_NUMA.
   2. replace "SRAT" texts.
7. Turn numa_scan_nodes to static.
---
 xen/arch/x86/include/asm/acpi.h |   1 -
 xen/arch/x86/include/asm/mm.h   |   2 -
 xen/arch/x86/include/asm/numa.h |   3 +-
 xen/arch/x86/mm.c               |   2 -
 xen/arch/x86/numa.c             |   7 +-
 xen/arch/x86/srat.c             | 311 +++----------------------------
 xen/common/numa.c               | 321 +++++++++++++++++++++++++++++++-
 xen/common/page_alloc.c         |   2 +
 xen/drivers/acpi/Kconfig        |   1 +
 xen/include/xen/mm.h            |   2 +
 xen/include/xen/numa.h          |  12 +-
 11 files changed, 363 insertions(+), 301 deletions(-)

diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 5c2dd5da2d..c453450a74 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -102,7 +102,6 @@ extern unsigned long acpi_wakeup_address;
 #define ARCH_HAS_POWER_INIT	1
 
 extern s8 acpi_numa;
-#define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
 
 extern struct acpi_sleep_info acpi_sinfo;
 #define acpi_video_flags bootsym(video_flags)
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 0fc826de46..95ff71a83a 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -474,8 +474,6 @@ static inline int get_page_and_type(struct page_info *page,
     ASSERT(((_p)->count_info & PGC_count_mask) != 0);          \
     ASSERT(page_get_owner(_p) == (_d))
 
-extern paddr_t mem_hotplug;
-
 /******************************************************************************
  * With shadow pagetables, the different kinds of address start
  * to get get confusing.
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 6c87942d43..2ca3475271 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -10,6 +10,7 @@ typedef u8 nodeid_t;
 extern int srat_rev;
 
 extern nodeid_t pxm_to_node(unsigned int pxm);
+extern unsigned int numa_node_to_arch_nid(nodeid_t n);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
 
@@ -22,8 +23,6 @@ extern void init_cpu_to_node(void);
 
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
-extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
-
 void srat_parse_regions(paddr_t addr);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index db1817b691..68f9989e1f 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -157,8 +157,6 @@ l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
     l1_fixmap_x[L1_PAGETABLE_ENTRIES];
 
-paddr_t __read_mostly mem_hotplug;
-
 /* Frame table size in pages. */
 unsigned long max_page;
 unsigned long total_pages;
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index fa8caaa084..e565c3a34d 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -41,9 +41,12 @@ int __init arch_numa_setup(const char *opt)
     return -EINVAL;
 }
 
-bool arch_numa_disabled(void)
+bool arch_numa_disabled(bool init_as_disable)
 {
-    return acpi_numa < 0;
+    if ( !init_as_disable )
+        return acpi_numa < 0;
+
+    return acpi_numa <= 0;
 }
 
 /*
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index bd9694db24..7964e199c5 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -24,10 +24,6 @@
 
 static struct acpi_table_slit *__read_mostly acpi_slit;
 
-static nodemask_t memory_nodes_parsed __initdata;
-static nodemask_t processor_nodes_parsed __initdata;
-static struct node nodes[MAX_NUMNODES] __initdata;
-
 struct pxm2node {
 	unsigned pxm;
 	nodeid_t node;
@@ -35,19 +31,6 @@ struct pxm2node {
 static struct pxm2node __read_mostly pxm2node[MAX_NUMNODES] =
 	{ [0 ... MAX_NUMNODES - 1] = {.node = NUMA_NO_NODE} };
 
-static unsigned node_to_pxm(nodeid_t n);
-
-static int num_node_memblks;
-static struct node node_memblk_range[NR_NODE_MEMBLKS];
-static nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
-static __initdata DECLARE_BITMAP(memblk_hotplug, NR_NODE_MEMBLKS);
-
-enum conflicts {
-	NO_CONFLICT,
-	OVERLAP,
-	INTERLEAVE,
-};
-
 static inline bool node_found(unsigned idx, unsigned pxm)
 {
 	return ((pxm2node[idx].pxm == pxm) &&
@@ -110,78 +93,7 @@ nodeid_t setup_node(unsigned pxm)
 	return node;
 }
 
-int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
-{
-	int i;
-
-	for (i = 0; i < num_node_memblks; i++) {
-		struct node *nd = &node_memblk_range[i];
-
-		if (nd->start <= start && nd->end >= end &&
-			memblk_nodeid[i] == node)
-			return 1;
-	}
-
-	return 0;
-}
-
-static
-enum conflicts __init conflicting_memblks(nodeid_t nid, paddr_t start,
-					  paddr_t end, paddr_t nd_start,
-					  paddr_t nd_end, unsigned int *mblkid)
-{
-	unsigned int i;
-
-	/*
-	 * Scan all recorded nodes' memory blocks to check conflicts:
-	 * Overlap or interleave.
-	 */
-	for (i = 0; i < num_node_memblks; i++) {
-		struct node *nd = &node_memblk_range[i];
-
-		*mblkid = i;
-
-		/* Skip 0 bytes node memory block. */
-		if (nd->start == nd->end)
-			continue;
-		/*
-		 * Use memblk range to check memblk overlaps, include the
-		 * self-overlap case. As nd's range is non-empty, the special
-		 * case "nd->end == end && nd->start == start" also can be covered.
-		 */
-		if (nd->end > start && nd->start < end)
-			return OVERLAP;
-
-		/*
-		 * Use node memory range to check whether new range contains
-		 * memory from other nodes - interleave check. We just need
-		 * to check full contains situation. Because overlaps have
-		 * been checked above.
-		 */
-	        if (nid != memblk_nodeid[i] &&
-		    nd->start >= nd_start && nd->end <= nd_end)
-			return INTERLEAVE;
-	}
-
-	return NO_CONFLICT;
-}
-
-static __init void cutoff_node(int i, paddr_t start, paddr_t end)
-{
-	struct node *nd = &nodes[i];
-	if (nd->start < start) {
-		nd->start = start;
-		if (nd->end < nd->start)
-			nd->start = nd->end;
-	}
-	if (nd->end > end) {
-		nd->end = end;
-		if (nd->start > nd->end)
-			nd->start = nd->end;
-	}
-}
-
-static __init void bad_srat(void)
+void __init numa_fw_bad(void)
 {
 	int i;
 	printk(KERN_ERR "SRAT: SRAT not used.\n");
@@ -241,7 +153,7 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 	if (numa_disabled())
 		return;
 	if (pa->header.length < sizeof(struct acpi_srat_x2apic_cpu_affinity)) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 	if (!(pa->flags & ACPI_SRAT_CPU_ENABLED))
@@ -254,12 +166,12 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 	pxm = pa->proximity_domain;
 	node = setup_node(pxm);
 	if (node == NUMA_NO_NODE) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 
 	apicid_to_node[pa->apic_id] = node;
-	node_set(node, processor_nodes_parsed);
+	numa_set_processor_nodes_parsed(node);
 	acpi_numa = 1;
 
 	if (opt_acpi_verbose)
@@ -277,7 +189,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 	if (numa_disabled())
 		return;
 	if (pa->header.length != sizeof(struct acpi_srat_cpu_affinity)) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 	if (!(pa->flags & ACPI_SRAT_CPU_ENABLED))
@@ -290,11 +202,11 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 	}
 	node = setup_node(pxm);
 	if (node == NUMA_NO_NODE) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 	apicid_to_node[pa->apic_id] = node;
-	node_set(node, processor_nodes_parsed);
+	numa_set_processor_nodes_parsed(node);
 	acpi_numa = 1;
 
 	if (opt_acpi_verbose)
@@ -306,32 +218,27 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 {
-	struct node *nd;
-	paddr_t nd_start, nd_end;
-	paddr_t start, end;
 	unsigned pxm;
 	nodeid_t node;
-	unsigned int i;
 
 	if (numa_disabled())
 		return;
 	if (ma->header.length != sizeof(struct acpi_srat_mem_affinity)) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 	if (!(ma->flags & ACPI_SRAT_MEM_ENABLED))
 		return;
 
-	start = ma->base_address;
-	end = start + ma->length;
 	/* Supplement the heuristics in l1tf_calculations(). */
-	l1tf_safe_maddr = max(l1tf_safe_maddr, ROUNDUP(end, PAGE_SIZE));
+	l1tf_safe_maddr = max(l1tf_safe_maddr,
+			      ROUNDUP(ma->base_address + ma->length,
+			      PAGE_SIZE));
 
-	if (num_node_memblks >= NR_NODE_MEMBLKS)
-	{
+	if (!numa_memblks_available()) {
 		dprintk(XENLOG_WARNING,
-                "Too many numa entry, try bigger NR_NODE_MEMBLKS \n");
-		bad_srat();
+			"Too many numa entries, try bigger NR_NODE_MEMBLKS!\n");
+		numa_fw_bad();
 		return;
 	}
 
@@ -340,136 +247,14 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		pxm &= 0xff;
 	node = setup_node(pxm);
 	if (node == NUMA_NO_NODE) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 
-	/*
-	 * For the node that already has some memory blocks, we will
-	 * expand the node memory range temporarily to check memory
-	 * interleaves with other nodes. We will not use this node
-	 * temp memory range to check overlaps, because it will mask
-	 * the overlaps in same node.
-	 *
-	 * Node with 0 bytes memory doesn't need this expandsion.
-	 */
-	nd_start = start;
-	nd_end = end;
-	nd = &nodes[node];
-	if (nd->start != nd->end) {
-		if (nd_start > nd->start)
-			nd_start = nd->start;
-
-		if (nd_end < nd->end)
-			nd_end = nd->end;
-	}
-
-	/* It is fine to add this area to the nodes data it will be used later*/
-	switch (conflicting_memblks(node, start, end, nd_start, nd_end, &i)) {
-	case OVERLAP:
-		if (memblk_nodeid[i] == node) {
-			bool mismatch = !(ma->flags &
-					  ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
-			                !test_bit(i, memblk_hotplug);
-
-			printk("%sSRAT: PXM %u [%"PRIpaddr", %"PRIpaddr"] overlaps with itself [%"PRIpaddr", %"PRIpaddr"]\n",
-			       mismatch ? KERN_ERR : KERN_WARNING, pxm, start,
-			       end - 1, node_memblk_range[i].start,
-			       node_memblk_range[i].end - 1);
-			if (mismatch) {
-				bad_srat();
-				return;
-			}
-			break;
-		}
-
-		printk(KERN_ERR
-		       "SRAT: PXM %u [%"PRIpaddr", %"PRIpaddr"] overlaps with PXM %u [%"PRIpaddr", %"PRIpaddr"]\n",
-		       pxm, start, end - 1, node_to_pxm(memblk_nodeid[i]),
-		       node_memblk_range[i].start,
-		       node_memblk_range[i].end - 1);
-		bad_srat();
-		return;
-
-	case INTERLEAVE:
-		printk(KERN_ERR
-		       "SRAT： PXM %u: [%"PRIpaddr", %"PRIpaddr"] interleaves with PXM %u memblk [%"PRIpaddr", %"PRIpaddr"]\n",
-		       pxm, nd_start, nd_end - 1, node_to_pxm(memblk_nodeid[i]),
-		       node_memblk_range[i].start, node_memblk_range[i].end - 1);
-		bad_srat();
-		return;
-
-	case NO_CONFLICT:
-		break;
-	}
-
-	if (!(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE)) {
-		node_set(node, memory_nodes_parsed);
-		nd->start = nd_start;
-		nd->end = nd_end;
-	}
-
-	printk(KERN_INFO "SRAT: Node %u PXM %u [%"PRIpaddr", %"PRIpaddr"]%s\n",
-	       node, pxm, start, end - 1,
-	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
-
-	node_memblk_range[num_node_memblks].start = start;
-	node_memblk_range[num_node_memblks].end = end;
-	memblk_nodeid[num_node_memblks] = node;
-	if (ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) {
-		__set_bit(num_node_memblks, memblk_hotplug);
-		if (end > mem_hotplug)
-			mem_hotplug = end;
-	}
-	num_node_memblks++;
-}
-
-/* Sanity check to catch more bad SRATs (they are amazingly common).
-   Make sure the PXMs cover all memory. */
-static int __init nodes_cover_memory(void)
-{
-	unsigned int i;
-
-	for (i = 0; ; i++) {
-		int err;
-		unsigned int j;
-		bool found;
-		paddr_t start, end;
-
-		/* Try to loop memory map from index 0 to end to get RAM ranges. */
-		err = arch_get_ram_range(i, &start, &end);
-
-		/* Reach the end of arch's memory map */
-		if (err == -ENOENT)
-			break;
-
-		/* Index relate entry is not RAM, skip it. */
-		if (err)
-			continue;
-
-		do {
-			found = false;
-			for_each_node_mask(j, memory_nodes_parsed)
-				if (start < nodes[j].end
-				    && end > nodes[j].start) {
-					if (start >= nodes[j].start) {
-						start = nodes[j].end;
-						found = true;
-					}
-					if (end <= nodes[j].end) {
-						end = nodes[j].start;
-						found = true;
-					}
-				}
-		} while (found && start < end);
-
-		if (start < end) {
-			printk(KERN_ERR "NUMA: No NODE for RAM range: "
-				"[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
-			return 0;
-		}
-	}
-	return 1;
+	if (!numa_update_node_memblks(node, pxm, ma->base_address,
+				      ma->length, "PXM",
+				      ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE))
+		numa_fw_bad();
 }
 
 void __init acpi_numa_arch_fixup(void) {}
@@ -525,59 +310,9 @@ void __init srat_parse_regions(paddr_t addr)
 	pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
 }
 
-/* Use the information discovered above to actually set up the nodes. */
-int __init numa_scan_nodes(paddr_t start, paddr_t end)
-{
-	int i;
-	nodemask_t all_nodes_parsed;
-
-	/* First clean up the node list */
-	for (i = 0; i < MAX_NUMNODES; i++)
-		cutoff_node(i, start, end);
-
-	if (acpi_numa <= 0)
-		return -1;
-
-	if (!nodes_cover_memory()) {
-		bad_srat();
-		return -1;
-	}
-
-	memnode_shift = compute_hash_shift(node_memblk_range, num_node_memblks,
-				memblk_nodeid);
-
-	if (memnode_shift < 0) {
-		printk(KERN_ERR
-		     "SRAT: No NUMA node hash function found. Contact maintainer\n");
-		bad_srat();
-		return -1;
-	}
-
-	nodes_or(all_nodes_parsed, memory_nodes_parsed, processor_nodes_parsed);
-
-	/* Finally register nodes */
-	for_each_node_mask(i, all_nodes_parsed)
-	{
-		uint64_t size = nodes[i].end - nodes[i].start;
-
-		if ( size == 0 )
-			printk(KERN_INFO "SRAT: node %u has no memory\n", i);
-
-		setup_node_bootmem(i, nodes[i].start, nodes[i].end);
-	}
-	for (i = 0; i < nr_cpu_ids; i++) {
-		if (cpu_to_node[i] == NUMA_NO_NODE)
-			continue;
-		if (!nodemask_test(cpu_to_node[i], &processor_nodes_parsed))
-			numa_set_node(i, NUMA_NO_NODE);
-	}
-	numa_init_array();
-	return 0;
-}
-
-static unsigned node_to_pxm(nodeid_t n)
+unsigned int numa_node_to_arch_nid(nodeid_t n)
 {
-	unsigned i;
+	unsigned int i;
 
 	if ((n < ARRAY_SIZE(pxm2node)) && (pxm2node[n].node == n))
 		return pxm2node[n].pxm;
@@ -594,8 +329,8 @@ u8 __node_distance(nodeid_t a, nodeid_t b)
 
 	if (!acpi_slit)
 		return a == b ? 10 : 20;
-	index = acpi_slit->locality_count * node_to_pxm(a);
-	slit_val = acpi_slit->entry[index + node_to_pxm(b)];
+	index = acpi_slit->locality_count * numa_node_to_arch_nid(a);
+	slit_val = acpi_slit->entry[index + numa_node_to_arch_nid(b)];
 
 	/* ACPI defines 0xff as an unreachable node and 0-9 are undefined */
 	if ((slit_val == 0xff) || (slit_val <= 9))
diff --git a/xen/common/numa.c b/xen/common/numa.c
index 03e7318d72..da0ff7ae34 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -13,6 +13,21 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 
+static nodemask_t __initdata processor_nodes_parsed;
+static nodemask_t __initdata memory_nodes_parsed;
+static struct node __initdata nodes[MAX_NUMNODES];
+
+static unsigned int __ro_after_init num_node_memblks;
+static struct node __ro_after_init node_memblk_range[NR_NODE_MEMBLKS];
+static nodeid_t __ro_after_init memblk_nodeid[NR_NODE_MEMBLKS];
+static __initdata DECLARE_BITMAP(memblk_hotplug, NR_NODE_MEMBLKS);
+
+enum conflicts {
+    NO_CONFLICT,
+    OVERLAP,
+    INTERLEAVE,
+};
+
 struct node_data __ro_after_init node_data[MAX_NUMNODES];
 
 /* Mapping from pdx to node id */
@@ -33,7 +48,309 @@ bool __read_mostly numa_off;
 
 bool numa_disabled(void)
 {
-    return numa_off || arch_numa_disabled();
+    return numa_off || arch_numa_disabled(false);
+}
+
+void __init numa_set_processor_nodes_parsed(nodeid_t node)
+{
+    node_set(node, processor_nodes_parsed);
+}
+
+bool valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
+{
+    unsigned int i;
+
+    for ( i = 0; i < num_node_memblks; i++ )
+    {
+        struct node *nd = &node_memblk_range[i];
+
+        if ( nd->start <= start && nd->end >= end &&
+             memblk_nodeid[i] == node )
+            return true;
+    }
+
+    return false;
+}
+
+static enum conflicts __init conflicting_memblks(
+    nodeid_t nid, paddr_t start, paddr_t end, paddr_t nd_start,
+    paddr_t nd_end, unsigned int *mblkid)
+{
+    unsigned int i;
+
+    /*
+     * Scan all recorded nodes' memory blocks to check conflicts:
+     * Overlap or interleave.
+     */
+    for ( i = 0; i < num_node_memblks; i++ )
+    {
+        const struct node *nd = &node_memblk_range[i];
+
+        *mblkid = i;
+
+        /* Skip 0 bytes node memory block. */
+        if ( nd->start == nd->end )
+            continue;
+        /*
+         * Use memblk range to check memblk overlaps, include the
+         * self-overlap case. As nd's range is non-empty, the special
+         * case "nd->end == end && nd->start == start" also can be covered.
+         */
+        if ( nd->end > start && nd->start < end )
+            return OVERLAP;
+
+        /*
+         * Use node memory range to check whether new range contains
+         * memory from other nodes - interleave check. We just need
+         * to check full contains situation. Because overlaps have
+         * been checked above.
+         */
+        if ( nid != memblk_nodeid[i] &&
+             nd->start >= nd_start && nd->end <= nd_end )
+            return INTERLEAVE;
+    }
+
+    return NO_CONFLICT;
+}
+
+static void __init cutoff_node(nodeid_t i, paddr_t start, paddr_t end)
+{
+    struct node *nd = &nodes[i];
+
+    if ( nd->start < start )
+    {
+        nd->start = start;
+        if ( nd->end < nd->start )
+            nd->start = nd->end;
+    }
+
+    if ( nd->end > end )
+    {
+        nd->end = end;
+        if ( nd->start > nd->end )
+            nd->start = nd->end;
+    }
+}
+
+bool __init numa_memblks_available(void)
+{
+    return num_node_memblks < NR_NODE_MEMBLKS;
+}
+
+/*
+ * This function will be called by NUMA memory affinity initialization to
+ * update NUMA node's memory range. In this function, we assume all memory
+ * regions belonging to a single node are in one chunk. Holes (or MMIO
+ * ranges) between them will be included in the node.
+ *
+ * So in numa_update_node_memblks, if there are multiple banks for each
+ * node, start and end are stretched to cover the holes between them, and
+ * it works as long as memory banks of different NUMA nodes don't interleave.
+ */
+bool __init numa_update_node_memblks(nodeid_t node, unsigned int arch_nid,
+                                     paddr_t start, paddr_t size,
+                                     const char *prefix,
+                                     bool hotplug)
+{
+    unsigned int i;
+    paddr_t end = start + size;
+    paddr_t nd_start = start;
+    paddr_t nd_end = end;
+    struct node *nd = &nodes[node];
+
+    /*
+     * For the node that already has some memory blocks, we will
+     * expand the node memory range temporarily to check memory
+     * interleaves with other nodes. We will not use this node
+     * temp memory range to check overlaps, because it will mask
+     * the overlaps in same node.
+     *
+     * Node with 0 bytes memory doesn't need this expandsion.
+     */
+    if ( nd->start != nd->end )
+    {
+        if ( nd_start > nd->start )
+            nd_start = nd->start;
+
+        if ( nd_end < nd->end )
+            nd_end = nd->end;
+    }
+
+    /* It is fine to add this area to the nodes data it will be used later */
+    switch ( conflicting_memblks(node, start, end, nd_start, nd_end, &i) )
+    {
+    case OVERLAP:
+        if ( memblk_nodeid[i] == node )
+        {
+            bool mismatch = !(hotplug) != !test_bit(i, memblk_hotplug);
+
+            printk("%sNUMA: %s %u [%"PRIpaddr", %"PRIpaddr"] overlaps with itself [%"PRIpaddr", %"PRIpaddr"]\n",
+                   mismatch ? KERN_ERR : KERN_WARNING, prefix,
+                   arch_nid, start, end - 1,
+                   node_memblk_range[i].start, node_memblk_range[i].end - 1);
+            if ( mismatch )
+                return false;
+            break;
+        }
+
+        printk(KERN_ERR
+               "NUMA: %s %u [%"PRIpaddr", %"PRIpaddr"] overlaps with %s %u [%"PRIpaddr", %"PRIpaddr"]\n",
+               prefix, arch_nid, start, end - 1, prefix,
+               numa_node_to_arch_nid(memblk_nodeid[i]),
+               node_memblk_range[i].start, node_memblk_range[i].end - 1);
+        return false;
+
+
+    case INTERLEAVE:
+        printk(KERN_ERR
+               "NUMA： %s %u: [%"PRIpaddr", %"PRIpaddr"] interleaves with %s %u memblk [%"PRIpaddr", %"PRIpaddr"]\n",
+               prefix, arch_nid, nd_start, nd_end - 1,
+               prefix, numa_node_to_arch_nid(memblk_nodeid[i]),
+               node_memblk_range[i].start, node_memblk_range[i].end - 1);
+        return false;
+
+    case NO_CONFLICT:
+        break;
+    }
+
+    if ( !hotplug )
+    {
+        node_set(node, memory_nodes_parsed);
+        nd->start = nd_start;
+        nd->end = nd_end;
+    }
+
+
+#ifdef CONFIG_HAS_NUMA_NODE_FWID
+    printk(KERN_INFO "NUMA: Node %u %s %u [%"PRIpaddr", %"PRIpaddr"]%s\n",
+           node, prefix, arch_nid, start, end - 1,
+           hotplug ? " (hotplug)" : "");
+#else
+    printk(KERN_INFO "NUMA: Node %u [%"PRIpaddr", %"PRIpaddr"]%s\n",
+           node, start, end - 1, hotplug ? " (hotplug)" : "");
+#endif
+
+    node_memblk_range[num_node_memblks].start = start;
+    node_memblk_range[num_node_memblks].end = end;
+    memblk_nodeid[num_node_memblks] = node;
+    if ( hotplug )
+    {
+        __set_bit(num_node_memblks, memblk_hotplug);
+        if ( end > mem_hotplug )
+            mem_hotplug = end;
+    }
+    num_node_memblks++;
+
+    return true;
+}
+
+/*
+ * Sanity check to catch more bad SRATs (they are amazingly common).
+ * Make sure the PXMs cover all memory.
+ */
+static int __init nodes_cover_memory(void)
+{
+    unsigned int i;
+
+    for ( i = 0; ; i++ )
+    {
+        int err;
+        bool found;
+        unsigned int j;
+        paddr_t start, end;
+
+        /* Try to loop memory map from index 0 to end to get RAM ranges. */
+        err = arch_get_ram_range(i, &start, &end);
+
+        /* Reach the end of arch's memory map */
+        if ( err == -ENOENT )
+            break;
+
+        /* Index relate entry is not RAM, skip it. */
+        if ( err )
+            continue;
+
+        do {
+            found = false;
+            for_each_node_mask( j, memory_nodes_parsed )
+                if ( start < nodes[j].end
+                    && end > nodes[j].start )
+                {
+                    if ( start >= nodes[j].start )
+                    {
+                        start = nodes[j].end;
+                        found = true;
+                    }
+
+                    if ( end <= nodes[j].end )
+                    {
+                        end = nodes[j].start;
+                        found = true;
+                    }
+                }
+        } while ( found && start < end );
+
+        if ( start < end )
+        {
+            printk(KERN_ERR "NUMA: No node for RAM range: "
+                   "[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
+            return 0;
+        }
+    }
+    return 1;
+}
+
+/* Use the information discovered above to actually set up the nodes. */
+static bool __init numa_scan_nodes(paddr_t start, paddr_t end)
+{
+    unsigned int i;
+    nodemask_t all_nodes_parsed;
+
+    /* First clean up the node list */
+    for ( i = 0; i < MAX_NUMNODES; i++ )
+        cutoff_node(i, start, end);
+
+    /* When numa is on with good firmware, we can do numa scan nodes. */
+    if ( arch_numa_disabled(true) )
+        return false;
+
+    if ( !nodes_cover_memory() )
+    {
+        numa_fw_bad();
+        return false;
+    }
+
+    memnode_shift = compute_hash_shift(node_memblk_range, num_node_memblks,
+                                       memblk_nodeid);
+
+    if ( memnode_shift < 0 )
+    {
+        printk(KERN_ERR
+               "NUMA: No NUMA node hash function found. Contact maintainer\n");
+        numa_fw_bad();
+        return false;
+    }
+
+    nodes_or(all_nodes_parsed, memory_nodes_parsed, processor_nodes_parsed);
+
+    /* Finally register nodes */
+    for_each_node_mask( i, all_nodes_parsed )
+    {
+        if ( nodes[i].end - nodes[i].start == 0 )
+            printk(KERN_INFO "NUMA: node %u has no memory\n", i);
+
+        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
+    }
+
+    for ( i = 0; i < nr_cpu_ids; i++ )
+    {
+        if ( cpu_to_node[i] == NUMA_NO_NODE )
+            continue;
+        if ( !nodemask_test(cpu_to_node[i], &processor_nodes_parsed) )
+            numa_set_node(i, NUMA_NO_NODE);
+    }
+    numa_init_array();
+    return true;
 }
 
 /*
@@ -242,7 +559,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
 #endif
 
 #ifdef CONFIG_NUMA
-    if ( !numa_off && !numa_scan_nodes(start, end) )
+    if ( !numa_off && numa_scan_nodes(start, end) )
         return;
 #endif
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index bfd4150be7..39b9653286 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -159,6 +159,8 @@
 #define PGT_TYPE_INFO_INITIALIZER 0
 #endif
 
+paddr_t __read_mostly mem_hotplug;
+
 /*
  * Comma-separated list of hexadecimal page numbers containing bad bytes.
  * e.g. 'badpage=0x3f45,0x8a321'.
diff --git a/xen/drivers/acpi/Kconfig b/xen/drivers/acpi/Kconfig
index e3f3d8f4b1..6f33d1ad57 100644
--- a/xen/drivers/acpi/Kconfig
+++ b/xen/drivers/acpi/Kconfig
@@ -7,4 +7,5 @@ config ACPI_LEGACY_TABLES_LOOKUP
 
 config ACPI_NUMA
 	bool
+	select HAS_NUMA_NODE_FWID
 	select NUMA
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 35b065146f..2bced13c0c 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -148,6 +148,8 @@ int assign_page(
 /* Dump info to serial console */
 void arch_dump_shared_mem_info(void);
 
+extern paddr_t mem_hotplug;
+
 /*
  * Extra fault info types which are used to further describe
  * the source of an access violation.
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 38be7db960..e593115ba2 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -11,6 +11,7 @@
 #define NUMA_NO_DISTANCE 0xFF
 
 #define MAX_NUMNODES    (1 << NODES_SHIFT)
+#define NR_NODE_MEMBLKS (MAX_NUMNODES * 2)
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
 
@@ -42,10 +43,10 @@ extern void numa_add_cpu(unsigned int cpu);
 extern void numa_init_array(void);
 extern void numa_set_node(unsigned int cpu, nodeid_t node);
 extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
-extern int  numa_scan_nodes(paddr_t start, paddr_t end);
+extern void numa_fw_bad(void);
 
 extern int arch_numa_setup(const char *opt);
-extern bool arch_numa_disabled(void);
+extern bool arch_numa_disabled(bool init_as_disable);
 extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 
 static inline void clear_node_cpumask(unsigned int cpu)
@@ -93,6 +94,13 @@ static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
  */
 extern int arch_get_ram_range(unsigned int idx,
                               paddr_t *start, paddr_t *end);
+extern bool valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
+extern bool numa_memblks_available(void);
+extern bool numa_update_node_memblks(nodeid_t node, unsigned int arch_nid,
+                                     paddr_t start, paddr_t size,
+                                     const char *prefix,
+                                     bool hotplug);
+extern void numa_set_processor_nodes_parsed(nodeid_t node);
 
 #endif
 
-- 
2.25.1


