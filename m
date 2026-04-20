Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GErIG8ud5mmyywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:42:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5414344FA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:42:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288160.1568487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwNu-0005zg-Ji; Mon, 20 Apr 2026 21:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288160.1568487; Mon, 20 Apr 2026 21:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwNu-0005wO-G3; Mon, 20 Apr 2026 21:42:26 +0000
Received: by outflank-mailman (input) for mailman id 1288160;
 Mon, 20 Apr 2026 21:42:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwNt-0005uP-B3
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:42:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwNs-008j7E-O2
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:42:24 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69daa-bab6-0a2a0a5309dd-0a2a4508afee-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:42:24 +0200
Received: from [40.93.198.88]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69ba1-63b5-0a2a45080019-285dc6581f58-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:23 +0200
Received: from PH3PEPF000040A9.namprd05.prod.outlook.com (2603:10b6:518:1::4b)
 by DS0PR08MB8541.namprd08.prod.outlook.com (2603:10b6:8:116::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:12 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2a01:111:f403:f90f::6) by PH3PEPF000040A9.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:12 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:11 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHW0zb6z1wdY; 
 Mon, 20 Apr 2026 14:33:11 -0700 (PDT)
Received: from DM2PR0701CU001.outbound.protection.outlook.com
 (mail-dm2pr0701cu00104.outbound.protection.outlook.com [40.93.13.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:10 -0700 (PDT)
Received: from BY1P220CA0047.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::9)
 by CY3PR08MB10748.namprd08.prod.outlook.com (2603:10b6:930:100::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:33:06 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:59e:cafe::82) by BY1P220CA0047.outlook.office365.com
 (2603:10b6:a03:59e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:05 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:05 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:01 +0200
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
 b=eha1VwaRxYuut5YLpUNEo8UEptBRumFr3Yq35yL3Eh89j1j4i3SwJzPWcrIbMCUc+SRqZTB6FzYagRI+kswv0CdA76QyPPHf5nMlEnAi0HY0p5qNYncqXJ8/Xu4OpsV6Ll9mj4+JCcPA4I0K07awSAiVrkKRfP2J320RYe/0hB+tC0anJk2eXAwLR7sKYdKtl1gRqlL/1aQyBappxIerspC9A9SZgyGcl/7mQap0T+Tsyyl9sSEfi9yYnne/TFTo09z/I7pIvY65/r4ihAyI45utE+yDGNI8RkoLkENXyGrzeZoF3PiBqDK2bP30vohvFGJ5WQvf5+RO56M4tBgElA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bo2v4ugtYXSGdSqYmYudyzdTq4r/l5sKQLamsKzHkjU=;
 b=cDBjyQuOJZS727KsIWz74OVIjb/GrWvdEaQmGvNOvC419oBkjXFrutJ1vxYor2+ppqwwL6nHno3PZUdNSE1mgwHrnTJ/Vs6cqd7n1FV0P9pbGVfoeyAF0CuBABuChDZCPWMq3bb6Zq5EsoIaPndhlE21v35H9nt+nKh4WLvLLYYeUtVzqVr5dqW9YYt5/gLZK9czhPSuIPIcTGm+48NyWS+B6FaiujX88EiMbD/ufcvz6m0PHBMV7q2WXAOj9OL4U7EQ6HjCgpHdP88ffabjx1nrkiQL8AGx2vJdyj/SyMP5oWKt5NGYJzkJW1QHRkmr7pqkUzex5hH0wNwTTchP6g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.13.68) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bo2v4ugtYXSGdSqYmYudyzdTq4r/l5sKQLamsKzHkjU=;
 b=n3fVOwQUS//cMRWrr3gurd0dQBAk+t2SOJUOgZ9oO1cgiW1ZOjFV5zCNuOp+ZHQu9+jH1JsV/cfzgBKLP6pkZ3LmQdCon/Wz18kdH4mVJHMt8QNI+n6eki9UsbI9LAvyilmaNwuctVjRmfGgmtSy7X/RoAdN/2N1bUvf72ScnTQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.13.68)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.13.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.13.68; helo=DM2PR0701CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnO6fntf58mlbTWaSf748FGIU3I69jxLSSl8JmPrOs0lAGHXpbHJVSh+wvXLtfCZYROCP5as/qnub/H6jLiu8mcCeOX0WFGzJjRvbAr6Svnb9gumUzT8HhcS2+CLP52UwvtrslnPytjPmWh2V1Jq+/jCa+t5KOMnpyt1qyKcAnvjikout5VrAdXCni3HSWiGTnVjM4CQwLYQxEcvOsNSFvCNqOOVnDHo6fbCIvvNJvyrlDlIb59pOHOUgs8C9VqaAiJ1Zb9sr5gmJ3jGaFTXuZGaCOc8hHgSh0OfmP1BXTLxscGsPKpjeWZ4p4hHhHeTPSThReulGAUOKfCz8aZiug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bo2v4ugtYXSGdSqYmYudyzdTq4r/l5sKQLamsKzHkjU=;
 b=wHb/zWfpcgM6vFiNrnFEoR+ABVdSVMi0Y9Nu7AVFrR3q9dc9q6i1AbLOX9sVGh+CreSxpirxcxL/M2cagAcf6+Uvuy4ZLL7Fu45b1Y8pSVVJi0njjv9WTsH6u48R+xEMGtAAp67y1ShJhtIAumHn3fyO72GvvofUwxPuBVp4BvMs6dMTtFrhyLTAu4gopV+G1V7C4G2TLnAqY5Y/z8zNgP0If/AJC17WkXpZzsPHByI7DVE+rLoJI05jaxvDm9rpZxDHkMYKdAeiiCXEuPbkddmX73TCnfpQmJY1Cal+hR7vfoYBmF/+Fj/6fPAz1Q2MRNAV3LpEhLlOveFBqCEpRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bo2v4ugtYXSGdSqYmYudyzdTq4r/l5sKQLamsKzHkjU=;
 b=n3fVOwQUS//cMRWrr3gurd0dQBAk+t2SOJUOgZ9oO1cgiW1ZOjFV5zCNuOp+ZHQu9+jH1JsV/cfzgBKLP6pkZ3LmQdCon/Wz18kdH4mVJHMt8QNI+n6eki9UsbI9LAvyilmaNwuctVjRmfGgmtSy7X/RoAdN/2N1bUvf72ScnTQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Rose Spangler <Rose.Spangler@elektrobit.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, "Aqib
 Javaid" <Aqib.Javaid@elektrobit.com>
Subject: [RFC PATCH v6 23/43] arm/altp2m: Add support for altp2m init/teardown routines
Date: Mon, 20 Apr 2026 17:31:46 -0400
Message-ID: <20260420213206.208750-24-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C8:EE_|CY3PR08MB10748:EE_|SA2PEPF00003F65:EE_|DS0PR08MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec4ddb7-dd66-4878-c2b7-08de9f246c93
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?EherKj2DNK3ooVZ9s0xYv6gY6ZLA9DPNTqcFoJ1UNvyo3OwljZx+FGUi9GP2?=
 =?us-ascii?Q?FgzZNxoUvgREsDRQSek6cE1yUXawpz5Mv3KwDnfzfSgdSM/8CTtei4USDm5l?=
 =?us-ascii?Q?3Nibtay80nmQn1U2Xi4xAQDjv2aWPfn8Q5Gst5OanFlZT6fJGTS37ZsX8vkO?=
 =?us-ascii?Q?Y5FpYuqO3FSqO0DXkU14bJexpw0gG/SuYVJAOMAuwxPB4sgmVfaIMc0aNNsf?=
 =?us-ascii?Q?qraYj9vk1PH4EaEDELpZTBQ1oAQPPra4rNJI+aYcIqgagVI5Gx6tbf7jxOgC?=
 =?us-ascii?Q?kMyIa1ZjdVflmpYMccdf5jIjTig6xlFCAYFHm99tXKH+SRvl9gTbRmfsgHx5?=
 =?us-ascii?Q?s7YwDbeVMcgQjuaiJSm/zsyDW6Ff+AVAl8Jbw5ZTXM1O131rHoFiK0cxSpJD?=
 =?us-ascii?Q?Z43WpoWytmBx2t31qKAFie+uW7hLvDOSgBwPTDIHaCLHttDzFdLaLtcwCQ0a?=
 =?us-ascii?Q?OIsA3vyIG6ja+p2IJuZkA3eaugYkQ86NmT7qUb0IBY+Sj1cYEHklLMpJgG5J?=
 =?us-ascii?Q?fMp0ERilU/MW9tAVtx9k6Yp/L6qcKqfIgelBjgpaXcnJ6m0Gn9XUVpM/o1dv?=
 =?us-ascii?Q?onCmndyhbiGpk84RnCDrtD6yjYh+1VmeKQ15jJkFpDm/Aw+grxOnD3HWgxIr?=
 =?us-ascii?Q?Lf81cOiQHEzd+2sm5765B6WkTK8FXU2Vz6re+lzU4vnzErZ9aUgchIJ5N7P5?=
 =?us-ascii?Q?zDPsEF3YOXMaIwJzccLs6pb+wVjRp+BdYmh7n/Xnos+7Pg6BlNRVBZg2uZDl?=
 =?us-ascii?Q?0B7CxgaQdyzVBA1NvAyJeVuhSdCzkKNTGr6p9DcTCuFDFsyqrkiyrAvzTNRz?=
 =?us-ascii?Q?/TK1mPTBRDNGrFE4+2IRJgPaZbEJmxxYZPXuBqk716yZnKYiU/3o1gPLZTmg?=
 =?us-ascii?Q?XfvJyfGVX2DF8ncl42zHjpBml5P487GOczHHWXkCPatdU6FCcJ7cr93adeGQ?=
 =?us-ascii?Q?uPDF9wgrou2bBCIjQqM04k7gnkMaR7N8DdLJlOrbk72hOFxnvYYgrBo+TcXy?=
 =?us-ascii?Q?nWhZcjpwrBJ46voobQpVVNFSgmaXUyGH9XXH7YWzTMHYFqdsa49EaYneLj+z?=
 =?us-ascii?Q?BVJuqnTJnKpgxWIdif173X4vmIrS6bU6NIFEz5sJ0oVRjxZgWQ7NG/loFzuD?=
 =?us-ascii?Q?Mzog0/3T36fDpm4VJ29BretiRRtecTpFPNgKHq9sv3udsGnzAnsgcl31kJHx?=
 =?us-ascii?Q?F+pLBx1qQoQPv9CKROhHOYIW3Cu276r7TMuWs6r3njSqPiF4l7/hxQUxQ98?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 d3uW8v+Xv6qGv7ugB3sG0GDaz8XvM3WrK63WtOeP1QjZ5MbPN40VAc9T8M1eOnhyhUbPw4HHZZD5/GSYSKQUuhRqrNPwlsxCCPXJaRr+A/psAzuRUrfS7LN+GuWamIvmUMSGnLNWMU6gEyq6gGuzNX3FteKwvHcAwUpNzo6cAZ2tiStgfOuZ2EDgUI2fPqKuUMNQWTo2983ZwfHTIeZxgFKsnvOWj8kSCL7Szy/qnSbYMei6U74burFgcN/6vEbrmD9rRp0b8IzIieY97RrGn8sKXwwhPQ4oTUSAvxcK+GSuyYtUAoYuN/ydfMGJ5ZR68Nwj7xXcz3phQ7nQCsIBEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR08MB10748
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.13.68];domain=DM2PR0701CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.13.68];domain=DM2PR0701CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f8d8d55a-67b3-4f08-bfc1-08de9f2468bd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|14060799003|35042699022|156008|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LXKzP1Kt7WvGFmN45H+KtqDCjeqaJ46/OyFBw37KugPWki0TrQnDY+EzEy7H?=
 =?us-ascii?Q?Pr6G+eZstVV/Fyp11lvmEcFz7K8yTn+6byr5BnZmerJgPCZd3smKJJnNwh4/?=
 =?us-ascii?Q?LTsjwvoWEXeLlqIfw5zX5Vg5WzEoCvjafIXrQ8wqaOUIw9GuGN93HDZg5F3+?=
 =?us-ascii?Q?3YVx/HcG5PdcjhuzcykGiW26WDGkR5vvdb02Yy2bluwUo9jM0BEMYlSX3ooD?=
 =?us-ascii?Q?y0FFAM463Lg/xEFpTqNilf/BMvr96qb3mHdWNOIuHVTPKYwezPbP2BJAjegp?=
 =?us-ascii?Q?lPPjez8Hf6VBfboH1IaIaEiIjZXlMuSUSVx+0rnX2UVecUUHFyfYcXBZw4nz?=
 =?us-ascii?Q?KwTbNnq/9MctwBe/q35jmJY+fClnPegxHRpKWkxEAWT/sGWMffqTzRfYwHJW?=
 =?us-ascii?Q?VJ6gvqAfPsiu5Rpr+O+tieBUqb8Sak1dzSP/iPNo8JaOHxnLVBdzKGUqYhmz?=
 =?us-ascii?Q?JsnLGqvuqbQIVTY/aUp19xJAxewzvnfPesllnmL6jPfCWcYch0CeHYpdCO15?=
 =?us-ascii?Q?qXi4w9JS+Om59vtG9ve3yw0PyVrCLH//zJ4D80nfgXQgId3n204bHoPtblHU?=
 =?us-ascii?Q?augU/rL6F6bvVE1B/Nkh4DztHe1Itlat1nMsFDuf8rQzbtd7D3d/EwYM4Bwb?=
 =?us-ascii?Q?v0M/jj1wzh7HICGwl/wINLHFRKVV+hhwpFST6svo/wbT/+h4tPXUbUebNY8f?=
 =?us-ascii?Q?CF8KnmuulohJf8K1MwxGppnJJzIi8qNfbAX2HRci8og2SVjgO2pJx5CJ9Kn+?=
 =?us-ascii?Q?VdElna9iFgVQcOnT7UbD9EX6ol29PdflqX12MIsQ6SchRo/ZpSLtWshuPNqe?=
 =?us-ascii?Q?bZxud6isFiK6YELSm120OpIjch4dTby/Esb+H0ZX+aO7mYTuQ9wwUUR2+oA8?=
 =?us-ascii?Q?YGMK3G0abp0BsCitT4Hb14g6qoDBZnSqRX96CsSECxrk+EGVZM5OvcpwZSnw?=
 =?us-ascii?Q?wOxUqdjgy6pJ/W9J3z8e/4g8eX/08rYgum+A9jy8K0ji/yHagHCKzmi0ab4v?=
 =?us-ascii?Q?Nba3dJ6OcgJq1fK/PLU1x4lHix6s2LLtYFoLSDvkg4JFYT/V5B7Oy4bwZPZn?=
 =?us-ascii?Q?ZsDdTqwW5wSPUBg8jOth+gRTzCUVTbFt2WTj+HHkf91Ux3yyRuilBu1Jozjy?=
 =?us-ascii?Q?dxf+XZpBuNeKcQs/k2fWeJNe3HFHnWETT8IGaWwLJep79cD0LTmE7PcE7C1h?=
 =?us-ascii?Q?tQi321cu+s07MnhCVGipKsSe4zbVpbaL2BBZDljZE+s6WZEsDJIQ/j+FCMc?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM2PR0701CU001.outbound.protection.outlook.com;PTR:mail-dm2pr0701cu00104.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(14060799003)(35042699022)(156008)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q9b0/8OOMM0eMr4FbIda31N4yIbjebZqGyZx7EqXLeSUdyiDUwC9gKFlUs7THpn2Z+iSHuFyLMNP5qIQevshVSHI3nOqF8vWZfsEbWR+Oj7aps0GLHbhcySz8PFPSqtYquaVLLzNX0k0rYlmAT4XScVD4JwwFseg3GJWc5uJZSaOS+AyGVtr/CfBmUZFHqsWp2zIZX2xIuFRL03k4Q3sLSuT03J8NBBoOAFwS/VW70Pd+iVIzqPhDVXmLYGTvNWfUwPQ9U2iBII4Mt7P+qOzX2HWdBF+8zvC2SetAbqVfeu3FPCE34Sx16jjtv+EP1ua4IWUsYOhi4JAJfiPHT2Dvoa/MwTJ2rFgkfflxwEwRXFFivhHRg82PyDp2hAimyAhZ3pTYMIkTUt5YjVi8/03AjWYaAlF4dbtrvF0SezJo6QTADTWCOuBuObFaJa19TAJ
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:11.8995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec4ddb7-dd66-4878-c2b7-08de9f246c93
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR08MB8541
X-purgate-ID: tlsNG-c1860d/1776720803-38567DB1-9DEF0F34/0/0
X-purgate-type: clean
X-purgate-size: 7788
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:proskurin@sec.in.tum.de,m:Aqib.Javaid@elektrobit.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.263];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tum.de:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: DD5414344FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The p2m initialization now invokes initialization routines responsible for
the allocation and initialization of altp2m structures. The same applies to
teardown routines.

