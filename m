Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBsHOTvOgGkuBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:18:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0CFCED23
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:18:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218890.1527779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwcc-0007KR-PP; Mon, 02 Feb 2026 16:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218890.1527779; Mon, 02 Feb 2026 16:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwcc-0007In-Ke; Mon, 02 Feb 2026 16:17:54 +0000
Received: by outflank-mailman (input) for mailman id 1218890;
 Mon, 02 Feb 2026 16:17:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZe-0000fY-2A
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:14:50 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49517d05-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:44 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AMBPR03MB11643.eurprd03.prod.outlook.com
 (2603:10a6:20b:731::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 2 Feb
 2026 16:14:41 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:41 +0000
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
X-Inumbo-ID: 49517d05-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjbFB36uqNnz4+cCSgWre7UswXJt80exl8Cl2XcbPXcLSv9PaWMEZV7464+80fsB5hvMYB3BYT2cLS0X57R1/ITnJ/WN8xSmLAg61booc/6PgzpV0hzQpWKmEgSQ4vOYiDBuNh7bzdnP0I3OHE52OEJ9YiwWNe1GBePZAM4Dp3EavbazUvl71UQqORVI8GSfs5oDa8dACsPlbxYNEzgtpu5C1d9ZeCQgMvuTiSeSqfghG6+o+EyLY8xPNvH1tVGoGRtlsiMHVgU4ENLTAOV8qvYXmCn2ZJipkGmaJxO+X/M8TWR9SBPVyIsVEsN72HF25MdplDN89iXlX+1xLSRlEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olsFIyBVeLiR6nsQyL/e906KT3F+OOjXT7MGVYg6uvs=;
 b=h7jsw1wW+mooTomcR6r8Q2tYOuwysounXOj+Y5/gGXmcSL97fzFo+I8yZcfxwUfSSaiq16/cEIre7Fw5vRvmbkyPup+ysXIErXVBxivfnPFKg1osBuC5pdEQQDLanAr6FrT9UG8V14yEdStqPNn8R0f0OTS/5j4uzbNWfp4gXNLryLhyXDIw2lODjZgtJP0pGpZCf1MyxE042pH29/qwqgYQUOD5E0FnjjiCSkXzfIE2Va7Pl3KDMMwbyrWGg8225lPQ7fvCUr2HCHQIoteDbe/VQynsfWR63FRSxfoq0TXfInt76lMg3KSp0Ta98UHNJ+SXQ/a+ykjbCxVay4YidQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olsFIyBVeLiR6nsQyL/e906KT3F+OOjXT7MGVYg6uvs=;
 b=cEwaliimkHmd6fU1eaWHTycyEH+vAyRtwwhf7it50ph0oCalmMCS903Hr2qIqjdLsrgqpv+dqe+PyFoBbkxD8WFawi8cc113JUsQ1xq2rGFYDMsW8idECIoC5LqqSTflMQX0v1HyDb/It6J6RJYy7JFhA+qyJjTzzCN3PAzUQw55+RWTeEdVIfTDMjasKdkR5jtS/QOSzaz68pt9CnqBcH3f9eEpXevuiifKq1ed3bHqOOLQ73YgQgFeO2SWWJl6MS5Utx+1jDLmDHOEpjJjBaFR5aaVBK4kzK2tI0VrUL/LgNv5uim9UNzHr2/wnJvLIqKyGsaj1uu0FyrBmDT6Wg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 10/19] arm/its: Keep track of BASER regs
