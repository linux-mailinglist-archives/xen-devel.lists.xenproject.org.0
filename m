Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A480B37614
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 02:22:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095365.1450417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur3vY-0007CC-9R; Wed, 27 Aug 2025 00:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095365.1450417; Wed, 27 Aug 2025 00:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur3vY-0007Ak-6a; Wed, 27 Aug 2025 00:22:12 +0000
Received: by outflank-mailman (input) for mailman id 1095365;
 Wed, 27 Aug 2025 00:22:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSw+=3H=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ur3vW-0007Ad-NO
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 00:22:10 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de9f2274-82db-11f0-a32c-13f23c93f187;
 Wed, 27 Aug 2025 02:22:09 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by GVXPR03MB10457.eurprd03.prod.outlook.com
 (2603:10a6:150:156::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 00:22:06 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 00:22:06 +0000
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
X-Inumbo-ID: de9f2274-82db-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NE0Rn9OJfeUwkoIFR5NgSBrYOfv2EWObNTWv7QVr6tN7rDqoT2nunDiOdsijxuHA77mZFQXrXK2qxp9pVUZBBeMrbx84JrPVrMVBm6fgwG0Fj2fd585bIYtoyo61VWRctfsdrKtl7JjM67roo9Eb+PLut9qUoFubimQSVvZQMEOsc5E4AsMaI7ZxWBnzrFGjwCFuqI6EnFgs9KsKECfDdfXl7n7l2tJlLszFi5MkB/IY/6b334DuCrX6v/Y05Knr18O3fkBD3R+ffj6q5mOEfG9QUaLOeorfs9kpCEtO5B6DF7lni8jMfcTe7ZsQbws2uY7uAhFBt0x/OGlqnM37tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cg4x98IHKNACtQBiGCyoQx34avLEyg0yyHbFcN/rScs=;
 b=vt3ZCem5JqEnnI3qhtX33JdBRmuhuHOZBfrMo6mHtLSzF3fOuogDCFXeqNHhPEbJ4LpHeGyr1DsPnDqnEeRoFMmpz8BuoqjY5QVkzBNpPkjQyN6F8E7FIAfTja1CImiPIUUaEJaE9wUlICd+MMZeg6CjtpnF/Lr4YuhyoS7kNv1b2irvysphmNyM61Y3MlFQMkiMnTMYTAAvzhwT9Z+QAbgxPx3849cuLx63SPSGCWlFTGQf0ew2EFwN8UwDWqa2EDN5bJdQYHZKriVR1Lx3mNhX8VjCIZVXerx0aRZbFDvhPVFLEBkq40YGJLU8fHwS3+d746iSRk5L5q+PujOLNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cg4x98IHKNACtQBiGCyoQx34avLEyg0yyHbFcN/rScs=;
 b=oAu6K8/CY1eq/Sip+s3uh2YpkS3wQKiU5Dr0bmt2bw+SwFKWNVQBMCiHc9wosltQbw+Aq9Ywq4kdgCe+1adkGqOKAf+54i8WIlZ7y72kwNTqJOwgNjCNyat337XsmmpXijccL+JIiSX5j9VsSqSptQbqnNxxSs0GMwRT6CQkhoxlwFPxpEuJ02BhK84EPeBT6RcmVOaJr8JuatzW7isbGj92yTOHBLY5g9GQNS76qalxdGV1YtO8IoQMDIkkF0uJdyhZKWjODnNSrSCTxyQ9dOoO32LGLx4Alhyv7dce7hKr1tGAAV7Cb45Q83mo55pYzVqCMpKpTSlLwOJ/46s4aw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/4] xen/arm: split set_domain_type() between
 arm64/arm32
Thread-Topic: [PATCH v2 1/4] xen/arm: split set_domain_type() between
 arm64/arm32
