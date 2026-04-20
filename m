Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPeyCmua5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9BA4340AC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287547.1568022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9v-0005ak-A3; Mon, 20 Apr 2026 21:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287547.1568022; Mon, 20 Apr 2026 21:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9u-0005Le-Np; Mon, 20 Apr 2026 21:27:58 +0000
Received: by outflank-mailman (input) for mailman id 1287547;
 Mon, 20 Apr 2026 21:27:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9r-00052T-Hz
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9q-009jup-UI
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:54 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a17-5cb7-0a2a0a5109dd-0a2a45068920-46
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:54 +0200
Received: from [40.93.196.130]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a55-7371-0a2a45060019-285dc482173d-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:51 +0200
Received: from MN0PR02CA0007.namprd02.prod.outlook.com (2603:10b6:208:530::15)
 by SJ0PR08MB6750.namprd08.prod.outlook.com (2603:10b6:a03:2d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Mon, 20 Apr
 2026 21:27:40 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::45) by MN0PR02CA0007.outlook.office365.com
 (2603:10b6:208:530::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:39 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:39 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz964cSXz1wdS; 
 Mon, 20 Apr 2026 14:27:38 -0700 (PDT)
Received: from SJ0PR08CU001.outbound.protection.outlook.com
 (mail-sj0pr08cu00104.outbound.protection.outlook.com [40.93.1.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:38 -0700 (PDT)
Received: from CH5PR05CA0010.namprd05.prod.outlook.com (2603:10b6:610:1f0::22)
 by DM3PR08MB9136.namprd08.prod.outlook.com (2603:10b6:0:14::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:26 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::54) by CH5PR05CA0010.outlook.office365.com
 (2603:10b6:610:1f0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:26 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:26 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:23 +0200
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
 b=ihOxs59k/Y81LOoyE9gQnw8x5u4PA+6c3uOL/qoPUk6jf/ZU83RPknS5TRcdzNYEbJuJ/ayQmgi63DnPXL4aDwBXUScjnH61Wn8doeyZXSNrzh8CeBZcrZ/BRdCALLYCfrBvUolV3pLqdsIrNQfR211ZcfT/3Q/xSZAAvL5dE8qC2x0iu8Wt35vCprQPKuq9IOza/47i1pEo9HUFEwoetocSEeJbkxQEiZVRMcLqdxHJ1GrhrRcWKQ5JNSY1g1qa0LUjZswazVQUQPKRKcQ8owGQGJJhKsHD8ugMQQu1z9u77l7X2bCMAq3VT5SPN+yD6voneyKvpxNDQop307NKww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAj59kWKN8biXOebnwdzq5ky5bvMG5PNKC5Jot+tZ8s=;
 b=TNvImQvR9whhxpEpg6mQwNpA5IBekbTjI44dT5tCmyt/Y+vg2QmUIDWVI8lJux8xK1OMgNo7on0B7w+5+gOkNGCDPbRrg3cDfKyhlHzpdglTvvycAV/5qTOD3Z7xa6AunIWIEAmyFQuHVGvYYuF0jfvmf6YVKq+rDB/S9RqQqOCdbiU63VP2/PiSvSMnDpVvAeE+MkMAj4R6LdCJXwY9/IG9EKGuIIxFD+gB4tQ+VeZtIqDhVxX+z14d2aQsR+NzCoIAyqiVd8TpMeKzK1IBl9AT+4Ua/ePVg4dJTAk/jWXcLA/2/L11ZY+qzkfhH53DGaTMJBczyeSiMeMAcN/MTw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.1.76) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAj59kWKN8biXOebnwdzq5ky5bvMG5PNKC5Jot+tZ8s=;
 b=Cnyc79bWCglclRLJqu4OuHaL2TtDQnEvAXy1UAJmGr26COabSNkg1lq57qYl7gdbwQXlmuCKZWZd0Aa1aLhL+/rochiA816xuWUZwXKVRJWSNJJsfdmJm9NSeRyQcGgVhgAulYCZaErPUxmQFYT+IrDEm5pDd0Vp9dlcBfZ0jCA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.1.76)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.1.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.1.76; helo=SJ0PR08CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBUykGz/nOSPO6xoDK0nq/cwgurczPVnQrHuXUM12uOavdNJU02fsLOuny0ECvQor1IRPkxdKRvtwMdseE0CjHf8ZpBq3LpdcTL4ubqKehQgsDyPRHOzegFvAFCTQRvnG5UNWkmUIoSeEwKV2qI5B4jymmpv3GPFhqiPlIqcseWlZsbv8NqnuLpoD92mAflXQ3U5KcQgVtJc6FzfStfyHhaCj+Jq0UcjG4WLPJjYfrSewp8CV4G+7CZ+tbIyib85wm8HiRCehSUAlrrPMG/RkDBYFgqTjFSs+CUksSJaJeyjKfO+taZRglzRK+f+N65HpVOhcpg2o1F5d4xQtd7B7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAj59kWKN8biXOebnwdzq5ky5bvMG5PNKC5Jot+tZ8s=;
 b=F6rOOSF4/z4NkgvHD1JKx8PCZEdce/yM6NfJ9hQlAKfBpBnGV8airHpJvJJ1CRfuUj48PFc/f140RZZP5oA1z/Yw3CIUulHfFv5pCsGyLuuyVnY9U5/RF13wGCNq6wJCbQj4RBz8cWela+NHZKc13lkNPY+YDnWE1PaMzGMmBBB5AgGthjZ4o9p9IVoBnQbqQexe3okZjINjqI/ujtHj0T1WYYaqk0M2gZamNWWPsxB0K2NI4W1fwyQrUzROfNc0RHyXFvDz/a8ztrBSjKiB3216isDbHEMlvzTZzDuH7Ci9TyTvbYf/oPAYj2REMr6j8d3/yBXVEGclPThqwNohjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAj59kWKN8biXOebnwdzq5ky5bvMG5PNKC5Jot+tZ8s=;
 b=Cnyc79bWCglclRLJqu4OuHaL2TtDQnEvAXy1UAJmGr26COabSNkg1lq57qYl7gdbwQXlmuCKZWZd0Aa1aLhL+/rochiA816xuWUZwXKVRJWSNJJsfdmJm9NSeRyQcGgVhgAulYCZaErPUxmQFYT+IrDEm5pDd0Vp9dlcBfZ0jCA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Rose Spangler <Rose.Spangler@elektrobit.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Sergej Proskurin <proskurin@sec.in.tum.de>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>
Subject: [RFC PATCH v6 17/43] arm/p2m: Move hostp2m init/teardown to individual functions
Date: Mon, 20 Apr 2026 17:26:22 -0400
Message-ID: <20260420212648.208640-10-Rose.Spangler@elektrobit.com>
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
	CH2PEPF00000099:EE_|DM3PR08MB9136:EE_|BL6PEPF0001AB72:EE_|SJ0PR08MB6750:EE_
X-MS-Office365-Filtering-Correlation-Id: f019f542-e825-4a2c-dc2b-08de9f23a677
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?hQ72XviHDyNLuRAuPLvm5zg4mpBArTiFtPQF0WwlJ3nx0LX25Kge2NIep3hY?=
 =?us-ascii?Q?Lj4tZMRJgG6//+WuTpdF1evqjRNjkPhbKWrlQeDFyihxa5O2gxAVqftxJgz9?=
 =?us-ascii?Q?6XPD5p16n5np5D56bm8EvuJdwi65deWFCzzpgdXnZdYbonNwITn7LkuA33uZ?=
 =?us-ascii?Q?awekqWAnwjTOTjo7bYdQwUilNwjJrMFawyUolWJl5yeLJdH7hJOzZI7S2xn7?=
 =?us-ascii?Q?KYfld3v1V2AliwyqVKwTYRUpju6+WvFu3WgytIsTlbeBuFOrkwR+Gf3sV+xP?=
 =?us-ascii?Q?BCMo4Qf1HYTcUNjwj73RH0LzeOa0NjFhTr1tdE85iYZGB3zpqFoY+1qcw20p?=
 =?us-ascii?Q?m6ycXfGRQfAm2sqmg3MQLaJ/CB1Tbqls3tqiJtj9h9xwr1wPzUZGW3rJLZuP?=
 =?us-ascii?Q?JtYAPN9Pt9cAryBGhMpIdIa4JdTTnB8GyFqiyL9BIrG+Ou9yNO/TwNRg5HtR?=
 =?us-ascii?Q?Nh5ZAEHqf8tDEgMJmu/XSi88D1PtOcaZKuRwac8YmAs6Uc6EiCvZdKS7ggFx?=
 =?us-ascii?Q?cC5AAMzxJph7a2ZdeJvjAw1TJfCtuUZygPnufiVF4AVBlMXvbHwSIsTe0P3W?=
 =?us-ascii?Q?l9VMRP4D6bNs2IG6UWRAdVsDRqVxVAFMiKZqoc3wkiCyyzt8vK7Ij8slYXYW?=
 =?us-ascii?Q?2KqwMBJSi4z4+zcmyOxcTJjuK+IEu6WWzjel2uvgDkrwEac7BjPY1WV/Q17k?=
 =?us-ascii?Q?hDFsletdogjshY8kob3DlQRc9K17WdVDSFZYjXVodv2Bh1ue7GmE6J3OqGp5?=
 =?us-ascii?Q?1C/Mzwb4+g5wgCvTFITUQdgN1yHpgHZ1tKyMO+U9FJVY55PaGUVMy+oXWyu2?=
 =?us-ascii?Q?Q5kk9X+EkZ2MOrCg7VcB6V/FRXjFB280RhQS/oKNTtFGzdGz1P2a/YMx+sSS?=
 =?us-ascii?Q?ler7sWPH470iowZalxzIYgVYEip42zBXDBFqx9PrntvtetbyFXQIQG/GKfAH?=
 =?us-ascii?Q?P358quTGzl7dnIjL9zg7R/uqTewL408/cVaLkVX0ClNC4bheYUN+/P9nC8o7?=
 =?us-ascii?Q?8Of9qADmncQVRppylnpgV2YsNyeAY+GilokiZey8J9FA3wLm5xh2z4OpPrIF?=
 =?us-ascii?Q?IgY+vSNdmp/G80FRtJEHjJEol1zhgjmohsxx8dvY154mSBjJQb9veFDdEBfi?=
 =?us-ascii?Q?2XuZ4W6nQDo+GbuSAcumODRTVmsH6IUwP+DzN5Bd5SbMQaHzjVS8FB1Hi40W?=
 =?us-ascii?Q?PQmXa+pClKwo17kOG9dQbjS7URxjtTp6mZyF4g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 Mg8uG0Er2mVrQ5U5JJlDOHx9HzrX0RrB6izIDtZau4FeWE1+rNe8bUCQ0VqQjxUvEq6DS+Sp9loQO/NRZbpAjokh9hn48h9M7mtjp5Tne6zTCONuKGrAGEFd0FLoxEuVtuBmsokQOmmBBYUdhesncjHMjDXVomZGBqJYivM92Myz6ysawIdCfLoBdZLV4PGHfR8OCvQDb06nSohsymRwYm1WLMjOASAI1TriDQ6s5hClkuokShrcWsGOlS1Z9CDEBWb4O97XiUq+uufU3NlO7JvyN47T7nih1XIXNrTUXjdcPCht6NVGBTimP7ppROwaQtvV6KblT4R8BC1BHmxybw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR08MB9136
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.1.76];domain=SJ0PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.1.76];domain=SJ0PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	88a44def-d595-48d0-a20a-08de9f239ea8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|14060799003|35042699022|82310400026|156008|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?77kp6bKmuXKRoQmcTex64ndMlr3Hh6bOB1xhG1km09D704DeIXrW5/nY/kAs?=
 =?us-ascii?Q?6Yz/QDtAh5W7qn1PtdV+PrUXQ6oZ8aCKhG+Qiw6lTOEJHeErIcb4PKK+3kjp?=
 =?us-ascii?Q?Gm1c0MgVkHuoMh4wL5pkQfrBbotgNZFcFqBrVYZ5lUCv5XGMQziginNPt9fz?=
 =?us-ascii?Q?TwG+M1eljfMa42z+CzeRMXDEHqEg2S3HjKTL/O554eXYSMKXe69bShspLzy7?=
 =?us-ascii?Q?JGWWECzc9QnVYP5cfNjbbpNRNtiQettK0aO/LW0PXU/1jsB420jwk+u0DWiO?=
 =?us-ascii?Q?fYP9UunYUZWcYqNj64XqC0dVZw8QfXwKhMqZeyOdxw1BeMo0aad5ZOYyYYEZ?=
 =?us-ascii?Q?Zp3GBuPrAqXulXtugeRWrHZEZvRIA5rHjCTmsBvQ+XIDDD4dltG+kSb6Fq1s?=
 =?us-ascii?Q?seEOzh6hPnRkf1R6VSLu2zYf4lnWP0rKd4wAd3guBv6ND8Ry83Ynm+xjrFZc?=
 =?us-ascii?Q?gISzb33I9sh6bgFulVimQ4huTf/g+Ex9oB5/MG3m+iy4/jbQ/K3wM4sKAwnB?=
 =?us-ascii?Q?Oc1RH9DqoSI2kFTvTNM2E7Oqcyjbg1RHSeZSstJiezxSD0h9ZNdbkOGc5ssk?=
 =?us-ascii?Q?SAGRCUJM1MPAO5D7P4cDUnmR4H6oMlw16xr1sj3XMB4yC5LRACfUHa8TAba5?=
 =?us-ascii?Q?k3DCeWAHtf+8DntiqWKPTU9bQCSwJ5tcqWxan+5nvUUStvPfAWbUD6VYoaO+?=
 =?us-ascii?Q?Dd+T4nrxBIz6AeKoZV64FjqODqbCB/KDt6jof1RKC7mJkMtwLq/bnmhAjhq2?=
 =?us-ascii?Q?u7KsGmcn22YNO+2t6d+BZ0gmEPefTTRqD1HAmOH9iCiF9GwktzXIUQvcFMyr?=
 =?us-ascii?Q?KxVbWAKOqTa46QuVQcxaFfjTbQrCE2EQr0vN30FEtUX3IEJlUclBPAnzxUP0?=
 =?us-ascii?Q?TQe6EJ8/CBWOYlxNerLbqoQ815VAjjEZobcw1jCn11iAwDaCeqqtMcxIcEgx?=
 =?us-ascii?Q?vU3fJoa+Lzh9GEDDFQGavULrahgbC9SqZZ1LYrm97E9z/eTWu8wz1g70DKPM?=
 =?us-ascii?Q?BD5grQY9IE2sVKzy7lFaDSxsJ3GzoLtAH5OsjXVho2dPYfUZ09gj/ju94Qdk?=
 =?us-ascii?Q?bxUdsJzlz8Y+REjahgXNkzpUzfezh7KiTDTsPCm289tr90avM9thxKldt8B7?=
 =?us-ascii?Q?EKXI9dtPdubJIJ9TVDFWqpzah1Jz+BE10E4/BpO7/ee+h4yRHWLyVjgWJCfx?=
 =?us-ascii?Q?q9Lm23FoTzgHzV0r/HnX9qf72LD7k+KKACTLYQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08CU001.outbound.protection.outlook.com;PTR:mail-sj0pr08cu00104.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(14060799003)(35042699022)(82310400026)(156008)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y6iRlWMwn4VT5gL+q4gxQeo4Zb0HB1xdBkWtcg3LEDx+fe/o+9AdPB33UMZVsyaWJnTc1dAydOr0aE0paot9xTOn06HlcVBk0YQqq+y7Uw2ezrZxg0Atr1AyI7QB7R1ph7g63KVNqKBXvQr52wcG0f4LjL30AlRwsOTgLuThP95diKh8XPlMcsp+gKJ6PAYis8f6JmZPmF/YjPxYMQh//DZ5vNVs2AZqo2ZJjHRDfEyYCQEoMNdEI6XhCqTYcZBN1QY6o5NeRDBLeOwI3Z0fzg9YDrt1x3/nW9mjmuXYOcJkAMCpfvS0w5/xxxkjUrguWVuX0LopORmfvHiRcWKGYyaye6BjFq9f7a6aNu+I1qnxUGX5omKVueER9PIRVzBYfwA/fAdZSyBU/E+SvAn1TMIN6ZYA3hXbsWPZEe7SHxPY4XKSiWk+vcRScOI7SeMT
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:39.4765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f019f542-e825-4a2c-dc2b-08de9f23a677
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB6750
X-purgate-ID: tlsNG-16d1c6/1776720471-CF97CD75-9EAC6CB0/0/0
X-purgate-type: clean
X-purgate-size: 10132
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:proskurin@sec.in.tum.de,m:sstabellini@kernel.org,m:julien.grall@arm.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.235];
	TAGGED_RCPT(0.00)[xen-devel];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[elektrobit.com:email,elektrobit.com:dkim,elektrobit.com:mid,tum.de:email,arm.com:email]
