Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLIIHOqc5mmeywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:38:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ADB43441D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:38:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288146.1568469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwK7-0002rN-OW; Mon, 20 Apr 2026 21:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288146.1568469; Mon, 20 Apr 2026 21:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwK7-0002pv-L5; Mon, 20 Apr 2026 21:38:31 +0000
Received: by outflank-mailman (input) for mailman id 1288146;
 Mon, 20 Apr 2026 21:38:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwK5-0002oZ-O0
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:38:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwK3-009Rra-Hu
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:38:29 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69c8b-e002-0a2a0a5209dd-0a2a450bc78c-42
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:38:29 +0200
Received: from [52.101.57.126]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69ba7-212f-0a2a450b0019-3465397e0c33-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:28 +0200
Received: from DS7PR03CA0016.namprd03.prod.outlook.com (2603:10b6:5:3b8::21)
 by CO1PR08MB6514.namprd08.prod.outlook.com (2603:10b6:303:9f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:33:21 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::8a) by DS7PR03CA0016.outlook.office365.com
 (2603:10b6:5:3b8::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:20 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:20 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHg5fTnz1wdY; 
 Mon, 20 Apr 2026 14:33:19 -0700 (PDT)
Received: from SJ0PR08CU001.outbound.protection.outlook.com
 (mail-sj0pr08cu00103.outbound.protection.outlook.com [40.93.1.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:19 -0700 (PDT)
Received: from BY1P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::15)
 by LV3PR08MB9404.namprd08.prod.outlook.com (2603:10b6:408:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:15 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::76) by BY1P220CA0019.outlook.office365.com
 (2603:10b6:a03:5c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:15 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:14 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:10 +0200
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
 b=nfNdqWvBFPdLGrxASEBjEhHacn6xnu2Jl8VdIhj2sE1n9cHDvHmu2555+nEvwQp/qL2fZac+uNqGQMSExwEW1iX5ewUED85oUx+oJsu+b2/Q6ARIyIYHcqCnUVRG6SyfLJDhb+b9h8Nkb9u09ZPS+e1Gtzm2iZXSxTTL2cR+IBHJhevHHgw5orf+BmhUUBrrwFosGWcWe8TvJwFHd/H1GtM2i9tyVyxOqBcpyZYzteNkuKOHsg8n9C91xZwXVwubPJbyrF2VFe16/cAr8V+BwnSPAvAKeHLrKMlHE5W1j2/iFiJLoBS/N4h7Unb/M0gIvZyGiQSfSoYn9uiR2mAVIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlgX5a6AGvq5jH49n4U+x4WcIr+mTwnUzMyljWt2R54=;
 b=cmcbjgEMUgSas6jS6YlGhpwwN0npdfl5PdM4q5oe5Q+4plidV2MWYjuF+4jKU+N9bWAnT5tDLzsUtELfXmaa8SbVvVulFY9b/yVcmGVLs9YzeoZ3SXBrftDkT6rwtr0VrJKTkE0na5CjUY6UpbSt0fQOYPhCROdK5fexud+Yju4sMafzR3lI50PHPYldnWOSAPmx6VjmqFfW8yhJZ5tYcWP9IK8wZ7Z5fCs0B9b8PXVFQLIJwKb8gk/Ly9TFJQESXgfTB0U05ykLRN9aH45TXwF9FY4abW9GuC8thDQdGJFbW9bvnv0xI51BZyJKA1Sz6hcTmBZmrMaHIKsbNL+s5A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.1.75) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlgX5a6AGvq5jH49n4U+x4WcIr+mTwnUzMyljWt2R54=;
 b=FjFe4cNF4nDpsxt06fKP0qMdSQP1dCt4R1YUZTlKkIjDdfj6qr6wQ5GM2GPHoycxdJ7c7KawZlWPYolq81cx3fePTNq/vRnA02NIjYvBemLWatHazYru2itfnEgfwMM/yj30+akXG4pmsUxRLH+QfWbMn6gNtYCkXkaMRA9CNiI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.1.75)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.1.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.1.75; helo=SJ0PR08CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPQW1XKPayoCvNuTGEEpna9M4lJxB3l4rBQ9y1fcEZQU8f+X9w/w48sNf8QgG5/226VkRjhGF+g/rwOF0Sd10sc/9zLVQ2ELlcy759iQNMwWAg9Hh/klfUi9dslTI058Q05FM4Wc/ErQg+Ex/KnCncV+1JHiSGUKKPtV6LfhOywpZtFf6cx+dmW73NDA+a1VwzWp4h+/l9PQmEPB5M8/txhRVn0OCSq02LbflFPp45hiA5Die2ASBu705d3KKtIhDYs3ieZYFoeGZgQQUnasH7b5M6O9rtk5ZuUdItpqN8SfSQMmBySVo6VPk2sJDXWBxK87RdcaZEJRN/zDIP5wOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlgX5a6AGvq5jH49n4U+x4WcIr+mTwnUzMyljWt2R54=;
 b=CWQCUjsCOFCj/9qGrTnbJEdMeYNf9PssYXOa5rLb+Hb/KzwbXmYrX6UuSMrdZGWu5tGoBGG17JkargPBbFFw41RE8vS+L8TsVmrHu8aI+PscK+zC/APXs5Sg8IXe7KPbiGt8s7P780D6LYCRjSphhSghpn7Ob2g/kpT5XBQbmSN0ERJKR+U5yUjTAgWlqkpAHIueLwLPCUATW+rGvJblZd89W9eNyIjW/rZWiszbJjkl6lxtHieSZPYrozYzN+X6r4QqR849nUpvDJ532p+L1vLxqnM3GHtMnBHmk4BkZEjHSb6Zl5lH7hD0c+gzUcq4q85JFIYOJv5JkDlmPUITPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlgX5a6AGvq5jH49n4U+x4WcIr+mTwnUzMyljWt2R54=;
 b=FjFe4cNF4nDpsxt06fKP0qMdSQP1dCt4R1YUZTlKkIjDdfj6qr6wQ5GM2GPHoycxdJ7c7KawZlWPYolq81cx3fePTNq/vRnA02NIjYvBemLWatHazYru2itfnEgfwMM/yj30+akXG4pmsUxRLH+QfWbMn6gNtYCkXkaMRA9CNiI=
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
Subject: [RFC PATCH v6 28/43] altp2m: Move altp2m_vcpu_{initialise,destroy} to common code
Date: Mon, 20 Apr 2026 17:31:51 -0400
Message-ID: <20260420213206.208750-29-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C9:EE_|LV3PR08MB9404:EE_|DS2PEPF00003447:EE_|CO1PR08MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed4810a-ed96-488d-a5ea-08de9f2471ad
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?AK9iWy8vPTDcuxGkt+pAXLcDXKChu/bA4TfdHdz/2P922sx5YWW7yTINiaCL?=
 =?us-ascii?Q?7UYZ0B9njPu3bCC+zxWSVWWXh/RKoN7RUG93TY6nhIEdz0P2eIUhhpyvgNvX?=
 =?us-ascii?Q?aNb8685V1+ze/x3xoPSQURLWwusdti4O5iVPcj7tgulh10sJjvk2mLXemjON?=
 =?us-ascii?Q?ryzI3fTGRGVhTMo4d4JfGiIfp8DpGYN2WQeup+e2jOQ0RpUGn0QtkxR8z/B+?=
 =?us-ascii?Q?wp6moSPbHMGHd4mdwJPEb1seXaMHckuMK2/dbl3CvvAXYZA3lwi1Ma8NKCf3?=
 =?us-ascii?Q?lsIUi6lkFoBJCGiXJpkfwtcq2VLxz24LdWeoY81V5micJoE0u0KIar2vnyYX?=
 =?us-ascii?Q?6vNF7GCJrZAcWM4CWVLLppQwLmu/V7+yYkkYKLwznpnQi1k+2GXnn24YuSow?=
 =?us-ascii?Q?e4ST11JYdsb+BYQaKQTGcdYNkHMYNsgGVYzBssBX5BYcW3a2ToollkzqubPG?=
 =?us-ascii?Q?XklCUa1+nVOlW1R1J+DoNXLLNBHcdH8jdVxgWO0M0e9oaUOzHEqC8jtH1z9V?=
 =?us-ascii?Q?nPJb1pMwxcKI44al7MeEqBpJRECx+9vVFocnG7tdcOjnYo0bVfE4PjaT8Nw7?=
 =?us-ascii?Q?WAcYMme5XqsordfqcTyyiDRqeBhcHqFDwkcZDVSzWpaWEtGgAyg9X+Wgk/Ox?=
 =?us-ascii?Q?WUHjar4BSmZmtKCq7X2tCP0dDe5iKFYDEqpxEa2EZM1WEij8pK3+V4RPmpDu?=
 =?us-ascii?Q?CtLSu8v4ISfTwg9gdFuDw5bxeh/rdSTxsRAO3t9T/oz9VGGptAvT2VvmkQEj?=
 =?us-ascii?Q?n6T85WTDxwC+tYvcLjErebXThUA4KmWBLVmB+rc/UDhFRLmXTBPY/zPbT5+4?=
 =?us-ascii?Q?wiYTCwJJo5jvxs1k+X0Gp/JjbgbrWdL1TT0WrzkrtiXF3CUAu0kM0wqxw5w6?=
 =?us-ascii?Q?JfTje3PZMjGXST5yJZ39yrvRsvsnWH/E3R2ft1Brn28tAuiZswTRaBQh4NSa?=
 =?us-ascii?Q?FylGycb5OiYdV36sB0Fo+nMYD9s393W5Jz6RE+J8cFgp93dRBqfZXe4v7IVh?=
 =?us-ascii?Q?3cRtfavc/SMW2x+AhIqSpwzaHmSneE5t7CO1rWsArhXHZCMVH7wXCreAs1wj?=
 =?us-ascii?Q?xLGXt987kSv4czBH3Q5X+NpO8YtFohef/V0+GG4GBaMyoLzJOKPJDPqSZQmY?=
 =?us-ascii?Q?ioWN2r7GhLoeU4WE0XXm1MhWqwk1L/dhrGdk1pFLWfPASI8Z4MS05KwS3w+j?=
 =?us-ascii?Q?6HZkIWUywuCY92lk?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 l6i8UTH/yhxGq+dqEXoc+A8yYEPv2wK9SDl3NnGKfwbcAuMUkGJPpTLUarsbrXQjjxjTOibTbzc6ieLX5u4sjdA6AInluPJu7Cbyqr18Is2US2+bZNGUROlLdE0ng7i5nXbkkSfGYDdB5DU5W0NjMklvl0qqOovz+x3vjNanCKYi9Jup+Q1VS4nOnKhY+7HC1r58XJMfNepEDw6Hrlf9oROdnXauKWgB7/3pvnI2tvmwTr8w3PnqrlB3R8ZBzYVTzewPsbKeneDT2iEitA6y4oNSR53mdALMhS6LirwQuD3x7f3dquKS8ER8jDoSgj6htELcbGTzol0zRSVUKIN16Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR08MB9404
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.1.75];domain=SJ0PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.1.75];domain=SJ0PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7330784a-a186-48dd-2f2f-08de9f246dee
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|35042699022|376014|156008|82310400026|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ohqt8wDHpSblp5fwOlhtVJLnXAQC9GmVHfwRZCbu5M6MOA1aivKRBg6xhsnj?=
 =?us-ascii?Q?oNknsh3CBFuGD1XjnLIKWP+ALZjupL7U75r/EEj0ImiOp3ogQkKW4tacNUlG?=
 =?us-ascii?Q?my8AbBkEptkBUYLstOOHVbkDZqEN5shforL/G+1akg4lo7kW1jh4dR8/KPet?=
 =?us-ascii?Q?xBhE7WRF45ONZge6+MdVdt7SPEGYIRQHybJBM0K0sEC60YxWMhis384X/RPN?=
 =?us-ascii?Q?y22tV9PDUUDV3sydZJg+D4oIWL693kVYQ2ffc69xZevJV30KqGy54YBZOJQD?=
 =?us-ascii?Q?yKfb/lyVOH2xxnbegc5VFK/eQRSkxU3hePcHSxjdXjojLf9B29x3s7yu3Xta?=
 =?us-ascii?Q?5SxUzivgJ12DgqiTnluSafcPSnnB3UXhMmeA8DbKfpbwcrTZauuPMs2Brnqo?=
 =?us-ascii?Q?Js7mk4WCI4UB2EKGLzmQfGWNdOpzZaRg/uJMlJu+4q/qZzT7cizI9iJgBLxl?=
 =?us-ascii?Q?na72sOkd555fxsv0ck97kK6V7VCJXZGpMvmrPUpvMEkDLLklDWnug9eCtJrT?=
 =?us-ascii?Q?iuiKi8GStJ2YlVF4Ztqh8KoCQSA57RI2W1tVSNpZlEgjLjXeavVy3vqNGXf/?=
 =?us-ascii?Q?7ZcLcJoKGG34JBLOBxbwdqiijrzenuRV6+fsaqG9CJEJRm2wIrQWcT1/EA5t?=
 =?us-ascii?Q?GCi9SabVvHNURkFhVH1JWz8Go9K0HjroEsc/f6r1jJXGl+6hvgN3Q89cPjsf?=
 =?us-ascii?Q?v1YDR8SNwDk3Ig+811hqvx0JZTjsO4ROMlNQF34tjM198rhJnwdvedxSSr+k?=
 =?us-ascii?Q?chtDpYWmB6kKwJdGz0H9wLQWV4ggr/QCv2DsJqw65wG/NqblHPQzcbyjwGM9?=
 =?us-ascii?Q?SRFcx+zYWhUaaucbLwizlqDgJjMvuFeFyBo0LxASnMO6sRDE/Rku7yHmRxAu?=
 =?us-ascii?Q?1bky1bnRQeuq8ZGFJ4D6J68WYxGcjoJt5vOlzDRkJAxdI5rR6LUnz+X6HZEN?=
 =?us-ascii?Q?nImX8U+HcjRSmTVm9ubftrIM93DHcKM3m9Ijg4k/B7gVNkxVlq+IS9maMP09?=
 =?us-ascii?Q?51UAVskIXdp2hdlaxHovI4xbOzAExFlS2ciyPYNQb1rf084lZE74M+wY5o9i?=
 =?us-ascii?Q?1nNl3i4B0HGkK0uZy5lnBYcoHp9KwUDcLXzTMR3+DUQtFy90o9XKUgxFWrfd?=
 =?us-ascii?Q?EohQWiri7xEV2tz3h9P04PeuhjYp8NH7t0zoagSfQn80BKfOPhUO3p3X1mWK?=
 =?us-ascii?Q?ILc0TB3e6pzKeWSS?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08CU001.outbound.protection.outlook.com;PTR:mail-sj0pr08cu00103.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(35042699022)(376014)(156008)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HppJ1eW3+j5+5p7/IvuE6vlafSEuF9O4HEC2JJy7HqE/Uadga5qwUB0/UXMUQgyNEt/V0UG1zsF6o+D9QfM5Rv27vUVa2FH+i8/VPqHNjhSZ0eplx1xM6wJnuf4bwK6kbXTBxOxJrUFpzC953M6dNd/uBzl0JV10qDxYSZoZpLEDG/rX1noMqNpBp6/ouBAdS9iZ4UbBe0t3EieNMiLrafsswPbH5nYaO3Atx8UBzLBtrQ1bFuhLsugrb0i/Vor/+1wIVivn1V/14FxiQ9iEuv5QKTOBk1Tuwl1BKXCsV6g5xFTWq6ARkvORibjViCo2vG45I44ifACRMUispw9mBSdeCI0GLBwg48IXKV7uKLrFClVubrdY1K5wq/Tdi4VvMCpd5ZC2pJUQQ2TrjUc85ntm9s3jbfYgHx23Y5n2dDwd/sQjN6ijYEVHFxqQuX5H
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:20.4572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed4810a-ed96-488d-a5ea-08de9f2471ad
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR08MB6514
X-purgate-ID: tlsNG-42698a/1776720808-06D77F3B-028741C5/0/0
X-purgate-type: clean
X-purgate-size: 4659
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.229];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[213.95.148.172:received,40.93.1.75:received,2603:10b6:a03:5c3:cafe::76:received,10.42.69.11:received,52.101.57.126:received];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B1ADB43441D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit moves the altp2m_vcpu_initialise and altp2m_vcpu_destroy
functions to common code. This makes it possible to use them in the common
implementation of HVMOP_altp2m_set_domain_state.

