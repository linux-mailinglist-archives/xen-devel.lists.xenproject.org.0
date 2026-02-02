Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG1RMXzNgGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:14:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54827CEC44
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:14:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218793.1527679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZZ-0001Pj-2P; Mon, 02 Feb 2026 16:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218793.1527679; Mon, 02 Feb 2026 16:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZY-0001LO-Sp; Mon, 02 Feb 2026 16:14:44 +0000
Received: by outflank-mailman (input) for mailman id 1218793;
 Mon, 02 Feb 2026 16:14:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZX-0000fY-0v
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:14:43 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47287423-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:40 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AMBPR03MB11643.eurprd03.prod.outlook.com
 (2603:10a6:20b:731::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 2 Feb
 2026 16:14:38 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:38 +0000
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
X-Inumbo-ID: 47287423-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2irMBLf38WWpd/dgjudEA19VynaRhlINTjNU5Evo9bOMNNgN6n6ZiZYXeyZHgX2OJOGc1sjB2lhL/Tz5xx20vWgNGmSjhQxbN6vAyGdEMogspkHBLa1Efkd6oKvRAh9ooZPy1Gjd7bHGSfAauvePf3cabUFtMt5Nu9kT3kzacdUyqUdfRlJO1OPkf+5htdpwVvZ5E9ArC5QZqXwH7MZGxtNG0rjiYVCW5wM8A6IHwhs33KJv6uxVXv5l50H2bDqJtQOK9yFSN3hQZUYVs4HnBaif3bUgl6ZNYEh0jHJYJnsXYEQxvBEWbQvDsOYBmB0xCpGXRINKABtd6Icyey2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUKC8PxXATJx7SpqIhLHzMIKs4Vp6o1Q57Ysq2ayrD4=;
 b=QWrZ0E3W7NFk5TD3xtQweDgR+YPYaEc44SiYChevCkYEofNCW8Ls3VPpSiPyPieIBujKMnvDY7n9/FI/xLsy2wMfaGSnoPGBKPVtOUQKGLQtM7bkDtIEaWmG7qTqDHJNT6Ea2K74R65vBFNfxI3L4LDRReJUsn9JKGW4/rT5wtDo/KhR/3RfV1Ldqc4Ee121o+s+iRuPpW+bL1J7oxzN3aifj0DOUYIU3QKhnUFKes989hjH4BBSR25y+39WV04zXWCvpgfPZEEvrkcnvELYBsMIeeKSVT6QFiQjSxNLFz2vSkihyTlOVStJMnSjBYY2Z8Y6IbB4JvwMeihQTn5PFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUKC8PxXATJx7SpqIhLHzMIKs4Vp6o1Q57Ysq2ayrD4=;
 b=OybhA8M8XwL8cqibmAw1d+dE2G+U/bjrXcU0UwOx18aNopQIMpaY4GE+A6KdAHhQ7oiuQrzhkZzkeq+W1f8xNkbyO5UHoHKsL8t6hwLAg8SGjJqV33xtdD6HO/EDp4igkNp58GenqStfRP3xfw79DICEiwPBQh5VFktvEy28K/Jpum3oMAlATlWChPpP/ptUX75VPFUOQ4jAZGqCd1RU4/DnXFihWQxJnuSvLWevece4nRRmRfuM5OzBDT7wLrvc/1EfjoAAcM6b00uU7MOo41g+VrSWLU7/+wAiHvxhtlyEU8ebK/JSaIBmXxp5q29giieEhoB6aZsE5mRyA0vOGg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 03/19] arm/its: Export struct its_device
Thread-Topic: [RFC PATCH 03/19] arm/its: Export struct its_device
Thread-Index: AQHclF8HcsGkFxai5E6CQapzQPG17A==
Date: Mon, 2 Feb 2026 16:14:38 +0000
Message-ID:
 <cecdd9e18733c63f36f29c1043b249cf431d8a01.1770046465.git.mykyta_poturai@epam.com>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1770046465.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AMBPR03MB11643:EE_
