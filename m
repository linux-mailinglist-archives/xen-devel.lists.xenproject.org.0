Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D96C53098A
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 08:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335369.559595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1WU-0002eG-Ip; Mon, 23 May 2022 06:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335369.559595; Mon, 23 May 2022 06:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1WU-0002YR-Bj; Mon, 23 May 2022 06:26:34 +0000
Received: by outflank-mailman (input) for mailman id 335369;
 Mon, 23 May 2022 06:26:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eb4B=V7=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nt1WS-0008Q2-E0
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 06:26:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48c0547f-da61-11ec-bd2c-47488cf2e6aa;
 Mon, 23 May 2022 08:26:31 +0200 (CEST)
Received: from AS9PR06CA0213.eurprd06.prod.outlook.com (2603:10a6:20b:45e::12)
 by VI1PR08MB4144.eurprd08.prod.outlook.com (2603:10a6:803:e2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 06:26:27 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::b1) by AS9PR06CA0213.outlook.office365.com
 (2603:10a6:20b:45e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Mon, 23 May 2022 06:26:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 06:26:26 +0000
Received: ("Tessian outbound 3314dea8c23c:v119");
 Mon, 23 May 2022 06:26:26 +0000
Received: from a5a1382e5d4a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 153250D8-CC9C-45D7-970F-CCD81DEDCAA7.1; 
 Mon, 23 May 2022 06:26:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a5a1382e5d4a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 May 2022 06:26:19 +0000
Received: from DB3PR08CA0019.eurprd08.prod.outlook.com (2603:10a6:8::32) by
 DB8PR08MB5193.eurprd08.prod.outlook.com (2603:10a6:10:e6::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.19; Mon, 23 May 2022 06:26:11 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::a2) by DB3PR08CA0019.outlook.office365.com
 (2603:10a6:8::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15 via Frontend
 Transport; Mon, 23 May 2022 06:26:11 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 06:26:10 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 23 May
 2022 06:26:10 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 23 May 2022 06:26:07 +0000
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
X-Inumbo-ID: 48c0547f-da61-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=W6U93C3iqDqKgWwNjzaPS7oz/qfdWlCdm36MVBXIRIK9DPf/RZi1PYJ8Wq1uVOOVfh2v27dAz55hTErbnBG9RYP6Mw8iiLqPLGOpbN82KMWnmz9TDSi1lw327/FjIkh/fjh7fxfNPkKgcsrFy0mChxXQl3lg5WNOLf+5509R1PprK09x1ZD7GQ2LXpo/f6T85OKO3Uge27VNtVbO7JCvBAv/gcehgOIb45fZDJ82wyMsdCO0zrdX2v7iaJ+Cj3CppSt07VhJADrae7x60LOUbzhREueTOf9i1+5K2j3tS00SDXlTH2fcET1uuxuwahKaw6IjazM6IdYTNfbFFt+f3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+0l6aEvx/DTIL60yMCTuk7IatOAWAYvcrFcxcdYsBY=;
 b=dJTN3zW08Kze9SrSFUe/zLkwO/gYpFgOXQeLHV8BP5Q9ejIs4Eoi9VOk5Sofj/BM1cZ/7MLLham2l6PbzPI227JQFe3CKB2Mid4R+NLNUSMlG6H5lkqgEk1PT1MDUOsFrmzjM0hN1EO2u+FTXd2GQ+MmJymhmrMoO3xh8Xs+E45qR5kcVykqJSaFLUg35Q/FsWx0nyDbiSNmG/MlwarENlW8yKATPjrCu+6IZRX761H/T5gtC092qnyRYZLiWUiaAtjudhRglWsjSBj5oKZPAwDNkP2koRFat4AG8dU+Qbc28malPeD3MFMrlZbOiVYqzQM4O7Q8XPeRNnjB+PPYwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+0l6aEvx/DTIL60yMCTuk7IatOAWAYvcrFcxcdYsBY=;
 b=Fqrh7eOvFNqtq9REfZ6ZU47LvfGm75/1YRCS1qti3uQGoQUD8sFOoOk691y8dh3ZTAUooOHuULkAoySUzOXPn3oxh50beQrKwxVhpJNM8VWKaeIlOwiRdvMaVXPx7WDqF9LQoIHbTUKZHX0fQKUWht8pDorFaBSmItaJ5yAIS9g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 34b6f2de4d519696
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFmI2/1rpqQLiZs7vkmXz5FNmlvBsh7XI1cpACZFKLfpTI00M0+3/FbUwq0WGlRUVNDEsQB9FlVkn8nXvhwfKUZ80VbM6d2VaXrML46DckOZbgG5rZbGQrLzl2Gxrrb6g+ZU/pW+SqSoSm2STjI0e0u++eOs3f0mBbQqzT281KaDB7Rn7WAlQ1Nf9pfwE77emClK5mL4ERBhrorRd+K8UsKBspvoUGseZqLCROd3nXVohvCyhslj18VCHaBZBBaDDl4GKP3BRnFH/kLLeUqoApotElESrFEBUabsV3ec0aJy6SDZ2GfETA0Uy0MuKgDQfECRwiIRCQHeUowKjIARJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+0l6aEvx/DTIL60yMCTuk7IatOAWAYvcrFcxcdYsBY=;
 b=Tql3jfskXYQ8KGYCpvdi8vDJd+W8mboMkY4DM34UlkfxFIsu2gwABncl1CcJtfUMFM2J2Xhm95n3wsYRSu4YrhbiYuCxWE9PFMXw/dDNs3YLYkL6kCraYCpmCZw841W3Kf0Dmy0Yl4mW7el9EzDp1Zswst/LAnK2/YZNwJhYLJtbk/qHedha22DzCKGtKJGYYkxuq6m8kLBywzpmHtXOJHGlEbIcaENuIlvKdi7SxcuBehVEFFyBO3ZdOB54X2knkItt2DbKdvFw4dcaoeptDKqwf/50rhQA6amU6qs12NxRUTghn/PJjV41uMxHx5pOzaC4RcEBNWRWwDGyD3bUGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+0l6aEvx/DTIL60yMCTuk7IatOAWAYvcrFcxcdYsBY=;
 b=Fqrh7eOvFNqtq9REfZ6ZU47LvfGm75/1YRCS1qti3uQGoQUD8sFOoOk691y8dh3ZTAUooOHuULkAoySUzOXPn3oxh50beQrKwxVhpJNM8VWKaeIlOwiRdvMaVXPx7WDqF9LQoIHbTUKZHX0fQKUWht8pDorFaBSmItaJ5yAIS9g=
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
	<wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v4 7/8] xen/x86: add detection of memory interleaves for different nodes
Date: Mon, 23 May 2022 14:25:24 +0800
Message-ID: <20220523062525.2504290-8-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523062525.2504290-1-wei.chen@arm.com>
References: <20220523062525.2504290-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 61b5c1e2-c789-4f87-f12b-08da3c852a5a
X-MS-TrafficTypeDiagnostic:
	DB8PR08MB5193:EE_|AM5EUR03FT030:EE_|VI1PR08MB4144:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4144246F7DCE138A397F0F049ED49@VI1PR08MB4144.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EfCIdYz6JRxum8gInCmgE0/QSQ685/890se25ATAhJR1rEsMcG86Q14VjE+5HeJl+ESgXTk/D6N0/9mZafIoYFwvlR9vM83n+eABnnQfBtT5G/HwENs7IFCb97ihp4S4qeJ4ZopDy3AlSxcJUxSO6D1FQtssvu5u4s1HBGKIstf3uXBISctQxcM+ZTPkO5BZDIPI2tYc2jeJHlRpqul1AJvpFDnOnTYCXR1u5mde8MlGqAe55pNnEDxCeMF7XJlFwDfQ2G5g0cklA8243lhymkFzCUZbYyS+m5Ihjr/swqrW1YgvPsg7g6wZCaZnPjccdEI3M7Yl5JDEY1e3WR6PqGox9rRxb/VRG3zStW8XgAOeXcekEpHxOdrDGA1APiQ7VchRb9sI8cBsU2SvtWxWQqJmpNjMK7oZVM7iinSR4bm/Am3GJi1vAIQH9GZZZnAJ1TENYQg15CgM7FmgOH3Mz00qIJlLksy497/wpjFcs3fZz6HqC7YD7PO34yJjvMNJguWH82ENm8qJNTbWXDCmzfiQDnVkFANljC24iru7hC3uHUcJsxB1G7xoK5aTqkQ335QuXDZJp18pdWDNJO5V8j1YKiGUk341HNRkA6070wBweiUbUFJiNb+3GihbNNv5Zqi+pCiwtyzEAsRDYFYdKOXNvEKU6G5ssAaxdPRQ5teQen8AF61WjMBQHSlxEzzQzuvxauG87HPhPnadcZKH8Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(5660300002)(36756003)(356005)(508600001)(7696005)(6666004)(54906003)(26005)(44832011)(40460700003)(81166007)(316002)(70586007)(70206006)(4326008)(8676002)(6916009)(8936002)(82310400005)(426003)(336012)(186003)(47076005)(2906002)(36860700001)(86362001)(83380400001)(2616005)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5193
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	68ea353d-2482-48a3-f06d-08da3c852117
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	81nemQxR9m2B27sh7Cp0st257eeFLIZ9upT5PMyutlvWk7RTVt3PKlrHfhTmVN0W6LElJsVGAKy7K/g/N0nEmwHyYtucsWAttjFry9f/2lGb7vbcd013d/t3LwEmSvG/uTsomYk7kv3fJFCOGyOGYHQDWSmcGvEjo0Gz0VtFf+RUTxPl88rCKF4F4m3Co2oDA6FM6umHjCj8xfSx2CUb8thwad75/mCtRuzsyyzWO7ELkDHcfK7Qx5dODW+Nx3YyrvUx8nlAk3Kzy/pmUpmi4HUoTxBtl/zQZbheHngZagbY4ZK5KHySPQYwaUhz+ZLceUU2z07B1lRgyTU+oerntQuooW6l0Xj9DPJ8m+4Hfa8o/RGTIvu5JMMx4LKgEr3UEs1y+8vxIf9gV2eBEgOFAqAWoHIFB+BsBeMut9/vVcFvjF8zgVAM+ijJCbF5kepLTzAbxb4jHp482MXy1usOiPJjCX8rSixdJQUUG+8sZ5dQFJcLLIf6r0QuzcaQotFddQnyOMrjQf1NtetI6nMGex5EE4jT6mPOQwTd3zB5Fs81PQDL7rjKu02u3hX9HVIK3pkv5KoZIsKoxIdidgJ4G9ueExFDGPJ7pYmmyJz3wsIiCWVA/oS0K6SuhWGLzwTPVwPIlbaicLYaCbBxR0fnRA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(26005)(186003)(81166007)(7696005)(47076005)(36860700001)(8936002)(426003)(6666004)(2616005)(2906002)(36756003)(1076003)(44832011)(5660300002)(336012)(316002)(82310400005)(83380400001)(4326008)(70586007)(70206006)(508600001)(86362001)(8676002)(54906003)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 06:26:26.4641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b5c1e2-c789-4f87-f12b-08da3c852a5a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4144

One NUMA node may contain several memory blocks. In current Xen
code, Xen will maintain a node memory range for each node to cover
all its memory blocks. But here comes the problem, in the gap of
one node's two memory blocks, if there are some memory blocks don't
belong to this node (remote memory blocks). This node's memory range
will be expanded to cover these remote memory blocks.

One node's memory range contains other nodes' memory, this is
obviously not very reasonable. This means current NUMA code only
can support node has no interleaved memory blocks. However, on a
physical machine, the addresses of multiple nodes can be interleaved.

So in this patch, we add code to detect memory interleaves of
different nodes. NUMA initialization will be failed and error
messages will be printed when Xen detect such hardware configuration.

Change-Id: Ia7ff9a9128ecbe3eb4dddd1307ae8fbe65575ccf
Issue-Id: SCM-2240
Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
---
v3 -> v4:
1. Drop "ERR" prefix for enumeration, and remove init value.
2. Use "switch case" for enumeration, and add "default:"
3. Use "PXM" in log messages.
4. Use unsigned int for node memory block id.
5. Fix some code-style comments.
6. Use "nd->end" in node range expansion check.
v2 -> v3:
1. Merge the check code from a separate function to
   conflicting_memblks. This will reduce the loop
   times of node memory blocks.
2. Use an enumeration to indicate conflict check status.
3. Use a pointer to get conflict memory block id.
v1 -> v2:
1. Update the description to say we're after is no memory
   interleaves of different nodes.
2. Only update node range when it passes the interleave check.
3. Don't use full upper-case for "node".
---
 xen/arch/x86/srat.c | 132 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 101 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 8ffe43bdfe..a831df7648 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -42,6 +42,12 @@ static struct node node_memblk_range[NR_NODE_MEMBLKS];
 static nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
 static __initdata DECLARE_BITMAP(memblk_hotplug, NR_NODE_MEMBLKS);
 
+enum conflicts {
+	NO_CONFLICT,
+	OVERLAP,
+	INTERLEAVE,
+};
+
 static inline bool node_found(unsigned idx, unsigned pxm)
 {
 	return ((pxm2node[idx].pxm == pxm) &&
@@ -119,20 +125,45 @@ int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
 	return 0;
 }
 
-static __init int conflicting_memblks(paddr_t start, paddr_t end)
+static
+enum conflicts __init conflicting_memblks(nodeid_t nid, paddr_t start,
+					  paddr_t end, paddr_t nd_start,
+					  paddr_t nd_end, unsigned int *mblkid)
 {
-	int i;
+	unsigned int i;
 
+	/*
+	 * Scan all recorded nodes' memory blocks to check conflicts:
+	 * Overlap or interleave.
+	 */
 	for (i = 0; i < num_node_memblks; i++) {
 		struct node *nd = &node_memblk_range[i];
+
+		*mblkid = i;
+
+		/* Skip 0 bytes node memory block. */
 		if (nd->start == nd->end)
 			continue;
+		/*
+		 * Use memblk range to check memblk overlaps, include the
+		 * self-overlap case.
+		 */
 		if (nd->end > start && nd->start < end)
-			return i;
+			return OVERLAP;
 		if (nd->end == end && nd->start == start)
-			return i;
+			return OVERLAP;
+		/*
+		 * Use node memory range to check whether new range contains
+		 * memory from other nodes - interleave check. We just need
+		 * to check full contains situation. Because overlaps have
+		 * been checked above.
+		 */
+	        if (nid != memblk_nodeid[i] &&
+		    (nd_start < nd->start && nd->end < nd_end))
+			return INTERLEAVE;
 	}
-	return -1;
+
+	return NO_CONFLICT;
 }
 
 static __init void cutoff_node(int i, paddr_t start, paddr_t end)
@@ -275,10 +306,13 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 {
+	enum conflicts status;
+	struct node *nd;
+	paddr_t nd_start, nd_end;
 	paddr_t start, end;
 	unsigned pxm;
 	nodeid_t node;
-	int i;
+	unsigned int i;
 
 	if (srat_disabled())
 		return;
@@ -310,42 +344,78 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		bad_srat();
 		return;
 	}
+
+	/*
+	 * For the node that already has some memory blocks, we will
+	 * expand the node memory range temporarily to check memory
+	 * interleaves with other nodes. We will not use this node
+	 * temp memory range to check overlaps, because it will mask
+	 * the overlaps in same node.
+	 *
+	 * Node with 0 bytes memory doesn't need this expandsion.
+	 */
+	nd_start = start;
+	nd_end = end;
+	nd = &nodes[node];
+	if (nd->start != nd->end) {
+		if (nd_start > nd->start)
+			nd_start = nd->start;
+
+		if (nd_end < nd->end)
+			nd_end = nd->end;
+	}
+
 	/* It is fine to add this area to the nodes data it will be used later*/
-	i = conflicting_memblks(start, end);
-	if (i < 0)
-		/* everything fine */;
-	else if (memblk_nodeid[i] == node) {
-		bool mismatch = !(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
-		                !test_bit(i, memblk_hotplug);
-
-		printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
-		       mismatch ? KERN_ERR : KERN_WARNING, pxm, start, end,
-		       node_memblk_range[i].start, node_memblk_range[i].end);
-		if (mismatch) {
+	status = conflicting_memblks(node, start, end, nd_start, nd_end, &i);
+	switch(status)
+	{
+	case OVERLAP:
+	{
+		if (memblk_nodeid[i] == node) {
+			bool mismatch = !(ma->flags &
+					  ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
+			                !test_bit(i, memblk_hotplug);
+
+			printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
+			       mismatch ? KERN_ERR : KERN_WARNING, pxm, start,
+			       end, node_memblk_range[i].start,
+			       node_memblk_range[i].end);
+			if (mismatch) {
+				bad_srat();
+				return;
+			}
+			break;
+		} else {
+			printk(KERN_ERR
+			       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
+			       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
+			       node_memblk_range[i].start,
+			       node_memblk_range[i].end);
 			bad_srat();
 			return;
 		}
-	} else {
+	}
+
+	case INTERLEAVE:
+	{
 		printk(KERN_ERR
-		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
-		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
+		       "SRAT： PXM %u: (%"PRIpaddr"-%"PRIpaddr") interleaves with PXM %u memblk (%"PRIpaddr"-%"PRIpaddr")\n",
+		       node, nd_start, nd_end, node_to_pxm(memblk_nodeid[i]),
 		       node_memblk_range[i].start, node_memblk_range[i].end);
 		bad_srat();
 		return;
 	}
-	if (!(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE)) {
-		struct node *nd = &nodes[node];
 
-		if (!node_test_and_set(node, memory_nodes_parsed)) {
-			nd->start = start;
-			nd->end = end;
-		} else {
-			if (start < nd->start)
-				nd->start = start;
-			if (nd->end < end)
-				nd->end = end;
-		}
+	default:
+		break;
+	}
+
+	if (!(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE)) {
+		node_set(node, memory_nodes_parsed);
+		nd->start = nd_start;
+		nd->end = nd_end;
 	}
+
 	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
 	       node, pxm, start, end,
 	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
-- 
2.25.1


