Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEHyGrKb5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F19434288
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287840.1568281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFF-00054b-IY; Mon, 20 Apr 2026 21:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287840.1568281; Mon, 20 Apr 2026 21:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFE-0004uk-PS; Mon, 20 Apr 2026 21:33:28 +0000
Received: by outflank-mailman (input) for mailman id 1287840;
 Mon, 20 Apr 2026 21:33:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwFA-00047h-BQ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwF9-0054Hn-OA
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:23 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b9f-5cb7-0a2a0a5109dd-0a2a450c9430-6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:23 +0200
Received: from [40.93.201.115]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69ba2-62f1-0a2a450c0019-285dc973c522-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:23 +0200
Received: from DM6PR08CA0044.namprd08.prod.outlook.com (2603:10b6:5:1e0::18)
 by SA1PR08MB10871.namprd08.prod.outlook.com (2603:10b6:806:4b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:17 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:5:1e0:cafe::70) by DM6PR08CA0044.outlook.office365.com
 (2603:10b6:5:1e0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:17 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:16 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHc2Rvwz1wdW; 
 Mon, 20 Apr 2026 14:33:16 -0700 (PDT)
Received: from CH4PR07CU001.outbound.protection.outlook.com
 (mail-ch4pr07cu00105.outbound.protection.outlook.com [40.93.20.101])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:15 -0700 (PDT)
Received: from SJ0PR05CA0146.namprd05.prod.outlook.com (2603:10b6:a03:33d::31)
 by DM6PR08MB6379.namprd08.prod.outlook.com (2603:10b6:5:1e6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:33:11 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::4) by SJ0PR05CA0146.outlook.office365.com
 (2603:10b6:a03:33d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:10 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:10 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:06 +0200
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
 b=YABom5rJD70JrzzZcb8JZA98Qmss6TyupJYgErNShrHCC8hE0Qom4DcBT85MmJj45SO6sUXOaLUZldOIJty81MpqPuuIhMkYTPPVaSsWOLFlwcsWIQ3NTszWZ3uIFOWl+Kh9VgTMrkDq/MVyr/XiDjQth1T5sbFl8eQxX/v1OW/shIvppvLWezspeT8mFVWC0+gcESK1KYKtbL8CtDyfi2dpJ8tJY9OdSHe2oBiIPvtmau/8qnTiDL5Cz4Gp+3r4CbE/5s1E/htnDdsgK7KlmG4hJwOLgo7TI47o9cXkpFu/gsKKWL+gznM5J2etyp+LEdz1mKRES00dDccqtW+TVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwN6LjYBkj1+FSQXCFug5OOMEvPQdMZIPBr0As48NFk=;
 b=RTazfbEd/lTwFPfGyadETTXbfs1bV+rGe0FhmtVlSUNT7vejkKgEHk2BE2wS3PGHUNhY2gaegAyAKQwbMZXYmzG02xfZ1+0ADNWcTMNejGyGfBxfOwAEVqli9kZXyJK06aqpSZEI9DdeR4mSs09sWtBbTgIGK4AaS1bt4hIpQ0k/k+EVlBSvZHL9MINZzPgmtqt9gOptJsx3PawqWdYRt8i+v21oM2ZlfeXF2mnf5nowkuU5QAgWTZtUaG7ZNlfgcJ+kRs8hC6iKUChqaCV+KRPeRn+lal6fYkVpMAVFZXFppHkKgejqR/nuLQLEG/7rp7RBDkR7rJxfGlSJUb96oQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.20.101) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwN6LjYBkj1+FSQXCFug5OOMEvPQdMZIPBr0As48NFk=;
 b=rupthdiOGDDVhD2p8B+b3s4GhB2Wl4Z+Ofw2TqIljUe1cAXPZCy7wxPqgWLyBSdbm6BWtYn+F7EcleuSpn0hXItNErQ43GRTd4lPWPzRIY8Kuoubq4s8OU7ZzNda/+jh9BPMin1v1vUp4Mc2C3MAFyRS7iQZafIOEOLmXgM9yIQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.20.101)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.20.101 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.20.101; helo=CH4PR07CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqjQWC2h/0Thlvb9j7tl93KXKZFEL6SpD10W+gNt2G4mgnFUgDq1iDbzYwB4r/TwIsKKh2WNx9GBx2TcMWaNPj/FrNGFwAr2r5cEzFfq+AH0B6jJkzLTeXZs6wpR2Nbzm0SjP4ZgyTYEMAgeA5G/33plTggNyGJT+ke2j2piQ/d32ubAWkOsPL3OYHhhj4GEmKKzRshHAywAO3t5wPWZzL/TN9hLtJalM0QSHmgplq3iJyvJeVdbc0OywgCdQWyhpoLbb4chgCmp/jyGLNSOcwLN0Dqa/0AkY+pss7AB+PePQs1UT79Ia0dG9raBIes5OHUGVhbtAzgsW8KKYjLuXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwN6LjYBkj1+FSQXCFug5OOMEvPQdMZIPBr0As48NFk=;
 b=J8gL6fnarhg3iBqLcbQ/wcKSi/SNL7c0nBHYrVlIupRP6TcCzttUuNx5hqSLD+Rp5hmxGg3AjG1lAk6heFUmJdwqrKb3ovbZssXWQTPKDXWFBIUovq5lr7zhiNfvZWepb0x3wh9rzjNsZWDJj9eULKn2FXxU5N8GAHeM6d7N67OTWllQ1lBYlTwFaD7LqEF0qHkRV4B4A9IzAwFU63Me9bokssnj8qzfGWR97S/7djAl2PayNVk5EvS9vs+HI6gJzjnWSq6SJjcMgsV0NEei8Pbi2K+1EtbHm8eYEnaKLhzjHnop3GeFIHuGCMqmt1PshjMLwNH17oT+43lv9mwgpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwN6LjYBkj1+FSQXCFug5OOMEvPQdMZIPBr0As48NFk=;
 b=rupthdiOGDDVhD2p8B+b3s4GhB2Wl4Z+Ofw2TqIljUe1cAXPZCy7wxPqgWLyBSdbm6BWtYn+F7EcleuSpn0hXItNErQ43GRTd4lPWPzRIY8Kuoubq4s8OU7ZzNda/+jh9BPMin1v1vUp4Mc2C3MAFyRS7iQZafIOEOLmXgM9yIQ=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [RFC PATCH v6 26/43] altp2m: Add altp2m_set_vcpu_idx
