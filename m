Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBkcGbyb5ml8ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED46043429D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287873.1568318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFP-000714-Jt; Mon, 20 Apr 2026 21:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287873.1568318; Mon, 20 Apr 2026 21:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFO-0006oW-MG; Mon, 20 Apr 2026 21:33:38 +0000
Received: by outflank-mailman (input) for mailman id 1287873;
 Mon, 20 Apr 2026 21:33:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwFJ-0005xa-GO
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwFI-00CCPQ-Su
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:32 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69ba2-bab6-0a2a0a5309dd-0a2a45098212-8
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:32 +0200
Received: from [40.93.195.142]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69bab-2497-0a2a45090019-285dc38e3c53-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:32 +0200
Received: from BN0PR04CA0009.namprd04.prod.outlook.com (2603:10b6:408:ee::14)
 by CY3PR08MB10695.namprd08.prod.outlook.com (2603:10b6:930:10a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:33:27 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:ee:cafe::48) by BN0PR04CA0009.outlook.office365.com
 (2603:10b6:408:ee::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:27 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:26 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHn6qLFz1wdM; 
 Mon, 20 Apr 2026 14:33:25 -0700 (PDT)
Received: from DS2PR08CU001.outbound.protection.outlook.com
 (mail-ds2pr08cu00106.outbound.protection.outlook.com [40.93.13.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:25 -0700 (PDT)
Received: from BY1P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::13)
 by LV3PR08MB10496.namprd08.prod.outlook.com (2603:10b6:408:289::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:16 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::7d) by BY1P220CA0016.outlook.office365.com
 (2603:10b6:a03:5c3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:16 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:15 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:12 +0200
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
 b=v/WqEAjdi/sxfO/Mt7R+n9t7NVTg8iWZwrBpS7qjICG5Tkx5OydKjlhsYw/UxudsEuwDH/yjtDmcdaHVZBKMJLDyLLmWzPhJDa4EL4zazMgeafSDOJa5S5ia4zseIA/OxvdF7FA26eMzTYkjHJp+r92a2MSf/i7sbHExbeZCuEgrzbUJWfABl/m3Bm6iN4k78PSX7pxfJalSwPGtEwwCDA6ggJ9GIlvIm5VinYJMb+Vn5Bu3zCQamLOTL5OgDu2c0jJrDCM6jhGaCklVWz8KtnlkXRtWc+sLkSH2IWqAMNSta5I5+PngY2PHy3mm+395nuM9IDSoXCVKfg1uelw2NA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvY1Hq4hwLu2aLmi7v9CAxN3huVX6llKANSCVnMm0ZU=;
 b=u07qfmBacJbLkKBy3A1BRggUIRMjOHSV9+vnJA2xeyudxKwqMBniGRcIBWYq7li7yCZBzrGRY2EYOMrOmzjJQh0hd5PoKYub9Nm3/1JLIXVOIBZn0YWxGB4KUzIWZV8ImvPF+wBsKvF+l2woCsfltqNnb6mQnlM0GObb5L7RQAb91zt09MUc/Dj7YuK8LC0H+9SYPgsS+o+WaydaqsZdYHOgtjlDnDE3cPlUIOxsKjZyYLsH0DsZbVG5l4DHxpvnop/aM97xWj0w5di6rKGV/sbb41C0hE++DL7WbVZeBFlqkqX8zzhcjHksVvdl33EeyJTGJzleL3FwX7brwaJLrQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.13.54) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvY1Hq4hwLu2aLmi7v9CAxN3huVX6llKANSCVnMm0ZU=;
 b=O8bReBvxkUhN+RPIvfp2ulfpPBJIAVULs9Nrcgiy9ft7P2vbloncct30YrOMyMgxpmg62Y3A89FtBfYbWxFsgSgfauL+zpC4LDjEiAXJ5ybpF7deSNzBHLtr132NI4rupnzAubPLCN0dyqwrIgwzHpKatBhqL+1fu+pVYUvlUNE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.13.54)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.13.54 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.13.54; helo=DS2PR08CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPX4hfRbUXFrVZZLzAolr5brBPw6sAnL5xoyhMSaY2Cm9Stu9N4KgWn5R5Y3Gie2Oj/Sce0yp/wAZjuQMTIbKSwDRV/dGlhzvq2Ou3wcyUfeK+z0iRElCvX9Y//TJc51D8PwjrIk+LowVsy3pX5h9mKotXJcphnuhXhiIWpOfJjNNBjsPKvvIoR+ZGREMc4//w4Q6sTftI4Quh9zG3pWlU1zfFYHXemjITHNweMF+Oe3praYz+6SW3bDaR1Vlrz59AFOhHfTedZeHPGkhXAeSNsHy3VsmhoCW2A5pkVN4S3RZ4zrXeGB+90Rwlwj1HKr3OT+MvjYd/apoDX66kVcsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvY1Hq4hwLu2aLmi7v9CAxN3huVX6llKANSCVnMm0ZU=;
 b=ZS8iA0+4kWo7vv4GzHg0ijpPnqdN0IHIQHtQOIMC+vyWiiMwZzINFSiiSYyDOG+KKH3/R2tAL2Y03padJSBtmMG9g43qzmeJQyufBJ9DcaCg+9ZUzUulQ/thtuJDHbK1NyeQvITZkLJC6CvR4u2U6QnBRemtSW7ZDNC1pRlu0vmw2jR3E1b/8OhZnBsh4iZ3835esgrDOzQoDstau4XRh808oApCSBbCEGHBEt2nl8CNV66BnouY6QVq/hIt7ooGyFRLHOvZ8uA/AA90lIS+CjJpdstPOLiOyCjz/Gdydjws6QuRCBH2Mh8yYIJwH4hAoMJ5uJguhqYuu35OGwQJRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvY1Hq4hwLu2aLmi7v9CAxN3huVX6llKANSCVnMm0ZU=;
 b=O8bReBvxkUhN+RPIvfp2ulfpPBJIAVULs9Nrcgiy9ft7P2vbloncct30YrOMyMgxpmg62Y3A89FtBfYbWxFsgSgfauL+zpC4LDjEiAXJ5ybpF7deSNzBHLtr132NI4rupnzAubPLCN0dyqwrIgwzHpKatBhqL+1fu+pVYUvlUNE=
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
Subject: [RFC PATCH v6 29/43] arm/altp2m: Add support for altp2m_vcpu_{initialise,destroy}
Date: Mon, 20 Apr 2026 17:31:52 -0400
Message-ID: <20260420213206.208750-30-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C9:EE_|LV3PR08MB10496:EE_|BN1PEPF00004689:EE_|CY3PR08MB10695:EE_
X-MS-Office365-Filtering-Correlation-Id: 441271fa-6c5d-4e9e-a055-08de9f247586
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704161411799003|36860700016|1800799024|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?7nlLgsG7Nue2zqKG4/Q3EpE7gUJPu/Naps/Au3ZJNXA10dSSreYpFP1sBu1B?=
 =?us-ascii?Q?DTs7saQ2aSlMjVPYfQPNXZoSMX1ep1VuLCRCXSlwXdmktQoGrv/iJFWXJhbb?=
 =?us-ascii?Q?4ulbKK2c6uRPM7kbsKEtcoV/UqJX3mY73Yz80dFDsCJVZaxkvMi0bZu29/Fc?=
 =?us-ascii?Q?EGwwquQgiZsswYOzbV7xnZqEutAM5mYFJ02uCrwmVvcMztL8a5CLL5OsKM2U?=
 =?us-ascii?Q?LURmPPzIcUJ2t536W6O8Vu+sDNvukDo317wu5n8IvNZw2XBZIjGqGAt0s33F?=
 =?us-ascii?Q?P9KmK1IViJdAn3qmylZsXYzRq5Jqc0Okk1yas0CIUPc2FRQHqSWrAUs/TirO?=
 =?us-ascii?Q?0atb8x920bZXWy0TEn4TpQJ3n7zyyapvLbiLWvUFXtjIbjBL8nwcMyWDrQ76?=
 =?us-ascii?Q?NCS+xsLM9de/cwux2uNXMFWfHqEH+W3sQ9C0lkKWGS761j3k6TCZZCr+Lq1z?=
 =?us-ascii?Q?Ah89wrnqrppLwFwmR+rN1ljWvn4fKDOniZrTYvgRC+/2ce4N/m3uWdQb5fp0?=
 =?us-ascii?Q?S3yNyMHk0gz6nrHy3FwXeIuTdgo5CSW+XjLrZX5D6TEg9tn7RfOGsSt+z5qt?=
 =?us-ascii?Q?hGQrpCJPHdV8VdpFtF8NS6zwd93cbLQ/T78lWKUd6a6Ud+jZP9jmJ3uD0Oz3?=
 =?us-ascii?Q?TljS4XFZxKcDWMgBlPTx0A30qtOpPkHgWpc9DJU0v/F1cWvC3j7BS5Y+GgPC?=
 =?us-ascii?Q?TCipcWgq9M2sbC2amjV92znFdwUz/s2jZ6ZvEK3MUZAtvuNOemD+1AbA4VEK?=
 =?us-ascii?Q?E9w7rZW/0qfkDA9uka57o/UkAYOoFDU9Sum6fCL3R57FV1U/AwEwASfNx2LQ?=
 =?us-ascii?Q?IXbPT3cK2SYjGf77EfBu0jRSFIIKPryqwiu2K6GhDLn9rsXkbNl/AXBSICy6?=
 =?us-ascii?Q?EA+N6NzN7uqNzrXkE5tN/iMBkkQiQjurq7TEVwjtalwGw5o4yd1I8abHGGep?=
 =?us-ascii?Q?SQNPzLcwyEtyrF5vzHfzSRUkYd19hISaw1ecEcsHY+MaxW949CQXYAcij7Nc?=
 =?us-ascii?Q?2EzWaDWkKkFmk/l1jNGWOvJuei9R+8cOLwMulX+NGoswUarb9lLiRd4vtMre?=
 =?us-ascii?Q?KkbVzE0DUeM1hnbX0XO3QBk2LL4ETzJFXVN4FglL9oA9knHKB5dHQecamSkZ?=
 =?us-ascii?Q?GLPL6WuSpAKS?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704161411799003)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 BpYVmuepbO3kGX2yPdaiVRVz2oh196cdc7m69nM90BaOmzy5W+R97z2q1Qx6W5Nu3t9n+SQb9AO2p1Ro4ZqQFkPSj5Dl0pdYm2Vn0DsZhKWq7ZUY2a9V24drimGxsw9iIhUY/xepkaQTyw0Cm38EMA4kOEYLtnxBf2tCldZvdZuBD7vHvpumTatNetB9l0skT4WOUhhVzHuXDLr+HJYssJcf+zNTdiTkFW/r3BE38SzeNXMVpUBNERa/k5JGZ86bR9KQ9Q2Gd2zKUp9zBKQPHhpbJKstUs62/4OEn47IpdlqVZTw0/AMjTQ9KNrZ/LCbnIaoaJGql/g2zzz895CRcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR08MB10496
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.13.54];domain=DS2PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.13.54];domain=DS2PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2dd3d9a1-1442-49c1-0db8-08de9f246ed8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704161411799003|376014|36860700016|1800799024|82310400026|14060799003|35042699022|156008|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5vNSrxPwnMxJON5RQJyIA1GwRJFMYFVv+aBErSa9yRtHwCipbuxZsidyIrqe?=
 =?us-ascii?Q?+H9W08NaTnOxSjvwdBPBU1B3pokIPExy1f9432xNOGAOV0Afnr+e4gzBSTbL?=
 =?us-ascii?Q?NbeN4G4X0hPINgSc3ia4kc9pDpaaFEMblzzcemZXfoh7GAh1A+uDQ+PCnpwX?=
 =?us-ascii?Q?jEUeOBTcx2TgylLVuCDglpu2Gi3OTN7KxqbIWM8JcNKO4dqHTRj7jt1XJI1Y?=
 =?us-ascii?Q?ufiItyhSTGxm43sb7vSRQfb0BS7eQyq2jJVyR0W2glu+u39lbRy6euULFw0f?=
 =?us-ascii?Q?XhEhDihEEOkfuVV8rQapAe3t4HqKb/OrNQVY7o2CQ49yIwk3ukP3NFIytMKI?=
 =?us-ascii?Q?HfgKhmEl5r9RU0hqMEHp6LbtBvRz5qIJIy7lwwKtULpIB/XqqpKw2z3IX5qj?=
 =?us-ascii?Q?fNOO4DmHFVE7PhRmlkT1/rZpdwETiDTVbTQnffsRg34VwqV9tFXvUiS+dePB?=
 =?us-ascii?Q?bV+LeqcblKQ/rZ++U8e1PopfiND+h4UTFXtwkF2YYTXytgqEowr0t6EvJEJV?=
 =?us-ascii?Q?y5TEgytE7PpCA6KyohKPkCynFf/kDMVuv/pjIFhzobyVaaFvG1e2j12+K4/T?=
 =?us-ascii?Q?Cm4ikNSPY265ZhnHoq2qce8Nz+k1IUKBI717m7XENqJX4t7mSmZdOkChw0mb?=
 =?us-ascii?Q?Vb1IsikL3BeKGa32UwUCXVC+EQk2pgDJVxZwpVx7zENTknpai+ivIhyNCOua?=
 =?us-ascii?Q?Uf7zwoKnXDXGMpcB7n77ViJEJaWBglu+LQrSATWdFZIMmEcnvqvblRZ3VsnQ?=
 =?us-ascii?Q?UO7TtdgFVbrdt+3QtWHLO5zKhpeCDNLPDCMCCrv3Ev9WhDuPhhyDBioEAjLy?=
 =?us-ascii?Q?JIgw12WCPNJkT/Akv0D1nL7W+2x0lcs35bm/RQjIP/Xrw2W9rk4cAxw59z7J?=
 =?us-ascii?Q?6Vb7Q1rrKQUFlGv3pP5OakSTjjN6jgl++ZQaBbvajUK4rHbGNwhv0+efkJBO?=
 =?us-ascii?Q?urIgW1K+ONdVMo2UnX70ZxlVuNhEaROlSk29TSi9ZS2mKOW845R8jWlb0DKl?=
 =?us-ascii?Q?kNOeIMXibjdY7xOJyCzFBjvqMsnwcJM4V21HMoOtpmWmn+YUbedjM9K9tSi/?=
 =?us-ascii?Q?1MZkfbFpsemfs8UIsi2sosBxWj0PQvXmWrDfccyb63qeTprFPNOeXwfZQQTW?=
 =?us-ascii?Q?/K5OJZP94tXw?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR08CU001.outbound.protection.outlook.com;PTR:mail-ds2pr08cu00106.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704161411799003)(376014)(36860700016)(1800799024)(82310400026)(14060799003)(35042699022)(156008)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dO2g5M6zhX8U6aCIPU2TKZdw3p3JLXYuNsZrN/I5FhBKMXMpl8Id3kHB0FGKbKf61cECLYBrKJRyxWLS8eEzCEWm3vb27uDl7Vn2xOVYYcFeFCDrBpMsmEGl+G5do/l3+bY8/pbr8dXbpxUdIDsyXlCjQawULtfI7Bd+7N4JAWyr7np9fZnUrJkNZC9VCPPx3U1PS578Awzn6sh4u311ImRSReiojktUCrxM70m8lgeja3dr3WOUeBKhG5bSYTKnlmXUSh277dm1LFziWxrVhhDIa/OnezjgVQdp7ZlCWq+hFkhU291sJ1gWnKblqb+YK4o1n2wR2Jt54ki7C6Gi+JnKz93wkGsDvdiD4Dm/j14hldCB1Cno5O5EIwPOYYhc6Vqgyq4JlJQF9wiOMnYeq3gvRfqwDl1HCaP0guNFJk0ZNni0O6IiBe7GTMyZ0HFq
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:26.8045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 441271fa-6c5d-4e9e-a055-08de9f247586
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR08MB10695
X-purgate-ID: tlsNG-bad1c0/1776720812-91969A53-69D0BBE6/0/0
X-purgate-type: clean
X-purgate-size: 3182
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.304];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: ED46043429D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds support for the altp2m_vcpu_initialise and
altp2m_vcpu_destroy functions on ARM. The x86-specific function calls,
altp2m_vcpu_disable_ve and altp2m_vcpu_update_p2m, are gated with #ifdef
CONFIG_X86.

