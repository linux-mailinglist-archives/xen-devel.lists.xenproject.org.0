Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B73C8A0603E
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:36:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867630.1279196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVY6L-0006Sp-Fa; Wed, 08 Jan 2025 15:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867630.1279196; Wed, 08 Jan 2025 15:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVY6L-0006Pl-Cp; Wed, 08 Jan 2025 15:36:09 +0000
Received: by outflank-mailman (input) for mailman id 867630;
 Wed, 08 Jan 2025 15:36:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HByp=UA=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tVY6J-0006Pc-Sj
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:36:08 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 469c8771-cdd6-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 16:36:06 +0100 (CET)
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB4PR08MB8174.eurprd08.prod.outlook.com (2603:10a6:10:382::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 15:36:00 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 15:36:00 +0000
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
X-Inumbo-ID: 469c8771-cdd6-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZqKGN0ugm3z7ag6zXi2Y0uMtApMd+lqgOw/UyGX5Nkgc/AkI1joZ8/jM9Pu20xu1qjeXpzBYwGVMjfRiOUZWrNpQd6KJgaw3KDY6dHzZlDdkUYVqo+rW/B7Xn+S+SbgFCDYbuHRykcxKO6OZaqQc9TrAPdunMzecoO99mSVsUAMLdlxQdkr+FRXTBqCZM51cITFmKMoMmh1qnQQFFmC2I58UCtgsloK3e3ulLknG0voVqhDydKXKiHKHepKTz1KHEJbpX5C1ePNs1HSkk5fK1T+1+sT7v7cdPVeqWmstub61xIo6CczMZDisgDw/tdwlQuQJKvt87ATcsZBoRV2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hD8xIYc6VVS824h8d5KufrDDBbP5el6Akssegh8XgI=;
 b=dW2Cv5JEQlhK75esnH1QGhx79p0aCoybKlciQLM4gacIX/VASxRhjxcq4Bi5B05ixMVS75Cft8ffVwLzeG/nS+FXSr+30E/IAbZAfq+bCzhQ+p36mZIHUo+TzcAwVTP2vlC3czKguRjMcy323t9XPHveSzb7jA+nb/vx09yCW9N5HqqfuvAKim2lp7jv95u6W76JrQ8TSejaL2J9yuYH/wPIvQ2+3/rnqQP6yb9V2iZ4XTTz1oYg3ycm4o0bhQfXcgSB3Z51pumTYoYk9NQjLi7yOztgV8gxTY/SdiuN/WdF7FzXAcJdd+pyVHthdzn8Q8r8Dj3YwInZPhUmiUK53g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hD8xIYc6VVS824h8d5KufrDDBbP5el6Akssegh8XgI=;
 b=SaelAuCBdlbQ7tRU9N2A8aEbO/xdUIGZz6QE8MvfL9OWGf182sivsnqKZ/U4vEiaiJJDmlSjlIRRAHzRg5LNqp5j9t/dqFqv9NTABCo8ygP2fwQ4SRNa6nXDgGI8CrYqc0QmyuTXSwAmwJBNvaBMh2mNpWs7cKeKrj9gKpDt++U=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stewart Hildebrand <Stewart.Hildebrand@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] xen/arm: ffa: fix build with clang
