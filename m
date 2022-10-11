Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEEF5FB151
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 13:18:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419580.664392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDGk-0005Hk-V3; Tue, 11 Oct 2022 11:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419580.664392; Tue, 11 Oct 2022 11:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDGk-0005Bh-MW; Tue, 11 Oct 2022 11:17:54 +0000
Received: by outflank-mailman (input) for mailman id 419580;
 Tue, 11 Oct 2022 11:17:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s0xJ=2M=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oiDGj-0004mj-8o
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 11:17:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 587ea365-4956-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 13:17:52 +0200 (CEST)
Received: from AM6P193CA0065.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::42)
 by PAXPR08MB6479.eurprd08.prod.outlook.com (2603:10a6:102:157::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Tue, 11 Oct
 2022 11:17:49 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::83) by AM6P193CA0065.outlook.office365.com
 (2603:10a6:209:8e::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Tue, 11 Oct 2022 11:17:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 11:17:49 +0000
Received: ("Tessian outbound 99ee3885c6d5:v128");
 Tue, 11 Oct 2022 11:17:48 +0000
Received: from bd4e7d53a030.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8B9874B2-2752-4B3F-BDFB-8DC215C06B7A.1; 
 Tue, 11 Oct 2022 11:17:42 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bd4e7d53a030.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 11 Oct 2022 11:17:41 +0000
Received: from AM6P194CA0034.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::47)
 by DB9PR08MB7510.eurprd08.prod.outlook.com (2603:10a6:10:301::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 11 Oct
 2022 11:17:38 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::4a) by AM6P194CA0034.outlook.office365.com
 (2603:10a6:209:90::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.20 via Frontend
 Transport; Tue, 11 Oct 2022 11:17:38 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 11:17:38 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 11 Oct
 2022 11:17:36 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 11 Oct
 2022 11:17:35 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 11 Oct 2022 11:17:32 +0000
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
X-Inumbo-ID: 587ea365-4956-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=kriEdOG+ocz57Bm3EsrWwvRu6Nt01latUYW5rC1oMkgB3kGRxP9WOhb/mE7fw8QPdQ/a0b9sjUY1fhyPXtRRB2VwYGt/cGEqDipzAScS6C9KM/5f74MxBgTC080AnQ21rs6dDF8SQtYo3J9ipEU9fsoBNkP8Nqh82ShODTOU06dYHJ15iZ3EPBB1Dp4FnUtcYrZvpjz2Cim37KP3YZq2sYo1+RNpC5MSAcwZVP7wQXD0oi09Bd1ekO5yHYRVxaWkDJc65/IenJBocEuXKahgipxRN510TNL1qj2dccsQsnsq14GikArc3sFFtE/kJLmoDZ4hjaXi0hOJdPuSUTxSoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Yk9pOwOqX2MUuUQPvSNQCJe5TGtYxGC6yPWBHHiZQQ=;
 b=oEb6nNLMC05WVXGSxwPAKk8gfuG1+TTxI5mgrdFMdfrJx1PjszU9R+tE0dmjw4DvdzOhC0JpFfPVr8P4AeXhxITeewUNiMd6VW4BsUp8/ByYkzwtZTeeCPI2yPX2ajeZj3FRZTRVmSTzw8YO6NzLVlR2oTdRc3GbM4pmoWhxMeLbfpuB0LssdBqYRlIiI2l6x9tduKjfnhASKIPRRosv0rs5HcDAU82LRYOeajfIRfFSGy775QqT/lUZO1qr/0F9wkCSUDNMo7YCQGJKvtaARU/ur8QYKxOQL9ZpVTEROlviKweEMIsirYLiv2mdPejbGMcJvSl29rn3IYPM+p6Cfw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Yk9pOwOqX2MUuUQPvSNQCJe5TGtYxGC6yPWBHHiZQQ=;
 b=VtmmRESpBrxHW3xSIX76ADWh1xSV9Bb/ML7dGv1HbhSt4oWCl5LaVQSfNGR5VaTS7AKo5bNCD9BYuVwlYqqekeKTJUJIQjgIzvsvozpjfGBmLUf/3w8OSQrfiT7vKRzYZvDPkBw7ZZNSMqTLO4XVKEDf8ZEWzij3MPb1dm5g9kA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3c3a2ee416e47c6d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZXTZXRv5BrCFJd5SQ3RwkIyBkjH7yQuK3V3bbdtsFOXQe7PYZDKV5/nwQ6abrhDF7UKjVkIJwZF9wXdap7oUXnFJawZOM8Z5vqOPZLLSLW6vB6WmyNouuEumJNeYQsWbVneTMvZqLNLqclui1qfJ4oUvy3eTIWjXGqsGV4rCFOI30TBN8yM65iL0SzNnBt7xsGLaYJxVSKcRuRtC+Sd5MhYpxodlrVfnGk5gpuXdnDtxPa0Bp2NgFH7ANJS9jcz+Y3dA7OGnVloRAuLvfjub5MPdA0macfT7ur1NKRmwENJYh+PB1avtp35RtTmcnhhE/CgGdbftC9bc419D/AwFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Yk9pOwOqX2MUuUQPvSNQCJe5TGtYxGC6yPWBHHiZQQ=;
 b=HABZqJHTowppUIVZzxktdqnV1OJwgXW5J8emMRdMEhYylA4i/6QLlJhd0b7j45DnCEwqh/Ze/kpqAP2XL+S4l3gdInlnCuSTftqldzCtjMY+7N778xOwKnf6DPJvSgBY2V2kgE0BXmF7r16dGTODhjm6+v/BEOHP53MtIMZN6JdNFrK4CA2LBZUAWIUkUQZkFDNcR0lE+ENKt+PI3abjX5V+cg9/+4zf+Fq2kL+JKtZmRqeymTosEmQHV+VRhjVAt5E09xDndzTEg6EEpO89exQKU40FHPSboW1tQoWCY3qFLHjO15eKumgFvmP/qXeRew7dYpaA11FEPCMtzI4IHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Yk9pOwOqX2MUuUQPvSNQCJe5TGtYxGC6yPWBHHiZQQ=;
 b=VtmmRESpBrxHW3xSIX76ADWh1xSV9Bb/ML7dGv1HbhSt4oWCl5LaVQSfNGR5VaTS7AKo5bNCD9BYuVwlYqqekeKTJUJIQjgIzvsvozpjfGBmLUf/3w8OSQrfiT7vKRzYZvDPkBw7ZZNSMqTLO4XVKEDf8ZEWzij3MPb1dm5g9kA=
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
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Jiamei Xie
	<jiamei.xie@arm.com>
Subject: [PATCH v6 3/6] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
Date: Tue, 11 Oct 2022 19:17:05 +0800
Message-ID: <20221011111708.1272985-4-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221011111708.1272985-1-wei.chen@arm.com>
References: <20221011111708.1272985-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VE1EUR03FT044:EE_|DB9PR08MB7510:EE_|VE1EUR03FT021:EE_|PAXPR08MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: c11e0636-0cbd-4a27-4b24-08daab7a3b12
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FNi4pqAm3Jq5owMO6uF0vaU6qN4UKzR5r9yqNXIL+JUu2Z0bhsjMQuyT+1rVNCPVLOV/hcrXmW/OFxQvwF7Xjushhs68teiZ63rctvwjRkL2KIQx5zOvq5aSLOIT1PfHd9f0zaL2j1XavUPp4i1I9f/ENde54CQIgARzYA8CQpcGJzlscMEOdXPdX5xkQGrUApCO9Xvez0Dr+l4Q0lIpRJ808DNbJEyhkfLlYYIGmWmPgFP/jxxVFS5XVWdg7CmXvyyGYBGRMNPBsrtQCDdVYaIJn/ae/29z3ZEwi1gzrRlJD5TZYyuHOeOHa7TBd8+hqWhwR/cLD1eXkVoX6voU3rqqcJOuZvE1dcOrkMcT55ZUE35/HTpQV1pQpy5GWFzbfodfyxIXQ6nfd81Cr9NELes6AYtkqlu8O7+bRVBDQ6q+IZ53MipYjEFuBMRYPZHUDQTMIED8yRXDbCF2OUyiTvElf3qa2KV7QKum3QxxZoOYbvOBQCCTDwP+wb8FIQxvoCK19YDnBd+7L9Gr12Kw6yHUE3ec3oI7lT2axSPsYPQZMrzkiwlq38C2bgzYbhpkqytMnHWakapdNXGwxY/I4F/k2xdRebmX/k/ORoCQvpYg/hwxKgz8fS4ln15FKbUrEmzsa1cCIiT9qhs+la3Jv7mHBLVGTi2YZWxZWFW0Ws/J43o0woxFuUh8Q3qXJiCXINPSOsiPAKWixsY6e1rgFVJRBdEhLWzeeKEbG2hI53fOBM0LYHP/i6oMismq34ZEkHNDij8y0eyKl/WvlB6mX87O5LNRi3Y8mL8Wi7fHI15Id9GFyPy9eDzHDeqzDzk1
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199015)(36840700001)(46966006)(40470700004)(86362001)(82740400003)(44832011)(356005)(336012)(8676002)(70586007)(47076005)(36756003)(81166007)(316002)(1076003)(26005)(6916009)(40460700003)(2906002)(186003)(70206006)(2616005)(36860700001)(5660300002)(54906003)(41300700001)(6666004)(40480700001)(426003)(7696005)(478600001)(8936002)(83380400001)(82310400005)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7510
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	61a4010e-bebd-47e6-fb72-08daab7a34a1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QGtb/90oul/CjLtKfAr00mJkmAouyqrgLNDUMcVecvsPjbGj5YkR4I0KeN3jSWzFnlVT3k7eGxDvxbMJxKIVW36eqCzV3ddshCHk9e0oHfj7I/9Tpzm04D+km11toudROEJpI1q5UbzOF92gvaF+/OYEUuNN1yYERf0+1qRLlSpeXoK0yxCWQ2sVM0f/SOUd1hM211L0fBCpqubVpLetjsLwUKkqoepqmk26lB43Ccl9dm56M4zrLb9q2wHZ+WkVMqpTPw6o0raqpdVyzD9qgtm76Bls1xAf3fXBZQT4o4D/qxB83v8ibr0kn6jSWUGGNVpMNmJjq/qNrmRNYsizsG/gG9jUun7v95bYRBFlvFzpjaL2/3XGrqHl/J8fY5EUHdrGTsI7h4CyjSoWs1W48pIUF5s2eTm+yu4VsJMc1jTFMWM3hNrf6cnr3oyeDsY3s9H7ZLwLDFgqUv6tgh6HjSCU+05hF5MX4pQMtO7HIGUWoETyPMY3HifE5mAPM92vEcHL63IOLOQ9YHTmvOlADT0gRGFoAemG+vIfYU/Ih6Dxf7rVMv5IRVtkdn8LfrZRe+3qi1qmaiVABLqHTVC2/aLG7uPMs1bvQwlaNh6+rNg9uZpFeJdyUWC0IJwr6mxvFxivnDiNEmWytlpPqQeJ18v7T/yIdpAikp7lMhPwbM8glU16cdIFBvd5MbbFKgTuiuIhazuoTOVAr1a/NQ50+fNRU2J/kHDhdUPQ7SRMlg2hU25z8hJDg5UglyCXVqmYn26wMod3uK8y+zrIgvhAnw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(36756003)(86362001)(83380400001)(36860700001)(5660300002)(82740400003)(426003)(47076005)(336012)(2616005)(186003)(1076003)(81166007)(7696005)(6666004)(26005)(478600001)(54906003)(6916009)(8676002)(316002)(70586007)(70206006)(8936002)(82310400005)(44832011)(2906002)(41300700001)(4326008)(40460700003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 11:17:49.0667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c11e0636-0cbd-4a27-4b24-08daab7a3b12
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6479

VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
results in two lines of error-checking code in phys_to_nid
that is not actually working and causing two compilation
errors:
1. error: "MAX_NUMNODES" undeclared (first use in this function).
   This is because in the common header file, "MAX_NUMNODES" is
   defined after the common header file includes the ARCH header
   file, where phys_to_nid has attempted to use "MAX_NUMNODES".
   This error was resolved after we moved the phys_to_nid from
   x86 ARCH header file to common header file.
2. error: wrong type argument to unary exclamation mark.
   This is because, the error-checking code contains !node_data[nid].
   But node_data is a data structure variable, it's not a pointer.

So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
enable the two lines of error-checking code. And fix the left
compilation errors by replacing !node_data[nid] to
!node_data[nid].node_spanned_pages. Although NUMA allows one node
can only have CPUs but without any memory. And node with 0 bytes
of memory might have an entry in memnodemap[] theoretically. But
that doesn't mean phys_to_nid can find any valid address from a
node with 0 bytes memory.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v5 -> v6:
1. No Change.
v4 -> v5:
1. No change.
v3 -> v4:
1. No change.
v2 -> v3:
1. Remove unnecessary change items in history.
2. Add Acked-by.
v1 -> v2:
1. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
2. Adjust the conditional express for ASSERT.
3. Refine the justification of using !node_data[nid].node_spanned_pages.
---
 xen/include/xen/numa.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 5b3877344b..04556f3a6f 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -35,8 +35,6 @@ struct node {
 extern int compute_hash_shift(const struct node *nodes,
                               unsigned int numnodes, const nodeid_t *nodeids);
 
-#define VIRTUAL_BUG_ON(x)
-
 extern bool numa_off;
 
 extern void numa_add_cpu(unsigned int cpu);
@@ -69,9 +67,9 @@ extern struct node_data node_data[];
 static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
 {
     nodeid_t nid;
-    VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
+    ASSERT((paddr_to_pdx(addr) >> memnode_shift) < memnodemapsize);
     nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
-    VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
+    ASSERT(nid < MAX_NUMNODES && node_data[nid].node_spanned_pages);
     return nid;
 }
 
-- 
2.25.1