X-Rspamd-Queue-Id: 8B9BA4340AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit pulls out generic init/teardown functionality out of "p2m_init"
and "p2m_teardown" into "p2m_init_one", "p2m_teardown_one", "p2m_free_one",
and "p2m_flush_table" functions. This allows our future implementation to
reuse existing code for the initialization/teardown of altp2m views.

On failure, the p2m_init_one function returns a null pointer. This means
p2m_init_one doesn't return an error code, which prevents it from
propagating the exact error from p2m_initialise (specifically, ENOMEM if
allocation fails and EBUSY if the VMID pool is exhausted). However,
returning a p2m_domain pointer simplifies usage for callers of
p2m_init_one, as they can receive an allocated and initialized p2m_domain
without needing to handle allocation separately. Therefore, the main
p2m_init function will now return ENOMEM instead of EBUSY when the VMID
pool is exhausted.

This is commit 6/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien.grall@arm.com>
---
v2: Added the function p2m_flush_table to the previous version.

v3: Removed struct vttbr.

    Moved define INVALID_VTTBR to p2m.h.

    Exported function prototypes of "p2m_flush_table", "p2m_init_one",
    and "p2m_teardown_one" in p2m.h.

    Extended the function "p2m_flush_table" by additionally resetting
    the fields lowest_mapped_gfn and max_mapped_gfn.

    Added a "p2m_flush_tlb" call in "p2m_flush_table". On altp2m reset
    in function "altp2m_reset", it is important to flush the TLBs after
    clearing the root table pages and before clearing the intermediate
    altp2m page tables to prevent illegal access to stalled TLB entries
    on currently active VCPUs.

    Added a check checking whether p2m->root is NULL in p2m_flush_table.

    Renamed the function "p2m_free_one" to "p2m_teardown_one".

    Removed resetting p2m->vttbr in "p2m_teardown_one", as it the p2m
    will be destroyed afterwards.

    Moved call to "p2m_alloc_table" back to "p2m_init_one".

    Moved the introduction of the type p2m_class_t out of this patch.

    Moved the backpointer to the struct domain out of the struct
    p2m_domain.

