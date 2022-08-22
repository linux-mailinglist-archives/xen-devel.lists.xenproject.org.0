Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 161CA59B7D1
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 05:00:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391098.628804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPxf8-0005Xo-FB; Mon, 22 Aug 2022 02:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391098.628804; Mon, 22 Aug 2022 02:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPxf8-0005Uq-B4; Mon, 22 Aug 2022 02:59:38 +0000
Received: by outflank-mailman (input) for mailman id 391098;
 Mon, 22 Aug 2022 02:59:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t9b2=Y2=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oPxf6-0005FA-5W
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 02:59:36 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130045.outbound.protection.outlook.com [40.107.13.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73174d9b-21c6-11ed-bd2e-47488cf2e6aa;
 Mon, 22 Aug 2022 04:59:33 +0200 (CEST)
Received: from AS8PR04CA0121.eurprd04.prod.outlook.com (2603:10a6:20b:127::6)
 by AS8PR08MB6632.eurprd08.prod.outlook.com (2603:10a6:20b:31c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Mon, 22 Aug
 2022 02:59:31 +0000
Received: from AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::60) by AS8PR04CA0121.outlook.office365.com
 (2603:10a6:20b:127::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19 via Frontend
 Transport; Mon, 22 Aug 2022 02:59:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT058.mail.protection.outlook.com (100.127.140.247) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 02:59:30 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Mon, 22 Aug 2022 02:59:30 +0000
Received: from a23310b7b957.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AD78A4DD-EE1C-4475-8606-A961A815C8A7.1; 
 Mon, 22 Aug 2022 02:59:23 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a23310b7b957.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Aug 2022 02:59:23 +0000
Received: from AS9PR04CA0162.eurprd04.prod.outlook.com (2603:10a6:20b:530::22)
 by AM8PR08MB5587.eurprd08.prod.outlook.com (2603:10a6:20b:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Mon, 22 Aug
 2022 02:59:21 +0000
Received: from AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:530::4) by AS9PR04CA0162.outlook.office365.com
 (2603:10a6:20b:530::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22 via Frontend
 Transport; Mon, 22 Aug 2022 02:59:21 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT057.mail.protection.outlook.com (100.127.140.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 02:59:20 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.9; Mon, 22 Aug
 2022 02:59:18 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.9; Mon, 22
 Aug 2022 02:59:16 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Mon, 22 Aug 2022 02:59:13 +0000
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
X-Inumbo-ID: 73174d9b-21c6-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WJtkcvjYQKUW3sgVS1cJKXNWBb8GQkPNU1npATDqkI6tIqM0Nfm7K9S2jot9INRy5vQXhFvw12IGj0bY17tSxFmL7UivdhRb6YxqaUdL+Bkn/49n/Tr69CYJD5WOMb4SxKt49V4aDrGSvFitMl8AyP1psaEVus5pW8zE1/QtzZd6QoCJeZgr1xPZEStv0mFMLxlPUsRMSXw9SHVkt2JR2oMATPC9bd+ktwwZ7zUiIvf++j+ddOVtxfcYRbq7gVDL8rD/7GIsXzx7Y4/NNCk6YestV7DHX/TVVYFeLf8kdcEBPgjpExZkuGCXj3jNEVY9hcar5uxTdUH0hYTM6kVvCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wM+YrkpSRguyVUUYGUbn2ZtGMpJm+jBJSYhlQlDiMsY=;
 b=SAf2rsC5Oxa7c48zfWUdzcam1kp+nOlZ+8HnnDVB0ZAFXe3I2Dey5/LdNzZiloOqd8I8HbiQ3Aba85CfCze1B8RmKlD9/jVvo0KHmOzOJUUh0BYh52jSvyk4CHHlWjgoYtirEKWwKQtHsvb2giwVFGb9VFsKJUoc8bmdn0UiOQbHg8tSq+MNSBXGZRutkKuVS480ak7civGHnRa+B3CTamBYS9lEo2Ftn//jz3LaG3nhSBCVH2Rytsd6MNRpD3p401MNZY3eLNUBZ19OqFRMsI5wfdTi35C/8/L0ffnoShMl4bYuUf3Y4ruDIEB5cSFRDa+1NfALo6AxVupIcXz5oA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wM+YrkpSRguyVUUYGUbn2ZtGMpJm+jBJSYhlQlDiMsY=;
 b=qysYybDhWrIxR9z1a3KKWCovSMuQD4wUWicvPNEQmDr/MQ0ogH+Iplb9WvDwQnxqPD17p8NVDGD5iHAQHXxfEtMNUiSYNAt+sTxhSSpGzoI1GBSF9tMWiQqZW8f3P/8Gwv5B6krlg37uIhtsNS64ulS4dF/FXzpajyTXO98eJdI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d836e03677c60b86
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kj/QICaCOePSJopSb7KOequCeCEGp2aopitLgramMH3pzh9pBOAcC7O1A5QOBitO+BDgAGvOfjX3O4m7V2D0HsEla4ekpyBGqOeNUnBaA3Hbdh7W5H8ngsHnrmxHMibIBQVbUjBCvt6IocazoCqzEQLy2DwLWAMzONP0QqgXN2KRJDt0JmSqDtZfMFrv440SniiaZ0iAeBqPYmA9FeAC0xrfORHkn3m7G6My9E6l/TJWRsNrtUbaYYd909mBMhEF8PSXIlAvtE+bTIyGRQXi2N9H7HKBkyrWttJkhGqwgPTL4iLG/RobpSAYlHHnnElK5/RNSGuSoyfRwMG8wwsnWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wM+YrkpSRguyVUUYGUbn2ZtGMpJm+jBJSYhlQlDiMsY=;
 b=N7SZpAd5Ij6PuFbu7iSwbFRSH4OmbhX9Yd57vlufF4qRaohWRvyfpV5W32jPfun2FadP9J6tJrL3hnRTuIRJblVDEgibZehK3gctyC1Y5dzaCQ2aHsx8TWW4ny9r1X377Kc7WTmjD+pao+LgyLb6WT9PUuH4YMaicJHI+/Mieex2js3BnBHcV0h4Pg6hVwoYbAXNSOXEO6M6vk2LosTGueEbcq8tvo/QEOJQaH9wZmv4BMk/VxVpsk3AHQQEb/xM3lJHdQ/eIKD639ukhUOEMQJ7NPo9Qx0aGYpphox2+MSeCCcxpV+q9nYB6cCFqMzacKXyR8rmfkXMxHLQzuEoDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wM+YrkpSRguyVUUYGUbn2ZtGMpJm+jBJSYhlQlDiMsY=;
 b=qysYybDhWrIxR9z1a3KKWCovSMuQD4wUWicvPNEQmDr/MQ0ogH+Iplb9WvDwQnxqPD17p8NVDGD5iHAQHXxfEtMNUiSYNAt+sTxhSSpGzoI1GBSF9tMWiQqZW8f3P/8Gwv5B6krlg37uIhtsNS64ulS4dF/FXzpajyTXO98eJdI=
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
Subject: [PATCH v3 2/6] xen/x86: move generically usable NUMA code from x86 to common
Date: Mon, 22 Aug 2022 10:58:06 +0800
Message-ID: <20220822025810.2240707-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822025810.2240707-1-wei.chen@arm.com>
References: <20220822025810.2240707-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 3a3e176d-67f9-4643-c092-08da83ea5593
X-MS-TrafficTypeDiagnostic:
	AM8PR08MB5587:EE_|AM7EUR03FT058:EE_|AS8PR08MB6632:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zHOfs1eTBK/HfoDPe1HmDhO45vW4ifZ8Z7vEUEYRvLNyriY2ub6hHjvCAswClqpeP6Ty019m41L0Fq2GStt5v+WX1Ilpfz/EYayZpCm99VqIZoRFc2WlXcodkN+G6oy7XpF6OWS3dYtAc5Ko+qFmGCWFsBMye+iSei3rUHLYyqDR9H+DTA1sgSbAfDa6WtMsdSlsHustt/mXkoil1XM8xPHmtw/ZpZyn3LHTEHMuFUvbp3HNtTKlJq3otQNWgvFNKNJILQuu9hoCg+vCP7TIiWSHbE0s0V887TMRRoAXH2qxJfb7tKVJ2uEvE1gHJGWFxxEjt8vV+phqyF3cSTCOZjiaZHPZvDWw7x/XWt+eSUQNE0wFbOGkraQd0ZcJYzVq5OMZ3cm7E/P+aNXkFaasJ7UjpA3DKOSHe9JWuLZtz8GvAD5ApUl2fhG8KF9ZHm80q3SxeWYOSKYZFhDgUVfyXa8/LkwOVN4mP5TcihXkm1IofSVc/lu24B4CyIOYcjp1ISyfbbiU9dAWu+hDM7hinwiajzJtB1ZK0nrrc5jyg4EdH/7TQe/x2kvsrMh7h39mWZ+RPoUn+Kh30V3i9ZsgaJozHwGK0LSanpf3/SN9J6N4KeIz4qiWQWIaGsWQsluRco5pLzUJtEh9IOhbNIjGQdVHJolGPz6ezV3dzkVKGY0HNIwNvbvPNUVOOUqXMyC4vBOnDQtWYbmMRlYXMnFUHZA30NI0+hF5HXthQ1rU9BPz6ePylY4RAeEqgiXWvQZzOQ7KtOXv+ccG+xiABamtkoT7eOxRrQnVIupBA16VxLMwxK4C15j83stKpR2hfreoqgBvOk10zgMAmpUjEO6OSQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39850400004)(376002)(136003)(40470700004)(36840700001)(46966006)(41300700001)(44832011)(30864003)(5660300002)(8936002)(40460700003)(316002)(70206006)(478600001)(70586007)(336012)(40480700001)(8676002)(36860700001)(26005)(426003)(47076005)(186003)(2616005)(86362001)(4326008)(1076003)(83380400001)(81166007)(356005)(6666004)(7696005)(82310400005)(82740400003)(2906002)(6916009)(36756003)(54906003)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5587
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9def69fe-b986-40d8-f4ab-08da83ea4f9f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BWKev+jjhuaMGHaUrPPy74tO+8+PquhNTkNU7I3aVCYIYNnv34aERmdQMXBuYk7AiKZg8sfUdoGZhYTfvRIkJYoi3J8KX3IxHB+PxQi/qBJAxs1YdeD+iFPgcUd9cjoXugfNm43N9GBLDUahhcTtcJNvFmCFEstYeFIr4vq9iimYzoQve9xgxLKN2eHO2KnU3Cxx71Oo0izXpPbNQzSGYEEkLBn1bkiNHRNu+zV/Xgm25uR2BhFQJ7ejT05jvZqlbncYy3bx77yM4CD1B1QhBVCmtVoXLgGmXk2XAVt2oGoCXhOvJqLP9H4p+DaUnSS7/KqVvBtz6AUV2jTnV4fzzXD1PqzvpLy/tU5YtbjdhcIpFBVYAZ3z1Ilap+5m27zgstUsKItA8b1FfLgowqqMR04W6UeTRI4v9M48d+RkjBmveEnVdplJ/1Fk6sWIgUdrYgb/pryKDTD928ZdGy+IcZVsCsEtpocW219Io2kZHaCD0ff3qGJii+S9f4UJMCdrPoYI+btFlsTpyfZs9yO8C+1f227Ua02lKCkteWFHINjuaW6JO4pOZPKcE1CdX+1U3cSlAVdYpC4e4VB8uts9kL64P3MQSiNKX4zhNIkopR28bG1ypWdH1T+hAVbLZ2owqKPn5oHcvCrmvr6OWZQdJLc0Zu6VOu3o9f837xeTQV8026d3i2yfUKaRaY8FLfO6Afy8VKS3/nGWbhh/9My5V8rMHTAD8mFPwjJLKhonfVl+2XE33adqYoBVHk6xRpX85WLYCM6mCW1kw5ACseBRdw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(39850400004)(346002)(46966006)(36840700001)(6666004)(336012)(426003)(47076005)(86362001)(7696005)(2616005)(1076003)(2906002)(83380400001)(107886003)(36756003)(186003)(81166007)(82740400003)(36860700001)(6916009)(82310400005)(54906003)(316002)(44832011)(30864003)(5660300002)(4326008)(478600001)(8676002)(70586007)(70206006)(8936002)(26005)(40480700001)(41300700001)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 02:59:30.6897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3e176d-67f9-4643-c092-08da83ea5593
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6632

There are some codes in x86/numa.c can be shared by common
architectures to implememnt NUMA support. Just like some
variables and functions to check and store NUMA memory map.
And some variables and functions to do NUMA initialization.

In this patch, we move them to common/numa.c and xen/numa.h
and use the CONFIG_NUMA to gate them for non-NUMA supported
architectures. As the target header file is Xen-style, so
we trim some spaces and replace tabs for the codes that has
been moved to xen/numa.h at the same time.

As acpi_scan_nodes has been used in a common function, it
doesn't make sense to use acpi_xxx in common code, so we
rename it to numa_scan_nodes in this patch too. After that
if we still use CONFIG_ACPI_NUMA in to gate numa_scan_nodes
in numa_initmem_init, that doesn't make sense. As CONFIG_NUMA
will be selected by CONFIG_ACPI_NUMA for x86. So, we replace
CONFIG_ACPI_NUMA by CONFIG_NUMA to gate numa_scan_nodes.

As arch_numa_disabled has been implememnted for ACPI NUMA,
we can rename srat_disabled to numa_disabled and move it
to common code as well.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v2 -> v3:
 1. Remove acpi.h from common/numa.c.
 2. Rename acpi_scan_nodes to numa_scan_nodes.
 3. Replace u8 by uint8_t for memnodemap.
 4. Use unsigned int for memnode_shift and adjust related functions
    (compute_hash_shift, populate_memnodemap) to use correct types for
    return values or parameters.
 5. Use nodeid_t for nodeid and node numbers.
 6. Use __read_mostly and __ro_after_init for appropriate variables.
 7. Adjust the __read_mostly and __initdata location for some variables.
 8. convert from plain int to unsigned for cpuid and other proper variables.
 9. Use __attribute_pure__ instead of __attribute__((pure)).
10. Replace CONFIG_ACPI_NUMA by CONFIG_NUMA in numa_initmem_init.
11. Add const for some functions' parameters.
12. Move srat_disabled to common code with new name numa_disabled.
13. Fix some spaces code-style for numa_emulation.
14. Change from int to unsigned int for numa_fake.
v1 -> v2:
1. New patch in v2.
---
 xen/arch/x86/include/asm/acpi.h  |   1 -
 xen/arch/x86/include/asm/numa.h  |  57 +---
 xen/arch/x86/include/asm/setup.h |   1 -
 xen/arch/x86/numa.c              | 430 +-----------------------------
 xen/arch/x86/smpboot.c           |   2 +-
 xen/arch/x86/srat.c              |   8 +-
 xen/common/Makefile              |   1 +
 xen/common/numa.c                | 440 +++++++++++++++++++++++++++++++
 xen/include/xen/numa.h           |  66 +++++
 9 files changed, 514 insertions(+), 492 deletions(-)
 create mode 100644 xen/common/numa.c

diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 9a9cc4c240..5c2dd5da2d 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -102,7 +102,6 @@ extern unsigned long acpi_wakeup_address;
 #define ARCH_HAS_POWER_INIT	1
 
 extern s8 acpi_numa;
-extern int acpi_scan_nodes(u64 start, u64 end);
 #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
 
 extern struct acpi_sleep_info acpi_sinfo;
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index f41fe20f9b..6c87942d43 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -9,72 +9,17 @@ typedef u8 nodeid_t;
 
 extern int srat_rev;
 
-extern nodeid_t      cpu_to_node[NR_CPUS];
-extern cpumask_t     node_to_cpumask[];
-
-#define cpu_to_node(cpu)		(cpu_to_node[cpu])
-#define parent_node(node)		(node)
-#define node_to_first_cpu(node)  (__ffs(node_to_cpumask[node]))
-#define node_to_cpumask(node)    (node_to_cpumask[node])
-
-struct node { 
-	paddr_t start, end;
-};
-
-extern int compute_hash_shift(struct node *nodes, int numnodes,
-			      nodeid_t *nodeids);
 extern nodeid_t pxm_to_node(unsigned int pxm);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
-#define VIRTUAL_BUG_ON(x) 
 
-extern void numa_add_cpu(int cpu);
-extern void numa_init_array(void);
-extern bool numa_off;
-
-extern int arch_numa_setup(const char *opt);
-extern bool arch_numa_disabled(bool init_as_disable);
-extern bool srat_disabled(void);
-extern void numa_set_node(int cpu, nodeid_t node);
+extern bool numa_disabled(void);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
 
-extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 extern nodeid_t apicid_to_node[];
 extern void init_cpu_to_node(void);
 
-static inline void clear_node_cpumask(int cpu)
-{
-	cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
-}
-
-/* Simple perfect hash to map pdx to node numbers */
-extern int memnode_shift; 
-extern unsigned long memnodemapsize;
-extern u8 *memnodemap;
-
-struct node_data {
-    unsigned long node_start_pfn;
-    unsigned long node_spanned_pages;
-};
-
-extern struct node_data node_data[];
-
-static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
-{ 
-	nodeid_t nid;
-	VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
-	nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift]; 
-	VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]); 
-	return nid; 
-} 
-
-#define NODE_DATA(nid)		(&(node_data[nid]))
-
-#define node_start_pfn(nid)	(NODE_DATA(nid)->node_start_pfn)
-#define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
-#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
-				 NODE_DATA(nid)->node_spanned_pages)
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
 extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 21037b7f31..ae470ea12f 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -20,7 +20,6 @@ void early_time_init(void);
 
 void set_nr_cpu_ids(unsigned int max_cpus);
 