This commit contains only code movement, and no change in functionality is
intended.

This is commit 1/2 of the altp2m_vcpu_{initialise,destroy} phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/include/asm/altp2m.h |  6 -----
 xen/arch/x86/mm/altp2m.c          | 41 -------------------------------
 xen/common/altp2m.c               | 41 +++++++++++++++++++++++++++++++
 xen/include/xen/altp2m.h          |  6 +++++
 4 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index b3d348386a00..43dd5d2acd9c 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -105,10 +105,6 @@ int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *mfn,
                                p2m_type_t *t, p2m_access_t *a,
                                bool prepopulate);
 
-/* Alternate p2m VCPU */
-void altp2m_vcpu_initialise(struct vcpu *v);
-void altp2m_vcpu_destroy(struct vcpu *v);
-
 int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn);
 void altp2m_vcpu_disable_ve(struct vcpu *v);
 
@@ -151,8 +147,6 @@ static inline int _altp2m_get_effective_entry(struct p2m_domain *ap2m,
 
 /* Only declaration is needed. DCE will optimise it out when linking. */
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
-void altp2m_vcpu_initialise(struct vcpu *v);
-void altp2m_vcpu_destroy(struct vcpu *v);
 int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn);
 void altp2m_vcpu_disable_ve(struct vcpu *v);
 
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 46374373848d..0542e3ef9196 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -14,47 +14,6 @@
 #include "mm-locks.h"
 #include "p2m.h"
 
