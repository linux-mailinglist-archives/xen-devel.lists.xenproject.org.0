Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OA7GNKWb5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E646434244
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287791.1568217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwF1-0002By-31; Mon, 20 Apr 2026 21:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287791.1568217; Mon, 20 Apr 2026 21:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwF0-00021X-Mr; Mon, 20 Apr 2026 21:33:14 +0000
Received: by outflank-mailman (input) for mailman id 1287791;
 Mon, 20 Apr 2026 21:33:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwEz-0001lE-8i
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwEy-00CCKM-LR
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b8d-bab6-0a2a0a5309dd-0a2a4509a2f2-26
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:12 +0200
Received: from [52.101.48.116]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b93-2497-0a2a45090019-346530748c9b-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:12 +0200
Received: from CH2PR08CA0020.namprd08.prod.outlook.com (2603:10b6:610:5a::30)
 by SA1PR08MB8462.namprd08.prod.outlook.com (2603:10b6:806:333::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:02 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::a) by CH2PR08CA0020.outlook.office365.com
 (2603:10b6:610:5a::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Mon,
 20 Apr 2026 21:33:02 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:01 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHH5Clhz1wdS; 
 Mon, 20 Apr 2026 14:32:59 -0700 (PDT)
Received: from DM2PR0701CU001.outbound.protection.outlook.com
 (mail-dm2pr0701cu00101.outbound.protection.outlook.com [40.93.13.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:32:59 -0700 (PDT)
Received: from BY1P220CA0041.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::13)
 by DS1PR08MB10296.namprd08.prod.outlook.com (2603:10b6:8:210::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:32:54 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:59e:cafe::f5) by BY1P220CA0041.outlook.office365.com
 (2603:10b6:a03:59e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:54 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:53 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:47 +0200
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
 b=DXi8w8JtA1/UjAPCKOBHjxBPSOfMEav/Sm6pbCT6Uz3kqhMD8VwwNLG44r26W2+pVVdsRIhu/hLGDjTNG3DHDRxPKqBTY+yzQUnRgGOKaEkvHqNc5fz3wNdDX/DLtWgKlAzLS0k6L6VYW/oHsQoaRguX2PJ0pZVJz1Mq3EUFy2Po9lDswNUJPDvYhZ/niJfLI2oSWqxsWZjfOgmFY0DEPERxK3v1QWGueCug63lgH8wmvucejzPxTKjfARUd56CKfbsR5sUjRNXEX2U+6ixrFw3wVD+FpNW4zNPJqLqyJoS2DME2hGY4pjWigxxXLlh0Wpi9PqRpWGa5Gw57JjwoUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P99iOPiPAd4fedD5w4a0EUrWRqEzpWZn2WgFGdQXXEw=;
 b=R91QUje5IKiODbKhudRV+ZX1CR/kyIQedQTnqt2grFOp80M+S083GBdH5MtpO6HSEGeIrEe+FTh+/vI1aKhWZL8NhAR5PGRzWpfLk9fCQMcmx2YH3SOc7CerWxTXEKrUvCRX2FK7pwiPJSgwzsDoIT7kXVdyoBsGpZke/FtjIZusLQMmDMb/Jtfy5enKcrLwGp7Tro3zrJihx3hePmDCSdWV7ZgcRnfIzFS4Y5Gb+owlRJoocRpY/2PrPgCgJ7obob9MA31ZVz28WjPfpFxaPYf4SSuwHhUJmLBXwmwMjolFBMW3fRfb3CRXBUguBoNDDwXVGsZAZu+K6j47DH2HCA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.13.65) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P99iOPiPAd4fedD5w4a0EUrWRqEzpWZn2WgFGdQXXEw=;
 b=zDvnIWYRcO60k+JI4n9+8Ky1EhdlQhkEbfnzu3TxZ1NxbWb9FFGKZFOdza4Y8CnuvDvLfG9me6vbReRWrklbKgw2EQAINKZ0GhZY547z22jVhG+7ZqRnFv3M0T5bcepCARpEdJyvG/3XkfCMRgcdRLt00O6i2omkTPUN0VL9lMA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.13.65)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.13.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.13.65; helo=DM2PR0701CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSiXJcOpfDw1FzpLTz4sHnIW4qpIUKkoZaNqLTEFrO5hKfqfQ/wF6cqPpyZcmyy3EFthPYhu0zirfliPOrw8Bt2ckEui/A0S3B/MWg58Pibi6co04jLOV/SnVYXCD811nQRkvuzPyCZmzojzP+zynNM5AeRi4zYF/ySVA+cOZOl9tp2sQLP92OL6wPOqfuROymrNRiOBZIi0ELOPAlBpeFHH5jZOW0J3cIrNhHVf5YOEFBe3ygrurAG8xIbrRDXyvuRWWvNyIgrcNca89aitXk36DqC30DelsYunYiTO4Hk6FoJ1ngxq+3jGEUvd18s3jCDUAd1gKw5L2w6VX9Uttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P99iOPiPAd4fedD5w4a0EUrWRqEzpWZn2WgFGdQXXEw=;
 b=WjTVpnS5dWhWWOG/f+sk1AySX0LpfpPHQ/Whfi0GxnimYbs+SoLWAzLCxoViUlJ4bDzyMF6ri3/uWBZJxZLZ8ivG/zGi/HFVz2JAsogHu/uPpSK9xftc6rvnPBukfubHHMOtVIgWfQ8bFeeSbtTHhdLUV0uI/qOTbgfYajVocIEkl2kHvL45zL1GNcO0vKrqSLLvjJDJ3iZhHvuLkfT6IQ2wKszWVcvR5KQl+yC4IA8H7PaBun89CoX6y1+X15sX/mgkVsSbx94pHIJAnejhAnUi+FOKCc4VfwI/CuRd3yWcIzBl0yMiN1FKvCRNDVcYqMv6LCHOCrZ9blMSCztPKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P99iOPiPAd4fedD5w4a0EUrWRqEzpWZn2WgFGdQXXEw=;
 b=zDvnIWYRcO60k+JI4n9+8Ky1EhdlQhkEbfnzu3TxZ1NxbWb9FFGKZFOdza4Y8CnuvDvLfG9me6vbReRWrklbKgw2EQAINKZ0GhZY547z22jVhG+7ZqRnFv3M0T5bcepCARpEdJyvG/3XkfCMRgcdRLt00O6i2omkTPUN0VL9lMA=
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
 Stabellini" <sstabellini@kernel.org>
Subject: [RFC PATCH v6 14/43] altp2m: Move altp2m_{init,teardown} to common code
Date: Mon, 20 Apr 2026 17:31:37 -0400
Message-ID: <20260420213206.208750-15-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C8:EE_|DS1PR08MB10296:EE_|CH2PEPF00000142:EE_|SA1PR08MB8462:EE_
X-MS-Office365-Filtering-Correlation-Id: 775eae46-7aa2-4336-4a48-08de9f246637
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704160111799003|376014|36860700016|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?ydLle/DngJVlCJWXemHLpJT7SXGPisLNWsP7w198j8k+zCHraTmHRE6Q5yGx?=
 =?us-ascii?Q?1nSDkWTFhXZt0SDt8qiEqXuRoCq0QXtOebHvPycvBFVAgjTuMXdBqaQ0kA4w?=
 =?us-ascii?Q?6fxV7QMFqyXjxBvb+VTVNZ+4oLOqKU4bboFk5kEi+fT3To1Qx4l5EI7b9lyS?=
 =?us-ascii?Q?oQpmQeagr54BqFvPOnBcrZR45q2m+062NNVP8WFijHai/G2HihrSbkIGJVpE?=
 =?us-ascii?Q?oAuXM3dNb94jC/7qNOHD5QulS6f9CWRipkmDCDAOJmoWlJUe1kGWJxgm6MW4?=
 =?us-ascii?Q?AJdlfx31CAmL3KxY9bw6DQpNW3E8lWj23hXTiRgFUxAWF2Pa2rwcugVyeI41?=
 =?us-ascii?Q?ZDjcbGWS2haSbWac47y2wHRYGQj4h7Z2E2JJli8WwlUgjb0gDZAn0INDMDzs?=
 =?us-ascii?Q?jYjZNE/HZ3W8DJKpoZPh/XzkIf5CB0XYp0E7SqKx6JhYGxNrruhp6h4Yqz9m?=
 =?us-ascii?Q?AhSlpbpuGvCR0dE8C6Uk60WfwfZHuiSlexoIgyIQgp9klXvhMM4IrnR/RHAL?=
 =?us-ascii?Q?jHofh0RN6eLXuMTmGHTwqb3/xQOeBxcOZTkF07gi6fQOg7Aa2H9Q4+v6w3HG?=
 =?us-ascii?Q?rJvDommYKn5PNawQ1So2ipHGPiIV5Wzr7nRdidvPXDTuUVX/HernJI7Wv6iH?=
 =?us-ascii?Q?0ZQJUl4THdwjrZEiie1ktcQAeZ0yEpyeaQy1O+4WNgZFBcjSyWaCAJexd2q7?=
 =?us-ascii?Q?XiNx4xmauoWi++3L0AhPfoxLqaDzDY01Y0jKUWVZjZ5Ke1PEZI1r9zIsS7zr?=
 =?us-ascii?Q?otOot1Um5jvff2He9wjsaTePjPY2AAqBV2OL4eojp5IJswMX9azYxPIHvqnN?=
 =?us-ascii?Q?KubvSTk/aD8TDCTtw728uPRLFnXSiw+dYkepTZCjuN/qGHuO4eh4t2tUF6wG?=
 =?us-ascii?Q?RJS429W2Qe/uB0C6C1TahhGjjeNe1u5U1QL9JTtKknwfWH6VnVyzsvCo8uV2?=
 =?us-ascii?Q?H4IonFoj7TCbJGsin73f/a+DAKTVZfINKcuHQIUNBYyxUqzkyxII774+Sy3C?=
 =?us-ascii?Q?k13tnuGvZneyy9akp86WphJXt3L7+uE+IjKepHV1OzNoD/LdyFW6KF7Qxs/H?=
 =?us-ascii?Q?136j2Kpw0V8CQjed6x30WVH6p3WHXLqR6nsmj/CVTJPPHrTJA9eOB7u4iTpE?=
 =?us-ascii?Q?+5xANuhMqSiJxuISM6lvwA/cU6CaUZdDSTl42s5CFQInOABlhEx9WfOl6bAh?=
 =?us-ascii?Q?n1Hw++zwXp8cotJP2YiEKoB9VjVJhiDqR1jHwQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704160111799003)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 DozY4J7wYvjpzEPJQq7pDR6DjiujHCf/SuJj0RgAPhj0zxTvfvYE9IIZ/9RUddLkdyQBopCJDbEyG+C0lzuu32G5Z8WfLH03GLeP9DRw1eB/TZF8o6hB17xtUsKpj/+qpoe/nMmF/+KIj6TBiIyg7f324Mdu392Cz6Fzx+O32JjAdkxA1X2uJM7i9t4ATFSZijCfyHkRivyynih88ZLwBd8FnzMeAUPz4fDt9qqJQd+b5h66Jw3EjjjqHoGW7LEZParK3VE+cgfT9mJF6bTBIL14RhN4CWLOabIgswwS9/yg6FqCHWJHK/EklGDnRg0NdZFqfdMt+BLzERxpK15YJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR08MB10296
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.13.65];domain=DM2PR0701CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.13.65];domain=DM2PR0701CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	26f8f81b-9a1a-4de0-8c1e-08de9f2461b4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704160111799003|36860700016|1800799024|376014|14060799003|35042699022|82310400026|156008|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JiUHzSCm+1nFCBD9SeiFCo5NLpl1eXpROE/nIPM5eBtRTudbnSanEiWkbb4i?=
 =?us-ascii?Q?wBGFfoxyAhWilruQplxWoIRX82SIwEWp8/USWYaJsa3/Vt6RnTnjiEdhll/F?=
 =?us-ascii?Q?dzksZ8eaK/s7Zyo0hwAM6NLJYpJKPx3uW3+hvaBF4Dkn1Qf/giB2Z6YXnLTm?=
 =?us-ascii?Q?x3U/HTiD8BOoHbe9E6pFHK9j/mLMV2qgeqVYl/K9beHdNiAHhnnvFoAcQjKq?=
 =?us-ascii?Q?Xj3XNNohk9jYmYroTlM0X+AJZkod8AFYoGtaLyvrpgryfFrojZJTgOv0ODEn?=
 =?us-ascii?Q?EtBS4TrDXuLwNENtPQ8tAbFbd8yJBl58U7hD83avyB/vjS83E5p7SInuxec7?=
 =?us-ascii?Q?796ENudf2QaEJkafqDTGeyftEA9Da/o3GnxX5VRLarVt/y2zq8adBc+hmmNf?=
 =?us-ascii?Q?gI12MaTIfjtGGqwgJ5JRhG2A00ZivVM+9osSWLHt8rZhQ7BISU6Y8D2V3X6Q?=
 =?us-ascii?Q?AHe3qEJk5WHCtJ2n2FGwqJfk7QvD+oFW5qCzJc6bfhCCMEJhq+UvmJzdPlO3?=
 =?us-ascii?Q?phYg/1TXw2xv8UYDDhpt0dkMIzAzPoMlJUGIn1JvRKDPkRUzpk5+UweBplqW?=
 =?us-ascii?Q?dbw3gRqV86/aZ52UD7IpwuaTTE9T4yTF/Q1/PPl5RPI/XyeBR/HPBCWXpW96?=
 =?us-ascii?Q?1HWh9hnVqQ8rhNePm3IKnTtpGANHIbig1cZEog8brfSdddVH2+NOK3kwg2Z8?=
 =?us-ascii?Q?NGqth1ASCXckeMPYThP6bAmjLq6Ouqi3V55G35ZPmmQeZYzHQKcgzDAc08Ch?=
 =?us-ascii?Q?YY++Suo0XEajT7StXKvmRbYZQ7IiDGjNkHlIqw4XeGyzXzV3IPb4jQxJycMQ?=
 =?us-ascii?Q?EKttAyucvxW5weimsQy2vM0t8smz1c+CxKjxBCkQq3DaJrikTvkfvC7c1ipz?=
 =?us-ascii?Q?cT0OHhS4TXy++NEohlEB76N9zTF+zReV8vJb4Kx64/hAJUr5Sv7kQtMwPlGO?=
 =?us-ascii?Q?iroxCrZVGs9g0+CYb+blTAEj/ePyse2vN21yC0xF2M1pOsm7YpTQQmPl5qfS?=
 =?us-ascii?Q?N/nTQUeNbqMAc6cy6L1n9SEzFegmz1mKZ0Src5qM5xTXXE61xrjpo036cMcq?=
 =?us-ascii?Q?19RZanifgvEdi040a4pSVoun+MSfwnIB3NhQwQQu4TVeWADLnjpNBt96SIEz?=
 =?us-ascii?Q?VC5b1yqwQvUalMe7Ve6Vj1S5ffbNHD0A+Okf06N8O/O7sXH1K1QMmk+ROL3s?=
 =?us-ascii?Q?Z0PJK/U2h1OOWr8OGo6Tdm66NY4fAe7Rn5s0dw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM2PR0701CU001.outbound.protection.outlook.com;PTR:mail-dm2pr0701cu00101.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704160111799003)(36860700016)(1800799024)(376014)(14060799003)(35042699022)(82310400026)(156008)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	90/LjN55f+Qu5C/E8M7Y+gAqBE13cPpBENMHhKlugIec77MMAWh1FG0aozTMI18SBxbnKWofCCwmZKEGM9kuF/91HLmjhdEUEaZw+HWiChBLjLfw/phr+bubn6wBFpZeEX9DvWNAOKh4MJVG+c+qTJANmk8t+QRoCOa0SYHGve/dzVMqV0pymV3jFjbU8T6dNRkMnQs0xwOxw2H+qMBnBePW/89NE/tOW3TxV5jzHCP1o/GyGLqpXXgUDeQESA0RAp4HgfZBSN/25h4stqAuYdGIRvLxhD+nj4uue3sms2DQ6Ubd26H5vPc1/K45Dhh0TI9tRk6fPNbfMhCV25R8Y+3PP95iiT0hP64lIs5owrRsCWE2kycwm2aAfm2Pyg0ty5G+dmlFchpnpcAWl6oM6K9nOOYZYSwPJ0Lpu4fw3qdOSdg1zXqA5dWRka0SCxeb
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:01.1773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 775eae46-7aa2-4336-4a48-08de9f246637
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB8462
X-purgate-ID: tlsNG-bad1c0/1776720792-93D7FA53-59FB3A63/0/0
X-purgate-type: clean
X-purgate-size: 5997
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.194];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 6E646434244
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit moves the init and teardown routines into common code. The
functions are gated by CONFIG_X86, so there is effectively no difference
despite common code normally being compiled for ARM.

