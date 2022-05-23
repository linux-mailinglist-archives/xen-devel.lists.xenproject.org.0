Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494B0530983
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 08:26:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335365.559584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1WQ-00021f-Ti; Mon, 23 May 2022 06:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335365.559584; Mon, 23 May 2022 06:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1WQ-0001wm-LD; Mon, 23 May 2022 06:26:30 +0000
Received: by outflank-mailman (input) for mailman id 335365;
 Mon, 23 May 2022 06:26:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eb4B=V7=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nt1WP-0007pn-Co
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 06:26:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 461f1715-da61-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 08:26:26 +0200 (CEST)
Received: from AS9PR04CA0096.eurprd04.prod.outlook.com (2603:10a6:20b:50e::26)
 by VI1PR0802MB2512.eurprd08.prod.outlook.com (2603:10a6:800:b0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.18; Mon, 23 May
 2022 06:26:23 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50e:cafe::1d) by AS9PR04CA0096.outlook.office365.com
 (2603:10a6:20b:50e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22 via Frontend
 Transport; Mon, 23 May 2022 06:26:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 06:26:23 +0000
Received: ("Tessian outbound 3314dea8c23c:v119");
 Mon, 23 May 2022 06:26:23 +0000
Received: from 087b98c53955.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 70469D15-99EB-41AA-98D4-AE064CED749F.1; 
 Mon, 23 May 2022 06:26:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 087b98c53955.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 May 2022 06:26:16 +0000
Received: from DB8P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::21)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Mon, 23 May
 2022 06:26:14 +0000
