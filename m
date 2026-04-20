Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFayNXGa5mk+ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7124C4340CC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287568.1568054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwA5-0007ZU-9k; Mon, 20 Apr 2026 21:28:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287568.1568054; Mon, 20 Apr 2026 21:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwA4-0007Az-3L; Mon, 20 Apr 2026 21:28:08 +0000
Received: by outflank-mailman (input) for mailman id 1287568;
 Mon, 20 Apr 2026 21:28:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9w-0005tQ-9b
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:28:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9v-009jup-LJ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:59 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a38-5cb7-0a2a0a5109dd-0a2a4509e432-34
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:59 +0200
Received: from [40.107.209.117]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a5d-2497-0a2a45090019-286bd1751e28-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:59 +0200
Received: from PH8PR02CA0047.namprd02.prod.outlook.com (2603:10b6:510:2da::8)
 by DS4PR08MB10703.namprd08.prod.outlook.com (2603:10b6:8:282::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:49 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:510:2da:cafe::34) by PH8PR02CA0047.outlook.office365.com
 (2603:10b6:510:2da::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:48 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:48 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz9H4fdWz1wdS; 
 Mon, 20 Apr 2026 14:27:47 -0700 (PDT)
Received: from CO1PR08CU001.outbound.protection.outlook.com
 (mail-co1pr08cu00100.outbound.protection.outlook.com [40.93.10.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:47 -0700 (PDT)
Received: from CH0PR03CA0026.namprd03.prod.outlook.com (2603:10b6:610:b0::31)
 by LV3PR08MB9527.namprd08.prod.outlook.com (2603:10b6:408:216::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:42 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::fd) by CH0PR03CA0026.outlook.office365.com
 (2603:10b6:610:b0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:42 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:42 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:39 +0200
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
 b=gRv4ww9L1Usa7X+Fawzo7Wr6zK2cFDuThxr+n+u/GFmwQFZzBCKo75GixfVDVM9t7aWi7ULeIjhpweJ7qBcKQl8xUfvQ9o6ZVhUy/fFGWrUOhhGmc73A5UkB17U9iBP4fpwo1g5uGOkSqD7PcdyrC2CaCyUOR+CdDNLfBHLfXXJay8dsahZvm26srWhjpWrurc1JlAWk88pxqIDUbMBz4h+PJLs9L1nwnekJcSr0VFp4djqCjb/kyjas3Yv4L+rLKL31B1b8m4NqePFTLNHMD5vfXoLNQVf41Sxk0S64trp5O5b8MZHPEGM8fPMa58GRADa9DdpvTImK4q6kAdA7xw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GKS7huUjzjhqkDR3rg4P6NQTDEiD+t2h7OWKwFuOAU=;
 b=SGrzf7mfF18NFvZMNAeI8iql47DVHd874FawYLTIf3IBLdGRQOeqa0aSLDaro9RsXEWu8IgyiMRXePQwoPp4I7Wck+i8qtk4EsqIsZ1yiH7VnA2bGAXBFA5wQ49UgKxbNIy7iwauZL3qXUu9svrP/gAeRSJxFWIryT9CV+FbHsLugRoRw1aiWG5yNVAr9/7q51tvWtdD3Mk9bz1kDnpXVUG0ww/lkblPAwy0CtzcDxTs5Dk/abEqQkiggUrPXpuLM6cpaEXfUD5Ty+MQeoNWZ1hVZgQsfQrVAolNFN5uJShR9wrMVS87i/hVqAiYLcnMKKA0d+cVppLORmdNN0mpFg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.10.96) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GKS7huUjzjhqkDR3rg4P6NQTDEiD+t2h7OWKwFuOAU=;
 b=BLexTEX28gMTcpxZjIMstX+Hl7PtBB3G6I2t3suDP1105siAy8ia/oPfFUHevRDDQnxiM7tTXMg1fr70lLT3RCK7ix0gMmwJ7ATnp8I04LKUBKuA/2Ii486RfbtjMDyiQT/fdN9MT/hWlBbLpARSVMlq7SsNhmoVYmbrseVlYUY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.10.96)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.10.96 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.10.96; helo=CO1PR08CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmIgXfUVb4iPcyPiW3G5+FJ1bwNjE8sLn7wthCfnz50D+frqDl1UmD3HF/zNWurniFW+RlYHl4sqhp0i/RWjT52heq9v+HXQ+Pl5R4ut6mvBS7XvB10fa21w3mSjbi0FjB928jR16BrrAgkUxRS8fCRF1Vm+q4u5hJZo+jhmMRugdzD7ImT8vwntZHw9DQqJ/jxVy0uPAIzPDGhARRQ9kCyOHbwBn/XmrJNSJjo0ux7M26wTkhVwvTo8Vi8hkZ1N6AlQ//jWwk6Lz42Rm1awvgix+RYTzOfXwUmpqaOQeW4x8SDFOym6/vtWpjTbES6gzV3ppo+G9/5JxPj3y63YRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GKS7huUjzjhqkDR3rg4P6NQTDEiD+t2h7OWKwFuOAU=;
 b=paMopcHcMB9mZN/H1VcDdbMu7omii1qTQ+DtBmJtOquYXJq6WZHeZzmmCn1QCefU/TIRP4tB06/EDYdaNWImJ7GjUfXWdLdwrzX6bW+Az3CSgsKAO/6PuGTkkDDr9RrHd1+fJtne6PI9J/xjqyYl2g1dNTxg+dU4Rz8ZoSqKfGv9ZJ4O+6ieGS0FY4ceuI96Mbdsg15ZGzPGIjOtwxaF6nKHOokS5RPo7vgDeqwp6VJbUwo7Z7fSI/1goWtS9Ow7gxZ/PVms3GpVdKDu+Q4FB7uyYJE9UkQHC4FbOloDFwPtyk0vvl327HseQBGiyWDVOBQwAAEVG9fA5hpr1x1sKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GKS7huUjzjhqkDR3rg4P6NQTDEiD+t2h7OWKwFuOAU=;
 b=BLexTEX28gMTcpxZjIMstX+Hl7PtBB3G6I2t3suDP1105siAy8ia/oPfFUHevRDDQnxiM7tTXMg1fr70lLT3RCK7ix0gMmwJ7ATnp8I04LKUBKuA/2Ii486RfbtjMDyiQT/fdN9MT/hWlBbLpARSVMlq7SsNhmoVYmbrseVlYUY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Rose Spangler <Rose.Spangler@elektrobit.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH v6 27/43] arm/altp2m: Add support for altp2m_{get,set}_altp2m
Date: Mon, 20 Apr 2026 17:26:32 -0400
Message-ID: <20260420212648.208640-20-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420212648.208640-1-Rose.Spangler@elektrobit.com>
References: <20260420212648.208640-1-Rose.Spangler@elektrobit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.10.178.50]
X-ClientProxiedBy: denue6es013.ebgroup.elektrobit.com (10.243.160.141) To
 denue6es012.ebgroup.elektrobit.com (10.243.160.140)