Thread-Index: AQHcBrdwRN56SCuvyEipomT5fYlVlA==
Date: Wed, 27 Aug 2025 00:22:05 +0000
Message-ID: <87bjo13976.fsf@epam.com>
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
	<20250806094929.293658-2-grygorii_strashko@epam.com>
In-Reply-To: <20250806094929.293658-2-grygorii_strashko@epam.com> (Grygorii
	Strashko's message of "Wed, 6 Aug 2025 09:49:42 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|GVXPR03MB10457:EE_
x-ms-office365-filtering-correlation-id: dc084c89-7b46-4ee0-dc59-08dde4ffc0dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|42112799006|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ksZ/Kb8dMlMlXPLHLjAm+hmcbhSgFi+DcPf5OgXMq3ntuI6+o0kUkMHGx+?=
 =?iso-8859-1?Q?RJ5+T/SpIXeYQliOrFLvLasuQ1SgAOkzWkek9fkF9x412+VVSI5Lm+e4AV?=
 =?iso-8859-1?Q?wsaR0rC0zHm0hF7R2hJbZDUZOQ6GyrQ5euvPSo71n7y4Ual2Ry3eXzh4Gu?=
 =?iso-8859-1?Q?knk6ykXe5/ufGN3MppREBhaV+VLDZcKeJlOIuw08cEGqaJiGaYhibdinyl?=
 =?iso-8859-1?Q?X71ys3dc8pobxerpfu9rbbIKhaF2TiEep+R70Ktjea4F1MFqJ7G+LuzWDC?=
 =?iso-8859-1?Q?/JTIs3N5KQntl8TNQwUMeLEQbxJVqNaoE89+7+pp15uiASl+p3tA09Gq4H?=
 =?iso-8859-1?Q?J5nLWiAy5CfTV5yIL7Px1MCXUR6fwBXEIuMQkkIoTOqGZNi3NC2LZnnwIm?=
 =?iso-8859-1?Q?RGQrfzaISELZ9QFS/0xnJ6IR+OT92g2IKmKazHbWovOnJmd8vC8MpZrF80?=
 =?iso-8859-1?Q?SD2jyLVuozLa8aM6euwzBKlEr48kzVh0TNeVts7NyiAgrMQis6VN6CiOfA?=
 =?iso-8859-1?Q?1U7ct6UQK8m5q/r8AKOiRcznEsZ+7LG3lA4xCAXxsG11nKHzAO0ylhF1VN?=
 =?iso-8859-1?Q?hWeHGyoFM8jdAM8n+vC+fD8luyxyQpMoqtw0HwGEpvX3UaPtABM3vVmG8+?=
 =?iso-8859-1?Q?MxQnYU3HbUF1nPPto2UddailCR5QpJWusb6IGKfpACil/RTjZUeR89EyJF?=
 =?iso-8859-1?Q?UQEHdSUcgvHuWDLnixVF75gBlwzQj4GGqQaomOCkDYmLW+zt7fkoYpbxb3?=
 =?iso-8859-1?Q?g+UXkw/y815S2dFw+LE1Pj2WHKVwAE8cqz6dqts9Xt/4DOR2P0W59cv3dX?=
 =?iso-8859-1?Q?TalX76m2YCBNszw4RVbjCzMLanYeWb/DCNkJiW7ri0LOqDTsE+T5SHvebd?=
 =?iso-8859-1?Q?SrcVIQ5+wiXNV7ffOaWwsY6qAWVfXS+nfK8/UylChqcYGisoDtKkF2gU+w?=
 =?iso-8859-1?Q?6xEtGQ3yAREfnF7RRD9+horIk0bpT1TNjzN48fco979NafYKrZXL5u8f13?=
 =?iso-8859-1?Q?fF9CU1CVrvmlkmYzoRpIosW50IF9h91kI9HcTaP3BG3gNRuAijghCMNt3W?=
 =?iso-8859-1?Q?D5MXX9A3Cg/G9jT6830nP679H4cgfqCkdhdVX7cF6Sa67q0e6kMW1bGRvE?=
 =?iso-8859-1?Q?IqD8fqslIG4QfGw3lZAKjDz90UU2V6RtfyEB2zvhiH6oSnuv5AWeVvp7Pf?=
 =?iso-8859-1?Q?MZtGOpNaZlugbLOyottoAov+6XSYCQvCOyiU6Ow8YVAAjYsybWm8twhu1s?=
 =?iso-8859-1?Q?ty6OMDLoSmFJ8+50/d3s/Q3BHvVb+vTcEDRaomDc6ZoZ3i9AjBSJvHbLh4?=
 =?iso-8859-1?Q?vfyfRh5hzjzYye7tXiMPmAUjwlcXP5ENF63MXApFibtaazhRnlbNg9OlLH?=
 =?iso-8859-1?Q?4ej/in3esBwtlXoihgvjVyxs41a6VO3NNCXCpEivKIzH1MD673n01uwxOm?=
 =?iso-8859-1?Q?CsQwILL/9qUGoayd2XYzjwIZfcKOxyjCdiTe0QLiLx/1MJJjKgFDfGVBXs?=
 =?iso-8859-1?Q?XncLH59Qjr08NmSXAvGU2dsDsQKhhr/AneTp7Bu7SJrlX83Qh2dNNSVNwf?=
 =?iso-8859-1?Q?kA87MUQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?V7t5k84j4/U1+qouFiVovUpFf5gJHqbvBidWHNpfmwCBQiVNyVIiuu3hCr?=
 =?iso-8859-1?Q?bkZjlMD0r732ijaAx6SMyK5YsHw3hrobHoRndx059nTbvm5vk/KVTpSlTV?=
 =?iso-8859-1?Q?6JAX2ita3aYcczaRe+JoK6+x6sWLFv5/sI+C05phMoImbzyRwBx+QyKxmg?=
 =?iso-8859-1?Q?/KlZoBPg9QC4GH0jf7eyH4LRnzJ6wm4ZisKPbXi83PmbKQLkaLL1AeFOPN?=
 =?iso-8859-1?Q?TEj9PlEUkN2sTSINjcrCh7s6okR5cwqByPIpoRckgQxsUI34LhcLUen/Ic?=
 =?iso-8859-1?Q?Qb5dxkIiCVL8n49V/bKrsV+q2tF4wI/imgI/f90t9lKnrD2RsnYT4JZkZ2?=
 =?iso-8859-1?Q?QILDOh1v9AFNaffDRi2bdq+bum9xDPNNPdhz40LBPXOmgPSy1Wh08MyBdV?=
 =?iso-8859-1?Q?2omPCOsLB4xQx6BIaRnIg8Pwrc+kETD1l8L4ieR4XD5YoI/uAr/eMnKpDY?=
 =?iso-8859-1?Q?XgHASiOdOzyGB7EqoMV+qIFj4urDV+BJrH6+u9gXGlHbQRnNe4joQdMz4C?=
 =?iso-8859-1?Q?KB+2Z1es1L/rZZonuLlVtzmBpHCgphuKsGcXUlr2mrcKZTuHffRUvBGdV2?=
 =?iso-8859-1?Q?Yf3yhaEbRSDzACRg//QMnhuyfewR6BpoOzEqZxYVc6RQejY7RqeYtOKedy?=
 =?iso-8859-1?Q?hlShrZ/Gx+6pt01qcF9Kc/zK4gg8Kl4rV4vdPZNtowE2cE3MNLzNdzwsJs?=
 =?iso-8859-1?Q?+jwQMS7W2vmmn7KgLOnudj6Ds31WOXcvXTHbfKl6N4omjTHqKBJXGtKHZr?=
 =?iso-8859-1?Q?BAhsSnPvHt7lF1+pSLqDPAj8XT8nBz/8nLFpNVO/rtnoRnTcCYJ/Tk0/zV?=
 =?iso-8859-1?Q?V0yPohFYtqxSnURRtKozXYEs7Shau9NwSaIMfaU+uj0+Aj0+jwNCE0vNBb?=
 =?iso-8859-1?Q?2e53lYHZru67QaWFf20IRHd0ONTtax8KzdNY9Nq0gobwPlBWRdsEsMZDWr?=
 =?iso-8859-1?Q?URsSJTbZdmtW1AB3bZz6FyvvCSwXAQXlgFSYyS46GqzHzgXil90CukL4Z1?=
 =?iso-8859-1?Q?lF86Y1mybBI4cIUQ0tvyZo4aNvWBXFYC/wcMq0SjpZsrjOAzijuhAUpUie?=
 =?iso-8859-1?Q?Bcm532sf58HTyYKbnxRBatUcQdPMDsNMHNqdaONYxmznw24HaFYXj7nBoV?=
 =?iso-8859-1?Q?So6HvXdpNz3e4aAZfez7Q5gkRQK2lEKm7l72kS/3CfTVidLaoPLzKviAQK?=
 =?iso-8859-1?Q?yjHyDqQLzfivrrJoOu+om/iH2S6ofD8rlfeiGc14FkPrsRFHJSDvqF/gmU?=
 =?iso-8859-1?Q?2c0Ej/sppbqL75lpLnZndK0OCWbo+mwa0WZmamqQcsZolHy1/7gRaYLYaY?=
 =?iso-8859-1?Q?OuzWoPrU3I7MfuBQ6KIBWJnITQzpOEuj4CSR0UJRD8T6X70G5/uLyaYWGd?=
 =?iso-8859-1?Q?lcCpiYLC2D7R7KkpsdRZYvaDib09v8sww/lchbLsRBaJEEyawcN+crVr4w?=
 =?iso-8859-1?Q?S9bfOQY8T4F8eEWXJmFLT4pNz10+NRVKDesx2Q+kczEDK6nDttFUGSC2o7?=
 =?iso-8859-1?Q?jJSIdLBIN9P/L9se5WO9OD0ih08Ud9j43pc0rheV4hezP4RMigkDT8Cp1y?=
 =?iso-8859-1?Q?KwXPVg48WunjZldUmAzOaOLmv2bVVoHCBpT8SWyqPIgzlLQoXRX+9/WYYa?=
 =?iso-8859-1?Q?bJm01AXev48QJZXCGRaEAZpVyV7+auvFRliD8W61Y4drN1LdFSDpcg0w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc084c89-7b46-4ee0-dc59-08dde4ffc0dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 00:22:05.9845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C57gNmtbloAzhP/RnBUBhdiPbVuAbPQiJU/vLdgVU589LN6H360SuAziK9DBs9grMtr9C/oudKfp/o9cc6d/OuknlbpQyRdqKp8roLxGxcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10457

Hi,

Grygorii Strashko <grygorii_strashko@epam.com> writes:

> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> Split set_domain_type() between Arm64/Arm32 sub-arches as
> set_domain_type() implementation is going to be extended for Arm64.
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> v2:
> - no changes, rebase
>
>  xen/arch/arm/arm32/Makefile       |  1 +
>  xen/arch/arm/arm32/domain-build.c | 22 ++++++++++++++++++++++
>  xen/arch/arm/arm64/Makefile       |  1 +
>  xen/arch/arm/arm64/domain-build.c | 24 ++++++++++++++++++++++++
>  xen/arch/arm/dom0less-build.c     | 14 --------------
>  xen/include/xen/dom0less-build.h  |  8 ++++++++
>  6 files changed, 56 insertions(+), 14 deletions(-)
>  create mode 100644 xen/arch/arm/arm32/domain-build.c
>  create mode 100644 xen/arch/arm/arm64/domain-build.c

Is it really worth to create two more source files just for one
function? Maybe it is better to use already existing
xen/arch/arm/arm*/domain.c ?

>
> diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
> index 531168f58a0a..0fd3f5272361 100644
> --- a/xen/arch/arm/arm32/Makefile
> +++ b/xen/arch/arm/arm32/Makefile
> @@ -6,6 +6,7 @@ obj-y +=3D cache.o
>  obj-$(CONFIG_EARLY_PRINTK) +=3D debug.o
>  obj-y +=3D domctl.o
>  obj-y +=3D domain.o
> +obj-y +=3D domain-build.o
>  obj-y +=3D entry.o
>  obj-y +=3D head.o
>  obj-y +=3D insn.o
> diff --git a/xen/arch/arm/arm32/domain-build.c b/xen/arch/arm/arm32/domai=
n-build.c
> new file mode 100644
> index 000000000000..e34261e4a2ad
> --- /dev/null
> +++ b/xen/arch/arm/arm32/domain-build.c
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/fdt-kernel.h>
> +#include <xen/sched.h>
> +
> +#include <asm/domain.h>
> +
> +#ifdef CONFIG_DOM0LESS_BOOT
> +void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
> +{
> +    /* Nothing to do */
> +}
> +#endif
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
> index 6491c5350b2e..3272fe7e4ca2 100644
> --- a/xen/arch/arm/arm64/Makefile
> +++ b/xen/arch/arm/arm64/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_HARDEN_BRANCH_PREDICTOR) +=3D bpi.o
>  obj-$(CONFIG_EARLY_PRINTK) +=3D debug.o
>  obj-y +=3D domctl.o
>  obj-y +=3D domain.o
> +obj-y +=3D domain-build.o
>  obj-y +=3D entry.o
>  obj-y +=3D head.o
>  obj-y +=3D insn.o
> diff --git a/xen/arch/arm/arm64/domain-build.c b/xen/arch/arm/arm64/domai=
n-build.c
> new file mode 100644
> index 000000000000..3a89ee46b8c6
> --- /dev/null
> +++ b/xen/arch/arm/arm64/domain-build.c
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/fdt-kernel.h>
> +#include <xen/sched.h>
> +
> +#include <asm/domain.h>
> +
> +#ifdef CONFIG_DOM0LESS_BOOT
> +/* TODO: make arch.type generic ? */
> +void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
> +{
> +    /* type must be set before allocate memory */
> +    d->arch.type =3D kinfo->arch.type;
> +}
> +#endif
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.=
c
> index c8d07213e247..58f77628df1f 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -236,20 +236,6 @@ int __init make_arch_nodes(struct kernel_info *kinfo=
)
>      return 0;
>  }
> =20
> -/* TODO: make arch.type generic ? */
> -#ifdef CONFIG_ARM_64
> -void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
> -{
> -    /* type must be set before allocate memory */
> -    d->arch.type =3D kinfo->arch.type;
> -}
> -#else
> -void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
> -{
> -    /* Nothing to do */
> -}
> -#endif
> -
>  int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
>                        const struct dt_device_node *node)
>  {
> diff --git a/xen/include/xen/dom0less-build.h b/xen/include/xen/dom0less-=
build.h
> index 408859e3255a..3e81d8ba3a47 100644
> --- a/xen/include/xen/dom0less-build.h
> +++ b/xen/include/xen/dom0less-build.h
> @@ -57,6 +57,14 @@ int init_vuart(struct domain *d, struct kernel_info *k=
info,
>  int make_intc_domU_node(struct kernel_info *kinfo);
>  int make_arch_nodes(struct kernel_info *kinfo);
> =20
> +/*
> + * Set domain type from struct kernel_info which defines guest Execution
> + * State 32-bit/64-bit (for Arm AArch32/AArch64).
> + * The domain type must be set before allocate_memory.
> + *
> + * @d: pointer to the domain structure.
> + * @kinfo: pointer to the kinfo structure.
> + */
>  void set_domain_type(struct domain *d, struct kernel_info *kinfo);
> =20
>  int init_intc_phandle(struct kernel_info *kinfo, const char *name,

--=20
WBR, Volodymyr=

