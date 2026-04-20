Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DDpDHuc5ml8ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:36:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5929C4343CD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288129.1568459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwIT-0001Q9-DJ; Mon, 20 Apr 2026 21:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288129.1568459; Mon, 20 Apr 2026 21:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwIT-0001OY-AC; Mon, 20 Apr 2026 21:36:49 +0000
Received: by outflank-mailman (input) for mailman id 1288129;
 Mon, 20 Apr 2026 21:36:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwIR-0001OK-Nm
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:36:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwIR-00CCkp-4P
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:36:47 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69c66-e002-0a2a0a5209dd-0a2a4502c436-4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:36:47 +0200
Received: from [52.101.62.143]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b7d-af86-0a2a45020019-34653e8fe92e-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:32:46 +0200
Received: from SJ0PR13CA0043.namprd13.prod.outlook.com (2603:10b6:a03:2c2::18)
 by DM6PR08MB6426.namprd08.prod.outlook.com (2603:10b6:5:1ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:32:37 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::b4) by SJ0PR13CA0043.outlook.office365.com
 (2603:10b6:a03:2c2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:37 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:32:37 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzGr6yj3z1wdP; 
 Mon, 20 Apr 2026 14:32:36 -0700 (PDT)
Received: from DM2PR04CU003.outbound.protection.outlook.com
 (mail-dm2pr04cu00301.outbound.protection.outlook.com [40.93.13.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:32:36 -0700 (PDT)
Received: from SJ0PR13CA0194.namprd13.prod.outlook.com (2603:10b6:a03:2c3::19)
 by MWHPR08MB9870.namprd08.prod.outlook.com (2603:10b6:303:27b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:32:30 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::37) by SJ0PR13CA0194.outlook.office365.com
 (2603:10b6:a03:2c3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:30 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:30 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:27 +0200
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
 b=joy9Ml+wBC/3JXP0D1STNGjUJuIev05TFrpO5oaqV0ckBiZpnS+NDsPWTN8q0Kd1zdLGaaWwcRY7Jecu06wXBiHveOkQJq0OmOPdS+Jvb50WLr7+11/pLtMB1sDkrO+Ax9LABDBg6wjHxzvnCcOaCIZ8FL5wpibS+3ChbKybr2RwYrNYRf4D0NC5nmfxJ5XV4ixu75bhsSH4T7zAl/rbUNEe6uw8UJ7YCEUwb39KgjBuEYPfGm3th1Qey6IBNQoyNQFPE0VU3LeXC5q4WNx4j0gvJ28zOpv6mNl1fpQFVJ3eKV/GcmRHzq+SngUrg8kiwyjybMrcfxqkh9iHoNUoiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmKInt9aDaXWoQsf+7PgzNCnu/gQkWKtbvxoqa67GlM=;
 b=ErxZwqq5x+P4BoHkqhO3PUGmL6oUc0a1JGKqVDJBATnEHZQrarlWdLrdSK0JjJ78DdQD9AGN8HwvGvW6iHyB9Or021DXacSf23a/PGXqJdnOeS81TTfsWKG/UdAJT5cPZVvQA9FgWtbW3hUYmXsOvxUgvHIZ/jR7lgm4OSSdDaUUwt15ahkbrVx+CpSR7amvbnlPy4GsqNDa92gvuOPdHwNjvqESHzlMjHwGqbJi1Pfph/JJZwhpz+L5N6h+d5acuHX/D2S5lHwTVuQ9tmH/rsg3sHQsKugIQx/pfwlfovUtbxYQ4AH2P1yT2ZVwmcuH6dkd72lBajvG1vKSraoIhQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.13.57) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmKInt9aDaXWoQsf+7PgzNCnu/gQkWKtbvxoqa67GlM=;
 b=zSBGDKwvLDT9C2izIOabWk6JCX+QMDn5E/UApmtRHrlWnbnHLoMJzmV9dc0iXfQyJMIam6VPv9QWwXTK1P2vnAOBxhWaUz0FIcWM+GJuZdyzJ64WvxGkbnlTcVc0724E6xyG5mFyRClLXBs1FG/oaOTBqkRrp+0OGWFNkaKY3KU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.13.57)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.13.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.13.57; helo=DM2PR04CU003.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8u5VdPmhdocQulIx5cWf+JokJZcsxJLfulnl6ZE7bMyJmsDdsoCBbxnhMjjro58DG71uqP35B8WPF5N/gPyo25CXpj1mGDiluZIG3zjTO5JC2IscVBfNW/Gq9SugqfChWkpRq/m3p+X4gP9PYLVHu3xfKoYCpSqiXiTXdG6mwNFN9Mdqn7IBTPx8PQ/2gxwvoqGf9OZuTi2PQ6qZGv5NwENj+TZloEeyuJTE2IXZjp98ZxJq08BI6ogE7/wPMC6DK8GrGrms35F4wS98OcL7UyI5QFcjHh/qIQJD/1SCN5EWs3b1UJ1rCKHqMoaYPX+z376fQCH+v7YuBTvegvuGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmKInt9aDaXWoQsf+7PgzNCnu/gQkWKtbvxoqa67GlM=;
 b=COKLM0E/XxgYwosjbAAE/JTFqwnPMU+fS8oJ9N79Z3Upr0/9AHPHqseOOwsyQ03VZl/TBrVvtjZ6taRAY0AvuYcb4QDr7cqoPqF8bSBudbJ9z5/G5p5TxXFKCFp+CyfZuU+6fgE/twx2pZKa1SK3RKut79MrQlwOWEkD9jXwjGzGIHA1J/JiJHzXArK7LngshnMw3ud1xR9qeB0AlscNpqA8VXtyKtKQlT7JtFFEnl8hg1K0ri65YJtr0Hsuw1SLDRznMs4UQskGylboFf4kmvFc1ig4iypHgF0YzRLnboGcn6isPgTdHgCt36ZtlzA4ypkJV9hER15cr0b67y0SYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmKInt9aDaXWoQsf+7PgzNCnu/gQkWKtbvxoqa67GlM=;
 b=zSBGDKwvLDT9C2izIOabWk6JCX+QMDn5E/UApmtRHrlWnbnHLoMJzmV9dc0iXfQyJMIam6VPv9QWwXTK1P2vnAOBxhWaUz0FIcWM+GJuZdyzJ64WvxGkbnlTcVc0724E6xyG5mFyRClLXBs1FG/oaOTBqkRrp+0OGWFNkaKY3KU=
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
 Stabellini" <sstabellini@kernel.org>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [RFC PATCH v6 02/43] altp2m: Move altp2m_active to common domain struct
Date: Mon, 20 Apr 2026 17:31:25 -0400
Message-ID: <20260420213206.208750-3-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C7:EE_|MWHPR08MB9870:EE_|CO1PEPF000066E8:EE_|DM6PR08MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: fb8d7ef4-3707-4691-3a00-08de9f2457bd
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704162011799003|82310400026|7416014|36860700016|376014|1800799024|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?jqwX9pureH6+tVenENjCXs7vHU2VMVFkm/0eQuGmUNNi3g67P6yDamWNNnEp?=
 =?us-ascii?Q?FyDlqdRqHhREzIMqug4YNbrIaBmo0V3AX3ppzUXUknohYO4UJl/DnMBOy1dQ?=
 =?us-ascii?Q?EpBYC57/TQrcpE8iXEHjbXocIiS/ihvbvi7eHAlz1jSNHgTQgF7RTOjardPw?=
 =?us-ascii?Q?ZadEfybIYExajh2MicvB4z7ZptwoXiC+PH+kJXnh1KZIKfw1M55A3rJJbUBW?=
 =?us-ascii?Q?HFzxxWn45knwSzFzpkTIc3W+zxTJMp7zASHa99JVMStFm7dnxK6oYXzKlcOU?=
 =?us-ascii?Q?do5rJVjIy0JTIoC2V6rCNegFoujOoSv27qgLItM0sAPDm8v0R+orhPChnWKS?=
 =?us-ascii?Q?byG9rnmk/zO/Yh0wS4IUXHzLvHRcplvf1tYq/KyubILgG7tb5uNLv/gM8T7g?=
 =?us-ascii?Q?NR4k1ftZF85fUu12MtS2KJbABgY1W3kBLqZ4bPlaHTCdf1dfXO2FmNEOdcHP?=
 =?us-ascii?Q?ARmS5QxH15luEB07kXMNeyugOZB7/iPyNyxyXXbOfLrUp3iq/MPAgl2NYpn2?=
 =?us-ascii?Q?xbSDJKuQ56MLbtLZ3cP3pYHYkb8p/yPmyvv00enaz+PxrGhbxVsvHiOS7+v0?=
 =?us-ascii?Q?LqeGKnXjJqQf6XpRWmc0TND0JIjpOCN0nL0E3JwrgV6w+VJxzT+eUROglhCV?=
 =?us-ascii?Q?u78EabYALZ1eVIL8VqkchVDE06pgRe3D7iTr4dMV3g9cB47JDgiKY5wnVnpS?=
 =?us-ascii?Q?aO/cQnHKT8avAi3fNiaVBVYtoxzFIUuCitOpNQkwU5Zi5B8+29h9ZUJpKyXe?=
 =?us-ascii?Q?BqBjeLNDrYDnfgYLr3slfItjaz8XtRdhr5VpbpdUy8jAtPFgXE4Q8tB9af7N?=
 =?us-ascii?Q?vvR5Ua/a0GPvNgwRk7khqSrZVgscTI4TolXRy6c1dln5QYD+WenYNgAkfd3O?=
 =?us-ascii?Q?pqWfwoRKtctnQ0chgZY7uBPnP0QKdU+o+OjPawm847/V2gPw7AVeDS47stKm?=
 =?us-ascii?Q?O0x8MnlzVUVSIhVupE+G62Bziotm5O0ImgIHyHShzKDRuOCcHVNb+cdLaoVB?=
 =?us-ascii?Q?vLLLSY7JfoihRbWxwv2cQi/mkwPuLUN4FPZ7B68aMUy6I8LDv/TzjjAGLznr?=
 =?us-ascii?Q?Yy7c4IY9krzY8LNWTA2TB9vHkBCpuprMVQdpQ0bG4gYlvpe2qKadvtMmpD1G?=
 =?us-ascii?Q?EPfaSWTyH9oDJ0mDZF8HuYXW4lFAc91/IA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704162011799003)(82310400026)(7416014)(36860700016)(376014)(1800799024)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 dSVXv+ePpA9GTQcN4WQSWQ6dxdgw9b9pQds+7Y5uO8Sl14w7hCQxO3HFMGzCKHrswMrAQAAVUT+BuCDkkOGOVFLQ00ClnT/IPG/HCP2f/4r58b1zpWgi190pg1BG3Xw68/4f3zY+PzuxV60DBT+2cfueOEBbgm0Rp7D+xDbVseHySzUqvzqWte2LYGR/uPqK1sfIkSR/EHqpSqYnL/5zBI2S/fsurUYLtetuguT2C/xW/wGiRyRk6wxHuBLspAoWU54AK8/kwCDptCplBhu4yMyrDtAyJXNidMj8Gpw9HJlUaKF6gw1AXD6sSLSgzmBW2pQuAO25ERGU6AUwviumvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR08MB9870
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.13.57];domain=DM2PR04CU003.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.13.57];domain=DM2PR04CU003.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	30512a0b-7569-46a6-ab62-08de9f2453c9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704162011799003|7416014|376014|36860700016|1800799024|82310400026|14060799003|35042699022|156008|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ty8qVqOhnrrL1Mt2A+ONKTU002Ivirb5Y/iCfzdg8HTbgfyvz88+rhIfFWuO?=
 =?us-ascii?Q?xOUwj1RJcixQX8gb1N/w+3XTuY4PzhyWEZXXM06OxJEnoMCaqyz4eOj9G/7Z?=
 =?us-ascii?Q?kcp4w7YPBopFuvYOwIxQ6pNVMen8Pz1mAMgf9/OymwnNVoSb4HCMULPes2fn?=
 =?us-ascii?Q?wbI8u0mdTpBMgLf0CcD3ButpyPE75Z6jonNpgrgA9jT4P5djMkMqOCp67gyJ?=
 =?us-ascii?Q?kWT8UFAc5f+TxU0WSptjSl09gSXM8Cm5dW+n99LkfaU5aCRy30cGVMyq5rFf?=
 =?us-ascii?Q?eHq8vY6ScY57qai8216R6PxWAi3RIFpY0Nt6H1JuVwdgYDnL6m8MUbQq1tiS?=
 =?us-ascii?Q?ZagASqtqwpvsx2hJkLhpnLBbSI/gTHQuLSIiHNeq2Ch7pmA2p2XJOsr+kXZw?=
 =?us-ascii?Q?9puWO1LuxoUmnChoHOtyg7tKcklOGJgAjWB+oIN98ccF7rWh8gBIjuhsIB6v?=
 =?us-ascii?Q?GbxvGTTd6IjX4/auHsqL9LHReQXxLeY1q6Ho0VIOTL8fSau4c2gfArU/WAPg?=
 =?us-ascii?Q?u+ZilEdAk8+wsyyDBrUruQcXzcvLb1KAbVYlZvI/ZBqbGONCM5wEn6OMLUAw?=
 =?us-ascii?Q?YE4f1YFQEKATQzGgcptNWWl80MnVTqkh8MRX/RVIc9Cdye6DuAsfaUMorn6A?=
 =?us-ascii?Q?hMsI8GjaTlpF8kpZpFPCWS8OPCjhgs/7kUqMD+NXuKP7mJuFBHNmdRJZjUnh?=
 =?us-ascii?Q?8fngeDvkDSNgHzH8KDZKu4bZsbFfAyZHiCowQ/0a8BHsR6DE6c7aL6kBAEkv?=
 =?us-ascii?Q?YJgarjAgizZ8mgs9rtH9wRKvrGbz+7bYcNSEXEW4aNynfwWWsFKjvcCckcUY?=
 =?us-ascii?Q?Qp2m2Wyn8aybp3wcjs1WN5b8Sm9jj/oAJlaJBeBd9+MAKp/veuOVmF6l4E7j?=
 =?us-ascii?Q?cflGizD/xPzhLS7yy2gznwDDAoiMH/Fbtnp+JySK3SR6N6882vyKCpWtiE8F?=
 =?us-ascii?Q?sfbhfTJxiWvBL2wjA7XxVOjY+09WIEKk6bVuUkNpcOyYFj51fiz3aXU9VT0W?=
 =?us-ascii?Q?7yrV0MLYkjtwXgCJEN+hFl23ww91eZMPZvLXo7zb230f7I7lpD7zMnwpJqhO?=
 =?us-ascii?Q?LciRna7lm8fkDwKkf1B/ATUU6kcXuUwRutBCcchsVW4WQKwZ62sZPEdQHUn7?=
 =?us-ascii?Q?21dxfOdofGxwgh9B/SKIshEjXj91qLoKCg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM2PR04CU003.outbound.protection.outlook.com;PTR:mail-dm2pr04cu00301.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704162011799003)(7416014)(376014)(36860700016)(1800799024)(82310400026)(14060799003)(35042699022)(156008)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F4zSkkuHk76QwE6+csRaEcYn+UuZlzlR9D+agYinRRCD0s6T6yCpLPKXxuN4HnlfnT3zEs+tQWhCfhrY/RmsnAPTh5S4NfKZHvNubMk8tu7hjV/HcYisoOT0FJjbj3rK0zG7b/p3q4HqcVULkZtpkOeDbeXYZDe84mMVyniPwbeT1p1rk7MfrKDotvyWPFSDw5NVTqIKdSmuLh9IRSk+opb+uVlNqVI404OANJQN5zMuwSv6Ig49F1MUOWglAGmdhpbYfHv/1CDLLxGDWsliUT2PZwliCm0fw9YdCmD1HJFjqOlrCYAkyZ1fbSyjk/m6sCs/9A/mq5AFLyVeYUfW/Go0t8Ux/IF+PhfVGwfNH6ZwXOlYGVVAJcwDqCO4wCrH/PvHvilsEno4QP/NukxGUWeowWDTzt8aY0hX4cCUNXOi6sKUPaMzl/JzSNuHeXBQ
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:32:37.1935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb8d7ef4-3707-4691-3a00-08de9f2457bd
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB6426
X-purgate-ID: tlsNG-720697/1776720766-83F66161-4A065D13/0/0
X-purgate-type: clean
X-purgate-size: 10620
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tamas@tklengyel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.830];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5929C4343CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit moves altp2m_active from arch_domain on x86 to the common
domain struct. Similarly to nr_altp2m, this is not an arch-specific value.
Moving it to common code allows the common altp2m routines introduced later
in this patch series to operate on altp2m_active without needing an
altp2m_active member on arch_domain for each architecture supporting
altp2m.