Date: Mon, 20 Apr 2026 17:31:49 -0400
Message-ID: <20260420213206.208750-27-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C5:EE_|DM6PR08MB6379:EE_|DS2PEPF00003446:EE_|SA1PR08MB10871:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f277f4c-68c8-4c54-ffdd-08de9f246f97
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704161411799003|7416014|376014|36860700016|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?b+OhAJUgl5hKUmQQiAfaT/rj9xTP32aWtH8wmHR3HuM4MAb6GFC9KMWcg0Yz?=
 =?us-ascii?Q?wHlsF/BmQawtRi509HMe2h7doMdXQdTPfE5Y/sMcWpR4GphwcYaSIdtkvFft?=
 =?us-ascii?Q?VkGYc+BSKgsB5i4CHUEUsWMpqVrrOdxUSNk/Bc0tPoJ4eK4NsQMgkvKVIWbU?=
 =?us-ascii?Q?PsXnDAzDBtn1KdiRdUkLLKweIufp+OHHatcncGwPAqoVINeJG8P7vSeoo6Oo?=
 =?us-ascii?Q?WD3DmQuIl+uG3m+qYToiIPe8Uucfka59Ntd2MLuoHOstWDBqnBb6vmZbFZmF?=
 =?us-ascii?Q?VWVZ113hef/EDSwF75eWNZuxKTxreZZQPil+3VMsfaUy3ViZ3asONyPG6nEJ?=
 =?us-ascii?Q?OxlZXQ5oZmM41VtByfibsQqA4NSYa2NRFI88+wmgja6Nk5FPxtYfS93NSUtH?=
 =?us-ascii?Q?g5GL6VwTusKPwFN6rYy59I4hJZzy+tLDVM5dVa6WicNUZ78pgQKZgvHNWYmw?=
 =?us-ascii?Q?HhA0GgWwOVHJ6UEVDmknNrYE3j7B3ycuJc6VpPxcvQr6th9hsIlHnDXdr7Oy?=
 =?us-ascii?Q?1jqOiQ2ygXO575gvT5TYhRO763+L+ERWP5Nehe6z4XLGC3vywB+zutM3jWyG?=
 =?us-ascii?Q?L82Al2lfIsdNMI/2mahv1kNNs1EsALn+zcB/YioKj6noS35Otyq7p0CE57JK?=
 =?us-ascii?Q?/rOCbU/oTQTknHY0DIHleYWnHrPa34n2chpDKgNTYT2b3TpqFBHF6aixyjeL?=
 =?us-ascii?Q?tBMkpMwDrhN/eyV17XI76joniWkm9T8Y0KhdTSv9YP46W3KXx6BuWmduaWDo?=
 =?us-ascii?Q?4czUAVSk5NColGwvGKkQ+k+466ZPZ9C/59hLU02ad0NzZ2jtBylLm/KgaT6X?=
 =?us-ascii?Q?gwRb0ClJPeozwDGHryutNVottvpOJdZIUgJznUHpoo0O9kNmoLAMAZHyZ3vm?=
 =?us-ascii?Q?pL/W4OJ+VngVbPfzWUC2MNZyNEu2jRvI0JDJ7tmCSK9pIvK+pw8Lebj1kd7o?=
 =?us-ascii?Q?ubcj6knFyQCvi6aBIdLlYT5nPcsXsh4DoEsYxnsuw59EO5sNN5GdUWmPeQ7T?=
 =?us-ascii?Q?TM9xP7y4WKY7wySWTtnkoaPdhEce86qiSk63xq8Gw3NBRsU3ReNk1feRWay8?=
 =?us-ascii?Q?dcCEIFQGyEHcHv0hEtRmJ9vEZUHRglEXIJ5aeqFj3UekuzZpwR2tDin698tb?=
 =?us-ascii?Q?5bbXFaJ4EcuUij4xr6bGxbPvOjhhWgUcAw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704161411799003)(7416014)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 dOaZGe2Vw2cY/WEuEm5qk/VZc+7RQMVLIwmbwUqKOvCcgx2XVEkhG043S/44lcOHOrnPtBe7fllM20HPoaeOeC9QWcz1svmjyhMCw3pFkY0b8n9ubw7SLPs3/WpkKRe7BB+9aARosmzexql/siJvfTpL5c0GRhFY12qSab+OJ3X4qlOFQ/4KAn2lfrhCQouIwzuMhUCehAZyaOCLlfeRAHokPN+l14Pl7VFJVW3i74rh0GNL1SeiVODbjJav2oUx/VaznVTCg/3hKALAOKbKe4VZwXodLLUpSWQAIgDumcQ4l77nDwsbNT4bnqo80+pTutQK+rV77USa9IdrGzf9kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB6379
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.20.101];domain=CH4PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.20.101];domain=CH4PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a2a66152-bd78-4c57-7a07-08de9f246bb0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704161411799003|1800799024|14060799003|35042699022|82310400026|156008|7416014|36860700016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WI7O0GfzgUNDhPIZdcuDqc2XDtE1r4kNp8drniUKdrELs3PWw+6dcYljnLDZ?=
 =?us-ascii?Q?gw4rO6Ai+NAI4mHt346EUKHABmZeO2hgjPmpU+fQbMPvsEeHfiVf6u3Bgp2H?=
 =?us-ascii?Q?ZUGCvdgc/aHEFWFOsNX3++AV4HgUX/CUg8IDd+TJClhFKr1i/hseo9GP3oPA?=
 =?us-ascii?Q?RDU8QWYHGO3YG1Qvwj7xZXNzM0NUAbdhgat67pH6O0rGF5dWqWcG3d/sEv1k?=
 =?us-ascii?Q?QGHrwi+uIW6AhVnpkHAgKwdHA8IgYv/ax6bmNLQf5bSFrba9DhhGn1aOV5Hu?=
 =?us-ascii?Q?loLNxhAWzRzWmlkSIbKEIueZLipCKcKhAL/ji2Dsdd1CkV1LGJ2dFm+jOU4r?=
 =?us-ascii?Q?fyOHyu08nrcDSO4563EUS+y04Gg8/b4Pz15X9LcvMQ1l6iADKRUCj+8IxM+F?=
 =?us-ascii?Q?//3+0KPZNnNkXWcN6gjYGS8E1nphpC0aAWhD2jLOuu8unFXVzFb9/S7zGG4O?=
 =?us-ascii?Q?LMZ4ULVreeO6wSJGkqvTQVS7RgyvyV+yBfh7+2VnOLZnI91gU/xbEbcxWPit?=
 =?us-ascii?Q?S50aK4XigRRwgUv+0vV3LeqHKRyJQSfvNF/QAFUZ1c7G1dHT+6A/bfc3szyU?=
 =?us-ascii?Q?+QojsgGB/gTcCNCL3J7Qels0AarDvvZ6aT5lTo0O2B/lPZKqhJNvAwyJoRWS?=
 =?us-ascii?Q?6OORHvhi3zvUc4d/Lrl5WeLL2jv+lX5pRm4dVDdIx+wAPmL/7MeYv837jaxr?=
 =?us-ascii?Q?JyFScPk/hr5VLLRWH1EboAfy9LcAT28IxRrkCyPmg1tBZtw1DcsHU+ZG8Mfo?=
 =?us-ascii?Q?9bTaY1miZW54jb29QbHjaOnItsN6faW8PD8Axw8s6Sy443BCLYmsIy4jpMrR?=
 =?us-ascii?Q?L/CtjmhzP527FOnIKAfzUMyhoSFD08829X1QcbFHyl7HMyUssfDhfzWW33Wt?=
 =?us-ascii?Q?vcxbSS5eB0YO8jcVFgk4vXrr91GR/oZ9YpR/gmQW3QtIO5BZNjkUbRTdPOT0?=
 =?us-ascii?Q?g5Q3oDkYCcDGzmVUGIgm8syGdg7bTr4qDD8gRxGDOAnK8843ncZm0JCrazh1?=
 =?us-ascii?Q?DZ7wpzteT4qRIazIaV/NzHTsuUUhigznOSnY/Lav13hy9jGQbqppZKgZgoR7?=
 =?us-ascii?Q?wvIYyZk4B8pizjK6bDGBVIawdXb2eL+/Xg3Zcg3ZKAPqdAQdfbib8fpqmSkd?=
 =?us-ascii?Q?PAhrSW+AuK/3J5dpxXB17gmdonQcL8skTw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH4PR07CU001.outbound.protection.outlook.com;PTR:mail-ch4pr07cu00105.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704161411799003)(1800799024)(14060799003)(35042699022)(82310400026)(156008)(7416014)(36860700016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lEnYNFwXbNo+tWP6FwCDEEuxsCurDgN3tGFmRfRiibJctrsKVi/ApggoZMHH28UJ7OOW8YskOcvdt4yMC89e0h66TBwNHGPy2J01sI6IwVCdAR6dG/+2V6FVMKOsUDAlqteTXyqZJo2QY6oOw2LgQ43c45syHXoNqP5Ytuooj6dYIq5ihRawb1f9sCFuxOEYpRDon8DghKPkBTUh8K6MWcsUDa0Yq9hPx0B8uB6vUh0TjqvZzyWVX0e9JKEqYiIylLq1CcZIpaLQyMsfK7gf4Nc08auuw/xy+O7c/lpq2evr3UguWPmQzC8Y3HFqpHvmJKx0wOYW446COR1VEVTFRwEtEFDqASmhm/O2dp2CIcaoi+8CCRlz1A8hhk17hEDm0c+Vj8ykgkMbjvhW8R8jvpXcg/DG2JhOi8K8KnKYANIGqnPSB6jkipXngT1Zbroo
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:16.9783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f277f4c-68c8-4c54-ffdd-08de9f246f97
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB10871
X-purgate-ID: tlsNG-d25034/1776720803-6D56FCF5-715972C7/0/0
X-purgate-type: clean
X-purgate-size: 1653
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.362];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 05F19434288
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds the altp2m_set_vcpu_idx function for both x86 and ARM.
Since the altp2m VCPU index is stored differently depending on which
architecture is used, the altp2m_set_vcpu_idx function makes it possible to
set this value in an architecture independent way for common code routines.

This is commit 3/4 of the altp2m_{get,set}_altp2m phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/arm/include/asm/altp2m.h | 5 +++++
 xen/arch/x86/include/asm/altp2m.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/altp2m.h
index bc695018e62c..f001e022a213 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -29,6 +29,11 @@ static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
     return v->arch.ap2m_idx;
 }
 
+static inline void altp2m_set_vcpu_idx(struct vcpu *v, unsigned int idx)
+{
+    v->arch.ap2m_idx = idx;
+}
+
 #else /* CONFIG_ALTP2M */
 
 static inline bool altp2m_supported(void)
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index a1b078783b3e..b3d348386a00 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -60,6 +60,11 @@ static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
     return vcpu_altp2m(v).p2midx;
 }
 
+static inline void altp2m_set_vcpu_idx(struct vcpu *v, unsigned int idx)
+{
+    vcpu_altp2m(v).p2midx = idx;
+}
+
 /*
  * Alternate p2m: shadow p2m tables used for alternate memory views
  */
-- 
2.34.1


