Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B7753E045
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 06:10:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342302.567453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny449-0002mQ-SR; Mon, 06 Jun 2022 04:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342302.567453; Mon, 06 Jun 2022 04:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny449-0002eu-Ku; Mon, 06 Jun 2022 04:10:09 +0000
Received: by outflank-mailman (input) for mailman id 342302;
 Mon, 06 Jun 2022 04:10:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aNt7=WN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ny446-0000w0-Vq
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 04:10:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b6e0821-e54e-11ec-bd2c-47488cf2e6aa;
 Mon, 06 Jun 2022 06:10:05 +0200 (CEST)
Received: from AS8P251CA0013.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::28)
 by PAXPR08MB7333.eurprd08.prod.outlook.com (2603:10a6:102:230::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Mon, 6 Jun
 2022 04:09:59 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::e) by AS8P251CA0013.outlook.office365.com
 (2603:10a6:20b:2f2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 04:09:58 +0000
Received: ("Tessian outbound e40990bc24d7:v120");
 Mon, 06 Jun 2022 04:09:57 +0000
Received: from 2814ff798609.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9678FAF5-AF60-4C70-BEBB-639851BF9B12.1; 
 Mon, 06 Jun 2022 04:09:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2814ff798609.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Jun 2022 04:09:51 +0000
Received: from AM7PR02CA0013.eurprd02.prod.outlook.com (2603:10a6:20b:100::23)
 by DB7PR08MB3579.eurprd08.prod.outlook.com (2603:10a6:10:46::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17; Mon, 6 Jun
 2022 04:09:47 +0000
Received: from AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::53) by AM7PR02CA0013.outlook.office365.com
 (2603:10a6:20b:100::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:47 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT053.mail.protection.outlook.com (10.152.16.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 04:09:47 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Mon, 6 Jun
 2022 04:09:49 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Mon, 6
 Jun 2022 04:09:45 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:46 +0000
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
X-Inumbo-ID: 8b6e0821-e54e-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EwkcM7u9VXg1qxkt/TYpjxp1EzeemT0fPTlxfjlIj/Yx0EBe/iHEI9eIk2U56ZwFsE+zXeiUrqL1Enazn2cNvetdHeLnNTR+PtXNj+Y5Zsl4s2OgjPTqsKngvnldIqtc18kRXjvjkkwfVf2XUdDuD2Cvc7Sb/wUxWxkdWq95SY0Zji3yqiZGjgUU8mj6sj4Xf3EJtLDNekbuJlR6iIwHLgVat4dMD47iEtRneaqWA17PS13DFGrGr/Xi7+RcOX+Uvcfiveb5f7wXq/URp7xbz9etSxwFxhppln3MI4DC8Yu/zImBz6W+OiAYCO0ysOZbBgpBJmbaerRLAObls85KIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTmh/NoFukFLTLwt/M1hKfyUJ4QPT35nQO5A1fR5J9I=;
 b=FRmTfyBKsI50TBnpmXR6YYPqHBUxlp8u3yr3fG+X3yrhwxI8aQEAKyFRW4b86LbKx0cV/2NKpd1/A2VFWi57m2Tb+cmiFFR5ih6OsAoKApT93Zxy/BR3WR+4TshykdqqqP7SREqKA/n4fUJaw7Zb1PPOwd60nUPNoOUmdky6DHQl6AVLzyFe5kb3Z9M5QPImANo1rkFG4EJpkbxvJoJ5hiyfccb6WUauwTzXRHdQOsh3ss2mDp5PNkbI8uglWvAhc9HcjhUOaJDKfEd0hLaltSTbGs+/z/eqVYfBemOeGn3OoDsCmBlNXJnMJGy5jLDk/3IshVGcWfvexOW5d8lj7A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTmh/NoFukFLTLwt/M1hKfyUJ4QPT35nQO5A1fR5J9I=;
 b=OTZHXfrIlZ+JAyIN11mT60uMAZgDVAruGKGyt7sP/w/RJO4Y2CSk8ppaOVX2fWMPXbLVHxBhTPSS6BDQbypU27fWSONk3XB5i5FXYmnD/gw5iubjHdZU4uE1X6O8M4iQmPAmb58c/eJ3939NOkPDpRrFoeaAdoCrOQJVzzsDmMI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c57d4c5667ec94b8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGVe3yLR09bcUf0GtnFj5Ou6NJCQQiMmcIIhcF1788zdFsvb2uLl+gpWsx7i7p5US7UdPLSFV4XNlvJx+ZaiD6Kc1OehGykU8h/rSr9gwP78MZ3qNwKshfi7IRH5Eq7zf71WQYmG+rPbgXbygwpGHZ9giSjHtN3QkLv//J+g5hfeJdi0O1EpbVMyahgLaOcth9JPLlFdvEnMm8RhplmDKQc7DYOiK/u5fBOpeJVxGJUGSzrxi5bFq8ezmrzhmGwg1bPTQW1O3XEUolzLAdV5q52DEeeOwxk1QNwNn9C1sKP7QeXBMUxf5SgPrQSs6GB1PmvovZQNsXM55nn2EgYTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTmh/NoFukFLTLwt/M1hKfyUJ4QPT35nQO5A1fR5J9I=;
 b=I1NYQPFV+2XnTTDuJoGZxkWud4t1RS8M/wLh9X/uojlSSbUe/VZchn9DkYucPo0fkXCI1EI14rmdJ44ZkhGlRmTgecEc/hhYpvFn15BzjSleXAJ1Caf++mGnvm+WHQAYkQvdFmKewen9v7nS+JW+sz2NZkIgdImxXqhb2UWP/UM4LVd9UbQS6qpOTyi5QtIfXWNMptWZuMUEPYlyIqoRz2S+veQdn/+L27CiBrRzV/CBtTQsANKjEgKjWpd+vbYPcs1xEjh3MeknPliyyF3hvvfsJKou+kTMHxYYjzHOkrjtL4dWM/CJdirL1XGr00RsX78Bo+id9b+15sh6BJRpOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTmh/NoFukFLTLwt/M1hKfyUJ4QPT35nQO5A1fR5J9I=;
 b=OTZHXfrIlZ+JAyIN11mT60uMAZgDVAruGKGyt7sP/w/RJO4Y2CSk8ppaOVX2fWMPXbLVHxBhTPSS6BDQbypU27fWSONk3XB5i5FXYmnD/gw5iubjHdZU4uE1X6O8M4iQmPAmb58c/eJ3939NOkPDpRrFoeaAdoCrOQJVzzsDmMI=
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
Subject: [PATCH v5 7/8] xen/x86: add detection of memory interleaves for different nodes
Date: Mon, 6 Jun 2022 12:09:15 +0800
Message-ID: <20220606040916.122184-8-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606040916.122184-1-wei.chen@arm.com>
References: <20220606040916.122184-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: fb20b1cd-32e2-41f2-ecba-08da47726b97
X-MS-TrafficTypeDiagnostic:
	DB7PR08MB3579:EE_|VE1EUR03FT033:EE_|PAXPR08MB7333:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB7333F8C6A30E5CACA41259E49EA29@PAXPR08MB7333.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KAhorGSmHG4e1esHgk0GHFqSTES2vg8hDkYbQ8ZNxU++ETqKWXzjyF8jIhbnVwE1jezfRh1QicdOJGx9mpnUhEVaWxu3TxKi3wTpKG5ej6euo4/vZxD7jdeiyktR6sbtsBmK0O4dP3NC0Iv2Diw/+g0XGM2pEbIkaqYF4eEdWtYo6lBcPPlhmtlIsQfU7ynWikzTLLPglyDLExp9R5et5pI0VUCpt/jRvZY4kXOKx7byMIlyc0vXHD8FaiHd47ky133hAwMF6+AsQoJPzU4Bvj6XkyrQVc+hX9xaYz594SwzeWWv4EDKsJad8Zjb/a2fC6lnstSq4DFinONmcbpxTLToC7ozSQGZyU8uh6hTIAm1RRanG5Ru4691C5oi70pWs6Haqy4tcryft1bIk8Js6q3ZBAFXbC9ygKkhqG2sIkRxCC3NeDZquYQm3Rzi6YJyDJ/C6pl0hppfkQ/9qEiRS9Z+UuMZftsS0oA/0WOIXkc+fxqQ78enk1+vjFyJxBDAf52s9QPKySmYfoSqvksdAAyJJwLNm+Npxkw+5udF2lb6aibCYApA1MY8yElx62HB67KlVRFQRBuzYYdfhZgCp1qMIzemfAD17BoDhnd0YcWWXQ0rM94rj8Ez/GBb4t5vsCmoKfTPl5Yo+Olc3vIVO/pJewuU7YwTTovxyVCOs/Z4Y9fBbNAOAsvO19AonqF0
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(83380400001)(7696005)(356005)(4326008)(26005)(44832011)(70586007)(6666004)(81166007)(336012)(82310400005)(47076005)(426003)(8676002)(316002)(8936002)(70206006)(6916009)(186003)(1076003)(36756003)(5660300002)(36860700001)(2616005)(86362001)(2906002)(508600001)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3579
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	43128504-97cf-4e8b-cbc5-08da477264e9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t/VlKtAUWAaO6loms/yLtV/telJIqs1zkRPDv3UVJjGCuCeXQbF8/axpJndhD4onuUWtOBIFBsDP0uVhZ1ZdXoL6JhhQLkN1EpFezI08Bz8tdsTe80jlyIAfJ7CN4XrVQpQjk8YSoHm9vETRDN8CPCn+oIDoG847n3uKFVx6Kp2MbVbnmxK/e7IAB3sLAgNeuEB3Ekm19OZ4mPtRV2iCpYhrdpL0NS5LIg529OFzpeuddmS+t+dszguUfQpRIfEvUFXIE+BpX9pwE96Y0Tf3ngQwwkzt30I/fI53M69qY2uqffxkje0dqhM39vVGyN6NJtojj5EBMuPXrf+CAhVsyfoYdn9yFECE94atyfu/kpWaNVZhojaHxMBBb8/7xCM4fFZ77TckDIQdb5ZqRW0rSzALe3Xku2Zv8ZXWCsVZI05l34BIvh3R02ZvICyJ8hkOEGtQZ0u/blhBM4Df3fxtudqjKDgr1VnaaxntpFLg970vce+RGxiBFpNVpSSGB5DrJWOepAsKRw/S13bHc97piPHahq9QtKzdqpfIgoc8JTZY8pQxHXu3esrL1lHG0W7+lfiDYLP/xhYX3zd/SJrvVQ612iqRxIxLaDqfL45EcFGvp+E0mux+mkVfjNf1JXk438sV5mZD9UDyySm/4C0SJA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(83380400001)(7696005)(36756003)(54906003)(2616005)(4326008)(8676002)(70206006)(186003)(2906002)(44832011)(5660300002)(6916009)(1076003)(316002)(508600001)(426003)(70586007)(8936002)(86362001)(336012)(26005)(47076005)(36860700001)(6666004)(81166007)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 04:09:58.1746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb20b1cd-32e2-41f2-ecba-08da47726b97
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7333

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

As we have checked the node's range before, for a non-empty node,
the "nd->end == end && nd->start == start" check is unnecesary.
So we remove it from conflicting_memblks as well.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
---
v4 -> v5:
1. Remove "nd->end == end && nd->start == start" from
   conflicting_memblks.
2. Use case NO_CONFLICT instead of "default".
3. Correct wrong "node" to "pxm" in print message.
4. Remove unnecesary "else" to remove the indent depth.
5. Convert all ranges to proper mathematical interval
   representation.
6. Fix code-style comments.
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
 xen/arch/x86/srat.c | 139 ++++++++++++++++++++++++++++++++------------
 1 file changed, 101 insertions(+), 38 deletions(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 8ffe43bdfe..b145ccb847 100644
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
+		 * self-overlap case. As nd's range is non-empty, the special
+		 * case "nd->end == end && nd->start == start" also can be covered.
+		 */
 		if (nd->end > start && nd->start < end)
-			return i;
-		if (nd->end == end && nd->start == start)
-			return i;
+			return OVERLAP;
+
+		/*
+		 * Use node memory range to check whether new range contains
+		 * memory from other nodes - interleave check. We just need
+		 * to check full contains situation. Because overlaps have
+		 * been checked above.
+		 */
+	        if (nid != memblk_nodeid[i] &&
+		    nd->start >= nd_start && nd->end <= nd_end)
+			return INTERLEAVE;
 	}
-	return -1;
+
+	return NO_CONFLICT;
 }
 
 static __init void cutoff_node(int i, paddr_t start, paddr_t end)
@@ -275,10 +306,12 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 {
+	struct node *nd;
+	paddr_t nd_start, nd_end;
 	paddr_t start, end;
 	unsigned pxm;
 	nodeid_t node;
-	int i;
+	unsigned int i;
 
 	if (srat_disabled())
 		return;
@@ -310,44 +343,74 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
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
-			bad_srat();
-			return;
+	switch (conflicting_memblks(node, start, end, nd_start, nd_end, &i)) {
+	case OVERLAP:
+		if (memblk_nodeid[i] == node) {
+			bool mismatch = !(ma->flags &
+					  ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
+			                !test_bit(i, memblk_hotplug);
+
+			printk("%sSRAT: PXM %u [%"PRIpaddr"-%"PRIpaddr"] overlaps with itself [%"PRIpaddr"-%"PRIpaddr"]\n",
+			       mismatch ? KERN_ERR : KERN_WARNING, pxm, start,
+			       end - 1, node_memblk_range[i].start,
+			       node_memblk_range[i].end - 1);
+			if (mismatch) {
+				bad_srat();
+				return;
+			}
+			break;
 		}
-	} else {
+
+		printk(KERN_ERR
+		       "SRAT: PXM %u [%"PRIpaddr"-%"PRIpaddr"] overlaps with PXM %u [%"PRIpaddr"-%"PRIpaddr"]\n",
+		       pxm, start, end - 1, node_to_pxm(memblk_nodeid[i]),
+		       node_memblk_range[i].start,
+		       node_memblk_range[i].end - 1);
+		bad_srat();
+		return;
+
+	case INTERLEAVE:
 		printk(KERN_ERR
-		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
-		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
-		       node_memblk_range[i].start, node_memblk_range[i].end);
+		       "SRAT： PXM %u: [%"PRIpaddr"-%"PRIpaddr"] interleaves with PXM %u memblk [%"PRIpaddr"-%"PRIpaddr"]\n",
+		       pxm, nd_start, nd_end - 1, node_to_pxm(memblk_nodeid[i]),
+		       node_memblk_range[i].start, node_memblk_range[i].end - 1);
 		bad_srat();
 		return;
+
+	case NO_CONFLICT:
+		break;
 	}
+
 	if (!(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE)) {
-		struct node *nd = &nodes[node];
-
-		if (!node_test_and_set(node, memory_nodes_parsed)) {
-			nd->start = start;
-			nd->end = end;
-		} else {
-			if (start < nd->start)
-				nd->start = start;
-			if (nd->end < end)
-				nd->end = end;
-		}
+		node_set(node, memory_nodes_parsed);
+		nd->start = nd_start;
+		nd->end = nd_end;
 	}
-	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
-	       node, pxm, start, end,
+
+	printk(KERN_INFO "SRAT: Node %u PXM %u [%"PRIpaddr"-%"PRIpaddr"]%s\n",
+	       node, pxm, start, end - 1,
 	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
 
 	node_memblk_range[num_node_memblks].start = start;
@@ -396,7 +459,7 @@ static int __init nodes_cover_memory(void)
 
 		if (start < end) {
 			printk(KERN_ERR "SRAT: No PXM for e820 range: "
-				"%"PRIpaddr" - %"PRIpaddr"\n", start, end);
+				"[%"PRIpaddr" - %"PRIpaddr"]\n", start, end - 1);
 			return 0;
 		}
 	}
-- 
2.25.1