Thread-Topic: [RFC PATCH 10/19] arm/its: Keep track of BASER regs
Thread-Index: AQHclF8JFZGLM6XvwkqSrOpYWYBhLQ==
Date: Mon, 2 Feb 2026 16:14:41 +0000
Message-ID:
 <cc8390af73d86c72d5274e6cc3c314fe018a2c8d.1770046465.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 3dcea2b8-59b8-4cc9-542f-08de62762bd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?mZFQSYdtNd/5iY3xzaBdD8FF0Ffh6crOg/6fDXq89TgW4rcBDX6ny79bH3?=
 =?iso-8859-1?Q?WYOoktzKWNr/Tu6TrfelHeOYHkSuRp1PEl37+22+eD+yR4uEZTOy7TPz2m?=
 =?iso-8859-1?Q?WToxoGWuyF5Q4IgyMqGsOFD9KpcGxB4PaVooytCVeQcqJPadj4kaBM+hJG?=
 =?iso-8859-1?Q?/zGBqzssjrwndlvy6luxPj4/9oRn6RjwZzTSqmJ4dBonQKwy3WAAORwHXp?=
 =?iso-8859-1?Q?VO3k9oMugjV07W5CMHczLwmQuKanPjDzTuYGQm94EGuOdzZzhXOW8t+as7?=
 =?iso-8859-1?Q?j1OtvR3I5973RwwCVNV0wU5xfZkNRs5SIfIuZoVHTr7vOxZFmFe4q2VzVM?=
 =?iso-8859-1?Q?klNXK5zGkMO7if3p5ngd34MKRYhTn0OQvNmHDBMRjgXUfnszyDFJAffewR?=
 =?iso-8859-1?Q?DSWKfiHWTJ5rH6OdFUtWd2cMpua5Iu+eE9aDmSeC6QAxwvqM6UZbTiIiCL?=
 =?iso-8859-1?Q?ry9gpX4VyJA9hnFgJo1It4LIsVNO7+SyY2sEvTOr7rXdHBzVZDXmhjDzzh?=
 =?iso-8859-1?Q?R3oTfude8nm1nENUHUXiJPREyYJ4x3rMzVa70JdCtZLlKHgPKfpMpycT82?=
 =?iso-8859-1?Q?d9WFtyQNvKyHaYzv65SWJj6bq7aO8jFtKJel2vakC4ATaMZYxkTYwSSEST?=
 =?iso-8859-1?Q?Lkc2Ci2vy3MsMl/CaxtJGFkz8Us/t1YhSP/x2GOzZ83/XoaJ0uYOTOpslu?=
 =?iso-8859-1?Q?z2QwxJRow6DBlUbUzyk0wLVDpecTEsfL64t3aYk9BuOIApxxJ5i6t7ks/x?=
 =?iso-8859-1?Q?9R+6lrcG7Dsvc8S2GsgvVRYC42QwLsogSyRKVFtdhQ/TVnvxIcYPM3Bt4h?=
 =?iso-8859-1?Q?QWUA28wXW6SXeM5z6q8Lo9euDhr4yT8YvYm4F+/7p8ZLe47S4g2LHHg4tU?=
 =?iso-8859-1?Q?yoJR/b2FD/OZBgTE45RjiMUCLJdT/Kinn3IDMWZS6Xa1OoUuZRdH7mx8g5?=
 =?iso-8859-1?Q?A+FbEJeMYHkCyh9LwY1CZgXeKSreFDySYH9OVtUpdATmucnU7OZKJnlibq?=
 =?iso-8859-1?Q?lH/BdqKZZ0MLOnUz6TTaX6s+2jHPm50cVI6lL0JvUYRGpH/8LZshqy7FGn?=
 =?iso-8859-1?Q?xLxjLGpSQzM1n4iC05vubQjg6kjY44S/i/8PnF+1HAap/v98r0TRkO2B0h?=
 =?iso-8859-1?Q?hqGvxcAVI4PaUiHxutXPpxl9EFj0VM4s5AX7rcL4PjsDu7OQRZDuGl44NH?=
 =?iso-8859-1?Q?oZTHqtlbkamLjkybdFL7PrY8/axq+0mz1lLXYCMfKUllF2IDhrFyfgIUVL?=
 =?iso-8859-1?Q?eYOZtR+YmNdHuVKSZ9pqR3w4VXLUOq212h0TzSsGcZgBpRSwUQJZ7llqG/?=
 =?iso-8859-1?Q?fJu1XFN076Xctb/am1azdRMZBCTYEeUk1Ytw5TfJ/qwFlzabzY3+Ap5tgb?=
 =?iso-8859-1?Q?ADDxS2AH1KghKD4dS8MQPMUBt0kHzmP12a0GXSRe94RLtQIEIn+UEsU8At?=
 =?iso-8859-1?Q?8/t6IExEAG4Z2uRP3SM7TVgfj03tara/5iJOyUrwji2yNJNz3/v/2FefAH?=
 =?iso-8859-1?Q?J0q3cR7VdJ1ZoLAt/JVLpPibPIBWalS2WITm6coJq8pA9FQEVRhGNa8QFs?=
 =?iso-8859-1?Q?C/4v/U22+wu9kv48sHlHvsWXuUuTcJezFPNF4S9PntZnP/Ozicx4wMpD9W?=
 =?iso-8859-1?Q?GsLwfDR6002pprdVfY9axbivzf9vRhOTREKxXVdDnNf9EnEVEF5GfUjPqk?=
 =?iso-8859-1?Q?kfiErBLlJ6axzfdDiqE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?uZTt9gWN6NI9v7TQxxypeIv+GIjyqU4L+llV9X48jJEeLna6GssF9RqUjf?=
 =?iso-8859-1?Q?rYngJCC2bwmoQgtXXc1UxlHd4VdW/hZ7umrnSbR8mFiuVCn7vkTmUEBJ0W?=
 =?iso-8859-1?Q?Z+zVlulOP/6UhuqSM6OOdT6/CWW6sFrvXDP38alM1iJe3SC5BWqLKFqTL5?=
 =?iso-8859-1?Q?AvTj5KPwi3nLA15a9Zd28cyVMiGygFYnH7iyrP+E/EK8wFEeAhHifL5Cni?=
 =?iso-8859-1?Q?NrmQCgq6OqUgxCLUb5lX7vei+jOBDhDoBTY+XTwtk/ssEi4fupo/UpKuJg?=
 =?iso-8859-1?Q?DA8UoSwgxODJbc2cC4K7JU3NRWx/Oi+/yn5zRWTqPg/2I1VdqKdxtXKooG?=
 =?iso-8859-1?Q?N5Yrf5qZHcb17vW12EDjfeiSH54VfJPGZVZy+oZ+CwGHTOosCQ+iusJiaT?=
 =?iso-8859-1?Q?M9JTt5hKOf5sdoTBd7M4fpd9i24wSMoBxui1N1QvOPSKs2qVLgJzkijX19?=
 =?iso-8859-1?Q?x5OSWrhlt04zE18R7P06JDK/Cru+aFr3cvOJ3vjozPrGyWR5lzen1/YrWN?=
 =?iso-8859-1?Q?d/pjyJDA8QJj42HBihpx+6zepe1hDGJXI/36T7NAJhqxlOrN7mg5JD2YVq?=
 =?iso-8859-1?Q?DaWJTTS4KaN9cEfkrI4OIEaxW8Z4dxB3u7p7I3It2mP4TXeGw2Fm5DAwSO?=
 =?iso-8859-1?Q?E7rJQCa0mT/tomr+mXKYkQ+TeiYVQWyyQtCMMUGsg7Pzn8LKOTLxIBEuak?=
 =?iso-8859-1?Q?RZzNV+nPR9hIWSUY1v//yUcQoPKpgo334UC8aTynb1Ng2WToEF8F2p9BHv?=
 =?iso-8859-1?Q?WrbxZQqGTtPAI6wwYLP8QXfh5TPvBtC1TjVKhcRnOk4lexMJ0j/HSQifXF?=
 =?iso-8859-1?Q?RPTY8wSxU2kEn/xUd6L3HZgGjhALltA1dcSpzysRYQljm5spwf10MlclOx?=
 =?iso-8859-1?Q?meruApF5IUMIYXGtwNhQpYQCY3Dnk3sMYLj1ms1BlveVPVGNimM4cNwpzT?=
 =?iso-8859-1?Q?n1La67UEkPYF26ONeP2JhY+1zBgDcXfTjvpbE2Mt7ckL6fSKYI7/o70IVv?=
 =?iso-8859-1?Q?Z934ajROlxSrC6j34PEr39wXSknCoAsVUYaiHbRsjHFhnIjBJfEopSWfQ6?=
 =?iso-8859-1?Q?Yt58KkPAK60Y8q9viB16jZ87RoTJEVem5+80SvkKrtPcQLDFcsPzqXU97G?=
 =?iso-8859-1?Q?WiQXG5pFiZJrKic4wO/Y23Wgjto9bzdyqvH37hXY2RncUt29d9H0b7RMoV?=
 =?iso-8859-1?Q?cgheD52bKwNTS+n8yVRWp7GNNJdb9YaXCawV+0GEufdIaaCG5oCqqMz4NX?=
 =?iso-8859-1?Q?uNb5blWu1pAjQwX0RzU5h1cXQi2zZ31rNWCOAKPsv1bl5zFZ693iJ/oCsA?=
 =?iso-8859-1?Q?7VlxXKSI3u95TKh7oOIUwljFROMmiiJvsyUD/15PyQAtOSnSync3LPz8zN?=
 =?iso-8859-1?Q?UqepOTQ6pUcsa2vSI5f1ykatiOfHaVQoRfGE8+SbLYwETNsu8NY9t2rkLG?=
 =?iso-8859-1?Q?Wt6oLC4ZKzJFio9qf8WDasuYwRnWlBUXFUCxTxGvK4VQH19UhcvOeNMlRU?=
 =?iso-8859-1?Q?TaIFjDu2LxA1LtFDIVMTgigSliq0Y6ZbltqiXDgrnptpN94hMsckEgDyXn?=
 =?iso-8859-1?Q?TiKKdaKCET7FGfU4biMJKUTZ+fGw7MBl8MZGg4UxiBQ5kwXScKLZeEcNuZ?=
 =?iso-8859-1?Q?0CoMWb/fqDhcRIHA8FF6pawtHVjE+wwnCYUTEFVEJ5gssEuJ91K43M7kTj?=
 =?iso-8859-1?Q?A/ExLI1ZvKfA1cuWeh0Z4G4jYLxSV//m73kEgzTJieFQJ8sojgP4bHfxqs?=
 =?iso-8859-1?Q?1v95ABprD07Hd5viAaEBJ9c98HrjPoBrALWz9aXW5LaHRJqkTQWS8njmJk?=
 =?iso-8859-1?Q?l/diRt3x4ZqnkKQQzCSyfrhNnWZXg50=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dcea2b8-59b8-4cc9-542f-08de62762bd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:41.1902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NdnESA2f/BYACB1dRnAj+VCY3ps1gKaun/AHMrfF8jmc6T3ljNCxb2+CuzKFEA8Y4SJA+LGy1nrJNk8wUpJF3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11643
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,epam.com,kernel.org,xen.org,arm.com,amd.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 6A0CFCED23
X-Rspamd-Action: no action