-void
-altp2m_vcpu_initialise(struct vcpu *v)
-{
-    if ( !v->domain->nr_altp2m )
-        return;
-
-    if ( v != current )
-        vcpu_pause(v);
-
-    vcpu_altp2m(v).p2midx = 0;
-    atomic_inc(&altp2m_get_altp2m(v)->active_vcpus);
-
-    altp2m_vcpu_update_p2m(v);
-
-    if ( v != current )
-        vcpu_unpause(v);
-}
-
-void
-altp2m_vcpu_destroy(struct vcpu *v)
-{
-    struct p2m_domain *p2m;
-
-    if ( !v->domain->nr_altp2m )
-        return;
-
-    if ( v != current )
-        vcpu_pause(v);
-
-    if ( (p2m = altp2m_get_altp2m(v)) )
-        atomic_dec(&p2m->active_vcpus);
-
-    altp2m_vcpu_disable_ve(v);
-
-    vcpu_altp2m(v).p2midx = INVALID_ALTP2M;
-    altp2m_vcpu_update_p2m(v);
-
-    if ( v != current )
-        vcpu_unpause(v);
-}
-
 int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn)
 {
     struct domain *d = v->domain;
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index a731ad7cdab8..e699b64678d8 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -59,6 +59,47 @@ void altp2m_teardown(struct domain *d)
     XVFREE(d->altp2m_p2m);
 }
 
