Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJkMFKWb5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B1F434235
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287793.1568224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwF2-0002ZE-VE; Mon, 20 Apr 2026 21:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287793.1568224; Mon, 20 Apr 2026 21:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwF2-0002Td-NB; Mon, 20 Apr 2026 21:33:16 +0000
Received: by outflank-mailman (input) for mailman id 1287793;
 Mon, 20 Apr 2026 21:33:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwEz-0001uU-Nt
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwEz-0054Hn-4x
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:13 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b34-5cb7-0a2a0a5109dd-0a2a450c9236-40
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:13 +0200
Received: from [40.93.201.80]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b97-62f1-0a2a450c0019-285dc950253f-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:12 +0200
Received: from SJ0PR03CA0038.namprd03.prod.outlook.com (2603:10b6:a03:33e::13)
 by DS0PR08MB11092.namprd08.prod.outlook.com (2603:10b6:8:301::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.30; Mon, 20 Apr
 2026 21:33:07 +0000
Received: from CO1PEPF00012E7E.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::cd) by SJ0PR03CA0038.outlook.office365.com
 (2603:10b6:a03:33e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:06 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CO1PEPF00012E7E.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:06 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHQ2fmgz1wdV; 
 Mon, 20 Apr 2026 14:33:06 -0700 (PDT)
Received: from BL0PR07CU001.outbound.protection.outlook.com
 (mail-bl0pr07cu00104.outbound.protection.outlook.com [40.93.4.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:05 -0700 (PDT)
Received: from BY1P220CA0047.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::9)
 by BLAPR08MB6852.namprd08.prod.outlook.com (2603:10b6:208:331::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:02 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:59e:cafe::c6) by BY1P220CA0047.outlook.office365.com
 (2603:10b6:a03:59e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:02 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:02 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:56 +0200
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
 b=MlNWI5nNE3RE6aKNHeg/geAHl/M/5+jk0szZEvpHN/4IBg9VhgjGj51PjooPA7smhynqT5OL0SIBFY1r/V4KZtxWCcT2Kp9Hnagwp8LnaLZD3eFU25NvAWKmE90Y+OndLPtH+n6KDE7yKScVCUYnC5hc9a6Da/IM6rJ5VBWq/9108ZOjcfE/kSuauPHI9S5bmMANWLxW4LuVA1pWyP5JyftbK03KK42/xVDnw0WW2i5h3fa2COj1k0eL4A1hHqUyd/ekaPju6Qd92B7SvMq4LyWMtKRQwVTcouAz36nHTeerIiim6p/+8ZiRfLns/LgwsMNmA3Ifuul1+YtZXPhTWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHidNjasS/JOgBnj6tsz69bwCge0ojtPt0VVEzO0kMs=;
 b=Jw9lXaRLkg+1af7OOooanJO5wZVFgf2qHFqeFZeBXX+doLNv3NV+qdphEJXi8KldzQpejlU7AoHaElTjwk+Jfr7037eI5efZDecdtpUhBIg1ndMkOCAUpMaNuqT7Fwzz1ZgJdfbrYj3rQksf8Doy71ux5vUASflrGL1/jIxSocxPZiH+rErVT7EAy9MFgHlEUmsk8ViSsVi131WwuOqslSR1smMouJM+NIV22zvasr9XR0/NR46HqIDp+iSL5c8xiIpAPAAoxJ46bj+Xbgml3KNdOIi1wRFYL8JroCGkbnsk5z+ZOIxcxaRxitFIOYyVHMa9hFaJH7PaFhEjrP7xZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.4.4) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=elektrobit.com;
 dkim=pass (signature was verified) header.d=elektrobit.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHidNjasS/JOgBnj6tsz69bwCge0ojtPt0VVEzO0kMs=;
 b=uSJH5wr0uloETPFnd9gFrSm31d+hspPeWODJ52Vmps04HX1MYvYdOp4uB3C10ElHTC0IE3V1wJxYzvT4YLHC3uSKTOj4u2d+zT9xk380Fv2fRjAvu2Tw1Ry2xAlTC8jVErttOJsfTrZwjdC0QMhIaE1v7GrnoTO0m6/BMQ92kuI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.4.4)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.4.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.4.4; helo=BL0PR07CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpEZrF+2GDJOzKRjO14OL6Wwue0haqy/vx99vrUTXG7xgyl82OHNfe8xZ2qVWuSqAXxgvDMlTtJ0T4KNPoNnQA2YvmWNQrMb++V3t75G3EwZ70MaeVOg8Hgxqx9OPEWIrliy6BR1sLczNsRch1KXRRNDyLhQc3bHepnWH3ujinj5GNJXQaiGz2TnbF1nRw3EglB4WUr3d56h9+Y2///iintGnaqKRBU8Vaxu3ifmjHLP85SYDxMMLwxKfTF5NUoawj16n0y2CoQqKBe5iCT6wsKY1/Zw1N+mhCaPhDBS7BZ2PXBH664P8b1TI3nm6rOjD1k24r2HD8shr5Vu82Ullw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHidNjasS/JOgBnj6tsz69bwCge0ojtPt0VVEzO0kMs=;
 b=wTVlZNkUgQnibDEvrzMvcqhNvxmjKyE5EYSMalNJ2W21UBNRUtcCrAOQU8u6y252uP6YQ9pgSCKmbn7NoStntIEY775YAqbx1qM3hq033CBcAfRlsEFb7KhWA7KnHWGdo76SxEwbX/KwqN/WuCAXiX31As/z5XH4ZTrp8iTCnCc4n9bVQv6uk4qXr8Ldmn3oDY3cz/X9ALikFKSYSBMxTvf/9exTufyTN4k+DJWEQ8yNRzjYoRaR8ieQ04IJTYuvnwTk0MTAqbCvBLBI5EfWbIxk46e/Ex/l90HkJwLiRJ40mlT/mGr1ugMC/dkW9UW8jEgNduQXYuL3bFVTvW+9Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHidNjasS/JOgBnj6tsz69bwCge0ojtPt0VVEzO0kMs=;
 b=uSJH5wr0uloETPFnd9gFrSm31d+hspPeWODJ52Vmps04HX1MYvYdOp4uB3C10ElHTC0IE3V1wJxYzvT4YLHC3uSKTOj4u2d+zT9xk380Fv2fRjAvu2Tw1Ry2xAlTC8jVErttOJsfTrZwjdC0QMhIaE1v7GrnoTO0m6/BMQ92kuI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Sergej Proskurin <proskurin@sec.in.tum.de>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v6 20/43] arm/p2m: Rename parameter in p2m_alloc_vmid
