Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C29AF9BC0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 22:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033720.1407066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXnCH-0007nk-7w; Fri, 04 Jul 2025 20:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033720.1407066; Fri, 04 Jul 2025 20:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXnCH-0007mH-3c; Fri, 04 Jul 2025 20:39:49 +0000
Received: by outflank-mailman (input) for mailman id 1033720;
 Fri, 04 Jul 2025 20:39:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSlO=ZR=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uXnCF-0007SZ-SQ
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 20:39:47 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06413156-5917-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 22:39:47 +0200 (CEST)
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 (2603:10a6:102:32a::16) by AS8PR03MB9414.eurprd03.prod.outlook.com
 (2603:10a6:20b:5a1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 20:39:43 +0000
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673]) by PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673%3]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 20:39:43 +0000
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
X-Inumbo-ID: 06413156-5917-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrhH1FWqtGoE0YXhgcEzctHIlD4BxSNmK6ncvGQuWODuzIeNjUJv0Z01zu57RDZ+XY5ZhuJWd/X6Hy6gZXkF/qewVza0EQuBFNLhljO1cMYKqvt92l8xO7fDSlSjq7IJNOknsr6tFEsXuSvKAI3s1F1myaTnPRM2RvM9VTFfw6Tp8vm2uznisqSyWbQxNWODXJq+hyxtzUGw6yPzKwFfvIaTYG1MNePESZSDGTMxClvC8p2RzFEZiRDShY3r2ARb8YhlaTH5mTNmt5Nh5eX5mCKlY5Gf0/stk7WIWVGnyFS3n7P36UjV4xzEohg1hRDpCaiOF7lomQW819Dbyqc+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AYqjgn4wMRBeycg61AUz8EvZb80nLOwwK9+zoOne+Y=;
 b=CvZKZTMQ0Din2e2XJPmok0ruORP9bGcCZ7ilTJargZDSdBPAbdv27A3JGQq9h24iHOfvJ1vWF9CQ5CWliJ2lQwzzMCsDtuQNfQOiVXfJ9pbbuZCybZrBRrFM1S9j6lS2lPjR3/wv4v+j3XT4mgH///KqITW+qrfUPnRtFUUiuIp50l5aUvVyCjUCFnw/YSMnzDuRzqtipdoDNtIpPn0DPGZOF9exiq7dWSBeEwy1vUgI7rXcFlqP6uBRNJYTO73LCHCyN87f4JCcC4mfBuf6OXxqXmDLBZMG8bz2hDH94soTQwEpyxF1nqfASau7ISNx2EHk8tO+oDyoRjx+/ko1cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AYqjgn4wMRBeycg61AUz8EvZb80nLOwwK9+zoOne+Y=;
 b=PVAsc9MtXxMzYAJoESYZs+LRj88cejbtb+H6bnWgcxTND6UGWghP5IcS13wO7Ix+Yn9bkm1L+/fM8L72zqnk78LocofGakLzTPy49Qbvwm6iyuwclqtTq3tkukaLnESDDSSZpxWo4A+Zz+AsDy9U+YSeLOt+E7k3cbh25M/ZvpgM7PbedGB3e3Ugu4Gfmpz1t5vq24SUXWuDkctR+JBv0K1x7YvI0NNfoV7IwAOoefY+/XGVM0lJCeQfuAe+g5b+/DzNrBCYJ6avVMkIC/6dIGNMeCCnHhRyqxro8tcR/mf9IBINa40Y0kcrenXKdlyE3bGghVxhUnp3VCvGxvXh7Q==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 5/5] xen/bitops: address violation of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH 5/5] xen/bitops: address violation of MISRA C Rule
 5.5
Thread-Index: AQHb7SPFdtGhMfiyuEObKwCZWDm70g==
Date: Fri, 4 Jul 2025 20:39:43 +0000
Message-ID:
 <2f921089abc6cc396c430f3edf4e7151294a649f.1751659393.git.dmytro_prokopchuk1@epam.com>