Keep all the info about BASER regs in host_its structure to be able to easi=
ly
access it later.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/gic-v3-its.c             | 36 +++++++++++++++++++++------
 xen/arch/arm/include/asm/gic_v3_its.h | 14 +++++++++++
 2 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index c628959f42..2328595a85 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -430,16 +430,32 @@ static void *its_map_cbaser(struct host_its *its)
 /* The ITS BASE registers work with page sizes of 4K, 16K or 64K. */
 #define BASER_PAGE_BITS(sz) ((sz) * 2 + 12)
=20
+struct its_baser *its_get_baser(struct host_its *hw_its, uint32_t type)
+{
+    unsigned int i;
+
+    for ( i =3D 0; i < GITS_BASER_NR_REGS; i++ )
+    {
+        if (GITS_BASER_TYPE(hw_its->tables[i].val) =3D=3D type)
+            return &hw_its->tables[i];
+    }
+
+    return NULL;
+}
+
 static int its_map_baser(void __iomem *basereg, uint64_t regc,
-                         unsigned int nr_items)
+                         unsigned int nr_items, struct its_baser *baser)
 {
     uint64_t attr, reg;
     unsigned int entry_size =3D GITS_BASER_ENTRY_SIZE(regc);
-    unsigned int pagesz =3D 2;    /* try 64K pages first, then go down. */
+    unsigned int page_size[4] =3D {SZ_4K, SZ_16K, SZ_64K, SZ_64K};
+    unsigned int pagesz =3D 0;    /* try 64K pages first, then go down. */
     unsigned int table_size;
     unsigned int order;
     void *buffer;
+    uint32_t type;
=20
+    type =3D GITS_BASER_TYPE(regc);
     attr  =3D gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SHIF=
T;
     attr |=3D GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILITY=
_SHIFT;
     attr |=3D gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABILIT=
Y_SHIFT;
@@ -479,6 +495,11 @@ retry:
     writeq_relaxed(reg, basereg);
     regc =3D readq_relaxed(basereg);
=20
+    baser->val =3D regc;
+    baser->base =3D buffer;
+    baser->table_size =3D table_size;
+    baser->pagesz =3D page_size[pagesz];
+
     /* The host didn't like our attributes, just use what it returned. */
     if ( (regc & BASER_ATTR_MASK) !=3D attr )
     {
@@ -490,7 +511,7 @@ retry:
         }
         attr =3D regc & BASER_ATTR_MASK;
     }
