Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HOlIHae5mmyywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:45:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADFF43455A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:45:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288185.1568505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwQY-00088H-AS; Mon, 20 Apr 2026 21:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288185.1568505; Mon, 20 Apr 2026 21:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwQY-00085P-7D; Mon, 20 Apr 2026 21:45:10 +0000
Received: by outflank-mailman (input) for mailman id 1288185;
 Mon, 20 Apr 2026 21:45:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwQV-00085F-MX
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:45:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwQV-00EhI8-2k
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:45:07 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69e5e-bab6-0a2a0a5309dd-0a2a450b817c-8
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:45:07 +0200
Received: from [52.101.57.77]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b8f-212f-0a2a450b0019-3465394d8112-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:04 +0200
Received: from BN9PR03CA0286.namprd03.prod.outlook.com (2603:10b6:408:f5::21)
 by CO1PR08MB6817.namprd08.prod.outlook.com (2603:10b6:303:9c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:32:53 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:408:f5:cafe::f8) by BN9PR03CA0286.outlook.office365.com
 (2603:10b6:408:f5::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:53 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.4
 via Frontend Transport; Mon, 20 Apr 2026 21:32:52 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzH774ysz1wdM; 
 Mon, 20 Apr 2026 14:32:51 -0700 (PDT)
Received: from BL2PR08CU001.outbound.protection.outlook.com
 (mail-bl2pr08cu00105.outbound.protection.outlook.com [40.93.4.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:32:51 -0700 (PDT)
Received: from BY1P220CA0046.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::8)
 by DM8PR08MB7271.namprd08.prod.outlook.com (2603:10b6:8:22::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:32:44 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:59e:cafe::72) by BY1P220CA0046.outlook.office365.com
 (2603:10b6:a03:59e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:44 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:43 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:39 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=elektrobit.com header.i="@elektrobit.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=elektrobit.com header.i="@elektrobit.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pnyppxpAA3E7zRPcVFx6M91T4j8AsaHdNvq5ZUIIflMQ8ZOBCJkpUTYIfDA9BPkMKozd1bIPKD4SkgsMmvqwzUhdkXNAK5mpZTSrNS3k8DD6j7IdTtI8drMfZ0B/J65f3Qr9BljBSueCqEnLfjSLqqmHlZno5EhV0TsTOF1aYBNKQZELNuHjF5bwM8VvxwNanSjUiGB+dj0WApHbPRIqmh1TJTkOz8/qEXdaweWuURkhT6W9xjOP7YDcfwVF4FAAqAIjRTrFYbTJZ8cUOJKFfIrXPUrhSvm3acLLkpZNHNbLXOCQFqNeLEKtao0njCxc+5j3SxOuXeznfyLGzvbWiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55tm/2wld/ywUdSampZbkiV4LluAQpXTHs92fXHMAOY=;
 b=gRISS/cFL0qpEyI6pTTxim4jik+LLlLp/u2B+FIhUZpod+Kv6Wn5fYDYXhoa5lUZtojkAulTWW1ELqS5k2VMsvQJySAznZGBNtrAL0HyxhoyOWlN9hpw/enL8gLkZCVjIJLkhUB36gA70aDC/92hWCTw4Kfq0NwbLLaPtyBNw6ZjET3C/7IbAEjc2epJkujj7E48LBmGRwlXxBoQzWLcT+UWsv7oaX+gjZtBWMhYXcTK8/vQp+hyIcr4qhG05/rn4Y9wrerQpt9NIaG/ZEXOqMTlt4h20gLo2LryqQ7QQJtDqgvyxI6fshq7/sPLppMqAcvEuvg1kUgECSt8BUusEg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.4.13) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55tm/2wld/ywUdSampZbkiV4LluAQpXTHs92fXHMAOY=;
 b=SiTLjSx1ykHdZF28raPtmnOKKxizfDxxpy2vDyLOE/2YmCvmek9zKPdle87OsVa7v3uhSndpDeVYRceDqQMXuS3Ph0RAx2mZNx2QYzQvHPu5L5tFuTYyfTv/1llDgUT0jmKoHOKZs/ewbuQpxYnzSyWMu9fY876pw805+5RsBDE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.4.13)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.4.13 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.4.13; helo=BL2PR08CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rp45S8N4WhXSQ5x/KRV2UADsLQ8IF9DIWn+IeKyxwVYtCIKPjPMHMbJwhx7Rko55NX0/dfILYuoyRGLtFGsgE8gvCRwCh9kdvsE9EJQRrsZSTi5xNW20HZhT/tfPMebUT9cvYpo9PYIFcEC79zSscLHCJxl2DcRIbPc5uF9gfNYuJWPqnzIf35JZKjfBvV6y1hwguiT91qEMJ9Od4T0snqzTD/fOaUDHY9pn0FCXARQGPBlHmWGS7GyJQDICVZPDiDafe3hh2I1fBUGvkO2M7CHSE8Z/iD6e+KyhxzgxxhjZr3YHthGYx4wVb4ledK+9aUrttM7O8SrrcmC2mJ2LfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55tm/2wld/ywUdSampZbkiV4LluAQpXTHs92fXHMAOY=;
 b=VSKicZh+8sPFO9i5ZrgVYsWkxHjypGOhrl0bVmJIiEaTYwdGO7klCmvJlhLjKobVVgG6uINiZOR5BxU4o5aV8lakdETTvGpz1HRQXfNbUjbf5RTZeqQDrzD4PTZgFun///LPb0QRauX4/6ocSubBp1ECJu6/FCBbUaqjvZmIE6dzKb7lSPScUYMCS6BdIrKnzciQCCdcwDp9WIHnnW5DQ6+HL8TMaMNQi7WGccXHykSDQjArW+V/1nZ0LZXxItWUh0DoBWcKBD4zgiCeKywgR7ZksDgcUQo2FZjqvYToPJVv5gqWQenj8DJcdN2n0Ltfr2nFxDLgts4cErj6dEHS0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55tm/2wld/ywUdSampZbkiV4LluAQpXTHs92fXHMAOY=;
 b=SiTLjSx1ykHdZF28raPtmnOKKxizfDxxpy2vDyLOE/2YmCvmek9zKPdle87OsVa7v3uhSndpDeVYRceDqQMXuS3Ph0RAx2mZNx2QYzQvHPu5L5tFuTYyfTv/1llDgUT0jmKoHOKZs/ewbuQpxYnzSyWMu9fY876pw805+5RsBDE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Rose Spangler <Rose.Spangler@elektrobit.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Aqib Javaid <Aqib.Javaid@elektrobit.com>
Subject: [RFC PATCH v6 09/43] altp2m: Move do_altp2m_op to common code
Date: Mon, 20 Apr 2026 17:31:32 -0400
Message-ID: <20260420213206.208750-10-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420213206.208750-1-Rose.Spangler@elektrobit.com>
References: <20260420213206.208750-1-Rose.Spangler@elektrobit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.10.178.50]
X-ClientProxiedBy: denue6es012.ebgroup.elektrobit.com (10.243.160.140) To
 denue6es012.ebgroup.elektrobit.com (10.243.160.140)
