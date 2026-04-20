Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHZYB2Sa5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3703B43405C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287501.1567943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9e-00028n-3C; Mon, 20 Apr 2026 21:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287501.1567943; Mon, 20 Apr 2026 21:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9d-00025a-S4; Mon, 20 Apr 2026 21:27:41 +0000
Received: by outflank-mailman (input) for mailman id 1287501;
 Mon, 20 Apr 2026 21:27:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9c-0001mA-0c
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9b-001N4o-DV
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:39 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a45-2eae-0a2a0a5409dd-0a2a450beb80-4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:39 +0200
Received: from [40.93.198.102]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a49-212f-0a2a450b0019-285dc66613eb-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:39 +0200
Received: from BL1PR13CA0149.namprd13.prod.outlook.com (2603:10b6:208:2bb::34)
 by DM3PR08MB9498.namprd08.prod.outlook.com (2603:10b6:8:1ad::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:27:22 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:208:2bb:cafe::f8) by BL1PR13CA0149.outlook.office365.com
 (2603:10b6:208:2bb::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:22 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:21 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz8m3KKrz1wdP; 
 Mon, 20 Apr 2026 14:27:20 -0700 (PDT)
Received: from CO1PR07CU001.outbound.protection.outlook.com
 (mail-co1pr07cu00106.outbound.protection.outlook.com [40.93.10.94])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:20 -0700 (PDT)
Received: from CH0PR03CA0432.namprd03.prod.outlook.com (2603:10b6:610:10e::20)
 by LV5PR08MB10848.namprd08.prod.outlook.com (2603:10b6:408:2fc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:27:13 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:10e:cafe::66) by CH0PR03CA0432.outlook.office365.com
 (2603:10b6:610:10e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:13 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:12 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:09 +0200
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
 b=Lp7sUusTmHSJDMxFwE1IK/0xvDD384w0IX5voLuE272foHy8Enhj14hPj+/MCDkuliyAv7VQT2jazrViyHt/boo1748MAEg44p4f7VdTLhp3In85aKnqsn+6BOa3qTne9n8N1HKnu45/0VZN0jHuHICUCmVm7iBMOoggTLvMx7CLFF0j9Zu/SlyteF17nm2FLyaken0HQ5LVK6BCKDWd+qINIuHvbg0iAG1qkdnSCopDqPNF8k/b5K+AsHdHJ6kpIiteu8AYDa4qcQFZcl9ddRVrjod+1zmsuhS+JKuLhSNCPbsTurw5IbtpqAfUVP/ZINtv/g3oli3s9rOgHOB/bw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55tm/2wld/ywUdSampZbkiV4LluAQpXTHs92fXHMAOY=;
 b=lMYwt/FnOh82WCrsZ38dIveWmcDZTMqY6Wave9148Tcv7AlU0yTqK1xqTiBjAq3r6qpmOQkxFrm/T1sEkpOiyZYh8e3zxU8lTqJSbKzSWP0FirHy0M2M6UR+Wl9byzqEwlo1SaPDDRZBErBz6XhlShKkeEpHdd8HRq+t/CouvkPbhzD/zyvu6Pn7ZlQaCdVpsWvAt8IL96EpcYMuFRycXxb2c4+E/RGnIrC9CHL2AP8qUSle/W5WY6+BJkwFH2kY2a4+SDjwslTEEmZFe60Yi8wCojUlH9BPOFfHUl6ZXB30vpK8NEbIuz0NRo6P+XQJO2IP8pwE+AxXkg1yosEWLg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.10.94) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55tm/2wld/ywUdSampZbkiV4LluAQpXTHs92fXHMAOY=;
 b=o1YKc7JF4FB1FaNDoJ8pEj9SD4rBuF9F2Lob37S0U3UtP/HG9U8JzfJd1sRe+Sv/rra/M7OXZBINNcoOdigDNioAe1JPaR1Ek43W+JPkZMj9Rqd0YxmphS6oKSqGZCylXS78EXUHhiQjpAmuseGxRGn+OvbWzRqTZkD3lrZwoVw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.10.94)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.10.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.10.94; helo=CO1PR07CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuLPUqkxh6f+J47w5Iwp/5/A62GO0iA58rDG6mh6ewVx+c6semXICO6diy53DGJXmiAuRSVT0vfxFyfM2aOvhuxv/IP6wk142p8iXYc+5xOG0XaNQywjnNDHnoNGHy/LWY3H4YTqOE2VnU1DtDYES7QaI1X8Z3viMcjFcFseKIzdELsn+gB17EWwgOmXU0Y7BXkGmrfHudHTpDOxm8lQlt7KSXpU1tH9ydH8yCL0X6ccIYrKu0kegEzI5li6doSZxM23F1COeGtHVCcUrsg8jPKHrULv5fpuDQPlT+pZ4UVG4/7kbh3e8ykCXxOwpm8Wp1LU6Sfe9N/Q87s7VBm4wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55tm/2wld/ywUdSampZbkiV4LluAQpXTHs92fXHMAOY=;
 b=lCberM3/orNIzyMP8hmol19dcvx0V1srt9KyRL3yZR0uayJGfHfeMivvCBL9UahBoX+JIR3LQUSd5hPPsBg0YQmfOXWOF8i11t48MzBv5fwq4UZ5lav15VptzYhwF510IG4z+8cU1FL02JCRFUNcjPVjRQrwBMlzfFrMU0zwl+usI3TNTYOuFH0tI7p9KQXBWSbF+P4eQNN9ntXJsSGa3GvXuG4YT7vsErVTRis1VQgBJwSKCueyDwAXgOtNM7Kh/qBnVPjM9MR++d1Qt5cumZ3W+GnWZPsD47Z9yj1Wv96wR2QauzpDERn0QnFtITZkj/bQarTyZeagccvTvFvq4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55tm/2wld/ywUdSampZbkiV4LluAQpXTHs92fXHMAOY=;
 b=o1YKc7JF4FB1FaNDoJ8pEj9SD4rBuF9F2Lob37S0U3UtP/HG9U8JzfJd1sRe+Sv/rra/M7OXZBINNcoOdigDNioAe1JPaR1Ek43W+JPkZMj9Rqd0YxmphS6oKSqGZCylXS78EXUHhiQjpAmuseGxRGn+OvbWzRqTZkD3lrZwoVw=
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
Date: Mon, 20 Apr 2026 17:26:14 -0400
Message-ID: <20260420212648.208640-2-Rose.Spangler@elektrobit.com>
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
	CH2PEPF0000009C:EE_|LV5PR08MB10848:EE_|BN1PEPF00005FFC:EE_|DM3PR08MB9498:EE_
