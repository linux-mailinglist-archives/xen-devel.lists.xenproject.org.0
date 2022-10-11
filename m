Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB645FB156
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 13:18:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419584.664425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDGu-0006O5-IN; Tue, 11 Oct 2022 11:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419584.664425; Tue, 11 Oct 2022 11:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDGu-0006Ix-8e; Tue, 11 Oct 2022 11:18:04 +0000
Received: by outflank-mailman (input) for mailman id 419584;
 Tue, 11 Oct 2022 11:18:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s0xJ=2M=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oiDGs-0005JI-M0
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 11:18:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60066.outbound.protection.outlook.com [40.107.6.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e35e6e0-4956-11ed-8fd0-01056ac49cbb;
 Tue, 11 Oct 2022 13:18:01 +0200 (CEST)
Received: from AM6PR08CA0040.eurprd08.prod.outlook.com (2603:10a6:20b:c0::28)
 by DBAPR08MB5654.eurprd08.prod.outlook.com (2603:10a6:10:1a6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 11:17:58 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::23) by AM6PR08CA0040.outlook.office365.com
 (2603:10a6:20b:c0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Tue, 11 Oct 2022 11:17:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 11:17:57 +0000
Received: ("Tessian outbound 7761be2ecf00:v128");
 Tue, 11 Oct 2022 11:17:57 +0000
Received: from 75c7a65fa408.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D9034031-9535-46F2-AD6A-AE2E5A96FB01.1; 
 Tue, 11 Oct 2022 11:17:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 75c7a65fa408.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 11 Oct 2022 11:17:49 +0000
Received: from AS9PR06CA0763.eurprd06.prod.outlook.com (2603:10a6:20b:484::17)
 by AS2PR08MB8287.eurprd08.prod.outlook.com (2603:10a6:20b:556::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 11:17:48 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:484:cafe::9c) by AS9PR06CA0763.outlook.office365.com
 (2603:10a6:20b:484::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.20 via Frontend
 Transport; Tue, 11 Oct 2022 11:17:48 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 11:17:47 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 11 Oct
 2022 11:17:46 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 11 Oct 2022 11:17:43 +0000
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
X-Inumbo-ID: 5e35e6e0-4956-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EpXIhCCsOUPZNUd7C0KS5Pq+8Q0KW22KuI2ZR0fXg+sXI464Gr+X6s3eY9Z8npF58h8qIBJ8P3nEO7V5RV0qz0eCzpC4cnvJ9Ndrjihksz+abCAPP5hhY4W5eQT/FJ7Rh8Ejceit9z4Hbsz3ta+xR4S5fawigRidznG6N2HFQr+QYffBta66qKDu95CSF7UV65yxj4mcF2FnuiX0JbIINYPL13kHxX8TQ7vGKBqKvV3tI6+maEgM+J0qKL61gKPn1fDZscofw/EBQHpZFE93tYGRZ0bcU0+1bSlYjJ/+Gpp9VHfjPRFppnffsdI9ABgefppB/gj4LXxoc8oWubD+/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2GLMwmhodAy6ZR2vEpQ3koomWaM0KLVXx6V9XMPT4I=;
 b=CqsZhUH7ym+/NWroFJscO4QZBU2x+RSK62Lb7rZ6vuV1z8QQf5TyUQqXdyjGMDN1KI/HmiNiSkQVAyHhJngfYvQADol9/UNbzMquH+sso+M/TGabceyu0aTHET8OZ741PGhXqVh+HISiIOdfwoc0eUb+R8sOsD+HFA4rm+kJp5N5y3blcFfEt7O3w+Y/gUDLGiGgX6EiTXZetkJSP+njDOd9chavaOn8lA7kQyuVGsTjrIShDOIqck7+t4dEQvw01cG6NCgaWOWS3z8ht/AAqzYZhTKAxPAV844Olq6BpNCJEF5xlZSOeU0eQNMkjKiPgECn3IWgvilENp1Hgqgoqg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2GLMwmhodAy6ZR2vEpQ3koomWaM0KLVXx6V9XMPT4I=;
 b=AZiMjepOJzCKjWCxfp1H0x5R/A3mxCtAAJmp4C4m/sakkfdGVRlic+4f+VYWJNeXKJOk7ZMcLpplHFOuahzWVCRo+FOkuPTT0vmCg9JIoajcy3jHQMZ31NCc5pw20h2Y+zo0yu0SvibWw5fV5pJbWlO+wXFgmgzyhnoyIQsIkMg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ee3ca894f3d2594
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vy9ZUbnWOx19vcPbzheCWCmg1Idqy7Dc/uCO6LM0eBo5Ns2TRf2RUv2am9fgS4VHZVk1EeyAPFmQC1zeymucZ6UbiEXwN2X0wiK6JfSAtvAwPm9tBG4rdtGiocqetpDVNbEnD/Qmf6aiMB8m7jWM4HB9p3L+PRjxN3lc0P5JzAWLZuVsj8jBTDX4HuMsHn7HjQ/P6NiXty+u3N/iEof5qLi5TQyNmB0OYLs2DVTo21XFhIPZ4sYOrmLtYIs6nPjYI+xLszOsJHgtE9v8CGYi6Cwwmdq9amKyPGlIvTRE0O3p0hm1iYzTO+Pl2KBvAH3B5tWaP1xJqzbK2UllL/l9pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2GLMwmhodAy6ZR2vEpQ3koomWaM0KLVXx6V9XMPT4I=;
 b=JyyQciqUoGYZE3xI4iGoEZErXG3+6njOZPw8Q9muearZRW/8wXVZMtKVdanMGjFWWdhQOvNS+e3ZrY2wt4Vhd9b/9WdthWPq936/lTUKyXdcZ5/iRPjqQ9nC300MSSQrcsRIQNRwv0GbjwC2G5uMQnYrhs5Q2ghZEu+lFfX/W0fFZzT0Fuz3tyjToCYOFPW2nMqVY21TZRXoeF2q1SdYq8B19gOYfogQaeMKndFlp/Ltik8EGwDSuqapOvcuUtXbdjHiREWnNIOSOGk4ZLyzjyyhVFCWtLup4EyITDUW4zGqJfIXZxRv1DpuDKkwkytABOxI57vmE6sO0CPPHh/kKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2GLMwmhodAy6ZR2vEpQ3koomWaM0KLVXx6V9XMPT4I=;
 b=AZiMjepOJzCKjWCxfp1H0x5R/A3mxCtAAJmp4C4m/sakkfdGVRlic+4f+VYWJNeXKJOk7ZMcLpplHFOuahzWVCRo+FOkuPTT0vmCg9JIoajcy3jHQMZ31NCc5pw20h2Y+zo0yu0SvibWw5fV5pJbWlO+wXFgmgzyhnoyIQsIkMg=
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
Subject: [PATCH v6 6/6] xen: introduce a Kconfig option to configure NUMA nodes number
Date: Tue, 11 Oct 2022 19:17:08 +0800
Message-ID: <20221011111708.1272985-7-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221011111708.1272985-1-wei.chen@arm.com>
References: <20221011111708.1272985-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VE1EUR03FT064:EE_|AS2PR08MB8287:EE_|VE1EUR03FT055:EE_|DBAPR08MB5654:EE_
X-MS-Office365-Filtering-Correlation-Id: 375dc67e-5645-4266-a395-08daab7a3ffb
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ieN/S/xTVUQt2x3L5xfXJFeG42YmcRvmX3i6lmYOl8fr5TI230ulc1iTz+vJKwpC1I3dV+9jjn9uE1S7BVcuT5yh+OHrvwPEIyaHQTtZRkez761WMHIZ7vGb462DyGVUBM75ffbNG44w4Io/5E/HjSu5koVT5kx4bSOc9Vad0+nRHwl7TcCRsdsVq3iVkyNqwnkPiPfrUfaN9wccaM5LTgkbRb0gZqCjuwSZfUMc7Um9JbOLvjQp31sQTT2JyADjWRaRuDScF3kMSBao4Z/hK1D5PGyImu/z2K6rK+zVTT0iGw8KtWjlb4B68oKwt8JU8GwlQAFH0bc9QSpqXWjhPqJ9ETK45/7kDKXyYXeHTzP/GnwTzT0Q9U+S4XXEDusakEZwV6o8Ql1cOHPcREN89j+yoZe30tkrU2WguEBd79YMcJKkZgAD4nhgR1az3GrAi+A74J6tAy8JY1nRISooRfocXR161nlt4V4wwMjjMQBOtMssOuslzFRG9px7YsqRRr4BPyyjPrC2hcz8eYiREPO7FiipgJMAzqeJAwO/FtMWJ9+pzI2WzpwS9QYujW0ONDBoJ+IGWbndU1c7FXLP34+Bo69iqOaY6p4AAcuMCSAZoHONoT+/Tx4Ejrbi+PsLs2Ah5kxAKmPekiuJtP6iHkdoW2YCSDH41H6cD7mqrXUOZjAuJsMGE9H2V0VNlfiE6WWHO56s1jfe0tYoF8kCpSJJjYP89P4NfNv8z1W3zIHehjTH9c+I3o7Z5h/Zgk3YqFE5vIjURG9GuYtHSOt+j/UeO8m+I2TsHgpvxZrB41g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199015)(46966006)(36840700001)(40470700004)(1076003)(2616005)(186003)(44832011)(82310400005)(356005)(2906002)(6666004)(36756003)(4326008)(70206006)(70586007)(8676002)(316002)(478600001)(40460700003)(41300700001)(6916009)(5660300002)(36860700001)(26005)(86362001)(40480700001)(54906003)(336012)(8936002)(426003)(7696005)(47076005)(82740400003)(83380400001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8287
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	25bfa2e3-3974-4acf-eccc-08daab7a3a37
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3wnGOjiS5wwh3hZCKpKkt8qpcnWMHB+wTYR5GPScuAWtB3KHGE+u5jC3EdlqykMLwpXbSYzpaEtMAcPhSh81laTFJ7RB/SO9LRoQHZFI2AP6fXWhn8uYulzfmWAmWw7ly3727Z4YQo23JtEPjkMz3drJApOFJlwEzxDplUHtkNfwbOLWOwXc9CBHL1bUQnoD4yA0vw5E+zoh42m4RhPj2mQUt98ID3xQMYjDnJVETO4jG9vlpb6aYXp9SYBdwHgIUYpbj2c3HOrVojqjyAwhe/AOVr6StW4KWPcXYFxemetMGCgRfmWkOrsU50mUj+v7cWjMpjM6p1SBwziovMtu/gPDIAnyklppVEb8A+eCB3Qj3HOW7F2iyWZPi0EBTRhge40BiY5onddZ9prf5nJax6m9KTSbBs4A8x/uBTB9LFpa5NsA5uYt+WrFeuDiiDDsHiq0IFq6I66xaBUamsKAqrrSXqzMSAqIqss3/xUo5agG+RzJUuIGjyYANG9vPG6CIgWI+CNj/osT0dM55w3nOyRI9S59VLCDPWl7xRH0EJ/4pkiPsk0Urz6MHu6lC3ine8+v7dXvWHVOZ/1+XU8H32B/9oqFFBF3Z0fd+YUMPxRuRws5MZ2gH7+hwLiSZaYcsmpVqhWca19EU5QDNeILqQUy9g4v3NML4KpA/CM0nbxjG25ei7r+/DVW9IOENf6Fk4ZbMXihypdsFrnybqotMst0DJUbLJno6uNpA+hKxIpihPzWd9ZPJnlWRCEXwnbEBvjk6u6D1yaaSyEKacSR0Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39850400004)(451199015)(46966006)(40470700004)(36840700001)(40460700003)(1076003)(4326008)(2906002)(41300700001)(8676002)(2616005)(186003)(70206006)(86362001)(426003)(83380400001)(70586007)(47076005)(36756003)(8936002)(44832011)(336012)(5660300002)(6666004)(82740400003)(107886003)(7696005)(40480700001)(82310400005)(478600001)(81166007)(316002)(6916009)(54906003)(26005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 11:17:57.3059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 375dc67e-5645-4266-a395-08daab7a3ffb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5654

Currently the maximum number of NUMA nodes is a hardcoded value.
This provides little flexibility unless changing the code.

Introduce a new Kconfig option to change the maximum number of
NUMA nodes conveniently. Also considering that not all
architectures support NUMA, this Kconfig option is only visible
on NUMA enabled architectures. Architectures not supporting NUMA
still use 1 for MAX_NUMNODES.

As NODES_SHIFT is currently unused, we're taking this
opportunity to remove it.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v5 -> v6:
1. No change.
v4 -> v5:
1. No change.
v3 -> v4:
1. Update the commit log to follow Jan's suggestion.
2. Add Ack-by.
v2 -> v3:
1. Fix indent.
2. Use 2-64 for node range.
v1 -> v2:
1. Add NODES_SHIFT remove message in commit log
2. Change NR_NUMA_NODES upper bound from 4095 to 255.
---
 xen/arch/Kconfig                | 11 +++++++++++
 xen/arch/x86/include/asm/numa.h |  2 --
 xen/include/xen/numa.h          | 11 ++++++-----
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index f16eb0df43..7028f7b74f 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -17,3 +17,14 @@ config NR_CPUS
 	  For CPU cores which support Simultaneous Multi-Threading or similar
 	  technologies, this the number of logical threads which Xen will
 	  support.
+
+config NR_NUMA_NODES
+	int "Maximum number of NUMA nodes supported"
+	range 2 64
+	default "64"
+	depends on NUMA
+	help
+	  Controls the build-time size of various arrays and bitmaps
+	  associated with multiple-nodes management. It is the upper bound of
+	  the number of NUMA nodes that the scheduler, memory allocation and
+	  other NUMA-aware components can handle.
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 2ca3475271..7866afa408 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -3,8 +3,6 @@
 
 #include <xen/cpumask.h>
 
-#define NODES_SHIFT 6
-
 typedef u8 nodeid_t;
 
 extern int srat_rev;
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 04ecaf7769..71a5f837b3 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -3,14 +3,15 @@
 
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
+
 #define NR_NODE_MEMBLKS (MAX_NUMNODES * 2)
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
-- 
2.25.1


