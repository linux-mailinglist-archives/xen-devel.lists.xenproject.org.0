Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF207A704A4
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 16:10:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926601.1329438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx5tk-0006xE-2x; Tue, 25 Mar 2025 15:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926601.1329438; Tue, 25 Mar 2025 15:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx5tk-0006vk-01; Tue, 25 Mar 2025 15:09:00 +0000
Received: by outflank-mailman (input) for mailman id 926601;
 Tue, 25 Mar 2025 15:08:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFHn=WM=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1tx5ti-0006ve-Pw
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 15:08:58 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b8357b2-098b-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 16:08:44 +0100 (CET)
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com (2603:10a6:102:7d::8)
 by DU0PR03MB9256.eurprd03.prod.outlook.com (2603:10a6:10:474::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 15:08:43 +0000
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340]) by PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 15:08:43 +0000
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
X-Inumbo-ID: 0b8357b2-098b-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8E5/t1Fmgtlbrh7x7mm3ly5L1abyM4ThiWK70GQDqP7QXgpHeU6TYgMLv/ManY4F2keOyyVrqsTZHoikMg6L5bMxmaja7Ea9r2y22d/3CnHWzhHsF1Pmpn+kjfhjJWLGIOqCQywR9ia4TrJ9j5urfaS4FolIut+gDlpxN/cbHBBuRaMGBCyOyDPGAjWhdj1AJrlRtlRRX8m+x6Wmea+rhfU3R4oZR5XyDujKvaLchLTQX8tu/vpXRqCewEBek70j1OMuEH+Hk6f40vljHRr5QXQO1JpOB136l9OwS7/61xAy9qem9aOkLNy2ns3RF4+fIa32H4c4sohqaSICHqezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZV1Xrp24hzBjC7X/wRRug3+v8GuB2ErTpL9mzqJDug=;
 b=x+YbOPZbjYULl/rpj6pv1khL+P4Dna0rbkoRoSJHw3jPbJHO5B1hXQiNDD7BZbIaGCmPbne8ftZkU8Rh7lJ1llHAnNqCGAoKB8tjC6stGLInEoR7w19m/RcZd2iYPvO4zgK7H38SGtafIEA5cFBE97EAERkxO1pk5gdreugvFFl2ZaIb4dxaohfvnYOQy5PVrGKzs8BLtd0epTwR4g63qErVni95LwZLdeOrU7FXrhjGLChW4WlQW3wDe2tj+oICCmB2cW3xhNwFISfVmV/hgAokcqOQq1Rs0qHszuazzSjSqjZGvSvTH3+P2PwFN4G5mqlzI7RMaRnNCYSJGNvypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZV1Xrp24hzBjC7X/wRRug3+v8GuB2ErTpL9mzqJDug=;
 b=A7Xqz+WCoczoYISAxsK7RKP2SydjqIiC0O/XsqI7p3TnXnMWzDpAfameEZDMLw3OQB2KPF9iQpd0lryMU+BO4BgYIm4+MkbSv5i5Hfwrrm/oA5vbxWNIVPE44VvXFcBAUp4yCDmc9VbDuqnamAQnT54InzvW9vmFYRJCPeuKa8df0X8vspCxgiB2qufaccLpZBGlmKuzDAfLFD1HSexDcJ6zXa/XnpfUIVYs8fli9zM/teXKTid5ETqfagl8pS7i/mlIYSFKe1HvdmK1cCWH3/L0iP9/GAo3D00w0TXOfqflkAgrj9FLiy13E150jFbExs2xqPdLBbOu0J3DE1ceaQ==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