This commit contains only renames/code movement, and no functional change is intended.

This is commit 3/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/include/asm/altp2m.h |  8 -----
 xen/arch/x86/mm/altp2m.c          | 45 ----------------------------
 xen/arch/x86/mm/p2m-basic.c       |  1 +
 xen/common/altp2m.c               | 49 +++++++++++++++++++++++++++++++
 xen/include/xen/altp2m.h          | 13 ++++++++
 5 files changed, 63 insertions(+), 53 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index 7cff40beb7c6..13017525a62f 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -97,12 +97,6 @@ static inline bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx)
     return true;
 }
 
-/* Initialize altp2m views */
-int altp2m_init(struct domain *d);
-
-/* Free altp2m views */
-void altp2m_teardown(struct domain *d);
-
 /* Switch alternate p2m for a single vcpu */
 bool altp2m_switch_vcpu_by_id(struct vcpu *v, unsigned int idx);
 
@@ -184,8 +178,6 @@ static inline int _altp2m_get_effective_entry(struct p2m_domain *ap2m,
         _altp2m_get_effective_entry(ap2m, gfn, mfn, t, a)
 
 /* Only declaration is needed. DCE will optimise it out when linking. */
-int altp2m_init(struct domain *d);
-void altp2m_teardown(struct domain *d);
 struct p2m_domain *altp2m_get_altp2m(struct vcpu *v);
 bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx);
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 371bf3f0b8d4..46374373848d 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -123,51 +123,6 @@ void altp2m_vcpu_disable_ve(struct vcpu *v)
     }
 }
 
