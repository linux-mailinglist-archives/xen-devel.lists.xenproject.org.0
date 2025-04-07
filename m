Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB4FA7DB4C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 12:37:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939637.1339673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1jqr-0005ru-8n; Mon, 07 Apr 2025 10:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939637.1339673; Mon, 07 Apr 2025 10:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1jqr-0005pi-5z; Mon, 07 Apr 2025 10:37:13 +0000
Received: by outflank-mailman (input) for mailman id 939637;
 Mon, 07 Apr 2025 10:37:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=taXB=WZ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1u1jqo-0005pa-Vi
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 10:37:11 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062d.outbound.protection.outlook.com
 [2a01:111:f403:260d::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f50b321-139c-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 12:37:05 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB6726.eurprd03.prod.outlook.com
 (2603:10a6:20b:29e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 10:37:02 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 10:37:02 +0000
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
X-Inumbo-ID: 3f50b321-139c-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwGgvcJbnGttTmrIzAcZIXholeFU0qylx89At3gA8HLmFlGBy6gkDSJwPTs9H9QHo93E9fNkNi+FOuNCKsdWD5OFgwaCtrZxWt9peyM1yZw+MhvgTxsvShHqrwdiXcV/l8i98mpFAV7twWdcKbno0Mwa6ijIIBabj4McDJ/u/3zo+Yiarp+BMPJa2ZllEtqvsaOMPV/bOwNDQ0wpHZl6/LRGmLvWuxA/gbc1HAkfe03HgIH7gCBUj4cNT8H81XSGHwnMV+7X4P5qI9s8tbC1kPMj5NzS64abdq7OBzohzYl2scIEopI9xU3MRi15drUMQroNYFPaMecquQM/nK5xOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDdK1kuDQI+B9NOWUNt1I7PjSO8fjzmwaWzqKsDY3go=;
 b=c7weTQm+K8pd17+XPC8xrieyRRbIyR+mo8HWwsyR1cTetz18iPxEgJnV1wfD8aE2uwLhDe+dUfh5mnNB6Yp62KGyaSKehs8sjlg9Y54XwwdyMXchIjcbEpYhczxH9jg/uXRhQJEWFamYoMuuZNF1fQWURkMhorCleI8OK/pQpJ3f8jaoXYjAIxe7Rv2Qe5Uq/2ti2uzmBchLDZ2fRfDd26rqYDckao2pBWy/yYJw/vrasZe++nKgGrxXsxEbQ5qvV+yVJuff7h6K/YNB04W+pMj5f20XvkAEMpksuBFEzQpCaZES22OgP2cSlKykOB89eAu6b7eMw9WfJeE2xmW3+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDdK1kuDQI+B9NOWUNt1I7PjSO8fjzmwaWzqKsDY3go=;
 b=TA024Sjg+LHNbyeoNrU/FF+M15MKvfIkgs3vwWJ6jcqSjC9n1YBetntH/rQXJrRKmY1zTrVT44HrIRIf9GxBoFHRRZHF/TT+ksYqHsvhxb0QviphscBKHw2hnFE8qtc6ZG9v8B/w/C4Smjtmrcrb8X/OcjapIuIPRPBiA7oh4Mr4YYqD5dUejL5p63cDdaQrcQQcnLgbCuabl7P6KCE/nVFIXJCNTo0JA3aMj9GkxqUV0NbCA7yWMzqKXA/ski6CTCDszyh2TpjnyWMn18q+srJUKuBnD36+29Ko+jRXmsaUwM8Ja45fMa9r+fljMeqVdesA3Tssa2QkRFXxomw8jQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Anthony PERARD <anthony.perard@vates.tech>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 3/3] xen: debug: gcov: add condition coverage support
Thread-Topic: [PATCH v3 3/3] xen: debug: gcov: add condition coverage support
Thread-Index: AQHboqPjQYlXeZrAE0u+zEMqLR0ZhQ==
Date: Mon, 7 Apr 2025 10:37:02 +0000
Message-ID: <878qocfeb6.fsf@epam.com>
References: <20250401011744.2267367-1-volodymyr_babchuk@epam.com>
	<20250401011744.2267367-4-volodymyr_babchuk@epam.com>
	<7281b7d8-ba7b-4658-82f1-a63d66c1baff@suse.com>	<87mscvffo8.fsf@epam.com>
 <Z_Oha7JXI2vf4uXo@l14>
In-Reply-To: <Z_Oha7JXI2vf4uXo@l14> (Anthony PERARD's message of "Mon, 07 Apr
	2025 09:57:00 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB6726:EE_
x-ms-office365-filtering-correlation-id: 58f62565-742e-4487-ef0b-08dd75c02245
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?wWJ7eCl/1cnAamjSSbkH18wpyVwDle3usU5mS1DOIooEnrgdBGD1VBpGup?=
 =?iso-8859-1?Q?qEsUBdOC1T0MMsxr33sA4xNG6SJ4VH08ZS5UnExGXZlOPSimlJdkjSgXfp?=
 =?iso-8859-1?Q?5qwZbRmZksFoJaf35UuBkNOtK9dV5SYsZLB68FTLdczJTECWr+yUz3FYyQ?=
 =?iso-8859-1?Q?YYoEX7cX5rBOYjYXkv3RyFgHB2EFx3rhkzXMssqcqfCp6VMr46Da+Qw9r4?=
 =?iso-8859-1?Q?hSNvCCtw8iC/UIrKRsHi7/KRNktFDbwLk4lNRgiAhXZgXloUBl7qXO/bJx?=
 =?iso-8859-1?Q?2RWnQH2YodCQLBR2lx4cYEkWVI4n72Dg6qbO11O2BYBHWPcZwMAjYk3Y1W?=
 =?iso-8859-1?Q?YAmGXn/9UKLRCw4/oBDwgk8tmyZnDhYYt1llZbPpd7C+nejVy/o/kVKmGw?=
 =?iso-8859-1?Q?xlPI4wmMS9PjdFpQiPLIa+BpWPxR896v6ng8/dckmpeAHEqX4QHDDTsh7O?=
 =?iso-8859-1?Q?3IiqzWgUCb80eQnOEDShfv0PwU3PeHuLEVHBWlDy7fTBJNvJNAHfgq54pq?=
 =?iso-8859-1?Q?djtiZ46cDNwaMeRU0gUgAXgOpdtJuwwlP2bZyrzTLp3HIbV4IJMgktI6OE?=
 =?iso-8859-1?Q?GvGaSY6KARQ8u2YHmuIXgyYW5Iiu3f/ZgHCWP1ouFtZEHwCPIvvNIRSgiH?=
 =?iso-8859-1?Q?uca8wdM9TUdvgMalvoOI/TD2pDAF4PPW7qzMkyJHB1sObiCxY+NbCGcrAj?=
 =?iso-8859-1?Q?J/pWeW9d4ZGE0AMslD5yLWQP+Y32ypresLejpUlbaViu6birIPo9+AvTJF?=
 =?iso-8859-1?Q?NH/p6E4kml7g4z2kEvUPyKM5Y0EbFA3k2r1EuBzGtkYQBpQKJF/n5PvmJt?=
 =?iso-8859-1?Q?/X6nIguzojb5JRL0WeRozkfjdW3ysS/P1G4yL3gzlx3GWB3QH+2xm7zhSl?=
 =?iso-8859-1?Q?JA8tdMT7PlOWk51h+4fSXcG/Gqgg8sYwlhn5/6FM/qDB3T/P2Fv47ok91+?=
 =?iso-8859-1?Q?NtA05LapScvPdG8CC3hG9NM8g1oS4CcIvPULyie453hDj97HbAxq+fsbSK?=
 =?iso-8859-1?Q?9RoG97CUPUNM6t4lWiUjnOfIARvo8blEu6tnbIG5YwKtx9mHGdIwlcDQZ/?=
 =?iso-8859-1?Q?T1nJgidfcY2tHANbW24RGnYnJsl/ifzpUt9flRTLtUYvb1wlOmiOsEL0SJ?=
 =?iso-8859-1?Q?jcS1KU9RzYDjGXS2uUdzU504qFnBb/j5WWijvUiqzMAGsadSt7tPOejP08?=
 =?iso-8859-1?Q?1OdEKWbpnKNIAWVg4LFO7eakY1tZ88Q3laVbk5WHy0sfzk06CIjkMo2FTK?=
 =?iso-8859-1?Q?/E6fIIrfp0i7E0izGB0lwa1BEAnXcgppAz2EaTambgtuaVMGDdGIIHuNnM?=
 =?iso-8859-1?Q?0xCDMdNW0M4RTRx4HNpSoXWxqKaB9GUcTXFXTcL4jTUzqiVvfyxpCIbtt0?=
 =?iso-8859-1?Q?UlwkyMWao5dt+AHmPTuRe6RE2i2mF07BRLe4XrBljKVr7HEidNuHnQovpL?=
 =?iso-8859-1?Q?1ZM/hhmyjf6ypMiAo/6yUkSi9KISD3vphNcqnQ7OXuJUR8uj1twWvAnSWp?=
 =?iso-8859-1?Q?ZNxEvcz3LhKTzs6ogWNtP0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LUt6hALhU9SZA4S4HSbFRxXh6g9IxlQ5TxwWqNUOwc23p5cRGaRoD1Qt/i?=
 =?iso-8859-1?Q?uQkQ0VnogLbExEYEn5WxXmcFuAwntDq1FF9AlCbhiz6MOm6pxxUEWuBLtm?=
 =?iso-8859-1?Q?REP/YDewWcHnYQyn6OWhFOAcr+Q0gnjRcuH/FhXzoNWA26z23NfuIJlhCK?=
 =?iso-8859-1?Q?2u1dgGDAUbLYHnt0PgrGs10eKF3TrKqL6zGGBS8lYiIwt8jtW7xLQ/JNce?=
 =?iso-8859-1?Q?MkPPjoatgXj6UvXz4gSvtkDbdyd+8mQtsE9v0Vq/6a+Ta6Oj+ee99R26xS?=
 =?iso-8859-1?Q?szteiFwFWFqyLZ7I4OR+i+OzcutxzKVwXuoLsy40sc87OdRsDjuCzo+d0r?=
 =?iso-8859-1?Q?h1SSReh++J+OokQeJ4ZY3/oIh6iqARJjuccE0VwWB9CWKi56p91MeHWbyS?=
 =?iso-8859-1?Q?g7gM9NRhhWOZF9IV3qYRbN0Vv5cHI/JJIN2IMIuSKvcmCNL92D3tvAVeII?=
 =?iso-8859-1?Q?RDCw0WnN/OMlrGH/afpDKk8jd/0ZwqsGQU5qTRLoLa5MYmU1b7vQUUVBLr?=
 =?iso-8859-1?Q?gvJ1IvvxQarqfuy/8ycERITv3ZArSWv+9mtik4/BY7v2/So92CT2xFVn7o?=
 =?iso-8859-1?Q?oP+/FnqIhZ4mkHCKO8WkCfrWtFaNyruzVy73C/6kHhw3t9gPeWjLvaHVej?=
 =?iso-8859-1?Q?aMnTNVSMk5yZBI1HlOnmWI4IXb86bQKR1Xe6kGBAsj/QEZfWAplOUwMr/v?=
 =?iso-8859-1?Q?LbhtiEDZl36HhSdHfobszG5DToQbbPiisunBxYdnQLtis1TENjwEtLsjl6?=
 =?iso-8859-1?Q?sBSYzUumt8hZ/ZAr5SAgwQSuGkHTa3onToVmtMTM/0xcoREWplL/XA2uzQ?=
 =?iso-8859-1?Q?Zc9/cMfaa2wufdmVHYisRFz0BPN3YjnYkSsdO560thvyFvQ9Bi7YV83hIt?=
 =?iso-8859-1?Q?lfzQTHLxzE0hqgY9YKUawrimZYqst+SBd2HEVpGEgX0B+/ZrWI3qMsQ90Z?=
 =?iso-8859-1?Q?qBPZvdBFYzggAbOIgevL51bnx+fGlmUp+bGrUPnOl/BfnxFFrbFzl7ri01?=
 =?iso-8859-1?Q?Qk2xQRgZ+G0NbycVBd8RzSkIeaAYe7eM7rrhcldN1vJJqPNpJXTfJ/J4cl?=
 =?iso-8859-1?Q?6OqmsZqo07bdXw+1iik5Odgtf6UDliTOv7OrWiIolGhjfM82Q12OKZqc1q?=
 =?iso-8859-1?Q?t2UpAiO1dXiv1liZFf1wgEaJBDD+TONcwUZCucJsNrWgR4xzy5GKBL+17u?=
 =?iso-8859-1?Q?DN1blfLcLRIpK1xUCz2QUtnRvISBIXOd9QMwe5ULXk2flyRty0FJ//O9cP?=
 =?iso-8859-1?Q?UeLAPE55kF0N/Qm2AARNs3rO9H6n9D2J6LV3yzGmujbaA2d8VgeFZVrgZX?=
 =?iso-8859-1?Q?LnuD8fj3Co/EkpCE1dG5+UKONS78ebRuPIPjtygF0BV3jYMMTOgSejMtpU?=
 =?iso-8859-1?Q?U6kWe5jfTeWLuquPixrmnbiguXDexpQpmJnpx5DhtI0krrCxm2iiXTeTQj?=
 =?iso-8859-1?Q?N8AZ3FeeyrkR3ZE59WMZItrryYo9BXIVbWiePZJf2WWRcQXH+hiPLpZUoq?=
 =?iso-8859-1?Q?eTyqNDiQnTA/FNtAATdmoFnB6zHv300d4wto1G49G+pwT7XL+MSgtvwubW?=
 =?iso-8859-1?Q?pmyyX23BfkGfrjqMukOV4NDEmCaY9SQ7uI9YrOkBF0ALBUe62JYFjznq5Q?=
 =?iso-8859-1?Q?lvJbvM9CvLIAxs7ypezYQDzAUcgdq7sDTU9805YQoHThPYwgYYTUhaJg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f62565-742e-4487-ef0b-08dd75c02245
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 10:37:02.5433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IXtYP9qg0GEz5i+17uSWF3uvJzlhTnQ6QSJX07pEvLPsDAiw5sy+TOs0ZUo4pXfkHglmBdZwfNBj5sJdgO4/TWM9x5TOQYCnPGfZhVWcdYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6726


Hi Anthony,

"Anthony PERARD" <anthony.perard@vates.tech> writes:

> On Sat, Apr 05, 2025 at 03:30:49AM +0000, Volodymyr Babchuk wrote:
>> --- a/xen/Rules.mk
>> +++ b/xen/Rules.mk
>> @@ -133,18 +133,19 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)=
): CFLAGS-y +=3D -DINIT_SECTIONS
>> =20
>>  non-init-objects =3D $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(ext=
ra-y))
>> =20
>> -ifeq ($(CONFIG_COVERAGE),y)
>
> This removes an "ifeq ()", so you probably need to remove and "endif"
> somewhere else, which doesn't appear in this snippet.