References: <cover.1751659393.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1751659393.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10142:EE_|AS8PR03MB9414:EE_
x-ms-office365-filtering-correlation-id: 714cae98-3352-4ae0-5ca8-08ddbb3ae85c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?BGS7DixRxM82rmXksliu/h2wHjgaxwWpBPUnus5zr+4vnOFaEuIzrmxL/z?=
 =?iso-8859-1?Q?M1PV+5tSBtaW7BVklMZqDC0n1JZfA3LRrZBaU3eCdbOtDW+DDlYAEdoyFV?=
 =?iso-8859-1?Q?ftlm4FfeI/Xwxe9cQpnA08jXvlipwf6oz/pACh8UESk7N4sRThSvxQhnyb?=
 =?iso-8859-1?Q?Jtwu/kQ1zr3Slv0Deox1uaHcaG1b0EjSHo1KlkEyfJouQGWpkMTxav5L+3?=
 =?iso-8859-1?Q?KVOs6phBPD3DFEvneTEnpW9nRxjdp9nLfl4C31qf6tXHw+xHJmg6gkYhwE?=
 =?iso-8859-1?Q?qpSMSGcFcgdfIhbd55ZNeIxT2icsgs3sZhwYkG4QkfB/+8YNU+TzY1c6og?=
 =?iso-8859-1?Q?W87lnGuhqp5CM9igDqVj64awXcGRYc7+zUm5R5TtwdF+ZzqnG1Av5k9a02?=
 =?iso-8859-1?Q?e74bOalIGxPJBjO5/+DgS95utGKDyL+G/KbtAhotu0gl0ONHSPPksdPEBG?=
 =?iso-8859-1?Q?XDff4V9hT2Ch9TVFjsTlRde/uMuF0KsUwxlrb29bONuHSAFo3EF41TsFab?=
 =?iso-8859-1?Q?8sQKKD8GnvOfwHHYCUFE7+IcPNEndbQIu8ZM9ayf1+zKp6xLrQrdlZcg09?=
 =?iso-8859-1?Q?m3w6qM1vSHumAXSNpOcQCU8hglLjcQp00V5W9KwymFHgY7wR+XfyWA+oEj?=
 =?iso-8859-1?Q?AAyBf+BbN6CrXqmcQDU0nUimFUxOluC3Ko6ayFyC8pfdLvUaq5BZr4Wvqe?=
 =?iso-8859-1?Q?ELTTKryawXhIw3JVO1HyEDrEmQh38mQLGxBTc6xJ0uXX7VfwEZ1W5pxszN?=
 =?iso-8859-1?Q?icrxWwuIB6KqjuwuQNLurttXdNVKWMVObbP55suF4yfOxAekypeT1Lt0M2?=
 =?iso-8859-1?Q?HVRv39m3f7IapWsSRLRJSJ+Oq5Rg2YgKQ8WS4z7fElYB0pszZWLCd2jZez?=
 =?iso-8859-1?Q?uxTKiHxq5TIAjo6kRr7NVybkhRC+4HLtCgJug71YKspWBGxde6tuG/QfT/?=
 =?iso-8859-1?Q?oN19Vhv3xCQ1+e5N2/guwmGlWAHwIeyZu27PC+elmUI9br6goI8tVYXQWo?=
 =?iso-8859-1?Q?LJZeUFJoKs/8DfRpCvJqQ1kbN0N9eS9pIsLUkJbP4y23MQ/oBchVpYD2JA?=
 =?iso-8859-1?Q?yDKaYcNReQS86OMXZ6A2XKBdkslFEc5ZrNDwO2+8dV/H8w1RiByWdssyf2?=
 =?iso-8859-1?Q?b3+m5rlxx+TWrg0SOpO3qrZuBYS8iuydgomqDpuewTTLyts27wbgXQPG7G?=
 =?iso-8859-1?Q?P99v2wiNvST2mviiopho5/lpnZ9YmuAkh7J4m9IS5CMxnbo8BPfXR/qAXX?=
 =?iso-8859-1?Q?xU3iy4UtwVBOUdFMWwHOxoV5vOkkPLk8evpW1IToe1sXrhIrUGAwaCNSw4?=
 =?iso-8859-1?Q?OkHZKt86fECggjAlObPA6PogYFxk+KNorGBcyMN9D5Gb/MbQqeMkIUT0Q7?=
 =?iso-8859-1?Q?rMPcFXevzMh7CZCI2pV6nommEW7g2H2HS7+kJC8PGDVF/SDb0Fa/F+oZvg?=
 =?iso-8859-1?Q?SyrJPcw1vLIYEUWuBbknaBKBX94PpXfaHaGoFU0QA189sMxf1lLcJT9pvz?=
 =?iso-8859-1?Q?2vcl0caTpx7wzrhzY6YZkhooPT31VCkx3joGRHsYhodA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10142.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?O1OjofehpvWSL+l1oj3rZehYi6m4Cq5PHi0LaGRDzJVO5O3RsBEZIjuOOL?=
 =?iso-8859-1?Q?V7SjfvbpPwXM2eJ906r+BaYUQ3tC+ljw7HGPUAQfuhq0NZ2m3vTRjc7ej2?=
 =?iso-8859-1?Q?G+2nXSPLGPmxFRV7tEV62926Oookvs09SY3tfvk0S0Kb9q0+9utnFahH+m?=
 =?iso-8859-1?Q?5brxNWOA1XjYPZ1FlA086DhFt3EWTqo0i0buQ5N/CsJQeA8KlMn/Xb6iju?=
 =?iso-8859-1?Q?tDNt/ALGZ1b9cLuNW+lxdOb4P+7zCoF3hiS5OO5szMlUTTIh6UHZ4b8liC?=
 =?iso-8859-1?Q?iunXE9ia2HRjYI+aZoj32ewa/hiOOQ3CtB0dAxzOui3CHp4d1DlPgC+bTa?=
 =?iso-8859-1?Q?pjt0k6MYTpOiHug99jim2DoTBrqi6VKvRP14L8OxMcGis9slRlKgMj1NDH?=
 =?iso-8859-1?Q?NYip4xrlt8g9kkQy+2U2Rtkd9Ub7h8VzgltJjpIMSZVbya5eA0aMgUoy4f?=
 =?iso-8859-1?Q?X4g8Ly2SPQXqHXUikvJNpkI6XVde0jf/Dqw3mDcqsyDum7HklQPKvFVNHU?=
 =?iso-8859-1?Q?3Gp71vxbgCxdBmvPmSWLeJ+AlVqxF4oyrRIyTOf3ZZH3MH0gLmybg/u4+e?=
 =?iso-8859-1?Q?d+hUyUIxVGS6MgXuTP1XVwxd74Y4KW1Ba/lRJ3CcH0wcXrx8gK5j4nU9fS?=
 =?iso-8859-1?Q?ph/IM3xYnR9QpMT/C0wHvpi9LjryGZMyIcc6jpAYCRYKoA5nVWJ5hZCbnh?=
 =?iso-8859-1?Q?oDqbVgyVliqJYgVkLGnIdsmp20M0KSow9F0ulT8qRKbrnbOPTfSLc3tCti?=
 =?iso-8859-1?Q?C78qVOOJMEk9U1RRXqI1i3UuBSpb4RtsGPryC+p+kjLeE4OuMudaBS3xG/?=
 =?iso-8859-1?Q?U3mq7DkKrBarooNOcAp1est0HF+om8qcF/WgMfyeB8Ev7GqHTlY+heEmLc?=
 =?iso-8859-1?Q?vvYdaYnUofbC3J1/sgDjB2gQ1C/sBFFopHwr80TY+C/0mNUk4BQ06+s09B?=
 =?iso-8859-1?Q?kRybe1Q3PqK/4HXI/EfruCUqeT7Ff41fdKOAPLTkF2Ebg5bU2d2srQSy8z?=
 =?iso-8859-1?Q?cU8gekMpGvTDZXIge3UnqmX4EqDmP9L4ib6V9PJyU5IeWTzasEx2tJByGX?=
 =?iso-8859-1?Q?ZOEuavJ+JvI3w2ttTyHvHqZlsNZ7ahcGEZXcozPu+1njn5L1WPVN1L5Nsp?=
 =?iso-8859-1?Q?yZyuwKvAX4IFLR2S5K31eQ4Wugj4dCq6KFGLuejY7IAsSc4pT2zvo3UEwf?=
 =?iso-8859-1?Q?B0bOZNxjxWdfyxZSj6R0BtOfq3DMtLsY0OiTFrLS3LvfZpOEhcLgTt33SS?=
 =?iso-8859-1?Q?8gIBpXyTrEJoYIZ+gAYFLYTOZulXe60NnM1444/xLMmP1lMj0tqaHFRhEq?=
 =?iso-8859-1?Q?RibGIjkGKWBAqhFQ5IQSyI6A5dWBYe4Koj+ouZ50cS+T0Ch917iXRZryV2?=
 =?iso-8859-1?Q?jonrXrb5oxl+DAog6gfWEYMno4bv1V+Q3UqzYKog1TlOKBasB1HTzo3EqH?=
 =?iso-8859-1?Q?jlfr6qpkndGvFc+Gy0vqiqHA2Io86qH7kMGB51AcibrNYLemdQLCeSRQkv?=
 =?iso-8859-1?Q?DuznsdFsvyQHpvev8nwOBzA3nqDoazx8Icpy3KXh0zAW/viSlZQi2i9WpN?=
 =?iso-8859-1?Q?dYeqo/P+uVW0k/6uUOetSybj7FLrICDETaK4Ej5IheKvbyYg950IsGDhN8?=
 =?iso-8859-1?Q?c060Mo9QdSMLEl+gunvROWN6ZF8fZ+hmY5jU35hfINrApAWqs6AJJmKw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10142.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714cae98-3352-4ae0-5ca8-08ddbb3ae85c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 20:39:43.6855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bCzQLmgivnjqNBkvzM5FfRB7pefz2y64X5WpZRG3dqlnk6t+VMeNI0Ewsp0i6aj76lBv2T2CX6Y76pyTKoerTw5UzWKxBLi2PzVxwL3bzB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9414