This commit adds the prerequisites for the common altp2m_init and
altp2m_teardown functions to work on ARM; No further changes were necessary
other than removing the CONFIG_X86 gating.

This is commit 12/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
Signed-off-by: Aqib Javaid <Aqib.Javaid@elektrobit.com>
---
v2: Shared code between host/altp2m init/teardown functions.
    Added conditional init/teardown of altp2m.
    Altp2m related functions are moved to altp2m.c

v3: Removed locking the altp2m_lock in altp2m_teardown. Locking this
    lock at this point is unnecessary.

    Removed re-setting altp2m_vttbr, altp2m_p2m, and altp2m_active
    values in the function "altp2m_teardown". Re-setting these values is
    unnecessary as the entire domain will be destroyed right afterwards.

    Removed check for "altp2m_enabled" in "p2m_init" as altp2m has not yet
    been enabled by libxl at this point.

    Removed check for "altp2m_enabled" before tearing down altp2m within
    the function "p2m_teardown" so that altp2m gets destroyed even if
    the HVM_PARAM_ALTP2M gets reset before "p2m_teardown" is called.

    Added initialization of the field d->arch.altp2m_active in
    "altp2m_init".

    Removed check for already initialized vmid's in "altp2m_init_one",
    as "altp2m_init_one" is now called always with an uninitialized p2m.

    Removed the array altp2m_vttbr[] in struct arch_domain.