Date: Mon, 20 Apr 2026 17:31:43 -0400
Message-ID: <20260420213206.208750-21-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C8:EE_|BLAPR08MB6852:EE_|CO1PEPF00012E7E:EE_|DS0PR08MB11092:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ed352c2-cd49-4ded-825c-08de9f24693b
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?RV3itJdLwC+xtypdeFrwPBWWZMPj7x3cbDrt701fT+k/V3PMLXclRkBtv0/A?=
 =?us-ascii?Q?OecuaNc7zFRd5ER0pwiqbGRr4KbPS34dDB85lIF77Nv4DakurWXXm7dQ9Klv?=
 =?us-ascii?Q?cPWcqzy0tuQQEVgNTKuo0cv6fpLWmpUnKIwVcxZ09wPWGKJYREqBItOiuTP/?=
 =?us-ascii?Q?aemFPe1TSWUwJjbAlnaOlVjajFOYvY64s/IeHX++Fzux8UMqQS6NaKeJZsce?=
 =?us-ascii?Q?EaVZ+wsMKSCe3OwVeYrwDIft3SX/Up+PkuZFFZKSDo9soqw40v3/uJo716GP?=
 =?us-ascii?Q?LDhOnNJhrrk9tNIiqeBZDMvEZmdyrxIsETlqgFXyIfkV4hU59z0oDNQA44WJ?=
 =?us-ascii?Q?ugU1sewJYh9H/TbWdqWihw93KeMxcmN7Fl2ZgNo1D2GzECDhQDA9KXAs1dZY?=
 =?us-ascii?Q?K8VDuzlr3+FyhDJfKm35GgfC0/7QxEehDMJVta4Q26WKFUBbvh+zV8mnUFXR?=
 =?us-ascii?Q?uQtLgQIKzayllWcF5JcwoUrtsdlF7Zy+l3gzdXZ8VQ09VEyumm0faXdXOob5?=
 =?us-ascii?Q?WoPqOIWh3bff4ZG6n8Sm2bXFyrqZsxHGZhVHBgHRmv6r92eNRMh+38eJ6NJA?=
 =?us-ascii?Q?LKG6JJXuhxBzytiY4gMw3SZvB784zNlXgGSp5BtQwUCcjgNri/KwkK3ZEDmU?=
 =?us-ascii?Q?sSJ1v3kW3cQxDB/yZOwv6dNgPZxkDhyPCU0p0jFLSopN8SLUPYZfUH5OCGEr?=
 =?us-ascii?Q?s1IAy9AXs3YBfUS++yBrvxEOxTyBmravA8WvSeF2tfMefhinJHLcCLr4STNv?=
 =?us-ascii?Q?CWt3R/rXdQ6S2YYjIVKDqK5k/vl1rYg4m2TFq1oJBJT58T0xlR0Usbm0s4h0?=
 =?us-ascii?Q?KwyxrPj9wZUAg77BXN+HE3/vgSKeQwkKskeM+7Dw2rnDbZXeFzdZN5ud2y+H?=
 =?us-ascii?Q?hB3v//1GomnA5EtOL7vovKgoXzWXXvzO6k1xF6mUgQ7y7eqAtXWH4yqnpXC1?=
 =?us-ascii?Q?dBl/BIou7JjBXxiNhbPPuy7VMwmLRqtK2v5SH1V+TBdkaZqbtqzQRO5xcA1z?=
 =?us-ascii?Q?G+pXYOk/5nXDYw9Bc4z61hRasMMMqqvSingQ/ebuBDo4Z6YdzBG1LMYCQhz2?=
 =?us-ascii?Q?crrN6kICDw3ftYGqQe2ReOZUJ/T9wo7GHCubliyImNwY+jVCH5w3PUSU2RrB?=
 =?us-ascii?Q?ptEMqMX0YJLuLqHVx4pvrGEnsv+Aoakrnv9dSx2BQmCv/E9AL7fOqKm1XTxD?=
 =?us-ascii?Q?tl+0SZvhxOp/h6xWgFTravg7+XVHLVdVa5TdGiNe4WGYoJ5Kcq5UWbaZw4Q1?=
 =?us-ascii?Q?hEqn4/31AZfi/tmsRTnrsD0RqLoa6etdthPfjxpFmw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 cFNub0Cp2Gu7LAkWsjBdyPEE8JRLYR3KV6eAuL3gsXHhxML3WOZuN9ZckSZZfXn38ufk4L4wFloL/TIreH52aDm+zlUYXIj/gPdf+MYbRzpaxJ/7jZlbHc6HrLvqo7zzIdRqN61ywK0hEP7HR1hGHROqmVGPQ72p6BITI/fO0YZtrImHn6IlCSS2JM+agbe/OoWdRgKF//SdByApV4RZKPXFtn8Adrm0IaL0da7mj6w2FnKnaHCKBlJM1gOuGPzYAK+20yPtGkWwIfqiU7MLcQehJXrwP1Hn45jxrdu5XU9MIMTQtNxy3EFmjaZlvm6iemhsEEerx2pLDWiu9quiBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR08MB6852
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.4.4];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.4.4];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CO1PEPF00012E7E.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f11dc2a4-5827-49f6-a9ab-08de9f2466b9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|35042699022|156008|14060799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qog8p/QUADAZt4oqzKBsBtZ1uVUg94eZSJTF3IpyMK0GPaIQjBLtiXkCcHEH?=
 =?us-ascii?Q?uwcDL5KWema4LU4oo3M8LZBX6ilMqTuQpjvkErEyTd9PR6uQTxCImOSwmPmA?=
 =?us-ascii?Q?Bzh6dpdOEa6WVNaLipYOHyCXGwYDkAV9ZZCUG6kVNoQknEi3pzKSjND5OO3X?=
 =?us-ascii?Q?xnZFZjtb7OjimD+jHwpurf+pxBZjfeGMk5OuTzsfzViLx5diDm4v3apGtdMi?=
 =?us-ascii?Q?4HXClCWIq1A0m0N0yIXomhgUlld6t2b6vezmpG6XP4NTNgsu+46q8Fluf0S1?=
 =?us-ascii?Q?2X7fzv8zlvVyma/ML+5XemZTS/w7ZQ8jIuiSO5+6WX31V1f+BpeB7i2FjjZr?=
 =?us-ascii?Q?EMlZkf+CS4p3HYNxjwHgubto24tKa73yOMhNAfhA+TOwdaJ8X7KZRgrJ6qCp?=
 =?us-ascii?Q?9CU2wNJnj6Fz2JaWx6b0hZGtXQNkqGigbB4yCTIesKpX32XE1la1VOQ9tGk1?=
 =?us-ascii?Q?nEQy7Eei89bhSYGNqwB9PI0LU0RqSCr4IJL/FYTuL8mBhlP4jXyxlTIHWJVd?=
 =?us-ascii?Q?w6VGFN9tVGjGo9T2PfdcZqXO3n0hFlWPY9CnbxzaBjZNhH2E8l39/yZanfk3?=
 =?us-ascii?Q?W0NixZUQNe0wqlwUsShWOXcqfx64hU7wOYC1ZK252V/MtimRBtRTlPXbscXi?=
 =?us-ascii?Q?tA/liwjzj4GGGTjqhcBYyWybeKf0J9juZF2V4lMqFzrhtCFB5MMnMvrtQZNR?=
 =?us-ascii?Q?yfTLHlmthBf9EbNJU5LpMPs/CvZ3qY8+mDCBtkeSKhZ12VidFCsdcjbNThhR?=
 =?us-ascii?Q?Dy0vJOBWLABcEnHo2WL5K8SbqdYKa+vzO8dP35/fiMcDTILJQ1BxXHPDsalZ?=
 =?us-ascii?Q?l6Obv9Wxv5otQQIcHYRXiHWyMg2xMMxiLqMY5WdegSHoPDvweWb8Mnw34nrb?=
 =?us-ascii?Q?Jbg6YZ5H+nh8p+TZEBAzJu6OvbCzsJeS4zaSDra/AVaJrLnjJn6i/Lakiyhh?=
 =?us-ascii?Q?JuM85QwP6Y+VGiZJDsflUqkW+G3GPyKXc6sXm/jmdAytWax9L3cWvOTG7nUJ?=
 =?us-ascii?Q?lvN1AvlM6nYsywEyBcrD5tLuh/83IDXUmOUb2eUv6/mmvhcqbuh4pTA9v202?=
 =?us-ascii?Q?haRAzTZvgj3TMoOiq1hDpNAPpHHeyTaFEr8LqxEnK0c9QCVId8vMeYHVZxqH?=
 =?us-ascii?Q?hU7AwiPsnxNLVbnbMGvZ0z0VqmnnhAPh+mf1z91Z+zZF7dVfX9WANkK1ZBp5?=
 =?us-ascii?Q?Z5O2b7sA8hXfPH90QYxZBHYuDhTbb+elq+NHRUyXbCJ/BlSowzTc4qOT5UcQ?=
 =?us-ascii?Q?HAYqQeUv93dJrZV6y6I22GPJ9C51fv57g6hXqBLzjA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR07CU001.outbound.protection.outlook.com;PTR:mail-bl0pr07cu00104.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(35042699022)(156008)(14060799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8KgcZSACfPd7weUTJxqfV2C/MBSRX64PZUhHEWZp4k2oW30eo5D0EO1i1VKbWBG4Ca78tbCbLlV7gR+HXPUQDJ4F2erP2XYrC/BLbra2owj01dHh08YYIWFLHta5z8dmJ47h4GlAHRJXg9yjxoDsU83pA2AqaqlN/9MWKidV9Z0K8ibiqPNaN5SwVIp99wzpey4xqakGXL//nBU9ep7oVDQIvOYdDWaHiWg5Mnl0NZA6SW0+JuF5XwOf5apyB9tl4KSzBEakexfOmlMhiITNkidhWYcLD0eC9NE3XJAHf7uGLbvtBtBgadZFX9Yc7+W0T9km8r0PgeZd4G1lMHPpiiwB8le6LmcIXBOJ/Mx2+RYgWwzpWG1iGyZ9Wk765La03GP4B7COsh8HYQDGp3PooEbB4rv/RCUjNPz0tYmuROFH/Di09HtHok+bZ8z6w8Zt
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:06.5405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed352c2-cd49-4ded-825c-08de9f24693b
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E7E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR08MB11092
X-purgate-ID: tlsNG-d25034/1776720793-6E577CF5-6076433C/0/0
X-purgate-type: clean
X-purgate-size: 1341
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:proskurin@sec.in.tum.de,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.244];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: A7B1F434235
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sergej Proskurin <proskurin@sec.in.tum.de>

This commit does not change or introduce any additional functionality
but rather is a part of the following commit that alters the
functionality of the function "p2m_alloc_vmid".

This is commit 9/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
 xen/arch/arm/p2m.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index fb03978a19af..2c43b6033360 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -286,24 +286,24 @@ int p2m_alloc_vmid(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
-    int rc, nr;
+    int rc, vmid;
 
     spin_lock(&vmid_alloc_lock);
 
-    nr = find_first_zero_bit(vmid_mask, MAX_VMID);
+    vmid = find_first_zero_bit(vmid_mask, MAX_VMID);
 
-    ASSERT(nr != INVALID_VMID);
+    ASSERT(vmid != INVALID_VMID);
 
-    if ( nr == MAX_VMID )
+    if ( vmid == MAX_VMID )
     {
         rc = -EBUSY;
         printk(XENLOG_ERR "p2m.c: dom%d: VMID pool exhausted\n", d->domain_id);
         goto out;
     }
 
-    set_bit(nr, vmid_mask);
+    set_bit(vmid, vmid_mask);
 
-    p2m->vmid = nr;
+    p2m->vmid = vmid;
 
     rc = 0;
 
-- 
2.34.1


