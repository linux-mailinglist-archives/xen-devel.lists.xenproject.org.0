Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDvMB9ab5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:34:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB51C434302
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:34:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287931.1568399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFo-0003F2-Fb; Mon, 20 Apr 2026 21:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287931.1568399; Mon, 20 Apr 2026 21:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFm-0002y9-Uv; Mon, 20 Apr 2026 21:34:03 +0000
Received: by outflank-mailman (input) for mailman id 1287931;
 Mon, 20 Apr 2026 21:33:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwFY-0000IB-7v
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwFX-001NnB-Iz
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:47 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b93-5cb7-0a2a0a5109dd-0a2a4504dc78-48
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:47 +0200
Received: from [52.101.56.72]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69bba-1dec-0a2a45040019-34653848551b-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:47 +0200
Received: from BYAPR07CA0064.namprd07.prod.outlook.com (2603:10b6:a03:60::41)
 by LV3PR08MB9642.namprd08.prod.outlook.com (2603:10b6:408:210::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:41 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:60:cafe::21) by BYAPR07CA0064.outlook.office365.com
 (2603:10b6:a03:60::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:41 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:40 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzJ4185Vz1wdY; 
 Mon, 20 Apr 2026 14:33:40 -0700 (PDT)
Received: from BL0PR07CU001.outbound.protection.outlook.com
 (mail-bl0pr07cu00104.outbound.protection.outlook.com [40.93.4.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:39 -0700 (PDT)
Received: from BY1P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::15)
 by SA6PR08MB9893.namprd08.prod.outlook.com (2603:10b6:806:422::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:34 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::ad) by BY1P220CA0019.outlook.office365.com
 (2603:10b6:a03:5c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:34 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:33 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:30 +0200
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
 b=aGA81ZM5jZpEAtKeiiJKpcD0wQSrPx1rZ3a5gI9hqA30PGO+3UqvUe9PyTyBYQKrXFJVVsq/86lKghLfPiPbRaPYgLtbihCvE+LcPUex7QI5wDQ0/Tpk633OEWuhucDFZgVMkPz6udlUL55E7qO546q0Wg6x1j6KurXqhF7XlvJORQOTPypgx1ehTSRQtv1vSthlRydpu6QmKtq8LZG9lr6EebsrIpXsIgXl6G7w4+gj8j4MuwxbdYsZ3fCkwtgNZ4MGOYDzSsdG8Ly7i/D6tA2Wui4VfVxfBnDRFpIqEEmQ1bvQylERpHEAS8oap3MXnwQtC3/naY3vLP5EQnu3NA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5iBIWyVgGmcouUlKkYdR5ODo5vGhPP2Z4ch8z9yjL8=;
 b=CRC4Ke7WwldP8SrDJndTQiLvs4Rsh+ie7rIrkAg4HhKvzaHhAoaH2L5METN7dyVI2Mvcdgb024CI+K4LXk6Oh9DQmBjspjv8OY92dxBw530jr0DJHhnJCuAG+hsUaFgECWQzlbeBqdoQpuzZFCtwdUXBWZXIo6Sh8cuYBCuVEIBA1FAKkvjwivo2hMmxw3gk3/aw718LK+FPGce8soQqt5rET96s0/HLUdWi7jVP684YmhmGhzP0NIW1OgrgNeKiymzjLNypzXujA0cbNsWnC7iIVaaaihzCWordnR9JxYyLraScOGhswqP8MtcXRA5LkyV4EWi4uf28DWLV86a6ug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.4.4) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=elektrobit.com;
 dkim=pass (signature was verified) header.d=elektrobit.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5iBIWyVgGmcouUlKkYdR5ODo5vGhPP2Z4ch8z9yjL8=;
 b=TdQ5DuCT9XJan8tgPvjbA5zlhQgyrIcHjM1PqgcsiMhUBnoSl3mqld+EWUd+wDrOEXdBeqF40F7hjnHRmwGP5IOHVWA1CwcxUx4xUTF+6qp0RTauw4/QL1HgnEddbdTUKFfpoNRcukBuPf4P8CSqvQl8TwfjbxEoudyhu2XLxF8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.4.4)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.4.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.4.4; helo=BL0PR07CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2ooh8zc6xOiI/OPfEqqNSvE8jQJm31OJVCdVS1Vbx7Ek6cKs1lu4ok8N9nWWp4op2ghtb8OKvDvHHHfBZ/pVGxyqqNbYjYh9/YBlgZtzvXOPVoIfxhE1Vo95/DVbdyu6ihyeBzLTVhOnYLXTt6paJAP2ZAMCa5mKTWOW9EDZhX99qt6N+phcBTSTd9Tqd/nT8CO8BGjVGqswczOC8eI0VkkFSekaBSvN2gFtmphsCsKlPMNBBSY8i057kDo/QWtrdLyj57M7V8YnYh9rHotU8XOkM7fW01I2yUYF+dLW9fROxYHJaXcdHcF00iJFcBrvWMQuhyIzD4yWYrzs827eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5iBIWyVgGmcouUlKkYdR5ODo5vGhPP2Z4ch8z9yjL8=;
 b=xCdEeAWMjqr9rSRO0U285nwG4100hDKe2LZE3G1Wp90klxs8xiRxjJ89ddqyd5MLqr8FoC7RBrZvuKoss9H79MxiRu2MQX7InsctihJNSDNm33PR23DjECIT9VRlzqHInlk9zAMPUBktjuz1ko5Sql2zGfeX/m+lzaMjIKY+77zdiH+sW+D5odtiLD67m1fWeI0IdXwecObL70X/u+L6UddVtVcBCmLp9hmZhUG6Oh9ANNPSuJx3+wO5eyI5uFLJEG6HhKWhj924pmrdm2LjbkVki2lg3wNolJrCIo9fMc6D0jgLXR/6nsLUSmyQrBm3rHQ6lXvfpF3vrl2/ifUWnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5iBIWyVgGmcouUlKkYdR5ODo5vGhPP2Z4ch8z9yjL8=;
 b=TdQ5DuCT9XJan8tgPvjbA5zlhQgyrIcHjM1PqgcsiMhUBnoSl3mqld+EWUd+wDrOEXdBeqF40F7hjnHRmwGP5IOHVWA1CwcxUx4xUTF+6qp0RTauw4/QL1HgnEddbdTUKFfpoNRcukBuPf4P8CSqvQl8TwfjbxEoudyhu2XLxF8=
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
Subject: [RFC PATCH v6 41/43] altp2m: Move altp2m_flush to common code
Date: Mon, 20 Apr 2026 17:32:04 -0400
Message-ID: <20260420213206.208750-42-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C9:EE_|SA6PR08MB9893:EE_|SJ1PEPF000023CB:EE_|LV3PR08MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: 696c9fe1-ec7e-47f8-8082-08de9f247da6
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704160111799003|36860700016|1800799024|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?5VKCAxS7yB7pui9qV4QsfElVzYTZyZYJNlNksX0OkUvzl8RO+tQOag3ZjqUk?=
 =?us-ascii?Q?Q9T1jdlBqHvsVaPRVR5ucLrTBCdlcp7cCpbWoA5VQe7kicN5x7GY9pc5LYyj?=
 =?us-ascii?Q?hsm0CAYWTAOmZdNqABD+Uq3Py1aLyMqJFrjmkIm02ag/Ss6yMKld4PHjmIGI?=
 =?us-ascii?Q?m209KaLgiY1BMSc2xMr5AtfFHoo107BsXfkSYCPdpw4rUSPbbsiK1ecuQUuS?=
 =?us-ascii?Q?DL6F62FF58Z1CMrRUQF4RrXHs2dJCKOtZ487DGubFlaR4viFajNPdRGrqrbH?=
 =?us-ascii?Q?dGSGv058kb2mJ6RpTQzWBVCYVmi2P+Bd1j/qEJlkykKPO9n/0PN3R0IBamVf?=
 =?us-ascii?Q?qrPsJRac9mIod1ys2r8qKse4eOhZHSDArm7jTzNa5kOXnHx/ryfEvuX619td?=
 =?us-ascii?Q?rqm9LsRW5MyhuI9gIHv3dinCLTu9KhY7UIuCRH8+6R4x6B5GWBpsnk7F9lf8?=
 =?us-ascii?Q?WsvPSzyzSnIim9wkFzu9UgIrba4FQWuhQVtCSoBtyAHAYErec9xPrkz66FwV?=
 =?us-ascii?Q?T0fYl+HjL83GRvbMoVcKVSjnKWhI7SUDbn2nTtyKbIo1aw8EreAPmXknmMQE?=
 =?us-ascii?Q?wa8O8i2IxSiLx1yS3RxaSKQr7S+crML5eilBtZbJTYgvceHxyTp62X5aeBY7?=
 =?us-ascii?Q?kSrv21+5cv5RCbtkKiRff2vw3XKWGxKwmJSwYHEoD52efnDJXLDaTWalXxWX?=
 =?us-ascii?Q?sQnRTOx/DpACyyWhpmWTlqGraBelRDQFw+8hjFP28j8jxlopcerr3B7NZxz0?=
 =?us-ascii?Q?Lgo/IoZthrOqaKUmCZoDP9mgZjh2Jh4grrUUdC/sobSTmaw375I6dWJORzhL?=
 =?us-ascii?Q?xXlroUDW9O7QPAl90NW3N/7jcJYV6CW8rEkpxcrwEOyp1X3F7NRVpVhbUCiw?=
 =?us-ascii?Q?UTkTiYROVCo06gsUw7lDMumt6dUtSRVM9ZzhbyrwJj5BOagX476flBasXbvw?=
 =?us-ascii?Q?sJq1JwN+v5c2ImFuZxm73wmU1EJaLoZLp+Hb+yNmGqGgOpx2z45iwzv9oX7E?=
 =?us-ascii?Q?iy6uEvRmhF9v8djqvlUGoVmjRyOaXD2EcmPMFDjPPEtAFOmzecrl9XkqCCyG?=
 =?us-ascii?Q?g2arcpX9dIjJpkJZ7GORIG+Lqan34pLMCLBIyZr+NCzSlj3zMp+ez4CBI5oV?=
 =?us-ascii?Q?TljthU0gMgHgXNw6vos4QSelFenJfbnfTKxedIbrtRFSE8p64owhDOtp1jb/?=
 =?us-ascii?Q?G8ZMT/4IKiJYP+/Q?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704160111799003)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 OzXw9y9zYJt0BF9Wte8aNPLKGxMClHZ99RbWkdkFyvFLVfA01gINsOeR0rHRZWvPm8fLoF6wAiZCWLIAs3wKrzmUDv2qkVjRarlkzPWwG9RgoZuQxLn92Iyyn91TbnWopdHKWD+s1pH4jy0v7ePU0hrJI4N2MQfN6MonV5JCQ5xzihEsFqc72vFyiW0qBP97atjCoKbSfzLh7xx0Bk8R8yiEX41T7TL2DnO0jtEoNXhhUeNwajhCh5wIEVoSN7JMlMiN/rIjYfZV3wRASY5APOHVpTI3wukGZ8dNuW9/Hdw/ghu8iE//cgc6MXe9ka6mzW8PJNmCTOgsQvE87III5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR08MB9893
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.4.4];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.4.4];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f3f46968-f9d9-4744-07a6-08de9f247998
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704160111799003|82310400026|14060799003|35042699022|156008|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I1nVlwQjpAM0RHXl1TCGVqGGSA8afTd8SQMHq72EyYO6M+ZA/BrkvFHr/spG?=
 =?us-ascii?Q?3UMlmpvGupOypHnVaj1eyH8WE73LrzdSbPpoSerNm/4kKQZslDOx5r6/G6sY?=
 =?us-ascii?Q?CW5rkY8zr/0u+qe6nqeN/cr7lKDWqpNVweyQ4bjq2MTOCp8p0uNLUbc1nW+M?=
 =?us-ascii?Q?WKVuyNiRTvsTcgo6RgwFs2VxAbRNaK2uWXAMhUM2sNie/NiI0KSN4yLU+p7u?=
 =?us-ascii?Q?hgezl7TLCLHDfSgzDRIFeVEtnyUWAH765FTm859gk3KpCcAt5+jL477PQLBn?=
 =?us-ascii?Q?bm/SN38i5q/UqBFp+dXnfheTyEW0CH3jwW36vNsT9kQczpBg4KEnL+D0Gnx9?=
 =?us-ascii?Q?2MsvUXsLgzpJWip8wjN+v85u5+DJONP/XSHG2Z68e+w2Ei38PrrxGIu4C4k5?=
 =?us-ascii?Q?8gAnudYZwgNrkQUu+gfsTYg4Ze6P8mmY0ANZ/LnwhVsBMZA+ro1JPF57uR/s?=
 =?us-ascii?Q?82Km+lSejn20cv7seMvXdRtj1HLYS9C08/V9FBm/k2dEHxWSE1lakrAQMF0/?=
 =?us-ascii?Q?MOhO0FLr3KRF853zFHgoT6EokPWAQ+fv0SUZeznrn2ozu9OOQKOeHcQ5cU1g?=
 =?us-ascii?Q?u+wWqmg1DN3GgJ1ujJbax9MvhdGMZ6ZQ4T92374txfEHXwhGc3vWMA5NJIUY?=
 =?us-ascii?Q?Lcv+BN8kLfamfzKjySyLn0Hn0K1R5qwRlKJ1GGmPXpnbpAujppD6muL81x72?=
 =?us-ascii?Q?CxZ5ooErIcleDSfAjs+nfZKfhKcvIQhCSRJ11eAmLWDlYjpfAaZSUepmJ/7d?=
 =?us-ascii?Q?f/CiK/7DB57kLavT3wDjrRgxzzXg56e46AOYn9/CYUb3+bH1UEdtrOX/VBSS?=
 =?us-ascii?Q?uEPlv/aTlQ0vXel/sPRhDd/NtBGMqL5Xwd4JnD6MO0ObA9tQK4I0uhP7iN8H?=
 =?us-ascii?Q?nurr2YpS2wGmYC3F1PvpytsUJ89bQ0Jc+7PQVTzgcdXSiIUUmxsWDujQ5Vy0?=
 =?us-ascii?Q?W8q3DtYBsWcSIWU6GoGmTZZ7ALV/F3iuw+g59Mr69VGg/V+tjBQZfWoNfU7Y?=
 =?us-ascii?Q?Zv4vkUJehFZpRb7KzO4jH8adwBH7NcYxTpkFlfkbEcWd9O8CGHOvcvtJl/oC?=
 =?us-ascii?Q?jlpupIvQyZ5nI8poKAND70AEN4LMAOCMupERmsclJG54N3h0rWPl0vJQdjzw?=
 =?us-ascii?Q?X7IrKeybayuHsRxRb2Mk+VL/QF44aSizedDXePT6F/NN27xDPeOUiEl63wkz?=
 =?us-ascii?Q?7soIEOaL/jzuTeYf?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR07CU001.outbound.protection.outlook.com;PTR:mail-bl0pr07cu00104.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704160111799003)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r90BpymZfY4KxP4VqWirW8NzUJQNL2BmkzWIAJLkoG6hmvUCa3e53qTuzUu8rbAi22FfYBo9uz6n65G72R1vEnG31ZsbBUcjC1nnxQdi0UAoVboCicBYLxbtFuvBqwEWyQUwnbxeyCiWnWK+qyOaPqA+iMB40zTDkjXSLpJiqe7LvKZ9EyI0Au4m9w/71R4Nqe/8KuICHdwj1Rokb6st78up6ky5yNp2i0RZ3X3sK7gLXbwcEIquQYKzwSBnYsTxp65ioSI3g2NDTQMUtZTteEZLkMp9QUu4i6AiUsJa2PJotcwXC3t/K/XbCreiUO4kighhaKfL7+EMMe5HeaDO1kDYYpLF1Sc0A9SluQ1t4a/oHYrDzvEuhl0LxEkmnre491b6rKtZPELl5TcYPfAAXAUq6a3FFGzrmTdlknxSO8A29BF0qRxmbesNm6PuAhcS
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:40.5888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 696c9fe1-ec7e-47f8-8082-08de9f247da6
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR08MB9642
X-purgate-ID: tlsNG-ebf023/1776720827-2997A3FF-29B9BF9D/0/0
X-purgate-type: clean
X-purgate-size: 3378
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
	NEURAL_HAM(-0.00)[-0.280];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: AB51C434302
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit moves the altp2m_flush function to common code. This makes it
possible to call in the common implementation of HVMOP_set_domain_state.