-int altp2m_init(struct domain *d)
-{
-    unsigned int i;
-    struct p2m_domain *p2m;
-    struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
-
-    altp2m_lock_init(d);
-    d->altp2m_p2m = xvzalloc_array(struct p2m_domain *, d->nr_altp2m);
-
-    if ( !d->altp2m_p2m )
-        return -ENOMEM;
-
-    for ( i = 0; i < d->nr_altp2m; i++ )
-    {
-        d->altp2m_p2m[i] = p2m = p2m_init_one(d);
-        if ( p2m == NULL )
-        {
-            altp2m_teardown(d);
-            return -ENOMEM;
-        }
-        p2m->p2m_class = p2m_alternate;
-        p2m->access_required = hostp2m->access_required;
-        _atomic_set(&p2m->active_vcpus, 0);
-    }
-
-    return 0;
-}
-
-void altp2m_teardown(struct domain *d)
-{
-    unsigned int i;
-    struct p2m_domain *p2m;
-
-    for ( i = 0; i < d->nr_altp2m; i++ )
-    {
-        if ( !d->altp2m_p2m[i] )
-            continue;
-        p2m = d->altp2m_p2m[i];
-        d->altp2m_p2m[i] = NULL;
-        p2m_free_one(p2m);
-    }
-
-    XVFREE(d->altp2m_p2m);
-}
-
 int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *mfn,
                                p2m_type_t *t, p2m_access_t *a,
                                bool prepopulate)
diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index 433e7d08b78f..67cef5d2b6ef 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -11,6 +11,7 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
 
+#include <xen/altp2m.h>
 #include <xen/event.h>
 #include <xen/types.h>
 #include <asm/altp2m.h>
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index 3a3283f0860a..cda653b713f0 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -2,8 +2,10 @@
 #include <xen/altp2m.h>
 #include <xen/guest_access.h>
 #include <xen/vm_event.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/altp2m.h>
+#include <asm/p2m.h>
 
 #include <public/hvm/params.h>
 
@@ -13,6 +15,53 @@
 #include <asm/hvm/nestedhvm.h>
 #endif
 
+#if CONFIG_X86
+int altp2m_init(struct domain *d)
+{
+    unsigned int i;
+    struct p2m_domain *p2m;
+    struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
+
+    altp2m_lock_init(d);
+    d->altp2m_p2m = xvzalloc_array(struct p2m_domain *, d->nr_altp2m);
+
+    if ( !d->altp2m_p2m )
+        return -ENOMEM;
+
+    for ( i = 0; i < d->nr_altp2m; i++ )
+    {
+        d->altp2m_p2m[i] = p2m = p2m_init_one(d);
+        if ( p2m == NULL )
+        {
+            altp2m_teardown(d);
+            return -ENOMEM;
+        }
+        p2m->p2m_class = p2m_alternate;
+        p2m->access_required = hostp2m->access_required;
+        _atomic_set(&p2m->active_vcpus, 0);
+    }
+
+    return 0;
+}
+
+void altp2m_teardown(struct domain *d)
+{
+    unsigned int i;
+    struct p2m_domain *p2m;
+
+    for ( i = 0; i < d->nr_altp2m; i++ )
+    {
+        if ( !d->altp2m_p2m[i] )
+            continue;
+        p2m = d->altp2m_p2m[i];
+        d->altp2m_p2m[i] = NULL;
+        p2m_free_one(p2m);
+    }
+
+    XVFREE(d->altp2m_p2m);
+}
+#endif /* CONFIG_X86 */
+
 /*
  * altp2m operations are envisioned as being used in several different
  * modes:
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index be627152668a..85ef22c2b29e 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -8,6 +8,19 @@
 
 #include <public/hvm/hvm_op.h>
 
+/*
+ * Common alternate p2m declarations that need to be visible
+ * regardless of CONFIG_ALTP2M
+ */
+
+#ifdef CONFIG_X86
+/* Initialize altp2m views */
+int altp2m_init(struct domain *d);
+
+/* Free altp2m views */
+void altp2m_teardown(struct domain *d);
+#endif
+
 #ifdef CONFIG_ALTP2M
 
 /* Alternate p2m HVM on/off per domain */
-- 
2.34.1


