Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDABC25F6C
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 17:02:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154431.1484444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEra1-0000Q1-3f; Fri, 31 Oct 2025 16:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154431.1484444; Fri, 31 Oct 2025 16:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEra0-0000Ns-W8; Fri, 31 Oct 2025 16:02:20 +0000
Received: by outflank-mailman (input) for mailman id 1154431;
 Fri, 31 Oct 2025 16:02:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zurH=5I=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vErZz-0000Nk-5M
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 16:02:19 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f994f63b-b672-11f0-9d16-b5c5bf9af7f9;
 Fri, 31 Oct 2025 17:02:18 +0100 (CET)
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com (2603:10a6:5:34::10) by
 AS8PR03MB8086.eurprd03.prod.outlook.com (2603:10a6:20b:441::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 16:02:12 +0000
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3]) by DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3%6]) with mapi id 15.20.9275.011; Fri, 31 Oct 2025
 16:02:12 +0000
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
X-Inumbo-ID: f994f63b-b672-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llRzjxEYsvu2/HYBgOmudEPqptgZvNNnUp0C1IpOg4NDs4XtRrYV5T8UjtSt44eR1QydU+uKfMxkh7taByjiaFphfDu9E7Fx+ClBnAJU/Y53Dzq7ht2DXT70egdhd8cGptevDYJKiuogcviSByJSGgtuWoAuvrvVHxjcfZMvxWRqCZX5h8WNiUG2Vm9RM+Ao1JeQKLo6EdtVsdD80qrViPA2dLz/fK3l+DJnLBa7sDg7B0fckvHmXLutCLch72NQroDAXEZP7xWhr68NaoW2yohV47drSo2+GFF4fjcJVH5nDQjfMtgQ3C67hqwUFcp/SZQRt2EE/NmJEs5i0OE0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1RxMvrVjsQno/BNcxzOud/HVNgZymkixfmK+BM1naI=;
 b=mq03++HIYzHdcovKBRrXfXNcvYWTEMfp5f4mV/MtlRxUYxDDbvkMfH0xkM5jIatP2vWCxx8iFntg0UO+peb6XSMBKMNnst9UQdt6lf6TxeOwtdf6lkFxCMkKE/j0JGSIBDpcL2QAIV8jNCVw3d6FCuKbQK5P1FWgZRZqppUJew7kD91fV74BO9jMWIYKASkzYUa5Q/I/pbDCZE+TZTSzXw4i+EGCO/H1STMrrggr37s5doJKSWfQELdy4746y3+xmhpJwKqkPsn4c6AkJVsYtbYHAjKsgxdCB0s0L4FYstfM/I1nxdgsgdClD4uL70xpnKgEANBN1U3vlvMsj0NZCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1RxMvrVjsQno/BNcxzOud/HVNgZymkixfmK+BM1naI=;
 b=Rrhqc4QFoTNK+7CzBN1CAVGzij9SWBa+aCz0P6LbpLhLnbqt2Txua7OhoEOW/6S+aQ1MiaFe/QL/svcKLBeIDsJfOgp8cdxvN0SwInnYQpKgQa9x40JVBYe4hSoGklsyDDyjK4KcF/o8JXp0YqjurKKDj7e2DsEAmgi+2sFQAXugJkL9PZDvGYJ4gl/ipfmUufWrrndGRM1KSl24UGMOvXmHoZ8iGkVNh6zl+DYWwEaTWzAKE2+Pdt20G3nbwTDlQTtkHPYE+kFH0lZGdWuPP9dGSWPUOS1FqAFIe/DN/hj1CWYjDXchSLgfy38kynQVG7E1AAIFTyYM4em6kIjBdg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] arm/xen: zero init memory region before returning to the
 heap
Thread-Topic: [PATCH v2] arm/xen: zero init memory region before returning to
 the heap
Thread-Index: AQHcSn+3Bvk2A/mifU6ZI0j7ZDmNtA==
Date: Fri, 31 Oct 2025 16:02:11 +0000
Message-ID:
 <c2a15402f87de85c2733362ef3ebc3ffe55b231f.1761926280.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB4140:EE_|AS8PR03MB8086:EE_