This is commit 2/2 of the altp2m_vcpu_{initialise,destroy} phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.

    The equivalent to this patch in the v4/v5 was originally part of the
    patch named "arm/altp2m: Add HVMOP_altp2m_set_domain_state". In that
    patch, the check that the VCPU passed to altp2m_vcpu_initialise isn't
    the current CPU was removed. This was because ARM only implements the
    external altp2m mode, meaning the current VCPU could never be a VCPU of
    the guest for which altp2m is being initialized for. Therefore,
    skipping this check was a slight optimization. I've removed that here
    because altp2m_vcpu_initialise is only called during an HVMOP, and
    skipping this check on ARM (especially when x86 also implements the
    external altp2m mode) causes more confusion than the slight
    optimization is worth in my view.
---
 xen/common/altp2m.c      | 14 ++++++++++----
 xen/include/xen/altp2m.h |  2 --
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index e699b64678d8..7b80426c7798 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -11,6 +11,7 @@
 #include <xsm/xsm.h>
 
 #if defined(CONFIG_X86) && defined(CONFIG_HVM)
+#include <asm/hvm/hvm.h>
 #include <asm/hvm/nestedhvm.h>
 #endif
 
@@ -59,7 +60,6 @@ void altp2m_teardown(struct domain *d)
     XVFREE(d->altp2m_p2m);
 }
 