Thread-Topic: [PATCH] xen/arm: ffa: fix build with clang
Thread-Index: AQHbYeFGu37kkF0Uuk6Sa5TIC8NMALMNAjoA
Date: Wed, 8 Jan 2025 15:36:00 +0000
Message-ID: <842B5D1B-1EF9-4E2B-9F9C-800A8F3269CC@arm.com>
References: <20250108152317.335441-1-stewart.hildebrand@amd.com>
In-Reply-To: <20250108152317.335441-1-stewart.hildebrand@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR08MB6588:EE_|DB4PR08MB8174:EE_
x-ms-office365-filtering-correlation-id: a1654f7a-5159-4a2c-38be-08dd2ffa277f
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?WRoY8floB53zxQvSGfKHI56XyguWStB6we7BWfecYWFlj7+iiiVDvzzX/9DZ?=
 =?us-ascii?Q?yj8y8yxNe6c2hQJybYMCBlhob9XhRmfLttxxgtMUNTINfz4GP1ozDUyaSUQN?=
 =?us-ascii?Q?8a1wOx9gyQNjTdJ5l9jC+4Ip9r7g4fbREmSXWs2ufTtP67q+8IizdAAkTkxD?=
 =?us-ascii?Q?GQmfHTtEFPG8ni3hp+SbubcR1KAbjq9jyaVlJKNPmV5v8R1gKs6QBYc5+cLD?=
 =?us-ascii?Q?QdKD2JcRUMeawh4BtJPu87V7Ujz4+a+5oBX2lV5xXpLbo3pZUKJFALKeqWHm?=
 =?us-ascii?Q?hbh6VA4rbYfifmnbSsoD1ssB8PdhQHb+OdH4YOgHZh6ZjVH63JGEGUDFCblI?=
 =?us-ascii?Q?t8EgldFsr1hOXP7AipmSiU+9csxil6M7KGCNTf8HyYIH+tbKUqXiZD+wzv38?=
 =?us-ascii?Q?h0tUWZcvE+hx6WiaUf00IcYtoc0dFYjU/AtCt7TsBaH9Dy3WPQT5cA9vxcZu?=
 =?us-ascii?Q?NZWktYRHLrvCETKdwsLQ3jqLVYIOmqHHrQT+WXnyeAx1eEMxwTM5NDxhtCVj?=
 =?us-ascii?Q?eC6VPsZugf7VtLOViRA5kCCKHnX9En4zts78g1QS3EEGWwJEcmx7C4toz7Ab?=
 =?us-ascii?Q?fYC417uQ2ZXRMrO+nkLjs1CitPUbeNhknVy/rs3dIW4xMkHpG7jESPdB8M8y?=
 =?us-ascii?Q?HQhCdxERkZGtFmVmNDEbMIfrXZzuKmIU98igkqrH3i7QDWl4Y3eDiA79ITBU?=
 =?us-ascii?Q?PuykEYGc5IK+Xfh25fUz+7iuu1CZ5GuCqFneFADmH6hX27/U+ahFhbxvuKDR?=
 =?us-ascii?Q?M/MrRty5VyScdz7XCvMR7mInoTInlbSl6wkQWrizHN8AXIYLWZE7B1NyFa/q?=
 =?us-ascii?Q?Z8pAyAconB8hn6sm4skPIRbyZC4OLiRW6IS9FDdLhQRMgjTLqgY5WXu/Mbge?=
 =?us-ascii?Q?u74eJ10kuQi8q3JTeVfugR69pBBofE1FDCULUVmQx+2upWq+J90PCCQU+tCa?=
 =?us-ascii?Q?mMabOJdUmgI9lFAQ3ehcQ2xopKy3Z5Ub6LN5PytWho6ZDVZ52pcM8i61/3E+?=
 =?us-ascii?Q?qe63MKm9+80yBK44tmUgEGEhIzH2ee24vbWcEs5XYzbdPaGZ5f5KhkZD1izF?=
 =?us-ascii?Q?vCg+aEuh2LP7KuMJ/poBpii33PbI2KhfAUbc4sdDs14ffkn1R0ulExVohX8P?=
 =?us-ascii?Q?alb7yLv2IryfQejNxzxEVrEbWP0PPATYaYEddyXVEX94oPHoVHvORSp+nYvo?=
 =?us-ascii?Q?L9Q7qKVeksjwr7W1yNPmpCmkg1Wpy/OTq7wmvP871HfMYrrqcy6wPigFNwi/?=
 =?us-ascii?Q?/BOYtqVjleBYgizR4GYYtz+D5R7wV56UxXBlZrYT3khvUAWwHwuMJA79owZK?=
 =?us-ascii?Q?HwVd8KGTYiL9kpcxG5l5mKNgpg4Ybo6sEZxOZVIWstHxq6B63WVXTtmmXoB2?=
 =?us-ascii?Q?QCNKMXBygk7knIb7K3BrH5i8hCE9+n+c4On2JTkK0hpGUEfpBLHHtCNQ/yIn?=
 =?us-ascii?Q?IYXaq//fleWYAasRnJX6TNAyOUiM1RXR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sMu+WaYevGOZjfVvivzJsZd0qBsmc28jUSotZZFfj58faUpqZLe/7hiNvhw0?=
 =?us-ascii?Q?YArUitpm5RtTq8sM6DIbsNawIdxsxhx8sfcwp5e5AtrllamtYjSA/oybg0V6?=
 =?us-ascii?Q?QpkmNCHnIszFZ7BbLGONTJz5Uw0385wJsUYgPeE9x0SB+DzqTi+64Dk0N3S0?=
 =?us-ascii?Q?ejUsfQm6r/Zc8nNrXuqFAKJj/7weGfFO+Scqr0lYGnpDQ4xT4Z5wuCb+NOHM?=
 =?us-ascii?Q?l+ymACKPDZQKsUwoiUXVO6EbnTXSTwDaaeKp+P/O5OvsC4ejEbC9bLhyYzPd?=
 =?us-ascii?Q?cjCcdcGW23IAJ4ZEZhKKe3151kx59Sxpen0EkmX1WmY9mm7OU5doULmzXn0V?=
 =?us-ascii?Q?FHeSPMULNtgl/QT7JYIwlhOTv7XiPQ6WxxHbedHmAxhP2rL2HUaeLsv1p2Fz?=
 =?us-ascii?Q?gAD27U6HgNRiFCC/dvHpj9sRI/BNQ3pTiWYHbwJ46qMIgVVd5ONdfJcwoRWF?=
 =?us-ascii?Q?atBp2M90Jvq7Ccjo6B2z29GNN6B2rFOVGsD+1IH6glox+jmPMG3X4SzZ2LTT?=
 =?us-ascii?Q?SDmhur3+cNLvrqvsmXYxiVY8EaJbzGDR6DlsLfKcLbP6adteLQskmzfjsT+w?=
 =?us-ascii?Q?jyBVsuttCTXottcprYzlbpSe1acLA61LejbIES8BIIkH8prNibLZf4M6n3uo?=
 =?us-ascii?Q?sqTgDJT372fctkc8V5zUUvd2t/V55vfVqK1MBbewGHJhac84YHQatxI05UOI?=
 =?us-ascii?Q?HPl3cCRZM6A5EUc0a/Xg0L17lx9OdJx+mSr09onbTPVnPb3rRxIow8l6OvBd?=
 =?us-ascii?Q?AHUoZfzE23dTeMgr/0n7oQKwhjeGr0SMqSNvPdxdmcd5qtSt+54q7k7ZYwcm?=
 =?us-ascii?Q?E7GGvN+0Uj7e/B7krCaHzYkCJ1g6P7qp7wVCASxwcC2+/YdVe6DqRLn+Jvnj?=
 =?us-ascii?Q?L4AjtN7T9VJsY99dLqpQvWR0/KhAx2LoQA2iGx6w0Pv+mKurq/ybW+t2OZPz?=
 =?us-ascii?Q?cnIKJJ7LzxjmMM4qJQtC39BrunNDWNzB8OBeC+0uTiCANvlJRDCr6M6W64p9?=
 =?us-ascii?Q?H3peukSwQ2dv9mnwxIaGAaNHMqbVepgu2kdBItAS/WRTFB2Vs7cQqZPKFSmZ?=
 =?us-ascii?Q?3vWRd+cmcTcwyaJexGE6C/b6n2DyMR4126f2DYB6Aa7BmjGrPSdSOC8FBMhF?=
 =?us-ascii?Q?xQ7ZaJIo4+EBYr4Kbj1CLO/l9nCS1OgGleJLS6jt7F7N0uiOMuxLg9d8BK8G?=
 =?us-ascii?Q?tDmWO4DOZkzUalzNuAvbY7mTFIbK9c8CIHK/wnaQmnPnouqwak/0d4HpaNnO?=
 =?us-ascii?Q?w4KK1zSFcansSsMOSqrcUXBQaHIb7lYEu1OCmbg1vZE/jwqD5CYPVWmF9ZS5?=
 =?us-ascii?Q?c1QaoZ2iAfn/PShchl/Sk+h+8ybic0Y19Y1CSuOksqcbBAKjwllPHzBGY2II?=
 =?us-ascii?Q?FlualBHSZORuOcIvNP15NJujBmOAWEkzokI/wKSQtQADspMnyDlqlLxIbajU?=
 =?us-ascii?Q?ud0g9psuZnlx7+kWPvViFJdP93wXAO11FOD6WoJqlpI4XtyS2Kl0aC6m3LjT?=
 =?us-ascii?Q?dyT42QrV41XrP4pKF88OQBZMX3hfCU+zYdm/qaawYPFJOjtwDp5i/QXc9hf4?=
 =?us-ascii?Q?CLKnnEo3NaiOZHUaEQKamHsJrIeOgw72u5W8Mzi8U9T7laZzw3FW3+hDI6ZP?=
 =?us-ascii?Q?zg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C70909D4879E264E8B2BFE220C32F839@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1654f7a-5159-4a2c-38be-08dd2ffa277f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 15:36:00.7281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: noHqKtDNMMnddq/GBfKENYmtrhn581k1MBwoXNSp/xAaS0+VKrDZODRRttwnoIIgxLTVQanYPLg+Dkno+ttcyFEHHFhKdfWEK6sDDACrW3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8174