v4: Removed initialization of altp2m_p2m[] to NULL in altp2m_init, as
    the "struct arch_domain" is already initialized to zero.

    We moved the definition of the macro MAX_ALTP2M to a common place in
    a separate commit.

v6: Reworked to use common altp2m init and teardown routines.

    Added altp2m_lock_init macro for use in altp2m_init.

    Split altp2m initialization in p2m_init into a separate function,
    p2m_init_altp2m, to more easily gate code behind CONFIG_ALTP2M.

    Pulled in addition of active_vcpus from a later patch in the patch
    series.

    Split teardown and free of altp2m views into p2m_teardown and
    p2m_teardown_final (part of altp2m_teardown), respectively.
---
 xen/arch/arm/include/asm/altp2m.h |  4 +++
 xen/arch/arm/include/asm/domain.h |  8 ++++++
 xen/arch/arm/include/asm/p2m.h    |  5 ++++
 xen/arch/arm/mmu/p2m.c            | 44 ++++++++++++++++++++++++++++++-
 xen/common/altp2m.c               |  2 --
 xen/include/xen/altp2m.h          |  2 --
 6 files changed, 60 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/altp2m.h
index 698c35427e75..5a217f48b103 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -19,6 +19,10 @@ static inline bool altp2m_supported(void)
     return true;
 }
 