Received: from DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::bb) by DB8P191CA0011.outlook.office365.com
 (2603:10a6:10:130::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16 via Frontend
 Transport; Mon, 23 May 2022 06:26:13 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT050.mail.protection.outlook.com (100.127.142.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 06:26:13 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 23 May
 2022 06:26:12 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 23 May 2022 06:26:10 +0000
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
X-Inumbo-ID: 461f1715-da61-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KCVcJZhJUZbhnkKSMpKaO3cdh3pvmYhNpz7DFCUDQRkq0UF02uqcokFBBB/ZGRHwQu3iOeKB+1Dz4AgJJDxqhZdzT65lNQSKs8elOBRz0SXDZYBoDfETJZwFthH2Pv4lRq57+eRyHewLV1Rdc93nYpNAcL7E8jPjz7753SKt6P4wKttlyIxs65krkENwL9dyfxX9vUN3gIWauOCymZROvBdxW32pBpYe3mA5vLkjpY7PBJUGRIAiyNrb2v+5JAfGKkF6gdd4A0AgNSg023PZSwstidwUIqnQv0LYWeOAVZmVzPgxlCjD7+xovL7MU1p5QbcaMElSeyL912pPPTDD/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGzvy5CI0O3ZOxHFKXykWCIAbSrQeBaDVkYt3xk4464=;
 b=MxRw32muwCC5hE+EmCg7ucoXyUnukSHBAgCBeC+jub9xc6JGZoj6ydnWeD535Kas8cfv02ROtgJ9t4Kl5vo/rd2SC2ff+3VDqms/ah7Qc/sQkdaXzwHlMtE3qRmV9LO0rg4kmpB5lVtJBFO1Fe95amifSwAd58+tTKuNxOmrAlnCONVebrMPZFe6iQzjn3A3C8CDygzRZgiRN+4oTP1836UTwqWk/FnIuj0UQipC1MRfLoAA1lN8ob9vMTAYTWCPh0w9u5nAsUmGdHUawnJQu6mHTtiE16C2VC6yoNbhXxP+2hHP2W4cpge6J460c93XHIh4HaL2W0bo/iXSZsTtPQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGzvy5CI0O3ZOxHFKXykWCIAbSrQeBaDVkYt3xk4464=;
 b=KBaZZdq74csLi6ln6eYuQxJ5hU6Xqwf3fWSAQKknxJo369e7PtEuf3NDNFXs5DJN8Gb5qCvWq19VYLmVb/j3sUNKk9pXdTv6TSFo+76j+IwR0Ghp55etdeMU+/88gRnuIo5kOwlBcNsmf6TSt8NUO9VVYe860bkvA7DDJF1rOxQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bcb0d0647ddc198f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYNw9B522rvIP5stLZMPI7Aswxl5/52XMGIb9s59D2LfNrlPBivZraUuhjPg4ltIYzTmn7sHkvqjMTOrl91wqay/XSNYQ9+dK7GfLK4P/Eg3RkjepdTO2z8WVmfIhzICTkKP1iqRk++GWasKebDUqwOaEpK3y6VfzT4xDaJKXKHrMKzCJ3suWyyzpODdnUbj9tURfuJRtAa7aCFGSBj6LSJ4/lAwdU8ykKTTfUJhGgKAInqRihXyvuQqafkNbsyWm4TyYVCWd6+FNCZK5XO+PUPGWoGcqLqKAm/IT2rxnacr915zJQ0TF7aM7zQgCBCpdNvBwiFMFemjytNwmDK/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGzvy5CI0O3ZOxHFKXykWCIAbSrQeBaDVkYt3xk4464=;
 b=QdvKwzQ0NKb6fXKS2hfI844uZq3LnVYD3PlXPtzFMB7owJQtsk+vQdV6mHGOOChR+rBhD7OV+1H3wGtjodZJ7ji58GJHkRiXQhcby42NybL7dtOMlnHlmQZtRnMvfkXB3L3JuP3ra4LPQY3q/UpQgpGaGG/mNeXzRJMcfqctO5PaKGwOlvKgO+Yhrv7fFkicBA+SE7S4keK0t/nCW3LhyMTt9459zSK1rRrZiGaXhelSs4yhbk3cVfEQ1ktOyAz647GyQx5C45mDqynxiN8syQHGqwW+GTrq/fwvMphBDq5zvdTV4YYPkmBpeQc6pOYMZLmi3VaKwjqe2fxgxDfBjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGzvy5CI0O3ZOxHFKXykWCIAbSrQeBaDVkYt3xk4464=;
 b=KBaZZdq74csLi6ln6eYuQxJ5hU6Xqwf3fWSAQKknxJo369e7PtEuf3NDNFXs5DJN8Gb5qCvWq19VYLmVb/j3sUNKk9pXdTv6TSFo+76j+IwR0Ghp55etdeMU+/88gRnuIo5kOwlBcNsmf6TSt8NUO9VVYe860bkvA7DDJF1rOxQ=
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
Subject: [PATCH v4 8/8] xen/x86: use INFO level for node's without memory log message
Date: Mon, 23 May 2022 14:25:25 +0800
Message-ID: <20220523062525.2504290-9-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523062525.2504290-1-wei.chen@arm.com>
References: <20220523062525.2504290-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 3b7b541f-472f-40cb-f96b-08da3c852877
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB5944:EE_|VE1EUR03FT044:EE_|VI1PR0802MB2512:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2512D48B430713285A96B5F89ED49@VI1PR0802MB2512.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vH2pEClYPyETMjP1jSI42xqA+RGpwNvFb0/TxkMJFNllPZM5neyrMHjp0K2Sj1dJDgpaGktBTUcxJeta0o8I3rsfEVnAgTQ6Sj/YAOYflkI32zxbwVj/yT9N698pChFDvACleixHuDfLbX4qpY2hiyjfhY/6qNqRSkLV950WqamI3PmWn0Bk9YmX1UvTwEj3FCe8rVM4EParSNXqOk6WLE5dMN2+reUZSXj1r8PgbRvEBdIfnYmhWW86j/0A+4VeZ2nAK2gCjyGFTV+knezNtFu/3DZliQuZSCNMidiRA0I2+qbeY3U2EPb2jcJyqdU+Ou2Os9R1Iz+PKV1fMxJ7iY7d1N1yUMp1ot173BvrMZc7zDbbOKJyEnKgc63uLbQdMdCQSkT9QHwIOZ4FOiNOMVPBirZ5Pbz+JfuzBOK2f+QkhAZoyfFl9aAAxW5r78s1O1YnVlHFjh18mvULUXZyIL4t/bEIYa14lY3udgTKtoko8/FC+JIjePMAMsyydnpG1n6t0z0lZABcLI44KcF5RYGvrCbM/bjLR0LF4jXRrz/BL/hvRE5k4C1BCX4ZSZoPRjGFCIqF4FO258NxohLNnclGsGRgz+8B38se7Fm3tXrqoOELGHFOZZu8w22oOfXY6SEe7IMIyXy5cBsW09xGBlekVjMgY6B7XonY4AYJBNSz94AcQV/XRlzFnntPO7H1f14TJVLSMB0KoIApUCCbfQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(86362001)(356005)(7696005)(70206006)(8936002)(36756003)(81166007)(4326008)(186003)(2616005)(5660300002)(8676002)(70586007)(82310400005)(1076003)(54906003)(508600001)(6916009)(47076005)(336012)(15650500001)(83380400001)(40460700003)(44832011)(36860700001)(426003)(26005)(6666004)(316002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5944
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0557d275-4b3f-4df0-32a7-08da3c85229c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BhB3vtE7jOpPhvqJx5zZ407sfN0vKKMNNf+UNh797H7b91j7kU/WXXCl7lXyaq++L1CvBG7caYZl+hB4l4xwhZW5HW+iD4PBo1jwUQmLNFQFZTpvS2Zr/yptDds7OflPVhxegTkFCLSpqr6zZOm7yHQFD8uR0pduv9vICSGa0UMd/uKdMD3je+VV1U4LEairxedDCNanHk+KRt16ezmOnOWhf4P6OyrnndBaTqBokChnWKRxDiCqQfbvGWoTtbVv8+LK+Nid/I8+Q7gvae4P3ZVhBtOnyBVN/RoHG1vhmD11t+VUHFCugwdSqtESyI6WRWEH63oeF+DYXU+AUIelI4L71DF+3Kc5+j8hMLU5d0p2BX0k610OyFnBi5Fsi1lNEXNZhCd24s8GdRqiEQ03hPnRs1A35LgjwwIJRTyY8K7JDeI7d25cuaeLdQ3xEiP6J41nYGEdQGk1KXTiAY5RyoIapbirZNg7lzq+8fS6Bo9F2020Q3BXCKSX4tbjVI8tqY99SA5qYPG+hzdzkgCH4hLj/d+UuiGTUwua4F+2rn+NiXUvUurgPL1VTiidNFGJ6gComII1FNYwooDl296MYfCOqT/3bXHAM/DfVmbce+u6SUXCOeRHIcPshrfCLxEo7KerzcI2j9Ce8x3XG19z2g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(70206006)(70586007)(36756003)(47076005)(2906002)(426003)(336012)(186003)(2616005)(1076003)(26005)(4326008)(82310400005)(6666004)(8676002)(83380400001)(15650500001)(7696005)(81166007)(316002)(5660300002)(6916009)(44832011)(54906003)(508600001)(86362001)(8936002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 06:26:23.2521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7b541f-472f-40cb-f96b-08da3c852877
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2512

In previous code, Xen was using KERN_WARNING for log message
when Xen found a node without memory. Xen will print this
warning message, and said that this may be an BIOS Bug or
mis-configured hardware. But actually, this warning is bogus,
because in an NUMA setting, nodes can only have processors,
and with 0 bytes memory. So it is unreasonable to warn about
BIOS or hardware corruption based on the detection of node
with 0 bytes memory.

So in this patch, we remove the warning messages, but just
keep an info message to info users that there is one or more
nodes with 0 bytes memory in the system.

Issue-Id: SCM-2240
Change-Id: I922a5f17e8d7e9d250a70eb3f703dabe4698027a
Signed-off-by: Wei Chen <wei.chen@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v3 -> v4:
1. Remove full stop and use lower-case for node.
2. Add Rb.
v2 -> v3:
new commit.
---
 xen/arch/x86/srat.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index a831df7648..5bd6279920 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -562,8 +562,7 @@ int __init acpi_scan_nodes(paddr_t start, paddr_t end)
 		uint64_t size = nodes[i].end - nodes[i].start;
 
 		if ( size == 0 )
-			printk(KERN_WARNING "SRAT: Node %u has no memory. "
-			       "BIOS Bug or mis-configured hardware?\n", i);
+			printk(KERN_INFO "SRAT: node %u has no memory\n", i);
 
 		setup_node_bootmem(i, nodes[i].start, nodes[i].end);
 	}
-- 
2.25.1