v4: Replaced the former use of clear_and_clean_page in p2m_flush_table
    by a routine that invalidates every p2m entry atomically. This
    avoids inconsistencies on CPUs that continue to use the views that
    are to be flushed (e.g., see altp2m_reset).

    Removed unnecessary initializations in the functions "p2m_init_one"
    and "p2m_teardown_one".

    Removed the define INVALID_VTTBR as it is not used any more.

    Cosmetic fixes.

v6: Reworked to accommodate the hostp2m being allocated separately from
    arch_domain.

    Split p2m_teardown_one into p2m_teardown_one and p2m_free_one, with
    both having the same semantics as their x86 counterparts.

    The previous version of this patch also added code to p2m_flush_table.
    This has been split out into a separate commit to minimize the number
    of actual changes in this commit.

    Updated to account for the introduction of p2m_final_teardown.  The
    code which previously was used to reclaim resources from the hostp2m
    during p2m_final_teardown was extracted into p2m_free_one. Now,
    p2m_final_teardown will call p2m_free_one on the hostp2m instead. The
    check for whether the p2m was actually initialized was moved into
    p2m_free_one. This means there is a slight behavior change where
    p2m_teardown_allocation will always be called, even if the p2m_domain
    was never initialized. I'm not sure if this is really a big deal (it
    does require the lock to be obtained, but this shouldn't be an issue at
    final teardown?), but if it is then I can duplicate the check from
    p2m_free_one to the top of p2m_final_teardown, which would replicate
    the previous behavior.

    For the sake of making the p2m_init_one function simple to use (and
    match the x86 function prototype), it returns a null pointer on error
    rather than an error code. While on x86 an error from p2m_init_one is
    always due to an ENOMEM return code (from xzalloc, zalloc_cpumask_var),
    on ARM p2m_initialise (called by p2m_init_one) can actually return
    EBUSY if the VMID pool is exhausted. Therefore, in this error case the
    null pointer return value of p2m_init_one obscures the true error code
    (EBUSY). Callers of p2m_init_one always return ENOMEM when p2m_init_one
    returns a null pointer, so this error will be propagated up as ENOMEM
    rather than EBUSY. The alternative to this would be to have callers
    pass a null **p2m_domain to p2m_init_one while still returning an
    integer return code. In order to preserve a common altp2m_init routine,
    this change would also have to be made on x86 (where there wouldn't be
    any real benefit, the return code is truly only ever ENOMEM).
    Therefore, it seems like an acceptable tradeoff to me to obscure the
    error in this case, but if other folks think we should handle this
    differently than I can revisit this.

    The p2m_teardown_allocation call and p2m_init_one return code changes
    mentioned above should be the only actual behavior changes in this
    patch, otherwise it should be just code movement.
