Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72813B32B5F
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 19:49:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1091399.1448036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upsM2-0000Un-Jo; Sat, 23 Aug 2025 17:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1091399.1448036; Sat, 23 Aug 2025 17:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upsM2-0000S3-Gm; Sat, 23 Aug 2025 17:48:38 +0000
Received: by outflank-mailman (input) for mailman id 1091399;
 Sat, 23 Aug 2025 17:48:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yyzx=3D=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1upsM0-0000Rx-PI
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 17:48:36 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64698c1e-8049-11f0-a32b-13f23c93f187;
 Sat, 23 Aug 2025 19:48:35 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DU5PR03MB10472.eurprd03.prod.outlook.com
 (2603:10a6:10:526::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sat, 23 Aug
 2025 17:48:32 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.019; Sat, 23 Aug 2025
 17:48:32 +0000
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
X-Inumbo-ID: 64698c1e-8049-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uP72VS07U9Psaa8Cgf2O8CnI5Lh5kdwy0kR9tP2kljIAACkY1MjouRzle07wdK7Ck7c6cT3cqbVbJgCYKcBjcP8lqfTp6v5jhrk53iI9ETv5RfsMy/2+HVLSbcZq5eeggYe3Doo6fRaYpt6T6fBlM87mtSZQ1Vk/4a0bHDbTEHSqLNk4KpK3rM+jk2On500tnTrmv5O8tGURs7SBqfrZXxI5aeABnveUe2a4V+erKTY/YuNiP5GlxjcF7JlgMl/vdJzNolU5X2V1DOdjpsehKi4NHeQNNqY0Gs+geJIAJkKD2gHmTAM22VGCPz6PkoggINelqNrHzV2Jrfa7f3WnsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byq5LKwoiIkTRZ5imbGlcqxqp6QNf2lEqPGd2vliNl8=;
 b=sIC3Y1+/nP+sWxXfYDozXsFFhPw87qM37DWQhiJwoEe5FXHZWAGvy4f/ikDs2SqVh+NV92YfUveFYjGUHI7kK+eEdjt0DkzMcYq3bbbmvY+aEPnV2bW1cKqZTPYuTiUfshiga0ew9UeQIZFuSvC2hpsbA7lO9646VzkWaMSNVm6EZVaG17XJ3k3fJggfKan+z1b7TzA/7+dsOP+XHOcbf91HWbI4HEa79HlNnyqqhgXZcG01M1l6+vWwFvHI3gDbsaJDHGB2NXazNsz9S9iX2JTk/rbI41oS1IodRTorJJRhtz0q0z7YeiVdj0LQCVNUFeK2C5o9OXItpJ7hpQmo6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byq5LKwoiIkTRZ5imbGlcqxqp6QNf2lEqPGd2vliNl8=;
 b=hsnT0TjqGjRYMBrijOtWqtWd9vtMEASsBmQiLXVj41t1TbuD1jBgzqqT4PBsVmaquP+ka3iqPyyiLVHAiQTbLmkKF2es5Of0nMQGwKGZBqUOpyx0zZCRte1y+E/qktO8e2qbIfwPVFAtpgmEzPneyrutR0Mg3z/4ZYeQwrVFMJXSZb9gJihdFNnNCLrSO2zSWGYZ0aNq1c5y4fdl0Qvhpdu0vRB/Drum8bltlG2p9dfX6oEtu1qUuTT4yxhHtP1kHbKi0yVkiooiYLuTpmJuwBuIpGMFOeoZeaC0Xe1qHRyeihxck3b8ROhLVNYBFB/9gsNUBsKmQsRWdQmHv5fJiA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Mykola Kvach
	<Mykola_Kvach@epam.com>
Subject: Re: [PATCH v5 11/12] iommu/ipmmu-vmsa: Implement suspend/resume
 callbacks
Thread-Topic: [PATCH v5 11/12] iommu/ipmmu-vmsa: Implement suspend/resume
 callbacks
Thread-Index: AQHcCwFkX4gJFYauN0Oe6YQWa2GY2g==
Date: Sat, 23 Aug 2025 17:48:32 +0000
Message-ID: <87ldna6ia8.fsf@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
	<1689d707b930b1ea4f63cc150810e548962cda81.1754943875.git.mykola_kvach@epam.com>
In-Reply-To:
 <1689d707b930b1ea4f63cc150810e548962cda81.1754943875.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Mon, 11 Aug 2025 23:48:07 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DU5PR03MB10472:EE_
x-ms-office365-filtering-correlation-id: 9f7dfd8f-7d0f-45f0-bf4e-08dde26d4705
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?1Cj6M2wroFh8YtD9k/Idb1dTvnZoMDox/koniKFeoFuNIPycIOftelglqL?=
 =?iso-8859-1?Q?hGLOJSIW6F6P4s479U0H1zIaIV7BHMWp5lUlRbvVpYmDGJVcpsoTGNFJAT?=
 =?iso-8859-1?Q?oxtk5OSYT/l1+N5+WnyGtiKWsCdn4sMc+XMdIQVcMJzUUZTbFv7z9KZS2w?=
 =?iso-8859-1?Q?Al7KQuR6s1clpYAzq2vqjfq/LIDKaBNULBHIkLpAxYfwLmuTsKpphHeHin?=
 =?iso-8859-1?Q?2Ib7mVgqUvlQsc75dUk7z+MA5vqY9I+P6wydw2Sv6J2MfjgPxwI4zSVcy0?=
 =?iso-8859-1?Q?P39go3lmk8/f5WqtKVrSHkU7b4pcpUBIcBYl6ta+XjLa7LO7nd1uJNZ8am?=
 =?iso-8859-1?Q?LpIpCJh3owe5qMBRIFvW35hFyY6vShYMyIb8AhLeDlS7WUmiABRK9J4Z98?=
 =?iso-8859-1?Q?IuI+N+6ehkILkCjOYe9x5zjgTgK3RwFcGEiR/npIxF9Qv1xdfZHZDVzuaJ?=
 =?iso-8859-1?Q?qzYHS20r66i9zRmQoPo1P0JcK2ejfr1zo3opgs01IZjZe8hzIH7oy5r0IG?=
 =?iso-8859-1?Q?VLWJNJcBzDurKoXX4dpcSXEuvmyerU7sfSrZzgcLS9O5KFiYM9f0sOH9YV?=
 =?iso-8859-1?Q?Ffoyk+dvdU4WWtBlHQitArFidvrw8PtXeNUproJdZYf0Hrlrce0pNyf1Bk?=
 =?iso-8859-1?Q?6969glRn5FWm9H8z81O10kv+2hsw/IE5AnGGnTAAuUZsS0elkT/cFmAdJ2?=
 =?iso-8859-1?Q?azhSUQu7pSLFYHsD2ng6og85TairPePCNIujz65EkuClc6IbKMulfOHH2+?=
 =?iso-8859-1?Q?LglBTuHpiI6vU/Ek7nu8udV4Z1Mg/U/9u/6NC8NXpPtwyqnQmlypffa85U?=
 =?iso-8859-1?Q?rnVQpLXE6PYCb0ajWjJxLqj5mwXlt1+v8yRexfUoTvG6wLhwLiBd7N50ZI?=
 =?iso-8859-1?Q?tt+AQ5A4goXx0e5KYOjbDjHigQHKb5ugVkT3yCwRANQieK3p2C7fyosX7W?=
 =?iso-8859-1?Q?CyRRhENrr310gYCJJawoi3+YOQJSixXusAd/oToGL35/ASj1aaM3Wfil3t?=
 =?iso-8859-1?Q?sQbb9aaiz5ZRa3Y+M48XVMNFViLhFX/7GyEquCyffwOabdYfuoeomfUh/P?=
 =?iso-8859-1?Q?5FIp93OYZ6SdvD9ObLK0IcEUZ9YQ66EqygTFTGS+RJ1n661/3C+RBctfRR?=
 =?iso-8859-1?Q?8oKvWoUxkO3UGx0w5wrqR5IbdoczJAtF1N9xeiXkEspAL0za+5LJvmAQFc?=
 =?iso-8859-1?Q?gSh1H5g5wqC/sWVWStM4u1LQ2+iyqaABbdDZCjwB9DeHbDPvbmvtoV6nMq?=
 =?iso-8859-1?Q?ormUPd2RJebj69tMxNff9bsBf3CwTDQQ8QwlSjf/NeUHUcdBU51nWjNilF?=
 =?iso-8859-1?Q?ls+JZCqnpwNRnsn6xrBl0QQGqDVciCModvaX9RpXmElZF4qi1LeKZ1hMOd?=
 =?iso-8859-1?Q?iMbCp9mJofdVjOkglHlX+REfeuP4Ha6yYd6ZGbJ2L+g2pfSB7nqTNI2Xo9?=
 =?iso-8859-1?Q?Gregs68wO/6rNVFY+gbUWOqPyg9mmLCvW6REY3Nbui78qJd0djFg6SBaEe?=
 =?iso-8859-1?Q?cTOFxg9SNQK9Ge3Jg3cUK91HZyO9HIfJV2chry4Er+FVCA5exiHMVImwF5?=
 =?iso-8859-1?Q?7iR18R4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?EiYyLkU2bv7WisGBlhLlqXdoMb7M9mz5XqAa/Z44HrRQt5LTqazS1jm5Vp?=
 =?iso-8859-1?Q?DWwEtoFS2iKYKlDZYWrosy6WNxYa0j0Cq7CSbno8wDDEdUwzz8mPKkDCf2?=
 =?iso-8859-1?Q?vS6n7xXvnydy5H2xidHvsPra4PuXsn/a7WmGOLyiAcqUc/IiLfCRmoNMA4?=
 =?iso-8859-1?Q?4bdrBIJ9KjMniDI9crZDQhS3Ynbefa0RBMRLAm0+GVDWsQ3HTkl4Y+lnuz?=
 =?iso-8859-1?Q?TVey6TlsnieV3k2jArP+Z9qNX9xpGtyKSEx5xigmZgkN5EqzsT7JtOW2P7?=
 =?iso-8859-1?Q?y0stK6Y292dREX1TmlRJdSdshS4EFtjTSrYSUglcig74+frWMNo4aBuaBi?=
 =?iso-8859-1?Q?pJ+UMhXlQAFFukgQg0iihzPpIb8fHbuPI0D6XiviTa7K7rMq2GuiK7S7cz?=
 =?iso-8859-1?Q?k1VXtuV6ufLjSJURGTGIxfvCf+m7MXOXZC0/tItvuye4OumIEewEYz7JjD?=
 =?iso-8859-1?Q?Jd9RSuafqW5IdARZmy88iyQibc8B+17gZOQe+D8g0Wa+kWIEe2sGS9pEeQ?=
 =?iso-8859-1?Q?lvM6tpGlVE+eFM0SLkUYMye23Klh+uiF5omOwtnfTLGh7OpJ/h9jb1NzNA?=
 =?iso-8859-1?Q?MQg7/dUOiYny47Rl/F4H4z/I39NHBYAWNfTBS3DomZGrgggEvaryiqJBnv?=
 =?iso-8859-1?Q?KETgo/E+j40cH3HSrToZInnB1ZhNyanl1OY0RUh1h9VkFDaZKXD7yYwh2R?=
 =?iso-8859-1?Q?ZRH5IzMkvBaYXSu/smupW4gqujqa2wHos3BcNuDzQBsrojB4KyW5U6dpae?=
 =?iso-8859-1?Q?IrJA2FiJ908KA9xxQzZV6yZhRU+er63OVPrbJ79ptw9/0PvyTKKbHRi6sf?=
 =?iso-8859-1?Q?5vq6NnLQvCNZY2dXRrt6dG0xMYMa7EXYYEMh7rRpUt6W1sqMStqv11FmZ/?=
 =?iso-8859-1?Q?IOgRnYMERS0P3Xk8n3S7RW+oiiOxI1lvLES40AB0qE4jMfyumhZMWeZ0v4?=
 =?iso-8859-1?Q?WUpqfHK2/oWBjbG358pLKiYYSc59yyaqw+OluWkZM1v2859vb7VLmXesiw?=
 =?iso-8859-1?Q?+iNm06AYtyC+u/zcaTvau4rUNUBEGBhVRPK55Qhb4Cr5HZYRp6oNx/I2D1?=
 =?iso-8859-1?Q?79TqxwY5YnyQ5ReMEhgwWfWKxn1YZPVhq06ufZ4+bu3bDJHtl/L4CZDY/H?=
 =?iso-8859-1?Q?rm//gIPgoZOJUusKqAUqH3Mkhxymlq8nznPy4Ju4xm4MIoBYl20VmHif+O?=
 =?iso-8859-1?Q?77DTP5JaAULgkJ0F2iaz9Y4XY0Vw1ClP0phBODuMOGHZAsBBlYTqflnG10?=
 =?iso-8859-1?Q?pLvz5ln/vxMiC4sqYEu5xugqcnQbGiu+BHy+s8tzPTE8k5EtvXmdWgJUrc?=
 =?iso-8859-1?Q?f51SH78iEqMy/ja9pFMiWUCFhDdu7zAyfekaF4IzwxRrkmqkMHyn0fR+rf?=
 =?iso-8859-1?Q?7zSZkc7Yszwn4+n69fHcfkPdw3M4bkyD1kQThw4UaDXyJe7/S1fTPry1CD?=
 =?iso-8859-1?Q?e4YPXlfKgISQGBcrNnawYhdadkVjuqcx7gAO7a4oYY4qU+6y/UHAP9bNSp?=
 =?iso-8859-1?Q?LyV7VgJYQDlehGR0CtSPbJDdNb7JbwCnLNxZ4Tx150uT6woBEB2abQVcmL?=
 =?iso-8859-1?Q?BpDutQ/QXmmVzoFOJcrNkxifcthGgTD9tlxsdu0phiSqFojUW+gEKg9T+U?=
 =?iso-8859-1?Q?Vru1uQap4kWdLfL52ztepRFekDvJcIvDXyxmVHKGWaJ8WSE2ggn7Yd/A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7dfd8f-7d0f-45f0-bf4e-08dde26d4705
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2025 17:48:32.6935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /YMzoJoEAhK8WKjIMxwntNQ9q5wyLV/+q+ETLIH9Qfo2KAJID7rX4FA4drjpc/yiaXGYo7kuJkQGacGz+GQw+MBvImi1dO3O/KhZlnBSv1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10472


Hi Mykola,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> Store and restore active context and micro-TLB registers.
>
> Tested on R-Car H3 Starter Kit.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 269 +++++++++++++++++++++++
>  1 file changed, 269 insertions(+)
>
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passt=
hrough/arm/ipmmu-vmsa.c
> index dac0dd6d46..ced762657a 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -58,6 +58,8 @@
>  #define dev_print(dev, lvl, fmt, ...)    \
>      printk(lvl "ipmmu: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> =20
> +#define dev_dbg(dev, fmt, ...)    \
> +    dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
>  #define dev_info(dev, fmt, ...)    \
>      dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
>  #define dev_warn(dev, fmt, ...)    \
> @@ -117,6 +119,23 @@ struct ipmmu_features {
>      unsigned int imuctr_ttsel_mask;
>  };
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +struct hw_register {
> +    const char *reg_name;

Do you really need to store register name? It is not used anywhere.

> +    unsigned int reg_offset;
> +    unsigned int reg_data;
> +};
> +
> +struct ipmmu_vmsa_backup {
> +    struct device *dev;
> +    unsigned int *utlbs_val;
> +    unsigned int *asids_val;
> +    struct list_head list;
> +};
> +
> +#endif
> +
>  /* Root/Cache IPMMU device's information */
>  struct ipmmu_vmsa_device {
>      struct device *dev;
> @@ -129,6 +148,9 @@ struct ipmmu_vmsa_device {
>      struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
>      unsigned int utlb_refcount[IPMMU_UTLB_MAX];
>      const struct ipmmu_features *features;
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    struct hw_register *reg_backup[IPMMU_CTX_MAX];
> +#endif
>  };
> =20
>  /*
> @@ -534,6 +556,235 @@ static void ipmmu_domain_free_context(struct ipmmu_=
vmsa_device *mmu,
>      spin_unlock_irqrestore(&mmu->lock, flags);
>  }
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +static DEFINE_SPINLOCK(ipmmu_devices_backup_lock);
> +static LIST_HEAD(ipmmu_devices_backup);
> +
> +#define HW_REGISTER_BACKUP_SIZE 4
> +
> +static struct hw_register root_pgtable[IPMMU_CTX_MAX][HW_REGISTER_BACKUP=
_SIZE] =3D {
> +    [0 ... (IPMMU_CTX_MAX - 1)] =3D {
> +        {"IMTTLBR0", IMTTLBR0, 0},
> +        {"IMTTUBR0", IMTTUBR0, 0},
> +        {"IMTTBCR",  IMTTBCR,  0},
> +        {"IMCTR",    IMCTR,    0},

Taking into account that only 4 registers needs to be saved, will it be
easier and more efficient to have a hardcoded struct like this?

struct ipmmu_reg_ctx {
    unsigned int imttlbr0;
    unsigned int imttubr0;
    unsigned int imttbcr;
    unsigned int imctr;
}

instead of hw_register[] ?

Especially taking into account that struct ipmmu_vmsa_backup{} does
exactly this.


> +    }
> +};
> +
> +static uint32_t ipmmu_imuasid_read(struct ipmmu_vmsa_device *mmu,
> +                                   unsigned int utlb)
> +{
> +    return ipmmu_read(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)));
> +}
> +
> +static void ipmmu_utlbs_backup(struct ipmmu_vmsa_device *mmu)
> +{
> +    struct ipmmu_vmsa_backup *backup_data;
> +
> +    dev_dbg(mmu->dev, "Handle micro-TLBs backup\n");
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +
> +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
> +    {
> +        struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(backup_data=
->dev);
> +        unsigned int i;
> +
> +        if ( to_ipmmu(backup_data->dev) !=3D mmu )
> +            continue;
> +
> +        for ( i =3D 0; i < fwspec->num_ids; i++ )
> +        {
> +            unsigned int utlb =3D fwspec->ids[i];
> +
> +            backup_data->asids_val[i] =3D ipmmu_imuasid_read(mmu, utlb);
> +            backup_data->utlbs_val[i] =3D ipmmu_imuctr_read(mmu, utlb);
> +        }
> +    }
> +
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +}
> +
> +static void ipmmu_utlbs_restore(struct ipmmu_vmsa_device *mmu)
> +{
> +    struct ipmmu_vmsa_backup *backup_data;
> +
> +    dev_dbg(mmu->dev, "Handle micro-TLBs restore\n");
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +
> +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
> +    {
> +        struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(backup_data=
->dev);
> +        unsigned int i;
> +
> +        if ( to_ipmmu(backup_data->dev) !=3D mmu )
> +            continue;
> +
> +        for ( i =3D 0; i < fwspec->num_ids; i++ )
> +        {
> +            unsigned int utlb =3D fwspec->ids[i];
> +
> +            ipmmu_imuasid_write(mmu, utlb, backup_data->asids_val[i]);
> +            ipmmu_imuctr_write(mmu, utlb, backup_data->utlbs_val[i]);
> +        }
> +    }
> +
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +}
> +
> +static void ipmmu_domain_backup_context(struct ipmmu_vmsa_domain *domain=
)
> +{
> +    struct ipmmu_vmsa_device *mmu =3D domain->mmu->root;
> +    struct hw_register *reg =3D mmu->reg_backup[domain->context_id];
> +    unsigned int i;
> +
> +    dev_dbg(mmu->dev, "Handle domain context %u backup\n", domain->conte=
xt_id);
> +
> +    for ( i =3D 0; i < HW_REGISTER_BACKUP_SIZE; i++ )
> +        reg[i].reg_data =3D ipmmu_ctx_read_root(domain, reg[i].reg_offse=
t);
> +}
> +
> +static void ipmmu_domain_restore_context(struct ipmmu_vmsa_domain *domai=
n)
> +{
> +    struct ipmmu_vmsa_device *mmu =3D domain->mmu->root;
> +    struct hw_register *reg =3D mmu->reg_backup[domain->context_id];
> +    unsigned int i;
> +
> +    dev_dbg(mmu->dev, "Handle domain context %u restore\n", domain->cont=
ext_id);
> +
> +    for ( i =3D 0; i < HW_REGISTER_BACKUP_SIZE; i++ )
> +    {
> +        if ( reg[i].reg_offset !=3D IMCTR )
> +            ipmmu_ctx_write_root(domain, reg[i].reg_offset, reg[i].reg_d=
ata);
> +        else
> +            ipmmu_ctx_write_all(domain, reg[i].reg_offset,
> +                                reg[i].reg_data | IMCTR_FLUSH);
> +    }
> +}
> +
> +/*
> + * Xen: Unlike Linux implementation, Xen uses a single driver instance
> + * for handling all IPMMUs. There is no framework for ipmmu_suspend/resu=
me
> + * callbacks to be invoked for each IPMMU device. So, we need to iterate
> + * through all registered IPMMUs performing required actions.
> + *
> + * Also take care of restoring special settings, such as translation
> + * table format, etc.
> + */
> +static int __must_check ipmmu_suspend(void)
> +{
> +    struct ipmmu_vmsa_device *mmu;
> +
> +    if ( !iommu_enabled )
> +        return 0;
> +
> +    printk(XENLOG_DEBUG "ipmmu: Suspending ...\n");
> +
> +    spin_lock(&ipmmu_devices_lock);
> +
> +    list_for_each_entry( mmu, &ipmmu_devices, list )
> +    {
> +        if ( ipmmu_is_root(mmu) )
> +        {
> +            unsigned int i;
> +
> +            for ( i =3D 0; i < mmu->num_ctx; i++ )
> +            {
> +                if ( !mmu->domains[i] )
> +                    continue;
> +                ipmmu_domain_backup_context(mmu->domains[i]);
> +            }
> +        }
> +        else
> +            ipmmu_utlbs_backup(mmu);
> +    }
> +
> +    spin_unlock(&ipmmu_devices_lock);
> +
> +    return 0;
> +}
> +
> +static void ipmmu_resume(void)
> +{
> +    struct ipmmu_vmsa_device *mmu;
> +
> +    if ( !iommu_enabled )
> +        return;
> +
> +    printk(XENLOG_DEBUG "ipmmu: Resuming ...\n");
> +
> +    spin_lock(&ipmmu_devices_lock);
> +
> +    list_for_each_entry( mmu, &ipmmu_devices, list )
> +    {
> +        uint32_t reg;
> +
> +        /* Do not use security group function */
> +        reg =3D IMSCTLR + mmu->features->control_offset_base;
> +        ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) & ~IMSCTLR_USE_SECGRP=
);
> +
> +        if ( ipmmu_is_root(mmu) )
> +        {
> +            unsigned int i;
> +
> +            /* Use stage 2 translation table format */
> +            reg =3D IMSAUXCTLR + mmu->features->control_offset_base;
> +            ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) | IMSAUXCTLR_S2PT=
E);
> +
> +            for ( i =3D 0; i < mmu->num_ctx; i++ )
> +            {
> +                if ( !mmu->domains[i] )
> +                    continue;
> +                ipmmu_domain_restore_context(mmu->domains[i]);
> +            }
> +        }
> +        else
> +            ipmmu_utlbs_restore(mmu);
> +    }
> +
> +    spin_unlock(&ipmmu_devices_lock);
> +}
> +
> +static int ipmmu_alloc_ctx_suspend(struct device *dev)
> +{
> +    struct ipmmu_vmsa_backup *backup_data;
> +    unsigned int *utlbs_val, *asids_val;
> +    struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> +
> +    utlbs_val =3D xzalloc_array(unsigned int, fwspec->num_ids);
> +    if ( !utlbs_val )
> +        return -ENOMEM;
> +
> +    asids_val =3D xzalloc_array(unsigned int, fwspec->num_ids);
> +    if ( !asids_val )
> +    {
> +        xfree(utlbs_val);
> +        return -ENOMEM;
> +    }
> +
> +    backup_data =3D xzalloc(struct ipmmu_vmsa_backup);
> +    if ( !backup_data )
> +    {
> +        xfree(utlbs_val);
> +        xfree(asids_val);
> +        return -ENOMEM;
> +    }
> +
> +    backup_data->dev =3D dev;
> +    backup_data->utlbs_val =3D utlbs_val;
> +    backup_data->asids_val =3D asids_val;
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +    list_add(&backup_data->list, &ipmmu_devices_backup);
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +
> +    return 0;
> +}
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>  static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
>  {
>      uint64_t ttbr;
> @@ -546,6 +797,9 @@ static int ipmmu_domain_init_context(struct ipmmu_vms=
a_domain *domain)
>          return ret;
> =20
>      domain->context_id =3D ret;
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    domain->mmu->root->reg_backup[ret] =3D root_pgtable[ret];
> +#endif
> =20
>      /*
>       * TTBR0
> @@ -602,6 +856,9 @@ static void ipmmu_domain_destroy_context(struct ipmmu=
_vmsa_domain *domain)
>      ipmmu_ctx_write_root(domain, IMCTR, IMCTR_FLUSH);
>      ipmmu_tlb_sync(domain);
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    domain->mmu->root->reg_backup[domain->context_id] =3D NULL;
> +#endif
>      ipmmu_domain_free_context(domain->mmu->root, domain->context_id);
>  }
> =20
> @@ -1307,6 +1564,14 @@ static int ipmmu_add_device(u8 devfn, struct devic=
e *dev)
>      /* Let Xen know that the master device is protected by an IOMMU. */
>      dt_device_set_protected(dev_to_dt(dev));
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    if ( ipmmu_alloc_ctx_suspend(dev) )
> +    {
> +        dev_err(dev, "Failed to allocate context for suspend\n");
> +        return -ENOMEM;
> +    }
> +#endif
> +
>      dev_info(dev, "Added master device (IPMMU %s micro-TLBs %u)\n",
>               dev_name(fwspec->iommu_dev), fwspec->num_ids);
> =20
> @@ -1372,6 +1637,10 @@ static const struct iommu_ops ipmmu_iommu_ops =3D
>      .unmap_page      =3D arm_iommu_unmap_page,
>      .dt_xlate        =3D ipmmu_dt_xlate,
>      .add_device      =3D ipmmu_add_device,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    .suspend         =3D ipmmu_suspend,
> +    .resume          =3D ipmmu_resume,
> +#endif
>  };
> =20
>  static __init int ipmmu_init(struct dt_device_node *node, const void *da=
ta)

--=20
WBR, Volodymyr=

