Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526A5B3DE63
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 11:27:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104254.1455352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut0oN-0007z8-7T; Mon, 01 Sep 2025 09:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104254.1455352; Mon, 01 Sep 2025 09:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut0oN-0007wj-4U; Mon, 01 Sep 2025 09:26:51 +0000
Received: by outflank-mailman (input) for mailman id 1104254;
 Mon, 01 Sep 2025 09:26:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PVXf=3M=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ut0oM-0007TT-8d
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 09:26:50 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8e68c78-8715-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 11:26:48 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB6741.eurprd03.prod.outlook.com (2603:10a6:20b:23c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 09:26:46 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9073.021; Mon, 1 Sep 2025
 09:26:46 +0000
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
X-Inumbo-ID: c8e68c78-8715-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o70lf2BFNXlVQ9ds0ZXZrW6nNqO+dq3muTlKV1yrJyM1f/9ZE9MPosg5uaAFgieC6TngT25N/fwHSn1TYKZT59LsHwlAOjxemIjExpaXy3w9/tQuraf2LalZf8f++uSbvatG3NUojNi7Bkzdf7aiMNhdwTcFTQdtVtA1+x7aB0hGB0L1U8huQi5l0Six9fi+DN02Qlc06F5oKy90slQK+vjEFs5r4Wfm6pp7j1YDsIj2nqipH9QkDm7kY95IT5wAF9tCSUM6rgXN3v/qMsM/Erup2caHsAqlC1AqWBpE7gFoprsM8pKYBtkllICwlsYEqYYdHG5g6LniSYGPmlf6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEWDpgFAqkk98uKrndfkSlsjqAdBOfj7hKp97yeBNbs=;
 b=aGjl26cAdORAyD6HlbcW4arPvoV5x9DJfQIDJ4oItr6zSyEawIbP6pvasgE6qQSq373QWg8W9DmlWCkrS2O4xw5gPnjPEQe9EwINTQ2254TBYE/WFr8JSWWFdzVASCnF4e18INH4U86kugrHC5l4fZ1PguDr8nKpCpQ+Akq5DoZw2yUXTSc2nvqUAB32x1A+xEjcfcFhiXsSOsrj18e4Uk3meSmY1v1J5VY48O8co0DkwKLK06Fbllq3LQTpQiMDI1P3nF98Wx7nuwX8s7xQ8NSQl+0qcMN/W9pB6AjXM7/Vx9biDictxFQ5jaMJue2UWq4dVXcjrrOMK7pr2M2sQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEWDpgFAqkk98uKrndfkSlsjqAdBOfj7hKp97yeBNbs=;
 b=im7DTCLdKy+J/jSlP40EOSf09FT/rgp+jQhJx7bloEXfLHylOr3GCV1+jLxuz45ziDCE6wRkjv5UG4QfIJymufKh15xsotf/0sYss/112FBRn/57DkeEbuJVHj7iX5WKcl4iN8r2GkTHzEuSQuctlx4QYhUAlJ0mDemswulAU2f3iNsXxp/Fs1Z8kbSMuoaGnqhqrcpBpFj3lkRAFJQik1nEwmut3ql/XjeT0n+MU80phQixlV7q1po9LZf5FnRiuUD4nh7p/fQNF0GYz5n+0P2kHlgFvLBwvKuC8cO6qYGjxsXP+Fpxnt7hfPSmmRt6YE/cHj6TkhhA7kJIjHEABw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v3] device-tree: fix infinite loop issue in
 'assign_shared_memory()'
Thread-Topic: [PATCH v3] device-tree: fix infinite loop issue in
 'assign_shared_memory()'
Thread-Index: AQHcGyKJ90rw+TS90UqWTJ4b0NemJA==
Date: Mon, 1 Sep 2025 09:26:45 +0000
Message-ID:
 <41cbf42c319a95c92517b6042414de6d13dda077.1756718656.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB6741:EE_