---
 xen/arch/arm/include/asm/p2m.h | 12 ++++++
 xen/arch/arm/mmu/p2m.c         | 77 +++++++++++++++++++++++-----------
 2 files changed, 65 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 23df91ea13e9..5c6dfe4a9789 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -216,6 +216,18 @@ int p2m_init(struct domain *d);
 int p2m_teardown(struct domain *d);
 void p2m_final_teardown(struct domain *d);
 
+/* Flushes the page table held by the p2m. */
+int p2m_flush_table(struct p2m_domain *p2m);
+
+/* Initialize the p2m structure. */
+struct p2m_domain *p2m_init_one(struct domain *d);
+
+/* Release resources held by the p2m structure. */
+int p2m_teardown_one(struct p2m_domain *p2m);
+
+/* Free the p2m structure allocation. */
+void p2m_free_one(struct p2m_domain *p2m);
+
 /*
  * Remove mapping refcount on each mapping page in the p2m
  *
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 1009f10e5db4..1d598c66450b 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1444,14 +1444,10 @@ static int p2m_alloc_table(struct domain *d)
     return 0;
 }
 
-int p2m_teardown(struct domain *d)
+int p2m_flush_table(struct p2m_domain *p2m)
 {
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
     unsigned long count = 0;
     struct page_info *pg;
-    int rc = 0;
-
-    p2m_write_lock(p2m);
 
     while ( (pg = page_list_remove_head(&p2m->pages)) )
     {
@@ -1460,23 +1456,34 @@ int p2m_teardown(struct domain *d)
         /* Arbitrarily preempt every 512 iterations */
         if ( !(count % 512) && hypercall_preempt_check() )
         {
-            rc = -ERESTART;
-            break;
+            return -ERESTART;
         }
     }
 