+#define altp2m_lock_init(d) spin_lock_init(&(d)->arch.altp2m_lock)
+#define altp2m_lock(d)      spin_lock(&(d)->arch.altp2m_lock)
+#define altp2m_unlock(d)    spin_unlock(&(d)->arch.altp2m_lock)
+
 /* Alternate p2m VCPU */
 static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
 {
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 576dbdec20af..9e69d62086cd 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -128,6 +128,14 @@ struct arch_domain
 #endif
 
     struct resume_info resume_ctx;
+
+#ifdef CONFIG_ALTP2M
+    /*
+     * Lock that protects critical altp2m operations that must not be performed
+     * concurrently.
+     */
+    spinlock_t altp2m_lock;
+#endif
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 8ae0cd7ff589..db715c4f8bfc 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -9,6 +9,8 @@
 #include <asm/current.h>
 #include <asm/hsr.h>
 
+#include <asm/atomic.h>
+
 #define paddr_bits PADDR_BITS
 
 /* Holds the bit size of IPAs in p2m tables.  */
@@ -117,6 +119,9 @@ struct p2m_domain {
     /* Keeping track on which CPU this p2m was used and for which vCPU */
     uint8_t last_vcpu_ran[NR_CPUS];
 
+    /* Alternate p2m: count of vcpu's currently using this p2m. */
+    atomic_t active_vcpus;
+
     /* Choose between: host/alternate. */
     p2m_class_t p2m_class;
 };
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 0d37760ef5d5..04d17e787259 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1,4 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/altp2m.h>
 #include <xen/cpu.h>
 #include <xen/domain_page.h>
 #include <xen/ioreq.h>
@@ -7,6 +8,7 @@
 #include <xen/softirq.h>
 #include <xen/xmalloc.h>
 
+#include <asm/altp2m.h>
 #include <asm/alternative.h>
 #include <asm/event.h>
 #include <asm/flushtlb.h>
@@ -1486,6 +1488,20 @@ int p2m_teardown(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
+#ifdef CONFIG_ALTP2M
+    unsigned int i;
+    int rc;
+
+    d->altp2m_active = false;
+
+    for ( i = 0; i < d->nr_altp2m; i++ )
+    {
+        rc = p2m_teardown_one(d->altp2m_p2m[i]);
+        if ( rc )
+            return rc;
+    }
+#endif
+
     return p2m_teardown_one(p2m);
 }
 
@@ -1499,6 +1515,9 @@ void p2m_final_teardown(struct domain *d)
      * where relinquish_p2m_mapping() has been called.
      */
 
+    if ( altp2m_supported() )
+        altp2m_teardown(d);
+
     while ( p2m_teardown_allocation(d) == -ERESTART )
         continue; /* No preemption support here */
     ASSERT(page_list_empty(&d->arch.paging.p2m_freelist));
@@ -1595,6 +1614,24 @@ struct p2m_domain *p2m_init_one(struct domain *d)
     return NULL;
 }
 
