Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CFECAD4BE
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 14:40:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180569.1503734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbT2-0008Ub-4Q; Mon, 08 Dec 2025 13:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180569.1503734; Mon, 08 Dec 2025 13:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbT2-0008Ru-1o; Mon, 08 Dec 2025 13:39:56 +0000
Received: by outflank-mailman (input) for mailman id 1180569;
 Mon, 08 Dec 2025 13:39:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9FtP=6O=citrix.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1vSbSz-0008Rh-Ml
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 13:39:53 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f715a72-d43b-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 14:39:52 +0100 (CET)
Received: from LV9PR03MB8368.namprd03.prod.outlook.com (2603:10b6:408:364::10)
 by CH2PR03MB5208.namprd03.prod.outlook.com (2603:10b6:610:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 13:39:50 +0000
Received: from LV9PR03MB8368.namprd03.prod.outlook.com
 ([fe80::d8cc:b839:3d79:59d3]) by LV9PR03MB8368.namprd03.prod.outlook.com
 ([fe80::d8cc:b839:3d79:59d3%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 13:39:50 +0000
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
X-Inumbo-ID: 5f715a72-d43b-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bF3Ffuf/HwxaktSG62fk2SPTJ3vnFCzxmeAkYnD4tmBScocMSQeaK958iCHYuSf/snaScZJyW2BjOGr2y/3qZe7zx0evyaLj0Y9KpphSZCw1X935cpF4zQwLw6RxMCNKePCTQSrFCa7n+sQFgm1z4zhpeTZf22BtQIlewPXZo4VrjR4IxWXMMVWQnPb2l+MsawJWPDtI3dggFecsN7TQT3yuqAUVBekLYGaznU/3nCXbxV9dOb/88kdEDAZ7Giqy3Ou7oSZ1Hsam3O8f4SpzGztYK/IahhVXPU1bfpANegss3W6NDKuRiriYizIKZhljr7uUmiYeB2rrnGsZPfnJvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oTnBdf2t1yXKdkM0fMb/nXv2hiefRQDdpwrpdKISA8=;
 b=R3KOIdIgzsMWfD3hk9MgwSBuxoCqjrqCndUJHE/aRe1DzO/Oxmj4fVtcpr/H374bHLZYcD+QMb86hLTUTTk0lX48z0U9rdJQFgdj8B0gORuCeP7e3TsVhv0B10xmgUzHRwhU5XZcOT67e0x0SNDykAbSTXRfHoj+5a8ZWZn1ti9DNgh98KsIpvG2Ur4/OLrs3s1TX35EldHTssIPX/zywdsbe7NYAQBH3Uc/MoOGTBBna3d3+mDiaG25W2bSABBJyD7C9ud8ulFl8gf/fG1eTMZ9EiN69Wuh9pnIHRdL4a1C3aUuHKQmEd59FBTNVZNENpDljJFuoGrkmRqXRx7Gog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oTnBdf2t1yXKdkM0fMb/nXv2hiefRQDdpwrpdKISA8=;
 b=wtyKsla8yLtT0mp8PfdiGb0gEIdBCFbx6Z4cxiZ+ynWMjkPg+A3VW4/1XtbdsVzYksZmMDN/zyIG7qxeI4orxftRYQUUFZN8MMpVS52YgxDikYoZBFYbzKsZhiHQKPk7MdPnc5vCjTIBlNUO2NNA6w4KnfkzP+6tjgObc59T46s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Frediano Ziglio <freddy77@gmail.com>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v10 0/2] xen: Strip xen.efi by default
Date: Mon,  8 Dec 2025 13:39:41 +0000
Message-ID: <20251208133945.61375-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0245.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::16) To LV9PR03MB8368.namprd03.prod.outlook.com
 (2603:10b6:408:364::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR03MB8368:EE_|CH2PR03MB5208:EE_
X-MS-Office365-Filtering-Correlation-Id: edd4ead8-e9e9-4a3c-58fc-08de365f4282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+buwL2Zabm3Bnw03eu41yoo0q/tAlGdcwOvdMcATlBNu2DMrkcbrBv0ZWYS/?=
 =?us-ascii?Q?aqUJD1f83pX9dzcMbJAX3UAbl5yMv6NNvFZxbRUpXmfMafF2/WRTW9bzcpnC?=
 =?us-ascii?Q?V7ACj9+r4qGgM1xdA34IE44fmZBJyvNnufwS3U5oltvxdrJsPtgTiruAhDFm?=
 =?us-ascii?Q?PoOqpyyeDTkBmnJQWp6CRucjH2V7jYQHD248+IIOFZQu0US+876b7KUGWRc2?=
 =?us-ascii?Q?1dMNHs0fMtWdV1UEevd6RgYT2E5qJtYV+EFt40CDfFhS2VA9TJnGeW1cBnBT?=
 =?us-ascii?Q?PQu4OHck6m7TH27cL4C3shhbCDo1Gh4Yd847pFZemrKDG3MgbJfyqvaWAZUS?=
 =?us-ascii?Q?LTT03eD2qWyiHaIdLeJxEaAp2As/rGDKyQ3LngfGcuvW2uH2dHx4QbP5N0QX?=
 =?us-ascii?Q?JbQzJ3BR818+NIIGms7n1wFmeirJouK7kpL79YFCiFHbATwK7h2eDCr2JYEf?=
 =?us-ascii?Q?IsrzRzly3R4Vk/SpX9ZmSB8XFwWrWcMCiYioM8W+QJWcInSCfGP/QjoeB3NR?=
 =?us-ascii?Q?9HMJSijJ6477JHsP+z4qXKDpMTNWED+tJhq9bBgqgLdLhNgvWYse3QVn0lou?=
 =?us-ascii?Q?MuwFlzHiwBBEXcE/HB6tlpsNUAQsnMXKv3rtaIjGjAGYrSMYiS4GEEnabQOk?=
 =?us-ascii?Q?ZJEXoMgkeE/5Al4qniXBsHgBS2hYFXjLw0oYDLFyr983s21dbHdVz3wco+8u?=
 =?us-ascii?Q?8rhdHyqUI7PjpAqv2rwliDiuB/CujoLAa4ZPK3UsOCFXN7W9RJsUWie+w+33?=
 =?us-ascii?Q?6Bw/6XRwVeOIMIg7gU/pnxw/SmV/6ObK453iit+JYYHAkRh3bjzrtgh7naCv?=
 =?us-ascii?Q?ct1JcEtLKLRmIx/UFsm8DbdcrjrHgmBRMzT+nrIXRahmYPJDkRW2Ae0lgVoz?=
 =?us-ascii?Q?/LBxV8r1BTWvUYbRltpRLlI3E+O2snLVMpQuccVsq497AgsGr+QGu7+cJK9v?=
 =?us-ascii?Q?cQmtkmoQ27ApbMBIVzV/g/xvm+ItvFsQVS+n1n/7d37lcLgwi1H1zAjS6pwt?=
 =?us-ascii?Q?UUYnECBZWz9N/DAGwBaF3B85Aksek1AYnwql61L5JUDGCLuAHWEtWywhol67?=
 =?us-ascii?Q?O5DKXT/T23rLpnM2zVs9tsE0Rwln7qteOcEeTUvFcOha7b6S84dkl6x0htiY?=
 =?us-ascii?Q?ldK9qduwlSZnEnj2ADfp81/a32MLVqcKuGFjV8ec6T66QITOXyBoqXBPaf9S?=
 =?us-ascii?Q?N4GltI05jrEeGicpfPPu23iPlbOnZPFmVgAN15Qbrec51VGHubtwn6G1PHqb?=
 =?us-ascii?Q?F7mdci0/DQYpxq2AOG4kULE+Xm51GOlxvOyyimxG9E+sNMfSrSYxuzls7MR0?=
 =?us-ascii?Q?d8vVHWf7qjvT+le8vCCXecseoxDAYrZlgorWIygcSHxjTRVWQc4UzzNLbvl+?=
 =?us-ascii?Q?feSv4Ply8aAH+C4fqa/nKhWJHbeAeQQlZkNax69ky63T+JuOV6gnRzEcbHYC?=
 =?us-ascii?Q?y4QtEuol1pa2dELPrmOi/WIpqI0OyRiF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR03MB8368.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gs8vplnRL1Bb3CxJi34+zPEOcluYdotB9ENWU8VMmrIJ6H+oHFsZAUgOuCQL?=
 =?us-ascii?Q?2B2DnaxHIlNsievzcCB5AzSX/l1s57+98kljEyBOdjxvOwAonhPbDh8L19St?=
 =?us-ascii?Q?Rf5E4lhWC9pGmmiD6tQJUdrc88+C0RTHXhY3hmp0squu9OvEJI/Qq15i/MM3?=
 =?us-ascii?Q?JTFPzz89JerSfNuFG26m1W+h1HHtog+K2vNG9H22OkFiz1HYGCpdfq0lL83Q?=
 =?us-ascii?Q?TsaEh4/iyuccoUj2qS8jFVXfixTwGu2qLPxlpg4630ky2wjZh2+X5eraOpCF?=
 =?us-ascii?Q?pLdpyRCJC2F+/1XpmgV+6bV8waNmezE+gtKHtLUY/RMXzfDBKZ71TDrgCk4E?=
 =?us-ascii?Q?ZHhr4HVHRyx9p7dqiHLW+axHiL2XhrVPThiD9W2bM8nRdQlPiAX+qZnjsshp?=
 =?us-ascii?Q?n5/sqvodt5TD6HuIY9m7ZA1iNh9NhQdZwg9vTJ4UNBQEF6AsFgqmJMKc8Kv2?=
 =?us-ascii?Q?s9cNi3zN7Lrm5xZTtKlnNZ7OytjZgQi1LCwYdLuxiQCh0EwP3sRPz1C7nXxz?=
 =?us-ascii?Q?PyluvVYVukVEbg1agmXZ0/Cb+PfiGWMkGTR3KZSs1VHsKsYAIgC0OrDZDKru?=
 =?us-ascii?Q?aVAES1I7oo3PNE51GCQXzvwCsbMKmmJWQZwir4QNuyjI24Y9e5TgMs60HrW+?=
 =?us-ascii?Q?jJSbzJuf5s6/ptgvkQsQdClV8awUxQUiHDvw6IRuS8M5H1pgq6h/rVJuENRP?=
 =?us-ascii?Q?zA6jFXZtUthjCVVFb3Ak4/PzxMR0Esk+dJkg1pJSzxEhPAjycOi3loNG95WW?=
 =?us-ascii?Q?efp8HlH3yayfygm2gtOJ3ZFtEQt2QgcJFjYHaWm+KmSN6x0xFb07kBBSwOn+?=
 =?us-ascii?Q?VHEbDaHQv3CevIwS1jkJy4fXiXVwzQt0xGWHMiWv/v4ILIurGFVt0+jdArCC?=
 =?us-ascii?Q?vFfdrOVbgRr7IoigTVfM0eWcT5LT17ZKfHC044N49wZ36LK9jl+sxmkYTMAy?=
 =?us-ascii?Q?SCIac1mrI32wpOlUbubh7x7yms0JfEsdIX0tPnNAg82sqfnPfW0kabHzbRxy?=
 =?us-ascii?Q?6SsPGY7VH8TTR4ROMv5aOVWcuV/dGiGIp6KUzVlyVkL2oNqKuW4EXgO4fGkd?=
 =?us-ascii?Q?zYSgb+N7IXkzXGJDCDzWhQg7Q8eLPDKaCZRZNWP0vSIn39iw3vozPpAx51KI?=
 =?us-ascii?Q?w9G1ldO8Nhp3481pWo2yCFcXxooEKmG8wuD8y4v7srjaiBhrzXlyCHQXXIIL?=
 =?us-ascii?Q?mNPD4IQ/0lGk07KtTQGAHrEYwdefUNbutQ8MMrw29GQ59rKAr+GjpV+3dVE+?=
 =?us-ascii?Q?nFijR1noMLDi3PXu1H8JZqm0enmI4xjdJg+oo9cb6Pq99Z9Z+MLVnD/1voaM?=
 =?us-ascii?Q?XT8TUCNc0fKXrT3Xhwb/9Fltd7aruHEjpsnT5ABiJxrKp5thhgJl7XaKQ5os?=
 =?us-ascii?Q?/S8nM+Ae4p4dSIr+K1UINCXRfgRQJYadzHoY/kY4CHI3cCkTomYt/3BUHtW0?=
 =?us-ascii?Q?tOd7IeMpuAJk/q9WldV6+f+mxN3JcGA5uj9fOEw/AACQLU8c6bKuvYrPOk0P?=
 =?us-ascii?Q?pT5XrkY/UNV8l6lMS76BEfQUtAEcKTapYJo2xgolXASiUXzz1xM7ZcT27JAG?=
 =?us-ascii?Q?K38jw8tto/9L93MJsh3NnO/UzFm7ZDC9jatc7MjMYLZLI3to5FPq7Wz9WZ0s?=
 =?us-ascii?Q?Lg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd4ead8-e9e9-4a3c-58fc-08de365f4282
X-MS-Exchange-CrossTenant-AuthSource: LV9PR03MB8368.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 13:39:50.0233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: go8n6Nnfs9RikIn8dacFl3IsqO9/35CL/3mrDNzjJqA+U0Tq2b4oqRj5sKlV1r0yQlOA57NLm+tGUUjQPkwCjxu9FQwnL0sZmQwd/wm8MuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5208

From: Frediano Ziglio <frediano.ziglio@cloud.com>

The main purpose of this series is to strip xen.efi file.

First patch disable the build of the file on systems having broken toolstack.
Second patch strip the wanted file.

See changes on specific patches.

Frediano Ziglio (2):
  Do not attempt to workaround older binutils
  xen: Strip xen.efi by default

 .gitignore            |  1 +
 CHANGELOG.md          |  4 ++++
 docs/misc/efi.pandoc  |  8 +-------
 xen/Kconfig.debug     |  9 ++-------
 xen/Makefile          | 25 +++----------------------
 xen/arch/x86/Makefile | 12 +++++++++---
 xen/arch/x86/arch.mk  |  7 -------
 7 files changed, 20 insertions(+), 46 deletions(-)

-- 
2.43.0