x-ms-office365-filtering-correlation-id: 58193171-2b36-4bfb-0a8e-08dde939abc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?EEtmG3cvnOwk4IWz6FS67SGSVQGzSyJcDkyzlsnrrb9yDPA6YLEwkIr4jm?=
 =?iso-8859-1?Q?bFzPwu3Yv5N0Ps02a9hKSW2rok3REOQrUZin4LATx8SqTC/qr5Jwwl6g0T?=
 =?iso-8859-1?Q?IFxpwKgJ3z38PJuucCuPIEgw0ReNIoFCHQYFMYH8UUDt+eDIhS3AI6IM/X?=
 =?iso-8859-1?Q?goGJWSBhOP6HmVsjLPsC4EKPzOr8J9RDx6oi29MmBhtrkMixFKSCMz3LHy?=
 =?iso-8859-1?Q?f2nrX6lve7cTBRisPnr3PmF3v+UZ+EsAIwDJe2KUgsv2mwxA9uSJqDUTyx?=
 =?iso-8859-1?Q?0R4TYBel4TxpblKP0z6CXbTWMKWEzijMiXpXzL7ndHucrHULdIj0b8Hqs1?=
 =?iso-8859-1?Q?R3ODWf5cH1voEZVtaNnlm+VTXNYdtpWM81J20rwluXFbVgigfT4hOkFFI2?=
 =?iso-8859-1?Q?NR+e8us2XkwxT5fehvR5Y04odSfqfV/6ideiRp57tIVHWkTDpFJ2Juth9d?=
 =?iso-8859-1?Q?hkx0y4dfNx2MHFxYtjRXKtGIBFLLPTpczlOMQlDvgeEmF9Yc2sBWBwLJne?=
 =?iso-8859-1?Q?MRpU+PBWjFfETYoaPNUGdSZ6Svr0ILYFp3Vy8OzzSNgDGIAcCOH6PnoxGZ?=
 =?iso-8859-1?Q?8QmVeetiqt0we7gIRc/OKXJxmf/jqBskzYZ3KDezkQdNkDolxXEZk4O5QX?=
 =?iso-8859-1?Q?zc4CiLBN0GNNqY096ovLsCfM3jYysZkwfCIhybV0tPpUPo2ck7WLK36Ji7?=
 =?iso-8859-1?Q?cO6rdRYG6hKEf6YYMGwbb05y1I8JYtsrkIxLGMcfu8IWFdXXeXIjHZP5v7?=
 =?iso-8859-1?Q?FzZ0VT241gMRGwE+8USeZzYViFmUlH/QsyO8LAwE3oA/cZFEUeN5qlLJ4P?=
 =?iso-8859-1?Q?qPxUnCkRgsezRdU2pmebBd63XxGiMpldGaZhlgjmAMolkCxEoHq2IL7xGn?=
 =?iso-8859-1?Q?V+FpnbSPVzyt8jSIagU+eVdmDLQDw9ck17f10giFhesW4qVmmYemxSOSfD?=
 =?iso-8859-1?Q?emyYujYMYb8yKEH/6tpjDJUW2ZVY9gu0jm5kKUfkTMi+I1WrdYv4AAA+XG?=
 =?iso-8859-1?Q?X9hOlIezpn2D5e0Z519tjSiS4E6R9dVHHs8xkx1RW8+c0uOG0tfUUlxtV1?=
 =?iso-8859-1?Q?AN3lYKR9gK5u7uUjQc/GxVDBK/OPQdQcRP777MQUqWtGOACObxd/Lye3Ut?=
 =?iso-8859-1?Q?TDydHvnKRHAG7G6z9DYejETbWwwZ3EkTrSduWgdihSM5HbKTzcIBEnGLvd?=
 =?iso-8859-1?Q?1WSDInkeryszwPf3TvQe8XvtMngyzh7GoYKsBGFLv54xsgnkzgEucQBtWa?=
 =?iso-8859-1?Q?FDEFV+gg8OWyHpqy7UA7k+gwzeCcQTzEuwex2Iqd+N4PnQdC6vSt5E6Z/C?=
 =?iso-8859-1?Q?59L4JZK0+aVN8selqY+sA0xbjFXkbAGJEiv/kkDTDU5kGIKrxWIp7402K1?=
 =?iso-8859-1?Q?vgskubAbPpwPVeIvO5SbZA5eVFLDKtGUZAvBDHyDo5XB6ePXl55S4MruMy?=
 =?iso-8859-1?Q?f2VCNByLSynq2//pa4JgbJeiAkQlutt7nSd41lvJol4wam5df3z7ondGwl?=
 =?iso-8859-1?Q?c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fF6ts1ODi12tOTaAutl77fDzZ1mmHgO/v50Qy1QJyT4A+dDvnp+UItLCBS?=
 =?iso-8859-1?Q?7okUR4F22tbkW/nJZtAGiQbN7pujH/WbJ4Q/xUww0Us8S/dtIF0nsTbdIn?=
 =?iso-8859-1?Q?gVR084GS/pZ7baltSfgSe+gAEbHwfAeYfwrTQZ85Wzxn41Qw+jxDot6IWD?=
 =?iso-8859-1?Q?5RCZICcxAs4miBdhnDnrkBGkAbcijb+nZiY0IH3d2TPgqKHTCO5jI6YTmd?=
 =?iso-8859-1?Q?B2xni5ALyZgQ9U9vx6eKI+5Ux2BEn0bwSlk5K7wvHUHcNzhh/kgLHRsQhl?=
 =?iso-8859-1?Q?4A71enKDIxI1/KrmucDp3J5/ceb3POD0CZjYUNJv2IaooavdeMi73+9XE/?=
 =?iso-8859-1?Q?GGZvsbpX3pbC/sabPi143zWucickdPSbqF/K7w+pT8nZ9iBQ9ow5DTSaeM?=
 =?iso-8859-1?Q?rBkFgK/aJDMDRzolNi7UnWbAWUQj1oy8dMH25l/U8mWbwhHx5BlZRfULsm?=
 =?iso-8859-1?Q?bL96kp+3ZBD2fvHHWU7XzykIfQ9Oqnq10lXUuiRL1IHtUy5hxQozW3PWJX?=
 =?iso-8859-1?Q?Agyqd1Jgwpam1NFlAdWGAvYF+0z+b/vP8ZYk7u4pC0ifcf4uJLNQF4lo8g?=
 =?iso-8859-1?Q?UjHgHrpagPDCG3nErMZXJa8ckhteiLkzby/Foglgk3JwX7ao0asavVk85y?=
 =?iso-8859-1?Q?pVs5lD0gguzspHBlJ+2D6+TSIPQgRMymLLCTZBA2ajV0LzkT94opNq2XAg?=
 =?iso-8859-1?Q?h5ojZGvGAYXIobK42+vpJtLBEDppKboWcFsoeHUxCSXaHqQwDuQcpD/2sV?=
 =?iso-8859-1?Q?DJfNv3DZoisGMXx9rKO7b1z9WFIV6lhLh5BefuvxeWTCvbE5rAR7aKRM2q?=
 =?iso-8859-1?Q?4iOEDuDW0YiocjWdSKOG+PUunV+3Dkp4x4GvPaUjKixwGwslGz3Hi2/gv9?=
 =?iso-8859-1?Q?Sh+NEdVPdkxa2ca5i83A/kTlICSaf6++7DPkUZtXj9rHOo2Y3dq+XT1RpF?=
 =?iso-8859-1?Q?mgSakvYTpKX1B3Wg9rY1ec5f7jHWRX4s5q769Bq91nn6rztHLcnm3JJQyc?=
 =?iso-8859-1?Q?qbwUedd4psP4i2ltf3GJukBRGjgnPRaPIw7qJj/XnnvZj81mVQVR+9rmnx?=
 =?iso-8859-1?Q?kzBn8cGH6G/36ze771UJrf4/p6LaPE2ecqgkViBy68dbWmlAa3k7wiy4OW?=
 =?iso-8859-1?Q?dcxWeNi3mIsNEnl8dPXxNjj5fm76JndUvl2zbPXfz+UuSogfuPp/8uA9hZ?=
 =?iso-8859-1?Q?r7fb7KjO/oaX2/rYlx/sA+K+BQY9VtvDGoF+6XhreW9qSsp8ugBezDXD2U?=
 =?iso-8859-1?Q?Lxj3bKj0FLafTz+qd5yOwW3/19hTjxkQk135ziAOBGhauTF4693drbecfU?=
 =?iso-8859-1?Q?ZslY3pRMB/F86TM4oYWCoRisPa0S1ME0ZJSu+CnODVWIpRcwHHkKwKiHdj?=
 =?iso-8859-1?Q?nKoe0QmML52E0+KIEVrDs9+nuYdy/04DlucnLEZothjJ65ebLFJ6kZ9UEz?=
 =?iso-8859-1?Q?nASa4Dmfo49AJsh0cd97HYwFv6rwwr7wa1r6TbEakrjozqyKNTwRQxLASF?=
 =?iso-8859-1?Q?6B5jaJkrXLf6EFsl77Lsj9gdA/6NPTvvyItDkErjJ+whUy36zba6PZGRCa?=
 =?iso-8859-1?Q?ATdKfenSUcCm8JmAa98nbif9Z44idyoIlcH+3zfQslZmQ2frreCeVJp3By?=
 =?iso-8859-1?Q?M0qgMiNjryEHscbutiyhZIj5/jofD+NxBysGThYVcffPnp5b+gbmESwQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58193171-2b36-4bfb-0a8e-08dde939abc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 09:26:46.0784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ptF1M9Jz8mjJ2Hk35WEIrzGj5s+M/L5PwFjVOffthhaGCa8APr31vwhfEtuJbebteJmhRE1guh2dGCznLs5M3bXdbXiUQfxPN+9bSN77WmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6741

