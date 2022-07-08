Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32FD56BBF7
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 16:55:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363476.594065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pOP-0000NP-8o; Fri, 08 Jul 2022 14:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363476.594065; Fri, 08 Jul 2022 14:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pOP-0000Kb-4O; Fri, 08 Jul 2022 14:55:41 +0000
Received: by outflank-mailman (input) for mailman id 363476;
 Fri, 08 Jul 2022 14:55:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EO41=XN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o9pON-0006vD-Rd
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 14:55:40 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2041.outbound.protection.outlook.com [40.107.104.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07899fed-fece-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 16:55:38 +0200 (CEST)
Received: from DB6P192CA0016.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::26) by
 PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15; Fri, 8 Jul 2022 14:55:36 +0000
Received: from DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::2a) by DB6P192CA0016.outlook.office365.com
 (2603:10a6:4:b8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT046.mail.protection.outlook.com (100.127.142.67) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 14:55:35 +0000
Received: ("Tessian outbound e5f49c5d38f9:v122");
 Fri, 08 Jul 2022 14:55:35 +0000
Received: from e2cefff5c73e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6E361E81-15BB-4980-BDFE-118B4EC5B781.1; 
 Fri, 08 Jul 2022 14:55:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e2cefff5c73e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jul 2022 14:55:29 +0000
Received: from DB6P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::14) by
 DB7PR08MB3178.eurprd08.prod.outlook.com (2603:10a6:5:24::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16; Fri, 8 Jul 2022 14:55:26 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::ca) by DB6P192CA0004.outlook.office365.com
 (2603:10a6:4:b8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:26 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 14:55:26 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 8 Jul 2022
 14:55:21 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:18 +0000
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
X-Inumbo-ID: 07899fed-fece-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dUcjBxDOp0RiKR9LzrELyrmBSuLHdgOD6F0v3ODTD4xJ5TyiMM4oZDlBX0ksaBpwNzlNvF/9X5+MvrbbGxeWlu6g1wd0KPe7LQ/Q6Zl43tDLOD3L7cxbheRaFfHQfwpVGlMTbOSEHg49lDf1lsaQvErnFcogSKustXDZlBtD1RKeTHjz+ovCfFvTDwWZTPCEh7gn4jnsjVD3c0RiGxXr+olQntZdm1u1MNTCEi/9jhLo7Y5Dpx+6gsOeWxLSmAWbT1FyaU0zik2wA3DTR+KT68Y0pyBWHEO0ckHsje7HurXR0xrQfZmteXtCgtkFyvxGaw3E4WdCSPWE+X3mlM13zw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQ5GWTIY4MWQGGyhLZ8eQoBIiDbRb+nQhneNRjZRrdA=;
 b=OMFoz5Tzop2xAvk8ORbRqKpTnwHvZdwrBLkvO2lbAGP7ZfMWoPRxPmjn0/8oPMgyYeNOLMBJfP3C6Bw2QWreuoZj/KZfL2YoBw4fq/qLVi+AuqVlOyN3JwnTP57dpNC1ZSGbnuq/8s2h8pxhEL6TI1KqPhcQcGCC2H5HmnG5L8HK7oTkWjGEP9InwPQc6UIwDImAMhZEeJEWa41m+xGyEv4crfC7QuFAWXmDmzfyQLycdINak+WJhnLD9p/+qiwaVx6okePa4Vpg5POLNKIU/Z6RxVDex4Ii5n9bTnNkfUUFYWzJbdUAVDTt4XlgOrc1f2o2UL8SOrxuNvnBbvIpaA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQ5GWTIY4MWQGGyhLZ8eQoBIiDbRb+nQhneNRjZRrdA=;
 b=iVdHgS6fU7FqzfL9hNkg4ZhXOhwgj2YvcTQi3xeoG90bN3wZf9zIi+gyC6wXCGZvRh2Cz//wDh2/i1wTfNv00L2nEXD9dNl5kcdjLsdjl5r1iK7Pqx7dR9okajC8C0Ymo33aY8wkGGKTWirCbDBrXFE5J12VBgxvcJX9G46KIrw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 15e1c48a565aa983
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sk+UwK2Hauzhbnx3shfUGBpacF2Qpvqatnk+geWuGsw0EKKsXwmBKDlceu67ezX4cV/NvzffR8r8TS0Kf+G67m5KYHqELXTr+duV+HpiU8Ud0dN+UzimnRiW51Kw2bwdFVonyhzYW75xX9GwS4INSrx/2MZ5UnyT8Wm3PPGFTMU+vhYuO61WiphtdVI/JyV5kXbk9Oi2EwdL30+Dd0dRlaQIv4IP92a/nGfW1FH0FMx1/qBYFh5loso2tmJP4IcbQEUZYlhBy6FlsRY8CJMpvAj64lIa/utSJ2keyP8d3OR9bY0VzuWo2lpK0HNRgWh6chTK1fkPqUVAx2f8VAD9Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQ5GWTIY4MWQGGyhLZ8eQoBIiDbRb+nQhneNRjZRrdA=;
 b=PEQXCAxziGNx1u6AHJYJ+6hd8k734QBCCKZ4XadKZyVdsjClSHM3ia7GZcxutFlSMzCwhWsPHoHWhhs6cW6xnZTLwSMjuI+YzxhTrGYfZOfUyLLQQmaeJro6rs9czr6MU9yEjM8G2ROa+v0xjgUtWucs4s9iXsluXkaeWfbXKopEbl9lZkaKcPqvR6HaBfZ/zYr5ecPTabVs29gpKaeSaLxPc7NpCeY3UbGVnnbRd5Zn5mTqreQwTn7hTznYKH47nlugKKX2xYGny/7s/4HzyQrQZyLtQRYLLhCoClbgbehyNmc6hHTQKJ4PFmGo0QzXsEydMNejeMssYoOdNHZgxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQ5GWTIY4MWQGGyhLZ8eQoBIiDbRb+nQhneNRjZRrdA=;
 b=iVdHgS6fU7FqzfL9hNkg4ZhXOhwgj2YvcTQi3xeoG90bN3wZf9zIi+gyC6wXCGZvRh2Cz//wDh2/i1wTfNv00L2nEXD9dNl5kcdjLsdjl5r1iK7Pqx7dR9okajC8C0Ymo33aY8wkGGKTWirCbDBrXFE5J12VBgxvcJX9G46KIrw=
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
Subject: [PATCH v2 8/9] xen: rename acpi_scan_nodes to numa_scan_nodes
Date: Fri, 8 Jul 2022 22:54:23 +0800
Message-ID: <20220708145424.1848572-9-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708145424.1848572-1-wei.chen@arm.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 69039600-7f7e-4b18-43bb-08da60f1ea35
X-MS-TrafficTypeDiagnostic:
	DB7PR08MB3178:EE_|DBAEUR03FT046:EE_|PA4PR08MB6032:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lA38u7ClFGoQyENw8XkQSPsE6AGjpZ1R/97AJp7/SCWYlvcohPAtsgUV9BIuiSzvEN3br38xCmgibvSmdm8QpSJdRJ/wiJ1N4yRGjIa5PFDL2ashpaM1yNIwWTfGJx5Tb3LXjXPvBjrv/tSVYX1xHU6rNUMA2dq8OQZoGD/l8Kk5Jx/a1yDeT/PwCYUSPQMYjgzDGNJcjYt/Ez5SoT9jSYu5Sa4BKXIPEmuEORE952UjdWN/QzhoG27w47DBWIw00KBkdTcrDnEiLqE+zPdLuj6QLtf2yrphGgvw49/+NfxdbqsCLOze/jT1CzxQPKoR2fbTGJbb3cZKeB+fjFCR/NOpUWhTmL9LNXYAxpH+Hk28yZlMqo2pmkBs9ayDdKXTAhhtkGa0yoX2AVqV2HkTesX7IfBRKDsMC66UR5h0hw3pAWywfawDvkLxdsEw1J9ke6/4vaUL38YSy86OHTkIhX9RXZYcOFZRlTG3/BpJI5lCf9pvYSvavOQvm+AZStWzLenS+AtC0WXzvjFyd2dLyuvHbcUXrsDdZbC9KmcYygQ2pWMxK4OuMmlIttvVO/U2DR/ZwwNnfZaEJBD2o6YmzEI1jS8jiZFhTzVidvT8it73EdlfOdQrVmMMpXX31kNZsuXiSKPrHMrA5l2uDCdeG68ZLNOaLUX9dyTGWxCUmiWg/ikKugjHoZFxI7/7iGXxdk1BNwYyyFrYs13ZxT9nEyVjWkZaqQAxqLO1AQ7mXq3/9VvNIk0gw35Ectk5Vc0vrh6PSfbYXmCoMDWPssnTNZOMYgTNH8TeaxiH9s0nU1HIzzjJ5ok22ikhyOY7Jl+xSQErBODocZ3dre+MTiizQcKzoLvtYQboqwgcrX3AfE4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(40470700004)(36840700001)(46966006)(1076003)(8936002)(2616005)(478600001)(40480700001)(86362001)(83380400001)(6666004)(26005)(336012)(41300700001)(2906002)(47076005)(40460700003)(426003)(186003)(36756003)(82310400005)(44832011)(5660300002)(356005)(70586007)(4326008)(316002)(82740400003)(70206006)(8676002)(81166007)(54906003)(6916009)(7696005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3178
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	af45ea87-b81d-4267-d5a6-08da60f1e4c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vt7KHSsxr9ifytSGnW7xWXyQxwgCTecBeyZt2MgShdrcVDHVlrHIhg6dL2enh88VbX59SAjP0cAtuXgLFDNglhclfRVOJNVLP3PyTSQJKFuJ+p8VnvaOGWKyw9UNInyRZxfJr85F1dVwv09d3QhXrz7/yGcy1sD8aHzTxMDlFR+DWR+2YSBGlbRgw9ujdgJu/1KJ4I3LcDfwHtR2whh38KWjZluS9tgBpWjWG/2UYGhY8i0CQfSoEsj0ZFqGYXT2QSuY17hfNWTayZDThgRBs7MfmDSoJe/5LqqzMtt5yJ+SFj3Z4m4CsXm0NIoo8BUl5/JyR4NhwS4TP+36A5T9w6TaBU85zFg2UEdW08CgvuV+l6mpCmVK80giINlFG9FUR9idNj6/E4l4CulMsGxxCm4zIfkC7hNUiJ7ABI9EypWaSSzvZp8x+/UQV2j2GWYMXueWDTdW26vHAMxpKEMYkCYN+AYzcDXBZ/32hxdI320YmV13NQvbfT2F+rStSFFeO7NC8vqU/wHTMPy3Eo12eazOSQU/cuWBhzFxkNW+KsOZYn6OjDcNeVk5Ly9JN1AQad5SgfI5XhHUDEg5/RFdeqIuN9ZxRyaFeWzHxTRV5d4e1aa0TimOzSvN7cvVYjDeVzk51qbkWBcHvUkqjU0hWKXiNHvSy6zqysJsw5DzJ9EiFtJbsOzmZcj0j5CkWrUziLifYluByi58FjdyK2sShwb0ElxGbthcsdRvEliH+9km2EpW2B9+Zr+ve7dJwoennAXuZ0de4VJkcR5f+lX4z9YtNbpZ8vi8CPJxoxtgNSkhwxJw4QrZMWlbJmyNgfO9
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(376002)(39860400002)(40470700004)(46966006)(36840700001)(83380400001)(1076003)(426003)(86362001)(186003)(36756003)(2616005)(40460700003)(81166007)(47076005)(36860700001)(107886003)(336012)(8676002)(316002)(70586007)(478600001)(82740400003)(8936002)(44832011)(5660300002)(2906002)(54906003)(6916009)(82310400005)(4326008)(26005)(70206006)(41300700001)(7696005)(40480700001)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 14:55:35.8934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69039600-7f7e-4b18-43bb-08da60f1ea35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032

We have moved acpi_scan_nodes from x86 to common. Because of
of our previous work, this function no longer has many ACPI
characteristics, except some "SRAT" words in print messages.
So we rename acpi_scan_nodes to a more generic name
numa_scan_nodes, and replace "SRAT" words in print messages.

After doing this, it doesn't make sense to use CONFIG_ACPI_NUMA
to gate numa_scan_nodes in numa_initmem_init. As CONFIG_ACPI_NUMA
will be selected by CONFIG_NUMA for x86. So, we replace
CONFIG_ACPI_NUMA by CONFIG_NUMA.

We take this opportunity to make this function static, since
it currently has no external callers.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Merge two patches into this patch:
   1. replace CONFIG_ACPI_NUMA by CONFIG_NUMA.
   2. replace "SRAT" texts.
2. Turn numa_scan_nodes to static.
---
 xen/arch/x86/include/asm/acpi.h |  1 -
 xen/common/numa.c               | 10 +++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index ab0d56dd70..f6ea3f1a9a 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -101,7 +101,6 @@ extern unsigned long acpi_wakeup_address;
 
 #define ARCH_HAS_POWER_INIT	1
 
-extern int acpi_scan_nodes(u64 start, u64 end);
 #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
 
 extern struct acpi_sleep_info acpi_sinfo;
diff --git a/xen/common/numa.c b/xen/common/numa.c
index 5ab061e991..0f62638e4c 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -285,7 +285,7 @@ static int __init nodes_cover_memory(void)
 }
 
 /* Use the information discovered above to actually set up the nodes. */
-int __init acpi_scan_nodes(paddr_t start, paddr_t end)
+static int __init numa_scan_nodes(paddr_t start, paddr_t end)
 {
     int i;
     nodemask_t all_nodes_parsed;
@@ -310,7 +310,7 @@ int __init acpi_scan_nodes(paddr_t start, paddr_t end)
     if ( memnode_shift < 0 )
     {
         printk(KERN_ERR
-               "SRAT: No NUMA node hash function found. Contact maintainer\n");
+               "NUMA: No NUMA node hash function found. Contact maintainer\n");
         numa_bad();
         return -1;
     }
@@ -323,7 +323,7 @@ int __init acpi_scan_nodes(paddr_t start, paddr_t end)
         paddr_t size = nodes[i].end - nodes[i].start;
 
         if ( size == 0 )
-            printk(KERN_INFO "SRAT: node %u has no memory\n", i);
+            printk(KERN_INFO "NUMA: node %u has no memory\n", i);
 
         setup_node_bootmem(i, nodes[i].start, nodes[i].end);
     }
@@ -540,8 +540,8 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
         return;
 #endif
 
-#ifdef CONFIG_ACPI_NUMA
-    if ( numa_status != numa_off && !acpi_scan_nodes(start, end) )
+#ifdef CONFIG_NUMA
+    if ( numa_status != numa_off && !numa_scan_nodes(start, end) )
         return;
 #endif
 
-- 
2.25.1