Thread-Topic: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
Thread-Index: AQHbnZfMrs+h0o/uEkuTNWO41qxIcA==
Date: Tue, 25 Mar 2025 15:08:42 +0000
Message-ID: <20250325150842.2015968-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR03MB6412:EE_|DU0PR03MB9256:EE_
x-ms-office365-filtering-correlation-id: 230c80f1-f831-4a8c-8a1e-08dd6baeeebb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qXm6SISIU7WBgutD2M/lI0cm2JuwEAQ3YkAUB0Sq/O5f/cPPBGCiYTr6r7?=
 =?iso-8859-1?Q?TtP4dF4KWk8lYaz29j5dCtx9e7gLC0VbehkxNSsmlymmGWtDT4s8pmwgJ+?=
 =?iso-8859-1?Q?jm38iScsr7L5mbOFIrf3unhbRhpyi5GYEOc7kGLVNgMpRjYsFDZS1wILIl?=
 =?iso-8859-1?Q?ANwt7IatEKOyHzVhq4kPQcOr1yMLccDY4TJihC0l/E2rdtfb6fh2wwyet6?=
 =?iso-8859-1?Q?eQHg71Xcu9VHJgBJdDxFtWxG4GcIsY7uDcOyLhixroHCiioA7j67ydhT2P?=
 =?iso-8859-1?Q?08IVZ2gaK4DP3mFxr5gJmERf046HEPC/oEn2k9qka7zrkqGzG+NEaLUrGB?=
 =?iso-8859-1?Q?g12tUrvoOurKzOljQRE/Q/IxMgXJtRCLVFRk2x9yV6Z2VdMjZrz6LuGU9m?=
 =?iso-8859-1?Q?7cQ8hNInd2ykkwE1IgIAkAwrKk4q9Fb4DJKmOQMzD3gKXQleJxVXrm6SJ8?=
 =?iso-8859-1?Q?i0ES5bvsBSPXkkyJILgZbGxEY0w8NbBhaYHo3N2mEkNJrBBLL6ytGg5Ibq?=
 =?iso-8859-1?Q?DePHseDq9XYm8Q5H/R5JCJBkES9u+wyN0BUnmoc5yoPtz77I170sEPFTFd?=
 =?iso-8859-1?Q?7y1nd5mzbnABJHqdThnwV0ai5OFQXxAhbCaYEmO/5rjnpTneZ+j6BbT233?=
 =?iso-8859-1?Q?YQgTF6Izc8SNKi3Ry0hTMWhjOpxq9/qSwn2GktpjrqRJDxdL7gnMF4gGNC?=
 =?iso-8859-1?Q?mZOK4DoDKEkkfOCXUtqenFEy72kd6XSd/t6sjxv7YEeOmwdUz4jbTo7vix?=
 =?iso-8859-1?Q?aORSNwPWzj6UfeStLJGmtyW1VYu4JZz+oUJrhNaM9GxeeM8ZPlWcY+tX5w?=
 =?iso-8859-1?Q?B5B5zTMI450Icz5FRtv17qCRIbST9Ww9GkVaHJtt6uoK16mYEqYUtkl3h5?=
 =?iso-8859-1?Q?B14dNB4T8p+r16TW/rPi/ZaKq/LsA0+S+yj7uVdGHd1fTsE0XRaqTweJod?=
 =?iso-8859-1?Q?p8bBRUx/ltYFyAjsMTSdfFUxF00uQ41B6pv5j9lO5NfSfNzjAxbHpAT2FU?=
 =?iso-8859-1?Q?ds09eE4dZTgCkLCBJXWgt/EL05NZFGFUL4mlKpg2M7Qr004lj0tLL6bEtM?=
 =?iso-8859-1?Q?k2MUC3OGkumsxF55HBoAdDRMnnL8SKYH+12LwFuIglTp8vvS7a+ApjJPaK?=
 =?iso-8859-1?Q?LSb+L2+ljXiUY8Usybr3i8Qnv9GiKWESC5h0H0XUMEwwxMh2qhR038TF76?=
 =?iso-8859-1?Q?vwqaiitTZCauQ16Ysq1S3g+Xa42UqEkqvNiNHpun1cE9OlrM6mhSkf8M11?=
 =?iso-8859-1?Q?Vq0iess8JRbYddNXd3MdgHEbufecAWmDsAMhpCnyKREV5TjHIN3p8YroT5?=
 =?iso-8859-1?Q?FVilAKZkaSNCT8Qo8JXeBd6iNOgRYUlGHhutLr3uq/94vHjp61rgsKXC14?=
 =?iso-8859-1?Q?OJgUGGzsSLdTxIBiObndAsdk6vavQhmyugNiZw1Nu/TrJcHckj4+u5Nz2/?=
 =?iso-8859-1?Q?HrYO7Kp3ckqjDBjbW058U6vMDuPA/B0vzsqS6/vgnpAN34c4TYNtos3N+k?=
 =?iso-8859-1?Q?LabWE4m3U4hJ4G81QLC02Q?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR03MB6412.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JoJW73SJy8vaMkofFhNqwj1lT/h3zzdln9tPfgxt+DbXq4Kj0wxhIIrWKh?=
 =?iso-8859-1?Q?hXIBi7i4Nv0DShYM957+QBW6hbmZPl8VHIjeoUVtlxWejD8hBHktJ09MQa?=
 =?iso-8859-1?Q?I/wkCfckSe9LRZ+RC4GXX1TWoMZoBk6v+x4KwHVqOVeCtsZMQwW2qH0M9+?=
 =?iso-8859-1?Q?5tMu2rau0Pwl6AyyTWaZPMkvhONXnWqcUE6sh9uGuBcIx+8z5OOv/7Gw0t?=
 =?iso-8859-1?Q?RErgSnvB7JOkRzJy8AJp320Hyfx4PNheNi5F5wqpQNElAwZvoy4sZAjZmu?=
 =?iso-8859-1?Q?Dj3QD2GXZ38gMj3gIRDK/FxnkkdpXymdCj7TAWjJTlSX+TOOqX7dqcXxgu?=
 =?iso-8859-1?Q?p+mj/D9kNYySs6t0jVxwXVR6I0WXmn2dDtZ1APvyx7RSc+oqTVIYlxANlQ?=
 =?iso-8859-1?Q?T9dOgIdYDhZr6yA3pr/6WUCydIVWyvNyM0G6a3mqlQ/dWreDa1W5HtI5bO?=
 =?iso-8859-1?Q?P1JHA3PjyKWtlqk9PTXE8rfDNZ8qy9rC89L01KpKd7zf03iUA7zzSy6S+w?=
 =?iso-8859-1?Q?mOv5MQIrPZCq8YKvg6BK5BZw3Op9VOubSUhb5ELd1ieywRbamdXDG2kjwQ?=
 =?iso-8859-1?Q?H64wahH/jhJ0cutO+t4wLbQUS2+9WHafOGSj1BpwnSkgCl3uS4CatAnQr4?=
 =?iso-8859-1?Q?Utq1mqATEfKd8rfpTkrQ6ZzUtEYh7aoPQdb0J9wd0SnQPGjo43ugacAlH/?=
 =?iso-8859-1?Q?asZzXGPz7gwniFJkotpD499l2snM9QmvVGX4e3I47RI9GsBAr6Oz5f/XoN?=
 =?iso-8859-1?Q?8mrjtn3T4MKjOh/mubLo+RCWiLa8ASZSdCPTPYEyAsJvhKleLe8gnNlQeF?=
 =?iso-8859-1?Q?/gJhVESVRM0vWU9nwaiZQ07NQGboR8fG51+WSIocnvWKZlmdkit0Qp3WkM?=
 =?iso-8859-1?Q?Rfx1D6XESCQBTc3Fmij2yyzSC6vrTSFQ6kNUwCREWu9jRDXHYW6+spMoMU?=
 =?iso-8859-1?Q?tVsdTSSehSUk3AA/xjY4Hz2w1t/mRWyz8is2NAwHlMZo9ZjKhaB72/lyPQ?=
 =?iso-8859-1?Q?KwVzE6R4jCBfbrQJAu8r2m73UXncu7uSQaDicL8aiMtmWbMfCYR+q52KwH?=
 =?iso-8859-1?Q?QXSqsNWrcbwaENW0ZCeF2Bie7a60aq/oMt5Ee0be/HxHiR35BGLBEf5WUw?=
 =?iso-8859-1?Q?KCCLYR+lTY3hUWNagjJlSvfuZxN2PCElpC1NHLn9tXbZPYc11IHqxuV1de?=
 =?iso-8859-1?Q?JiimFR/lBWTvM+WrFehYaOMJCnNoiRkZR8OCGDzJR7Y8hTwCU7NRSC/3WD?=
 =?iso-8859-1?Q?OW4U9+ERRGGJkgWtKgqqBfX8aKrPEIYT95LlChL7jI/bxi/nFW+GH9lFos?=
 =?iso-8859-1?Q?81Zh49CG/+X+KghOAUzSZ7FqUy/yq1d0/iJ+U8HzuaRce+AcvH2RlhSUJq?=
 =?iso-8859-1?Q?cjnaeCtkLmG8cswORJ2O+sFr3Fs0+x028XVu5ivY00mZxWW+azXUxMjUGI?=
 =?iso-8859-1?Q?CxdOMWU5xZbYW0rdvMhRmbdQsf4ZKQIWPhltaEDM/ypOXM7ykhqo8WxWbf?=
 =?iso-8859-1?Q?wUMgkl3KzQxqTtj+F5vmnEyE1Cum+/zdZ2uPjsCjdBMX84Q2SEqAa3UPgp?=
 =?iso-8859-1?Q?R/V8Sqb3/E1UoFY/AJ7TuLsgPp24XSiT0+/5rpc4hpMHIlPedDPLAZbd+7?=
 =?iso-8859-1?Q?G22cszuM16tkAQNqmbfcbid8wQi6y0WiKVhgljfzm9wig3Th513c1cfI4A?=
 =?iso-8859-1?Q?KZnUv5zBZoU/soqAjDM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR03MB6412.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230c80f1-f831-4a8c-8a1e-08dd6baeeebb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 15:08:42.9816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zxaZJfGlt+9wjldzm995RfpSRIEkFAmvkAfWq9vSNP+E0+8rU5hda3Izt9lE6X1mv8Rkes3lnscDgEOCIS4qRNEFT85vUOJJZPliRwFmoB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9256