This is commit 2/8 of the preparation phase.

This commit is a refactor, and no change in functionality is intended.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/hvm/emulate.c        |  1 +
 xen/arch/x86/hvm/hvm.c            | 11 ++++++-----
 xen/arch/x86/hvm/monitor.c        |  1 +
 xen/arch/x86/hvm/vmx/vmx.c        |  1 +
 xen/arch/x86/include/asm/altp2m.h | 11 -----------
 xen/arch/x86/include/asm/domain.h |  2 --
 xen/arch/x86/mm/altp2m.c          |  1 +
 xen/arch/x86/mm/hap/hap.c         |  5 +++--
 xen/arch/x86/mm/mem_access.c      |  1 +
 xen/arch/x86/mm/mem_sharing.c     |  1 +
 xen/arch/x86/mm/p2m-ept.c         |  1 +
 xen/arch/x86/mm/p2m-pt.c          |  1 +
 xen/arch/x86/mm/p2m.c             |  1 +
 xen/common/monitor.c              |  1 +
 xen/include/asm-generic/altp2m.h  |  8 --------
 xen/include/xen/altp2m.h          | 19 +++++++++++++++++++
 xen/include/xen/sched.h           |  2 ++
 17 files changed, 40 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index f3aae158e9f8..9a9b89a232e6 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -9,6 +9,7 @@
  *    Keir Fraser <keir@xen.org>
  */
 
