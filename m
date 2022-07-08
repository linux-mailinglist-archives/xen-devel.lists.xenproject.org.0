Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A6656BBF6
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 16:55:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363477.594077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pOQ-0000ln-Qf; Fri, 08 Jul 2022 14:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363477.594077; Fri, 08 Jul 2022 14:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pOQ-0000fi-Jp; Fri, 08 Jul 2022 14:55:42 +0000
Received: by outflank-mailman (input) for mailman id 363477;
 Fri, 08 Jul 2022 14:55:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EO41=XN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o9pOO-0006vD-S0
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 14:55:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60049.outbound.protection.outlook.com [40.107.6.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07e0f916-fece-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 16:55:39 +0200 (CEST)
Received: from DB6PR0601CA0012.eurprd06.prod.outlook.com (2603:10a6:4:7b::22)
 by AM0PR08MB3188.eurprd08.prod.outlook.com (2603:10a6:208:5e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 14:55:35 +0000
Received: from DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::18) by DB6PR0601CA0012.outlook.office365.com
 (2603:10a6:4:7b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT045.mail.protection.outlook.com (100.127.142.142) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 14:55:34 +0000
Received: ("Tessian outbound 13cb25bfb745:v122");
 Fri, 08 Jul 2022 14:55:34 +0000
Received: from 216719b84af4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8E07A32A-26C8-4653-A7AC-948110A42AB5.1; 
 Fri, 08 Jul 2022 14:55:27 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 216719b84af4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jul 2022 14:55:27 +0000
Received: from DB6P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::14) by
 AM0PR08MB5154.eurprd08.prod.outlook.com (2603:10a6:208:15d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 14:55:25 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::3b) by DB6P192CA0004.outlook.office365.com
 (2603:10a6:4:b8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:24 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 14:55:24 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 8 Jul 2022
 14:55:17 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:15 +0000
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
X-Inumbo-ID: 07e0f916-fece-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DBlHUOywwnEnAxlQoRd65sHV4h+H3y3dTIk6cuDic5RgQCTEywUpA1pS0s2TBOld/ayDGgsQ5td6CEdUCYHWmO6caSiYhupcgoQ0ty9X7NvyKMb7sOsWk1OnZzgRmReW08B3cgQ7Vw1m0ZRouzGKMTj0Z4rOXgk28GYDF89EyXf0G4Zkp7x/9XgBE3hVThyg4vJbM7edodHbqIjUufOkrNAtcXge598mED60jCkBBJGLVLE/+dBwGmKPG/hhWP+adyxAxwfJmb628UVeHBb24FiI9USsL2hmIHLfQe0icmvC3gMJUwzcAD0hvwE/NGATao1mLWC/FjanuY0dlLToCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk0IhxXN/zYIHE4+iVUsSa2FBDhvvWOeQyK22TgQPPM=;
 b=gjuRq4aBbaHp/4qK7TSyKWmNQwea3+v4LZTS0/lukFFieNlIR3+CZJUgCzMIwGjEtNut5ZlkGp2Dn1OBQoO1Ecwmw3Dki0g33wmfo7qTx3qO+GCodRhh1z7h/k8/8cdU7ruo5Ym9EONx2hhuzeQiC3ZM8EtjKS0njSA00wKVL/0rkdNcyg1dhCtScvtMOM/UTC853+2bqqWoUoFjaZgsFasOvD+Ab/sc3hu37WJNqngKOiAZj/wgDTQTybG6hHPc96c5IBiY3xnH/AqRpxoxs2d+PjlaJCBFdddc8Jjf2q3/GVD/P6LPGTsCiqmEL8KEZ9nqg7K61KuZEqapzkxWvA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk0IhxXN/zYIHE4+iVUsSa2FBDhvvWOeQyK22TgQPPM=;
 b=c86/JCq5BUh3HV5c59njQldpPEfVt2DOSe2hivj/Pb8zV4G91I3gXLrFglKW2iZKkZcWQRoplm6ShmpfCw1pyLKPghGpMm4pnxsQoC/iqxUl6yovuIVcRGq3HVSWAvYX7YIjnGwmprHuL+4VhAnM/17uOPSfftoM8HzvsjZE0Ik=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1717f0940105f789
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bf8S3uppi2CODx1C2ONxHHSSp6FB5FBOJ15YJeDP5pyOA4DhFFFJtOyHDOwZm0GMdcQVMtdPQBR7LtwJUNY11sQ5e+amv+8I0ADqcasEf1Wz0/fCDngFDCdg+qT82ejCFEC01lg/ZiGN17aXqoPEz/rOBCPhxCFDwvLLRSyYWJVWLIGqgs9k6qIq/cMZZEFlwTzMWFsJELVW3uEuPUM+4POMiQMPn9EnfyDRW4VhjMogTsAhLMJRGjf+wiDg6rn1m1Zzd6O9Z9B+szHZJsfEwNYZXC5W8sxHLPaYuP4e7+qt6o2NhU9BELykQhYmoXBFkMjhDICd/QLlRyhAUeC/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk0IhxXN/zYIHE4+iVUsSa2FBDhvvWOeQyK22TgQPPM=;
 b=KCsp2QiU8FpTvkNq03chMe9LEmBzRPh4MgrFpjItHenpzgdK5hRP+LivJlagZ3M6iSaK3eGXmCpVWhrDSuSAylYRbLGoeGJcA17viOzqRDHDIPDWuFCawkYR6fIXhctDBJf/EYjFdeoDcSxjgH3pYmaD1eNS+CK76UAZZlpo30NEr7N4XIW2VHSkSRAKFByYkcjEeAUvKfqKt1saNPqYKmLSumYFcCOmhLbBmzsvC7bYt1jA3z/DB8Cxmq/PteWrBTjbCsxzWU9nLwHZP8dkc7vTusXoLnfbixycso1Figjl4F3TwZCNyvj/wbJ6zjsKkON0la9DI48RF6BURVr2Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk0IhxXN/zYIHE4+iVUsSa2FBDhvvWOeQyK22TgQPPM=;
 b=c86/JCq5BUh3HV5c59njQldpPEfVt2DOSe2hivj/Pb8zV4G91I3gXLrFglKW2iZKkZcWQRoplm6ShmpfCw1pyLKPghGpMm4pnxsQoC/iqxUl6yovuIVcRGq3HVSWAvYX7YIjnGwmprHuL+4VhAnM/17uOPSfftoM8HzvsjZE0Ik=
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
Subject: [PATCH v2 7/9] xen/x86: rename bad_srat to numa_bad
Date: Fri, 8 Jul 2022 22:54:22 +0800
Message-ID: <20220708145424.1848572-8-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708145424.1848572-1-wei.chen@arm.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: b50017ba-3fef-49bb-4551-08da60f1e990
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB5154:EE_|DBAEUR03FT045:EE_|AM0PR08MB3188:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LZiQA2NVb4dV6MKzZb22EPUEJSYe/N7aHI9PcAeFBAak9k4pzb1IRRJBqVKXMByjG8XZNHhHqAtYN26aXR7MSaGQiMdNNbu1OpVkMzuaoSYbRklxSJt0uRXC0IraB5muTRlzdr8f/AK//Rv6dVHkhWL5FnxOgVbEdjV4E0hAQJCeanSGRxzqw+CCCKYwr9nADkb2mh6f/d46NK9mKyjRUCEHxvTPec2qkhimqyG3GebSKZVmq+Iv6n4V86/W9UkT74VPH8J1XdK6tXAYljh8xeX6P31rdoUcLhTxc9A8GNVIYmRASA966QkwAUaegJdbf3p+xokLwvH3IN8GBubjm6NmhoF3lKsSM05ZHB24K+JAMXtN6VjWYuB5Ox0lorTHW5UBfBbP8u99TCXcDhhh1852d6hEm5w9++fDhBfnafB8EU9gZiZ21a6OXvwHDLrnKcfdy8bSiGdkjnpXJ+z0VcBI+XoH3iIebyGcOteu/xwgOvho+bSKd8zqC4Q0nhn8qszMNO0Wp7lmhGUsq2lpXBy690TZDPeL0669cTr+eMl0W1VQsJQJR/WM+J5WQGsEHiO9VYdecEulI+/yviEM4KMloEHmWcaBFw9diLUiFUQDYHhJgculG/UmcooFT90j52WmDMHLPr6Cb0R6lbH4gs3qoAV+rwkffxvKQOIvjzJglh6OMhNQlRB2Vf7Yh4Wl9JZM4j0y+zgJEJzzlE4FjrrL67tB2ejM0taC4NydBL1FxKNMoh2+sDFDRNmohotwHidor3hv9+/ID0S/qZBuip1+x2RwiUrFqtUeW9WJnsJ0/TNeDXTdnvtAqKFBS4T0bdr4/LWXjSi28iIGAJ07h+fWBQtiJKk45WqhjFoesFY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(136003)(346002)(40470700004)(36840700001)(46966006)(82740400003)(426003)(7696005)(47076005)(86362001)(44832011)(40480700001)(336012)(82310400005)(6666004)(41300700001)(356005)(4326008)(2906002)(1076003)(2616005)(186003)(26005)(70586007)(70206006)(83380400001)(8676002)(6916009)(36756003)(40460700003)(8936002)(36860700001)(81166007)(478600001)(54906003)(316002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5154
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b691d5c-4ac1-498f-234c-08da60f1e3a9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EsZtFZanV3m/BYHgKsWNMoXVQj6y5Gm5MuJX66rcY6jZLz0pOY5jEM+iAEMvNHiGtU72zaezKXjAIfAvYwBS1nBMvurh5YyTZeHG/n4pn/SBMTLQNQ7WQdLZqgSFzpmsM6PIa2LPdiTGNlUsU9cB7nygiXuIkXLghWmsA74f1mFrqK7W3L/Ahe5HJS4bakFZqGLrR6ek3ZUUfr9Xeh+NTEQi7mv3aLbHH/DFhQ+i77zPm87+iW1B145GPOK0zfX90eq2XU803rCfGso2AI1Sdr5KCjw7wEBa1sYUA2ZAuvqmtz/KV4xiGt+9oSiQvpGsA2Bu3jDr8hlAtaqJbn3gyhXUEYnuwcM10iD2KV7IlRll7zC2TQXV9F0DlQNeUarRRD/TjsrtIND6jJ9hlyUDl6zmB1csGqEzQ7xifnJbCHqV5Kj65lv1E5ckErzdyD+3RWp4MeJesz3o1rX83kn9SkQF9kpqd4MF/1O+Yu20nwSM7wqTolf4FpRVUBMXN9uzhmVbO5szKgfqzKsJpMnGfXIqHEYZsC+BRH4gjckkCo5tTkxFXAdeEqVJ7mhXbwXdodypz3G9WztNiAL9osYhqLqJHK3S02o8ecelsRgqXrsJ2hCebyxmg8RCwfIJoSmr7tiMxYd7g7mHoxtU26vhmtC0PbJze6ZGlCWSmKaIc72oZMCZECOZsF6inab8XwXsDAM0lG9ZuV6r8MeX9Dmi5Fvb9lD47mBKtZs75ffEqVN4zQQ0E1rmmJssg6Q5+YkzkS9Jvh71tfTVgv+mWTpJAIJck0DbVIctbVU3HYV0H8zIDVJ6RRrtVf7bVhU3MoSs
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(376002)(346002)(46966006)(36840700001)(40470700004)(47076005)(82310400005)(83380400001)(40460700003)(41300700001)(81166007)(54906003)(36860700001)(6666004)(36756003)(426003)(44832011)(40480700001)(2906002)(6916009)(336012)(70206006)(1076003)(107886003)(5660300002)(8936002)(70586007)(316002)(4326008)(26005)(8676002)(186003)(82740400003)(7696005)(2616005)(86362001)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 14:55:34.8277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b50017ba-3fef-49bb-4551-08da60f1e990
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3188

When NUMA initialization code is failed in scanning SRAT. It will
call bad_srat to set disable NUMA and clear relate data. But this
name is ACPI specific, we have moved generically usable NUMA codes
to common, bad_srat has came with these codes to common code. But
it's not reasonable for other NUMA implementations to implement a
fall back function named bad_srat. So in this patch, we rename
bad_srat to numa_bad.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. New in v2.
---
 xen/arch/x86/srat.c    | 18 +++++++++---------
 xen/common/numa.c      |  4 ++--
 xen/include/xen/numa.h |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 9ae81afdff..4afb37bf9f 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -93,7 +93,7 @@ nodeid_t setup_node(unsigned pxm)
 	return node;
 }
 
-void __init bad_srat(void)
+void __init numa_bad(void)
 {
 	int i;
 	printk(KERN_ERR "SRAT: SRAT not used.\n");
@@ -153,7 +153,7 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 	if (srat_disabled())
 		return;
 	if (pa->header.length < sizeof(struct acpi_srat_x2apic_cpu_affinity)) {
-		bad_srat();
+		numa_bad();
 		return;
 	}
 	if (!(pa->flags & ACPI_SRAT_CPU_ENABLED))
@@ -166,7 +166,7 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 	pxm = pa->proximity_domain;
 	node = setup_node(pxm);
 	if (node == NUMA_NO_NODE) {
-		bad_srat();
+		numa_bad();
 		return;
 	}
 
@@ -189,7 +189,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 	if (srat_disabled())
 		return;
 	if (pa->header.length != sizeof(struct acpi_srat_cpu_affinity)) {
-		bad_srat();
+		numa_bad();
 		return;
 	}
 	if (!(pa->flags & ACPI_SRAT_CPU_ENABLED))
@@ -202,7 +202,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 	}
 	node = setup_node(pxm);
 	if (node == NUMA_NO_NODE) {
-		bad_srat();
+		numa_bad();
 		return;
 	}
 	apicid_to_node[pa->apic_id] = node;
@@ -225,7 +225,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 	if (srat_disabled())
 		return;
 	if (ma->header.length != sizeof(struct acpi_srat_mem_affinity)) {
-		bad_srat();
+		numa_bad();
 		return;
 	}
 	if (!(ma->flags & ACPI_SRAT_MEM_ENABLED))
@@ -239,7 +239,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 	if (!numa_memblks_available()) {
 		dprintk(XENLOG_WARNING,
 			"Too many numa entries, try bigger NR_NODE_MEMBLKS!\n");
-		bad_srat();
+		numa_bad();
 		return;
 	}
 
@@ -248,14 +248,14 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		pxm &= 0xff;
 	node = setup_node(pxm);
 	if (node == NUMA_NO_NODE) {
-		bad_srat();
+		numa_bad();
 		return;
 	}
 
 	ret = numa_update_node_memblks(node, pxm, ma->base_address, ma->length,
 				       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE);
 	if (ret)
-		bad_srat();
+		numa_bad();
 }
 
 void __init acpi_numa_arch_fixup(void) {}
diff --git a/xen/common/numa.c b/xen/common/numa.c
index e3b66c54b5..5ab061e991 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -300,7 +300,7 @@ int __init acpi_scan_nodes(paddr_t start, paddr_t end)
 
     if ( !nodes_cover_memory() )
     {
-        bad_srat();
+        numa_bad();
         return -1;
     }
 
@@ -311,7 +311,7 @@ int __init acpi_scan_nodes(paddr_t start, paddr_t end)
     {
         printk(KERN_ERR
                "SRAT: No NUMA node hash function found. Contact maintainer\n");
-        bad_srat();
+        numa_bad();
         return -1;
     }
 
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 564add430c..4c4632ec27 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -52,7 +52,7 @@ extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
 extern bool numa_enabled_with_firmware(void);
 extern enum numa_mode numa_status;
 
-extern void bad_srat(void);
+extern void numa_bad(void);
 extern void numa_set_node(int cpu, nodeid_t node);
 extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 
-- 
2.25.1