-void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
 void arch_init_memory(void);
 void subarch_init_memory(void);
 
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 3d3081c967..9a9090e99a 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -4,20 +4,11 @@
  * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
  */ 
 
-#include <xen/mm.h>
-#include <xen/string.h>
 #include <xen/init.h>
-#include <xen/ctype.h>
+#include <xen/mm.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
-#include <xen/keyhandler.h>
-#include <xen/param.h>
-#include <xen/time.h>
-#include <xen/smp.h>
-#include <xen/pfn.h>
 #include <asm/acpi.h>
-#include <xen/sched.h>
-#include <xen/softirq.h>
 
 #ifndef Dprintk
 #define Dprintk(x...)
@@ -26,28 +17,13 @@
 /* from proto.h */
 #define round_up(x,y) ((((x)+(y))-1) & (~((y)-1)))
 
-struct node_data node_data[MAX_NUMNODES];
-
-/* Mapping from pdx to node id */
-int memnode_shift;
-static typeof(*memnodemap) _memnodemap[64];
-unsigned long memnodemapsize;
-u8 *memnodemap;
-
-nodeid_t cpu_to_node[NR_CPUS] __read_mostly = {
-    [0 ... NR_CPUS-1] = NUMA_NO_NODE
-};
 /*
  * Keep BIOS's CPU2node information, should not be used for memory allocaion
  */
 nodeid_t apicid_to_node[MAX_LOCAL_APIC] = {
     [0 ... MAX_LOCAL_APIC-1] = NUMA_NO_NODE
 };
-cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;
 
-nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
-
-bool numa_off;
 s8 acpi_numa = 0;
 
 int __init arch_numa_setup(const char *opt)
@@ -72,267 +48,6 @@ bool arch_numa_disabled(bool init_as_disable)
     return acpi_numa <= 0;
 }
 
-bool srat_disabled(void)
-{
-    return numa_off || arch_numa_disabled(false);
-}
-
-/*
- * Given a shift value, try to populate memnodemap[]
- * Returns :
- * 1 if OK
- * 0 if memnodmap[] too small (of shift too small)
- * -1 if node overlap or lost ram (shift too big)
- */
-static int __init populate_memnodemap(const struct node *nodes,
-                                      int numnodes, int shift, nodeid_t *nodeids)
-{
-    unsigned long spdx, epdx;
-    int i, res = -1;
-
-    memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
-    for ( i = 0; i < numnodes; i++ )
-    {
-        spdx = paddr_to_pdx(nodes[i].start);
-        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
-        if ( spdx >= epdx )
-            continue;
-        if ( (epdx >> shift) >= memnodemapsize )
-            return 0;
-        do {
-            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE )
-                return -1;
-
-            if ( !nodeids )
-                memnodemap[spdx >> shift] = i;
-            else
-                memnodemap[spdx >> shift] = nodeids[i];
-
-            spdx += (1UL << shift);
-        } while ( spdx < epdx );
-        res = 1;
-    }
-
-    return res;
-}
-
-static int __init allocate_cachealigned_memnodemap(void)
-{
-    unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
-    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
-
-    memnodemap = mfn_to_virt(mfn);
-    mfn <<= PAGE_SHIFT;
-    size <<= PAGE_SHIFT;
-    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
-           mfn, mfn + size);
-    memnodemapsize = size / sizeof(*memnodemap);
-
-    return 0;
-}
-
-/*
- * The LSB of all start and end addresses in the node map is the value of the
- * maximum possible shift.
- */
-static int __init extract_lsb_from_nodes(const struct node *nodes,
-                                         int numnodes)
-{
-    int i, nodes_used = 0;
-    unsigned long spdx, epdx;
-    unsigned long bitfield = 0, memtop = 0;
-
-    for ( i = 0; i < numnodes; i++ )
-    {
-        spdx = paddr_to_pdx(nodes[i].start);
-        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
-        if ( spdx >= epdx )
-            continue;
-        bitfield |= spdx;
-        nodes_used++;
-        if ( epdx > memtop )
-            memtop = epdx;
-    }
-    if ( nodes_used <= 1 )
-        i = BITS_PER_LONG - 1;
-    else
-        i = find_first_bit(&bitfield, sizeof(unsigned long)*8);
-    memnodemapsize = (memtop >> i) + 1;
-    return i;
-}
-
-int __init compute_hash_shift(struct node *nodes, int numnodes,
-                              nodeid_t *nodeids)
-{
-    int shift;
-
-    shift = extract_lsb_from_nodes(nodes, numnodes);
-    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
-        memnodemap = _memnodemap;
-    else if ( allocate_cachealigned_memnodemap() )
-        return -1;
-    printk(KERN_DEBUG "NUMA: Using %d for the hash shift.\n", shift);
-
-    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
-    {
-        printk(KERN_INFO "Your memory is not aligned you need to "
-               "rebuild your hypervisor with a bigger NODEMAPSIZE "
-               "shift=%d\n", shift);
-        return -1;
-    }
-
-    return shift;
-}
-/* initialize NODE_DATA given nodeid and start/end */
-void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
-{
-    unsigned long start_pfn = paddr_to_pfn(start);
-    unsigned long end_pfn = paddr_to_pfn(end);
-
-    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
-    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
-
-    node_set_online(nodeid);
-} 
-
-void __init numa_init_array(void)
-{
-    int rr, i;
-
-    /* There are unfortunately some poorly designed mainboards around
-       that only connect memory to a single CPU. This breaks the 1:1 cpu->node
-       mapping. To avoid this fill in the mapping for all possible
-       CPUs, as the number of CPUs is not known yet.
-       We round robin the existing nodes. */
-    rr = first_node(node_online_map);
-    for ( i = 0; i < nr_cpu_ids; i++ )
-    {
-        if ( cpu_to_node[i] != NUMA_NO_NODE )
-            continue;
-        numa_set_node(i, rr);
-        rr = cycle_node(rr, node_online_map);
-    }
-}
-
-#ifdef CONFIG_NUMA_EMU
-static int numa_fake __initdata = 0;
-
-/* Numa emulation */
-static int __init numa_emulation(unsigned long start_pfn,
-                                 unsigned long end_pfn)
-{
-    int i;
-    struct node nodes[MAX_NUMNODES];
-    uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
-
-    /* Kludge needed for the hash function */
-    if ( hweight64(sz) > 1 )
-    {
-        u64 x = 1;
-        while ( (x << 1) < sz )
-            x <<= 1;
-        if ( x < sz/2 )
-            printk(KERN_ERR "Numa emulation unbalanced. Complain to maintainer\n");
-        sz = x;
-    }
-
-    memset(&nodes,0,sizeof(nodes));
-    for ( i = 0; i < numa_fake; i++ )
-    {
-        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
-        if ( i == numa_fake - 1 )
-            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
-        nodes[i].end = nodes[i].start + sz;
-        printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
-               i,
-               nodes[i].start, nodes[i].end,
-               (nodes[i].end - nodes[i].start) >> 20);
-        node_set_online(i);
-    }
-    memnode_shift = compute_hash_shift(nodes, numa_fake, NULL);
-    if ( memnode_shift < 0 )
-    {
-        memnode_shift = 0;
-        printk(KERN_ERR "No NUMA hash function found. Emulation disabled.\n");
-        return -1;
-    }
-    for_each_online_node ( i )
-        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
-    numa_init_array();
-
-    return 0;
-}
-#endif
-
-void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
-{ 
-    int i;
-    paddr_t start = pfn_to_paddr(start_pfn);
-    paddr_t end = pfn_to_paddr(end_pfn);
-
-#ifdef CONFIG_NUMA_EMU
-    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
-        return;
-#endif
-
-#ifdef CONFIG_ACPI_NUMA
-    if ( !numa_off && !acpi_scan_nodes(start, end) )
-        return;
-#endif
-
-    printk(KERN_INFO "%s\n",
-           numa_off ? "NUMA turned off" : "No NUMA configuration found");
-
-    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
-           start, end);
-    /* setup dummy node covering all memory */
-    memnode_shift = BITS_PER_LONG - 1;
-    memnodemap = _memnodemap;
-    /* Dummy node only uses 1 slot in reality */
-    memnodemap[0] = 0;
-    memnodemapsize = 1;
-
-    nodes_clear(node_online_map);
-    node_set_online(0);
-    for ( i = 0; i < nr_cpu_ids; i++ )
-        numa_set_node(i, 0);
-    cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
-    setup_node_bootmem(0, start, end);
-}
-
-void numa_add_cpu(int cpu)
-{
-    cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
-} 
-
-void numa_set_node(int cpu, nodeid_t node)
-{
-    cpu_to_node[cpu] = node;
-}
-
-/* [numa=off] */
-static int __init cf_check numa_setup(const char *opt)
-{
-    if ( !strncmp(opt, "off", 3) )
-        numa_off = true;
-    else if ( !strncmp(opt, "on", 2) )
-        numa_off = false;
-#ifdef CONFIG_NUMA_EMU
-    else if ( !strncmp(opt, "fake=", 5) )
-    {
-        numa_off = false;
-        numa_fake = simple_strtoul(opt + 5, NULL, 0);
-        if ( numa_fake >= MAX_NUMNODES )
-            numa_fake = MAX_NUMNODES;
-    }
-#endif
-    else
-        return arch_numa_setup(opt);
-
-    return 0;
-} 
-custom_param("numa", numa_setup);
-
 /*
  * Setup early cpu_to_node.
  *
@@ -381,146 +96,3 @@ unsigned int __init arch_get_dma_bitsize(void)
                  flsl(node_start_pfn(node) + node_spanned_pages(node) / 4 - 1)
                  + PAGE_SHIFT, 32);
 }
-
-static void cf_check dump_numa(unsigned char key)
-{
-    s_time_t now = NOW();
-    unsigned int i, j, n;
-    struct domain *d;
-    struct page_info *page;
-    unsigned int page_num_node[MAX_NUMNODES];
-    const struct vnuma_info *vnuma;
-
-    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
-           now);
-
-    for_each_online_node ( i )
-    {
-        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
-
-        printk("NODE%u start->%lu size->%lu free->%lu\n",
-               i, node_start_pfn(i), node_spanned_pages(i),
-               avail_node_heap_pages(i));
-        /* sanity check phys_to_nid() */
-        if ( phys_to_nid(pa) != i )
-            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
-                   pa, phys_to_nid(pa), i);
-    }
-
-    j = cpumask_first(&cpu_online_map);
-    n = 0;
-    for_each_online_cpu ( i )
-    {
-        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
-        {
-            if ( n > 1 )
-                printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
-            else
-                printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
-            j = i;
-            n = 1;
-        }
-        else
-            ++n;
-    }
-    if ( n > 1 )
-        printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
-    else
-        printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
-
-    rcu_read_lock(&domlist_read_lock);
-
-    printk("Memory location of each domain:\n");
-    for_each_domain ( d )
-    {
-        process_pending_softirqs();
-
-        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));
-
-        for_each_online_node ( i )
-            page_num_node[i] = 0;
-
-        spin_lock(&d->page_alloc_lock);
-        page_list_for_each(page, &d->page_list)
-        {
-            i = phys_to_nid(page_to_maddr(page));
-            page_num_node[i]++;
-        }
-        spin_unlock(&d->page_alloc_lock);
-
-        for_each_online_node ( i )
-            printk("    Node %u: %u\n", i, page_num_node[i]);
-
-        if ( !read_trylock(&d->vnuma_rwlock) )
-            continue;
-
-        if ( !d->vnuma )
-        {
-            read_unlock(&d->vnuma_rwlock);
-            continue;
-        }
-
-        vnuma = d->vnuma;
-        printk("     %u vnodes, %u vcpus, guest physical layout:\n",
-               vnuma->nr_vnodes, d->max_vcpus);
-        for ( i = 0; i < vnuma->nr_vnodes; i++ )
-        {
-            unsigned int start_cpu = ~0U;
-
-            if ( vnuma->vnode_to_pnode[i] == NUMA_NO_NODE )
-                printk("       %3u: pnode ???,", i);
-            else
-                printk("       %3u: pnode %3u,", i, vnuma->vnode_to_pnode[i]);
-
-            printk(" vcpus ");
-
-            for ( j = 0; j < d->max_vcpus; j++ )
-            {
-                if ( !(j & 0x3f) )
-                    process_pending_softirqs();
-
-                if ( vnuma->vcpu_to_vnode[j] == i )
-                {
-                    if ( start_cpu == ~0U )
-                    {
-                        printk("%d", j);
-                        start_cpu = j;
-                    }
-                }
-                else if ( start_cpu != ~0U )
-                {
-                    if ( j - 1 != start_cpu )
-                        printk("-%d ", j - 1);
-                    else
-                        printk(" ");
-                    start_cpu = ~0U;
-                }
-            }
-
-            if ( start_cpu != ~0U  && start_cpu != j - 1 )
-                printk("-%d", j - 1);
-
-            printk("\n");
-
-            for ( j = 0; j < vnuma->nr_vmemranges; j++ )
-            {
-                if ( vnuma->vmemrange[j].nid == i )
-                    printk("           %016"PRIx64" - %016"PRIx64"\n",
-                           vnuma->vmemrange[j].start,
-                           vnuma->vmemrange[j].end);
-            }
-        }
-
-        read_unlock(&d->vnuma_rwlock);
-    }
-
-    rcu_read_unlock(&domlist_read_lock);
-}
-
-static int __init cf_check register_numa_trigger(void)
-{
-    register_keyhandler('u', dump_numa, "dump NUMA info", 1);
-    return 0;
-}
-__initcall(register_numa_trigger);
-
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index b46fd9ab18..9df08e9366 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1350,7 +1350,7 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t pxm)
 
     x86_acpiid_to_apicid[acpi_id] = apic_id;
 