+static int p2m_init_altp2m(struct domain *d)
+{
+#ifdef CONFIG_ALTP2M
+    int rc;
+
+    rc = altp2m_init(d);
+    if ( rc )
+    {
+        p2m_free_one(p2m_get_hostp2m(d));
+        return rc;
+    }
+
+    d->altp2m_active = false;
+#endif
+
+    return 0;
+}
+
 static int p2m_init_hostp2m(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_init_one(d);
@@ -1608,10 +1645,15 @@ static int p2m_init_hostp2m(struct domain *d)
 
 int p2m_init(struct domain *d)
 {
+    int rc;
     spin_lock_init(&d->arch.paging.lock);
     INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
 
-    return p2m_init_hostp2m(d);
+    rc = p2m_init_hostp2m(d);
+    if ( rc )
+        return rc;
+
+    return p2m_init_altp2m(d);
 }
 
 /*
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index cda653b713f0..989d8bdcb923 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -15,7 +15,6 @@
 #include <asm/hvm/nestedhvm.h>
 #endif
 
-#if CONFIG_X86
 int altp2m_init(struct domain *d)
 {
     unsigned int i;
@@ -60,7 +59,6 @@ void altp2m_teardown(struct domain *d)
 
     XVFREE(d->altp2m_p2m);
 }
-#endif /* CONFIG_X86 */
 
 /*
  * altp2m operations are envisioned as being used in several different
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index 85ef22c2b29e..238c7a935586 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -13,13 +13,11 @@
  * regardless of CONFIG_ALTP2M
  */
 
-#ifdef CONFIG_X86
 /* Initialize altp2m views */
 int altp2m_init(struct domain *d);
 
 /* Free altp2m views */
 void altp2m_teardown(struct domain *d);
-#endif
 
 #ifdef CONFIG_ALTP2M
 
-- 
2.34.1