x-ms-office365-filtering-correlation-id: 0d63e815-d2ec-4e10-9f97-08de62762a19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?j3x1Euh471pR+ixsPWpURI3ZddfnIAd0QK7LliKvwnBIqtZuN+jaa/4AjY?=
 =?iso-8859-1?Q?H3FssNo96zOnuvhey5RrnDALFm+X2OCiMiHMsZLSaalaFekqKYjVdeisaP?=
 =?iso-8859-1?Q?NSjz2aBBfv/f7od4v2xe4xIscIErza80fNeecZ4MbZ/PG/gwCf80PmwRUS?=
 =?iso-8859-1?Q?kovVhlJ2tZeAOML2MUTQjld7/hwWmK7aRZ+bCD+x+zxW/pDv47aTSySnBa?=
 =?iso-8859-1?Q?vfZsHCtko5xNXW72pK5zp4udWjvx6GoDHZo3CzcKZtGFT24b0p/L/YOIJw?=
 =?iso-8859-1?Q?8Cinetcv2pQa1Bb0sf4Ix6P3pRzw8eaUTPiPK5/w/uXJztqnXCrDFirAgW?=
 =?iso-8859-1?Q?kVOBdIYuqIOUsnSUfUuYCKFne93oelscg9lBSAiBYd3ZHlZYIJzHgqQ6O5?=
 =?iso-8859-1?Q?T1pvPktc2WGBNfrU9xMos7jL0cs4iyxRdi/N9uxEQc/vBT//KSFtBqV2/R?=
 =?iso-8859-1?Q?uH4BGRdNPavR9S59Abb0m0OpgqgXfC+8ac70vN3OhPmoXSDXO4iZinGoLI?=
 =?iso-8859-1?Q?2ZjdHHELwEbx33S9YkSug9jM+BzQEhbd5oFAuEHq+aI5Bll/qBPiETVplh?=
 =?iso-8859-1?Q?ETCDUGy0GYHpVgNVn3lzkSLT2daPxnj18qpgyki4/fhBlqEJ06286YsVU+?=
 =?iso-8859-1?Q?Oeg9CNxpuF/ebUma5WNQw4lz6NZerP4iy2xzq4gTUQX8PKHm8hMSboeJ2L?=
 =?iso-8859-1?Q?8PDDm4HgKzyUJos44esw7+cuWdp6RBsUsW+TAzqkAx3GWUbwCmx1PQu3Dx?=
 =?iso-8859-1?Q?keCVww6J01/PbNDR6PCXldKUFNzVp/scLPW1M4yUFM4qZ2GYHvNPr+oP8x?=
 =?iso-8859-1?Q?trTsSedPmPMemJ6X1lpB68cNu+qIIDERtBu+FOfSFPfpEFsUnmkE4+4PH0?=
 =?iso-8859-1?Q?xhRd5v4ZjMh9bESnVQyqcjkxL6g91r1Zn5rGurG9lpidCsaLfhCJVd8XkR?=
 =?iso-8859-1?Q?rn/2IxihkQmaB64Brygf6RaAlrECi3+JUz8l7OksAGmNcBwM8lPbbCUznW?=
 =?iso-8859-1?Q?vC3FAt8vqZDhjb5Q+f525FPTBG6OFbLITCnJGcSlw7N5tUTli61dMtxRuJ?=
 =?iso-8859-1?Q?vmF5a6AKT9tKrbKRRnqT1m1c+Qi6DClIyAbFosOzDYvKU/F4WzUgEoIbPt?=
 =?iso-8859-1?Q?Q9Hj/NxziVqsA3G+Rs1J7uzCk48emoBrAZmRXDZmwWEN4aIXiyK3FDOt5Q?=
 =?iso-8859-1?Q?mbkda8o2Jq60GcKu+G/f8TWSqTmzaJYUymDcmLEItBN5WVg4ERAzde/O5L?=
 =?iso-8859-1?Q?LOQnPIwY9Dgpl7DNKK5qWxpkdaNa6QwPcLH/p4RDgMKwCvuINjpVbj6uST?=
 =?iso-8859-1?Q?yaDRE2bdYSf+pIFXUuHZMcKiJ8hTMEbA9W8SkDDhICImxXPBLV3mjLTzoj?=
 =?iso-8859-1?Q?AdKcJdWjsN1+TqD2Kba6FQAqRrGEYJKJKvwG3T6w602q+krmZf/UfxNZiK?=
 =?iso-8859-1?Q?TV5A8GjaP9AHVwDTe313F8RL4/J05zvvEwH7COAu4vLA4TZ0rHha5FR1ag?=
 =?iso-8859-1?Q?yt2MahdJT2kZIiVaUdyYbT1OTTddwwRAB/sSEuxUL5jLZxruQ8JpZYKah0?=
 =?iso-8859-1?Q?/r7uPPYpdgDtzUPNTnwguAaRyVFEILeTpEI1y5Q1Dx1TxgKXJzZu8oNP8q?=
 =?iso-8859-1?Q?ZR9rr+J5Ta+NCrRoemqG5T4VZFZ0oxJrIpMBN/wyq7WaoomnpBE9YJDV8s?=
 =?iso-8859-1?Q?/TaLvBSWhMNyg8wFs24=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?aKdz+449kl414CdQuR/4h2NE5DZL7Ae87FadQs8eq/bwYLj0wECKhkCjm1?=
 =?iso-8859-1?Q?mDSZFYI01Vf4oQen4y3rP7BVVCEyfRjE9nZKfcNyKH8t3Dz8rwZF7f2vNm?=
 =?iso-8859-1?Q?OX33tRJZSo6yDjOKTenI/6HOmIZHMl/Cm47g8W+Dh94wZugJFO5GZ3ygsO?=
 =?iso-8859-1?Q?lEbA+dm++u2621zNhA3inTUibGnyLlRRdyMXuwzsbxDcHvBCAjmRIJIiOq?=
 =?iso-8859-1?Q?FUmIW34PtYj2vLmLjCgfy2rB5ChuYYxfuEqQZuS2XUtgFUhQn0fY8jgA+s?=
 =?iso-8859-1?Q?1w+kxfzfTp6pDN0sg+10SpkyJNFoZOj2UDn1QtDk4Po3IpmGpmJ/0pQzEW?=
 =?iso-8859-1?Q?z9EYI+oRg3cb2yFynRQvyFnqmzd+kvL/1xE+C/Fs050LcCkPufd5SKM+/a?=
 =?iso-8859-1?Q?Z5kRXgk7xPEDY8vB7gKR4ELbKbOs/3smD5DlxwI7jEvj7F3VadYfG/FI8R?=
 =?iso-8859-1?Q?/FNjJ8mn7Lxp1ybXRsNStXuiL+xZWLIqCWBwSDQsMeKccrWKPIJs3krWLq?=
 =?iso-8859-1?Q?QCyo3OBSugRRT538rOlvxWEnXm7X/xFqPJoL7RnO2maatQEakAFljK4r0M?=
 =?iso-8859-1?Q?LGiKAezmRiwbOmR3d0ZIyG5/7URclYMP6QGUxgDQ4+/jUdPZEQRg5XsLcV?=
 =?iso-8859-1?Q?+oYKNZ+Kud75ISi+9HisR8yBf3vS5+znoCYJsrWC/sk3FbtivIXalPglij?=
 =?iso-8859-1?Q?3pBzCqOjluyT+pOC3X+A5bfvhmNhP+WuoepH/uhmCJ93YW36wrIysDnzC4?=
 =?iso-8859-1?Q?6YVSVaRyFdGHxuMns4oR5fCso5VB/03XqXlGWY3zjZaz+7GxUYNjzkc4fL?=
 =?iso-8859-1?Q?swxDQ85qAFJklzcGnS/RB7JqnH+33EthDdxcvhWkPSBR/OPcXvSPtY2uX5?=
 =?iso-8859-1?Q?ZbisBXyc7eK38rN15DQa4Ni5p7o7LThWH/o7NBcK3O6N7CKXWDF0fBPerK?=
 =?iso-8859-1?Q?VgPPuYQ/wQIV3W3Ol5BvuadkSezFGIK8uhOaJZpnSXekRlBP6XnGdGEOhq?=
 =?iso-8859-1?Q?IIF9Ce2RCt0mDOFYRvCW89RqIwc+oYdJiyBdtI2cnddxhuQAKT28qW4ybx?=
 =?iso-8859-1?Q?ornbslOEpDRDjvFTCSJTAve2aA2mwYQo8ZmS/NiXP8FKuQ/1aiLB2alppq?=
 =?iso-8859-1?Q?cEpj8rmf27gbIexeF58nC7oLQiMpladDIOqbN/wt2BthLkqIUs9DSHBaTh?=
 =?iso-8859-1?Q?1hoenqfTtwHTmX9tE6hXubvg0/UMBUAi6w7y6vemedoZQtO8oUWIB0JZFX?=
 =?iso-8859-1?Q?GztRUvXAI8Qt64rX5DT/3sWnLcIGL2b7hiIhGXQ8PCgWHh2VI3x5E7QpVi?=
 =?iso-8859-1?Q?oAb2lR9oUIlpmm3CD2BHou7KhMN1MRkkdXbxkuQjLDG+kOt1KCDYL/uKxq?=
 =?iso-8859-1?Q?d6vqa5L/FNmlopAwtNZrhoo1v8WxU01nZcEqm24J/WfeV/47ctkA5hap+1?=
 =?iso-8859-1?Q?M6tKtEKQrFWKlk0x1gEQ1B7iUO8KeKGozOsRXblCdroGNTX9mBkkkU+xow?=
 =?iso-8859-1?Q?0mamiQma5+lIFsYvYRZfaC8sQwxjoUs9yoEe0CGI8Jsyz8pf+LMHuFlqJo?=
 =?iso-8859-1?Q?zkKCWuUsgFmNcOXt6stBl6SCEVR0ZcGV8AUE/K1NYUsG5ebhiDznUH8WaU?=
 =?iso-8859-1?Q?K8PgEuapefhbiLhJQV/Ua2YVVWPNiReMPdtVQzd9I2q1CVPNaIX3iwUoVw?=
 =?iso-8859-1?Q?pQez2pz01lBZfl+aOVY+/IVOruk8WTUjm4QA694aq6i27Usxh1SYDxLVTV?=
 =?iso-8859-1?Q?5i0Rb4ZdhaptLxXUaiJzi8M7xgoAANxbKO1fcnPjpE3i+Yn5wkFHxojj2J?=
 =?iso-8859-1?Q?UAsQJjXS5UbobSjO5gTFa+QCkPi3+eQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d63e815-d2ec-4e10-9f97-08de62762a19
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:38.5061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5F71G833OERRta/JCzqHTQNxuHXsP0F/tDRlw9VysD6uy7dySJnn3C9SLXFMkEXw+UhAdLFLYtaGwsUtgjC7LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11643
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,epam.com,kernel.org,xen.org,arm.com,amd.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 54827CEC44
X-Rspamd-Action: no action