+#include <xen/altp2m.h>
 #include <xen/init.h>
 #include <xen/iocap.h>
 #include <xen/ioreq.h>
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4a81afce02e7..86c12c0d1ef4 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -7,6 +7,7 @@
  * Copyright (c) 2008, Citrix Systems, Inc.
  */
 
+#include <xen/altp2m.h>
 #include <xen/console.h>
 #include <xen/cpu.h>
 #include <xen/domain.h>
@@ -4612,7 +4613,7 @@ static int do_altp2m_op(
 
     if ( (a.cmd != HVMOP_altp2m_get_domain_state) &&
          (a.cmd != HVMOP_altp2m_set_domain_state) &&
-         !d->arch.altp2m_active )
+         !d->altp2m_active )
     {
         rc = -EOPNOTSUPP;
         goto out;
@@ -4657,11 +4658,11 @@ static int do_altp2m_op(
         if ( rc )
             break;
 
-        ostate = d->arch.altp2m_active;
-        d->arch.altp2m_active = !!a.u.domain_state.state;
+        ostate = d->altp2m_active;
+        d->altp2m_active = !!a.u.domain_state.state;
 
         /* If the alternate p2m state has changed, handle appropriately */
-        if ( d->arch.altp2m_active != ostate &&
+        if ( d->altp2m_active != ostate &&
              (ostate || !(rc = p2m_init_altp2m_by_id(d, 0))) )
         {
             for_each_vcpu( d, v )
@@ -4676,7 +4677,7 @@ static int do_altp2m_op(
                 p2m_flush_altp2m(d);
         }
         else if ( rc )
-            d->arch.altp2m_active = false;
+            d->altp2m_active = false;
 
         domain_unpause_except_self(d);
         break;
diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index d22a2e464460..84c1c2234ca9 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -22,6 +22,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/altp2m.h>
 #include <xen/vm_event.h>
 #include <xen/mem_access.h>
 #include <xen/monitor.h>
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 269ca5643346..ff895f7f9437 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2004, Intel Corporation.
  */
 
+#include <xen/altp2m.h>
 #include <xen/domain_page.h>
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index 9c1ac3cc2676..ad5ded833a75 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -28,12 +28,6 @@ static inline bool altp2m_is_eptp_valid(const struct domain *d,
         mfn_x(INVALID_MFN);
 }
 
-/* Alternate p2m HVM on/off per domain */
-static inline bool altp2m_active(const struct domain *d)
-{
-    return d->arch.altp2m_active;
-}
-
 static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
 {
     return vcpu_altp2m(v).p2midx;
@@ -64,11 +58,6 @@ static inline bool altp2m_is_eptp_valid(const struct domain *d,
     return false;
 }
 
-static inline bool altp2m_active(const struct domain *d)
-{
-    return false;
-}
-
 /* Only declaration is needed. DCE will optimise it out when linking. */
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
 void altp2m_vcpu_initialise(struct vcpu *v);
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 385a6666dafa..0cf0c0d92087 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -368,8 +368,6 @@ struct arch_domain
     mm_lock_t nested_p2m_lock;
 
 #ifdef CONFIG_ALTP2M
-    /* altp2m: allow multiple copies of host p2m */
-    bool altp2m_active;
     struct p2m_domain **altp2m_p2m;
     mm_lock_t altp2m_list_lock;
     uint64_t *altp2m_eptp;
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 0bc9b9ad2f52..08db8f37c1b1 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -8,6 +8,7 @@
 #include <asm/p2m.h>
 #include <asm/altp2m.h>
 #include <public/hvm/hvm_op.h>
+#include <xen/altp2m.h>
 #include <xen/event.h>
 #include <xen/xvmalloc.h>
 #include "mm-locks.h"
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 5ccb80bda5d3..3d563b3bc2d1 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -7,6 +7,7 @@
  * Parts of this code are Copyright (c) 2007 by XenSource Inc.
  */
 
+#include <xen/altp2m.h>
 #include <xen/types.h>
 #include <xen/mm.h>
 #include <xen/trace.h>
@@ -528,7 +529,7 @@ int hap_enable(struct domain *d, u32 mode)
                goto out;
         }
 
-        d->arch.altp2m_active = false;
+        d->altp2m_active = false;
     }
 #endif /* CONFIG_ALTP2M */
 
@@ -595,7 +596,7 @@ void hap_teardown(struct domain *d, bool *preempted)
             for_each_vcpu ( d, v )
                 altp2m_vcpu_disable_ve(v);
 
-        d->arch.altp2m_active = false;
+        d->altp2m_active = false;
 
         FREE_XENHEAP_PAGE(d->arch.altp2m_eptp);
         FREE_XENHEAP_PAGE(d->arch.altp2m_visible_eptp);
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index e55e53f44c78..a9d6b081a523 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -9,6 +9,7 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
 
+#include <xen/altp2m.h>
 #include <xen/guest_access.h> /* copy_from_guest() */
 #include <xen/mem_access.h>
 #include <xen/nospec.h>
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 5c7a0ff30e8b..8319733b1bb6 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -8,6 +8,7 @@
  * Copyright (c) 2009 Citrix Systems, Inc. (Grzegorz Milos)
  */
 
+#include <xen/altp2m.h>
 #include <xen/types.h>
 #include <xen/domain_page.h>
 #include <xen/event.h>
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index dfdbfa0afec8..ed850723f5fd 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2007, Intel Corporation.
  */
 
+#include <xen/altp2m.h>
 #include <xen/domain_page.h>
 #include <xen/sched.h>
 #include <public/hvm/dm_op.h>
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index 5a6ce2f8bc2e..17f38aac14d5 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -12,6 +12,7 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
 
+#include <xen/altp2m.h>
 #include <xen/vm_event.h>
 #include <xen/event.h>
 #include <xen/trace.h>
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index fddecdf978ec..41517765c5ec 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -11,6 +11,7 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
 
+#include <xen/altp2m.h>
 #include <xen/iommu.h>
 #include <xen/mem_access.h>
 #include <xen/vm_event.h>
diff --git a/xen/common/monitor.c b/xen/common/monitor.c
index d5c9ff1cbf8c..e758a3fea9f1 100644
--- a/xen/common/monitor.c
+++ b/xen/common/monitor.c
@@ -19,6 +19,7 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/altp2m.h>
 #include <xen/event.h>
 #include <xen/monitor.h>
 #include <xen/sched.h>
diff --git a/xen/include/asm-generic/altp2m.h b/xen/include/asm-generic/altp2m.h
index 39865a842ab3..ecee6942f4e8 100644
--- a/xen/include/asm-generic/altp2m.h
+++ b/xen/include/asm-generic/altp2m.h
@@ -4,16 +4,8 @@
 
 #include <xen/bug.h>
 
-struct domain;
 struct vcpu;
 
-/* Alternate p2m on/off per domain */
-static inline bool altp2m_active(const struct domain *d)
-{
-    /* Not implemented on GENERIC. */
-    return false;
-}
-
 /* Alternate p2m VCPU */
 static inline unsigned int altp2m_vcpu_idx(const struct vcpu *v)
 {
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index 520328fd3fa8..b3b21124dd7e 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -2,4 +2,23 @@
 #ifndef __XEN_ALTP2M_H__
 #define __XEN_ALTP2M_H__
 
+#include <xen/sched.h>
+
+#ifdef CONFIG_ALTP2M
+
+/* Alternate p2m HVM on/off per domain */
+static inline bool altp2m_active(const struct domain *d)
+{
+    return d->altp2m_active;
+}
+
+#else /* CONFIG_ALTP2M */
+
+static inline bool altp2m_active(const struct domain *d)
+{
+    return false;
+}
+
+#endif /* CONFIG_ALTP2M */
+
 #endif /* __XEN_ALTP2M_H__ */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 212c7d765c3e..458f2f260dd7 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -623,6 +623,8 @@ struct domain
     } monitor;
 
 #ifdef CONFIG_ALTP2M
+    /* altp2m: allow multiple copies of host p2m */
+    bool altp2m_active;
     unsigned int nr_altp2m;    /* Number of altp2m tables. */
 #endif
 
-- 
2.34.1


