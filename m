Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CF556BBF8
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 16:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363478.594088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pOS-00014H-9Z; Fri, 08 Jul 2022 14:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363478.594088; Fri, 08 Jul 2022 14:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pOS-0000yO-1v; Fri, 08 Jul 2022 14:55:44 +0000
Received: by outflank-mailman (input) for mailman id 363478;
 Fri, 08 Jul 2022 14:55:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EO41=XN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o9pOP-0006vD-Rl
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 14:55:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0889c9d2-fece-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 16:55:40 +0200 (CEST)
Received: from AS9PR06CA0729.eurprd06.prod.outlook.com (2603:10a6:20b:487::24)
 by AM6PR08MB5254.eurprd08.prod.outlook.com (2603:10a6:20b:d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 14:55:37 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:487:cafe::eb) by AS9PR06CA0729.outlook.office365.com
 (2603:10a6:20b:487::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16 via Frontend Transport; Fri, 8 Jul 2022 14:55:36 +0000
Received: ("Tessian outbound 6f9e7ef31fa8:v122");
 Fri, 08 Jul 2022 14:55:35 +0000
Received: from 7752c8b1a1f5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 21BF7C73-F39F-40A6-B26C-B6A8A57BAA62.1; 
 Fri, 08 Jul 2022 14:55:29 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7752c8b1a1f5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jul 2022 14:55:29 +0000
Received: from DB6P192CA0005.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::15) by
 AM6PR08MB5046.eurprd08.prod.outlook.com (2603:10a6:20b:eb::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.18; Fri, 8 Jul 2022 14:55:27 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::bc) by DB6P192CA0005.outlook.office365.com
 (2603:10a6:4:b8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:27 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 14:55:27 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 8 Jul 2022
 14:55:24 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:21 +0000
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
X-Inumbo-ID: 0889c9d2-fece-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IDTGzsRhwksJULtKqTjY6DjwNdhsnNqurtg+okPYa72msuUM/toiN8f1PRWhNI6gNxthYwrCMTzl3T07UM6Pc/LA1RAA/2gsG0a3GZ9lDSAGzc2DTCmvU9SriTtTevWI5qYnQbqpRDjGR8jjjR880icLtm7IEvWn4QjnRugTZ3P7FwmHAEaFtT0sNrgnLcMkZ/xW3E63bZckMblrldi+14UGAHUQu+DFXXLSrhd4EFt16ME5PDHBjogsYSiYsEeiQvO+5i8CgAphLkFDXji17NG8DXwYtnm8TWPfOefUiqWOlhmbeCeRW2KwD7t0Bpjnk/WHcWXDIfgVqjV7GXYS1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqQSRNHq+Kh5K+Y/RMMNLbWNCA9xm34CxBmK5iY5sjc=;
 b=AfaHEjqEQ9V9viRakj2R4cKeA8zdehS1FtQEn74mzNDOLg+etnr0imuka4C2Z+bJzwbFpu/xXcoHo0bsvBexfGbbIWL5K89XvPqAgq+mB16IgP/z00hvyQzsKg2c05jLrwCXzId91AfG8+eJXTAsdk0ecdOMGC/LijDAx/i/uaz2g4/+A96cB/JUAb+lfUw0boJuqeN0cztx0Rv22RbR6CQI7TSneykEsICGY50lkqUYVspSArBbr2/A1AzYOkxWHwg+nuRMOGHK+XQx+M7LhBIK7kSn55TOIRkFsatjCRbB35F9u5HDSnpAKbBzIQ5Q5K0//dkdOwzsh+96MaODsg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqQSRNHq+Kh5K+Y/RMMNLbWNCA9xm34CxBmK5iY5sjc=;
 b=Yc4jdjb/IM4tHSoDvl2tvsQZ7aRMwSB+6yNDdg02G/WFQYh6JMByaDhv3yv0fmiTwugRRwSKpEDbh06FMU7B1oGPEWp4gncrMVKDJ0RJqcUnpXAI8JfiG5Ivgu5k62DBrFcjECybBvFEXFcnBE9cgjTf4yaXLvezTRBgZI8Otdg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7288404d879e14c7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0JifeM/ZTVeOzaJd/rqJsYwn7ymazYlwX1IaRiHCQZXmTREvwpoWlPhp2oQQKngo1fHoKq18vZ2vpU+V2fVKU3xRuJX/b3IEO2yWzMnbwjdryuK6B1lWN789tLoLgcVcUZ9zA5AdtcP6sl5zj/5fbLzxNL9Zz9lS4klmqze8+OuOtScvHCSUgUazB/E239fjfwm+ZBttHKxPCUTB3oq+TYJvnnuE/Lil+bXJ8yRma+K3Q6btGEXM4YwxorcZfOPYXGvvaxiRG00vC/TrCpM/88qlIn1CDO9E0VCHmBlj4SnPQ6peu1d/m6JIO1VCmnbUH4x114o2UI9TYjERyNVvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqQSRNHq+Kh5K+Y/RMMNLbWNCA9xm34CxBmK5iY5sjc=;
 b=Oey9p/ceIM+USjzcXwqHSC5QLXDOfn9XWku/cYDr4gJ4LkNRyFdV35/KbxI5b0CHQ6rbWBZc3JGdOjObKi2JOUqP2cDdHUjx9oi4CDwrKFBEVu62q47AfasenhqGu6I2PS1b26c2sQk9+EULuakylHOxK7msRNg16W7Sv3otSOyY5lXY2pdTJNBfHRaYkbja2hkabvGbLQyLG/Nmlc6O9UJXUovl8QsgzWRRf9M8NYnCskOj1oNTLdoIVCQe2mGfUOCOhPPuk28nJH9QscLNBo3vDQFHZ5iVYb4FUuURRTs/t+UlBQrFpRvplAClsSreOSENbqb7UXESUAOGu9CdhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqQSRNHq+Kh5K+Y/RMMNLbWNCA9xm34CxBmK5iY5sjc=;
 b=Yc4jdjb/IM4tHSoDvl2tvsQZ7aRMwSB+6yNDdg02G/WFQYh6JMByaDhv3yv0fmiTwugRRwSKpEDbh06FMU7B1oGPEWp4gncrMVKDJ0RJqcUnpXAI8JfiG5Ivgu5k62DBrFcjECybBvFEXFcnBE9cgjTf4yaXLvezTRBgZI8Otdg=
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
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 9/9] xen: introduce a Kconfig option to configure NUMA nodes number
Date: Fri, 8 Jul 2022 22:54:24 +0800
Message-ID: <20220708145424.1848572-10-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708145424.1848572-1-wei.chen@arm.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 34c1eade-cf35-4824-f0db-08da60f1ea50
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB5046:EE_|AM5EUR03FT024:EE_|AM6PR08MB5254:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3Fd/XZcz0ZlvEEnQuXvVOhYKfLZCJSXaErlE9aLZxtzt/Xeg6NI5VLQ/iB9kv/13ceusoWyVWb3nJxYod3NMcmij2fFxGnPCsgQ/2U3VQqWaeKVu+qWseuaD76yyce/WqTyTynjKb9kLS8nt3pqE6HykCb+YxDvu0EHVGUeb/2wdNMZQKEGJjvOeER1KgqOI9XeV7QLpG5IntslBpRMNW/AbmVaf6Z+OKJlpFYjPOPUuOLymC0T4GAs0GJoOizS8x/FQ6Y3D7rZfib8mQQeVVQpaxsa3l4pJ1X5rU8mSsfaXMGTZC2zz2fPYX44K0JnKSqIs4nJ3z3uiGWuVEcSOZS/5u1xrjn3jcioThO1eGQJz4vmFp9196adB+ahQj/fVJ4/p5HFu9awacXRa2n3/SYvekzAyqwVSqCr+NNjb5WoaAWE/WcSpJmYHw+l/+N0QluHR/4g+/Bx0mpOp73dbTE+WZDVH9Tunm4KRBMQthHilTm/x03LjKC6e717yKLCsY3h/UivZFGf1PoYJzdPTYZBpXylivg3w44m+Vb7wGs5a+ISyx/KQjuFAOcnp1w6MAiMksmAIgpbfcDwyQInQxf+3//XQxfiRY6GRFCKKHZX/ZVQdKl7FNHhI1O+yKsckE6ZL/xY/xnfUUg0U+l6+W2K7vtP3alG/LlHxAgrHhWDoMbAGALAJPCE2aIhByve8puKvEObz9WmgUOnvJSgi2CcMtCayWNuyeghfUinxphAupqaXhjGh/a5Z+uneQKj28DnfbRuirFtr+wjVTdK9g+aj92XI2UKs0aIyQDEFY/8rkcD6ayeEAd8/nji/OckJKQlw7+Y+9AiVfpjBcgi6maLzX054H/iRw46vsqZ3CiE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(346002)(376002)(36840700001)(46966006)(40470700004)(4326008)(316002)(82310400005)(40460700003)(2616005)(7696005)(186003)(54906003)(41300700001)(426003)(81166007)(36756003)(26005)(83380400001)(6916009)(336012)(356005)(47076005)(82740400003)(8936002)(8676002)(1076003)(2906002)(40480700001)(5660300002)(86362001)(70586007)(36860700001)(44832011)(478600001)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5046
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3780fdb9-8ead-4cc7-2fe2-08da60f1e543
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1xzEf1u4GSKjmXRMhzNXl8P3FhPn7fOaqzSWV0tYk1P12sfM2YG3zN3nk4zRM0CpeQOfmWBIHjwdi/GlVUvDB8R843ChXluT7aXKObN3sdjogQ9vk2cGwEZr+XUCzg+C31DLhzdPpwgDJSm35lc8AKNTnKQFpc8bb8eMvpCOaV3gpYoRXrgBQLMzx2Lp+DBVIowftpRPD3drBT6mc9cxJ8GQwyHThRgsUOes2vRQWE6a1kO6NkBTJZ/qYsdt5S16/LGN3EUk1mAGI0l+OAUiOODnoO4fNsoqy9S/eazA5OQIvzPOiAVfRpcwOPx2Wo3J7tiqXqJoUuGLOBFfzSNyoDR2Zydc7dhrUA6UP7GhiMnhnVSgTd61faN9s238y/iay/jXEhCTgXq4vcKkc/RnwivfWtOirtCJgpDM651C4zD3+1dX/W+LEdc4GWYTshDYEBla8kRfq77b397s0HJ8UYVieG3LpZPxKrLCY10KrOVaWPrA54jH2worZ1E0iux4ayzIsDP10RTr9Ks4GStrgrh2yrP6thqCFE8geb7qVMm5kEXwhyvnJGv5WYbM+qrVrFFYYXVmxSlbpEzhY9MbfMiuTtFUKhtNAoIDPLIPXF4crew47bYYcIUYHahKyHB7FidrYRkPTr3McjlYQMgpgtMdRFCLnexDD66nQ6z4wgP2bsWx+ybOcMmg8/bGhQeiU41I+PrbRomCSvi/jNsKF475B66Ql64QYCag+GGXFGHuQjhCY0yIsVzL5W1iZKbCdcEe0a8SHLwDekSEfscmBwOIS9oiuRcHjrIhU+6lfRKKgs1xyiEA03kjXCEY8rUr
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(136003)(376002)(36840700001)(40470700004)(46966006)(36756003)(4326008)(2906002)(478600001)(8676002)(336012)(70586007)(82740400003)(40480700001)(54906003)(40460700003)(70206006)(82310400005)(107886003)(81166007)(47076005)(186003)(5660300002)(1076003)(2616005)(44832011)(41300700001)(6916009)(316002)(36860700001)(7696005)(83380400001)(86362001)(26005)(8936002)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 14:55:36.0435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c1eade-cf35-4824-f0db-08da60f1ea50
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5254