This commit contains only code movement, and no change in functionality is
intended.

This is commit 1/2 of the altp2m_flush phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/include/asm/altp2m.h |  2 --
 xen/arch/x86/mm/altp2m.c          | 16 ----------------
 xen/common/altp2m.c               | 18 ++++++++++++++++++
 xen/include/xen/altp2m.h          |  5 +++++
 4 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index 02b5e1a11220..d11f20f1e790 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -82,8 +82,6 @@ static inline bool altp2m_view_is_visible(struct domain *d, unsigned int idx)
 /* Switch alternate p2m for a single vcpu */
 bool altp2m_switch_vcpu_by_id(struct vcpu *v, unsigned int idx);
 
-/* Flush all the alternate p2m's for a domain */
-void altp2m_flush(struct domain *d);
 
 /* Find an available alternate p2m and make it valid */
 int altp2m_init_next_available(struct domain *d, uint16_t *idx,
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 18f8a71f1682..de91d1e67709 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -253,22 +253,6 @@ void altp2m_reset_altp2m(struct domain *d, unsigned int idx,
     p2m_unlock(p2m);
 }
 
-void altp2m_flush(struct domain *d)
-{
-    unsigned int i;
-
-    altp2m_lock(d);
-
-    for ( i = 0; i < d->nr_altp2m; i++ )
-    {
-        altp2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
-        d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
-        d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
-    }
-
-    altp2m_unlock(d);
-}
-
 int altp2m_activate_altp2m(struct domain *d, unsigned int idx,
                            p2m_access_t hvmmem_default_access)
 {
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index 929449b1b03c..0dd3ecf226fd 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -123,6 +123,24 @@ int altp2m_init_by_id(struct domain *d, unsigned int idx)
     return rc;
 }
 
+#ifdef CONFIG_X86
+void altp2m_flush(struct domain *d)
+{
+    unsigned int i;
+
+    altp2m_lock(d);
+
+    for ( i = 0; i < d->nr_altp2m; i++ )
+    {
+        altp2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
+        d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
+        d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
+    }
+
+    altp2m_unlock(d);
+}
+#endif
+
 /*
  * altp2m operations are envisioned as being used in several different
  * modes:
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index 8fc16346d95b..fa2c11f5432e 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -74,6 +74,11 @@ int do_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg);
 /* Make a specific alternate p2m valid */
 int altp2m_init_by_id(struct domain *d, unsigned int idx);
 
+#ifdef CONFIG_X86
+/* Flush all the alternate p2m's for a domain */
+void altp2m_flush(struct domain *d);
+#endif
+
 #else /* CONFIG_ALTP2M */
 
 static inline bool altp2m_active(const struct domain *d)
-- 
2.34.1


