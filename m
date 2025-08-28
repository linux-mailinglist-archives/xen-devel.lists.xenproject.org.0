Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B6DB396A3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 10:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097761.1451975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urXpP-0000vg-FL; Thu, 28 Aug 2025 08:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097761.1451975; Thu, 28 Aug 2025 08:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urXpP-0000tZ-BL; Thu, 28 Aug 2025 08:17:51 +0000
Received: by outflank-mailman (input) for mailman id 1097761;
 Thu, 28 Aug 2025 08:17:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRvb=3I=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1urXpN-0000tT-Jc
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 08:17:49 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 791e7e8e-83e7-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 10:17:45 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB6901.eurprd03.prod.outlook.com (2603:10a6:20b:29e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 08:17:40 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 08:17:40 +0000
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
X-Inumbo-ID: 791e7e8e-83e7-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMECBYxrXNebxk3ni77NJ+V+jYvnwUbOa1yn1JhwKHmThV8wIGs3WSqxLI/QilN6nROt0a/3+sAQfqBHKA+bonTlYTB60qewLkgDdkDLsQZx3aRLTb2GBXBCytFejJPTlo9NKW5dG7DQbTkhAs/W0E2PT21fZNnx6t9NFHtdDljIZAgN3J5ClsZKwu92kC9BXSukKl5ZdaKThLadgRDWjL1OTuhNtwtSG7O/2PeBFVavkk9Dq3t3zL7J9iJM8+kXKpyWp+BE29tCywf2kYN4VHvqu0PfSEhMiv4vR9IaxLXo3LLrQz5JdMRWqWJPNq3TPb2kkQbZEdJcTi1VPhHvug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjoIr7lFyfFpDbEr/04MtKkgMC5IM9Adq0/W0rKKUFE=;
 b=v/ZkOI+Mt9JYUPSe5C1ETYDOuofxVA7Wy569Q+GQup6r7GlSJJQuqaP0YVODpxxEi+dzBmE0o11maTWYKOlJgRsFIKoGeUTMw7G5dd8jcSFs7EAW5oSjywP3nAhJsnQxnjX+EXtGcxoYoWHPK3kZLlTUAWrFeN5yjPcTlPuCxZY8i9BUbbmpzeZr/VjoXGcJteRIbzD6foHvh/RtXVEul7WBZa0FZffrgzZ+hsLyiZuVfspu5jyaLGNa3QaiZuxiJR71rqsSil3MOCVhpmiWnbCiHUO1d4URpc2OIRy7xxsYkVzRpXlEgcu/3HnkVjryaFvvYKfNmre/xm/y+obegg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjoIr7lFyfFpDbEr/04MtKkgMC5IM9Adq0/W0rKKUFE=;
 b=Y9CYhtQvrsfewMnabz7tTMhLi/Q0Ek2bKfgi61axCR9YG8VW7wbcZ11VNNCcnLpnrvwwwzgdqGyy2MZUmQKWOeRHuvckJjcBClIIbSKj+EwBcn7GYF+Lsr67Qz7UGbvsDZU8lEXvu9dXVU5i2lQHx2PIWysx+8zhuuJuFqAY1A/Gl5FEA5qSUszzLKw62DVATDXY2LuGDj2ggdG86Lpo1NjQI/gmq+IVBJdA398B5aHYFWUH7CvAAFAjnVGSjBYJ1L1Ex/HLl+1P3eMhd/bDVvYrJF5kORASMWI24+fitSMufZvxPpR8ER7CtaW26CwwzW5HYKGMBOfllQDY3gUpYQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] device-tree: fix infinite loop issue in
 'assign_shared_memory()'
Thread-Topic: [PATCH] device-tree: fix infinite loop issue in
 'assign_shared_memory()'
Thread-Index: AQHcF/Q482rbLahQD0qhywmRaenDcQ==
Date: Thu, 28 Aug 2025 08:17:40 +0000
Message-ID:
 <d7768394209c65cfef4006c3ffc0a0f5d82c4c18.1756368997.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB6901:EE_
