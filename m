Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6153AB38ED8
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 00:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097089.1451550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urP33-0001X6-NT; Wed, 27 Aug 2025 22:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097089.1451550; Wed, 27 Aug 2025 22:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urP33-0001UK-KQ; Wed, 27 Aug 2025 22:55:21 +0000
Received: by outflank-mailman (input) for mailman id 1097089;
 Wed, 27 Aug 2025 22:55:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSw+=3H=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1urP32-0001UE-7u
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 22:55:20 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e701ae88-8398-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 00:55:18 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by VI1PR03MB9965.eurprd03.prod.outlook.com
 (2603:10a6:800:1cb::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Wed, 27 Aug
 2025 22:55:15 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9073.016; Wed, 27 Aug 2025
 22:55:15 +0000
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
X-Inumbo-ID: e701ae88-8398-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9UnHTE5VO8iJYi2HRc74sKuk+xlheuCtMTadRqEy/Qb3uHHaJFdPKx0Pthve3953SlPYt/TZ9o8sXEoJ9pR6kKr/7GTmZ0W127dDwDyb/JmoAeFTgIjaaqsXxn4KIEyasJhJEDa5gHO+M0g1F5Yl79cvx/7ZU3SgOaFvzaj4BoZWx9zO24NgOygjr2ARY1ZcfF4PDm9z6k9EMUY8eF572B3LborUcvEvPp8Jdaw5tqDNAubOsvb0lv6Frt3MpwzCcm1/ZJwTslWf66YfKekmprTgYNQqoeooOaal3a7wcffwvIWLdMQECtSeqw5g8OxLXonzPScwTgbXxnzr4RRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09BcVSKWVvp/BpzkL3+e1HiZbKFTLDcfyFCHIvkxsBY=;
 b=se/ihS2ge5DB/8CUi4rWYFsuGsfOoYDBd0AwDuuQ9K8LsxDKaME/ukeE0BZsRxWFRzO9dTmdmDxznIsjfZsTlfcvOLmXg1T9ufsKGNo4PICV1N3tLDInmkqgBKGPdLSRkFf6VIZNJ+fo1N9CTMJONm+m9TPZmi2RskH6InXEGYXgZ3Z/F/RE0gM0TONU7bME3Urj8L17YpVZTL2fGbcGehqax16hRsvJaPbtZa15AqliPJE0iNEyMx+aAqzIKTqCUF7EwkqaHQKFVaLTlTEBMuW6S1nyDs3HdyP3atJL5z4icSOZB0Tb+2M4LN2zSTQMRElH4atqdK0WlP19HsDtEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09BcVSKWVvp/BpzkL3+e1HiZbKFTLDcfyFCHIvkxsBY=;
 b=hTVIsgLUr1RXEWD6eZDsUYr4L9qHcqYZ7u/3TVxBGwB71AXLyF0B036ZrurmSMb63mUqcQi9Dd4stZbyE2erl2/VxfBmV0rFg2wB57IwqwoUaMLXBQ/jyVQXvtYZGs1PjKh8hkZGdue6F6PXsVSmRvVQL2RJJm0qvbk+19iWLbN7G8cqVpNSfdafL+q/5Jx0aXCj8f8zxIYdJuPdeOUZaxEzRrFRiu2JDgI5KQ02NgVgNY30gJ8Tih0uWyEf0Zgn5voPRlTo/WMGVLI/IxzJJcyhUCyadM8QHAJMWUZI/mr7xbWUDnpA92PTZwC4kdK2J1MnOQidiOOR2bVIDz4pYw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v4 05/12] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Topic: [PATCH v4 05/12] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Index: AQHcF3/LXs7cVtiGJ0aCgPbYXhN1bw==
Date: Wed, 27 Aug 2025 22:55:15 +0000
Message-ID: <87iki81ijx.fsf@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
	<864522724dd6058952cad8b505b0589750b7f8d7.1756317702.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <864522724dd6058952cad8b505b0589750b7f8d7.1756317702.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Wed, 27 Aug 2025 18:24:13 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|VI1PR03MB9965:EE_