Make struct its_device and its commands sending methods publicly
available so they can be used by GICv4 implementation.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/gic-v3-its.c             | 30 +++++----------------------
 xen/arch/arm/include/asm/gic_v3_its.h | 29 ++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 34833166ad..25c07eb861 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -30,26 +30,6 @@
  */
 LIST_HEAD(host_its_list);
=20
-/*
- * Describes a device which is using the ITS and is used by a guest.
- * Since device IDs are per ITS (in contrast to vLPIs, which are per
- * guest), we have to differentiate between different virtual ITSes.
- * We use the doorbell address here, since this is a nice architectural
- * property of MSIs in general and we can easily get to the base address
- * of the ITS and look that up.
- */
-struct its_device {
-    struct rb_node rbnode;
-    struct host_its *hw_its;
-    void *itt_addr;
-    unsigned int itt_order;
-    paddr_t guest_doorbell;             /* Identifies the virtual ITS */
-    uint32_t host_devid;
-    uint32_t guest_devid;
-    uint32_t eventids;                  /* Number of event IDs (MSIs) */
-    uint32_t *host_lpi_blocks;          /* Which LPIs are used on the host=
 */
-    struct pending_irq *pend_irqs;      /* One struct per event */
-};
=20
 /*
  * It is unlikely that a platform implements ITSes with different quirks,
@@ -155,7 +135,7 @@ bool gicv3_its_host_has_its(void)
 }
=20
 #define BUFPTR_MASK                     GENMASK(19, 5)
-static int its_send_command(struct host_its *hw_its, const void *its_cmd)
+int its_send_command(struct host_its *hw_its, const void *its_cmd)
 {
     /*
      * The command queue should actually never become full, if it does any=
way
@@ -258,7 +238,7 @@ static uint64_t encode_rdbase(struct host_its *hw_its, =
unsigned int cpu,
     return reg;
 }
=20
-static int its_send_cmd_sync(struct host_its *its, unsigned int cpu)
+int its_send_cmd_sync(struct host_its *its, unsigned int cpu)
 {
     uint64_t cmd[4];
=20
@@ -270,7 +250,7 @@ static int its_send_cmd_sync(struct host_its *its, unsi=
gned int cpu)
     return its_send_command(its, cmd);
 }
=20
-static int its_send_cmd_mapti(struct host_its *its,
+int its_send_cmd_mapti(struct host_its *its,
                               uint32_t deviceid, uint32_t eventid,
                               uint32_t pintid, uint16_t icid)
 {
@@ -322,7 +302,7 @@ static int its_send_cmd_mapd(struct host_its *its, uint=
32_t deviceid,
     return its_send_command(its, cmd);
 }
=20
-static int its_send_cmd_inv(struct host_its *its,
+int its_send_cmd_inv(struct host_its *its,
                             uint32_t deviceid, uint32_t eventid)
 {
     uint64_t cmd[4];
@@ -897,7 +877,7 @@ out:
 }
=20
 /* Must be called with the its_device_lock held. */
