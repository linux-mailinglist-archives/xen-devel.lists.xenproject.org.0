Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E69B374EE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 00:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095272.1450347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur2Lk-0007fh-TC; Tue, 26 Aug 2025 22:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095272.1450347; Tue, 26 Aug 2025 22:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur2Lk-0007cZ-Pu; Tue, 26 Aug 2025 22:41:08 +0000
Received: by outflank-mailman (input) for mailman id 1095272;
 Tue, 26 Aug 2025 22:41:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNE8=3G=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ur2Lj-0007cN-Hk
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 22:41:07 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be470914-82cd-11f0-b898-0df219b8e170;
 Wed, 27 Aug 2025 00:41:02 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS4PR03MB8206.eurprd03.prod.outlook.com
 (2603:10a6:20b:4f9::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Tue, 26 Aug
 2025 22:40:59 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 22:40:59 +0000
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
X-Inumbo-ID: be470914-82cd-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFN2QbJ4X76NMzw458roWY7qy6qRXsDJ2uotctHGbXWlpj6806PeJPMBqwIjpEAA23Q1kWOGq2GSK5kxDrymJSdx7QbifREseeyCvmWLKYIeoxgzeMvFBfR+WNAqgbsSZebsRM8MebK2wVnCZQqXuvmmJEgS/bufzcZMhmp2CdZEhsBe/Hnc5D9BefBpfKnofcGD41/bANdIsCFUnZsePwC0vzPkb9DtQwuIl8ZcJhD856ifRdKlufOVhp+wTirHjLcr5BL21fSryIy+tZ9Yd7DNUJOlQWt9oDZxmlyPexdHXZo4bthEPS0rUFw8sVteAB3MsvSRuXespgWVLfj0VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRvfQ2XxoHuMc6Vi9GpuWqcpvYaSzVUYm+U34FwBgbs=;
 b=lmfosPIqphUG3vSUJKbd9FPsjsf5CZiCN2uz41i5KvukumyhGndoKQwjEsG9ZwO44B+tbrsv1EptVjt7Tsmsy6LfNLppJW8O7jO7t8W8TDFkwd4UZuBu1HvtIEm8YIRDdA2M4PJ9Q+elR0WdPfE4AOXXx6cD65WFguqzHLXZnkY1qheWeDaHbVdZ1AqdqWBC+BaJaVFxXtCtiPq9rHNVipBvKTybUNov0fA8wW0KSFnAchvqRnc9BJSAsEczDTvO4kFSbV6KLomE51VpNxKVLTvwPkqPKJzntHbphGweBRKtfSp4qJ9XKU+dHlcnYAvSkcD1x/QNFxYp0c7JPSvEuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRvfQ2XxoHuMc6Vi9GpuWqcpvYaSzVUYm+U34FwBgbs=;
 b=nIeEZt+XyYnukiwIKXCw5w/yBtcj9s04EQdGGpVVZpZaWr0Zv7KIKM1jdcVfnsYxFWLGT7bkeBJn/tge2Smxi5BXHzGUQ1BgnQ1A6aqZ1d9eN4ZcUXbaj2HowE3LDXFAbtvXnRVs6k1DwGjonfeNbFDg6XJsP2QIwyx7D7jR7gjp0t+x7q6k3nGVMwH1JdaCIUQXGav1fExLf0RGlqIQPfolC2oHhynHrhjwbCQmK4gMTPKcirJnPkBZ/zBe2Lx5GFdzqmdkCNm4571UHG7Il5BFKXOD5MwxoRIHTeBwFFr+90FJprzRkWU7HXYfV/egM+4NuP3M6d/so8hL7NWe0A==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 07/11] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Topic: [PATCH v3 07/11] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Index: AQHcFpKAYFxN4fU1Wk6sdm7zcMlbgA==