Address a violation of MISRA C:2012 Rule 5.5:
"Identifiers shall be distinct from macro names".

Reports for service MC3A2.R5.5:
xen/include/xen/bitops.h: non-compliant function '__test_and_set_bit(int, v=
olatile void*)'
xen/include/xen/bitops.h: non-compliant macro '__test_and_set_bit'
xen/include/xen/bitops.h: non-compliant function '__test_and_clear_bit(int,=
 volatile void*)'
xen/include/xen/bitops.h: non-compliant macro '__test_and_clear_bit'
xen/include/xen/bitops.h: non-compliant function '__test_and_change_bit(int=
, volatile void*)'
xen/include/xen/bitops.h: non-compliant macro '__test_and_change_bit'
xen/include/xen/bitops.h: non-compliant function 'test_bit(int, const volat=
ile void*)'
xen/include/xen/bitops.h: non-compliant macro 'test_bit'

The primary issue stems from the macro and function
having identical names, which is confusing and
non-compliant with common coding standards.
Change the functions names by adding two underscores at the end.
No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/include/xen/bitops.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index a4d31ec02a..b292470ad7 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -120,7 +120,7 @@ static always_inline bool generic_test_bit(int nr, cons=
t volatile void *addr)
 }
=20
 /**
- * __test_and_set_bit - Set a bit and return its old value
+ * __test_and_set_bit__ - Set a bit and return its old value
  * @nr: Bit to set
  * @addr: Address to count from
  *
@@ -129,7 +129,7 @@ static always_inline bool generic_test_bit(int nr, cons=
t volatile void *addr)
  * but actually fail.  You must protect multiple accesses with a lock.
  */
 static always_inline bool