-static struct its_device *get_its_device(struct domain *d, paddr_t vdoorbe=
ll,
+struct its_device *get_its_device(struct domain *d, paddr_t vdoorbell,
                                          uint32_t vdevid)
 {
     struct rb_node *node =3D d->arch.vgic.its_devices.rb_node;
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index fc5a84892c..aa54e9a364 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -116,6 +116,27 @@
 /* We allocate LPIs on the hosts in chunks of 32 to reduce handling overhe=
ad. */
 #define LPI_BLOCK                       32U
=20
+/*
+ * Describes a device which is using the ITS and is used by a guest.
+ * Since device IDs are per ITS (in contrast to vLPIs, which are per
+ * guest), we have to differentiate between different virtual ITSes.
+ * We use the doorbell address here, since this is a nice architectural
+ * property of MSIs in general and we can easily get to the base address
+ * of the ITS and look that up.
+ */
+struct its_device {
+    struct rb_node rbnode;
+    struct host_its *hw_its;
+    unsigned int itt_order;
+    void *itt_addr;
+    paddr_t guest_doorbell;             /* Identifies the virtual ITS */
+    uint32_t host_devid;
+    uint32_t guest_devid;
+    uint32_t eventids;                  /* Number of event IDs (MSIs) */
+    uint32_t *host_lpi_blocks;          /* Which LPIs are used on the host=
 */
+    struct pending_irq *pend_irqs;      /* One struct per event */
+};
+
 /* data structure for each hardware ITS */
 struct host_its {
     struct list_head entry;
@@ -138,6 +159,10 @@ int gicv3_its_setup_collection(unsigned int cpu);
=20
 extern struct list_head host_its_list;
=20
+int its_send_cmd_inv(struct host_its *its, uint32_t deviceid, uint32_t eve=
ntid);
+int its_send_cmd_clear(struct host_its *its, uint32_t deviceid, uint32_t e=
ventid);
+int its_send_cmd_mapti(struct host_its *its, uint32_t deviceid,
+                       uint32_t eventid, uint32_t pintid, uint16_t icid);
 #ifdef CONFIG_ACPI
 unsigned long gicv3_its_make_hwdom_madt(const struct domain *d,
                                         void *base_ptr);
@@ -198,6 +223,10 @@ struct pending_irq *gicv3_assign_guest_event(struct do=
main *d,
                                              uint32_t virt_lpi);
 void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
                                  uint32_t virt_lpi);
+int its_send_command(struct host_its *hw_its, const void *its_cmd);
+
+struct its_device *get_its_device(struct domain *d, paddr_t vdoorbell,
+                                  uint32_t vdevid);
=20
 /* ITS quirks handling. */
 uint64_t gicv3_its_get_cacheability(void);
--=20
2.51.2