Date: Tue, 26 Aug 2025 22:40:59 +0000
Message-ID: <87frdd4sg5.fsf@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
	<20a8af6879ef06af92d3cd1e0519c406792ca088.1756216943.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <20a8af6879ef06af92d3cd1e0519c406792ca088.1756216943.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Tue, 26 Aug 2025 14:05:38 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS4PR03MB8206:EE_
x-ms-office365-filtering-correlation-id: 447d5042-e538-44a8-4668-08dde4f1a0ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/b3gkTXSsqlFiXcEGYT+L9rC8Cs3a1DBiO5m2MJH4XmZgGybzYIRiwSJEz?=
 =?iso-8859-1?Q?pY2E9x8ryQHYIu1T55rhST//TSjzVBAcAAh5VdHvGtjz8yEqtZUo99m3T/?=
 =?iso-8859-1?Q?2ed1WYXTZvIUeIbgejkwC5oyW1D0DXBIPBfh3XCZ5yqjnX3AD7Pso0Sf8f?=
 =?iso-8859-1?Q?lKKC7ALiOuavaZRXK0tR38beTH4fbXBpLV3w1yrj/hOaLao0BG3pKV60PI?=
 =?iso-8859-1?Q?jvOs5ScJ2PM6ACmD81EOkGVe0+wagqQEIJjT1xmNhkJJPtxQFT8xT64iM+?=
 =?iso-8859-1?Q?sorOn5wQOVddGmvgTYVKpcgMxQQaWPfla9HlnAE8F60wR9f9kpQM1YlzK0?=
 =?iso-8859-1?Q?lnxrCrMuROqkNWhbzgtUU1A18BkAPi5IAOfIXyFrjS+k2wElyiTDLbhXYu?=
 =?iso-8859-1?Q?AaWsLUwhWZNioSxZ3RsgbLoQvAOtwIdCtMaVYijS6vE0MrzrHpClu+5C60?=
 =?iso-8859-1?Q?iign4/JHEOjyZZ7scg468McyPQT1ZwUsB3YzYPjNBcaQUangZkeDAHVORY?=
 =?iso-8859-1?Q?LDxQY4/MI/FFhNFdurUNRNzUiydYb1i4pvpebQ6tNZbdS0WGTrSLWt3bsa?=
 =?iso-8859-1?Q?7VJaUkqVcLC1Q7cxl/N/Wa94Ig/qKqQXOf7sOG6FlJgjdnBwKhfG40MFb3?=
 =?iso-8859-1?Q?xQoZ4uYFgcnXEa/HHIbhEDzYc8t5bL4HRtIE6d77n3eCWhGJQGJdCEDNXB?=
 =?iso-8859-1?Q?dL8nCWWKrxm6LT9dRoLaXo1xDpSmag4/0mF3fICL2g0ZROOvFjU1K90a8z?=
 =?iso-8859-1?Q?uOcOFwDcqicSHE/H0/iPgcuXjNyAziViydPGYo24YhLzEyHbIjP28YjxzX?=
 =?iso-8859-1?Q?ixpwMMHekyI1zLM9EwBiDGfbV6zkY+DqjKuGWkm6cTLG//zcPRzdmol+/g?=
 =?iso-8859-1?Q?MCb2oZoXtUcuLJjQ9o5RfCgqjaa0njNyfACnW2ANelcJjbp1F8aW8sZ0CB?=
 =?iso-8859-1?Q?p7uWIHZEvYGgTG9/GXgYa3voaYIPcQqWmcZSedZxyADx8j4CFXvOYQNnEL?=
 =?iso-8859-1?Q?khCmIOA0/qVa56mvr45wjBaRCgjkftn4+NViNf/Q+ksAcDSgL8YAdd1ofB?=
 =?iso-8859-1?Q?NUZpUiV6K7jW2EqFXfj70kIpyC8MI3AWBfMCfNdRlib5qlauiWwkRg6sJM?=
 =?iso-8859-1?Q?xj7eFQkg9kZAYLwZ9rNtmzNC0uD6+5935SVwbE6C27l8QfExqxYI46/LPr?=
 =?iso-8859-1?Q?Ty1xWqf2KTtz5IODcu5IIiBa795XwylTf6yJmN5j9swvuJkoftiFmn4gRz?=
 =?iso-8859-1?Q?haZlCgGIt/GuERcL//hnRAj7Foy3fcvnPvVmi74kC28ZNzdtFqHvKfKgqC?=
 =?iso-8859-1?Q?JUYmHzDhQC6ezdaxq5kCIQcP8b6JsX4f7m/IBlfU1/hK0vSFfRuX3nS1wi?=
 =?iso-8859-1?Q?dn2saucDMPEp1592cqCQDeJ1p3feduB5V0kqTzmcspIMclWLTOy8CdDXtx?=
 =?iso-8859-1?Q?oUS8vYEF0sYteGgB8t3jg9EfEj78cZUCOifaWFNUfSIKIq/a9lYcxCm9ZY?=
 =?iso-8859-1?Q?6ZqMwG73+HWCXymCrZQYWlSc8rodoqh5Wd2CbtPIbQUA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?DvH0EaJmW6ech1wSDeByYkoYRzw5HkK7ByOph75tVT/YRZNWKpoQ5okKxy?=
 =?iso-8859-1?Q?gLqb8AEfF3SMKmFlAo2/ld+ygz1AHKLSiOB4sDp/4fymIt0xb0viEp60O9?=
 =?iso-8859-1?Q?zwTWuf9iypoTMWJI1w3hZHuqtXL5Y2FyGuiz4WZVjmnyp4JjzloJjpbWfl?=
 =?iso-8859-1?Q?R797AbUKRIcGwpCXhNc6CQ/yPGJ/cVveA29/v8hEbxP4iBd//6kxNwPHjL?=
 =?iso-8859-1?Q?DjIyIJA3NFoTcR+sNcsqdmyG6J5VwthlkxZEer57C+R5ztPLi96oHdUO8E?=
 =?iso-8859-1?Q?srkLwbqs2rrlk69mmRFepxlkk81LEZJnRXRnMRIdQURV29F4oUZvRFsCr0?=
 =?iso-8859-1?Q?LBmDUu8cZ2eEuvFYmN1R4pCYZbg76y6a3VYyDTPqN/8hhdRGX8pAbamilv?=
 =?iso-8859-1?Q?z2l6iOH4Xg4iiuoaIj7pbxew+8syqtTi/9CUhjaIXpTE4YVo1bbe2rE9nJ?=
 =?iso-8859-1?Q?gZV1GNUhqFzxpVhQVwdO1tkSiRv9el/gQtq15VdHATwxI2Wfh8T2oBfRzI?=
 =?iso-8859-1?Q?uTfmmckwrV0iJXr5RWXrUUU8FOAGGptX6fpGY3aCZjpO+9Z552oTDyUS7T?=
 =?iso-8859-1?Q?ehXCmOP4nGKy9GkAn3LUOKKfHtnNz++X40ucsuDnbgcEqZHJ+pxn8Lffzb?=
 =?iso-8859-1?Q?5WNnHpm2c23qpLo1WmwUgE/6z7JhtoOQ/VqDzJofnRZQuEJZBLASYiUjYY?=
 =?iso-8859-1?Q?a8UaFMBiMvAE8wQw6dDaJ/XOkm8D2laeHwi1rbuFhYk0OnncsQadH8lGtP?=
 =?iso-8859-1?Q?TL0vCpDFi+xOZdBgXvfCKy6yNmcTqQ8nzcXWk+VeaiX+568z5Y7BcSxpOr?=
 =?iso-8859-1?Q?yYLVK2Z2LcjdqCwfew6Clyatm/bjLAN7vfxJczuOKNojJmc/6WngPsjQcP?=
 =?iso-8859-1?Q?JjkKn8qM+NA+q7wwAEAOLr7agFhjxnbyrIU3T4St0fIME2Pci5OCRicD86?=
 =?iso-8859-1?Q?1l/qxa2QmNB2RK7oP7XiLTOCYApICMW3K/agMZalUwDNfRuMcCFiTZ58zj?=
 =?iso-8859-1?Q?FTspDWs7YtvTLLpLaszQR0Cm9WOuKaEpl3lT5Z4dp+FYQuCSZU+dGmcFrB?=
 =?iso-8859-1?Q?waN9xd2msjisFoaUj7WlKh048HifB4hhiw9YAn5ilHcyFIBxsFdTBd/C0G?=
 =?iso-8859-1?Q?jChXXZ12AoptP+FSPArO+WRw07xlRsMejmGp13nXCajXnl0nydwDt4+Aeo?=
 =?iso-8859-1?Q?5B4SmkBYPVacFa/LeJ/DwKYZKS+aIL1+ntZSUNOgyMBWsumZaKdPeUJZ/w?=
 =?iso-8859-1?Q?81IIc4cHruAsvYaOWdCpqmlBydvEffxrEi3mafyXORAG+pm6YOdXxDBBMn?=
 =?iso-8859-1?Q?XCQeH9pXOKv/pYDdhUh7NHYCf0JxnevRuLD0v/k6vRzkCPrwwufKmuylMT?=
 =?iso-8859-1?Q?gaMpAztWeQencx1PCbYZkKvAFPJfeFfaXu3wIm+lUKvVhIDdupI4ENikt1?=
 =?iso-8859-1?Q?Nyq+bFOQTcJY+LceYsvObygiCJyBQ2+RXq80CCZbkjpTUs5pd0lnYsvqco?=
 =?iso-8859-1?Q?HvbnJGPkNR5xdIKr0l4nX43Dwg8+JND2lTNsvXtXqLGZutwvx4+tuoP+J/?=
 =?iso-8859-1?Q?kIOnhPkb450lxLZTFSG9NzxpUpfFyiS5gpMA1bo6lB6NunnD/5RNFcTs7P?=
 =?iso-8859-1?Q?kyt/bvePilY1vl0sKOd4/XVQyXRTrv0XeOYbvrdKXD9TA8vXR9WEtMOw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 447d5042-e538-44a8-4668-08dde4f1a0ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 22:40:59.2341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f56MsRkoq8qiNc9DO37Xcjsl0xgSePHjonxSngO+5b8s9NIkesCtondu5EzQZByXb0c6aS3XOK/tr7lpifDOGWL8G21A/AWSo3/LrFlDfIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8206


Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> To properly deactivate guest interrupts and allow them to be retriggered
> after the initial trigger, the LR needs to be updated. The current
> implementation ignores interrupts outside the range specified by the mask
> 0x3FF, which only covers IRQ numbers up to 1023. To enable processing of
> eSPI interrupts, this patch updates the mask to 0x13FF.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

>
> ---
> Changes in V2:
> - remove unnecessary CONFIG_GICV3_ESPI ifdef guard
>
> Changes in V3:
> - no changes
> ---
>  xen/arch/arm/include/asm/gic_v3_defs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/includ=
e/asm/gic_v3_defs.h
> index d38a3d08c7..ca403131bd 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -207,7 +207,7 @@
>  #define ICH_LR_VIRTUAL_SHIFT         0
>  #define ICH_LR_CPUID_MASK            0x7
>  #define ICH_LR_CPUID_SHIFT           10
> -#define ICH_LR_PHYSICAL_MASK         0x3ff
> +#define ICH_LR_PHYSICAL_MASK         0x13ff
>  #define ICH_LR_PHYSICAL_SHIFT        32
>  #define ICH_LR_STATE_MASK            0x3
>  #define ICH_LR_STATE_SHIFT           62

--=20
WBR, Volodymyr=