-    if ( (regc & GITS_BASER_INNER_CACHEABILITY_MASK) <=3D GIC_BASER_CACHE_=
nC )
+    if ( gicv3_its_get_cacheability() <=3D GIC_BASER_CACHE_nC )
         clean_and_invalidate_dcache_va_range(buffer, table_size);
=20
     /* If the host accepted our page size, we are done. */
@@ -568,26 +589,27 @@ static int gicv3_its_init_single_its(struct host_its =
*hw_its)
     {
         void __iomem *basereg =3D hw_its->its_base + GITS_BASER0 + i * 8;
         unsigned int type;
+        struct its_baser *baser =3D hw_its->tables + i;
=20
         reg =3D readq_relaxed(basereg);
-        type =3D (reg & GITS_BASER_TYPE_MASK) >> GITS_BASER_TYPE_SHIFT;
+        type =3D GITS_BASER_TYPE(reg);
         switch ( type )
         {
         case GITS_BASER_TYPE_NONE:
             continue;
         case GITS_BASER_TYPE_DEVICE:
-            ret =3D its_map_baser(basereg, reg, BIT(hw_its->devid_bits, UL=
));
+            ret =3D its_map_baser(basereg, reg, BIT(hw_its->devid_bits, UL=
), baser);
             if ( ret )
                 return ret;
             break;
         case GITS_BASER_TYPE_COLLECTION:
-            ret =3D its_map_baser(basereg, reg, num_possible_cpus());
+            ret =3D its_map_baser(basereg, reg, num_possible_cpus(), baser=
);
             if ( ret )
                 return ret;
             break;
         /* In case this is a GICv4, provide a (dummy) vPE table as well. *=
/
         case GITS_BASER_TYPE_VCPU:
-            ret =3D its_map_baser(basereg, reg, 1);
+            ret =3D its_map_baser(basereg, reg, 32, baser);
             if ( ret )
                 return ret;
             break;
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index 973ca6acdd..bd2696f354 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -64,6 +64,7 @@
 #define GITS_BASER_INNER_CACHEABILITY_SHIFT        59
 #define GITS_BASER_TYPE_SHIFT           56
 #define GITS_BASER_TYPE_MASK            (7ULL << GITS_BASER_TYPE_SHIFT)
+#define GITS_BASER_TYPE(reg)            ((reg & GITS_BASER_TYPE_MASK) >> G=
ITS_BASER_TYPE_SHIFT)
 #define GITS_BASER_OUTER_CACHEABILITY_SHIFT        53
 #define GITS_BASER_TYPE_NONE            0UL
 #define GITS_BASER_TYPE_DEVICE          1UL
@@ -143,6 +144,17 @@ struct its_device {
 #endif
 };
=20
+/*
+ * The ITS_BASER structure - contains memory information, cached
+ * value of BASER register configuration.
+ */
+struct its_baser {
+    void            *base;
+    uint64_t        val;
+    unsigned int    table_size;
+    unsigned int    pagesz;
+};
+
 /* data structure for each hardware ITS */
 struct host_its {
     struct list_head entry;
@@ -156,6 +168,7 @@ struct host_its {
     spinlock_t cmd_lock;
     void *cmd_buf;
     unsigned int flags;
+    struct its_baser tables[GITS_BASER_NR_REGS];
 };
=20
 /* Map a collection for this host CPU to each host ITS. */
@@ -259,6 +272,7 @@ struct pending_irq *gicv3_assign_guest_event(struct dom=
ain *d,
                                              uint32_t virt_lpi);
 void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
                                  uint32_t virt_lpi);
+struct its_baser *its_get_baser(struct host_its *hw_its, uint32_t type);
 void lpi_write_config(uint8_t *prop_table, uint32_t lpi, uint8_t clr,
                       uint8_t set);
 int its_send_command(struct host_its *hw_its, const void *its_cmd);
--=20
2.51.2

