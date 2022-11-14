Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E0C6275FE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 07:36:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443103.697570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouT4Q-0003b8-Ts; Mon, 14 Nov 2022 06:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443103.697570; Mon, 14 Nov 2022 06:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouT4Q-0003Yc-PK; Mon, 14 Nov 2022 06:35:50 +0000
Received: by outflank-mailman (input) for mailman id 443103;
 Mon, 14 Nov 2022 06:35:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CFvb=3O=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ouT4P-0000jp-9m
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 06:35:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2081.outbound.protection.outlook.com [40.107.20.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92c8d0b0-63e6-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 07:35:48 +0100 (CET)
Received: from DB6PR0301CA0051.eurprd03.prod.outlook.com (2603:10a6:4:54::19)
 by GV2PR08MB7953.eurprd08.prod.outlook.com (2603:10a6:150:ab::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Mon, 14 Nov
 2022 06:35:28 +0000
Received: from DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::cd) by DB6PR0301CA0051.outlook.office365.com
 (2603:10a6:4:54::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12 via Frontend
 Transport; Mon, 14 Nov 2022 06:35:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT048.mail.protection.outlook.com (100.127.142.200) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 06:35:27 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Mon, 14 Nov 2022 06:35:27 +0000
Received: from 2a635dd1e6b1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4567AD6B-AC80-4922-A470-46BE61EC94E1.1; 
 Mon, 14 Nov 2022 06:35:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2a635dd1e6b1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Nov 2022 06:35:21 +0000
Received: from AM6PR05CA0008.eurprd05.prod.outlook.com (2603:10a6:20b:2e::21)
 by DB8PR08MB5404.eurprd08.prod.outlook.com (2603:10a6:10:117::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Mon, 14 Nov
 2022 06:35:12 +0000
Received: from VI1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::2) by AM6PR05CA0008.outlook.office365.com
 (2603:10a6:20b:2e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.15 via Frontend
 Transport; Mon, 14 Nov 2022 06:35:12 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT040.mail.protection.outlook.com (100.127.145.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 06:35:11 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 14 Nov
 2022 06:35:10 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 14 Nov
 2022 06:35:09 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Mon, 14 Nov 2022 06:35:06 +0000
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
X-Inumbo-ID: 92c8d0b0-63e6-11ed-8fd2-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=O1Dtv7HDSHme0nROMVDvehr/Q2so3iCiXKez0ZKLVjFEABDDTeS6Rr7+0+ZWXKTcKucSvW8bgi+cBAXcDikonmom7zHLIaLKeh1HN8DS/i3rm/KGMMcBKlkQqzhvD7p/MKDzcHbjSALYiXPKEwrDC+x2CX0c64sKJb/5yhjQeh4FHc8Nm4WQrEsx9tEL7VVFeeOPF+Ya5IEMRryKyYM+SYf4kC8SFqqqpfWdJQM1LCp9JXsh6tjTHSmv/9RtngigAW43AFAmV6dBTjMSrK7iX3mG9ZJ1rFcH+tMnkC3tvNyoOZS/ZlNSNIsf+5IeRAF7CNywxIj5dsrMigOJZHc9Iw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/aAu/7EVuDCZBKD/793DLiQP8lHkAQyvu0W/tbihJg=;
 b=U5fOZJ1DP7PErteLnRSzTtmuTOFx68qghT5IE1F+qLxidF0L8aVJUV9VgWc25fx9tnrr/ChzX8euMMEyqcLA8Hn1Gpz5sznA5uqYLfaCqXCWc+GjATNY96B2bEGxa3imS+HuT5EqcNEKbI3WZJZhjd4oiiftDkA2MexfkvZgdGGzy2aoA2S2dXnwxsrCDxQnH7UNt3rczi3Tr6uJYtKjd9x/IUbYpQaio4ESYM92SlE5e2360zhaa5vsJqzTpSxQqKhMynV5WJyZC13aWZOfoyo9+j1HN3LXjqQ7jgislbxSRXnEFvwTXXpfzcFvG1NKAmbCNLCEwqSXaDN+3LitaA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/aAu/7EVuDCZBKD/793DLiQP8lHkAQyvu0W/tbihJg=;
 b=Gb3m+XvK3MzlEGXwVU46IPoqOTKxlTXgeMoukfWqCE95JSw0Oi2BCqbaRdvZMa/H2wYqQ11SuLY5qUsP1Ez1sU6ZJi+XSytUhe7e9Q61Oxr0i4NFSmTRCvwQjMIr8WO6Q7lCWkQvjeryQdiZ/lmSNX9skOQoL6AP+e3EClH8JzE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a430c7b60befda4d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4FocFVqkNCgEShQfNgbczJCUkmMDGPHk3+0uod3sfMym/wZlg8qzGMkcwOEdZHsjuw6BTTSjQU+rAtEYWXX99GFCRLo7tVPECw1JQdIhZxLTkpqJubnV5NpavGNSJCZEzWTaSIkiJRV+i6FtBgFgi43ioWSoRj0ZMFmU20kmRIfNhBvioL6kk/y1tbSUQDiB9aRWLyxPfrwiNuzAVUt237zHfppX3IGFztO/0BAOq0YnFM+bugpmFJILY4r0Z47XyLrHQ7/Be+Ksridem4sJE7kxnDqAQC24YHLybjkH7fr6lhtzbbq5cvpMZQ/Jwdtj8YgaQj3222yiUjFSI5xBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/aAu/7EVuDCZBKD/793DLiQP8lHkAQyvu0W/tbihJg=;
 b=HKePW+CUT4OFmg6uuQDtsokd1KMQHwBgZ3Lq/W8xdblxLzJPJJafmKG7Zss+x2gOdSQNjUjAXW0tnNh6fUR/wBVAM485pUXSjU/YWTRke3g1zy4o/WUhohajSxN38Y8jvCXpiQihO4VIwX5Wb4Ldri+7/xbHxNC0Tx66a99GOzIPM8PM+pEF7bToQNioxPTkob3MS5krDkPeHU2jdCyRWBsGPTUAx1gDpV7RS4XRutb8rpl/2OZEolYIZgfXDj652QxZUZTEBBT+7P1mn5IsUXW6F4lxmGc/19kdXOAPVKEK9yQyC0QWZqpe/89xA8PVmDx/jFMGS35WJrEFg1j6Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/aAu/7EVuDCZBKD/793DLiQP8lHkAQyvu0W/tbihJg=;
 b=Gb3m+XvK3MzlEGXwVU46IPoqOTKxlTXgeMoukfWqCE95JSw0Oi2BCqbaRdvZMa/H2wYqQ11SuLY5qUsP1Ez1sU6ZJi+XSytUhe7e9Q61Oxr0i4NFSmTRCvwQjMIr8WO6Q7lCWkQvjeryQdiZ/lmSNX9skOQoL6AP+e3EClH8JzE=
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
Subject: [PATCH v8 4/6] xen/x86: use arch_get_ram_range to get information from E820 map
Date: Mon, 14 Nov 2022 14:34:49 +0800
Message-ID: <20221114063451.473711-5-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114063451.473711-1-wei.chen@arm.com>
References: <20221114063451.473711-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT040:EE_|DB8PR08MB5404:EE_|DBAEUR03FT048:EE_|GV2PR08MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: 75da3369-81c0-4af9-96a7-08dac60a6b34
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jSLUC7kXMWJhWwGIu4uUayBv/5a62k7W7DClmv+NU/Fhab3Trpb+U1eg99q0wmXMd/GUfhFUg46R3BV48rHYE5fmBXE+j4MDGairOR0eUP0T0xloJOdbGGyQCfawEW5nTphHo4G2dxxvJRNH9snD/4i7FyZp68hD8DGuSi5EDkzbch/DFbyf/9wlWK/xYawAzcJukF0TjUcBDyjlqGerO5tEmSSLtQr2WfceTjec9hZF/WxNfPoIURTW/1mwf8JoDDuDdqBPHeT4j+swkwnWzHTPFu6p49P1U8Q53NjepstUH+HxrHggQCSBd4J3Kbg+mxoBmpeQAtVt4umkraWBVVIV8IKOPq6eygUrdhp3EQzAt23Rk9105XtEf0Wl+IKUDOPCRESqgaMKNWSY2yjUq+nbnhWYTiBayj44Leqhr4wZdnADnaVRB45aHg9A9Mun6NJ+qrLaNYPEGfc8+nZ0nFH7CvKus6qPFIZvgOH962ToIIHTBKdG7bz7fESZNJ9UoTKDvymyHMbLqbFnRLsQFwnse27qi8Pu1HY917+YlAB8afGSDtPOQyG4KN0MbAzDF6Bga6300siW5yYzSq4SQLGmX4zU2hkZS1cz8hzKB69WS2R97RCisqTQibqwwqYBXY64WXUfABpNfE6f73UeMcnDwfm0rfn0VDRH+2t8oOBZXVwDVJzkOrv59+mWga7z2XHTONzouVYvy2M7b0fPohMhRu/sEc0ZAZYYIVB5TmAcHpHVU/lmRUa+qLWcsybQwilyrpSAzZPqHaRGphWefu2ylOJZBMvC46xF8Fp4C+FZdIJ8qVNzmYZjtUcJWhVR
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(2906002)(70586007)(70206006)(4326008)(8936002)(5660300002)(41300700001)(83380400001)(44832011)(8676002)(40460700003)(40480700001)(86362001)(82740400003)(36756003)(81166007)(82310400005)(356005)(478600001)(54906003)(7696005)(6666004)(47076005)(26005)(316002)(6916009)(426003)(1076003)(186003)(2616005)(336012)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5404
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	46774657-6733-4d9b-1ac6-08dac60a61b2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LyXUbDo9X8M3a2TDNRzMFruVKwoTkzDC5qVyZKdH9cw9Pk1MdCTqRBP30jf027USuibX5ikbS+X2dCw5ZF/w5V9aL07tK7CVzZXVtjupdQ15lMyxjgDB6NTWL3iSGXySFzQVYohL0RSXb0A0TwKipIyEmfgfzwbFapqfU+SsI7W4fadYeRaHj4DNXZd/OuR0qUy9O8xwHUPxoX+VVWX3XgO7Lx1haHnaqSlLEh9jsX/6yK+Dkm9P3SHp8Jh7cJ2wgwxBlXSV1kwVRcWW35nu0UvTVOGYcFBP6cS3KLZm0T95NyOfKT9PbwNGGW8EksBD/cHABXTJI9fnV3GlGUp88rd3M1zhMxrl55eeiMPMNC2xsOkI0HEsCTFOBPghfmqb1lt7Bbg7n0B/ViOHntflWkDHSxa+MJLbu8wn+Bp6kUeaWig4Plccpp2fFIEjlgIybzYhNkQoUhEdvPei7lGqM8dnRbXnFauX+eYsF8Ltw51xBD+xBkm98kK1qJ2fm1DwiXmla1f3a/FtPKSe8oYv0Q956IlVpRZ71q8zPSC4n/yAY/vnDeOxNhCUrg9tvb8+2tUp+iHkWL8oZLAvcyMOzTvqlNXVuRfPDSLGb95S4LfqQoHjPqsqny1hFWR0kTbVmHtLPltxaFtlUvInc/UNMf8TTXeZZmDQxWxLFKcUJzpo4hk0ZKZudWwexlBWiy6xzl061aYcPsacPdamyD41KBjtHWko6w+I38JGaDpJKqcU2HlKm9UISODMAqGwMZb0Ka3o8spGT+lwWijtFco2GA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(41300700001)(6666004)(7696005)(26005)(86362001)(2906002)(54906003)(1076003)(426003)(336012)(186003)(6916009)(47076005)(36860700001)(478600001)(2616005)(83380400001)(316002)(4326008)(8936002)(5660300002)(40460700003)(44832011)(8676002)(81166007)(70206006)(82740400003)(70586007)(40480700001)(82310400005)(36756003)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 06:35:27.6927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75da3369-81c0-4af9-96a7-08dac60a6b34
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7953

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
v7 -> v8:
1. No change.
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