Current NUMA nodes number is a hardcode configuration. This
configuration is difficult for an administrator to change
unless changing the code.

So in this patch, we introduce this new Kconfig option for
administrators to change NUMA nodes number conveniently.
Also considering that not all architectures support NUMA,
this Kconfig option only can be visible on NUMA enabled
architectures. Non-NUMA supported architectures can still
use 1 as MAX_NUMNODES.

As NODES_SHIFT is currently unused, we're taking this
opportunity to remove it.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Add NODES_SHIFT remove message in commit log
2. Change NR_NUMA_NODES upper bound from 4095 to 255.
---
 xen/arch/Kconfig                | 11 +++++++++++
 xen/arch/x86/include/asm/numa.h |  2 --
 xen/include/xen/numa.h          | 10 +++++-----
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index f16eb0df43..4fc16f83ac 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -17,3 +17,14 @@ config NR_CPUS
 	  For CPU cores which support Simultaneous Multi-Threading or similar
 	  technologies, this the number of logical threads which Xen will
 	  support.
+
+config NR_NUMA_NODES
+	int "Maximum number of NUMA nodes supported"
+	range 1 255
+	default "64"
+	depends on NUMA
+	help
+	  Controls the build-time size of various arrays and bitmaps
+	  associated with multiple-nodes management. It is the upper bound of
+	  the number of NUMA nodes that the scheduler, memory allocation and
+          other NUMA-aware components can handle.
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index eeb431cdb7..db76281c08 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -3,8 +3,6 @@
 
 #include <xen/cpumask.h>
 
-#define NODES_SHIFT 6
-
 typedef u8 nodeid_t;
 
 extern int srat_rev;
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 4c4632ec27..cac92d2688 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -3,14 +3,14 @@
 
 #include <asm/numa.h>
 
-#ifndef NODES_SHIFT
-#define NODES_SHIFT     0
-#endif
-
 #define NUMA_NO_NODE     0xFF
 #define NUMA_NO_DISTANCE 0xFF
 
-#define MAX_NUMNODES    (1 << NODES_SHIFT)
+#ifdef CONFIG_NR_NUMA_NODES
+#define MAX_NUMNODES CONFIG_NR_NUMA_NODES
+#else
+#define MAX_NUMNODES 1
+#endif
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
 
-- 
2.25.1


