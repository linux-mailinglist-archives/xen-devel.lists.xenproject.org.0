Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6E7B374E2
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 00:30:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095258.1450336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur2Bb-0005oo-R5; Tue, 26 Aug 2025 22:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095258.1450336; Tue, 26 Aug 2025 22:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur2Bb-0005me-OO; Tue, 26 Aug 2025 22:30:39 +0000
Received: by outflank-mailman (input) for mailman id 1095258;
 Tue, 26 Aug 2025 22:30:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNE8=3G=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ur2Bb-0005mY-51
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 22:30:39 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a1dacfc-82cc-11f0-a32c-13f23c93f187;
 Wed, 27 Aug 2025 00:30:38 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by GV2PR03MB9521.eurprd03.prod.outlook.com
 (2603:10a6:150:d3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Tue, 26 Aug
 2025 22:30:35 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 22:30:35 +0000
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
X-Inumbo-ID: 4a1dacfc-82cc-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbZEW2mkBXDx3iQ2HnDOt1TZIufq28oZ9mQ6xSIhwF2oQ7sIm/lnT2zUEv2HiTdTN/dH3iyT8w54wADOAxI5VOSvGc0guQJF3K4IPIADqCv44h2dstQpysjFs7zHPk+wzEyFqGs45p59jiLaIppZf0v5XmqIqtd9bCtAIWE4LDoPOu67ZbFzj4UFIzyb0W+28fjzdZwdNvxntYTckk23O2G7ZvkS1PRy2dMv5z6/96LDPH917JpXOyrhXsuK+H0MbonaYDj93OSg+HqH/ZtynYQRgirH/162gkcpem3yxXnsWSkD3+tOi5uHcCiWcFpCFl+ujlOz6FJFduLPmXTKbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5aEdTGeTF2UQfLvyJ76QgFfbnTA5M0yROd91j/48qI=;
 b=ciYU2uhn+CJ3Atjc3902y40KlAwEwGYUnrMSmrN0BZfGC389Rqu9FDVHnCCPpmb3lKvcI7KQrdIltC8JAAGXdu+ttFtFMssS8L6pmVHJSnln7/uspOBVovAL2tyaehAkTpegFuRekHdZ8C1Zf/xq3Z5fOAMbaUNjJcAa04LEW4uainvtsbpLRGiLGOm/4wyM3q/9kpUg0ixV1pAfEpBZB2p2XTwk6B3sVKUxrHSS2lvEAgesHY1PT2w3FtoniW6UueNKEhqtD7abfIOtJbfLn8wzOjreClJMCkD/Uy3dbwsGAfHndgDg/OTqLaanF9vr10zE7YvhnCX1T+iQ2JOIyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5aEdTGeTF2UQfLvyJ76QgFfbnTA5M0yROd91j/48qI=;
 b=D+COTmD+52k+r48/MIiVeMfeYnWqQ0scGOyJ7Ive2oovpSwLdDg76Gwf9Y901YoBcMWrC2oOwK5NqnMbw531w+ZrOREJojpMs/aX5B1YkB1VIDUhGZydlPtdQXXLmP8J/0I0ndPsjPpyCbBC/1+qx2ezNe/INsO5x85SvzBGnoRCrFB5LLtMcfMfL/dpQDlqRHirFP7ou32LpJYpFStXgBUdMOCCBXvz0xm3OxiWQZjE6NW7R6nFdyOVfy74Lr5qQVSmR0YMJDLbMC07/x68MzqE+60Gr9dy8Y+QQm9ziWgfKcATqtTYCC/0+ML7dJUHEtjYrQ5bofnRu9YID4MV5w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 06/11] xen/arm/irq: allow eSPI processing in the do_IRQ
 function
Thread-Topic: [PATCH v3 06/11] xen/arm/irq: allow eSPI processing in the
 do_IRQ function