X-EOPAttributedMessage: 1
X-MS-Exchange-SkipListedInternetSender:
 ip=[213.95.148.172];domain=denue6es012.ebgroup.elektrobit.com
X-MS-TrafficTypeDiagnostic:
	CH2PEPF0000009F:EE_|LV3PR08MB9527:EE_|SA2PEPF00003F64:EE_|DS4PR08MB10703:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1eabce-c283-4f71-80c4-08de9f23ab9e
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704161411799003|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?fDZvZNqybAEEjrpAuowvvLItvFlspzdJAfuU1qoSqZ6XSNH2hRbw2ERHgj4T?=
 =?us-ascii?Q?nvFJNc0qVrDElSbj6ergBXQyKbqcLajgHlULAEUmbUM4ptfNSL8WU/nhLqjr?=
 =?us-ascii?Q?RiIJhFtRcenJXniJVLFQNsHkkOj08CEY0+y+GVzzP/2LWNhzWeloJiGbmq1R?=
 =?us-ascii?Q?c9aU099FjlIcpsrtMnq9JR6WhoY3o03AxNObe6Warqu6H1E3GOaCPDiHrzGT?=
 =?us-ascii?Q?GOWn/x5UzxY0XSbC8C71n2520Be71bIFKbkomTOdO0HBt/gmUN+Xai+wqrFe?=
 =?us-ascii?Q?U4IT46FQHSHieXhi17iZw2e1VgioQQOIsbhtrJm/4efWdHmtkgBg/387N1V8?=
 =?us-ascii?Q?XFJkAP+ndRPZE+xMbIFUIQip8Z+2wu3+G2ysuTbNN3vdfMvKNUaAoAjiIntk?=
 =?us-ascii?Q?zk8QiML3+TQXhsdyvvI75SMebycXLMnZOLfFcD/hsxdMhSNPn65FhOvVQ3pV?=
 =?us-ascii?Q?TM+BAgH2Tfv8+gMaWwoLBxBozSwENSmdOvY/+gaNNb/Ozk17jtS/BwsycT5J?=
 =?us-ascii?Q?7fzGW3rc8iPmPmo2RnNe/Pt7hVDGQeECYURVqf5pWZspjvRLy8xkPqnbfctW?=
 =?us-ascii?Q?BpyQALu8Uag/sT1Z3JQjHH1zNrj3QAalNswB55hm7zUEEX4v8MzFtVaAlMRp?=
 =?us-ascii?Q?5XYQezHsiwHF4UgrATSrRpNhZM/tcqcqlqOCvP+Hh9pPyYQchy2hYkYSzD9l?=
 =?us-ascii?Q?hCmgdfIQbufPHTH9cZMrNiJQqn7VWKa2KIq+tyhNyTp/l0Qdmy9oSa2bZ5rO?=
 =?us-ascii?Q?Ay4uBW5tLGYlw42iU1D8GB13jGoP2FaRndXReI2jaSE21ilMRPSWZOpckUco?=
 =?us-ascii?Q?i7lOUjHgW8dQ7MyjXOU9F85dWo6yFuULgJc4zAWSo5OFb1fi0QhwdraY/Gb8?=
 =?us-ascii?Q?4P3BTfdY45iJqhZCXP/eAvFvMonh7EJix3YdSYcR06n9T1odowCH8qEIsZDJ?=
 =?us-ascii?Q?mENge8/i0DPYqIzUcqySJovuOK/YH32P1pDiFoHpR7bdwwtM8RgzJGD+seVT?=
 =?us-ascii?Q?Kn1BaYhaCHA2+fNAn8tMIqp75RR+3f4Ko63LkefvX/yKoaAhtNH3sFZt4ePq?=
 =?us-ascii?Q?bhVl0u1kPvQEigq0aqv0kg5ISzMD7aDACLBS0MDCOcnfXjMwycEg6CZGCC7M?=
 =?us-ascii?Q?lIwSqWN6Y0Mj?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704161411799003)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 XQCKOhPRicV3wtRInKIf0Su/9egsVYxoWONsTklr15000Jug7p3G6TfGYIWmYkk8m2SAUQYnZSvp2M+7EExTOwSXFHrKi/DBr0qyFVBnMuEvq0rfWskDcuDYXAd4n8sWOfBsyYi39Cg//0+bLItsSD2sctZJKR7f9QOl/E98mWoqGKwfoE4BPDDRjMau7gOAFhwbIzeoyunNIJ/qTiixx5TxQ9bqqGEnSvotAxVYMrUWxCHJwMALmoWxjuoQFYP6IWi7i7bsQfxVhtJUIgiygrgIl0+++5IyRWebS5Um6+rPZKeHX3RZ295gIEryScMgeC7vMZehKj20QZfOzHiq5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR08MB9527
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.10.96];domain=CO1PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.10.96];domain=CO1PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6eee74db-b7a7-4834-310a-08de9f23a835
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704161411799003|14060799003|1800799024|82310400026|156008|35042699022|376014|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eTZgEXIC1wnee7RSFKtEsirhmHnnE3FFyo/A8s3ULmV3/F17eyKX6kr7ASEI?=
 =?us-ascii?Q?DFTVsQsRkxOUBW47ZpGXdMI7Ijc46UhRDfBxcSkhwYe6qvTcMD198shpqlNX?=
 =?us-ascii?Q?nMuDCduULhuiYGPu4zfrCDnFS4UgSXM67/uRnczCtzDSw+c6xX8PxiG5XOOy?=
 =?us-ascii?Q?2oo2tJfwYQ0RdYHaHiM1rWbI8gcB/XpowIS1ijt+mr0UKprSyq7/o3MlzGOH?=
 =?us-ascii?Q?13rL+W8h8yB9lfVkXlVeA095xqpbPz4KDPaAiJM3BVsQ4bNdU9IFJEe7ZqRm?=
 =?us-ascii?Q?Ob3WtX53ZVmh+c1VcPKbnygKIhWLxVOlftqdYaehdBLQcds3vVUpM7ReOt2g?=
 =?us-ascii?Q?GTTlAP9zhUdmqDXsT7hgrDZ4NCdrN3Ug6aFnozRETdMsQYdz7LanET5ju/rQ?=
 =?us-ascii?Q?11mvXAINHeKA6kmKUsW7DnphJ2M4cimdtKOyMCXU2T1B1eelQhxTCqY5SuNm?=
 =?us-ascii?Q?la91Jt8wW8GHSABzozy8gNLO8SP5cGiSGY+zKYJQjFnEWu08xmRVE4w3UQ1l?=
 =?us-ascii?Q?XwAl/8Nqve6zoMptpbs2I7Per474vtLAfr5vvCve0sPbe+Qz5c7Qgv8Eu9fo?=
 =?us-ascii?Q?NXPqY6vMh0CywEmUctfBAnz5WhJg6cyJxuN8xDbbUKPvTw870n0byV/v8AGI?=
 =?us-ascii?Q?hTCQ70xVjx2kcIvmGy5HYJxmlrrQQcIramZkgkc0IreMgohvlWIlgnT1UeRe?=
 =?us-ascii?Q?TufCpLiEuSOulOwy/tmYLQsS2Zm5uUPq5KBgR/wmgf2rVOh++AWM+pRcEnEo?=
 =?us-ascii?Q?BrzM3K70iOWcOGVvkuzRxoCGxN1AjRC3cZ13/WAd2uCIYPuL193TOdyQ2Hq0?=
 =?us-ascii?Q?X7A2yC+4kDlwY4KVRtbspC8hvlimVmcR4b+JzJ7Ttjo9Tuqf/pgb+ZyxBN39?=
 =?us-ascii?Q?Rdzo368eB9Eg41u8x4DG+VYBi/etjWypF7BZ2XLTsyvWaH7usVXBaQZSI+3f?=
 =?us-ascii?Q?FNNkds7UHf6nwUDlWomhPMyL3tGGqMAJOE9zwDWqnBpEgDcPJiNMSPs0TUAI?=
 =?us-ascii?Q?/iPpBc/pR3h4FPdYX3aZK9mQbbZU/mQIChC2eQr2WUsatrNkhXSHdYkVReSb?=
 =?us-ascii?Q?BjU0s82uAh0eTcKbRIK9w7Qfof5OayJ9+sFR3QYTFsk2m0qiilXouoqg6NZ2?=
 =?us-ascii?Q?sBZ09axHSUrg?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR08CU001.outbound.protection.outlook.com;PTR:mail-co1pr08cu00100.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704161411799003)(14060799003)(1800799024)(82310400026)(156008)(35042699022)(376014)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7o5W4k0+P0eOej6V+OLjkTYipicnkFZIpdr2V3o64ZnspMXlVL9NkZ1U7CYiZEs4m2hre41mdLO29vgBPMP1vbbVKTkH7VgsE+d9v+Sj+3n9WpnE9nieOOZGFl2nEMxWRvY4kwu8ZJC0lMR9zE6hR/YEo0eKLU+nOIRrOi6t5VKBFWd96o7ZWiP9N891xY6+G3Z/jiq47vidm7ytbwbwZFbSyxDPBAuEe8jaLEugOWs620gQ0ukQmdGZ4CRbFrzGRcu71N1ZMTcp4uhvdtOnniXWf66nfowwhwlj/MazTz/djpdKTxdjDEXhW60rOQkWI+YBlvrH7c39uH8I/X9uzMXjbIGJmKNqDWVjgFTA8F2nuSBstqZkLqjy+ZE62mc8CyworEyrDay9rrYXSjFSl3EBNmbrFKgu/gTw3mIuUz952DgDrp5huIT7uuq0ixZD
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:48.1604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1eabce-c283-4f71-80c4-08de9f23ab9e
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR08MB10703
X-purgate-ID: tlsNG-bad1c0/1776720479-8BF7EA53-B364D9E8/0/0
X-purgate-type: clean
X-purgate-size: 1778
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.303];
	TAGGED_RCPT(0.00)[xen-devel];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[elektrobit.com:email,elektrobit.com:dkim,elektrobit.com:mid]