-#ifdef CONFIG_X86
 void altp2m_vcpu_initialise(struct vcpu *v)
 {
     if ( !v->domain->nr_altp2m )
@@ -68,10 +68,12 @@ void altp2m_vcpu_initialise(struct vcpu *v)
     if ( v != current )
         vcpu_pause(v);
 
-    vcpu_altp2m(v).p2midx = 0;
+    altp2m_set_vcpu_idx(v, 0);
     atomic_inc(&altp2m_get_altp2m(v)->active_vcpus);
 
+#ifdef CONFIG_X86
     altp2m_vcpu_update_p2m(v);
+#endif
 
     if ( v != current )
         vcpu_unpause(v);
@@ -90,15 +92,19 @@ void altp2m_vcpu_destroy(struct vcpu *v)
     if ( (p2m = altp2m_get_altp2m(v)) )
         atomic_dec(&p2m->active_vcpus);
 
+#ifdef CONFIG_X86
     altp2m_vcpu_disable_ve(v);
+#endif
 
-    vcpu_altp2m(v).p2midx = INVALID_ALTP2M;
+    altp2m_set_vcpu_idx(v, INVALID_ALTP2M);
+
+#ifdef CONFIG_X86
     altp2m_vcpu_update_p2m(v);
+#endif
 
     if ( v != current )
         vcpu_unpause(v);
 }
-#endif
 
 /*
  * altp2m operations are envisioned as being used in several different
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index 7defe6126563..37c875a52327 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -24,11 +24,9 @@ int altp2m_init(struct domain *d);
 /* Free altp2m views */
 void altp2m_teardown(struct domain *d);
 
-#ifdef CONFIG_X86
 /* Alternate p2m VCPU */
 void altp2m_vcpu_initialise(struct vcpu *v);
 void altp2m_vcpu_destroy(struct vcpu *v);
-#endif
 
 #ifdef CONFIG_ALTP2M
 
-- 
2.34.1