-    if ( !srat_disabled() )
+    if ( !numa_disabled() )
     {
         nodeid_t node = setup_node(pxm);
 
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index b62a152911..4c7f0c547e 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -238,7 +238,7 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 	unsigned pxm;
 	nodeid_t node;
 
-	if (srat_disabled())
+	if (numa_disabled())
 		return;
 	if (pa->header.length < sizeof(struct acpi_srat_x2apic_cpu_affinity)) {
 		bad_srat();
@@ -274,7 +274,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 	unsigned pxm;
 	nodeid_t node;
 
-	if (srat_disabled())
+	if (numa_disabled())
 		return;
 	if (pa->header.length != sizeof(struct acpi_srat_cpu_affinity)) {
 		bad_srat();
@@ -313,7 +313,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 	nodeid_t node;
 	unsigned int i;
 
-	if (srat_disabled())
+	if (numa_disabled())
 		return;
 	if (ma->header.length != sizeof(struct acpi_srat_mem_affinity)) {
 		bad_srat();
@@ -520,7 +520,7 @@ void __init srat_parse_regions(paddr_t addr)
 }
 
 /* Use the information discovered above to actually set up the nodes. */
-int __init acpi_scan_nodes(paddr_t start, paddr_t end)
+int __init numa_scan_nodes(paddr_t start, paddr_t end)
 {
 	int i;
 	nodemask_t all_nodes_parsed;
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 3baf83d527..9a3a12b12d 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-y += memory.o
 obj-y += multicall.o
 obj-y += notifier.o
+obj-$(CONFIG_NUMA) += numa.o
 obj-y += page_alloc.o
 obj-$(CONFIG_HAS_PDX) += pdx.o
 obj-$(CONFIG_PERF_COUNTERS) += perfc.o
diff --git a/xen/common/numa.c b/xen/common/numa.c
new file mode 100644
index 0000000000..0bc5113753
--- /dev/null
+++ b/xen/common/numa.c
@@ -0,0 +1,440 @@
+/*
+ * Generic VM initialization for NUMA setups.
+ * Copyright 2002,2003 Andi Kleen, SuSE Labs.
+ * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
+ */
+
+#include <xen/init.h>
+#include <xen/keyhandler.h>
+#include <xen/mm.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
+#include <xen/param.h>
+#include <xen/sched.h>
+#include <xen/softirq.h>
+
+struct node_data __ro_after_init node_data[MAX_NUMNODES];
+
+/* Mapping from pdx to node id */
+unsigned int __ro_after_init memnode_shift;
+unsigned long __ro_after_init memnodemapsize;
+uint8_t *__ro_after_init memnodemap;
+static uint8_t __ro_after_init _memnodemap[64];
+
+nodeid_t __ro_after_init cpu_to_node[NR_CPUS] = {
+    [0 ... NR_CPUS-1] = NUMA_NO_NODE
+};
+
+cpumask_t __ro_after_init node_to_cpumask[MAX_NUMNODES];
+
+nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
+
+bool __read_mostly numa_off;
+
+bool numa_disabled(void)
+{
+    return numa_off || arch_numa_disabled(false);
+}
+
+/*
+ * Given a shift value, try to populate memnodemap[]
+ * Returns :
+ * 1 if OK
+ * 0 if memnodmap[] too small (of shift too small)
+ * -1 if node overlap or lost ram (shift too big)
+ */
+static int __init populate_memnodemap(const struct node *nodes,
+                                      nodeid_t numnodes, unsigned int shift,
+                                      nodeid_t *nodeids)
+{
+    unsigned long spdx, epdx;
+    nodeid_t i;
+    int res = -1;
+
+    memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
+    for ( i = 0; i < numnodes; i++ )
+    {
+        spdx = paddr_to_pdx(nodes[i].start);
+        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
+        if ( spdx >= epdx )
+            continue;
+        if ( (epdx >> shift) >= memnodemapsize )
+            return 0;
+        do {
+            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE )
+                return -1;
+
+            if ( !nodeids )
+                memnodemap[spdx >> shift] = i;
+            else
+                memnodemap[spdx >> shift] = nodeids[i];
+
+            spdx += (1UL << shift);
+        } while ( spdx < epdx );
+        res = 1;
+    }
+
+    return res;
+}
+
+static int __init allocate_cachealigned_memnodemap(void)
+{
+    unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
+    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
+
+    memnodemap = mfn_to_virt(mfn);
+    mfn <<= PAGE_SHIFT;
+    size <<= PAGE_SHIFT;
+    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
+           mfn, mfn + size);
+    memnodemapsize = size / sizeof(*memnodemap);
+
+    return 0;
+}
+
+/*
+ * The LSB of all start and end addresses in the node map is the value of the
+ * maximum possible shift.
+ */
+static unsigned int __init extract_lsb_from_nodes(const struct node *nodes,
+                                                  nodeid_t numnodes)
+{
+    unsigned int i;
+    nodeid_t nodes_used = 0;
+    unsigned long spdx, epdx;
+    unsigned long bitfield = 0, memtop = 0;
+
+    for ( i = 0; i < numnodes; i++ )
+    {
+        spdx = paddr_to_pdx(nodes[i].start);
+        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
+        if ( spdx >= epdx )
+            continue;
+        bitfield |= spdx;
+        nodes_used++;
+        if ( epdx > memtop )
+            memtop = epdx;
+    }
+    if ( nodes_used <= 1 )
+        i = BITS_PER_LONG - 1;
+    else
+        i = find_first_bit(&bitfield, sizeof(unsigned long)*8);
+    memnodemapsize = (memtop >> i) + 1;
+    return i;
+}
+
+unsigned int __init compute_hash_shift(const struct node *nodes,
+                                       nodeid_t numnodes, nodeid_t *nodeids)
+{
+    unsigned int shift;
+
+    shift = extract_lsb_from_nodes(nodes, numnodes);
+    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
+        memnodemap = _memnodemap;
+    else if ( allocate_cachealigned_memnodemap() )
+        return -1;
+    printk(KERN_DEBUG "NUMA: Using %d for the hash shift.\n", shift);
+
+    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
+    {
+        printk(KERN_INFO "Your memory is not aligned you need to "
+               "rebuild your hypervisor with a bigger NODEMAPSIZE "
+               "shift=%d\n", shift);
+        return -1;
+    }
+
+    return shift;
+}
+
+/* initialize NODE_DATA given nodeid and start/end */
+void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
+{
+    unsigned long start_pfn = paddr_to_pfn(start);
+    unsigned long end_pfn = paddr_to_pfn(end);
+
+    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
+    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
+
+    node_set_online(nodeid);
+}
+
+void __init numa_init_array(void)
+{
+    int rr, i;
+
+    /*
+     * There are unfortunately some poorly designed mainboards around
+     * that only connect memory to a single CPU. This breaks the 1:1 cpu->node
+     * mapping. To avoid this fill in the mapping for all possible
+     * CPUs, as the number of CPUs is not known yet.
+     * We round robin the existing nodes.
+     */
+    rr = first_node(node_online_map);
+    for ( i = 0; i < nr_cpu_ids; i++ )
+    {
+        if ( cpu_to_node[i] != NUMA_NO_NODE )
+            continue;
+        numa_set_node(i, rr);
+        rr = cycle_node(rr, node_online_map);
+    }
+}
+
+#ifdef CONFIG_NUMA_EMU
+static unsigned int __initdata numa_fake;
+
+/* Numa emulation */
+static int __init numa_emulation(unsigned long start_pfn,
+                                 unsigned long end_pfn)
+{
+    unsigned int i;
+    struct node nodes[MAX_NUMNODES];
+    uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
+
+    /* Kludge needed for the hash function */
+    if ( hweight64(sz) > 1 )
+    {
+        u64 x = 1;
+        while ( (x << 1) < sz )
+            x <<= 1;
+        if ( x < sz / 2 )
+            printk(KERN_ERR "Numa emulation unbalanced. Complain to maintainer\n");
+        sz = x;
+    }
+
+    memset(&nodes, 0, sizeof(nodes));
+    for ( i = 0; i < numa_fake; i++ )
+    {
+        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
+        if ( i == numa_fake - 1 )
+            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
+        nodes[i].end = nodes[i].start + sz;
+        printk(KERN_INFO "Faking node %u at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
+               i, nodes[i].start, nodes[i].end,
+               (nodes[i].end - nodes[i].start) >> 20);
+        node_set_online(i);
+    }
+    memnode_shift = compute_hash_shift(nodes, numa_fake, NULL);
+    if ( memnode_shift < 0 )
+    {
+        memnode_shift = 0;
+        printk(KERN_ERR "No NUMA hash function found. Emulation disabled.\n");
+        return -1;
+    }
+    for_each_online_node ( i )
+        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
+    numa_init_array();
+
+    return 0;
+}
+#endif
+
+void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
+{
+    unsigned int i;
+    paddr_t start = pfn_to_paddr(start_pfn);
+    paddr_t end = pfn_to_paddr(end_pfn);
+
+#ifdef CONFIG_NUMA_EMU
+    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
+        return;
+#endif
+
+#ifdef CONFIG_NUMA
+    if ( !numa_off && !numa_scan_nodes(start, end) )
+        return;
+#endif
+
+    printk(KERN_INFO "%s\n",
+           numa_off ? "NUMA turned off" : "No NUMA configuration found");
+
+    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
+           start, end);
+    /* setup dummy node covering all memory */
+    memnode_shift = BITS_PER_LONG - 1;
+    memnodemap = _memnodemap;
+    /* Dummy node only uses 1 slot in reality */
+    memnodemap[0] = 0;
+    memnodemapsize = 1;
+
+    nodes_clear(node_online_map);
+    node_set_online(0);
+    for ( i = 0; i < nr_cpu_ids; i++ )
+        numa_set_node(i, 0);
+    cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
+    setup_node_bootmem(0, start, end);
+}
+
+void numa_add_cpu(unsigned int cpu)
+{
+    cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
+}
+
+void numa_set_node(unsigned int cpu, nodeid_t node)
+{
+    cpu_to_node[cpu] = node;
+}
+
+/* [numa=off] */
+static int __init cf_check numa_setup(const char *opt)
+{
+    if ( !strncmp(opt, "off", 3) )
+        numa_off = true;
+    else if ( !strncmp(opt, "on", 2) )
+        numa_off = false;
+#ifdef CONFIG_NUMA_EMU
+    else if ( !strncmp(opt, "fake=", 5) )
+    {
+        numa_off = false;
+        numa_fake = simple_strtoul(opt + 5, NULL, 0);
+        if ( numa_fake >= MAX_NUMNODES )
+            numa_fake = MAX_NUMNODES;
+    }
+#endif
+    else
+        return arch_numa_setup(opt);
+
+    return 0;
+}
+custom_param("numa", numa_setup);
+
+static void cf_check dump_numa(unsigned char key)
+{
+    s_time_t now = NOW();
+    unsigned int i, j, n;
+    struct domain *d;
+    struct page_info *page;
+    unsigned int page_num_node[MAX_NUMNODES];
+    const struct vnuma_info *vnuma;
+
+    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
+           now);
+
+    for_each_online_node ( i )
+    {
+        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
+
+        printk("NODE%u start->%lu size->%lu free->%lu\n",
+               i, node_start_pfn(i), node_spanned_pages(i),
+               avail_node_heap_pages(i));
+        /* sanity check phys_to_nid() */
+        if ( phys_to_nid(pa) != i )
+            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
+                   pa, phys_to_nid(pa), i);
+    }
+
+    j = cpumask_first(&cpu_online_map);
+    n = 0;
+    for_each_online_cpu ( i )
+    {
+        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
+        {
+            if ( n > 1 )
+                printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
+            else
+                printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
+            j = i;
+            n = 1;
+        }
+        else
+            ++n;
+    }
+    if ( n > 1 )
+        printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
+    else
+        printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
+
+    rcu_read_lock(&domlist_read_lock);
+
+    printk("Memory location of each domain:\n");
+    for_each_domain ( d )
+    {
+        process_pending_softirqs();
+
+        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));
+
+        for_each_online_node ( i )
+            page_num_node[i] = 0;
+
+        spin_lock(&d->page_alloc_lock);
+        page_list_for_each(page, &d->page_list)
+        {
+            i = phys_to_nid(page_to_maddr(page));
+            page_num_node[i]++;
+        }
+        spin_unlock(&d->page_alloc_lock);
+
+        for_each_online_node ( i )
+            printk("    Node %u: %u\n", i, page_num_node[i]);
+
+        if ( !read_trylock(&d->vnuma_rwlock) )
+            continue;
+
+        if ( !d->vnuma )
+        {
+            read_unlock(&d->vnuma_rwlock);
+            continue;
+        }
+
+        vnuma = d->vnuma;
+        printk("     %u vnodes, %u vcpus, guest physical layout:\n",
+               vnuma->nr_vnodes, d->max_vcpus);
+        for ( i = 0; i < vnuma->nr_vnodes; i++ )
+        {
+            unsigned int start_cpu = ~0U;
+
+            if ( vnuma->vnode_to_pnode[i] == NUMA_NO_NODE )
+                printk("       %3u: pnode ???,", i);
+            else
+                printk("       %3u: pnode %3u,", i, vnuma->vnode_to_pnode[i]);
+
+            printk(" vcpus ");
+
+            for ( j = 0; j < d->max_vcpus; j++ )
+            {
+                if ( !(j & 0x3f) )
+                    process_pending_softirqs();
+
+                if ( vnuma->vcpu_to_vnode[j] == i )
+                {
+                    if ( start_cpu == ~0U )
+                    {
+                        printk("%d", j);
+                        start_cpu = j;
+                    }
+                }
+                else if ( start_cpu != ~0U )
+                {
+                    if ( j - 1 != start_cpu )
+                        printk("-%d ", j - 1);
+                    else
+                        printk(" ");
+                    start_cpu = ~0U;
+                }
+            }
+
+            if ( start_cpu != ~0U  && start_cpu != j - 1 )
+                printk("-%d", j - 1);
+
+            printk("\n");
+
+            for ( j = 0; j < vnuma->nr_vmemranges; j++ )
+            {
+                if ( vnuma->vmemrange[j].nid == i )
+                    printk("           %016"PRIx64" - %016"PRIx64"\n",
+                           vnuma->vmemrange[j].start,
+                           vnuma->vmemrange[j].end);
+            }
+        }
+
+        read_unlock(&d->vnuma_rwlock);
+    }
+
+    rcu_read_unlock(&domlist_read_lock);
+}
+
+static int __init cf_check register_numa_trigger(void)
+{
+    register_keyhandler('u', dump_numa, "dump NUMA info", 1);
+    return 0;
+}
+__initcall(register_numa_trigger);
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 7aef1a88dc..bae534bb04 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -18,4 +18,70 @@
   (((d)->vcpu != NULL && (d)->vcpu[0] != NULL) \
    ? vcpu_to_node((d)->vcpu[0]) : NUMA_NO_NODE)
 