x-ms-office365-filtering-correlation-id: 06791344-7ed4-41d5-ad07-08dde5bcc9ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?gurJzrlghhtWldJ2T75zyK5e00qfRMJkLzUUpmadHbmsCTSWROntoK5Pr8?=
 =?iso-8859-1?Q?HrPWEaiFbCNO6unNuhmR7yA9BDGle8o6VyRZNUuItuWtnjqKrhubLvJbRm?=
 =?iso-8859-1?Q?hHkfEtxpx18xKB82w96fyzPEDyeQjfz1gfG04IiRe1cLm/yMaGg8wiw4A+?=
 =?iso-8859-1?Q?h/m5A7ZN0fpBv6KYYAcU6FJRFff9wv6PkXTIbgJQsARC/3ybT/CpNY751x?=
 =?iso-8859-1?Q?EFnGUdwUxtmw6AcuSE2TpQV2BbD6W4WfycnVZntQ89XiiJWoSU1fcRBZF/?=
 =?iso-8859-1?Q?qanSRHqvvVBM2tlq3/v2Hf4vAxGQ/jANB+aJoY4DUiLOO7SZ3AGk57/3gG?=
 =?iso-8859-1?Q?t2EMacK0MGrA9ACzwrAWtX20iq31XEXqwGQM0b1cHuTcmuNcs/BWMnWDOF?=
 =?iso-8859-1?Q?4/b2XcaMxL30h5VPkGOiLbwvAVC6BOrWY76i7GD9uUX54l70x+P0e/9cmT?=
 =?iso-8859-1?Q?4/87nF15FcwRWyfT6fAglK1ISGMZyLAf/6k85gWcVbvsIZAqAgv04oACcd?=
 =?iso-8859-1?Q?mMGqqMLd0RIRolJnganNoG7xodOo85AJqNpFEH4icXGPPs2P5cXgEMVKHb?=
 =?iso-8859-1?Q?SZQsvJQYDvjtgESxUipQhjwhLTC3qDDF2vFjdvUl2KM8e254zi0/LYrKpi?=
 =?iso-8859-1?Q?2ULOdfmhtRXRn1bQwsyjNAClVgK0jS18fozG8rO2H2lw12Qb8w/9qp1Tpa?=
 =?iso-8859-1?Q?WxuEWEaoQqenR1KALybudfybDjno+R7woJHDXO7tytLQO2beKW/aCoSJFc?=
 =?iso-8859-1?Q?i4E37bzel73L/JNQyex7Knm2LS+cyD5htt/hgsAtzyj/iQ3F1LNtCiZmdC?=
 =?iso-8859-1?Q?1EiE0a5Ksl+32CN2f7OnUl481v6yOCA75Kk4SeibTrEGrr0l6WhkxEexQa?=
 =?iso-8859-1?Q?FYGWbACzN38x9/CPNOsSx60dtN86kKt7kPkk24XMBMdJWRF19nZR3SSk0n?=
 =?iso-8859-1?Q?I482LSEKKGCBsYuCwx5pYdsmhG0Sg/1oe5/T/OSOc3LjWdaUixCu7RLHfg?=
 =?iso-8859-1?Q?AWPAO2jJmaWWfu7zka+7q+t8Jkktqvu246vHkeZ945l8PcmslT9A1/v//s?=
 =?iso-8859-1?Q?x3ZlhQovPnfwyeoYIDOtc3cEx8QvrUoweLclFQGEKF3l7CuB57acxFi54W?=
 =?iso-8859-1?Q?rCKAiyMgUVQcnWB9jf73Xo1NEZ5AUMJXeTXysyL9TqGOdHmXbu6ngbFIaw?=
 =?iso-8859-1?Q?QTSOsZK0iI6AGtnj0+OkzPZA+65VeaF8WM8sBvRXFJ0Cf2GMAruc+jtmvr?=
 =?iso-8859-1?Q?C7m1vBoSk87M0HN9D08KA+xoX8SUmlOOaR508ShNNNLVXplreY5unufnq/?=
 =?iso-8859-1?Q?EXehQQsECYCAKSsiy+OFmQmFoWOF8BRA9jtai+iVosBWaAdf/iU83dKwkc?=
 =?iso-8859-1?Q?Qbl/dKw2WrkVPQXuCf+b79xjslHrehOROADHWKHwLhsIrOfA0dTCNMlOKn?=
 =?iso-8859-1?Q?WKF/hsfudrNWiKYLWKGyh3CfOybDuW/EuglqlCZRiL4rCu5vLCFEhizfoU?=
 =?iso-8859-1?Q?Ww+8AkwHKTalw3sWS+cPIkNwSlARqjrhyk75+geSFYaw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7aNXyEU4GhLmi3gNdA8qGMuf089VPE0LmuOPfNxLJm83MalMecnO4pvIZk?=
 =?iso-8859-1?Q?lmZirE/Gz9bss++AHULwvxm6AZhUymLvxqwEJ3YqHURhXznTI/JRzce6te?=
 =?iso-8859-1?Q?koOcITZx7kgj4Lx0NkZRgkvmfYqSPf8T6SwEeZzmT/bOrqP1qpnJMBXGws?=
 =?iso-8859-1?Q?0yc/Q8Aaq15NnSpQjXIhmME3wcL8pNivByr7bdSXjs5puJdcckWVi35rU0?=
 =?iso-8859-1?Q?xVYCW7JfB3ZiII8hOt937cUFPCSb7FlBm0AGjSt5T32UwASnGaZPQJAnjr?=
 =?iso-8859-1?Q?NP8jNh0t2fv73GIMwVX3FnDObuEMjUZIwXYrAkG8nc0OHfrZpHy378Lyh7?=
 =?iso-8859-1?Q?EIXa7CmUgpexfmiXeKvy4NXg4Evc8+H2h53616W1rfSq58/9BFVegUzRht?=
 =?iso-8859-1?Q?ZXG64oNMqEUHnjmlRchFmDk1rJkdjsR0/sil+OiuQ/cHmlge3dhWIilTT7?=
 =?iso-8859-1?Q?Xoz7IctC3CT/DDFBdq7WqZj7jjWyCfo1l7cEcWgQy4oe+IaBeY4nAIycTN?=
 =?iso-8859-1?Q?xkMvucTYgdPh9NMHelsGs4L/C3tmgLJtg65t+S7XPaPq+YbVpPE1xA6oJU?=
 =?iso-8859-1?Q?dgkkWLPhkxL34TMEd30JmDlUdZxatktdoJEBRxphtIKdnaBNkOoh9ySlNO?=
 =?iso-8859-1?Q?BWHgsCShO4m/ldUUSgF3ICgsjWessLhX0LXuO44GupqqJiznmhqPF/MvTn?=
 =?iso-8859-1?Q?9C+8DkDptWg12btlLRwLrBd61R0k2mLSkmA1V7GEZC8TdrCZlmsuFDmWza?=
 =?iso-8859-1?Q?53UFTnId+rO1MZa0BMTBtJkqVd4UFmMG0jwrkynvgSYl38vXhLUZcKKD72?=
 =?iso-8859-1?Q?CCcchR50bzBH/tTLG7/3mqlJZwv9uuKOnmerRdW6RxV7mbSzkZ69PlgtIF?=
 =?iso-8859-1?Q?Jtmu7DpSeRKV6v1raGvKDlhrCNG3F2IzEgNzcEBdvctMWvyHElZdNgtlL5?=
 =?iso-8859-1?Q?XgIT/W490HuwqvxnOOvYpNYYNPm5Wg44Y75CSCzmnIoO96J7s3eqWKgX2S?=
 =?iso-8859-1?Q?O5YLI8h0iOCljTVyfqWHuEKSQISWALUDEDl6g22pPTdXAxaBbY/BaV04KO?=
 =?iso-8859-1?Q?yQem7hatWBup8CkTPZ6ukancWjF52Ve+DCZqgFVj344WhXvcHXLDqmrrut?=
 =?iso-8859-1?Q?mDfM1HlaXBoy1dhbnUqWVYhHayKvKSnPMHK86vkyjVUX8nwoFg14qNo7Eq?=
 =?iso-8859-1?Q?anpCAtFsF7Goy9nvcvRIBGyHRLBwO9kgvN0m0d2yXm7SIC62vT1VHOKOPY?=
 =?iso-8859-1?Q?f2hzm0Qct97ppIHAsrTmhL0stmLeo6UFkDiC2mlvVebpsj1FomzAlqlEY6?=
 =?iso-8859-1?Q?wsm0LlEY+Ki6dVFOJ2sYHlD+QJMopi+T/FD2T4ilMLWW7Ev/UkZV5BSCQz?=
 =?iso-8859-1?Q?uuA8fiZVWzs/89+EbFtqiefwfpv0BvJ8jRaJNY3uIxv56AUQ+BY6TdH0XD?=
 =?iso-8859-1?Q?zRdE9K0hIDqoPjP/FJoH49U9OZG1PcDRY25jsaPgrDD9Ib3f0OmQpE58m1?=
 =?iso-8859-1?Q?DAWhLymAuNBoJprSNV9dPHQN+5d0Z5YhcyMvXJBrT/Ah0lHCBtS8VMxttH?=
 =?iso-8859-1?Q?5mi/sS1fQ4C5MLwKvBDwlyfIjxZ0Xs0Lhzm4md4flqQNM1ctcu0cDE79Dp?=
 =?iso-8859-1?Q?1KzfRc5VDHx1yiiSAqEaRBRasLbNVSHEM3iZog2CxKza1AlMbUFQ8BZA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06791344-7ed4-41d5-ad07-08dde5bcc9ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 22:55:15.6078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5sAEQUudPjIikryXG02UcER0YkcTUHG8MVYtPHvNsVOpyHw9oKPDPSKHWoo/nGBDTmmyVznrp1ncQ/WRpjR8ZRuVEUTNC2IIsLHarCn2flM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB9965