X-MS-Office365-Filtering-Correlation-Id: 256f584b-748e-4060-630e-08de9f239baa
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704162011799003|36860700016|82310400026|7416014|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?O5FCXpEvEa3IGgHzFtD3K25IdgSo6f0NN1jzC1JNpc5hFf6jUM6WtbZpzSZX?=
 =?us-ascii?Q?Do+0snGkyx5SGK7PpxyR7GOZ33LMs0GviwtEC4C90aZ7Rt+ETAq0fpZrkicc?=
 =?us-ascii?Q?4WtxjdOtkOFrD7ljKjI0kp5/Cp0rgypg7s4bat+zYNFIBFKM/vb2JmMP5c5r?=
 =?us-ascii?Q?EVB4HKQ+ThzywMN0CP27a4QqLDcp7lw5NUYQAtaTRx76BDJwYtlf1eWtl6Q+?=
 =?us-ascii?Q?59b6nEzrRkiXHMTXRZB5RLG4d5stNOd3fxQmmUqEbnS0VQv+ws3wvFoHs21v?=
 =?us-ascii?Q?mmLm5bK4UdtguKuph+cp7eOa/jgpq5rJ5NBKPVREB3FQjc/zYO7LaZy62X5X?=
 =?us-ascii?Q?OGclnzRdxgOh9mcc8euMyoHiZGFUwN7XWjDChZ8amlEkRAjh8F0E7o5P+27D?=
 =?us-ascii?Q?pOS3C1dxoj/xsl3JUDBSeXupQkCFjV553QK5J9TJMSJPB85EdL6W3CU04B0B?=
 =?us-ascii?Q?prbdHh+V7OYgFRVpc8iFO7EHY/balqqErlFW7xWIL9cDotd8S/I0Q9V5Ztph?=
 =?us-ascii?Q?lN484F2u2Gl8AWZTknvCsLBxB1AWDSsjaochDuOC//6o166h3rE0nE36J73m?=
 =?us-ascii?Q?gebvFekv4Ye0npIkBikrj3myE2vmGvfOkWWoY9Ujj/Fp7sgZyhW26z+i2u+0?=
 =?us-ascii?Q?ekF5CMf4QWbKOgscxOa8TWFe0RJVm0gzh/1D/xSsDcqJJgl51nvSLY9wkLux?=
 =?us-ascii?Q?l6Pi5gqP+MbGOboWK57yTNzuqf0tgXjPgms6lv+N2Z3C8/ON+KKODDWQ0tui?=
 =?us-ascii?Q?ipmm6feTEv4MkRNkTqPQfyh4Xwcymd9sKPO5nZY7A6JJaDFARyx3vDhir1rm?=
 =?us-ascii?Q?MuWe4ENwRGjPxIaYKlLMispnxYJgetnv4oc4+XG+gTxT/KzfHoa/7fDk4cOa?=
 =?us-ascii?Q?fDs5D+HTrGlec8XCokE90N+J9vyiDDnz5tTdqg8V30nnkRK9HYnY/ejs952o?=
 =?us-ascii?Q?LTtDH4Dm6YcR+/760+BbkI3eydcf/BaCk2+oUm4fcUbu1EoVCmM7PgeWwfRI?=
 =?us-ascii?Q?fx2ekp4MaH9hQ0DcXwbjAv3gA+4SjLYKaWtm+0BLmpxVMrw1L21mhkFG00z9?=
 =?us-ascii?Q?wSjMhYDQ6RmwOmPbxNlDrI3dnLH6VXRhPREHyiN6kG/1Z2KbK8+uistUtE3n?=
 =?us-ascii?Q?LzVi3t22u6+jtCQUGP7V63Xih9e0NynN3A=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704162011799003)(36860700016)(82310400026)(7416014)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 pv+TFKJYq3q4Mv8AWUit1lHt8X+SjsK7bbvaiHgHjgPtXhpyu9Wa6VX9gLbyNr5OoXWxFwgQ4tc8NsR8REfpiE6izt0w1l3xpJdylN4erXxAGReK5o9JGvIvMCPRHrHjoTHfrKCCiaGePCTmf/Gn1R01Hrnk2cDfZwZXBhYCKFhqKlRWkeQVh2Zqi0tUju4SCaErHftN7BcKCxJJasGF+30JFpk7IRMuntIsuuU5KlQKQYn6vG/VqLreeQKLB7ir/cIbxyFzZ7UWPn7mwBlDyc/gnXcDvo8JJbbWPmCUI7jUz6T2Y/hjiXlvY/7XikxL8M4/YiWkIcHzIr4yfLxiGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR08MB10848
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.10.94];domain=CO1PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.10.94];domain=CO1PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	afd21eae-b6aa-48d5-9f50-08de9f239676
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704162011799003|82310400026|14060799003|35042699022|156008|36860700016|7416014|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WGUdG829WRMO8xzC/5r7NjsPfNa+/q4gGhKpG0KHHFl50080apUEOw4tVSkJ?=
 =?us-ascii?Q?ajlBuD0s60hsll9AswVUeSHLTyl0pApB3PdRI0n7ZkqmR6ATXsKz9LFKE23e?=
 =?us-ascii?Q?/tn/vDl00Kpjrhmad2/79L7Ud5u1pqznHiVcd5jLTJT7lkuaQXX6gY+lWvcW?=
 =?us-ascii?Q?7O3MHFGXUXE45JYS3F7xlQP4eX1URqd6PDpoQbPR2BHCNDQuzJMl0Va2xC72?=
 =?us-ascii?Q?ppr8Om7JmK6orlUjIfDINoS3EgT3SfqDNdqBUkuk7uRwfNgJZ1Oau+9UF3JX?=
 =?us-ascii?Q?+aBpOvmT+uHu8gCPZGElVpILcWDy69yW8t22ocGzq9T3RVqMD3dC7I9TcSMt?=
 =?us-ascii?Q?0YAtpas48EV6A6yPJSZ5JfYbbkcG0h4fTee0JhVL/pVIrYSICodh5YsNNTEI?=
 =?us-ascii?Q?bbNu2MK+3t646SH7Y7d562fYYJ7EG249jMdvio0Dmjgdp3EkUyOn1195mO3+?=
 =?us-ascii?Q?6N5qvxA+Aeqt5bQ9XpkCIMG2KQwXyrCwwIJu4fOuywTGg0o287YE1MeZQOfO?=
 =?us-ascii?Q?JXUOwT40Q4ezMUz2hEcjbtAGgybyO36NWHCBohb95Q4Cs09ndgCmhXFNp/ug?=
 =?us-ascii?Q?U6kG3mLp6XDxO+5ex4VPV8jCTrvG8Dg5BcparTn2NV4PI+Nd0lQkZ8t6W1Vt?=
 =?us-ascii?Q?T0fDisu3+lem+47Td1bGXUFaf8HqCLVbRVbABTnw+YUml2xR0tfxHF4IKBU5?=
 =?us-ascii?Q?s2mkWDH9v78nLcEnTxqzWo8x4neajBdc6MlxKsHPOBLCZRXJZW5b4zgnA98m?=
 =?us-ascii?Q?roaFTEcrYjDiNgEaIlD5X5cbzQzjwUtJWz0lawV4+T9Dk7KXc0Kek1K9/QfE?=
 =?us-ascii?Q?+fI5vEhrtth616NOmlXZ19kJj/E8h7sPmm02h38u6aOF/cTIF3Moei2SNayH?=
 =?us-ascii?Q?tZex8nc3AL7Nn9ug7jmXoFKTJOYMUWLN3RlF/eEI2qXYMlwH2MiBJCDa+Dj+?=
 =?us-ascii?Q?VF4BweLCc0rWlHQ29JaZAd8YUGDcC3v6qvoX4pXZfr4mJqlA6rDH3yIBrzZa?=
 =?us-ascii?Q?4COkp72162nQ4X3/woRWG/qV13dufKsDs/LcWJJrudiOPRqY3w1QusDd5WLq?=
 =?us-ascii?Q?SZtrJD7zXMmHplQOy2G8rxmEIy95M+2pcYeviwlsZxtEiWUnbbkfoMFvnbmp?=
 =?us-ascii?Q?ixjcP428KVZ4MpkBv7A1e+C79NkHpqqdYw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR07CU001.outbound.protection.outlook.com;PTR:mail-co1pr07cu00106.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704162011799003)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(7416014)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b5UanR2p00UfKCA6aaY9tFmf96UpwGCoxOr2tItpeAh9NvVc8czHXZSDhS5v52u8mqaeRjJY/nBCg8v+cym0AO/g1LdQNAbUMXTvjmJ2LEXW3KCby6lfdFrW25n/33ZuXqx+0n0t6JAShhRC+vmUkRgoFGXDfAvupVgVU8aINR+c/+InaNF//f/hc6u+30zNxEWg6zmdzPZhckZ3MkaO4h9HGCQdtrjM4P7MgRIXX9mOHfoZQwLJC1/dPrPND1w+kurmjT4SCnBJ0AN4fr41S+8+uxWiwM18LAf3pVhvEU4yJrl9000PkkMDsrJLBWyVVa+9bchIx2HYz5R/3jEaO/zMxLV+j3D945C09DtR2soJ1ahHrYEF4Cl18ayEHlcBybdbIOCpLQqUGY4uvM56ExQg/9hsFVW2TVq0x4HQFBcSus/KR2dTSmTCpyFsiHhx
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:21.4081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 256f584b-748e-4060-630e-08de9f239baa
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR08MB9498
X-purgate-ID: tlsNG-42698a/1776720459-0556BF3B-D9AF3AC8/0/0
X-purgate-type: clean
X-purgate-size: 26338
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:Aqib.Javaid@elektrobit.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.920];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 3703B43405C
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


