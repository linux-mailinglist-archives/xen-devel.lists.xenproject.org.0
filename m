Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C75A5BE185
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 11:13:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409247.652228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaZJE-0003tD-7r; Tue, 20 Sep 2022 09:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409247.652228; Tue, 20 Sep 2022 09:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaZJE-0003rO-4o; Tue, 20 Sep 2022 09:12:52 +0000
Received: by outflank-mailman (input) for mailman id 409247;
 Tue, 20 Sep 2022 09:12:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UnT0=ZX=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oaZJC-0003bf-MF
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 09:12:50 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2040.outbound.protection.outlook.com [40.107.105.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 655539cd-38c4-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 11:12:48 +0200 (CEST)
Received: from DU2PR04CA0185.eurprd04.prod.outlook.com (2603:10a6:10:28d::10)
 by PA4PR08MB7433.eurprd08.prod.outlook.com (2603:10a6:102:2a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 09:12:46 +0000
Received: from DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::ea) by DU2PR04CA0185.outlook.office365.com
 (2603:10a6:10:28d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT055.mail.protection.outlook.com (100.127.142.171) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 09:12:46 +0000
Received: ("Tessian outbound ee41cdb23966:v124");
 Tue, 20 Sep 2022 09:12:46 +0000
Received: from 244930ccd1a4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1835DC30-937D-46C0-9630-9D41BD00306B.1; 
 Tue, 20 Sep 2022 09:12:39 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 244930ccd1a4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Sep 2022 09:12:39 +0000
Received: from FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a8::16)
 by AS8PR08MB6424.eurprd08.prod.outlook.com (2603:10a6:20b:33e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 09:12:36 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a8:cafe::99) by FR0P281CA0114.outlook.office365.com
 (2603:10a6:d10:a8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:35 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 09:12:35 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.9; Tue, 20 Sep
 2022 09:12:33 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.9; Tue, 20
 Sep 2022 09:12:33 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:31 +0000
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
X-Inumbo-ID: 655539cd-38c4-11ed-bad8-01ff208a15ba
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IrTAPHQcAd5CQ4FF1illZ61LXDueAK0qmS2pulzx8B5dJy5jROR6pvYNkb0U1GZfIxBYrfmlKpEHvP/bpl/XVI+J+qkewwQBNntOpP7cVma6bq5ieGavoTliadmzAWhOxgqODBvfT7E9iRZ+YqgBMaffhTSd2wWZesqVDTm/lm7ud610AvIMhKeUGt42uPfYSqLPnKHBt9VGo+l2kN7WfyiruJC0GRRWONTLe3Y7+/Ergz+EE2QTyaodUiXAI2azG2teQF3quPxO2E7A9Rt6JU05iCPWVy6QktZB8XXDBuyHQHWAN0Uh31MM1vywpotAMOIf0EFkxCUwThyoEDyccw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0t10+tfC/hnKAURkjOBssSzDdn/WYZUVAtw/3h0wBe4=;
 b=A2ssQBg8p4QZZfYcMRnwlHnG7V0Ra0OV05ANs5RMuUBrxIdzI81O+fJ+LqcUPFGmbJ1/1uZeYLordES4x4iAWNPU0idjwRCbEzuK0GUX3m89FYoQXHPstpymQ7A3Ab/G1pPqq3ROAtPmY1aTNl1ZxmVvDaYWCnIem1VURQTqsDUsaiEwpJnWXD1bx2dj673GbwCGR/a2xersWLLpTX33gp/9Kis/ImZEm+mct5uD2PcyANq6G69F/PIhqARGcCzmR/T4OK6E6CoZFsxPaiD+/7mPCoYoJ3APYf7q6jzMER1ZB8PtyAhC82W3+urHKQg0jb6ow1YEBHZyr+Wk3POCmg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0t10+tfC/hnKAURkjOBssSzDdn/WYZUVAtw/3h0wBe4=;
 b=eSF1N13cvz5qYGEKqJHvdvYHo8ca8VSSU3k0DsQKUye5q6xWO2qO1RdC3Dvdylh3NXO/nUYaRGvOd9/YOZn1XK/P40LIw/BYELaRcieZ0RrP1BwU6Fjx4UqX+pQG4mRrO7hjXmwwe/aTMh5v8bmKwGW9BQL7ZtkVT044MmFMZm4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9d62e5de3abef816
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8+XAe3ip8R/yaxBVnGM3VJL03TcQ0aAnjCNZ3sMZ4GqLCSwHA08Uh9CJZ6pQvmIMj0ZWEYS36j2OED5FVwtaXcWpYtGxdGEyHPTkPuqRLf0azOjmlhdKKBg85NiysfYAj1HfPbGlEkpGiOx/6k46VjO5MPlc8v/mVSd8xDExQbeFmx7e3cNTg8DxPvK7xQZMiIPTF13i9/oGZLwwciMd8u0zusxOwCg1/LuL8fYFCFb0+10hND989T0n1UdF+5Um9bP5RmBJXbpeHh+N+6egr3o/FQk0Fgf69rOJ1759Ty8S2pfv4DUfVujIfZ19+hj2ZO/nWviz+UNk4xNmb0y/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0t10+tfC/hnKAURkjOBssSzDdn/WYZUVAtw/3h0wBe4=;
 b=ij/CWHRwkXE9OhA1ZVFlgx/97KfFyAHSyP+MQ6/Y0fEVfgzRELJ7gU1Wpw1EwW6cX9YENbJPODJFkM93aFnmuIW+bTtt9nA3B2AAbjdoHPk0pab9olqRRPYo0QO4sEQgQtQfuVaQuaLYzWatQh2g/cxS2RzhRCKrOld2QreQ1HjKfwGXEm267KFxO+RudCDWjQM/vlhFBeSwtocwQGsXfY857HTy0CWqchlpqVmZaFBx41N2d8T4IGBnBarnloj+tTsucxxfOhg9sQYjtPpXGU66tigSlZEGNLJEdK3f5W1MPI8GQ9v5YXbTQlg8O2K+W8T22tXKvLEJVh+YEmn1yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0t10+tfC/hnKAURkjOBssSzDdn/WYZUVAtw/3h0wBe4=;
 b=eSF1N13cvz5qYGEKqJHvdvYHo8ca8VSSU3k0DsQKUye5q6xWO2qO1RdC3Dvdylh3NXO/nUYaRGvOd9/YOZn1XK/P40LIw/BYELaRcieZ0RrP1BwU6Fjx4UqX+pQG4mRrO7hjXmwwe/aTMh5v8bmKwGW9BQL7ZtkVT044MmFMZm4=
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
	<wl@xen.org>
Subject: [PATCH v5 1/6] xen/x86: Provide helpers for common code to access acpi_numa
Date: Tue, 20 Sep 2022 17:12:13 +0800
Message-ID: <20220920091218.1208658-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920091218.1208658-1-wei.chen@arm.com>
References: <20220920091218.1208658-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VE1EUR03FT052:EE_|AS8PR08MB6424:EE_|DBAEUR03FT055:EE_|PA4PR08MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c8de36-b277-49f4-5e2e-08da9ae84844
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0RXJik4DxR/GELlw+dHTzcnYwuDU21h7UOR+juU0dq7K6cEZGixFJbNnGgKdgsKTaw0+E+r68AEP6+erF2FTDAt4cvyyV8u1p4rDR4JBXIdZo36xD/x3Gcbsj6FTulhrY1VB2tfB3wh9JUmhl2WvHm7ge8G//mq/nFZF3g29JemjIgoW2QfKUCEOL27RBYDOy1NN65tBDiIBPS8LIocrCArxq6phDg3IugCJEwvbw27fD3Jcy7BwPzAXI0Pf6Z5MlKkIpP6or7HKGpKkHso+sXd7YLu5IhH8pONbZjBbjjPsJOOniLbbr9s4g59YgI5UIcuImRzyQnHsM9h1YA+3Fx0VFVBlD/7j9QSELQkfri/vvmRdKR+HwKLlYLVq5V4+gFVMp2rBYP32mEC3XwYOKvNDVgoVqRNjOQN7gn37oE1CevjXyXz1lbulwg8Pn0MPZy79ysPX4MME8ONcGKrVHnCWuG9mpb7DDX1YTBtE4x69MbHo5oIp/LExef7Z9L2wGDeZj4tiSomNyIx7T8B7tfgxn9TCV8Vh+y0KlccLKvX0lAfdKf3b0nECF2H0uZJC0YvwGYfq/3mI7alvxISHiQK4icgUfbcvNCtst1fhlzEzHRNZp2lWCQvL008M41eyIEmLcFcmyi3FqkjTselVBOHRMuAainASeLzZ5LmBoP08QmTBiXJhMMguycVvPt792D3mSM0jnL7tPG4qEkuvlTlQvDpIuBc0IIBvfYf727cZcBnEHmbJ9pHQE0+JzCgnoOUBFMBUdJDbEo0BFi8BzcTtPodQhG2pFvsZZVlbe0RsfZsqxwF+9gjvMlQToZzK
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(40480700001)(2906002)(44832011)(36756003)(54906003)(316002)(426003)(36860700001)(8676002)(47076005)(82740400003)(4326008)(5660300002)(82310400005)(70206006)(70586007)(6916009)(8936002)(86362001)(336012)(1076003)(186003)(81166007)(478600001)(2616005)(26005)(356005)(41300700001)(6666004)(83380400001)(40460700003)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6424
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8d1aca7f-1415-4bbc-8e9d-08da9ae841e0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lqbwGxiKHcxYISfWYnPKvuBEgbxCqiILS1oiLxXXyEEi8VlHYEtnQbClWhRNDT9eW6OlAi5lPrTY21rZhYSZbkDJzpZHU29z1ZKLtHCtpPlAu0xmCsdUTSD3Z7ixhKclIrgCofSkoNncktUgVAhjXgO4oTRjSxKfzBpg4fhiSeK/AZdFQpCqXjGPB+/y2dPspoJPc7BZ7hfCuDbhy1iKqRmo1UJfhdY5MdO9KWqmXzDNFvRS3VyRRarLzIB5XVQHA0a9MNetk05diuuxnqelm4vS2Clk/0FwebBwmdqyMiifrBrtHCY/uzkOIA5ZToM175Z/ZwBTNiooDsUfOeSNt7hfUVoTE7fT17e92xK1n0b68nl1ZIl9fcmbatof5XrGyVCEkpSVaHUTgTqkod7hw5Hgmvn9rcSPJgTsHW3KI2zbc8IL7WhSbum25mQpKnimuFiLucSSe/GLQHYMwDOWaXaZn4uqP28ZSDLSPxfPWYtlgmBQMkmvkiGnxU1CqVA3Pw+1p9MltOKw2XmimQyZpYBbB3fYRl0sQjqcMYtaGZPTPGkY3B7E6p+dKWI6KiXVz6ApdMY7DLkKjTaoE/shf0XYvVD1ieGV+13wApi3JHAwmdsFR8JTBnpvudpnFNVGj2yxjq9S4za8dQC2R0gKcfZrNCM8GYRSsieqqAobYgs6KKGUYQ3prCta0DeJPA6x/9eVVKkwOqX4g8bOkOJ2U8VMmH044HYhJDElE1pC2JzqUXZ9iMnGp7BVeHI4KHwtxhHvY9O8DdEaF6BAKGbgwQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199015)(40470700004)(36840700001)(46966006)(6666004)(44832011)(2906002)(5660300002)(8936002)(86362001)(4326008)(70206006)(40480700001)(8676002)(70586007)(81166007)(6916009)(54906003)(316002)(82310400005)(478600001)(336012)(47076005)(1076003)(41300700001)(40460700003)(7696005)(36756003)(82740400003)(186003)(426003)(83380400001)(26005)(2616005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 09:12:46.1720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c8de36-b277-49f4-5e2e-08da9ae84844
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7433

acpi_numa is a specific NUMA switch for ACPI NUMA implementation.
Other NUMA implementation may not need this switch. But this switch is
not only used by ACPI code, it is also used directly in some general
NUMA logic code. So far this hasn't caused any problem because Xen only
has x86 implementing ACPI NUMA, but now Arm is implementing device tree
based NUMA. Accesssing acpi_numa directly in some functions will be a
block of reusing NUMA common code. It is also difficult for us to replace
it with a new generic switch, because it is hard to prove that the new
switch states can guarantee the original code will work correctly.

So in this patch, we provide two helpers for common code to update and
get states of acpi_numa. And other new NUMA implementations just need
to provide the same helpers for common code. In this case, the generic
NUMA logic code can be reused by all NUMA implementations.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v4 -> v5:
1. Use arch_numa_broken instead of arch_numa_disabled for
   acpi_numa < 0 check. Because arch_numa_disabled might
   include acpi_numa < 0 (init failed) and acpi_numa == 0
   (no data or data no init) cases.
v3 -> v4:
1. Drop parameter from arch_numa_disabled, the parameter will be
   introduced in later patch where use it.
2. Drop unnecessary "else" from arch_numa_setup, and fix its
   indentation.
v2 -> v3:
1. Drop enumeration of numa status.
2. Use helpers to get/update acpi_numa.
3. Insert spaces among parameters of strncmp in numa_setup.
v1 -> v2:
1. Remove fw_numa.
2. Use enumeration to replace numa_off and acpi_numa.
3. Correct return value of srat_disabled.
4. Introduce numa_enabled_with_firmware.
---
 xen/arch/x86/include/asm/numa.h |  5 +++--
 xen/arch/x86/numa.c             | 38 ++++++++++++++++++++++-----------
 2 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index c32ccffde3..529efadf93 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -32,8 +32,9 @@ extern void numa_add_cpu(int cpu);
 extern void numa_init_array(void);
 extern bool numa_off;
 
-
-extern int srat_disabled(void);
+extern int arch_numa_setup(const char *opt);
+extern bool arch_numa_broken(void);
+extern bool srat_disabled(void);
 extern void numa_set_node(int cpu, nodeid_t node);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 627ae8aa95..1ab37b9c19 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -50,9 +50,28 @@ nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 bool numa_off;
 s8 acpi_numa = 0;
 
-int srat_disabled(void)
+int __init arch_numa_setup(const char *opt)
 {
-    return numa_off || acpi_numa < 0;
+#ifdef CONFIG_ACPI_NUMA
+    if ( !strncmp(opt, "noacpi", 6) )
+    {
+        numa_off = false;
+        acpi_numa = -1;
+        return 0;
+    }
+#endif
+
+    return -EINVAL;
+}
+
+bool arch_numa_broken(void)
+{
+    return acpi_numa < 0;
+}
+
+bool srat_disabled(void)
+{
+    return numa_off || arch_numa_broken();
 }
 
 /*
@@ -291,28 +310,21 @@ void numa_set_node(int cpu, nodeid_t node)
 /* [numa=off] */
 static int __init cf_check numa_setup(const char *opt)
 {
-    if ( !strncmp(opt,"off",3) )
+    if ( !strncmp(opt, "off", 3) )
         numa_off = true;
-    else if ( !strncmp(opt,"on",2) )
+    else if ( !strncmp(opt, "on", 2) )
         numa_off = false;
 #ifdef CONFIG_NUMA_EMU
     else if ( !strncmp(opt, "fake=", 5) )
     {
         numa_off = false;
-        numa_fake = simple_strtoul(opt+5,NULL,0);
+        numa_fake = simple_strtoul(opt + 5, NULL, 0);
         if ( numa_fake >= MAX_NUMNODES )
             numa_fake = MAX_NUMNODES;
     }
-#endif
-#ifdef CONFIG_ACPI_NUMA
-    else if ( !strncmp(opt,"noacpi",6) )
-    {
-        numa_off = false;
-        acpi_numa = -1;
-    }
 #endif
     else
-        return -EINVAL;
+        return arch_numa_setup(opt);
 
     return 0;
 } 
-- 
2.25.1


