Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJYIOW+a5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 529A44340BC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287554.1568036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwA0-0006Q3-2i; Mon, 20 Apr 2026 21:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287554.1568036; Mon, 20 Apr 2026 21:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9y-00069U-OZ; Mon, 20 Apr 2026 21:28:02 +0000
Received: by outflank-mailman (input) for mailman id 1287554;
 Mon, 20 Apr 2026 21:27:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9s-0005ES-Ng
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9s-001N4o-3G
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:56 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a45-2eae-0a2a0a5409dd-0a2a450beb80-24
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:56 +0200
Received: from [40.93.198.90]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a5a-212f-0a2a450b0019-285dc65a68d2-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:55 +0200
Received: from BN0PR04CA0064.namprd04.prod.outlook.com (2603:10b6:408:ea::9)
 by BN0PR08MB7279.namprd08.prod.outlook.com (2603:10b6:408:14a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:27:50 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:408:ea:cafe::d8) by BN0PR04CA0064.outlook.office365.com
 (2603:10b6:408:ea::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:50 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:49 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz9J5Dgjz1wdV; 
 Mon, 20 Apr 2026 14:27:48 -0700 (PDT)
Received: from CH4PR07CU001.outbound.protection.outlook.com
 (mail-ch4pr07cu00101.outbound.protection.outlook.com [40.93.20.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:48 -0700 (PDT)
Received: from CH0PR04CA0018.namprd04.prod.outlook.com (2603:10b6:610:76::23)
 by CH0PR08MB8613.namprd08.prod.outlook.com (2603:10b6:610:183::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:44 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::f6) by CH0PR04CA0018.outlook.office365.com
 (2603:10b6:610:76::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:44 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:44 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:41 +0200
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
 b=rhUuKMqadSoC/m/FDl/vnkeqMM37pzUvjs4KajgHH4cK35h4VSA1zPZFrfu6Q9WXiSeSa0yFyxQ9GRlhh0vNZXG+HiPd2EkiuBCmK/GkVyZDVrJMCGrS17zBoud+KywkHXQJDsT+LD5ngTu7XwIMqRDNeReCAMlE8dZWiV+nre5u4GOmOj1TEebKBx7hyzhPXoQtLt6PIwdGWB71Eh36mxYAeEq3+D411zt9gqeC/4WEJmRCvGAILe+dnBH4sPsutRx8KXZ6GyHKC/XeBDYb4UQZMglhlV5yVN0TkNdXQvS2oQ3kWU443XXbFJ0AmsD3IIDlqhmuZ1cVC+C18VkgcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlgX5a6AGvq5jH49n4U+x4WcIr+mTwnUzMyljWt2R54=;
 b=vgeV2FN5iGinNtMhFvvsJRyI3O8sqt1DrN61s2S2lEqPvahh0nvLJYTY9nIpUK4cvFV7J2BSl+Ahqj5zMygMH0UNnVk32H+JMZPTu+pf0A6spyK3AV53UBR+JITn2eocfcIDkQAs2erLmLZNry7kLdrgf5urziYrUKxsANX0WnQ0Jj50shIb4eMBX2mtqVyrs19L1vD7bb9s6ObLW2iKQ8p2osA+cwKET9NXLz1kQr9X1u8tCFzR0yFblEMbC9HFNmN2DQwPECvM4/2LlmBSz6a7tmkVD0AWEI82R7mK/Q+2Wn80no3nhjL06RH0F7MO4BKX6KTJCD66hOZeTgNDfg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.20.97) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlgX5a6AGvq5jH49n4U+x4WcIr+mTwnUzMyljWt2R54=;
 b=iGclUTifovD1ERJKiem8ScUiNh9r0OiqXEK1eGYbYywProyDFzO9VWU+goA9o4WBMfnwKy7OVBnd+ElNSeqFw6jQzYCURA3+kiwnltMxJbb/0GRxtoUrqf7tA38ZwFO5PSKIcwTT+K89uRyJQuVYwWn5MHwfBzP9GvxcyqBSRuc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.20.97)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.20.97 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.20.97; helo=CH4PR07CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiHyvJyPhUPpJW0xJFynuZcS0VdiVf+sfoz5XKQkrSlad/noyMFhOknVxF6lUT9kLzmlHUtIA1FDq4UGmYynAIbvoqTtLj1r56SWI0Km8GHHYBkaMcB6m9Y3oTNS9cba608lMnCsyScr4yVzcwMXmFNVAL2tz8+/jpFgbWZUBMVyymHBTpprglL35HkymSpw1Iw7Vc/N3u/llORMIIwnVIoPvfv/yzpTd7HhPFRz/MWJxqy/A5WxlCJz7NOOdDfM5/oUmj3PM++OW7aOeeAavAwa98FsanIKzEnMAlwNj4RUEOE+mrBYb+QrdNBnBS0LWH14YIUYFnYghvdKh/5XKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlgX5a6AGvq5jH49n4U+x4WcIr+mTwnUzMyljWt2R54=;
 b=qqi/7/bp+gdUjehPqCVIlzAL3CC61xNG6I+nCO5cSrjTYbwIL50nCdpSrR0MzniKpALEbIDKNsTzTNUKCrY96lOvqTgc/jnV7liZfpc91hz0XrSDC23I4FFrj+C+AFgN/DEZhDyv2XoWZkcUOY4oosu8jYjKOGHUdSNrG6HAONcp5Vxy1Q3DXdH4oaMc8fTF+PCIkI1chGRcdkHjo4IHZWHOxVxHEi6OfxDUwXdbsh4oxCVaJzRTADt0SW40UmrWT0FWhAtPKfCanERChSVRAfgwZE2sTctd62QgcBWQjEjwpmJURworqg1dBT2wVfiIkSMmx1rkh8BIJPhM5QceiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlgX5a6AGvq5jH49n4U+x4WcIr+mTwnUzMyljWt2R54=;
 b=iGclUTifovD1ERJKiem8ScUiNh9r0OiqXEK1eGYbYywProyDFzO9VWU+goA9o4WBMfnwKy7OVBnd+ElNSeqFw6jQzYCURA3+kiwnltMxJbb/0GRxtoUrqf7tA38ZwFO5PSKIcwTT+K89uRyJQuVYwWn5MHwfBzP9GvxcyqBSRuc=
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
Date: Mon, 20 Apr 2026 17:26:33 -0400
Message-ID: <20260420212648.208640-21-Rose.Spangler@elektrobit.com>
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
	CH2PEPF0000009A:EE_|CH0PR08MB8613:EE_|BN2PEPF000044A5:EE_|BN0PR08MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: f162b90d-7a6b-4d40-f418-08de9f23ac79
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?SoK9NUicUqlp61XjdM5C5uLZorZ+Q+qCXd/p070HpFcEE2q+pBM8G55c47Xh?=
 =?us-ascii?Q?rnCbfkntDrQAxjFJPfz1jjlBi8ikyqhpmYEdK9qPwbetqi04dSuEMnzx+t/G?=
 =?us-ascii?Q?XZhqNWA/yJNRSJ0aaqraLVsAPkWBC6dOL27l2Rlf/8WtUnnEtL7BYvI8KTAm?=
 =?us-ascii?Q?pB4XmYKZUGtfoJnCGd+rkSLK0ss1sARB1UOBlYoE9Wpzh86IsOSEbXtU6Cyp?=
 =?us-ascii?Q?L4GOymdKCEUd1mCO0d0N9AbibfsN+x/sKHr3GqqiLO62YB26MLpRk3hTnH5X?=
 =?us-ascii?Q?NxTriJDZs+TFPApgq5v/I/mVSnmYznyvb3ZZrUD/AgdWQQ8pYlLO54ATxpZQ?=
 =?us-ascii?Q?/nUsfvMZycRbauxW7X10bIgS/0h5h7bnRKqxjxgCE/UJwQWKAqJCHDFKk+Tx?=
 =?us-ascii?Q?Y6OVMQveg11T9NZIiYXih7+9a/ruEM0L0TDhUqqAqErC6F8aZmDUZOQT0guF?=
 =?us-ascii?Q?WJqauJFmh0wO+dCuuJ2OpJBXfoczLMo1SKyuYyjkMRrR1nctAOJvnXiICwBI?=
 =?us-ascii?Q?R6uoPjjGpMg4+sam95SaeNS6c1LSSC/ZIuHmqiOztfjZKK4nx4HOSL0FwQ6x?=
 =?us-ascii?Q?j9JHUjd5i3s9lugs2eMoZBX7j2lxSAjJxLhfBLX+tMIajdTz86Fp4wPBiNar?=
 =?us-ascii?Q?NObt8ixJN5xLO4e7nryIqcdZcpsZ3/eVAfdS4cOYFFqtmc4CwLS4uNo/gud6?=
 =?us-ascii?Q?8Sbt0A5thUX6bVgyNXC4QdrrHx32K0xxmpsKCKJ18ExGfcdwJQQl/PCpeYgW?=
 =?us-ascii?Q?l9AbWvGl9a9HkgKLrJ/2tGdYbw7flwxknmKJItZmzkMXX8e/j22SK4yvHw/s?=
 =?us-ascii?Q?OI0bWXAzdmZaGDsoHq3NP5uMkXA5w1B6V5bPdJEF1+Ssvn0+chSf1nTOTDZm?=
 =?us-ascii?Q?z5JHSIGr7tUvjIa/B8uLz6hfe4bYq1k3LtW3dbs95iN8QlMXo2OrkWHLp87/?=
 =?us-ascii?Q?ff1FNDx86hdsjnLCGPVCjVMXZ30+BnuVHkAVEcJkX8rVuRhpr8KswnaeEajd?=
 =?us-ascii?Q?nsrztKT8mUSM0TkzRp1GEWYKNA/JINjCZatXAjpOLN+UU/RHiVdMylR5O0VO?=
 =?us-ascii?Q?AFyOaCjSq/qFkreSQue28QhUvVPX30qHy47BIzBlkxBq6tfa5t/fmpKkmlbG?=
 =?us-ascii?Q?vjTseW0Ue9wTHxGQbfh+k4/CqfONT680CUBqV8sztGwQyw+shh7RNJlRrk0Y?=
 =?us-ascii?Q?DJnj4LLqJjvCPK0q?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 Tug6/TmI0O5BxySIrtAuXEd4sHAuayqfcf7cJ0f0u0Mvy4cAsuUdgmwTxkH1r8NwAAnOrzBHyLFGll0psmDaEnA8u3TCBRnBi/F3ikQ2fmgm+2DBbVcqKuizFOiB+cqfLp3e09PxdSKDqq4+EIUqrka+1qGWPKQR5CdB3ooMSZSXs9Sz3uVCx7CjROzDX025ThGMncLb2iZW93d13insocvi8yoYii/rIGCnHMYLJ3OtvvKNDyAx3CblUl45IfxOmaZwX1B0tQGD5f7uysbai1dlxIycahaiFsB9iEWPAUdroxeUoLHy48nbu6HYedStpI81kO7UjN1ODbjo/FnQlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR08MB8613
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.20.97];domain=CH4PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.20.97];domain=CH4PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	817d1564-55bd-46e1-e183-08de9f23a965
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|156008|35042699022|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oDYwVTTW+2yRf8d99qsRfVulY5NWCOmJgQb1GQLRQ08+j54vpou8pnnHdQQD?=
 =?us-ascii?Q?3JAY4EXvejHU665RVhxVujkJo8xfthbpQvuNcWUuOveKQ37sbuTbWB453VO2?=
 =?us-ascii?Q?Nd1Fl40Vtetds0gHiwCI5Q9m5+wTAvb3Tg92j4kDcSfdlhpsJ5fhcm7r984C?=
 =?us-ascii?Q?MPXBRD4/YKUDUqve05vlcY0C5HtHfcyuW1haH5UpKTcPhP5nUvI0Rt8dAVcO?=
 =?us-ascii?Q?2iL3XCKM450EoWzQdVvm2bjKYXSEc0WCYHdXLGagueGKRj+L0QwmX2idOzNp?=
 =?us-ascii?Q?EXs3GzWG1dJbMBXfdYihPm6Ehb6qy8GC1GXIm7VIHZcRByyj4xOsAYyKZ8Ur?=
 =?us-ascii?Q?S106Ng8vEwQ01WVruFfF7azW7TIxMHJ69Ima2Px1S1rIDkgxziI113BL93d8?=
 =?us-ascii?Q?06+z0ehZsPC8qsaeCxvlxDQ2TKklvO3Zl6TiC+xDv8Foiy2MwU8yhQlx0BDu?=
 =?us-ascii?Q?ZnA97YVY76vxIPPUKNK028CPHddBqtCoyzpV16gLvNHzE22I2Lg6qutzF6Y2?=
 =?us-ascii?Q?9OiM/jnC9LfcmMYqEueTZ+9DkzNDU2fCAVukWZIbqg2Wkzy/pJsCnwB2oohd?=
 =?us-ascii?Q?ESjhmSCTKTEcotolPGH7antlYM+vnJ+hvt4l9iFKvJncGaAZW9lffPrJntEd?=
 =?us-ascii?Q?6R2e/9S/pyzKYE0HRb0KTPHdm+i2QUt0qzE7ickHd3nU2Flf7rxuW7ELLzBw?=
 =?us-ascii?Q?rPn6OZj7HlxCt4xzGTsHuJ/4234ONfInLY0zcJdQNdO5IaepSSC2krjzisyA?=
 =?us-ascii?Q?jI4HSGtTb3UL+6N1pyPgnM9TuEzT3BoXEwneYM8yZgFcDKuzLaXpYBJ1e8JO?=
 =?us-ascii?Q?TK4Scbg08r+6kWFEl2elmS/yqitoIBT87vpYEd2dLeOW4wTuSEaQg16LVbHk?=
 =?us-ascii?Q?wKolUrSzqSxRhM1Saj22Ue4d7m+X8M5eD88f9Hx9euFRfacpZmJt55Bv4INU?=
 =?us-ascii?Q?r+ciu0EWiiGhT+6g0RREhVttoRjPa80QZ/sbNe8jhfpQMbPMcZIWz62L423e?=
 =?us-ascii?Q?n0y386cxcnOY+wGSeYJi8XsvPP3SXkApfLmonqKQy9DVLC7Wkk/0NH+L76XK?=
 =?us-ascii?Q?M+MTJF0slcFwOSJ3QetIffmSD5SdKPSIIy7spD9XjscI5UdZgdVSne7bkzEH?=
 =?us-ascii?Q?bdaBU/+rJQhAbfNOtCuLw1FHtqou74cXXZzReuSXCLJB1Hfr7yyg9H1N3ouo?=
 =?us-ascii?Q?EkkUwU8URmdq0eu1?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH4PR07CU001.outbound.protection.outlook.com;PTR:mail-ch4pr07cu00101.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(156008)(35042699022)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SY6qRok60owZzx8sLllrhyi+l8jGxvOvI0g9+KKkV9c9LlQLpS/sJMWp1MKdzRX8M+SmBHZd6fLUelaT005GzwHcIkK3ONkmbxsZ0PdNDGoodr6W7LgqJoe0lOXLPhgVMerea76HYTh1W2aDr4UgMD6iS/G7y65dsgtROMUa86y3iT1N8W2xvYy/wc1Xjht0vxYKwEoxQFaMlEOVfe9RVCwzkR1mIPLyj+qf+i3NYPJUoB3ovt3B1Jh2vcMMHwVBBz6VEi4FfUr+vlhZV7FbAITKtHq0m8p2S0GY5NcHsNtY8JfJYNLD4UK2IG18NzlN0ZO8sNvENq9cRMBFbJCuQ7DYLQ8I6G1ZBNf23zF1+rGMjDuiH9L8iNs3YIUzRANNVRg9dyhWjbcw4E7ayYCDq1H1VWUX+Vn4jt7zINP2DQ0DUXd3I90kw5OA9c3VqV2+
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:49.6147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f162b90d-7a6b-4d40-f418-08de9f23ac79
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR08MB7279
X-purgate-ID: tlsNG-42698a/1776720476-05165F3B-34053BB4/0/0
X-purgate-type: clean
X-purgate-size: 4659
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.243];
	TAGGED_RCPT(0.00)[xen-devel];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[elektrobit.com:email,elektrobit.com:dkim,elektrobit.com:mid]
X-Rspamd-Queue-Id: 529A44340BC
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


