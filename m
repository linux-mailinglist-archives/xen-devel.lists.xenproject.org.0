Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPgYMWHs6GkdRwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 17:42:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 164764480C5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 17:42:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290813.1570292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFZiI-0001ni-FX; Wed, 22 Apr 2026 15:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290813.1570292; Wed, 22 Apr 2026 15:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFZiI-0001l5-C1; Wed, 22 Apr 2026 15:42:06 +0000
Received: by outflank-mailman (input) for mailman id 1290813;
 Wed, 22 Apr 2026 15:42:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wFZiG-0001ky-VU
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 15:42:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFZiG-00BcmE-C5
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 17:42:04 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e8ec18-bab6-0a2a0a5309dd-0a2a45038c3e-38
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 17:42:04 +0200
Received: from [40.93.196.111]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e8ec4a-672d-0a2a45030019-285dc46fd0f0-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 17:42:03 +0200
Received: from BN0PR04CA0004.namprd04.prod.outlook.com (2603:10b6:408:ee::9)
 by LV3PR08MB9525.namprd08.prod.outlook.com (2603:10b6:408:21b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 15:41:56 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:408:ee:cafe::29) by BN0PR04CA0004.outlook.office365.com
 (2603:10b6:408:ee::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 15:41:56 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Wed, 22 Apr 2026 15:41:55 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4g13PG6NJ8z1wdM; 
 Wed, 22 Apr 2026 08:41:54 -0700 (PDT)
Received: from BYAPR08CU003.outbound.protection.outlook.com
 (mail-byapr08cu00300.outbound.protection.outlook.com [40.93.1.104])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Wed, 22 Apr 2026 08:41:54 -0700 (PDT)
Received: from CH3PR08MB8735.namprd08.prod.outlook.com (2603:10b6:610:160::11)
 by LV2PR08MB972923.namprd08.prod.outlook.com (2603:10b6:408:3a0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 15:41:47 +0000
Received: from CH3PR08MB8735.namprd08.prod.outlook.com
 ([fe80::f5d2:ef47:3ccd:92fb]) by CH3PR08MB8735.namprd08.prod.outlook.com
 ([fe80::f5d2:ef47:3ccd:92fb%7]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 15:41:47 +0000
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
 b=aV1ScJ4TaHUmbv2yu7yNOfMUehSH6nKNvWg8d8FzHQGW5YOI8cjEZN4V5uKeley7H5w67Or023iat4RbkJLwtrwwPkUDFUvHoX2rsfpV4C0yslxUfFFUVsOw9sMYXZ0zMElBYtIIg6o5e/ncOSPDOuiP7U1+96yCwr862hXedvf1XoCJsgd2zSwWP3syQOIf0IH/MlH5I4UeGQ6IVJsKn70Eb29qPBUh+kQiC2C23ZhcSk5ggzCMi0DdnoUxWujX+eRz1vC/rDpCu1w0xOonAzkz1mjGG1yKZ4SDLW9M1CWL2Fc3FTl5NkUE6ANB1Gts7bRYkqVyT1MNI1zJ1I9kug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dewy3yij8UHd+pINT8TLmCIKDxm3p6wVWaUkqQr6+Go=;
 b=njf9QGuqLCs/XpR+eyvJOmykx7Z/z7fIvGGWqgdwcJWwI4ys1J/7t9yDWvGYSnkCtpWK1MIBg8u/E/GYZeUAjcsMQg9D8dAvUVYEUyej3TwtwPm+vFdHHXkJtEAeYL4E02hnQVHdZIt0iV5UHdrz/Xuf1h6piZ05Bj8heQ7qjkFTs8OEOygPtxZOZmskYuN3unxkIODEyv6ZlMnpKv4JM4+UU5zNq8U5zw+/4j7EJ1SmnoaMvzB1rOQLFoqrnOZ0kfJqzn8JujXIojY+hMwN6bU3OBQ812TQPphLe9feU49YvOTWP/ZyN8z6WKLtam3emi8jtVS79V/2cjXa44hZhA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.1.104) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com] dkim=[1,1,header.d=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dewy3yij8UHd+pINT8TLmCIKDxm3p6wVWaUkqQr6+Go=;
 b=R2N4le5Z1CXQRWuluy1f5bERN192zLfcWod94odGYzy3lughEvv5EJ6qjjRZEEcGoD+3LeYGnS9Ln0kH7iP+OfmYqF2GWH8NWyxVE1i4zysWpbecUAlsSGloumGzkbpQuK5b6AQyRkrUOod592X7ui9SSGK+gyJFHencimFIvqQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.1.104)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.1.104 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.1.104; helo=BYAPR08CU003.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYovBVMFo4CkwTrGP+XvohJpeBd6VuN++WLLZ6BevMUFgXgy/Tp+GXWpvSrGPgrFi4XOexGwkOpWmzimuQ+MWVYkTzgyi8BQM+VDjxFelf2chQN8T0wxTPEvUQUVtEmducVRidlOYCIEtWK3SmbeQHGmVrcB/NKCaWxBUbbF8IeRcD4NbURaLJ9d1SlVl3UiMf6n7tkmx+2YVcZ2sK49HcueoLA1lqpiSi6V5A/PJa/Z6qSluhr0dYLpy/lWI7ANwrUOPoHAx6CgjA3Q5gkYkeRx5aK3c5OXMw7wTPWzZIacP50BLi5WDUcbNHQvQLOo1gtsPuHQo74vPKZSzcKIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dewy3yij8UHd+pINT8TLmCIKDxm3p6wVWaUkqQr6+Go=;
 b=Pk90LLx8Sn79PBp7abq6B/bgiwK3HxWqBshXzC/sEg17ob4Yw8+pkO0eY24aeGQHp5F6cuxMK8k7CHPtINEbJp8767gEqNdBYfrhSVfVUYL18eXavWv9TSF4vIPtI8Wwh3tA7YSRh6Qjl8xkgPVotTPnmVVdP6LWce5lVJ+gWZR0Z5jwX8guRCnFwN9/NUDmcAXx77+Z1sGpeaiBqZIF2FWpi3E82mui70pturU92n608pMfSzpjgjtFJP8Sbyj0UxkeaZqc0+MBCQuIROkUR0Q6+P4bV+kJcxlVCNzhr7CaEz/5irCsB2bYm7ztB2fWBIz4VQsHe4gjlg3CNm5YYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=elektrobit.com; dmarc=pass action=none
 header.from=elektrobit.com; dkim=pass header.d=elektrobit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dewy3yij8UHd+pINT8TLmCIKDxm3p6wVWaUkqQr6+Go=;
 b=R2N4le5Z1CXQRWuluy1f5bERN192zLfcWod94odGYzy3lughEvv5EJ6qjjRZEEcGoD+3LeYGnS9Ln0kH7iP+OfmYqF2GWH8NWyxVE1i4zysWpbecUAlsSGloumGzkbpQuK5b6AQyRkrUOod592X7ui9SSGK+gyJFHencimFIvqQ=
From: "Spangler, Rose" <Rose.Spangler@elektrobit.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [RFC PATCH v6 08/43] altp2m: Rename p2m_*_altp2m functions and
 move declarations out of p2m.h
Thread-Topic: [RFC PATCH v6 08/43] altp2m: Rename p2m_*_altp2m functions and
 move declarations out of p2m.h
Thread-Index: AQHc0Q08g9UjbgeVPU23tPISZnL/sLXpdhuAgAAVnXKAAKi9gIABBgbq
Date: Wed, 22 Apr 2026 15:41:47 +0000
Message-ID:
 <CH3PR08MB8735B986731BB631A25DA70B912D2@CH3PR08MB8735.namprd08.prod.outlook.com>
References: <20260420213206.208750-1-Rose.Spangler@elektrobit.com>
 <20260420213206.208750-9-Rose.Spangler@elektrobit.com>
 <CABfawh=trqX6Gx3udVpaYDiLRcG+99SHNmK4s9f5pjmNbCMM1A@mail.gmail.com>
 <CH3PR08MB8735846D3C525C40DE983AAC912C2@CH3PR08MB8735.namprd08.prod.outlook.com>
 <CABfawhkeMkzaJSPXxGqQ+m-7J1gozrKJaiR-99AWTQ6ZmsdaqA@mail.gmail.com>
In-Reply-To:
 <CABfawhkeMkzaJSPXxGqQ+m-7J1gozrKJaiR-99AWTQ6ZmsdaqA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=elektrobit.com;
x-ms-traffictypediagnostic:
	CH3PR08MB8735:EE_|LV2PR08MB972923:EE_|BL6PEPF00020E61:EE_|LV3PR08MB9525:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b4cb2b-5c16-447c-29dc-08dea085af14
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 DZfQ0isilGCVyh3QD/d/sGixjjHPXeMPanvheWEPihrUXiXFKpVR8eK5LapY17AKpFNlhc30T7WFtK+wl91asuuG8EEcRB8TtAeS/gHOtbeVQ+EmJsVAI3LGrfIIGWvZzdsXpTdYFuCzd7o1Y/7lmmSgCEC90upkgvY8x+rrcYTmQSrXLbho1h8FNzchR0qGKs7ZPFJslrLnKAD6D1fJsPW35fiUfWzvp9SgAyuvpz7Lq4dw+afnnKhjgEc3EXzfClxF+8h8YhTf0eLLFEa2WtkezwzQJP06/IOVUp2Nqu+isQmbqj4SlLHIA6Oy0gRpjQYOJn49v3YzX5VbBGmzF1v9TdIrOZ3S0I3NclTG0Ml+tRpNKsgGYGcRdrY6LGJoAfG0o23FVncDAK3xW9THN4+zbWt7JkYq8Vm+b2OQHGIjMb3nsbmzS9IyIE/Lm9BtGHbs8qMU8LK+UExMYbA3SijcZlDWHeMb3+QZRHogyPyFrafRMxBvabZ10gWT5DynZ64pDm7Bymy+X7ZEBwCH/hcLkW+ephm7Uf96ZKEvBxhS0obGVkcsTK3oUc+Tdvf87f2Dm+US7DjZaCCZQ154GyKyjvXt8cSVuVr0XwvqfTJJ0+iS3Ekdi90U/uai+qY+IkcF2I+KWAUM0iM5R7na5p0ByjJRMdQ1bA8wA99Go2x6DdCQGDtc/zk66rwFe+JmbuYTpHsyf/mD0bAaJKmM0yKsW65aria8mAGC0xSp9JiK1l/B64kGJKXk8kqnf0ktlVp3HMNzUfXYLWbdqszllPVx5j2Wqwi7yHPY2qDmgWo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR08MB8735.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 dSDk1B7NKLxU92eypHvnSP1g5pmOWGeJ79Y7nOAGdXsSBPsKFjOesetU8lNom06ZYFKJUIW49LUT2GaNcbkyD+sgtmwhX6b3YL5Cu6lPVFQF4A/dXdHule3fqnVS3Z6pZtM7aZStT/DmbSsWtJ0V2dyi9lf78KkD6L0H6yTffIeu+5uS27eKL8wf1ABSVT0MVvVCllT/JQi/mvyGDWYV51hAH4WCpO7Q9NVv406OxzVuodmtSF4S0q6EqNfM8WJzmdE7EtJR0djM2TUOkTxV2kApM+uxCdrUBKAr0XPMj+tdQoHm9n/MLMC18LI+2ZRMg3bga1hCGgPf1MrTPcQ0Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR08MB972923
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.1.104];domain=BYAPR08CU003.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.1.104];domain=BYAPR08CU003.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8f17159a-12b4-47e5-309e-08dea085a9dc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|14060799003|376014|7416014|156008|82310400026|35042699022|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?wm4SR1ixKrp8sCQUzp0SyCiI9UAw5eYlCvHc9z1yX1mDyAgzbriN1JHO8y?=
 =?iso-8859-1?Q?cWEDEMIsz8gRJnrhPXuokdIuchoNtV32Sh/F+m7cYwNoVpWOlN+NQjbI2R?=
 =?iso-8859-1?Q?ECXRRia2eoalHLE0RFi8IcVOZxbMIP0n1VeSyEt+G/rLYidLAfysJ1DsaK?=
 =?iso-8859-1?Q?4ugua/mmrqrZI5drcVjJkoxtg+gf0i70WIYcFIpycIc+iNxX8fe/j3jEtp?=
 =?iso-8859-1?Q?wojmpQrc4QU8Ok8qUD8vTZQW+Rx2423BTQNmFPznFPqN+mPK0OEaXmOTp8?=
 =?iso-8859-1?Q?bcQp/nZJqLzcC3Tsz1zjIHshKyfsB7maOYKdSs+8mBeTUSNcTfybhnAcg/?=
 =?iso-8859-1?Q?xIZv64uTPACtCJR4dArDIbDU8IicrJUDANvon8lVrGOQSBz0hOIbvB57bi?=
 =?iso-8859-1?Q?z6DLW70zXNuRM/PTPEttRbe46o3jdOnQsAnarAGnbC3fLbY59Hx4ZU7EGP?=
 =?iso-8859-1?Q?Yd00JDPdGv2uPpWBKVBes597ZZ6j+TZ8Vy4MeCviFNAoUKYM1WBbHrMKLX?=
 =?iso-8859-1?Q?HjM5/+Tv9P53l6QgS7/q/SqJYGSCedvFQm0c4UAnijl8W9NxWmhauKsLmL?=
 =?iso-8859-1?Q?CPtiJhkTLFguwu2TSkiZqaOwchVuAHcMl9yDkXAu0aaaHDZGCU29zebfeS?=
 =?iso-8859-1?Q?s/nqJYY9nuXJGA9F31vUK+qBH42vwd5ZwHcx5DDXr/sVauPl7mm8RSxyLK?=
 =?iso-8859-1?Q?+b3KjrkwnZ6fbLurVBmhI86r2W3TNM+10QW95+Hddle0GoCnHSPE9udSwg?=
 =?iso-8859-1?Q?RSsmyuYW2LJaGVdppn2t+M/Yo2cs1kY7cTdT6Hp50kIHz494tHO9fHZX5m?=
 =?iso-8859-1?Q?lBx6FLrfpFHCABGNXqObvYS73gC7QZLEcDg5NRjiYCBRBm9uhrAiI4g0ka?=
 =?iso-8859-1?Q?cRfAz2kh8Yb0FFBycDKqXEeHzZdF7vzqh3bSTu6DiajuhWVkjF+IFD47xg?=
 =?iso-8859-1?Q?9rX/2FRsNHyirMNG6wVwijFE7x0uErjmCaNp8DsdMrGoMA9cXYwyxJseWI?=
 =?iso-8859-1?Q?Ag9cqvy75sVeGf35TSKkifjG2Nyc9rJrKmaCXnyqFu5VIjxNvRRyM0IyJp?=
 =?iso-8859-1?Q?c3EaEIvDK9tkba40m9/FbubWJuAUrLxqqrveRPHJOcpI+FauVD90wf3/4p?=
 =?iso-8859-1?Q?NOMVt+cNV2KjE6F8SU4cMIe8rJQ+g2G+osYHdoGRnmWqJOG+gLvUSvL6jo?=
 =?iso-8859-1?Q?RG/alD7w7dYHnGQWx7BFtEPtevB3d6AdBUYw6Z+8koAFBAVL7Z3VSjX9OD?=
 =?iso-8859-1?Q?P+qf3fsk07uAMZm4iFf1nBBduK+Ie5kdD8bdQhG+8GcvSFEcmYdCq5T7Lj?=
 =?iso-8859-1?Q?eFxg?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR08CU003.outbound.protection.outlook.com;PTR:mail-byapr08cu00300.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(14060799003)(376014)(7416014)(156008)(82310400026)(35042699022)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Oc1uVOBCzJ63As0KrTlvKToA+U2miAplnBg2moy27bBIcEh/AD0RIx9k6bT6PrIydGqAujFD5Kg3wMGx043QiZrWTNeU9HRUwZo6aYzyzSem75eWQ2/BSrbtKfvCJOi/NZ1bvarCGtqiOad7GsnP6EsXamrBvaQksOz2/7YoJz05R+gQXNxMWlAgLEcdlswMNuXU8vm/i4BRIr1V6wwJT7xStoReaMuvjhxkb446Gl/EyAbSXHGeEoboozb4OKx0GUZA5XQXlA2B3lBaMh9S72YihpWfL8VOX02jiLg6SPEfGM9zRIEcfKycVlfAYAdJ9kAhDnniSOXS0eDHc3nPSErM2sT6Aae33DHRudveI5j8lH/kSNzzjdllvGVFXwze8vyZh13dSgsjpVqR9klPa7p0aulIWLRVSFvmxERdeuC5IuoZHziqptw8/ljF+9S4
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 15:41:55.7375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b4cb2b-5c16-447c-29dc-08dea085af14
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR08MB9525
X-purgate-ID: tlsNG-33051d/1776872524-2957F938-7C658F50/0/0
X-purgate-type: clean
X-purgate-size: 243
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tamas@tklengyel.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 164764480C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> How about you add the _view suffix for these? I think it would help=0A=
> disambiguate them and also read better than the current _altp2m suffix on=
es.=0A=
=0A=
I think that makes sense, I'll make that change. Thanks!=0A=
=0A=
Rose=