On the device-tree-based Arm64 system, if Xen is built with
CONFIG_ACPI=3Dy, CONFIG_STATIC_MEMORY=3Dy, and the static memory range
is provided in the host device tree, the BUG is triggered in
common/page_alloc.c during Xen's early boot. The BUG occurs when
the first page from the static range is fed to the domain
sub-allocator and finally ends up in mark_page_free().
The pg->count_info & PGC_state is not in the state that
the code expects to see there.

(XEN) Checking for initrd in /chosen
(XEN) Checking for "xen,static-mem" in domain node
(XEN) RAM: 0000000040000000 - 00000000bfffffff
(XEN)
(XEN) MODULE[0]: 0000000043200000 - 0000000043343fff Xen
(XEN) MODULE[1]: 0000000043400000 - 0000000043402fff Device Tree
(XEN) MODULE[2]: 0000000042e00000 - 0000000043111f82 Ramdisk
(XEN) MODULE[3]: 0000000040400000 - 0000000042cfffff Kernel
(XEN)  RESVD[0]: 0000000050000000 - 000000005fffffff
(XEN)
(XEN) CMDLINE[0000000040400000]:domU0 console=3DttyAMA0
(XEN)
(XEN) Command line: console=3Ddtuart conswitch=3Dax
(XEN) pg MFN 50000 c=3D0x2180000000000000 o=3D0 v=3D0 t=3D0
(XEN) Xen BUG at common/page_alloc.c:1474
[snip]