Hi Stewart,

Thanks a lot for the finding and the fix :-)

> On 8 Jan 2025, at 16:23, Stewart Hildebrand <Stewart.Hildebrand@amd.com> =
wrote:
>=20
> Clang 16 reports:
>=20
> In file included from arch/arm/tee/ffa.c:72:
> arch/arm/tee/ffa_private.h:329:17: error: 'used' attribute ignored on a n=
on-definition declaration [-Werror,-Wignored-attributes]
> extern uint32_t __ro_after_init ffa_fw_version;
>                ^
>=20
> Remove the attribute from the header to resolve this. The attribute in
> ffa.c is the one the matters anyway.
>=20
> Fixes: 2f9f240a5e87 ("xen/arm: ffa: Fine granular call support")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


> ---
> It appears the variable ffa_fw_version is only used in ffa.c. Was there
> any rationale for exporting the symbol in 2f9f240a5e87 ("xen/arm: ffa:
> Fine granular call support")? If not, perhaps we ought to make it static
> again and remove the declaration in the header.
> ---
> xen/arch/arm/tee/ffa_private.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index d441c0ca5598..05368d5a88d3 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -326,7 +326,7 @@ extern void *ffa_rx;
> extern void *ffa_tx;
> extern spinlock_t ffa_rx_buffer_lock;
> extern spinlock_t ffa_tx_buffer_lock;
> -extern uint32_t __ro_after_init ffa_fw_version;
> +extern uint32_t ffa_fw_version;
> extern DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
>=20
> bool ffa_shm_domain_destroy(struct domain *d);
>=20
> base-commit: 70f5a875becc9444a959830b10a361982c31a366
> --=20
> 2.47.1
>=20