Fix an issue in the 'fail:' cleanup path of the 'assign_shared_memory()'
function where the use of an unsigned long 'i' with the condition
'--i >=3D 0' caused an infinite loop. Update the loop to use 'i--',
ensuring correct loop termination.

This change adheres to MISRA C Rule 14.3: "Controlling expressions shall
not be invariant."

Fixes: 041957bad382 ("xen/arm: Add additional reference to owner domain whe=
n the owner is allocated")
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v3:
- inserted right Fixes tag, pointed by Andrew Cooper

Link to v2:
https://patchew.org/Xen/0e562f695e5db87ab80dde69cbcc0cfa14f94b21.1756373770=
.git.dmytro._5Fprokopchuk1@epam.com/
---
 xen/common/device-tree/static-shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/device-tree/static-shmem.c b/xen/common/device-tree=
/static-shmem.c
index 8023c0a484..79f23caa77 100644
--- a/xen/common/device-tree/static-shmem.c
+++ b/xen/common/device-tree/static-shmem.c
@@ -185,7 +185,7 @@ static int __init assign_shared_memory(struct domain *d=
, paddr_t gbase,
     return 0;
=20
  fail:
-    while ( --i >=3D 0 )
+    while ( i-- )
         put_page_nr(page + i, nr_borrowers);
     return ret;
 }
--=20
2.43.0