x-ms-office365-filtering-correlation-id: eb719ee4-4a2b-4758-7a49-08de1896da54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qvXIhqr8jpo8pqDamu5VlcdJItl0LCPfuJ8DUkJKhQIxIipiN/PF3OwCJy?=
 =?iso-8859-1?Q?VPvRuXLWgLt4dbBrF0FSh1jXCnz9HJs78VWe5zZZc4eSd6sHUht+RXylQy?=
 =?iso-8859-1?Q?hZBSYYnQE46StolPcfEnw9S9U8MD6e7lgsZze7NLTnhWN/jCjZ7KuzKGMZ?=
 =?iso-8859-1?Q?WmRszmOEd/5iqFZ0la18U6tyJA2jr+Qc93aX1vfCfJUacq95PU2clO0ZzW?=
 =?iso-8859-1?Q?2ZsVzTu3AzdBKIMiuEMR9InNosjndqBYo5hkOdVHAfAVwyv85qBXo3pTCo?=
 =?iso-8859-1?Q?5YOxpUqMqfDoFOV5Lu6ZbB7+pTc4+usk7sZCEMlkIXIqHLCUHIlnWK0qpU?=
 =?iso-8859-1?Q?daVCAOavLtT9uMpq9wRHLYy3VMKpmu/6JV5XaAXovKd3ELit258zJlLEA7?=
 =?iso-8859-1?Q?gPgvp1Hl2mhK4MVXCEWr0yAn2OJUU83y9pPpFiJ1RR1Q+Bq+3B5aB1uAqs?=
 =?iso-8859-1?Q?ufYnejzLIrqiS86/vksOesbnyvXP/oPbVyUfZRloFEq0kXlCSaCfqspYyi?=
 =?iso-8859-1?Q?d91Kx5E4Sh8qlJKBA8xXpLeVJbKiAwYEkwbMLrBoEtoK9Zp2xVU4hu6gMv?=
 =?iso-8859-1?Q?IViA/FEPNriNU+PG1iwpFgn1Jhf8lKIH96fXXwR+7ivKC5wE/M1CipX0rx?=
 =?iso-8859-1?Q?O4WewWcTU7Dk6j7liXjnKA9Ug7hIfAFGmSOpC9NpxgTOrlH0VvT3r68hNT?=
 =?iso-8859-1?Q?+opJEo+zubJPyoOLeMtleVlRqzqRRokBjofCYWeGcYqsk1eTIl07kxOSXL?=
 =?iso-8859-1?Q?jom0hAF/9W1j5HZXeILzolIdjxvHaKWnAQGqv4Y1iO+kzGtN98XkQYBKjO?=
 =?iso-8859-1?Q?r6MOBouQDljISks88qddOnvO/AASQjd7LijC98y+b274d6x/e37n5d+C/k?=
 =?iso-8859-1?Q?gncqSJPSfAEp6VI4PwJjCpwsQjDhQg0xKNUwd12WgKutGE4fOBdvIqyQfe?=
 =?iso-8859-1?Q?N3PMkaMFsXjREdSmW2o/qAc9iKLUeExUZZnvaHCq+dTJbY4lZg4iqiexEo?=
 =?iso-8859-1?Q?lBXGjVQAp3raqja4zH2LxHMbxsnbvCynHECswiETXPHwuZiNGmFnStobgY?=
 =?iso-8859-1?Q?mD65QywWDmNMsuZfFc/9rCLRQvocOcxDW+5795c7bw4xolA96DZhB3L7fm?=
 =?iso-8859-1?Q?MXH+qS56QiDCHIoq/NlgevM9oCR8+iMOiykJG/HbCwlk6bf/5OIFS4dODX?=
 =?iso-8859-1?Q?3arNA51a6Enhgk/IloicSk0FQ/BTu6KyGXKOcYHHc6Tr4Mf5TEjtIFdkGT?=
 =?iso-8859-1?Q?MlrWLu8RkK6/s7y6Ld1bgPP/Pew0Q2RCZtEppPu+WG+aMxlQfngkYLYWzI?=
 =?iso-8859-1?Q?XNqUR4sLkwyHsPEZGQTrqnuPwXrUQSkFgGXeKrAlDUZMvVBbl36/fFFC0a?=
 =?iso-8859-1?Q?EYHGCWMFgqwDjB4c+u+BhwlI76EqOec5p3NWdoqW2YOcxP9jLN646F4zB8?=
 =?iso-8859-1?Q?l5tzWvjxuI4vyXVZK++T8ZlYgQ95zW23/RgS3GJEZvMmC6LKBDmUel3QAB?=
 =?iso-8859-1?Q?loGKsWoqNGb8x0+2RmdnQtDj8Gd3VMGYCk0dVpZ/sgEw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4140.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9XgAf42k3qUTaPUkeFySduX37qZ3BoFcooGCwwkCAHxibpwpYPiFrfSU0r?=
 =?iso-8859-1?Q?2+GEGDk5RzezVPTMJzXQOb/pUZD72fvDA8ucnkyT42Z40Q0elfC2tdoT1b?=
 =?iso-8859-1?Q?2lzl5MVB5y4FR6+RHQ3Smjikkxf0hHJTCGbO2fR1AASi3oOQ/y901TTIOs?=
 =?iso-8859-1?Q?H5HMBd7B3QdTIi8sSWPPvVT9UfDiUmRZ/T5AGyZGrASj79VCPacEX/IlWk?=
 =?iso-8859-1?Q?z/+yRLOhiEZqzS/q8vYmOYhWg8WVLLMp7kDTzn/77uoYadM+tKc6ViAOpG?=
 =?iso-8859-1?Q?IVMIjxHef1eOvqRGRrI5fegS2a34x/rYN7WLy3np8GeqKo9kPJyy0AaZkY?=
 =?iso-8859-1?Q?1+OfmEOZRxxZWYSkotBNkIYW5v5o6OCOhaI3qDekhWuBVXK0UODiNZtCGa?=
 =?iso-8859-1?Q?CMNuQorU+fCK4I44ll4Dxi7AKlGw/ObKWrwqk8qIw4qHeJQCvqHd8G9FzB?=
 =?iso-8859-1?Q?rRqcWNK44fEJavjs8eoipHbMw864q1NSg8BK1TIk+BbmOCwNycFG/9aGUA?=
 =?iso-8859-1?Q?hMnbs/+czRBZkEu7v7tpleWm3Rk1agI0H7c+XSEr3pcGopD0qpXpvZZ0li?=
 =?iso-8859-1?Q?wha82Ssgl0Ch4f0jFaXxFijJdye4cXBNm0bI28HG9IZxEklaFS/Q8u4aHq?=
 =?iso-8859-1?Q?g70Qus//se9Xx7dxwvm66qVLvuQVvshneqnYxt2iDHH+uQc/UJKq4frDK0?=
 =?iso-8859-1?Q?PdSGKRoN1RTHJyW5iUZnf1RDDhemcaK+yTxqDEmVpzkcej3kQ11HoTSahE?=
 =?iso-8859-1?Q?1L+3YLp2aofkXze2fWzzL8hLCIkDnbBQ9XQJLZxXAVtDaoA/PGowXc7wpX?=
 =?iso-8859-1?Q?gRPaH/m+F4wVBm9ExkZ7pd6lVYmpP29uF4BYaaHpl0uW/+Z3wePV5HL+EK?=
 =?iso-8859-1?Q?s44p1Tp8fdXXW00H8cgWPXa2AOaCt8yz7u8dprI2tMoY7VnPTqSMN7UBPn?=
 =?iso-8859-1?Q?qYuOu62CnYaXfntc9PMsew/oApwULyv2JB7hPB2gv1VjN7DGLG9+q6vCGO?=
 =?iso-8859-1?Q?UfVTp1x3qjH7HLmJtNrEDHmtVYYl8c+A4HgZ/GK6ZSAWPuhwY4Mu9d1LId?=
 =?iso-8859-1?Q?dCv1OJS/rZ21wd72bvEbO46XdI6C6F1w6fdEOthY2K5d2frO9Ss3+kp33K?=
 =?iso-8859-1?Q?A8E7vNKtPMNusAk6oaPn3wRyPh8uWo3QJsylHdDMFXTA374yI9WSFu6jOc?=
 =?iso-8859-1?Q?NRe6GrTpXhsVt2u7bAyd7XYuh8ybh9ta09Qz46DJ6K5xBKi7BIz3YSh47E?=
 =?iso-8859-1?Q?k1A29apNi3k3ZAsesAVxSOjT78jiO6CNImxHEjJZa899OcAjI2+HIJIYxE?=
 =?iso-8859-1?Q?Ia6lgMuZII1G0Xxfhudxd/h+s6L9c+5PqhZBh3/dumiW2DzPKa291QCFZl?=
 =?iso-8859-1?Q?YtW6JRqhCqJBMcuWMyi6ig+Ybio+5qiNHa1Q7YoKyIMuOWMcM37qmhsZZB?=
 =?iso-8859-1?Q?/Jv0LB4leqWQu/PfH457W9JAGHgpfE84JNk1oyJmG4C130kKZWH+2UBM3E?=
 =?iso-8859-1?Q?pJFReOZx8AEnuK1bLKjdXyFC6eMefQYxnHoVESVMdfo/HJQ85Q8B2j/Xxz?=
 =?iso-8859-1?Q?uzZ8+tBW0thhtj127/toBQ5Wuz7nVHS2QiLqRitxk1G3Lfr8a0HyMnNRf6?=
 =?iso-8859-1?Q?GvVhtPMae1vtBWlOEEqmjojRu1ERkjc/eEDyUYYIvQODvDjstX/Q/SAw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4140.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb719ee4-4a2b-4758-7a49-08de1896da54
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 16:02:11.9962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GtRs7tH6Hn7SUAQkyO1mHZBgCIiy5esKNHhYogDabAjEe73zdrdxj8O62DVy3I0zUoZYUgWjllrgmfpLLBB84/uEGulfOkgSJFNE2p61mx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8086