-__test_and_set_bit(int nr, volatile void *addr)
+__test_and_set_bit__(int nr, volatile void *addr)
 {
 #ifndef arch__test_and_set_bit
 #define arch__test_and_set_bit generic__test_and_set_bit
@@ -139,11 +139,11 @@ __test_and_set_bit(int nr, volatile void *addr)
 }
 #define __test_and_set_bit(nr, addr) ({             \
     if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
-    __test_and_set_bit(nr, addr);                   \
+    __test_and_set_bit__(nr, addr);                 \
 })
=20
 /**
- * __test_and_clear_bit - Clear a bit and return its old value
+ * __test_and_clear_bit__ - Clear a bit and return its old value
  * @nr: Bit to clear
  * @addr: Address to count from
  *
@@ -152,7 +152,7 @@ __test_and_set_bit(int nr, volatile void *addr)
  * but actually fail.  You must protect multiple accesses with a lock.
  */
 static always_inline bool
-__test_and_clear_bit(int nr, volatile void *addr)
+__test_and_clear_bit__(int nr, volatile void *addr)
 {
 #ifndef arch__test_and_clear_bit
 #define arch__test_and_clear_bit generic__test_and_clear_bit
@@ -162,11 +162,11 @@ __test_and_clear_bit(int nr, volatile void *addr)
 }
 #define __test_and_clear_bit(nr, addr) ({           \
     if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