The problem is that the static range gets mistakenly unreserved
in populate_boot_allocator() and reaches init_boot_pages().
This happens since by the time the populate_boot_allocator()
is executed, the evaluated in fw_unreserved_regions()
an acpi_disabled variable is still false and as the result
the dt_unreserved_regions() which should simply skip that static range
does not get called. The acpi_disabled will be set to the actual value
(in our case it is true) later on in acpi_boot_table_init().

The important question is why acpi_disabled is false by the time
setup_mm() is executed. With CONFIG_ACPI=3Dn it is a macro that is always
true, but with CONFIG_ACPI=3Dy it is a boolean that is false from the very
beggining, even though the entire acpi_boot_table_init() (which is called
after setup_mm()) is written with the assumption that ACPI is off by defaul=
t
at the start. So, initialize acpi_disabled to true during declaration
if CONFIG_ACPI=3Dy to avoid an issue and match to acpi_boot_table_init().

Suggested-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
  V2:
   - drop post-commit remark
   - use the approach suggested by Michal
   - update commit subject (WAS xen/device-tree: Switch back to dt_unreserv=
ed_regions() in boot allocator)
     and description
---
---
 xen/arch/arm/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index ffcae900d7..9e94f1a8c7 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -57,7 +57,7 @@
 struct cpuinfo_arm __read_mostly system_cpuinfo;
=20
 #ifdef CONFIG_ACPI
-bool __read_mostly acpi_disabled;
+bool __read_mostly acpi_disabled =3D true;
 #endif
=20
 domid_t __read_mostly max_init_domid;
--=20
2.34.1

