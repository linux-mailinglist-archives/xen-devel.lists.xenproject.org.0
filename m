Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB50B42C07
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 23:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109101.1458944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utvAv-0003U8-89; Wed, 03 Sep 2025 21:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109101.1458944; Wed, 03 Sep 2025 21:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utvAv-0003S9-5Q; Wed, 03 Sep 2025 21:37:53 +0000
Received: by outflank-mailman (input) for mailman id 1109101;
 Wed, 03 Sep 2025 21:37:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rz8A=3O=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1utvAs-0003S3-Vm
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 21:37:51 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d1825ad-890e-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 23:37:49 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB7064.eurprd03.prod.outlook.com
 (2603:10a6:20b:29e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 21:37:47 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 21:37:47 +0000
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
X-Inumbo-ID: 3d1825ad-890e-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpz4GyBlIDU/mHc+oHdF4jEanNFGelUce+KDupWNHOZyxE/JEnT50n+Olcal4e2Z7TRjkB9D9ZYFXlRXZwRuyiPWABBsISD6M4bCCiRCHZGE6e/Ax3ZTWufuLEBaYkfmd8OT2XL5fD1I4KAmmt5A2pTEDLsIJ3hwH2Vwpk6/us99VGHjZ5GHrA7ww+FQe83sA140hVTkA1udU+E2iAtrTqpFsGdV62djvdmx6EJ1fwqJq8OVsDfurCjewroR+MYDyBybqqDsdGsJy5CvDLY/dm03pDf+0+6QhHZs8VGxeruKtPRkmplOSfG1SEjFYfCm7u3AR9AKSskneyt0kp775w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTWA/4owJ7JAQakxcsrR5jbfywMTVZmx00kFDWsEWks=;
 b=NBnrEy+U1EaalaHBjspsNxN7GZ9ylUQv+HB6ZTUqpOYJDK5lt6oI8Ccx9AZbonkXQItOBv/gDy6uTJsjyVQP3wPdddMHGD02o0NrVCsRvikcSQqo7GNu16ZeeRYPCA+VNnepUtuI4j+/TS2WHhtA1S4vDrR9T6hp1VzwnNcEr8vjI6Eju7nHzFgAc4gAZnplwk8BcDJmG+MxKZT7tWPY4oKNkx8Z4W0BIL/AoLjo/idrTFJPPAyK4BCKVmT8/NU5wEw8FDmLSB04Xqf05qAZZpmKSiY4DIe7BF74HDyUuFnyKj1PzX9sriNuxR481Iur2aD2+5CSEwqzg40GZxlRrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTWA/4owJ7JAQakxcsrR5jbfywMTVZmx00kFDWsEWks=;
 b=qXCjPalRSQseTUOgrDtov4YVIJTTSjCE9M3azBijIOtMVL907PMcwZOUQymbLjezFQlhv/obYlJUGr+yDo2SXWEt/3GickJQfIxMX5QzO3NJFoIyxKtL9KiGKqgcOpoWiV33+SH+z2+zerWTBr1q6DcCen1cekfo9iByNonrFFW20BPbyhjOJZpK0EzGkyBhf/rgO1IQgln0pnnOFZggZ9ynAlVFkMgbOnf39OjE1YCDuSg8a7T0Wp5rRk2shPejV2bRWjUCO1NwHazkrJfWdp73umCVkDKMglpu3ljqM3QVYtn1mI6q5Xw2598WBr64GLi7ipPpX2YMaGgNjguYIw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v6 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Topic: [PATCH v6 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Index: AQHcHN9Gwo4As6udbUuFAitPPh/bLA==
Date: Wed, 3 Sep 2025 21:37:46 +0000
Message-ID: <87plc7tdxx.fsf@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
	<345da260fcb3bb400834f8a59dacfda8b37440a1.1756908472.git.leonid_komarianskyi@epam.com>
	<cb34378c-95c7-4618-8aeb-a7b7c5c97f2d@gmail.com>
In-Reply-To: <cb34378c-95c7-4618-8aeb-a7b7c5c97f2d@gmail.com> (Oleksandr
	Tyshchenko's message of "Wed, 3 Sep 2025 22:27:07 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB7064:EE_
x-ms-office365-filtering-correlation-id: 4d2304bd-243c-48cf-ed8d-08ddeb321fb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5cxvHvNU/AQSykEIcbMfCfMo++XOnwDFIK28zPPGmCOeVrXJ0N9BnleaH7?=
 =?iso-8859-1?Q?iCothoNoVOFd7U7xI6BB2L5CTPQNiy6+KZKcSKoKme3qfakrqauMSO+WX5?=
 =?iso-8859-1?Q?GBizb5t7iuZAzoXEz96MgC979e48+ipyQvT6/fEHiwY32AGably3tZSvha?=
 =?iso-8859-1?Q?YeG19Llmh1iKiNLHoFNJXMGjLf0NNhvU/fh4w7Bvp0PmWOPFhxAVD9DJyB?=
 =?iso-8859-1?Q?5y8QG0/J/9glPyy8cukEaRjOMDbTl5Twudlrfkl8PgdFH7D1gaMddWJZ7k?=
 =?iso-8859-1?Q?66DmLja4Y3AzQCWVc+YNEfr03C/IxnzItNgUvdJ/FloGc4wT/7lyUnbujk?=
 =?iso-8859-1?Q?oK0cWXK0qNLh4jliV/aABsaUX0aSPEPv3k/wmbWP2Pa4frylVqyasNqAUR?=
 =?iso-8859-1?Q?KJ/RsALVKf5Xd9euW05xieweC9faWRimet26xCfXFtQt6QASykmXNi1oVI?=
 =?iso-8859-1?Q?q6VwpuPECy4sP9sJL2w/FGpAmhaaaFtk1a6Xz3gaE/QMqxXssRWk2CXzqQ?=
 =?iso-8859-1?Q?aba47Y/2AJCabKMnA5LP0boXd1+oLKnpCfX6h3n4gFq2uw9ikPvR4xswMR?=
 =?iso-8859-1?Q?wZtfOn+l8c5iiMuwPs1/vOzD+mCnJxt21E9rCYbdZF/PIU6HtPRKL+GH6F?=
 =?iso-8859-1?Q?WAce+Jw4P16Z6pdqpUXick6Xsv1fhnK7OXjF6g5QseAtBdGCC3/XahZtFo?=
 =?iso-8859-1?Q?ZGms5VZ94pfzIfLqbJC2U7LEUlBVbAyaUh51bPebDJgNTTCoTzbt8PFy99?=
 =?iso-8859-1?Q?NZeqnX5wN6+bzPSeasMPkaeT+1RmoY+CDmuwc2yGSnBcw71QwsoBeJtuKJ?=
 =?iso-8859-1?Q?AXC5vcukoBYN6pwoULOnu2y7UTPfwcHD1hDHQrzWDsSXNso8mjeWysAr25?=
 =?iso-8859-1?Q?slowjvUPPnRXwoNGHQ3ho4i3cN9EiNxDSXb5V5TleoRD6fvs26BnEA5tHm?=
 =?iso-8859-1?Q?d491F9p5zhbcmKUO/lTtadj1McadVO/pf+XThyVTQV+asbcMfvyOXjnRqU?=
 =?iso-8859-1?Q?OIG3da6WxpY1bwF6ha6RLLJP9IUFjW1rs9QR4finqlqx4rL2KhOM3GpHPz?=
 =?iso-8859-1?Q?W1fkeGsfEH+bp1H1p7dU3UUGV92qaVGYQb3sXFyzTZI6KjhMUf5UemR37n?=
 =?iso-8859-1?Q?fKIF5WvAGXKj5PihdYpKDQar5QvCaFTH2OmdWFoKYhJMAt4WSjz15GJ4hx?=
 =?iso-8859-1?Q?uOCcG0mKDb4wBihYB3IGeuyh4fuQg1GyA3ZkqLtsL6jDug+1HEP/m3qfHA?=
 =?iso-8859-1?Q?VNMfjkJBevuW6vMZrMimBbKNI6v1Znzj2NIfxeZsmKSlZ19UompBpZwNpk?=
 =?iso-8859-1?Q?fK7Lx/epz1buwf26M48rUqQ1O2TlwSqQSwUI7TYfSugwgCtUm43Q7t/ERm?=
 =?iso-8859-1?Q?g8dYBBwZDWcBThT9m2T9YzZXNlb4Z5paug9KUIZrS2m5LQrCbPTUbuvd8P?=
 =?iso-8859-1?Q?TpG7ICQC1QECKk0mSjqy6D/83VpsamzJt9GqzLwyN9moYeA3zsnLhIGnr2?=
 =?iso-8859-1?Q?2V5H8fJGincsc2CkYTN+USbvHmebc/7WOhZ8aR82ljmw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xpJKgM4wloh290VFSk1MpIyIr8/i2/PKfHiIzGY39SjL3KQZEP5girBXEq?=
 =?iso-8859-1?Q?Xt+L3Q+CNId7+iLCB4K0DWMVPssV4Mx/o2k4AxG3hkDe2eQHmUo6jOw8I/?=
 =?iso-8859-1?Q?2HTMNEHSXo+RERnohaFwGMkGLWaFuxP7wbdDS3lZ7582lQXiI3jO92miox?=
 =?iso-8859-1?Q?oBB71W7GgWn8XfTyfzaBVnbbG2DVzd6diGXwLiEZPi8ipOHaKQAjackOui?=
 =?iso-8859-1?Q?ec4QAiLd0MinLT12CkHXC+o5ICUkSkdVI0Fl4hp1segr4WMoSmEwA0cdYc?=
 =?iso-8859-1?Q?XNK/AwYwT0JH7GvPaoooDZ2fZbAKldvSekY9YiDJ11MDvVa3BQxMSFE+3B?=
 =?iso-8859-1?Q?0Qd7R1W/hba6EcfFq9P5lcFwM1N8l1lcLM8UZIFCyVx48607RHl2MnPg9q?=
 =?iso-8859-1?Q?FIUzO0hNSQcfIB7JWRjcXU71TZmvNaYILjwIlQPCErGZxNyVcNcc2ckjmq?=
 =?iso-8859-1?Q?JilAFlSK7tNjxnUFkxRNT95TaSIDTcmE06vLttjV7OmCIRAnUHR2nJsX8a?=
 =?iso-8859-1?Q?H5u3/YDmbs4VQGykU1nOxnz3deYXV/ANH6ZfpJR72QbUSY8fq2KgtSQ9qd?=
 =?iso-8859-1?Q?hlwBIk0almB/eKjn315blEzMAFKBMxWXbKAQk/jyfiul1OxJlN/lnP52po?=
 =?iso-8859-1?Q?zkw84DWMIkKXVl3ilTVxrabBbjES+KRc+4i+PVo/dRJLottetDG2K67W4i?=
 =?iso-8859-1?Q?jqVRg3GmlAjNcnzTRdutSOP5jvUmq5qMvCKq4Sj5lU5iqb6hobBtOJa4Nm?=
 =?iso-8859-1?Q?lppztzZNRfJ/2gKDEhc8kJ0bQa9JIjmBTe410IO+hRJiIfGjwfq1GtneJd?=
 =?iso-8859-1?Q?LHZMnOrpn/axZ4jwouwGgTcHiXduH0rcdyA8+Oager5gGG+RmuxB+PDyyH?=
 =?iso-8859-1?Q?yXQEzXi4lsozdk5oNLR7Lpk1IQysZ7GbV1TI08+egKt2lbJK7tvqtewtip?=
 =?iso-8859-1?Q?48mXuBK+4vUd0cXbRjlpF/9D1h22+wC1PpA8VnidIrTGT4cgnpQkJlQU+p?=
 =?iso-8859-1?Q?rVhpcoDN1M0ej152byRcwgkMP5SgjFAYHO5MXG9rlWS0Nep1eqMKl+pUKZ?=
 =?iso-8859-1?Q?Hy0G6jxN8PMs1VrtcE3W1eIgUIXcGf3z2DttW2gsqXGSbxAcdDasn1ZHZF?=
 =?iso-8859-1?Q?t5RfolhMpjKYcadXLe4QKHKJkFJa1CC05583iqZsjBkzMFRyK43q6ZAt2q?=
 =?iso-8859-1?Q?Vuw09jTUW56UF4RK3cyCxXzb3M+uT2Omdy9QxwNayn++EiqJumxgu4VY16?=
 =?iso-8859-1?Q?X2MUx1gRRJZBeE7q8tT842TpEjwkOnu+yeowpXT7vOYYvicQkD8PT2qcos?=
 =?iso-8859-1?Q?emCaiweyWkIqFIkquiRdzAapnJKwBSNa7N/aVtB3AevAcYloH8hyPK+Xwe?=
 =?iso-8859-1?Q?oagw/prsEas3IeLEOTrsBaqq7GUu4SjFFsKawFdd/IUYJywYKh8R4CzS1K?=
 =?iso-8859-1?Q?vmxpXOdrQ44WasGphcNpXVWt2u54OPikdIqoPcz6OJBwND28hDu9nftmyP?=
 =?iso-8859-1?Q?Ssk0GI7fXdiTf9WptPXyGsoqc7W5jOon51Sh+8XHcKb0xno5psZVl4oyDv?=
 =?iso-8859-1?Q?+SLZscUBWbE9gBySGlzP2mHIkeKNebDbRKlAhSq50eBRE5eI6mRYIggGnh?=
 =?iso-8859-1?Q?ojYTxH2Rdf1hM3sLVTUoMV2pKpcpp9y0rzT1iaf9JF9Ya3C77Sj9ag2g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d2304bd-243c-48cf-ed8d-08ddeb321fb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 21:37:46.9263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M+El2Sq+YtrpjPn7QKoq8ccGM5k28EtZiQHD1UEUCuszDT8pJyhCNUbVSagEG69PSPhgVvqgpIfivz3mLaiMkCUFtDZpGKOD39zsJ5uAfLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7064

Hi Oleksandr,

Oleksandr Tyshchenko <olekstysh@gmail.com> writes:


[...]

>> +static inline uint32_t vgic_get_reg_offset(uint32_t reg, uint32_t spi_b=
ase,
>> +                                           uint32_t espi_base)
>> +{
>> +    if ( reg < espi_base )
>> +        return reg - spi_base;
>> +    else
>> +        return reg - espi_base;
>> +}
>
> I am wondering (I do not request a change) whether
> vgic_get_reg_offset() is really helpfull,
> e.g. is
>  offset =3D vgic_get_reg_offset(reg, GICD_IPRIORITYR, GICD_IPRIORITYRnE);
> much better than:
>  offset =3D reg < GICD_IPRIORITYRnE ? reg - GICD_IPRIORITYR : reg -
>  GICD_IPRIORITYRnE;
>

IMO, it is easy to make a mistake, because you need to write register
name 3 times. Can cause errors during copy-pasting. But I saw clever
trick by Mykola Kvach, something like this:

#define vgic_get_reg_offset(addr, reg_name) ( addr < reg_name##nE ? \
 addr - reg_name : addr - reg_name##nE )

And then you can just use this as

offset =3D vgic_get_reg_offset(reg, GICD_IPRIORITYR)

I don't know what maintainers think about this type of preprocessor
trickery, but in my opinion it is justified in this case, because it
leaves less room for a mistake.


--=20
WBR, Volodymyr=