Yes, I'm sorry, it just didn't got into the snippet. I wanted to discuss
approach only, so this is not the final version.

>>  ifeq ($(CONFIG_CC_IS_CLANG),y)
>> -    COV_FLAGS :=3D -fprofile-instr-generate -fcoverage-mapping
>> +    cov-flags-$(CONFIG_COVERAGE) :=3D -fprofile-instr-generate -fcovera=
ge-mapping
>
> If you do this assignment like that, it would be better to make sure
> $(cov-flags-y) is initialised properly, that is have a:
>
>   cov-flags-y :=3D
>
> before the first conditional assignment, then have all conditional
> assignment be +=3D.

Sure.

>
>>  else
>> -    COV_FLAGS :=3D -fprofile-arcs -ftest-coverage
>> +    cov-flags-$(CONFIG_COVERAGE) :=3D -fprofile-arcs -ftest-coverage
>> +    cov-flags-$(CONFIG_CONDITION_COVERAGE) +=3D -fcondition-coverage
>
> What happen if CONFIG_CONDITION_COVERAGE=3Dy but CONFIG_COVERAGE=3Dn ?

Kconfig ensures that this is impossible:

config CONDITION_COVERAGE
	bool "Condition coverage support"
	depends on COVERAGE && CC_HAS_MCDC

I believe, this is enough, and we don't need a separate check on
Makefile level.

--=20
WBR, Volodymyr=

