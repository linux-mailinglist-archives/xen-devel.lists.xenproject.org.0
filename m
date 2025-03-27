Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26990A74186
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 00:30:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930029.1332757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txwff-0006Ga-0g; Thu, 27 Mar 2025 23:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930029.1332757; Thu, 27 Mar 2025 23:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txwfe-0006Dj-UB; Thu, 27 Mar 2025 23:29:58 +0000
Received: by outflank-mailman (input) for mailman id 930029;
 Thu, 27 Mar 2025 23:29:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKAi=WO=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1txwfd-0006Dd-I0
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 23:29:57 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 600c0b81-0b63-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 00:29:49 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA4PR03MB8198.eurprd03.prod.outlook.com
 (2603:10a6:102:26b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 23:29:45 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 23:29:41 +0000
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
X-Inumbo-ID: 600c0b81-0b63-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKFSfMOjg7IrAFUNXmrW+CRZJDEY6aBKlH0nWvTSXs3J302n03SSjWf2EmLx8LMdzG/9KqRrRRS9IAOT7z0XRrqa2y9gIy6FIUm4kKWUsEI4jjRQXHSMSCu8L/ZXacAp2mAAZdJH7LFE7HQaPr7n2NK5sWpqnB1ShkJ/BSV7YXrgjQTysQpLdYucKlm7WJ0+5awbRu3ivYSh3YIbhYRuSZL2KBJK+OeWnCrEQdvjz6Qu7wubL5O3qczt2W/B16IVcWcLi//6mIsQqFKqf8TDQy42ERNN8A6xvjeyQ7E8SkMC0FSM7pgwlskRmRVUxFLLOmVTqnFjGcaur3B9p/YzXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XuwBDZJCe5a8F5N8sJIKxSKWoYzZ5uNWTTa/z3cNo0M=;
 b=SzLMuC9VTfGdHV3X8N60p3nf/audbj3DAuzkFu1N4YNM2X2hksL33wiKt1jazNBGw1gZnZYllCtei2lg2o6CrLZ+J7BHkKpcOXvjsv2hBiWX/vVnhZQIaQa9kpuwQtJ5FzyoYIv1HiiYXy3QQyKqGALoGA9WY0Gm59wSdc3ONIc9+EaAl0htDjDF0rQX6iCzgXTkRlIfOwqRa0tuykCdUwzuyucZSj0I2IvvaiiN97eaqv49SIpkn9oy+sTB88RrTfFnX0vU0q1q9hyoK+TftVO0nx46FP1nz/A9No+h86dHxkby2iziZPk3+HWl0Tbs4dMEQS0TRzcLcDaiPqngJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XuwBDZJCe5a8F5N8sJIKxSKWoYzZ5uNWTTa/z3cNo0M=;
 b=C0/0o7jqu1oyhvV7ZVC0TPBk/LJEPDGZzi/B4adh3wICIFQ07aDwG5+HXfHdN36Fxe3kfpOP9dZOzB6uP8ETNMK4V0/tlZU5xG2vhJaGYgZlN67p3N/VzBuvjr/iyZkcDu6reUpiRdLh9/Qi7fbrywhQccpIKIP7TqY51WzSdo0t4DXZwjWnVsB2Y0lTVQYKxhvr9JHdZ5L386/bVHjKTHEU64TvCk2HEOB/kKjiZCrVISrysmGgw5NoO+18oWRj6dslqj+STEMeZy01TDCT/BjWj+PvnZLAbwQWCbrDZHxBzqFtzerGAm88zIu5LrunGX9+Lu4XE81JLSjNjLJQXA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "bertrand.marquis@arm.com"
	<bertrand.marquis@arm.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>
Subject: Re: [PATCH v2] xen/arm/efi: merge neighboring banks
Thread-Topic: [PATCH v2] xen/arm/efi: merge neighboring banks
Thread-Index: AQHbn25L9MOxasb+kUeBTVxHMa1HHQ==
Date: Thu, 27 Mar 2025 23:29:40 +0000
Message-ID: <87cye2giho.fsf@epam.com>
References: <20250327231627.1111684-1-stefano.stabellini@amd.com>
In-Reply-To: <20250327231627.1111684-1-stefano.stabellini@amd.com> (Stefano
	Stabellini's message of "Thu, 27 Mar 2025 16:16:27 -0700")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA4PR03MB8198:EE_
x-ms-office365-filtering-correlation-id: 89d60144-98fb-4891-596b-08dd6d873f7c
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?BeLexkFkxK8JAmQUj2LYXVC0NqlUiX7CvVAVRRKZaZQC+xtJYrlm6cEr1s?=
 =?iso-8859-1?Q?69BKZ/ncvdiefrpGsiJLlcc6qtI8doH4YGtwnVAUGUG1BU7GZ+CLe5s4DW?=
 =?iso-8859-1?Q?TTdBR+oKcVduELc7SRV3c64l/JdcJQYbRDaeKJlpBGDpGz4zdr9VQ/Tr8O?=
 =?iso-8859-1?Q?JUHHqYWlqTf3O213CyMD8E3O+G5j0WRqnt4FC6SxbeUyExr4XU6e/00pZC?=
 =?iso-8859-1?Q?AytVqUvMYhGqrjsWT6McUPJQMQCwrIV07CjHqsiqLLDsKR6m4nl8YxIhqo?=
 =?iso-8859-1?Q?ldsLgxBdDaOaDuPrU7ZKe+Bk7BFybzADOpfir52TeeF8nR/0QfsV2hacAe?=
 =?iso-8859-1?Q?+Ta7ms95qKq1K82NXKj8C0RL4s8U1hyK90WWEdOjcfF001Vy8QeL2rwiE4?=
 =?iso-8859-1?Q?6qiXglcYgncDwHnUvRpJ7Ajf1mfMtEA95qPhp2zYywPgKYP46dtBAHXeC8?=
 =?iso-8859-1?Q?rvmwOuSGZTeWtJ/MQlePW2BbyJYP+36b8LlMRFQULbXkFH98d+AzXY4hXY?=
 =?iso-8859-1?Q?WuXgJxaDvUREKL2KoVGjoIZfdRhqBEErN3YkbxYnQJIrPgHlI96n/rLIhh?=
 =?iso-8859-1?Q?l+KNZ52em3hu81VmP2QGkXNUaZromIV0l6ehwHZ7VztsAf6ocq0PWohZMG?=
 =?iso-8859-1?Q?2DXjru2OenSiGKGzkCAvpL4JnhT+Yr1jS5CdBXBM0epPrOfE5fCJkWyQ8u?=
 =?iso-8859-1?Q?jWMFTu6mQ9+k0y3SRIjtjCuCJCJzFAaf+UPfFHmaysXkMjx8WWJgYEsCeQ?=
 =?iso-8859-1?Q?P/7S+OcZvdRc4whU1FHphUati7myOn2D45PTOuWKTdyyhD9qMTba5yTvqq?=
 =?iso-8859-1?Q?E/5ntcFqbgkbOXKNGHkpbLd6iOvnH3uVcpJSwPlwxnN2aE/f0nnxDdravt?=
 =?iso-8859-1?Q?m89x25GytA4OZalNbSfru0SG+VAzvRm3FTeWSoKY//zEnRtlfEbvRPhVGD?=
 =?iso-8859-1?Q?AU12F650hrPuF2LBF8i9f3hFEzCOCIFNhzcV4KQazqhjbi3NIKYy7zHCv5?=
 =?iso-8859-1?Q?BEI2M3U82FFrI2s66M/onfZ6Ou4opy1fil4oMDlMv3ettzM9we9XpEAkYd?=
 =?iso-8859-1?Q?e8ESAWpyhbNIhaceM492ECVuxPewsovrSjz0ClaXv5HBHx1cIE3TNmBoCF?=
 =?iso-8859-1?Q?8dsPA/g0i47cUSXWHyPYOXl5HlRlHUVvmCWpgE3/+awgzlbKs+sZ9U29xs?=
 =?iso-8859-1?Q?7fJ9yDf3/QGfGsquzH2PwboFexycHyLKPQYLD99nuYpZSfVdqSpEzRWod1?=
 =?iso-8859-1?Q?hvYX8k+1mcLh82b7S6dHu0TSiVSZKD94vnOuOs8iQWX+mjKY7KZPN5G3kd?=
 =?iso-8859-1?Q?oFXUKnXHaQbiLmRt7n5VPyuHB3Er1f2laPLFqcB/TqJSq+ppYTgVQanFhF?=
 =?iso-8859-1?Q?wGKA72wYuQoguYiYp+/Y5KEFbZNe+2assoex6yENng1y2tmu+sl1Pu/nRq?=
 =?iso-8859-1?Q?dQHs3t/N6DYZYRkYuu62SS+rwkx3tl+RNhXaV1U0gketGWPvETOCM2UzXo?=
 =?iso-8859-1?Q?Jov2nkGYkqZaC+Pgt80TBm?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3PJaLczK5e5G0w8dogek58NuKhxwEX2KuKRTGyIiEt4uDYYVN42PuqeAdp?=
 =?iso-8859-1?Q?NzOkUhp6pxWGDcsOqhoZR84WgIbRRqEyVDW0RryZsDd3BUKCUzhaPJy4An?=
 =?iso-8859-1?Q?FhIxFO+SLpN8slLfXra0lruoNtIpdM5nStQfx8jZL+gJaKdxe5PPEcx14P?=
 =?iso-8859-1?Q?gAL00/PCy3HrXbP64eNQSw/VnAfiQeC8xa2BGGiSq4WKBZJZJmcSN/xH5w?=
 =?iso-8859-1?Q?yC+LWXSmCmUWc2VMtwVHNNNlqvOlJiAYslfgX2QJjdmKRleffa3eA2uDhr?=
 =?iso-8859-1?Q?uzmPvGpGBbZt710UN1LlCYvvGnw9JUMSKOPYUBUVSi8gobkWQRi6Qxf6Ik?=
 =?iso-8859-1?Q?cBL/IHT/HTIsJ64OlmDqb1kBUtlGTQQFKhJqOt/ZbxSpwzTvXWAFko9R4f?=
 =?iso-8859-1?Q?fPxUKTmScUF40iqqXubG89FIsFIF+mIW92TiMphwe7SWFX5UoyOzG7DIhR?=
 =?iso-8859-1?Q?55nvkv3urkjCyybYjyq0DFF6wt0nkIE2OsCeuAD7eVf3QfTXvNiglciTfu?=
 =?iso-8859-1?Q?o9fxRkwq+O4OrVjP3dymKIBtOXnWg0HF//YjhcOY0QZ4P44OoaGevoPiDk?=
 =?iso-8859-1?Q?04pyVvCp1bOQPzzk3tgje1OJocX2qmX6eOMfCKLfFdXN0UAGqJMegIJb1f?=
 =?iso-8859-1?Q?3IXMSsSjiPIALT79naG5cZ1/h3ifgSf83nTstwG0yi1XV/lb59Z+0WQ5XY?=
 =?iso-8859-1?Q?a79VfUBdETlAgDPg1dkXPrFl46qurdScc2XvbkCU4dyfkbxrIk2bb/PUH5?=
 =?iso-8859-1?Q?duT/YhWJ7JJQiU49GuaOQRfJGf+nplJAulXex6Ceo+LWhD+7nAbd2oOYel?=
 =?iso-8859-1?Q?mlC9daL2Y7faUzylckC22y84xN3vm7SwWLX2wutG60N6a8s2VVlUTGqPJJ?=
 =?iso-8859-1?Q?gvMyXbJMGYj6KHRxC+6zrDEbdt3w8Ihtpqm3jik7RQhbEk5rtGn9MfXqz4?=
 =?iso-8859-1?Q?oj004fqzRyHJGnFc+H8/ZcE2As0iHV49lDVM/rKe+v70CF0hVa8K60brl6?=
 =?iso-8859-1?Q?9oR+liNqu5qEAcNicUvh5xBajf07986Q1uy7GO2/zWHe2QottGk5mwPAPc?=
 =?iso-8859-1?Q?IL+gZbe32UXvS+2cJdA9OoIfA2gEAGQVwacV/fMsm+zaK+pkW2kYMhwXCo?=
 =?iso-8859-1?Q?X3eylh8baToeEF3CAUjqBxyGKAmH2EBc5AuvogAQI5PG8lwCcFHV26sDz9?=
 =?iso-8859-1?Q?710Y8Y5xDNw1RU/nOqWPmibq6DDOkjKeGe+dsaLELARGvOpMQR014x373o?=
 =?iso-8859-1?Q?gi98g8j9c6/QvpHqrdwZOU2JVKg7F2Q65daC9oUuaGUQi2fts3J9nKDjE2?=
 =?iso-8859-1?Q?//Jv/pY0h+M28X2RwWPCvEBh+0eto++eIpDNAnRnO/xJY8jl/h7rfau312?=
 =?iso-8859-1?Q?9kEDRcPg0J9NLPIQYeEbTFnO5xN2iqVlcuR2BRnfr1NovandcqTGgBGgOz?=
 =?iso-8859-1?Q?o1EZVJnUwUK12itSzkfobISbviHIK5sehysaPsdxIMH/Y5l0tICGag202l?=
 =?iso-8859-1?Q?UugMbEd61YhWz3JSistKmbrFOWCY1XNs4w1IikBaEpPRuCT/F62qdJqus5?=
 =?iso-8859-1?Q?0eRl15FKu+nWKs5qyJ2aMJJA5VpeQ+VvjQtGaf1zemCGdetG3OZq+8AVSS?=
 =?iso-8859-1?Q?WlEsU1mzU2gwJgPaM5wNsK873ZailmKKWh0CToZjFhSq25DvpCAHlNZA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d60144-98fb-4891-596b-08dd6d873f7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 23:29:40.9039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6KcFT3Lakdx8zSNVifqTtn87SO4qYFTjpMDlg+DaD1u6gDVq+fGSyrugUygQG7vrJov99h+2oRDte6AOpfUeJ9+01N3K0yY6SA9Sq6hkpkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8198


Hi Stefano,

Stefano Stabellini <stefano.stabellini@amd.com> writes:

> When booting from U-Boot bootefi, there can be a high number of
> neighboring RAM banks. See for example:
>
> (XEN) RAM: 0000000000000000 - 0000000000bfffff
> (XEN) RAM: 0000000000c00000 - 0000000000c00fff
> (XEN) RAM: 0000000000c01000 - 0000000000dfffff
> (XEN) RAM: 0000000000e00000 - 000000000279dfff
> (XEN) RAM: 000000000279e000 - 00000000029fffff
> (XEN) RAM: 0000000002a00000 - 0000000008379fff
> (XEN) RAM: 000000000837a000 - 00000000083fffff
> (XEN) RAM: 0000000008400000 - 0000000008518fff
> (XEN) RAM: 0000000008519000 - 00000000085fffff
> (XEN) RAM: 0000000008600000 - 0000000008613fff
> (XEN) RAM: 0000000008614000 - 00000000097fffff
> (XEN) RAM: 0000000009800000 - 00000000098a7fff
> (XEN) RAM: 00000000098a8000 - 0000000009dfffff
> (XEN) RAM: 0000000009e00000 - 0000000009ea7fff
> (XEN) RAM: 0000000009ea8000 - 000000001fffffff
> (XEN) RAM: 0000000020000000 - 000000002007ffff
> (XEN) RAM: 0000000020080000 - 0000000077b17fff
> (XEN) RAM: 0000000077b19000 - 0000000077b2bfff
> (XEN) RAM: 0000000077b2c000 - 0000000077c8dfff
> (XEN) RAM: 0000000077c8e000 - 0000000077c91fff
> (XEN) RAM: 0000000077ca7000 - 0000000077caafff
> (XEN) RAM: 0000000077cac000 - 0000000077caefff
> (XEN) RAM: 0000000077cd0000 - 0000000077cd2fff
> (XEN) RAM: 0000000077cd4000 - 0000000077cd7fff
> (XEN) RAM: 0000000077cd8000 - 000000007bd07fff
> (XEN) RAM: 000000007bd09000 - 000000007fd5ffff
> (XEN) RAM: 000000007fd70000 - 000000007fefffff
> (XEN) RAM: 0000000800000000 - 000000087fffffff
>
> Xen does not currently support boot modules that span multiple banks: at
> least one of the regions get freed twice. The first time from
> setup_mm->populate_boot_allocator, then again from
> discard_initial_modules->fw_unreserved_regions. With a high number of
> banks, it can be difficult to arrange the boot modules in a way that
> avoids spanning across multiple banks.
>
> This small patch merges neighboring regions, to make dealing with them
> more efficient, and to make it easier to load boot modules.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v2:
> - remove unneeded check for duplicates
> - unsigned int instead of int
> - add parenthesis
> ---
>  xen/arch/arm/efi/efi-boot.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index a80a5a7ab3..8b8ef5dcfb 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -163,6 +163,16 @@ static bool __init meminfo_add_bank(struct membanks =
*mem,
>      struct membank *bank;
>      paddr_t start =3D desc->PhysicalStart;
>      paddr_t size =3D desc->NumberOfPages * EFI_PAGE_SIZE;
> +    unsigned int j;
> +
> +    for ( j =3D 0; j < mem->nr_banks; j++ )
> +    {
> +        if ( (mem->bank[j].start + mem->bank[j].size) =3D=3D start )
> +        {
> +            mem->bank[j].size +=3D size;
> +            return true;
> +        }
> +    }
> =20
>      if ( mem->nr_banks >=3D mem->max_banks )
>          return false;

It didn't got into diff context, but there is this check below:

#ifdef CONFIG_ACPI
    if ( check_reserved_regions_overlap(start, size, false) )
        return false;
#endif

Your patch will skip it.


--=20
WBR, Volodymyr=