The current implementation of 'free_init_memory()' fills the freed '__init'
and '__initdata' memory regions with a faulting instruction before unmappin=
g
and returning them to the heap. However, after unmapping, any access to thi=
s
region will result in a page fault, making the instruction fill redundant.

Replace the instruction fill with a call to 'memset()', zeroing the entire
region before it is unmapped and returned to the allocator.

Additionally, this change resolves a violation of MISRA C:2012 Rule 11.3
(cast between pointer to object type and pointer to a different object type=
),
caused by performing a cast from a 'char *' to a 'uint32_t *' pointer to
write instructions directly into memory, which is not compliant with MISRA
guidelines.

No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v2:
- replaced the instruction fill with a call to 'memset()'
- changed commit message appropriately

Link to v1:
https://patchew.org/Xen/680a7418c445381d68fc95f0e3cd03f574fdda86.1761672602=
.git.dmytro._5Fprokopchuk1@epam.com/

Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2132383252
---
 xen/arch/arm/mmu/setup.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index eb8ed19ca1..9b874f8ab2 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -479,9 +479,6 @@ void free_init_memory(void)
 {
     paddr_t pa =3D virt_to_maddr(__init_begin);
     unsigned long len =3D __init_end - __init_begin;
-    uint32_t insn;
-    unsigned int i, nr =3D len / sizeof(insn);
-    uint32_t *p;
     int rc;
=20
     rc =3D modify_xen_mappings((unsigned long)__init_begin,
@@ -495,15 +492,8 @@ void free_init_memory(void)
      */
     invalidate_icache_local();
=20
-#ifdef CONFIG_ARM_32
-    /* udf instruction i.e (see A8.8.247 in ARM DDI 0406C.c) */
-    insn =3D 0xe7f000f0;
-#else
-    insn =3D AARCH64_BREAK_FAULT;
-#endif
-    p =3D (uint32_t *)__init_begin;
-    for ( i =3D 0; i < nr; i++ )
-        *(p + i) =3D insn;
+    /* Zeroing the memory before returning it */
+    memset(__init_begin, 0, len);
=20
     rc =3D destroy_xen_mappings((unsigned long)__init_begin,
                               (unsigned long)__init_end);
--=20
2.43.0