X-EOPAttributedMessage: 1
X-MS-Exchange-SkipListedInternetSender:
 ip=[213.95.148.172];domain=denue6es012.ebgroup.elektrobit.com
X-MS-TrafficTypeDiagnostic:
	SJ1PEPF000026C8:EE_|DM8PR08MB7271:EE_|BN3PEPF0000B070:EE_|CO1PR08MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 47507922-bb98-4df0-2e62-08de9f246136
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704162011799003|82310400026|36860700016|7416014|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?SHUEldrYkAhFQ+nVB9DhSRyKpjWwDtEbjlykvRdGcbtansw/6piyHsFjOFLa?=
 =?us-ascii?Q?olKRgJfTvpwHyqCpBubvqS/p9hj6dlQqbsA6qilnNJAEY9YYOlZo4YPSScT5?=
 =?us-ascii?Q?zfXOULt1z0oMr8S7GjEAZumazMQ4ze/LESh0JroiC2PecFc3QiFm+/A7ze5M?=
 =?us-ascii?Q?RrFS9os0/DJKVI4B2F9nV64hW6xCd0D4JNabV8keiKnd8Hj3XsKxbXQZffUf?=
 =?us-ascii?Q?6Mti1up6lV6kFO1gilUVGXaqjr2refJiEIEn8hulAyOqTYw3a6lhN27PdJy1?=
 =?us-ascii?Q?lE00WzpKwf4lAiKBCTzprq+PsFsgXWSiNJb3jvnsrV2nwYpvox8qADewOvsD?=
 =?us-ascii?Q?3VKYNWgxNVundOMHAzDtaYSt4qJNtxd6N5Au/TaW8HMoeCH7EAFoSzE42FIl?=
 =?us-ascii?Q?ynNc9HqL/lPgCYdsl0/tWrL6CMrIMpAfj6rMGBMS3dgUxBgZQYCtMJLTIzRF?=
 =?us-ascii?Q?KZM3uoRWANBpS8Ol1CSS9kVZX24kWctTEp+yqKm215EHBuuPDwRzjUz/Qkd2?=
 =?us-ascii?Q?TQ3jusOIhlNfvP+TWZVHPe7Iy5BJDXn3LarFT5buaADpQSUeBYtWrLF2BY72?=
 =?us-ascii?Q?Iza0aDo1zdx3r1Nw1gZ++GtCVP/j7ofCkVZikcbm26SAayScwkTGNO8u9L7u?=
 =?us-ascii?Q?Q78HileowASVOmig6ZC4VuIG2TNYWG/MYSXq5cYISZp599xDWFjlxmEw9Vat?=
 =?us-ascii?Q?5GSEr5KL62q+/J0fih1KTFsg3fK/YgEWJCjhsaBRYR60o8fa6s6FzAK0eReT?=
 =?us-ascii?Q?Vo8qXctLLe2n3E2AcB676XQd3viKROSPm32evUjPzX9gLpuBkeYR9IU+YPyR?=
 =?us-ascii?Q?bVOW8J4iR8ZJZt2jZHz/aMRmLqU1aQlYca7UoGjT88Alzt4mjrGCBB5qvk5B?=
 =?us-ascii?Q?fICkheaSHvQeKk2qxvWm7g4t3uci3BaM0jSYoDqNqe4YnWT9NsvuMM4Dsf80?=
 =?us-ascii?Q?iPXrvvafD0rWXGk0QphjDo8HIvlSJe/81BnW+Mdkrt+huYtdGqt2sOzRSuXe?=
 =?us-ascii?Q?vViZLf5Jehww3jRQC0Gfv+2a1U/C2bsAwSp1uwlm/wrcaWktRRLmH7XsEo1I?=
 =?us-ascii?Q?AxwLdnCTxqk+CbVHFyJK/rq/O4alD1seYLueb9Mjexdgk1jzHIkYHB2RyOVV?=
 =?us-ascii?Q?ki/liqJWJ0q5WHtOAeb6pWSheoGoq/WnXQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704162011799003)(82310400026)(36860700016)(7416014)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 BLjFGyhl2K9k0t7gY774NSPZU2JXQuDbcFeusIilE6LgEPgzAYnY6VERNirFz4bceaJmoyXnfF0qpqt2jSfRZyDyElcOWvUr8j9olC83LuyoJwgiMPt/epnzAmGUUNSqAuFybi8gKWVQkuegD9zwUs4FxsfIDIl2gOOGCtenX/977xOq0a+PHuvjr/eJXqY+fyZVWm43sSGztg4GvzLDi7jOiZUMtTKbIC3JgXyYjmrDelSBz8UIA1zwvjUeRzuIaCsd4GeDZ4AkJb6U/cVkL+u223SK2WVkeJNYV63eJ720i6Rmy/tymXDdpB4TIZevjwGLE3T950J3qB3TjvS+oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR08MB7271
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.4.13];domain=BL2PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.4.13];domain=BL2PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	174e58aa-364c-42b9-a31d-08de9f245b72
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704162011799003|156008|82310400026|35042699022|14060799003|36860700016|7416014|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?83jfayWjlb6NtX0//b/KFfzyMS9Crw4UIO/skIF09D7sme/wcVGRxc96V4u3?=
 =?us-ascii?Q?vwmRZmnYuMBHQA3krFwHNaJ7QiOAq8coJtYXQpnDXprimjyBmI47/9mptJX3?=
 =?us-ascii?Q?VSGPkCeKdV5tUjsRfa7XOboOd/IANQCYJLAZDXg6Cg+/Nxz5ognKoQR92C2J?=
 =?us-ascii?Q?3/yhupbG85VarcOE6vE/mB9v+zAXQ/hXp8k/qZxDQ+6++rflkoufYax36GbK?=
 =?us-ascii?Q?2fKqDOazXW9rGgO6Nk6ZTtnu0JR5F3jJFbzerGq+tIgJmjXfAqK2xDb2rzuI?=
 =?us-ascii?Q?Vn313ThPuH1qeBDV0TXjwtPn/tNkAklL1Ut7xCm9hDRDC0mN0pkz4nEEC46E?=
 =?us-ascii?Q?k3gsqnl7J2toGnO4ZQ3tP2wMH4cNoEuUbGsaflX4HrmB1/So72PdMG2Fjz5j?=
 =?us-ascii?Q?0Q3VsY+d0IS9a9PCDHkdX/nFcHxGTxQvt11dpzJkvn8L3fI1LA5bBkewfEPX?=
 =?us-ascii?Q?wVkRZKC8TlS/z6/9Otkz/jjHQucGEVCuUE1v6j9T1xSoY0XuRAS2p4HsaemK?=
 =?us-ascii?Q?rebeWiPRQ40lLEoaaKv6jIG7jchEVDG/DCjnePdPsWfrjypuC9Q+JV3Gfarp?=
 =?us-ascii?Q?YGW5EOZIMgMbAU1+x9/sjohhjjflARZr5eVwCjYNIqXzIcRm8MG+BmZFToUf?=
 =?us-ascii?Q?w9LPrfDgxyLM3G0L7QFcUdPXQFMhIRn2glKm9lUwUpXbuGZMDmazADpqeC2q?=
 =?us-ascii?Q?QZEOvc17YWE8r/9YzbuV5D6mftIc7lp2yNqJn9ft0zlEq6oI9srJVN/jxGzr?=
 =?us-ascii?Q?0Mp8G1E9mC25wZ8gJQRvIcReqU0YGwNwAA5IGeyG9eU4pl3uaZtbz3FYEQLs?=
 =?us-ascii?Q?OhjMe3oHXNyWZoG458/fIIilZiKm8FSVljXew6eRPyOKx3Gi7JMjlBpFAsWr?=
 =?us-ascii?Q?wX5pRb+gtfql+QDsCOdtKSGb5FWiq2dwXVG7jFZRwDkfGfSoo1znVMHULavm?=
 =?us-ascii?Q?mU2ONsn58Dj0ZkfVASy/5N5OdWrNjbZoetNmmVsW366e2gEFl/9SUBElKroE?=
 =?us-ascii?Q?ti18+qv9BSReJhBoUtDVLPlEu0XL0HTaZAWWGL/u0idfZ2dgEs4we9GTTYbW?=
 =?us-ascii?Q?/AhA8u74XQ++b7QQew0WC5pl2ZAqfvmtbgbcfMqDXCKvzVimaLXMxy6GAbEK?=
 =?us-ascii?Q?uhiEuEmc/QD2/BnyPISp00EK6Lkdj+LC9A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL2PR08CU001.outbound.protection.outlook.com;PTR:mail-bl2pr08cu00105.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704162011799003)(156008)(82310400026)(35042699022)(14060799003)(36860700016)(7416014)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TOFnOmifBHmO1VS6QLW1+Si+aqCZQ6b5YGqmNFJL9R8/+I+5VLnBIGWxZqZRFIN24COdczVHvTgm82O0O+Jn5v3NdIsydxZfcxbYkTV4TD1PjpVt6QS+JMGwUdCaBDVdab4O6hk58b3Gf+MVF/fx28B7F7O2UcLZkv08Wjw2ADXVx3rt8TrqMsk77apAX2XBsVNxvo+t/QlZPSM6x81+mmRwzWdcnVtCvWGhzwBjtF//Tx8BwaS6WVlKwFF+IlIx6o/ugYxvuo15j/KL3vmaX9G7vYSdTn2mcGLdsflHeqebn02ygjJFCfqBN6HZQW99jqlssRNToE+yjrL5hxoiWH0vN6YBT7wMiiD3/Y9eVivMWm88gdtSmTSXVGJ3oLS/2CaBEaAg1CxuVFiXCxWfliV2+6z59MSRVIg6khyYmwqcNslFxOhy3jlD6b4VaACc
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:32:52.8449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47507922-bb98-4df0-2e62-08de9f246136
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR08MB6817
X-purgate-ID: tlsNG-42698a/1776720784-07F7EF3B-1E434C2F/37/8714975798-1487109
X-purgate-type: bulk
X-purgate-size: 26338
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:Aqib.Javaid@elektrobit.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.922];
	HAS_XOIP(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,elektrobit.com:email,elektrobit.com:dkim,elektrobit.com:mid]
