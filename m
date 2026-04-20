Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGvjLnKa5mk1ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF6E4340D4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287562.1568049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwA3-0007Bs-Nl; Mon, 20 Apr 2026 21:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287562.1568049; Mon, 20 Apr 2026 21:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwA2-0006uN-FB; Mon, 20 Apr 2026 21:28:06 +0000
Received: by outflank-mailman (input) for mailman id 1287562;
 Mon, 20 Apr 2026 21:28:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9v-0005bY-8G
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9u-00CBn7-KI
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a45-e002-0a2a0a5209dd-0a2a450280e4-24
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:58 +0200
Received: from [40.93.194.79]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a5d-af86-0a2a45020019-285dc24f0873-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:58 +0200
Received: from PH7PR02CA0030.namprd02.prod.outlook.com (2603:10b6:510:33d::24)
 by SJ0PR08MB6767.namprd08.prod.outlook.com (2603:10b6:a03:2ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:52 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:510:33d:cafe::51) by PH7PR02CA0030.outlook.office365.com
 (2603:10b6:510:33d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:52 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:51 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz9M1WQbz1wdP; 
 Mon, 20 Apr 2026 14:27:51 -0700 (PDT)
Received: from SJ0PR08CU001.outbound.protection.outlook.com
 (mail-sj0pr08cu00102.outbound.protection.outlook.com [40.93.1.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:50 -0700 (PDT)
Received: from CH0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:610:b0::6)
 by BL3PR08MB7451.namprd08.prod.outlook.com (2603:10b6:208:342::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:27:42 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::fa) by CH0PR03CA0001.outlook.office365.com
 (2603:10b6:610:b0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:41 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:41 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:37 +0200
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
 b=GhEUuiaTWLeIGY5rd9KLQSXk5qX793PHw2fhwLCfAF1Pk9R3foG9lZzwQaEkrlb3Pb3CYEboD8zuPgHIrjJmsKfJwg0L50JG/hqlTEbJudWoV0gy3JahttfUMNxSWd1ja2T1qzIadqd//32YSCt7IUM6cwqvrP6HB6lVh8DCsPsFU57lm8l8OTjUnfwMMJL1oANCueLl9WHFrl9zVGO20mJtsS3fkfe8qXpVaniKV5zWA3EsV6sLrgAV3Su0CugRXr0S1ua8tY7n5OifzANWtD6Pbr0PiSBGtfjBz5b1WTUbU49Gduw9UY1tt3WHi5XpQNFJqHSlXGQwN4P7QtVqww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwN6LjYBkj1+FSQXCFug5OOMEvPQdMZIPBr0As48NFk=;
 b=xcDEpAbO7qVYaYs7/O5pHlo8lA2IT7IieiunxfaVgUTxUBEtPqe5V3OudLytY6Rjr7WkyDyL9ATedtdHpHpmeJ/tuSTB+B4xo6XSPXaEWcfXsNhBZheA9mH1LNGzW1bnuBgl5Wc3OmvaEFD8L/dVmpryazK8R77kQc5W3uq3c08h8sEDAeuHmxCL5ubfUykUWYiUQcV8TPaCQhjEVt7RMqG3j/BJjGnoK7zGVvcoy9BtPYw30EoGxX2qFXdwgZtvOP4yOgH0+ljflDzZOfd8sWFYojhFL8o13w4BMZrLTQKby5CNpjSJDXmgeMSM4YeezhKKjuqyo+jGcWA0uqV/FA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.1.74) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwN6LjYBkj1+FSQXCFug5OOMEvPQdMZIPBr0As48NFk=;
 b=dOdfosBwlfEsuhca2CH8ly3KjXMtZj5nJrLRi7037AIRl+6c/ua41IMFmYduVbyY72TIdbGuPgCVlXa8W36G5QEpQ+ydHYFfevBqXV6NVV4FPrlKu+Ju8i0kvvpR/vYiyMe9NAbnuZF/Hd4h5N9BxnIhoqTGBSufXO2OAA4inE4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.1.74)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.1.74; helo=SJ0PR08CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gc6LmvGMZYUrRXwev5yMv7HCr01xAdMqAJel2UySOnUlVBPtB7BQQAeliWIPXvyXlBgVplQH17y3VAi45ZobjdW+OfQQfETDCpinX0E0GtcGZH9ElDtX3inoBGve5WSViqmbnlnsA9BH6nzJrvwN8E9Xg5y0WW6+S1yS8R4ZdRm4pSRjk7dq+cJzUMXwEoB/7QXCpyOsCt/Sdfk3/urXNkDsPEapXY7Hag5IqPQZQdwF9AnrdPUjCkyfsExK1i+jVSfALJXP+Pb50tAcfvUPkbS+7cQ3xWFFH81eSOBt/7reK+uEk34z/m/AtEkAgppwxKnG3MfSy4cEU4dFBCUqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwN6LjYBkj1+FSQXCFug5OOMEvPQdMZIPBr0As48NFk=;
 b=wQKCb6UqawfMtRISEMh73joFvxDfSDr3HlgJZ3S3q8CpoVLR9Xpd4Qts4zFt4nVFYL0AH+gcraNMGa4FLpzFtt8dGF+/TFh1Z4DszC6S+YFm/QLIH9eQ5JKkqcv9QA/Dyqqa4LnX+vP3DSaS7F3csO+cy1w3khO9/wDPoKFSr5NqnbF7X0UYQtL/Gdzjxm5zGnoCd9rFUVwlNnEN1mM2CS2lMvWMXAxIm5TMiLqRrq7X4g+aGZMfWCqGiHHWIKmSCyM3KNZZDq85xwJXCKOBbC68c2BUPZ7C/qJG6WoSqYNcw/zjTw1NzU+iiIQwABL0hgMGsAgNfuWpsasiSiElMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwN6LjYBkj1+FSQXCFug5OOMEvPQdMZIPBr0As48NFk=;
 b=dOdfosBwlfEsuhca2CH8ly3KjXMtZj5nJrLRi7037AIRl+6c/ua41IMFmYduVbyY72TIdbGuPgCVlXa8W36G5QEpQ+ydHYFfevBqXV6NVV4FPrlKu+Ju8i0kvvpR/vYiyMe9NAbnuZF/Hd4h5N9BxnIhoqTGBSufXO2OAA4inE4=
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
Date: Mon, 20 Apr 2026 17:26:31 -0400
Message-ID: <20260420212648.208640-19-Rose.Spangler@elektrobit.com>
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
	CH2PEPF0000009F:EE_|BL3PR08MB7451:EE_|SA2PEPF00003F63:EE_|SJ0PR08MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: eb075c67-cfff-4536-11bf-08de9f23add8
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704161411799003|82310400026|36860700016|7416014|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?MSvKYjVmiU3JYlMfc7fcuagg+w9gP+VYEXMe3g7Q+532h+X417Vl3qZoHfKJ?=
 =?us-ascii?Q?nA4LsOhNW4a2N0C+iCKV4wXrctBaRc5dvhYAN4ZX7r9dJutrdodTHGQWdywe?=
 =?us-ascii?Q?6k3EF+Vu6xFBd+ZvyAomoCkQv+qBUE+9tFoT+4lrQGfwFf32cqcdY8YN6drK?=
 =?us-ascii?Q?3M4CWULKJleIng8wmcnUH+Q6fdOog2ZwhuwcFScawDmIP0ea/xrVi1bbzs1W?=
 =?us-ascii?Q?qm6aD9ZqrM3OoYhyGKo6U2TvEUmxDciMHRDlwwjECPBJvk2qMloXX30Sb1mR?=
 =?us-ascii?Q?Tg7MwfkAjf7CpAbVp4dfJF+vu8i2Fv641KT0MV2NCDRbzLSXoOeTlkV/Ga5k?=
 =?us-ascii?Q?BS52hTCOrjuQl9+zt/Dmye7EoxFKuA4XsUed4kVdaDPegvbOv95Y9O0XcAXy?=
 =?us-ascii?Q?Z+1obiV0PY2yoCohr9QfusuiK7gSLR1kF8//mhMkkPHlweeo6uI7fTmjXQrI?=
 =?us-ascii?Q?DpG2zaanE9wXiOUBZrxToZDL9vX1Ty/yH13J99tKMhEYfJMf+nZqwJSVRNjV?=
 =?us-ascii?Q?zNtVhXLyXZI6JBcVVlwLNEs6DXSwZYUDrlCmY91ygy8J/s3iRsFq++bCoudk?=
 =?us-ascii?Q?bNswlwrwJqZTz0kR5kq6lVxNG59QDa/aoAxtJp1KZeyw4IYIB4JN3txPOPn7?=
 =?us-ascii?Q?BEeV8nqt6Qe4rmbAnHkxQ8Xjth10xUU8eyQR5tSS26imPP/JKfeckgOJuo2j?=
 =?us-ascii?Q?OkLc7VzWvfu544jtMNd0qX0ractokWUDHOk3WUqZ7bzbBapvDNdTZkFQUz4d?=
 =?us-ascii?Q?7vCalzBiXqXCAlouVrlkIyvmB/h8xigU94/stubKez8HmhPj4LwhkJysuzjn?=
 =?us-ascii?Q?xpPa6CkIAOKbiQnsvw6DTxh26gVEuLoOKYOqxbynDfekc9m+b21Ty3uAo3rK?=
 =?us-ascii?Q?8rAb+Duk1e205HkdSi6IdaYYft6un9Yw3lh17g4AO1G8Bm8+Ola8/hcGjm3j?=
 =?us-ascii?Q?L2h+jOFIRD4xu7CWUMeG7MXHOVasbgait5x3DdeNP/sAdVRCU5mwo4PlHyHd?=
 =?us-ascii?Q?05WEglSs0Mjo7rjG7PT1oTSgfK2CVQ12nvmvN3YN6vL02IMA8wfN4xrnPImP?=
 =?us-ascii?Q?GXnBQ4Zq88VBzeuVkIGX/3SypDLA2WUlKWm0fvKVZX13VLoCIedRP/dAjCEz?=
 =?us-ascii?Q?yoKvXcMBpsQkBJ8t3uVbc20YWOssuWexJA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704161411799003)(82310400026)(36860700016)(7416014)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 qdKVYFw+m3P4/BeI6eqfG2yknU61gs1EhhBYpnFZgb/F1u9UVSjh/2oRJhXf3xFscgSghZHpOhsoH19cVUr21uVKeH2Yr7kkluYY1rSpXwOOy3LqSCEQ+eY8FiiDmTKZU/3d6+gkl5491natyYdlgvkTywsEm1yDLGG3X5G52oAQ4eVNI0CyQCm/Xg2H/lmPULUZRug2TPQXW5VDmcWSgojQgEIA1G9r82HMxie0d3Sq5bgeDDr3tBUzeOuvZFxc2mEMgl5U8Vh7QMej+PAJBVHATL8TQLHXNhXY8kh+DTBcUUAwzF7cIf4gNGckJZfzuSxCtBJH1y9I16dAen2GSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR08MB7451
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.1.74];domain=SJ0PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.1.74];domain=SJ0PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8c7d5bbb-9015-4668-9134-08de9f23a77e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704161411799003|376014|7416014|14060799003|36860700016|35042699022|156008|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cyipb3IKamkH9JcLiC/NLcS1moad1H+EJgUEyt9TRcQIr/PmUBYt4FkGBpu8?=
 =?us-ascii?Q?6Uw9v/af5XoXmmAAL6/3yCdezzwZ25kG3LJM4JrxIukV2RGHhjPKkGB6uk8R?=
 =?us-ascii?Q?2XT5r0Jhyhq5qMd1bPDbPh6gOJqvP1Xvbv8IgUWaXR7m0sD+9xpvah9CZRy1?=
 =?us-ascii?Q?rLnYrqiXme/+Y/vYNXQ8c6zdb2eCL9DIMrzsAftHAasQCYBISuuZ29ENhYA1?=
 =?us-ascii?Q?buEr3IBFPuqLaGb86Vs/PRcTBvrZTSR9gkJFiUcG1xEPVb0NyqhIN9xwsAfh?=
 =?us-ascii?Q?dOmlvt1HGCIbGi2mCHFCM0iNa8Vzv8VEY4PHUDso1bthRlPHBkfG7ubSu1C7?=
 =?us-ascii?Q?TiX9cPrwi1intkjoG7MtmEKQvByMAIBRHndDWInTfx7nG6mI4mtlSw95OOqk?=
 =?us-ascii?Q?JKGjQ1GNpYCZEOT/Tp20vFDtJobtvVz+a2Bjdm9QfM9A5CCaqJSt0XEx4f9I?=
 =?us-ascii?Q?cxcpCPrzbxrTGjPJk9uohr2r8tsACKWRmUz3vtyatbNldylHxYUDuzSrueyu?=
 =?us-ascii?Q?hCf1sNajH3D96TOv/QfdLdApc5Oo5JIFiTaMBKcsEwwYQ0Gy2fIkPLRwkHDs?=
 =?us-ascii?Q?JM/gGFDPGQrXrUF4uRxSmkCzPUp5NcO6uNmIvQeB9KlJGUsFxhV7IRxFm8Su?=
 =?us-ascii?Q?RgjdsT9YnwneFKakq88NNCA2lB/rtaQKOFBNmSs9OhTNMlSf9uBAQelK34IJ?=
 =?us-ascii?Q?Usln5Lh21N8T4sI+15D4QPTTuX+2pyvS3OtdhbpTKrariZ5VJF59B9m2uQxY?=
 =?us-ascii?Q?ATATQi38Drci5emrBfAEVQ+t34gTbIptQHGD3VCLEf9z94F6VU4Ca1/gnpJC?=
 =?us-ascii?Q?q99JdH9rnPim3HTQ/jHi5HNAmamQR+6kJwDGnYS0/XlrML6cj5ot0asjRrJO?=
 =?us-ascii?Q?CqYO5EN9z0p+lFya2YpSJi1ceWBorf0A4SZv3qlTAsJ7hNV3LMuL8eIMxRiU?=
 =?us-ascii?Q?Hu0vnTR5j8Nok8qd0OEdKN5wyBxVvT8GqgwF7sijbVwOgQKG/1T0q41pW8AY?=
 =?us-ascii?Q?inDQpwcbKOJs8lHxQmCgXDxE3nELFJ4hNl730zGcMEDNlHpPgDMjTNfnjAHc?=
 =?us-ascii?Q?K3jA95Ic35YoLzJbymwfHf8BqyJM3hT72rqaB0WNv0x0/9pUa2lCggUzUjUn?=
 =?us-ascii?Q?qmiYnhSEgMcA0MhcV/9nmi3KGmwIPnYtPw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08CU001.outbound.protection.outlook.com;PTR:mail-sj0pr08cu00102.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704161411799003)(376014)(7416014)(14060799003)(36860700016)(35042699022)(156008)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+jPCAV/cDD9B1Bu/osIct3+bJW1yA5WInDbZVJCo6eg3UdwblnkeJwgUkkzkzD6nwgcH2c5wgDg18ldw5NN9MRc6BYAwrm630D/86hk0GYi7Clent3OmIrow/dzeKXfk/uutTRUVff4PlRwYjoPEPuJsy8XBIKi3i0OfQnX4zAZKhx3ziBTJl3rapd9+XZK3mGiFxiErR6YltGeFr+JErp1YivHGCUOH/y52YerTysmX7BmYrybNqBLN3lWVIlqnJrmDg6uGngeqMSDJelYuuHYFiCdSxER4Ptb8umaDmwO73nu0K8YhP3d+4AXaKR+SGIuu82NY1ogQqTVM5sfI6R2fDmavs/r26dKdmC3ifN9pOIKW2DWBBPaOazKXHUrONLBd7Hm/P37JkODErASA7ZJ2ld9ZOcmCZz8PRSk0DbMKV3YAWywwn+QXHQRws/V6
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:51.9031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb075c67-cfff-4536-11bf-08de9f23add8
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB6767
X-purgate-ID: tlsNG-720697/1776720478-880D7161-DA2F569B/0/0
X-purgate-type: clean
X-purgate-size: 1653
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.358];
	TAGGED_RCPT(0.00)[xen-devel];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[elektrobit.com:email,elektrobit.com:dkim,elektrobit.com:mid]
X-Rspamd-Queue-Id: 5AF6E4340D4
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