X-Rspamd-Queue-Id: 7124C4340CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds support for altp2m_get_altp2m and altp2m_set_altp2m on
ARM. The x86-specific VCPU accesses have been replaced with the
architecture independent functions altp2m_vcpu_idx and altp2m_set_vcpu_idx.

This is commit 4/4 of the altp2m_{get,set}_altp2m phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/include/xen/altp2m.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index 58e74be6deb0..f5a4d0e60562 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -8,6 +8,7 @@
 
 #include <public/hvm/hvm_op.h>
 
+#include <asm/altp2m.h>
 #include <asm/p2m.h>
 
 #define INVALID_ALTP2M  0xffff
@@ -31,11 +32,10 @@ static inline bool altp2m_active(const struct domain *d)
     return d->altp2m_active;
 }
 
-#ifdef CONFIG_X86
 /* get current alternate p2m table */
 static inline struct p2m_domain *altp2m_get_altp2m(struct vcpu *v)
 {
-    unsigned int index = vcpu_altp2m(v).p2midx;
+    unsigned int index = altp2m_vcpu_idx(v);
 
     if ( index == INVALID_ALTP2M )
         return NULL;
@@ -52,19 +52,18 @@ static inline bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx)
 
     BUG_ON(idx >= v->domain->nr_altp2m);
 
-    if ( idx == vcpu_altp2m(v).p2midx )
+    if ( idx == altp2m_vcpu_idx(v) )
         return false;
 
     orig = altp2m_get_altp2m(v);
     BUG_ON(!orig);
     atomic_dec(&orig->active_vcpus);
 
-    vcpu_altp2m(v).p2midx = idx;
+    altp2m_set_vcpu_idx(v, idx);
     atomic_inc(&v->domain->altp2m_p2m[idx]->active_vcpus);
 
     return true;
 }
-#endif
 
 int do_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg);
 
-- 
2.34.1