X-Rspamd-Queue-Id: 8ADFF43455A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit moves the altp2m HVMOP implementation to common code, making it
possible to re-use it across architectures. In this commit, the entire
implementation is gated behind CONFIG_X86, with no changes to the body of
do_altp2m_op. A stub implementation is added for ARM, which will be removed
once do_altp2m_op has been modified to add ARM support.

This commit contains only code movement, and no change in functionality is
intended.

This is commit 1/2 of the common do_altp2m_op phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Aqib Javaid <Aqib.Javaid@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/hvm/hvm.c   | 400 -------------------------------------
 xen/common/altp2m.c      | 413 +++++++++++++++++++++++++++++++++++++++
 xen/include/xen/altp2m.h |  11 ++
 3 files changed, 424 insertions(+), 400 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 5b6e91adce17..4adcc3c49d95 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4526,406 +4526,6 @@ static int hvmop_get_param(
     return rc;
 }
 
-/*
- * altp2m operations are envisioned as being used in several different
- * modes:
- *
- * - external: All control and decisions are made by an external agent
- *   running domain 0.
- *
- * - internal: altp2m operations are used exclusively by an in-guest
- *   agent to protect itself from the guest kernel and in-guest
- *   attackers.
- *
- * - coordinated: An in-guest agent handles #VE and VMFUNCs locally,
- *   but makes requests of an agent running outside the domain for
- *   bigger changes (such as modifying altp2m entires).
- *
- * This corresponds to the three values for HVM_PARAM_ALTP2M
- * (external, mixed, limited). All three models have advantages and
- * disadvantages.
- *
- * Normally hypercalls made by a program in domain 0 in order to
- * control a guest would be DOMCTLs rather than HVMOPs.  But in order
- * to properly enable the 'internal' use case, as well as to avoid
- * fragmentation, all altp2m subops should come under this single
- * HVMOP.
- *
- * Note that 'internal' mode (HVM_PARAM_ALTP2M == XEN_ALTP2M_mixed)
- * has not been evaluated for safety from a security perspective.
- * Before using this mode in a security-critical environment, each
- * subop should be evaluated for safety, with unsafe subops
- * blacklisted in xsm_hvm_altp2mhvm_op().
- */
-static int do_altp2m_op(
-    XEN_GUEST_HANDLE_PARAM(void) arg)
-{
-#ifdef CONFIG_ALTP2M
-    struct xen_hvm_altp2m_op a;
-    struct domain *d = NULL;
-    int rc = 0;
-    uint64_t mode;
-
-    if ( !altp2m_supported() )
-        return -EOPNOTSUPP;
-
-    if ( copy_from_guest(&a, arg, 1) )
-        return -EFAULT;
-
-    if ( a.pad1 || a.pad2 ||
-         (a.version != HVMOP_ALTP2M_INTERFACE_VERSION) )
-        return -EINVAL;
-
-    switch ( a.cmd )
-    {
-    case HVMOP_altp2m_get_domain_state:
-    case HVMOP_altp2m_set_domain_state:
-    case HVMOP_altp2m_vcpu_enable_notify:
-    case HVMOP_altp2m_vcpu_disable_notify:
-    case HVMOP_altp2m_create_p2m:
-    case HVMOP_altp2m_destroy_p2m:
-    case HVMOP_altp2m_switch_p2m:
-    case HVMOP_altp2m_set_suppress_ve:
-    case HVMOP_altp2m_set_suppress_ve_multi:
-    case HVMOP_altp2m_get_suppress_ve:
-    case HVMOP_altp2m_set_mem_access:
-    case HVMOP_altp2m_set_mem_access_multi:
-    case HVMOP_altp2m_get_mem_access:
-    case HVMOP_altp2m_change_gfn:
-    case HVMOP_altp2m_get_p2m_idx:
-    case HVMOP_altp2m_set_visibility:
-        break;
-
-    default:
-        return -EOPNOTSUPP;
-    }
-
-    d = rcu_lock_domain_by_any_id(a.domain);
-
-    if ( d == NULL )
-        return -ESRCH;
-
-    if ( !is_hvm_domain(d) )
-    {
-        rc = -EOPNOTSUPP;
-        goto out;
-    }
-
-    if ( (a.cmd != HVMOP_altp2m_get_domain_state) &&
-         (a.cmd != HVMOP_altp2m_set_domain_state) &&
-         !d->altp2m_active )
-    {
-        rc = -EOPNOTSUPP;
-        goto out;
-    }
-
-    mode = d->arch.hvm.params[HVM_PARAM_ALTP2M];
-
-    if ( XEN_ALTP2M_disabled == mode )
-    {
-        rc = -EINVAL;
-        goto out;
-    }
-
-    if ( d->nr_altp2m == 0 )
-    {
-        rc = -EOPNOTSUPP;
-        goto out;
-    }
-
-    if ( (rc = xsm_hvm_altp2mhvm_op(XSM_OTHER, d, mode, a.cmd)) )
-        goto out;
-
-    switch ( a.cmd )
-    {
-    case HVMOP_altp2m_get_domain_state:
-        a.u.domain_state.state = altp2m_active(d);
-        rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
-        break;
-
-    case HVMOP_altp2m_set_domain_state:
-    {
-        struct vcpu *v;
-        bool ostate;
-
-        if ( nestedhvm_enabled(d) )
-        {
-            rc = -EINVAL;
-            break;
-        }
-
-        rc = domain_pause_except_self(d);
-        if ( rc )
-            break;
-
-        ostate = d->altp2m_active;
-        d->altp2m_active = !!a.u.domain_state.state;
-
-        /* If the alternate p2m state has changed, handle appropriately */
-        if ( d->altp2m_active != ostate &&
-             (ostate || !(rc = altp2m_init_by_id(d, 0))) )
-        {
-            for_each_vcpu( d, v )
-            {
-                if ( !ostate )
-                    altp2m_vcpu_initialise(v);
-                else
-                    altp2m_vcpu_destroy(v);
-            }
-
-            if ( ostate )
-                altp2m_flush(d);
-        }
-        else if ( rc )
-            d->altp2m_active = false;
-
-        domain_unpause_except_self(d);
-        break;
-    }
-
-    case HVMOP_altp2m_vcpu_enable_notify:
-    {
-        struct vcpu *v;
-
-        if ( a.u.enable_notify.pad ||
-             a.u.enable_notify.vcpu_id >= d->max_vcpus )
-        {
-            rc = -EINVAL;
-            break;
-        }
-
-        if ( !cpu_has_vmx_virt_exceptions )
-        {
-            rc = -EOPNOTSUPP;
-            break;
-        }
-
-        v = d->vcpu[a.u.enable_notify.vcpu_id];
-
-        rc = altp2m_vcpu_enable_ve(v, _gfn(a.u.enable_notify.gfn));
-        break;
-    }
-
-    case HVMOP_altp2m_vcpu_disable_notify:
-    {
-        struct vcpu *v;
-
-        if ( a.u.disable_notify.vcpu_id >= d->max_vcpus )
-        {
-            rc = -EINVAL;
-            break;
-        }
-
-        if ( !cpu_has_vmx_virt_exceptions )
-        {
-            rc = -EOPNOTSUPP;
-            break;
-        }
-
-        v = d->vcpu[a.u.enable_notify.vcpu_id];
-
-        altp2m_vcpu_disable_ve(v);
-        break;
-    }
-
-    case HVMOP_altp2m_create_p2m:
-        rc = altp2m_init_next_available(d, &a.u.view.view,
-                                        a.u.view.hvmmem_default_access);
-        if ( !rc )
-            rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
-        break;
-
-    case HVMOP_altp2m_destroy_p2m:
-        rc = altp2m_destroy_by_id(d, a.u.view.view);
-        break;
-
-    case HVMOP_altp2m_switch_p2m:
-        rc = altp2m_switch_domain_altp2m_by_id(d, a.u.view.view);
-        break;
-
-    case HVMOP_altp2m_set_suppress_ve:
-        if ( a.u.suppress_ve.pad1 || a.u.suppress_ve.pad2 )
-            rc = -EINVAL;
-        else
-        {
-            gfn_t gfn = _gfn(a.u.suppress_ve.gfn);
-            unsigned int altp2m_idx = a.u.suppress_ve.view;
-            bool suppress_ve = a.u.suppress_ve.suppress_ve;
-
-            rc = p2m_set_suppress_ve(d, gfn, suppress_ve, altp2m_idx);
-        }
-        break;
-
-    case HVMOP_altp2m_set_suppress_ve_multi:
-    {
-        uint64_t max_phys_addr = (1UL << d->arch.cpuid->extd.maxphysaddr) - 1;
-
-        a.u.suppress_ve_multi.last_gfn = min(a.u.suppress_ve_multi.last_gfn,
-                                             max_phys_addr);
-
-        if ( a.u.suppress_ve_multi.pad1 ||
-             a.u.suppress_ve_multi.first_gfn > a.u.suppress_ve_multi.last_gfn )
-            rc = -EINVAL;
-        else
-        {
-            rc = p2m_set_suppress_ve_multi(d, &a.u.suppress_ve_multi);
-            if ( (!rc || rc == -ERESTART) && __copy_to_guest(arg, &a, 1) )
-                rc = -EFAULT;
-        }
-        break;
-    }
-
-    case HVMOP_altp2m_get_suppress_ve:
-        if ( a.u.suppress_ve.pad1 || a.u.suppress_ve.pad2 )
-            rc = -EINVAL;
-        else
-        {
-            gfn_t gfn = _gfn(a.u.suppress_ve.gfn);
-            unsigned int altp2m_idx = a.u.suppress_ve.view;
-            bool suppress_ve;
-
-            rc = p2m_get_suppress_ve(d, gfn, &suppress_ve, altp2m_idx);
-            if ( !rc )
-            {
-                a.u.suppress_ve.suppress_ve = suppress_ve;
-                rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
-            }
-        }
-        break;
-
-    case HVMOP_altp2m_set_mem_access:
-        if ( !vm_event_is_enabled(current) )
-        {
-            rc = -EOPNOTSUPP;
-            break;
-        }
-
-        if ( a.u.mem_access.pad )
-            rc = -EINVAL;
-        else
-            rc = p2m_set_mem_access(d, _gfn(a.u.mem_access.gfn), 1, 0, 0,
-                                    a.u.mem_access.access,
-                                    a.u.mem_access.view);
-        break;
-
-    case HVMOP_altp2m_set_mem_access_multi:
-        if ( !vm_event_is_enabled(current) )
-        {
-            rc = -EOPNOTSUPP;
-            break;
-        }
-
-        if ( a.u.set_mem_access_multi.pad ||
-             a.u.set_mem_access_multi.opaque > a.u.set_mem_access_multi.nr )
-        {
-            rc = -EINVAL;
-            break;
-        }
-
-        /*
-         * Unlike XENMEM_access_op_set_access_multi, we don't need any bits of
-         * the 'continuation' counter to be zero (to stash a command in).
-         * However, 0x40 is a good 'stride' to make sure that we make
-         * a reasonable amount of forward progress before yielding,
-         * so use a mask of 0x3F here.
-         */
-        rc = p2m_set_mem_access_multi(d, a.u.set_mem_access_multi.pfn_list,
-                                      a.u.set_mem_access_multi.access_list,
-                                      a.u.set_mem_access_multi.nr,
-                                      a.u.set_mem_access_multi.opaque,
-                                      0x3F,
-                                      a.u.set_mem_access_multi.view);
-        if ( rc > 0 )
-        {
-            a.u.set_mem_access_multi.opaque = rc;
-            rc = -ERESTART;
-            if ( __copy_field_to_guest(guest_handle_cast(arg, xen_hvm_altp2m_op_t),
-                                       &a, u.set_mem_access_multi.opaque) )
-                rc = -EFAULT;
-        }
-        break;
-
-    case HVMOP_altp2m_get_mem_access:
-        if ( !vm_event_is_enabled(current) )
-        {
-            rc = -EOPNOTSUPP;
-            break;
-        }
-
-        if ( a.u.mem_access.pad )
-            rc = -EINVAL;
-        else
-        {
-            xenmem_access_t access;
-
-            rc = p2m_get_mem_access(d, _gfn(a.u.mem_access.gfn), &access,
-                                    a.u.mem_access.view);
-            if ( !rc )
-            {
-                a.u.mem_access.access = access;
-                rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
-            }
-        }
-        break;
-
-    case HVMOP_altp2m_change_gfn:
-        if ( a.u.change_gfn.pad1 || a.u.change_gfn.pad2 )
-            rc = -EINVAL;
-        else
-            rc = altp2m_change_gfn(d, a.u.change_gfn.view,
-                                   _gfn(a.u.change_gfn.old_gfn),
-                                   _gfn(a.u.change_gfn.new_gfn));
-        break;
-
-    case HVMOP_altp2m_get_p2m_idx:
-    {
-        struct vcpu *v;
-
-        if ( !altp2m_active(d) )
-        {
-            rc = -EOPNOTSUPP;
-            break;
-        }
-
-        if ( (v = domain_vcpu(d, a.u.get_vcpu_p2m_idx.vcpu_id)) == NULL )
-        {
-            rc = -EINVAL;
-            break;
-        }
-
-        a.u.get_vcpu_p2m_idx.altp2m_idx = altp2m_vcpu_idx(v);
-        rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
-        break;
-    }
-
-    case HVMOP_altp2m_set_visibility:
-    {
-        unsigned int idx = a.u.set_visibility.altp2m_idx;
-
-        if ( a.u.set_visibility.pad )
-            rc = -EINVAL;
-        else if ( !altp2m_active(d) )
-            rc = -EOPNOTSUPP;
-        else
-            rc = altp2m_set_view_visibility(d, idx, a.u.set_visibility.visible);
-        break;
-    }
-
-    default:
-        ASSERT_UNREACHABLE();
-        rc = -EOPNOTSUPP;
-        break;
-    }
-
- out:
-    rcu_unlock_domain(d);
-
-    return rc;
-#else /* !CONFIG_ALTP2M */
-    return -EOPNOTSUPP;
-#endif /* CONFIG_ALTP2M */
-}
-
 DEFINE_XEN_GUEST_HANDLE(compat_hvm_altp2m_op_t);
 
 /*
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index 1a4e102324d4..a43b3a3e34b3 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -1,5 +1,418 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include <xen/altp2m.h>
+#include <xen/guest_access.h>
+#include <xen/vm_event.h>
+
+#include <asm/altp2m.h>
+
+#include <public/hvm/params.h>
+
+#include <xsm/xsm.h>
+
+#ifdef CONFIG_X86
+#include <asm/hvm/nestedhvm.h>
+/*
+ * altp2m operations are envisioned as being used in several different
+ * modes:
+ *
+ * - external: All control and decisions are made by an external agent
+ *   running domain 0.
+ *
+ * - internal: altp2m operations are used exclusively by an in-guest
+ *   agent to protect itself from the guest kernel and in-guest
+ *   attackers.
+ *
+ * - coordinated: An in-guest agent handles #VE and VMFUNCs locally,
+ *   but makes requests of an agent running outside the domain for
+ *   bigger changes (such as modifying altp2m entires).
+ *
+ * This corresponds to the three values for HVM_PARAM_ALTP2M
+ * (external, mixed, limited). All three models have advantages and
+ * disadvantages.
+ *
+ * Normally hypercalls made by a program in domain 0 in order to
+ * control a guest would be DOMCTLs rather than HVMOPs.  But in order
+ * to properly enable the 'internal' use case, as well as to avoid
+ * fragmentation, all altp2m subops should come under this single
+ * HVMOP.
+ *
+ * Note that 'internal' mode (HVM_PARAM_ALTP2M == XEN_ALTP2M_mixed)
+ * has not been evaluated for safety from a security perspective.
+ * Before using this mode in a security-critical environment, each
+ * subop should be evaluated for safety, with unsafe subops
+ * blacklisted in xsm_hvm_altp2mhvm_op().
+ */
+int do_altp2m_op(
+    XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    struct xen_hvm_altp2m_op a;
+    struct domain *d = NULL;
+    int rc = 0;
+    uint64_t mode;
+
+    if ( !altp2m_supported() )
+        return -EOPNOTSUPP;
+
+    if ( copy_from_guest(&a, arg, 1) )
+        return -EFAULT;
+
+    if ( a.pad1 || a.pad2 ||
+         (a.version != HVMOP_ALTP2M_INTERFACE_VERSION) )
+        return -EINVAL;
+
+    switch ( a.cmd )
+    {
+    case HVMOP_altp2m_get_domain_state:
+    case HVMOP_altp2m_set_domain_state:
+    case HVMOP_altp2m_vcpu_enable_notify:
+    case HVMOP_altp2m_vcpu_disable_notify:
+    case HVMOP_altp2m_create_p2m:
+    case HVMOP_altp2m_destroy_p2m:
+    case HVMOP_altp2m_switch_p2m:
+    case HVMOP_altp2m_set_suppress_ve:
+    case HVMOP_altp2m_set_suppress_ve_multi:
+    case HVMOP_altp2m_get_suppress_ve:
+    case HVMOP_altp2m_set_mem_access:
+    case HVMOP_altp2m_set_mem_access_multi:
+    case HVMOP_altp2m_get_mem_access:
+    case HVMOP_altp2m_change_gfn:
+    case HVMOP_altp2m_get_p2m_idx:
+    case HVMOP_altp2m_set_visibility:
+        break;
+
+    default:
+        return -EOPNOTSUPP;
+    }
+
+    d = rcu_lock_domain_by_any_id(a.domain);
+
+    if ( d == NULL )
+        return -ESRCH;
+
+    if ( !is_hvm_domain(d) )
+    {
+        rc = -EOPNOTSUPP;
+        goto out;
+    }
+
+    if ( (a.cmd != HVMOP_altp2m_get_domain_state) &&
+         (a.cmd != HVMOP_altp2m_set_domain_state) &&
+         !d->altp2m_active )
+    {
+        rc = -EOPNOTSUPP;
+        goto out;
+    }
+
+    mode = d->arch.hvm.params[HVM_PARAM_ALTP2M];
+
+    if ( XEN_ALTP2M_disabled == mode )
+    {
+        rc = -EINVAL;
+        goto out;
+    }
+
+    if ( d->nr_altp2m == 0 )
+    {
+        rc = -EOPNOTSUPP;
+        goto out;
+    }
+
+    if ( (rc = xsm_hvm_altp2mhvm_op(XSM_OTHER, d, mode, a.cmd)) )
+        goto out;
+
+    switch ( a.cmd )
+    {
+    case HVMOP_altp2m_get_domain_state:
+        a.u.domain_state.state = altp2m_active(d);
+        rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
+        break;
+
+    case HVMOP_altp2m_set_domain_state:
+    {
+        struct vcpu *v;
+        bool ostate;
+
+        if ( nestedhvm_enabled(d) )
+        {
+            rc = -EINVAL;
+            break;
+        }
+
+        rc = domain_pause_except_self(d);
+        if ( rc )
+            break;
+
+        ostate = d->altp2m_active;
+        d->altp2m_active = !!a.u.domain_state.state;
+
+        /* If the alternate p2m state has changed, handle appropriately */
+        if ( d->altp2m_active != ostate &&
+             (ostate || !(rc = altp2m_init_by_id(d, 0))) )
+        {
+            for_each_vcpu( d, v )
+            {
+                if ( !ostate )
+                    altp2m_vcpu_initialise(v);
+                else
+                    altp2m_vcpu_destroy(v);
+            }
+
+            if ( ostate )
+                altp2m_flush(d);
+        }
+        else if ( rc )
+            d->altp2m_active = false;
+
+        domain_unpause_except_self(d);
+        break;
+    }
+
+    case HVMOP_altp2m_vcpu_enable_notify:
+    {
+        struct vcpu *v;
+
+        if ( a.u.enable_notify.pad ||
+             a.u.enable_notify.vcpu_id >= d->max_vcpus )
+        {
+            rc = -EINVAL;
+            break;
+        }
+
+        if ( !cpu_has_vmx_virt_exceptions )
+        {
+            rc = -EOPNOTSUPP;
+            break;
+        }
+
+        v = d->vcpu[a.u.enable_notify.vcpu_id];
+
+        rc = altp2m_vcpu_enable_ve(v, _gfn(a.u.enable_notify.gfn));
+        break;
+    }
+
+    case HVMOP_altp2m_vcpu_disable_notify:
+    {
+        struct vcpu *v;
+
+        if ( a.u.disable_notify.vcpu_id >= d->max_vcpus )
+        {
+            rc = -EINVAL;
+            break;
+        }
+
+        if ( !cpu_has_vmx_virt_exceptions )
+        {
+            rc = -EOPNOTSUPP;
+            break;
+        }
+
+        v = d->vcpu[a.u.enable_notify.vcpu_id];
+
+        altp2m_vcpu_disable_ve(v);
+        break;
+    }
+
+    case HVMOP_altp2m_create_p2m:
+        rc = altp2m_init_next_available(d, &a.u.view.view,
+                                        a.u.view.hvmmem_default_access);
+        if ( !rc )
+            rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
+        break;
+
+    case HVMOP_altp2m_destroy_p2m:
+        rc = altp2m_destroy_by_id(d, a.u.view.view);
+        break;
+
+    case HVMOP_altp2m_switch_p2m:
+        rc = altp2m_switch_domain_altp2m_by_id(d, a.u.view.view);
+        break;
+
+    case HVMOP_altp2m_set_suppress_ve:
+        if ( a.u.suppress_ve.pad1 || a.u.suppress_ve.pad2 )
+            rc = -EINVAL;
+        else
+        {
+            gfn_t gfn = _gfn(a.u.suppress_ve.gfn);
+            unsigned int altp2m_idx = a.u.suppress_ve.view;
+            bool suppress_ve = a.u.suppress_ve.suppress_ve;
+
+            rc = p2m_set_suppress_ve(d, gfn, suppress_ve, altp2m_idx);
+        }
+        break;
+
+    case HVMOP_altp2m_set_suppress_ve_multi:
+    {
+        uint64_t max_phys_addr = (1UL << d->arch.cpuid->extd.maxphysaddr) - 1;
+
+        a.u.suppress_ve_multi.last_gfn = min(a.u.suppress_ve_multi.last_gfn,
+                                             max_phys_addr);
+
+        if ( a.u.suppress_ve_multi.pad1 ||
+             a.u.suppress_ve_multi.first_gfn > a.u.suppress_ve_multi.last_gfn )
+            rc = -EINVAL;
+        else
+        {
+            rc = p2m_set_suppress_ve_multi(d, &a.u.suppress_ve_multi);
+            if ( (!rc || rc == -ERESTART) && __copy_to_guest(arg, &a, 1) )
+                rc = -EFAULT;
+        }
+        break;
+    }
+
+    case HVMOP_altp2m_get_suppress_ve:
+        if ( a.u.suppress_ve.pad1 || a.u.suppress_ve.pad2 )
+            rc = -EINVAL;
+        else
+        {
+            gfn_t gfn = _gfn(a.u.suppress_ve.gfn);
+            unsigned int altp2m_idx = a.u.suppress_ve.view;
+            bool suppress_ve;
+
+            rc = p2m_get_suppress_ve(d, gfn, &suppress_ve, altp2m_idx);
+            if ( !rc )
+            {
+                a.u.suppress_ve.suppress_ve = suppress_ve;
+                rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
+            }
+        }
+        break;
+
+    case HVMOP_altp2m_set_mem_access:
+        if ( !vm_event_is_enabled(current) )
+        {
+            rc = -EOPNOTSUPP;
+            break;
+        }
+
+        if ( a.u.mem_access.pad )
+            rc = -EINVAL;
+        else
+            rc = p2m_set_mem_access(d, _gfn(a.u.mem_access.gfn), 1, 0, 0,
+                                    a.u.mem_access.access,
+                                    a.u.mem_access.view);
+        break;
+
+    case HVMOP_altp2m_set_mem_access_multi:
+        if ( !vm_event_is_enabled(current) )
+        {
+            rc = -EOPNOTSUPP;
+            break;
+        }
+
+        if ( a.u.set_mem_access_multi.pad ||
+             a.u.set_mem_access_multi.opaque > a.u.set_mem_access_multi.nr )
+        {
+            rc = -EINVAL;
+            break;
+        }
+
+        /*
+         * Unlike XENMEM_access_op_set_access_multi, we don't need any bits of
+         * the 'continuation' counter to be zero (to stash a command in).
+         * However, 0x40 is a good 'stride' to make sure that we make
+         * a reasonable amount of forward progress before yielding,
+         * so use a mask of 0x3F here.
+         */
+        rc = p2m_set_mem_access_multi(d, a.u.set_mem_access_multi.pfn_list,
+                                      a.u.set_mem_access_multi.access_list,
+                                      a.u.set_mem_access_multi.nr,
+                                      a.u.set_mem_access_multi.opaque,
+                                      0x3F,
+                                      a.u.set_mem_access_multi.view);
+        if ( rc > 0 )
+        {
+            a.u.set_mem_access_multi.opaque = rc;
+            rc = -ERESTART;
+            if ( __copy_field_to_guest(guest_handle_cast(arg, xen_hvm_altp2m_op_t),
+                                       &a, u.set_mem_access_multi.opaque) )
+                rc = -EFAULT;
+        }
+        break;
+
+    case HVMOP_altp2m_get_mem_access:
+        if ( !vm_event_is_enabled(current) )
+        {
+            rc = -EOPNOTSUPP;
+            break;
+        }
+
+        if ( a.u.mem_access.pad )
+            rc = -EINVAL;
+        else
+        {
+            xenmem_access_t access;
+
+            rc = p2m_get_mem_access(d, _gfn(a.u.mem_access.gfn), &access,
+                                    a.u.mem_access.view);
+            if ( !rc )
+            {
+                a.u.mem_access.access = access;
+                rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
+            }
+        }
+        break;
+
+    case HVMOP_altp2m_change_gfn:
+        if ( a.u.change_gfn.pad1 || a.u.change_gfn.pad2 )
+            rc = -EINVAL;
+        else
+            rc = altp2m_change_gfn(d, a.u.change_gfn.view,
+                                   _gfn(a.u.change_gfn.old_gfn),
+                                   _gfn(a.u.change_gfn.new_gfn));
+        break;
+
+    case HVMOP_altp2m_get_p2m_idx:
+    {
+        struct vcpu *v;
+
+        if ( !altp2m_active(d) )
+        {
+            rc = -EOPNOTSUPP;
+            break;
+        }
+
+        if ( (v = domain_vcpu(d, a.u.get_vcpu_p2m_idx.vcpu_id)) == NULL )
+        {
+            rc = -EINVAL;
+            break;
+        }
+
+        a.u.get_vcpu_p2m_idx.altp2m_idx = altp2m_vcpu_idx(v);
+        rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
+        break;
+    }
+
+    case HVMOP_altp2m_set_visibility:
+    {
+        unsigned int idx = a.u.set_visibility.altp2m_idx;
+
+        if ( a.u.set_visibility.pad )
+            rc = -EINVAL;
+        else if ( !altp2m_active(d) )
+            rc = -EOPNOTSUPP;
+        else
+            rc = altp2m_set_view_visibility(d, idx, a.u.set_visibility.visible);
+        break;
+    }
+
+    default:
+        ASSERT_UNREACHABLE();
+        rc = -EOPNOTSUPP;
+        break;
+    }
+
+ out:
+    rcu_unlock_domain(d);
+
+    return rc;
+}
+#else
+int do_altp2m_op(
+    XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    return -EOPNOTSUPP;
+}
+#endif
 
 /*
  * Local variables:
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index b3b21124dd7e..be627152668a 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -2,8 +2,12 @@
 #ifndef __XEN_ALTP2M_H__
 #define __XEN_ALTP2M_H__
 
+#include <xen/errno.h>
+#include <xen/param.h>
 #include <xen/sched.h>
 
+#include <public/hvm/hvm_op.h>
+
 #ifdef CONFIG_ALTP2M
 
 /* Alternate p2m HVM on/off per domain */
@@ -12,6 +16,8 @@ static inline bool altp2m_active(const struct domain *d)
     return d->altp2m_active;
 }
 
+int do_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg);
+
 #else /* CONFIG_ALTP2M */
 
 static inline bool altp2m_active(const struct domain *d)
@@ -19,6 +25,11 @@ static inline bool altp2m_active(const struct domain *d)
     return false;
 }
 
+static inline int do_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    return -EOPNOTSUPP;
+}
+
 #endif /* CONFIG_ALTP2M */
 
 #endif /* __XEN_ALTP2M_H__ */
-- 
2.34.1