+/* The following content can be used when NUMA feature is enabled */
+#ifdef CONFIG_NUMA
+
+extern nodeid_t      cpu_to_node[NR_CPUS];
+extern cpumask_t     node_to_cpumask[];
+
+#define cpu_to_node(cpu)        (cpu_to_node[cpu])
+#define parent_node(node)       (node)
+#define node_to_first_cpu(node) (__ffs(node_to_cpumask[node]))
+#define node_to_cpumask(node)   (node_to_cpumask[node])
+
+struct node {
+    paddr_t start, end;
+};
+
+extern unsigned int compute_hash_shift(const struct node *nodes,
+                                       nodeid_t numnodes, nodeid_t *nodeids);
+
+#define VIRTUAL_BUG_ON(x)
+
+extern bool numa_off;
+extern void numa_add_cpu(unsigned int cpu);
+extern void numa_init_array(void);
+extern void numa_set_node(unsigned int cpu, nodeid_t node);
+extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
+extern int  numa_scan_nodes(paddr_t start, paddr_t end);
+
+extern int arch_numa_setup(const char *opt);
+extern bool arch_numa_disabled(bool init_as_disable);
+extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
+
+static inline void clear_node_cpumask(unsigned int cpu)
+{
+    cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
+}
+
+/* Simple perfect hash to map pdx to node numbers */
+extern unsigned int memnode_shift;
+extern unsigned long memnodemapsize;
+extern uint8_t *memnodemap;
+
+struct node_data {
+    unsigned long node_start_pfn;
+    unsigned long node_spanned_pages;
+};
+
+extern struct node_data node_data[];
+
+static inline __attribute_pure__ nodeid_t phys_to_nid(paddr_t addr)
+{
+    nodeid_t nid;
+    VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
+    nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
+    VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
+    return nid;
+}
+
+#define NODE_DATA(nid)          (&(node_data[nid]))
+
+#define node_start_pfn(nid)     (NODE_DATA(nid)->node_start_pfn)
+#define node_spanned_pages(nid) (NODE_DATA(nid)->node_spanned_pages)
+#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
+                                NODE_DATA(nid)->node_spanned_pages)
+
+#endif
+
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