Hi Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Introduced appropriate register definitions, helper macros,
> and initialization of required GICv3.1 distributor registers
> to support eSPI. This type of interrupt is handled in the
> same way as regular SPI interrupts, with the following
> differences:
>
> 1) eSPIs can have up to 1024 interrupts, starting from the
> beginning of the range, whereas regular SPIs use INTIDs from
> 32 to 1019, totaling 988 interrupts;
> 2) eSPIs start at INTID 4096, necessitating additional interrupt
> index conversion during register operations.
>
> In case if appropriate config is disabled, or GIC HW doesn't
> support eSPI, the existing functionality will remain the same.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

With latest changes:

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

>
> ---
> Changes in V4:
> - added offsets for GICD_IGRPMODRnE and GICD_NSACRnE that are required
>   for vGIC emulation
> - added a log banner with eSPI information, similar to the one for
>   regular SPI
> - added newline after ifdef and before gic_is_valid_line
> - added reviewed-by from Volodymyr Babchuk
>
> Changes in V3:
> - add __init attribute to gicv3_dist_espi_common_init
> - change open-codded eSPI register initialization to the appropriate
>   gen-mask macro
> - fixed formatting for lines with more than 80 symbols
> - introduced gicv3_dist_espi_init_aff to be able to use stubs in case of
>   CONFIG_GICV3_ESPI disabled
> - renamed parameter in the GICD_TYPER_ESPI_RANGE macro to espi_range
>   (name was taken from GIC specification) to avoid confusion
> - changed type for i variable to unsigned int since it cannot be
>   negative
>
> Changes in V2:
> - move gic_number_espis function from
>   [PATCH 08/10] xen/arm: vgic: add resource management for extended SPIs
>   to use it in the newly introduced gic_is_valid_espi
> - add gic_is_valid_espi which checks if IRQ number is in supported
>   by HW eSPI range
> - update gic_is_valid_irq conditions to allow operations with eSPIs
>
> Changes for V4:
>
> Changes in V4:
> - added offsets for GICD_IGRPMODRnE and GICD_NSACRnE that are required
>   for vGIC emulation
> - added newline after ifdef and before gic_is_valid_line
> - added reviewed-by from Volodymyr Babchuk
> - added a log banner with eSPI information, similar to the one for
>   regular SPI

