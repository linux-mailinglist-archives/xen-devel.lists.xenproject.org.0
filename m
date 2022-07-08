Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8E556BBF5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 16:55:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363473.594054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pOL-0008N0-UP; Fri, 08 Jul 2022 14:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363473.594054; Fri, 08 Jul 2022 14:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pOL-0008Kh-Qf; Fri, 08 Jul 2022 14:55:37 +0000
Received: by outflank-mailman (input) for mailman id 363473;
 Fri, 08 Jul 2022 14:55:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EO41=XN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o9pOK-0007Ai-Hf
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 14:55:36 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140089.outbound.protection.outlook.com [40.107.14.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0594bba1-fece-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 16:55:35 +0200 (CEST)
Received: from AS9PR06CA0759.eurprd06.prod.outlook.com (2603:10a6:20b:484::13)
 by DB8PR08MB4956.eurprd08.prod.outlook.com (2603:10a6:10:e0::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Fri, 8 Jul
 2022 14:55:29 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:484:cafe::97) by AS9PR06CA0759.outlook.office365.com
 (2603:10a6:20b:484::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 14:55:27 +0000
Received: ("Tessian outbound afad550a20c6:v122");
 Fri, 08 Jul 2022 14:55:27 +0000
Received: from ad85ffab2f30.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DC83907C-7725-441D-8A51-276B809E94B0.1; 
 Fri, 08 Jul 2022 14:55:21 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad85ffab2f30.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jul 2022 14:55:21 +0000
Received: from DB6PR0202CA0043.eurprd02.prod.outlook.com (2603:10a6:4:a5::29)
 by DB8PR08MB4170.eurprd08.prod.outlook.com (2603:10a6:10:a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 14:55:19 +0000
Received: from DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::2) by DB6PR0202CA0043.outlook.office365.com
 (2603:10a6:4:a5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:18 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT058.mail.protection.outlook.com (100.127.142.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 14:55:18 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 8 Jul 2022
 14:55:11 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:08 +0000
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
X-Inumbo-ID: 0594bba1-fece-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bWeQtnwn7vpeYBK9GVTJ5pfyzM2KNiPqjJXFddUeVTs4QS4MXemfL4gH4ONmuKfP0BVQ38mPUqXl7KwEdncpFef5F9MTGLIEn2rq0LQ99vp5hWCDljzZx+DN+gY61S91hilUu6I8jteYGFO8oPNXoNdW6nH+nnVrgeHg/ez4Xg7JWO2LRox0mcs/xpHURGX/Hvxu3Ygk2I2LRu4qCyzec1ZiTKW0iNYVzXvLGyfgHKzkkco4I+r9AlGPY3nvHbrnV+fx21UzcbB4k/HfoiFVA9TrUe69LOP6QnQAV8m2hNJqGJf5GYkkzNB+LZ4sjstZD2O2DgfDREdL7xP/z1EgkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9ZTzLCFsbwcnMhhUkqTjENjME/eU+MsQ1SV7aGwsNU=;
 b=SetGHbioTzqDcKYyNmDgcTJaek88+mTJjjYDMBG/JdpcLDrGPg2XBRIVsXgsjA7eCRve+bfKWuBbRi4o1FoZ5jT9nQk1sVA0uRlEPL203WlpPOtu3GU8uqucxmIlECwHkYxJW62EofqjdLvXTtTUzbTHAdsQj5lU2aeNLM8BP3+vNm7r0lJoW+rmkeO+Kw3lVyFiL8Qr/19wFf/hr064qGejtZ8Wv4PDpl8g7zxVqyXgfEpbl/S0s1wYpRDChKjqj5gUFsSdw5gTtIBZO0DKToG+Kng0ouVijhO1aB1z8EoHwUwEbqPWAo/ovmygvWzb1ilCp4wwhY+lWldVC4YcWw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9ZTzLCFsbwcnMhhUkqTjENjME/eU+MsQ1SV7aGwsNU=;
 b=64/QokKx4zCtG6mPCpg/5Jmq3QyyEV2ffKC1gJIEIwstes/1RPXmmJiPtznFuW+lhe5FxP/V7pePQOVKtY2iw1YW3OPo/4VSx02A4X9isfojQwa2O+zqglMs29LFP4XD2nxFxUqcr+FXRG36j3o6SRNWkaMaIzkcIcLf3T+blRQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 48b2e135b2c418b6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mC5YUSdxGVt+CAPSNB1J/xpfu4uuMgFdkcIudF1egaAqa3Ti2x+aqu1cwgPq1oAxen6KpiJtxntz7aZPII3o+EAYt0gPVPG/AGAgXDjM3D+Fx40Gk5eUk2TVydVCeJEyahVhEvHAEkj5jvXo1R1ApllvAhC3TrLdrBSXZU4Z33AVYHe1PrpqrWtYnb9y3D9f/R+V/htSVzW01p2jrRr27OoSnUtItMCx/D+8nDek+vZCqlK3Em81nZGStozct28Yq7HghkP9fEmLFAs3C3O8lZB/zRNjnWGndUL+wCQyIslIzowuILi/UAXb57c2EPZ558JJxn0Hz+qxIgArUJVBaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9ZTzLCFsbwcnMhhUkqTjENjME/eU+MsQ1SV7aGwsNU=;
 b=kjSzMF7GpcPkwtBF5OLqLwb4TbYyOvLUSjwvV6hzlGvWqvnfkdHlvbysR+g1o3AWESq2Pf6vPBRbsUhwN/KO8ZMNyMawRuYWKEffS4TqS5+wTMK6l52UayEkWBL9yC22w26ZGqUB+KWfyUG413szFTCTl/Z1eWFKxU6B70cMmB9XKMeJg3GR+V409FLqUCiwxNdhmwbYhzbwpCp86xP3ck0vbWDTQqxXfJm174wXmxG9mCPy55tNLM9A810k3VwGSd7C4RI5tiInjq3nwbdx2dT9tvUpLp18wnR6NTpdTmvmK4Ff5SH8/tZnd9EdryVJn9oMjdvebfoBGsY3l61zkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9ZTzLCFsbwcnMhhUkqTjENjME/eU+MsQ1SV7aGwsNU=;
 b=64/QokKx4zCtG6mPCpg/5Jmq3QyyEV2ffKC1gJIEIwstes/1RPXmmJiPtznFuW+lhe5FxP/V7pePQOVKtY2iw1YW3OPo/4VSx02A4X9isfojQwa2O+zqglMs29LFP4XD2nxFxUqcr+FXRG36j3o6SRNWkaMaIzkcIcLf3T+blRQ=
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
Subject: [PATCH v2 5/9] xen/x86: use arch_get_memory_map to get information from E820 map
Date: Fri, 8 Jul 2022 22:54:20 +0800
Message-ID: <20220708145424.1848572-6-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708145424.1848572-1-wei.chen@arm.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 6870b44f-5bf1-47ad-edf3-08da60f1e566
X-MS-TrafficTypeDiagnostic:
	DB8PR08MB4170:EE_|AM5EUR03FT015:EE_|DB8PR08MB4956:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0FdLpdkC/lCco0Buzm0eCtYPSfxKTy4mNh95uHebDev/JH057FQqBG1t0cN2kowQ4fcwD0i3eQynY4d8bGOjWgwaWOMJYaYVHVQZM9oD3ciXg+J7OT661ZGGXD7H5NOpMv5y3kV3D/oA7HG4LurcbSqJjLUjafwvV0bj/fsMCntJrZB8T1nq7yIegnax+KF3FpIQyb++jHB/dvotnLyYqxr9SVU3E1zqh7pnlfvHbzLNWn4YUaQBETHJCzEDet/6qbaHWHGudmjaLopnkUzQLxvSW6yokxuNJKKu2hIJMbpGfqNUkicEjiKwojizMaM54GsO8NbiWyw0gcZyQwG3TpO2fmvfJK8il93eYcAqnmEFqllKOj/m1rn8vUXKatyMe0Oz3Qo5Hej5S7lxme3vfotF/gUuVzdJ5vPQnYD7qzZgPYSotZWId4htUYPvO48ap5YSHdfXB4FmsXv63L6/EmdT4kobl02VpkuLYKaZbblaVymHgfPa/b1o/6bsoOBXkstdUfDLEF/M7Oh/B3jlDCrPnoneUI8cSinAIAu+jaYfDLb32bSvCP9TOIx3+v3XCq4xKmd+rcDZBkS5qi6Vo/ix/6g7Dj6CgaYUPbVtNmRL5KKSA8ZO61CBxLqUY/Y0jyEo6cVqWt0IT+9VzSDlNHdbCT7/btYiwj67CJk8geYyc4DaRgbsALvZjMlCRVt1T94qSCp3frSkoKasZ1z1g5guZDPFWXZTHKzYti23/cnikYyWg14CJAZT+fhirbPD3X43gXxXYyGOVboQjku2rApC/kcr37drYBIxjCenl6XqYVY11H1rCYtgIzrffKE4r/vNrCePO4JZP/YeoUGDqQ63WMO10aUDj+s/UvZdFpg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(136003)(396003)(40470700004)(46966006)(36840700001)(356005)(70586007)(54906003)(8676002)(6916009)(478600001)(36860700001)(81166007)(36756003)(86362001)(316002)(47076005)(336012)(2616005)(26005)(426003)(41300700001)(7696005)(4326008)(186003)(1076003)(6666004)(82310400005)(40480700001)(70206006)(83380400001)(44832011)(5660300002)(8936002)(2906002)(82740400003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4170
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	35509b3b-379b-4cef-b17a-08da60f1e014
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o56Jvfuzhg14kFFTQPv9tnebEy4szIO4OOZUelv4tf/2XBnfAmj/c7a4jWhGA+aLRCGZ7AMZF9XkVBiu28ubhP+zUp6KYKG3LYeBlk4R685WwnOyxsRT90LJSrohmrTPpwq0sj0/bz4yWmpw400xgjPzmfh9KKb4I+jO8dFoT70QJJEz3/RpQVcjqifJaDn1gyg9XFRaa0xxEwx+C+iNZO5JEdg6c6IAAzXWnXBS+7QIhlh81neYpFVYc/7AKkn9VfpfT24pc0rTwJs2psYn9C4NIRMfUrSjivcOByhAVD/mhU598CpadovmnkVArFADEzuhbZbFIfR1Ty+BTPIcdYY6waLWZ1RbhVWdA+UlpurlznYurw9CNuBUKJKf8FR0/emaHzmV630ADvtkI83aFXhWMg+KYTO52aXIqDaOYX/LnPSdIR64FBP6KM6cYxswEB+zLRwI56+ARSgOrCKI9fneUka1gzNkmnVQnrJuKKt2/R2EY0wW0bSRHowJtdAdxWLF+A0+8KinjuKCJ2LD99s66o1JYANPaY7nuFzPGkOl/HoifOVI4oMyfX6Efn9otHUKcq84sA6unDCuY2kwJw3QDV5Bjf/nEQol6W4Qi1zgpmoksvplrXN1ZLxKfzxdrCIlDlDn+1QA3oGkVWFaDrrGSDLBwcORbo3w0gIi8UuxZXGMjVY/oETDDf1UInp/FIIRbR3ZYjrBnsSSKeDlJDL1qR/xX+Oxf1rcbKrMOkeusyOLYN0nNn7ogMtOO4lp87JkRxRy3oN283I3Ebivhn3VDRdIzyEjIYSMzjv68YyB6BCtJErPrK6u86ENe7c8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(39860400002)(46966006)(36840700001)(40470700004)(47076005)(82310400005)(107886003)(2616005)(86362001)(316002)(426003)(1076003)(54906003)(186003)(336012)(6916009)(81166007)(36756003)(36860700001)(70206006)(8676002)(4326008)(70586007)(40460700003)(44832011)(26005)(2906002)(5660300002)(82740400003)(478600001)(8936002)(41300700001)(7696005)(83380400001)(40480700001)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 14:55:27.7834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6870b44f-5bf1-47ad-edf3-08da60f1e566
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4956

The sanity check performed by the nodes_cover_memory function is
also necessary for other architectures that do not yet support NUMA.
But now, the code of nodes_cover_memory is tied to the x86 E820.
In this case, we introduce arch_get_memory_map to decouple
architecture specific memory map from this function. This means,
other architectures like Arm can also use it to check its bootmem
info.

Depending on arch_get_memory_map, we make nodes_cover_memory become
architecture independent. We also use neutral words to replace
SRAT and E820 in the print message of this function. This will
make the message more common.

As arch_get_memory_map use unsigned int for index, we also adjust
the index in nodes_cover_memory from int to unsigned int.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Use arch_get_memory_map to replace arch_get_memory_bank_range
   and arch_get_memory_bank_number.
2. Remove the !start || !end check, because caller guarantee
   these two pointers will not be NULL.
---
 xen/arch/x86/numa.c    | 23 +++++++++++++++++++++++
 xen/arch/x86/srat.c    | 18 +++++++++++-------
 xen/include/xen/numa.h |  3 +++
 3 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 193314dbd9..fb235c07ec 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -9,6 +9,7 @@
 #include <xen/nodemask.h>
 #include <xen/numa.h>
 #include <asm/acpi.h>
+#include <asm/e820.h>
 
 #ifndef Dprintk
 #define Dprintk(x...)
@@ -82,3 +83,25 @@ unsigned int __init arch_get_dma_bitsize(void)
                  flsl(node_start_pfn(node) + node_spanned_pages(node) / 4 - 1)
                  + PAGE_SHIFT, 32);
 }
+
+/*
+ * This function provides the ability for caller to get one RAM entry
+ * from architectural memory map by index.
+ *
+ * This function will return zero if it can return a proper RAM entry.
+ * otherwise it will return -ENODEV for out of scope index, or return
+ * -EINVAL for non-RAM type memory entry.
+ */
+int __init arch_get_memory_map(unsigned int idx, paddr_t *start, paddr_t *end)
+{
+    if ( idx >= e820.nr_map )
+        return -ENODEV;
+
+    if ( e820.map[idx].type != E820_RAM )
+        return -EINVAL;
+
+    *start = e820.map[idx].addr;
+    *end = e820.map[idx].addr + e820.map[idx].size;
+
+    return 0;
+}
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 422e4c73e3..5bc9096a15 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -427,18 +427,22 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
    Make sure the PXMs cover all memory. */
 static int __init nodes_cover_memory(void)
 {
-	int i;
+	unsigned int i;
 
-	for (i = 0; i < e820.nr_map; i++) {
+	for (i = 0; ; i++) {
 		int j, found;
 		paddr_t start, end;
 
-		if (e820.map[i].type != E820_RAM) {
+		/* Try to loop memory map from index 0 to end. */
+		found = arch_get_memory_map(i, &start, &end);
+
+		/* Index relate entry is not RAM, skip it. */
+		if (found == -EINVAL)
 			continue;
-		}
 
-		start = e820.map[i].addr;
-		end = e820.map[i].addr + e820.map[i].size;
+		/* Reach the end of arch's memory map */
+		if (found == -ENODEV)
+			break;
 
 		do {
 			found = 0;
@@ -457,7 +461,7 @@ static int __init nodes_cover_memory(void)
 		} while (found && start < end);
 
 		if (start < end) {
-			printk(KERN_ERR "SRAT: No PXM for e820 range: "
+			printk(KERN_ERR "NUMA: No node for memory map range: "
 				"[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
 			return 0;
 		}
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 695ad51df0..6d02204991 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -88,6 +88,9 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
                                 NODE_DATA(nid)->node_spanned_pages)
 
+extern int arch_get_memory_map(unsigned int idx,
+                               paddr_t *start, paddr_t *end);
+
 #endif
 
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