+#ifdef CONFIG_X86
+void altp2m_vcpu_initialise(struct vcpu *v)
+{
+    if ( !v->domain->nr_altp2m )
+        return;
+
+    if ( v != current )
+        vcpu_pause(v);
+
+    vcpu_altp2m(v).p2midx = 0;
+    atomic_inc(&altp2m_get_altp2m(v)->active_vcpus);
+
+    altp2m_vcpu_update_p2m(v);
+
+    if ( v != current )
+        vcpu_unpause(v);
+}
+
+void altp2m_vcpu_destroy(struct vcpu *v)
+{
+    struct p2m_domain *p2m;
+
+    if ( !v->domain->nr_altp2m )
+        return;
+
+    if ( v != current )
+        vcpu_pause(v);
+
+    if ( (p2m = altp2m_get_altp2m(v)) )
+        atomic_dec(&p2m->active_vcpus);
+
+    altp2m_vcpu_disable_ve(v);
+
+    vcpu_altp2m(v).p2midx = INVALID_ALTP2M;
+    altp2m_vcpu_update_p2m(v);
+
+    if ( v != current )
+        vcpu_unpause(v);
+}
+#endif
+
 /*
  * altp2m operations are envisioned as being used in several different
  * modes:
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index f5a4d0e60562..7defe6126563 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -24,6 +24,12 @@ int altp2m_init(struct domain *d);
 /* Free altp2m views */
 void altp2m_teardown(struct domain *d);
 
+#ifdef CONFIG_X86
+/* Alternate p2m VCPU */
+void altp2m_vcpu_initialise(struct vcpu *v);
+void altp2m_vcpu_destroy(struct vcpu *v);
+#endif
+
 #ifdef CONFIG_ALTP2M
 
 /* Alternate p2m HVM on/off per domain */
-- 
2.34.1