Looks like your changelog is doubled :)

> ---
>  xen/arch/arm/gic-v3.c                  | 82 ++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/gic.h         | 22 +++++++
>  xen/arch/arm/include/asm/gic_v3_defs.h | 38 ++++++++++++
>  3 files changed, 142 insertions(+)
>
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index a959fefebe..b939a1f490 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -485,6 +485,36 @@ static void __iomem *get_addr_by_offset(struct irq_d=
esc *irqd, u32 offset)
>          default:
>              break;
>          }
> +#ifdef CONFIG_GICV3_ESPI
> +    case ESPI_BASE_INTID ... ESPI_MAX_INTID:
> +    {
> +        u32 irq_index =3D ESPI_INTID2IDX(irqd->irq);
> +
> +        switch ( offset )
> +        {
> +        case GICD_ISENABLER:
> +            return (GICD + GICD_ISENABLERnE + (irq_index / 32) * 4);
> +        case GICD_ICENABLER:
> +            return (GICD + GICD_ICENABLERnE + (irq_index / 32) * 4);
> +        case GICD_ISPENDR:
> +            return (GICD + GICD_ISPENDRnE + (irq_index / 32) * 4);
> +        case GICD_ICPENDR:
> +            return (GICD + GICD_ICPENDRnE + (irq_index / 32) * 4);
> +        case GICD_ISACTIVER:
> +            return (GICD + GICD_ISACTIVERnE + (irq_index / 32) * 4);
> +        case GICD_ICACTIVER:
> +            return (GICD + GICD_ICACTIVERnE + (irq_index / 32) * 4);
> +        case GICD_ICFGR:
> +            return (GICD + GICD_ICFGRnE + (irq_index / 16) * 4);
> +        case GICD_IROUTER:
> +            return (GICD + GICD_IROUTERnE + irq_index * 8);
> +        case GICD_IPRIORITYR:
> +            return (GICD + GICD_IPRIORITYRnE + irq_index);
> +        default:
> +            break;
> +        }
> +    }
> +#endif
>      default:
>          break;
>      }
> @@ -655,6 +685,54 @@ static void gicv3_set_irq_priority(struct irq_desc *=
desc,
>      spin_unlock(&gicv3.lock);
>  }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +unsigned int gic_number_espis(void)
> +{
> +    return gic_hw_ops->info->nr_espi;
> +}
> +
> +static void __init gicv3_dist_espi_common_init(uint32_t type)
> +{
> +    unsigned int espi_nr, i;
> +
> +    espi_nr =3D min(1024U, GICD_TYPER_ESPIS_NUM(type));
> +    gicv3_info.nr_espi =3D espi_nr;
> +    /* The GIC HW doesn't support eSPI, so we can leave from here */
> +    if ( gicv3_info.nr_espi =3D=3D 0 )
> +        return;
> +
> +    printk("GICv3: %d eSPI lines\n", gicv3_info.nr_espi);
> +
> +    for ( i =3D 0; i < espi_nr; i +=3D 16 )
> +        writel_relaxed(0, GICD + GICD_ICFGRnE + (i / 16) * 4);
> +
> +    for ( i =3D 0; i < espi_nr; i +=3D 4 )
> +        writel_relaxed(GIC_PRI_IRQ_ALL,
> +                       GICD + GICD_IPRIORITYRnE + (i / 4) * 4);
> +
> +    for ( i =3D 0; i < espi_nr; i +=3D 32 )
> +    {
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICENABLERnE + (i / 32=
) * 4);
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICACTIVERnE + (i / 32=
) * 4);
> +    }
> +
> +    for ( i =3D 0; i < espi_nr; i +=3D 32 )
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + (i / 32) =
* 4);
> +}
> +
> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity)
> +{
> +    unsigned int i;
> +
> +    for ( i =3D 0; i < gicv3_info.nr_espi; i++ )
> +        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * =
8);
> +}
> +#else
> +static void __init gicv3_dist_espi_common_init(uint32_t type) { }
> +
> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity) { }
> +#endif
> +
>  static void __init gicv3_dist_init(void)
>  {
>      uint32_t type;
> @@ -700,6 +778,8 @@ static void __init gicv3_dist_init(void)
>      for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i +=3D 32 )
>          writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * =
4);
> =20
> +    gicv3_dist_espi_common_init(type);
> +
>      gicv3_dist_wait_for_rwp();
> =20
>      /* Turn on the distributor */
> @@ -713,6 +793,8 @@ static void __init gicv3_dist_init(void)
> =20
>      for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
>          writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8)=
;
> +
> +    gicv3_dist_espi_init_aff(affinity);
>  }
> =20
>  static int gicv3_enable_redist(void)
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gi=
c.h
> index 3fcee42675..1e747dcd99 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -306,8 +306,26 @@ extern void gic_dump_vgic_info(struct vcpu *v);
> =20
>  /* Number of interrupt lines */
>  extern unsigned int gic_number_lines(void);
> +#ifdef CONFIG_GICV3_ESPI
> +extern unsigned int gic_number_espis(void);
> +
> +static inline bool gic_is_valid_espi(unsigned int irq)
> +{
> +    return (irq >=3D ESPI_BASE_INTID &&
> +            irq < ESPI_IDX2INTID(gic_number_espis()));
> +}
> +#else
> +static inline bool gic_is_valid_espi(unsigned int irq)
> +{
> +    return false;
> +}
> +#endif
> +
>  static inline bool gic_is_valid_line(unsigned int irq)
>  {
> +    if ( gic_is_valid_espi(irq) )
> +        return true;
> +
>      return irq < gic_number_lines();
>  }
> =20
> @@ -325,6 +343,10 @@ struct gic_info {
>      enum gic_version hw_version;
>      /* Number of GIC lines supported */
>      unsigned int nr_lines;
> +#ifdef CONFIG_GICV3_ESPI
> +    /* Number of GIC eSPI supported */
> +    unsigned int nr_espi;
> +#endif
>      /* Number of LR registers */
>      uint8_t nr_lrs;
>      /* Maintenance irq number */
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/includ=
e/asm/gic_v3_defs.h
> index 2af093e774..c10db9bd05 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -37,6 +37,44 @@
>  #define GICD_IROUTER1019             (0x7FD8)
>  #define GICD_PIDR2                   (0xFFE8)
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +/* Additional registers for GICv3.1 */
> +#define GICD_IGROUPRnE               (0x1000)
> +#define GICD_IGROUPRnEN              (0x107C)
> +#define GICD_ISENABLERnE             (0x1200)
> +#define GICD_ISENABLERnEN            (0x127C)
> +#define GICD_ICENABLERnE             (0x1400)
> +#define GICD_ICENABLERnEN            (0x147C)
> +#define GICD_ISPENDRnE               (0x1600)
> +#define GICD_ISPENDRnEN              (0x167C)
> +#define GICD_ICPENDRnE               (0x1800)
> +#define GICD_ICPENDRnEN              (0x187C)
> +#define GICD_ISACTIVERnE             (0x1A00)
> +#define GICD_ISACTIVERnEN            (0x1A7C)
> +#define GICD_ICACTIVERnE             (0x1C00)
> +#define GICD_ICACTIVERnEN            (0x1C7C)
> +#define GICD_IPRIORITYRnE            (0x2000)
> +#define GICD_IPRIORITYRnEN           (0x23FC)
> +#define GICD_ICFGRnE                 (0x3000)
> +#define GICD_ICFGRnEN                (0x30FC)
> +#define GICD_IGRPMODRnE              (0x3400)
> +#define GICD_IGRPMODRnEN             (0x347C)
> +#define GICD_NSACRnE                 (0x3600)
> +#define GICD_NSACRnEN                (0x36FC)
> +#define GICD_IROUTERnE               (0x8000)
> +#define GICD_IROUTERnEN              (0x9FFC)
> +
> +#define GICD_TYPER_ESPI_SHIFT        8
> +#define GICD_TYPER_ESPI_RANGE_SHIFT  27
> +#define GICD_TYPER_ESPI_RANGE_MASK   (0x1F)
> +#define GICD_TYPER_ESPI              (1U << GICD_TYPER_ESPI_SHIFT)
> +#define GICD_TYPER_ESPI_RANGE(espi_range) ((((espi_range) & \
> +        GICD_TYPER_ESPI_RANGE_MASK) + 1) * 32)
> +#define GICD_TYPER_ESPIS_NUM(typer)    \
> +        (((typer) & GICD_TYPER_ESPI) ? \
> +        GICD_TYPER_ESPI_RANGE((typer) >> GICD_TYPER_ESPI_RANGE_SHIFT) : =
0)
> +#endif
> +
>  /* Common between GICD_PIDR2 and GICR_PIDR2 */
>  #define GIC_PIDR2_ARCH_MASK         (0xf0)
>  #define GIC_PIDR2_ARCH_GICv3        (0x30)

--=20
WBR, Volodymyr=