Thread-Index: AQHcFpJ/78TDbVIRnkOE9iNbqduJVA==
Date: Tue, 26 Aug 2025 22:30:35 +0000
Message-ID: <87ldn54sxh.fsf@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
	<c977f6c0746d4461a804ba2e2ca80159190923ab.1756216943.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <c977f6c0746d4461a804ba2e2ca80159190923ab.1756216943.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Tue, 26 Aug 2025 14:05:37 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|GV2PR03MB9521:EE_
x-ms-office365-filtering-correlation-id: 4a9179e9-ae8a-4db6-56c4-08dde4f02ce1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?uK8CLGqycmhzY6OBDD0yU3q4xDvNKFx24p+Z/X5awuRY2/06AOZEf62ATo?=
 =?iso-8859-1?Q?I+D2S3pH1gh9oex429fWvP0GNNKKoINQsYk220mte7KO7ypXX0gBfqpYSa?=
 =?iso-8859-1?Q?/ZMW4lPz/IppqKhwg9HBzszImdEbBQa2UWfUJ5BWCax+otpvgXbhSARtLE?=
 =?iso-8859-1?Q?Y2AwV8xJwq1ikLAjYmicbr14UDhtOtcjVfsVLn4MZC5fGsIOSwPtOayZbY?=
 =?iso-8859-1?Q?NkbIXaUCJJk5ESsJDKGOaQEoOmaT/xilpGUwYFTMoV7UeSmslSI8XQKQnt?=
 =?iso-8859-1?Q?E0ZLQ/+TP243Tapw/hQonAraJj3C0vsE95zg7Nm43oozRNmc3N+UoaTRan?=
 =?iso-8859-1?Q?u2ngllXszMwALs1a++L4ao4GkmMQmnqN3GWSx5Cqaly9AQG+mY8DrRSX/t?=
 =?iso-8859-1?Q?kf1U8yA28tgv3I4UMqILKzKHCJ4bKs8lz2DLPfoWWqXNCAChAQgHDs4aMi?=
 =?iso-8859-1?Q?/2Whv8GKSl1CnJIR9madVvKmrJRHIvIt02vplWkd6GG68b/XjSYBQYlG/r?=
 =?iso-8859-1?Q?ZA4KMUCTXJb+sVF5Uxjlu8eJjIVyUOrfWwpDxjWX/jf1aGu0M9DeY9tJ/6?=
 =?iso-8859-1?Q?ENZUpnd6Ddi/scZk281dKLbkSNVqtkqW2TMoHr4thi3z+Ow4L7SK50GEvd?=
 =?iso-8859-1?Q?vfhmfLS/YG2ioAq6d36HLmA81lZx3sespl7wwW10DZp9w76GHNCKy+Vvz1?=
 =?iso-8859-1?Q?aTh2Bh0xD45yAZ6atvWXMNZnVMTJ74qBD4v6lecfFH5Mgx8Tcv5Ey4FV/v?=
 =?iso-8859-1?Q?gnuJFI/r/NUvPM542K4RWc7ohHbqzY7yIKZuxypBH0dv6Is/QZA/uw+b+y?=
 =?iso-8859-1?Q?7YdL1WzCo0TELM6HYbfdjrMH75NX+E/47jrHu0dZXXbA8LQZS8+56I7Mrp?=
 =?iso-8859-1?Q?sXgFT4cXX0Nu5P5LPSbXmI2LuxzEZcAvf/LHt3is+xwoJeJpRDlLVAV6cH?=
 =?iso-8859-1?Q?gtb6mQl15joNa+iMSMbac9vGn4+ocF9HIrXCvNEcxFKRvGPVIEuYtBgua5?=
 =?iso-8859-1?Q?myCRZkpAcybGYQeATH9rWGvjONx9YdYW8EQ/1bMx6YWbGzGnXYOrH5M7Fz?=
 =?iso-8859-1?Q?M9jAa0h7kxYw7TGDEvnnaWbWdDCAvz63G/QBCIGzFMYDigqPMCzXwpgBRX?=
 =?iso-8859-1?Q?GtsciC2KNL7JKq6VOQ/YslIoyTjagMn2BpBtDFSN2E1Y721Wvk2l1GhM1E?=
 =?iso-8859-1?Q?jGUtv0s+z5szdbmi6XyLiqB54m9eGhZVNL58whQ2HSiIy7yrW0rj8EtKf6?=
 =?iso-8859-1?Q?ChcncuJLjA3qV8DniiMOWbc8lXzAT01HaKi9qEvQAiOIgv5eVmDVzGYvWW?=
 =?iso-8859-1?Q?RMXGvgTVkmkmH4Nh3WZz68rmFhL5yDLGbbli4htODnzeNzxWVDvIj5u6JZ?=
 =?iso-8859-1?Q?kb7HB/5eWuPWv7g0UP7GJIQsxkoDy5FbVn/AUGWPVIuIRUpkij5JYTFEBj?=
 =?iso-8859-1?Q?ie+nAqbl4LVNeSJ5CsCPd64NPel2q6HlimxEMlK3bBfVz2+bqp2b66sGxe?=
 =?iso-8859-1?Q?jG9r/e/er0Giqdifr5UBaZectT0pEYAQBrWL4fLXgZow=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5JXmu/nSPn6b/EMNdpj2XtLBHmDNmXnpXbmjM7wEzhtWuRA+Y7t3fQ9oaA?=
 =?iso-8859-1?Q?x//5flUTs6tk5u/kRLv3CjMezgp+4N03yC+lgiT+A6ZG/NlQ8f3VouD19d?=
 =?iso-8859-1?Q?On8CzVbrqxNleaO2Z+Z6t4L88VxmZdN4n3zrkHuQCe9ASd58B9sF2CY/6z?=
 =?iso-8859-1?Q?gOLr9cn/N5dHIRFuKTs9qADZOs+uObm+g5BYx72Dlyb/Op59ZZ6uxYL4pe?=
 =?iso-8859-1?Q?v/gIWbbnkL2h7xemAqxIdriQ+Lvp5vOWYrUQ1G3C03lGAEm64sv9bEtHJh?=
 =?iso-8859-1?Q?R6r9NdKdacbmVgjplHAh9BkpnaUciLsYoK4wqnIYOvvuChTOWmz6/yPP5F?=
 =?iso-8859-1?Q?t6V3C1JHw7Ek4/yGgBaCFtioVbaq1KoqQnITI3RGs0IUKvB1p4OlQk7FFo?=
 =?iso-8859-1?Q?zNi6mrcl0/dD6byrhuyX9eKx3sHC74xW+fUn6YWFhTDlkstdpTJXGOSHOw?=
 =?iso-8859-1?Q?CMjbH414YRou2a2oQazDZueFW5aTHPPuIzpCs+2fT+M6CtUNsFP7+GTkmm?=
 =?iso-8859-1?Q?lVBPFF0Zz6POwRfXy1XKA9srHuFjheDoKGIp/nPV9rePvZCWfdhYM+10BU?=
 =?iso-8859-1?Q?AlAbCgQ9b6S1PyuFhYuZz8uH/oOdreLWpjzdgNqdE5xUom0nvSss4WHJKz?=
 =?iso-8859-1?Q?F+XrUesyz7UxBsE+DWvCZmySPRv0WJSPGw3GpsQihdICzfiQygzwmyawzB?=
 =?iso-8859-1?Q?Ocb7NUhplTWPeW3/dwo2sj1Kl3G65kQd1+vorSFPvjUZa0wh6oAc+UozTe?=
 =?iso-8859-1?Q?XxJeY71tSKfjeVIbb4TMS+WQpOsvBsrEFuXARuTsTnUDw86Yq3TihXobtx?=
 =?iso-8859-1?Q?8Wx/1mSwluB9ZD//aMPThwY5bfPfTC0YnqhsvwyXfvqadFhSgOWGBF6yiU?=
 =?iso-8859-1?Q?65RUxGtmAdc0pebCcdZbOc8BbEvqBS9ADpo4mDYVESADTBYZ9koEXjTKrq?=
 =?iso-8859-1?Q?FOET8B0ON8HwJo/sk48zxMtapfMuOyheJTkFzt4BaqZ+2kmqxrN4dgVCYv?=
 =?iso-8859-1?Q?pW6/CyJxWr2mGuAxeJj3mpCxEYGmWcW++mRCH+uAdPsxpMzGQb9NEoHVeb?=
 =?iso-8859-1?Q?Gk7rmkAhUPGMHI1Zup2R2vFj1fjNF7gP5+a9JJOF61+N3R1iRL4dh5k+Vc?=
 =?iso-8859-1?Q?PcDZhPizDuNQV9Lut5bsvmf2aDRXVhyxY4Cjkn1IMNtwRoEQfhVoGTmnI2?=
 =?iso-8859-1?Q?+37iFVwlc51ONeSE71oEmSTRutVwyB86iaen5SIuNRfm69WiZO9eHZGum1?=
 =?iso-8859-1?Q?oYtBizl45d4HCOgPKHlsvTlYcf46VMTgKNfCdXKc455ISt6lo0hnCIMXZg?=
 =?iso-8859-1?Q?+bA3G4J72ukunwWERlyuaAkzwa1CL2vGKUdF7Z/2ZkTQSRfGqiKEnXMl1S?=
 =?iso-8859-1?Q?wu92BaamUwzmY/lLtujfK20QgPk7Ost2cUMFFCQkywRheMvxsKpc2/hizW?=
 =?iso-8859-1?Q?aVjMW3Gtj1lUG7H4U+mYpte4Rj7AtPfanPLj4HOEfWFrWp1v+QLuCvthQS?=
 =?iso-8859-1?Q?l9ghWTckgd+N9s54lHjcR6F8MNbtDgbzN1K2XsFgKPVvHvxGaLigo2jUV3?=
 =?iso-8859-1?Q?jTewMFBozGoHSwi5oEqG/5T/CcbFhrYJb9wldvtpNiZZrisKnWKJH6LErs?=
 =?iso-8859-1?Q?99jCUO4PiteDrt3iqSWwAiUGv9xu9wFj8o7GDOv/IJ+LiqTM35Op4HQg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9179e9-ae8a-4db6-56c4-08dde4f02ce1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 22:30:35.2600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UTYPQ5FaZoNuCZsRBvKBMgk19EeBBOHu1gWc++8b90eXUvhULV06pkMuZe00mbd/vE0Yp5dV4eZwKMvA9Lf2eBVB9z/q/gtmDoc6SOvRD4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9521


Hi,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> The do_IRQ() function is the main handler for processing IRQs.

but you are making change to gic_interrupt() function... I think you
need to update the commit message and subject.

> Currently, due to restrictive checks, it does not process interrupt
> numbers greater than 1024. This patch updates the condition to allow

But check reads "irq < 1020"...

> the handling of interrupts from the eSPI range.
>

With commit message fixed:

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>
> ---
> Changes in V2:
> - no changes
>
> Changes in V3:
> - no changes
> ---
>  xen/arch/arm/gic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index b88237ccda..634b77c987 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -341,7 +341,7 @@ void gic_interrupt(struct cpu_user_regs *regs, int is=
_fiq)
>          /* Reading IRQ will ACK it */
>          irq =3D gic_hw_ops->read_irq();
> =20
> -        if ( likely(irq >=3D GIC_SGI_STATIC_MAX && irq < 1020) )
> +        if ( likely(irq >=3D GIC_SGI_STATIC_MAX && irq < 1020) || is_esp=
i(irq) )
>          {
>              isb();
>              do_IRQ(regs, irq, is_fiq);

--=20
WBR, Volodymyr=