+    return 0;
+}
+
+int p2m_teardown_one(struct p2m_domain *p2m)
+{
+    int rc;
+
+    p2m_write_lock(p2m);
+    rc = p2m_flush_table(p2m);
     p2m_write_unlock(p2m);
 
     return rc;
 }
 
-void p2m_final_teardown(struct domain *d)
+int p2m_teardown(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
-    /* p2m not actually initialized */
-    if ( !p2m->domain )
-        goto free_p2m;
+    return p2m_teardown_one(p2m);
+}
+
+void p2m_final_teardown(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
     /*
      * No need to call relinquish_p2m_mapping() here because
@@ -1484,18 +1491,27 @@ void p2m_final_teardown(struct domain *d)
      * where relinquish_p2m_mapping() has been called.
      */
 
-    ASSERT(page_list_empty(&p2m->pages));
-
     while ( p2m_teardown_allocation(d) == -ERESTART )
         continue; /* No preemption support here */
     ASSERT(page_list_empty(&d->arch.paging.p2m_freelist));
 
+    p2m_free_one(p2m);
+}
+
+void p2m_free_one(struct p2m_domain *p2m)
+{
+    /* p2m not actually initialized */
+    if ( !p2m->domain )
+        goto free_p2m;
+
+    ASSERT(page_list_empty(&p2m->pages));
+
     if ( p2m->root )
         free_domheap_pages(p2m->root, P2M_ROOT_ORDER);
 
     p2m->root = NULL;
 
-    p2m_free_vmid(d);
+    p2m_free_vmid(p2m->domain);
 
     radix_tree_destroy(&p2m->mem_access_settings, NULL);
 
@@ -1511,9 +1527,7 @@ static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
     unsigned int cpu;
 
     rwlock_init(&p2m->lock);
-    spin_lock_init(&d->arch.paging.lock);
     INIT_PAGE_LIST_HEAD(&p2m->pages);
-    INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
 
     p2m->vmid = INVALID_VMID;
     p2m->max_mapped_gfn = _gfn(0);
@@ -1559,22 +1573,37 @@ static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
     return 0;
 }
 
-int p2m_init(struct domain *d)
+struct p2m_domain *p2m_init_one(struct domain *d)
 {
     struct p2m_domain *p2m = xzalloc(struct p2m_domain);
-    int rc;
+
+    if ( !p2m )
+        return NULL;
+
+    if ( !p2m_initialise(d, p2m) )
+        return p2m;
+
+    xfree(p2m);
+    return NULL;
+}
+
+static int p2m_init_hostp2m(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_init_one(d);
 
     if ( !p2m )
         return -ENOMEM;
 
-    rc = p2m_initialise(d, p2m);
+    d->arch.p2m = p2m;
+    return 0;
+}
 
-    if ( !rc )
-        d->arch.p2m = p2m;
-    else
-        xfree(p2m);
+int p2m_init(struct domain *d)
+{
+    spin_lock_init(&d->arch.paging.lock);
+    INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
 
-    return rc;
+    return p2m_init_hostp2m(d);
 }
 
 /*
-- 
2.34.1