x-ms-office365-filtering-correlation-id: c8b9da9f-a374-4f9e-3cba-08dde60b5b33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VeOxaq7kLxps/i/DtiD7qqIAqxon9ewJ4v3SKFXOEk618qrD9Ncg0RpT5y?=
 =?iso-8859-1?Q?gNvV6brx2Oaf/DF7Jktf2AQ5sHPzHyD/uqcsvwPS6abHyQRlXH2yTtpYTO?=
 =?iso-8859-1?Q?yF3JjLn+lWAvYmBpvwSZTtJD7I+5qpl1U+KUUe3p7iNxYvYvQQua4ZsxDO?=
 =?iso-8859-1?Q?DJUcbBk8zobeyCppV/hII7nI8DST+KgPksorDhDbJd7xV2Z1/SnLoj19sn?=
 =?iso-8859-1?Q?HL/J2BdDuGSFPN9uPNvJ3abD25cXLcocsynp2FbsMO6VsNfx5u4VuSipLv?=
 =?iso-8859-1?Q?JcfclRIaRievXQSPwGBpT/rkEOh/31a5NOMxaAIkidvCRQeH9KZe7rIPOq?=
 =?iso-8859-1?Q?f1YuC8HwuLU4Tbx7cv7S6v9BKvDTlBcHk/aSx9sfD7gXdD2Bh+5sKvIQj7?=
 =?iso-8859-1?Q?FjPKddKPxpHDb5akrdafbqMEY51DtYHngYvFbXHF5MiJ2dGJQw2LK0+TA4?=
 =?iso-8859-1?Q?PMp2UeFG+ZoIHDIbOSrWbGK4cblo83a8cinP3l8QQ7CSkrBmm4FkPXJF51?=
 =?iso-8859-1?Q?z8axAAqig2PH3jwRFl5o/qVfjDCNw02WK4GXhDyexfEsPkkESyP+dAk4I0?=
 =?iso-8859-1?Q?GWoC5UWffcGCg3AhOszfhQx8njHg0M502ytwMh9E6CC4oHkFutlwwCDt+h?=
 =?iso-8859-1?Q?T5jO7KAyx+vjTgUTmZrqgxI4MbwiTKv4kOlgRTZt6p/9s1+vLnV4rxDHe2?=
 =?iso-8859-1?Q?CyUJSW2mBbaoYAtl2DCt5FYUSequRgwOPj2ndxfic5eJ5Thc7bypKZGRPn?=
 =?iso-8859-1?Q?+0bf91iu66pOxTyn07zcuc3yZd8f/xXtzrz0ukTYjhtJsyyszwzNxG8nLo?=
 =?iso-8859-1?Q?QoiX8k04s3DyDnFL3hODghwCAAcpboYK8ccMPQJJkF0dXB/ttbHMTVbHaV?=
 =?iso-8859-1?Q?pso2i7tD0hSmY7T6E6i4NiUSn+27bX9PMP5hGuopf8pQJnHH/FV9DP3emQ?=
 =?iso-8859-1?Q?pwm603BEj2R74c70UY116gFj7x5oTdERXPIGkyz5YFYka4FMgwfqhHXzmn?=
 =?iso-8859-1?Q?0eSyRwDXEwlRQLA2R8lAu5tmjX3w+2RxRPm+JBcKxRn9TGDvzUQn99YoMa?=
 =?iso-8859-1?Q?wvoaYaRdgQmtnwc9r98wId5T/l9dXF5RRwY8EKPTr67f9pgJ66eepOL1XF?=
 =?iso-8859-1?Q?MkOOa2wrZf4ht46fhcOt5+/rEf/Lpm5NnANVIoRRq4SwfnAxGQQ+NwGUMq?=
 =?iso-8859-1?Q?v+FPh/EK0QTj5XZxDU5wIrXQZgNz0yDMT7bN58EbxNpjK1eB9m6KO132sE?=
 =?iso-8859-1?Q?jt+V+kyFfU2L4Td1Ov44rfHDLe7JyO8OX7u8PZtQ1YY2Q7Tt8AbET6RaS2?=
 =?iso-8859-1?Q?8a6VIsWpYdqd+4+hIATBB7Js+Rw+p053PGi320cE6k7QH9av+A2b7kxOfP?=
 =?iso-8859-1?Q?feSDqxT51oiLVkBCQ1tcfjZLM95bz/et1kDKJRM2D1iEuP/+W8VmYNnokO?=
 =?iso-8859-1?Q?0eoH30UJ56lV1vl0bzV+ju7sQvv4EPZ8TuNfI6Vcinj7aLp4h0/U7VeJwW?=
 =?iso-8859-1?Q?2vY7dW3epiEc8dSsPRv67IbnMeGOmG1D0iok8wGAX4WQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UjfGqYX5HSOsDV9dcQIcrtiznfIhJVpf7M3DDJlo0g3CVUYUt/Jk/R8ibx?=
 =?iso-8859-1?Q?hguqd/hwuKz3qhjFrJb1CBh3UHUAigm+b/LUK48BCxuJ4F9b/oqENuZhU8?=
 =?iso-8859-1?Q?iDK4s4GEzdw9Pd5AsIA77Elng8pizcc+CW3EW47rJRzOW0fOqKy+IAq1f2?=
 =?iso-8859-1?Q?EFqw32Ydo+xbtBg7eE5qSJmXsVTiLWRo3IDGPkoQGHZQbxwzMl9nJ421x9?=
 =?iso-8859-1?Q?RWc+CYKBaqyQ/ts2xH3TKqFipGzZKjnv7m3fQZaK0RZPlZIGeEOQD5ts3J?=
 =?iso-8859-1?Q?8Z82LJJGl0j4AVydyZgoZakFclwJ4aT5nrCqNQtkppUoAuY+1WTwxwuN3J?=
 =?iso-8859-1?Q?3IJnU7SFcuxen5YxnS23XKqvvJJubhqsQcaUwgzQtcKdXMSnFlI2K+mIb6?=
 =?iso-8859-1?Q?Rq5QrhMsDUgpRH2DJkkGDdWWHDj9L6c/SQZdl2naiJNK+OMhjeRz6Dtf+V?=
 =?iso-8859-1?Q?2x7NIOt7qQQsOx/TCCVVWorKxnz4ren4JeYqLt68XO4JP2WdOnR0am1Cwv?=
 =?iso-8859-1?Q?0E+mSItI8OwshJrKtZNTA2JygNZNcMy6N2slkC0UYgfD4LSFEFbLUe9MVg?=
 =?iso-8859-1?Q?YPT9GM2i3AAjls72y7wiODuRyWvGhar2tAyeu/IMb8NZ9/FHe9h9XiOQxF?=
 =?iso-8859-1?Q?5WdDVzV4ZzM2BRaoiFPKABwzunHOZbF3hqaZFGpZasoZZ5UNfaABo2P3z/?=
 =?iso-8859-1?Q?YTu04NDS6Cv4en+PVKn5kIiM3jShI4UZXFwzXmp26QXsqonfBGuM1Y0l3y?=
 =?iso-8859-1?Q?Wpb5+WS52wTDn6TIMkt29DnLgG/BPgRCkyRu5AA2fJp6PKA3pQmI6vSADR?=
 =?iso-8859-1?Q?nBCI/CPSgBU2hXbMK9MNkONbK4WYEUGYSdFNd7nyGOBMqB3oO0s1/wQf+y?=
 =?iso-8859-1?Q?on+l0w+9SgHAwtBkC7wK8sSQvKhBm5JfXdLK1l0cDtiZyKcxTkMGbjJmAj?=
 =?iso-8859-1?Q?QX17t1hhS7IDnhgGK8ef+tTdkmtBs8JIyvlot9OHw7gWxvyUjnMsZgXhRL?=
 =?iso-8859-1?Q?ANX7vA7h13Zc1reTIOUaV7iZhyK86kngdmEkK1DqrEq7FlWXb8Yj3Rn9tv?=
 =?iso-8859-1?Q?NlzOFNIdT1S2epa5JrYXrcf1tek+1GC1ERo/5BVFuv+H423uX3SuePiLsR?=
 =?iso-8859-1?Q?WBOgMyR5R59RnUtAjnxdGe3Idljpd99xh4Wth3aqrKuMBqUUAEfXDIpWsf?=
 =?iso-8859-1?Q?jSlGeB+yX1UTfWsvDZjbDM+JfWmxH9nZ7X0YFhHPUhM0KX8yfBY5xnzNTO?=
 =?iso-8859-1?Q?Jv6Vk4fErYlgWA2871Ff67HjYPeY9V118dgedklkwYP/yU9RA/CAJMP0Xk?=
 =?iso-8859-1?Q?wTilwc4qsOiMtpqwiqC3PZfuH3ZISKurLaUbuLiEOdgiXkclax0X1g5MAw?=
 =?iso-8859-1?Q?27SNjvOo03/vo5HiueGZ8gjCHkVXFwEjP/zSySWKshz8U1TUxl46TIumNs?=
 =?iso-8859-1?Q?c9ntF8R/615BQbMcZaYFseqE/q/wxybxCAKO6DsjxQ06tR2tqbdHUICnhl?=
 =?iso-8859-1?Q?VhhzBse0KQBkQG6sZrSYmSXrQXakG7L3ovSJRJFgNSVjzJBAh+tHbwm7RU?=
 =?iso-8859-1?Q?ZbctysW8ol5llJ05z3gmGXTmCmkJBPWF+wJ+B+XJmPQtoL4Gp27E8Poblp?=
 =?iso-8859-1?Q?+JLymuWCLmtqQJrwUYqBuliQkeRJ5KW9q10gXR5zycuCtguSIyAle/ug?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b9da9f-a374-4f9e-3cba-08dde60b5b33
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 08:17:40.5200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w+DJMZozOhr+pGWWs1JhanrktNyKQyjdRmB1f6b9PHyA9ud/lWfuni/G73h9ciKnb2DWK9GQdtFGEXjq6JtkDxDhX5qXsLtWrJy5gWjMUIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6901

Resolve infinite loop issue in the 'fail:' cleanup path of the function
'assign_shared_memory()'. The issue was caused by an 'unsigned long' type
for the loop counter 'i', which could underflow and wrap around, violating
termination conditions.
Change 'i' to a signed data type ('long') to ensure safe termination of
the 'while (--i >=3D 0)' loop.

This change adheres to MISRA Rule R14.3: "Controlling expressions shall
not be invariant."

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/common/device-tree/static-shmem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/device-tree/static-shmem.c b/xen/common/device-tree=
/static-shmem.c
index 8023c0a484..b4c772466c 100644
--- a/xen/common/device-tree/static-shmem.c
+++ b/xen/common/device-tree/static-shmem.c
@@ -134,7 +134,8 @@ static int __init assign_shared_memory(struct domain *d=
, paddr_t gbase,
 {
     mfn_t smfn;
     int ret =3D 0;
-    unsigned long nr_pages, nr_borrowers, i;
+    unsigned long nr_pages, nr_borrowers;
+    long i;
     struct page_info *page;
     paddr_t pbase, psize;
=20
--=20
2.43.0