-    __test_and_clear_bit(nr, addr);                 \
+    __test_and_clear_bit__(nr, addr);               \
 })
=20
 /**
- * __test_and_change_bit - Change a bit and return its old value
+ * __test_and_change_bit__ - Change a bit and return its old value
  * @nr: Bit to change
  * @addr: Address to count from
  *
@@ -175,7 +175,7 @@ __test_and_clear_bit(int nr, volatile void *addr)
  * but actually fail.  You must protect multiple accesses with a lock.
  */
 static always_inline bool
-__test_and_change_bit(int nr, volatile void *addr)
+__test_and_change_bit__(int nr, volatile void *addr)
 {
 #ifndef arch__test_and_change_bit
 #define arch__test_and_change_bit generic__test_and_change_bit
@@ -185,11 +185,11 @@ __test_and_change_bit(int nr, volatile void *addr)
 }
 #define __test_and_change_bit(nr, addr) ({              \
     if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
-    __test_and_change_bit(nr, addr);                    \
+    __test_and_change_bit__(nr, addr);                  \
 })
=20
 /**
- * test_bit - Determine whether a bit is set
+ * test_bit__ - Determine whether a bit is set
  * @nr: bit number to test
  * @addr: Address to start counting from
  *
@@ -197,7 +197,7 @@ __test_and_change_bit(int nr, volatile void *addr)
  * If two examples of this operation race, one can appear to succeed
  * but actually fail.  You must protect multiple accesses with a lock.
  */
-static always_inline bool test_bit(int nr, const volatile void *addr)
+static always_inline bool test_bit__(int nr, const volatile void *addr)
 {
 #ifndef arch_test_bit
 #define arch_test_bit generic_test_bit
@@ -207,7 +207,7 @@ static always_inline bool test_bit(int nr, const volati=
le void *addr)
 }
 #define test_bit(nr, addr) ({                           \
     if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
-    test_bit(nr, addr);                                 \
+    test_bit__(nr, addr);                               \
 })
=20
 /* --------------------- Please tidy above here --------------------- */
--=20
2.43.0

