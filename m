Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2150FBC10C6
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 12:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138666.1474309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v65FS-0002G4-T9; Tue, 07 Oct 2025 10:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138666.1474309; Tue, 07 Oct 2025 10:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v65FS-0002DN-Pp; Tue, 07 Oct 2025 10:48:50 +0000
Received: by outflank-mailman (input) for mailman id 1138666;
 Tue, 07 Oct 2025 10:48:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Adj=4Q=citrix.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1v65FQ-0002DD-Oo
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 10:48:48 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 308e11e5-a36b-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 12:48:43 +0200 (CEST)
Received: from CY4PR03MB3382.namprd03.prod.outlook.com (2603:10b6:910:53::36)
 by MN2PR03MB5118.namprd03.prod.outlook.com (2603:10b6:208:1af::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 10:48:35 +0000
Received: from CY4PR03MB3382.namprd03.prod.outlook.com
 ([fe80::2947:e6d0:817c:58e8]) by CY4PR03MB3382.namprd03.prod.outlook.com
 ([fe80::2947:e6d0:817c:58e8%5]) with mapi id 15.20.9182.015; Tue, 7 Oct 2025
 10:48:35 +0000
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
X-Inumbo-ID: 308e11e5-a36b-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIGg9JnySpVSNHYabNN+8t9sVQ5WRy8RNXSUl3hYYeKB5c76OvpDtttdAjG48fL38BdhKk4FBqIsGJJejiO1UnmpPtzs6tL/jEu3cGDwWnUvx1X4PI61iojm58x6+jJu1i2KniqVzO76PuATkmSOzzu0tmaaDniGmeYTUPS+9urxg78D7K7T7bGdIp8QbUe8GDmOCLD1A4yLUdpWfd0hLBVFrZ9e1mWBvaWM7ceiRredXLZIhwNhGaBrRw6SstzX6ovdMHNSqq2sl1xaEb/83IFaCNeP4lpquVsWtPYvnWqo254fdKk4ty3TYKEQcReufpqroalaGMA8SGxOF+zS2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnKuMuS/DmbJZIpHQ4FbALKwQfdmb9XbkUo1fMOaMZY=;
 b=WXBSJh6ve+RnnMzQc1KyxUa6+7R5+ZpZP9OFTmv+4rtzVz7qrczF1IUnH/kfkBSOroYc1O/+2LUWjH7qtuqSucwcbpViHpju4TfClBROqqiXiTJdNWB+XBombDSgvAraVaKI9rPmiEcVPerJcKU7ppRdFVgdILXpcoK7Ef7vqWzTSZe2xXtmvf7lMZFr7s2j3zSw5//Hz+7JIswGFq9xlqLV7aRUwussAC3utgKsBSUGW1a1JuNQGM5VZe5t3hkdwlKwB5g+0oL/J+7RC7oyxYP1udefvq3U69xS0kNHmowAKfem6GZkr8KKHxuSV029jgmP3iHroeQpOuZlwtG7uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnKuMuS/DmbJZIpHQ4FbALKwQfdmb9XbkUo1fMOaMZY=;
 b=Kwxth8o680BvSGOCh7sbaOJH56AR8BShfnLAFqlOB4Qvfxbm2lPBUQZXNYhfQqcTePkX40z0dB8fW0u/vYNSGJ/hRykWD041hO8evHHB7kJYhpR8JYgAChiKAogHSceT/qJpB7HT88dZUG1wdMX1NEd4IPhHnztof7RIj3GizAU=
From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper
	<andrew.cooper@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH livepatch-build-tools] Treat constant sections as string
 sections
Thread-Topic: [PATCH livepatch-build-tools] Treat constant sections as string
 sections
Thread-Index: AQHcKIHoyLH9KprocEqbpj5ziY/4lbS1cVKAgAEs5ek=
Date: Tue, 7 Oct 2025 10:48:34 +0000
Message-ID:
 <CY4PR03MB3382D76EDA23581DAE7C8A9F84E0A@CY4PR03MB3382.namprd03.prod.outlook.com>
References: <20250918095203.19421-1-frediano.ziglio@citrix.com>
 <DM6PR03MB4764D72D07BF22EA0B911A24F0E3A@DM6PR03MB4764.namprd03.prod.outlook.com>
In-Reply-To:
 <DM6PR03MB4764D72D07BF22EA0B911A24F0E3A@DM6PR03MB4764.namprd03.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR03MB3382:EE_|MN2PR03MB5118:EE_
x-ms-office365-filtering-correlation-id: bd90980c-afaa-4e85-1853-08de058f1096
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qXOUNaD3qA7CItJbTJuJC4joYhXEcfp/Q701GN//dlYEKyfDmTGg7VqX39?=
 =?iso-8859-1?Q?qeGcX1vFEBPY1VKItidQuunqOBjtOX61Vrdp/Hp7+EurgCz4zVHjmrro/a?=
 =?iso-8859-1?Q?etdD7Y67tlr/6FRb9lgZY4qpR5OPr5Ht6WZ3JyBpcKmcFJAraTgaKdjsXK?=
 =?iso-8859-1?Q?pVhjErE3GljSl2PCKs3pVJROB6nNMSBIQpWIZYApaLIOboZ/uYKyEcGAO1?=
 =?iso-8859-1?Q?JrEibTWobhsZE8L3oK56s2i5E5xd6mFnfs5Q99Hu/NGC/3AQKT9970ivTQ?=
 =?iso-8859-1?Q?6WbNe40teMjTG84h6o9jVcYRE1L7uKZWD+th1oEobj3AhYR9oSZWi01vMS?=
 =?iso-8859-1?Q?ERW48iChTlzbhs1fsunvnl/TWmG6H3W91Fa6F6ZPk1px4sF514RgyGPtEE?=
 =?iso-8859-1?Q?yFfbzGGhOol5t596rUDPIf7hh0oLTUKD3aH35DlDXZbp3Tim7NJ9Trr2ig?=
 =?iso-8859-1?Q?CdlWsp+CYjZO/X7BBK49JLNmotHPA8JgsyvbW7LFwaR6y6O3bdHSVD6/Kc?=
 =?iso-8859-1?Q?c2KAvWpRkiqH+jyLUF1hzGnmD8LoNpdIzU5Ea7HDsBct+IzOVtSq2TGV+r?=
 =?iso-8859-1?Q?9U/UP34ThBW9cuWtqY0+Csmf1Ra3t9A8p2tBsfzCJaPLnEvKZWPG5HF9yi?=
 =?iso-8859-1?Q?LWLmSTGhBoyxWFvffS478+ujJ8tFJpofKmc1V22XZMCU05UXjWNsz/ULd8?=
 =?iso-8859-1?Q?PPl49JQL0tHuKXvhWnoroO1b7/eSL5+m/q1VtZ9/lXSBkEnLYA98Zxyz0o?=
 =?iso-8859-1?Q?9nvnqqyXi8CFhgl6fuQZyN6WhjOxfAckSwFPQdP4efRh8pZHJy8iaUY198?=
 =?iso-8859-1?Q?fsQ39aPeGUrfne0wt1rAW5GxEEVFkB3bwfQYMf4gW/NT14wwlCRKjc8KJE?=
 =?iso-8859-1?Q?G5ysT7EvDpNTpkXmEKCeAoDl085lgGZfgimZS4++cGoSl1faFQ3Waw+Hvk?=
 =?iso-8859-1?Q?ZgDWd7yCvjiPbFhfa7wnnmdVsNpvVIhUSKnPztXC8E2g3Mw6MekfxyXL5U?=
 =?iso-8859-1?Q?URZeasKWCQp7JsaA+/04JDyITafIqYwGmSUb6pOHqwH5mmtz2scGsSk504?=
 =?iso-8859-1?Q?KKnVGkbZ+BAddV7HWN2DznKowDG9G2Osar+G6XHi0FMjbn8r+nSlnAr/h7?=
 =?iso-8859-1?Q?9PyxsPXKhDMi9uajcr2KGYFHJi/cyWyCbYSh3tVDnU3we/D+KQEQZ2tyml?=
 =?iso-8859-1?Q?JKO33jhL2cKvLmO3WcoDxATPDkuUntTEzAnm5+gaydzlGDKdHwj5U6r6Fa?=
 =?iso-8859-1?Q?gp5PZaihk29cPkh2rNKACGPleQjnYlIPZ1VwaGNG0ophjyEFsOZ9URDPY7?=
 =?iso-8859-1?Q?3vTvtivOPp1SbOB8R79s5E5qGzuCsoAEib+AsAC+oZJMMsUTWdtbMkn5tY?=
 =?iso-8859-1?Q?5wYpwExX7opAYVb58Kln5Is1Knf9De1q2VMSwn8FrUTKZb59nY/xOf8ve+?=
 =?iso-8859-1?Q?CL1TnDjw3gLfWSWeRSawz0AFFWCUNrEUn4hOj2xcE2LErYRpGD7Bv9md96?=
 =?iso-8859-1?Q?ph4L6cXkbp14rrRZ66SUuuEg3HEmFOG+QQXywpm0Wt3h03Zmp/Uf2VYR0g?=
 =?iso-8859-1?Q?lWn9Y3hkl5Dg47oYG2dNPCYOXpPU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR03MB3382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?y6ErURFWZfTWxOWzAUqKuhq14RY0SqFDpODrKZ9a3QKp6Y8c/1rKYLF5Qx?=
 =?iso-8859-1?Q?d75DRGvxQjpPBj7aYJUAj01c6Q/+AWYt8D2cpogKYVPLBqTMR3VlkUkLsv?=
 =?iso-8859-1?Q?x+cARrNvcGtf9wbsvACPxTjB8zGHSGq0ZSTFcT2OAh08OS4lAEHzzCxheD?=
 =?iso-8859-1?Q?MxnC2uqmuFUFJiJBgS4AOflzbrQt9OupFV6A9rfHyt+Q4XWSH66FEcBFC8?=
 =?iso-8859-1?Q?y4n9auxuK564XGbpPVH5/yID5Iz8Qv8ocOm9Td5l/j4NOzCHOK54HwNpgK?=
 =?iso-8859-1?Q?UkGqa/zIvQZ42ECHG575i4IXrzEtjfUyDBIA+zytcyUUpE9by+jzLiguGZ?=
 =?iso-8859-1?Q?Yh6/tTedfWHVbtQbCi+LGi+Pw+4OQM7xEHbX58/eQUBVwD7bHIPpVKGiPU?=
 =?iso-8859-1?Q?otYTQcYpYFOuw75d84cJUvSHUQxYxaB/zH4+yjB9avtDftTLkFbc1zLg8z?=
 =?iso-8859-1?Q?VbgPZ7tT8SfLrKhBUa+4LOdeKnnjjZC9r35juWmJgN604g9znsxbY3giFQ?=
 =?iso-8859-1?Q?rW/0u+UthmA7lS8TSpQICBUmUUVCXl5yP49jKsltqseXKoDZOBQAl49Pps?=
 =?iso-8859-1?Q?DOMTRVQsopJoid47Rlcfsn9zBc5UMrGW2rhMrb+Z5L+fzyafO0vGgeui49?=
 =?iso-8859-1?Q?CH5oBk5XxR6iskHDwfZRznuI+x8iO8x17UT+IQqFUeG2QIFh5TcLvrGH6+?=
 =?iso-8859-1?Q?rtIkBBbesA0/V0UbIV8DL93OuY2zpXg9rnHC0fW2ZsSWiKDmifgbxK9mCv?=
 =?iso-8859-1?Q?s+3FlUsHFghKf34Jc3s6OXYVS0b2nbGKgPPh8cIEpcdXYCzy9ZI50SywHO?=
 =?iso-8859-1?Q?bAwY55bwnd8fYNWUBiWfQ7tJErzC10vODe9Tr0VX7BVCycFqGUHxuJjYXV?=
 =?iso-8859-1?Q?psxBjqprHrUxI/ak/0kUGqPt4LQxW8kJzim8dMkWziHHLiIKA2L7gFPj4D?=
 =?iso-8859-1?Q?/J5qeriWAEN8RQR2zRzQORDyfLdWcL+Nd0E7Cu0uYhVnsiR2oobUlfFzA8?=
 =?iso-8859-1?Q?Usuv4Ip6jmFAdzOUFMlrjysX53Z883Dt/f5b//fEuFHmce6bCvYmQ5qTES?=
 =?iso-8859-1?Q?eQMdV1r3a+KTBpUe55FqX/lJ3mcoPermAYfsN1ab/yY2OZbY+GfTVyDjTE?=
 =?iso-8859-1?Q?pk8kQEtqP21WilB3ILYo+E6cU3Wfyp9Dj/GTsbOGztFzR1m3N9nVXjW60F?=
 =?iso-8859-1?Q?+jNAyBwyWaPvgkRUiYC7GHpkECWSd2avoe64v5Ay0UPGxGPDcGHDr78DBK?=
 =?iso-8859-1?Q?MSqDRlspCSY38/4Lf8K+S5Zwt+SeGG1athfyTY7i0dXl/mk66HLONu5EtD?=
 =?iso-8859-1?Q?PQTAMSFa/7rVfpCZTNypVHIMsGQHXTH8R7rXCJM0xPfUsQJk1ymQ2jNG3o?=
 =?iso-8859-1?Q?ivSadP/KEvElWetfVkSryYsZ50f7SqQ4E7vh9kHztQnOu/fZkhIW+TDclD?=
 =?iso-8859-1?Q?laQrj21M9vZ5RSiJ66S/DsJ6gehQ+4KEgHQUJD8w3IDq8YuenlEcjE31bM?=
 =?iso-8859-1?Q?lq1uN5FGtQyjI5DkRLsAQXB8Puugv16qEZeSK2OWoGO6vLaF4ilfsngn2c?=
 =?iso-8859-1?Q?W3YlSGGXAflKwf4tUIXJO3Bqgg8IIBoE+q01DrVvRqcbvYztlGl+3mvBo0?=
 =?iso-8859-1?Q?cLxqqPg+/vDHYMgOq1qCq/j4VUJ0pBPWKU?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR03MB3382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd90980c-afaa-4e85-1853-08de058f1096
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 10:48:34.9770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s3yxD+vIgC7jALkXWokcM17IBlBfqlYGeefmKtboBwqsb4NWpkkrt9xPfyqKMdcmSAvhk503zeOBcYoHKKRgkl2lwoRyFw8wUmwpuVFxV6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5118

> > From: Frediano Ziglio =0A=
> > Sent: Thursday, September 18, 2025 10:51 AM=0A=
> > To: xen-devel@xxxxxxxxxxxxxxxxxxxx =0A=
> > Cc: Frediano Ziglio ; Ross Lagerwall ; Konrad Rzeszutek Wilk ; Andrew C=
ooper ; Roger Pau Monne =0A=
> > Subject: [PATCH livepatch-build-tools] Treat constant sections as strin=
g sections=0A=
> >  =0A=
> > Newer compiler can put some constant strings inside constant=0A=
> > sections (.rodata.cstXX) instead of string sections (.rodata.str1.XX).=
=0A=
> > This causes the produced live patch to not apply when such=0A=
> > strings are produced.=0A=
> > So treat the constant sections as string ones.=0A=
> =0A=
> =0A=
> Are you sure it was a string and not something else? As far as I can=0A=
> tell GCC chooses the section in categorize_decl_for_section() which=0A=
> doesn't appear to ever put constant strings in .rodata.cst.=0A=
>=0A=
=0A=
=0A=
In the specific case it was a "h" string (used for continuation).=0A=
 =0A=
> =0A=
> In any case if we have a reference to a constant in .rodata.cst then the=
=0A=
> section _does_ need to be included in its entirety, though it makes me=0A=
> wonder if is_rodata_str_section is the best place for this check.=0A=
> =0A=
> =0A=
> > =0A=
> > Signed-off-by: Frediano Ziglio =0A=
> > ---=0A=
> >  create-diff-object.c | 6 ++++++=0A=
> >  1 file changed, 6 insertions(+)=0A=
> > =0A=
> > diff --git a/create-diff-object.c b/create-diff-object.c=0A=
> > index 7e6138b..7acaf88 100644=0A=
> > --- a/create-diff-object.c=0A=
> > +++ b/create-diff-object.c=0A=
> > @@ -1446,11 +1446,16 @@ static bool is_rodata_str_section(const char *n=
ame)=0A=
> =0A=
> =0A=
> Can you update the comment at the top of this function?=0A=
> =0A=
=0A=
I'll do it.=0A=
=0A=
> =0A=
> >  {=0A=
> >  #define GCC_5_SECTION_NAME ".rodata.str1."=0A=
> >  #define GCC_6_SECTION_NAME ".str1."=0A=
> > +#define GCC_CSTR ".rodata.cst"=0A=
> =0A=
> =0A=
> What does CSTR stand for? May call it GCC_CONSTANT_SECTION_NAME instead?=
=0A=
> =0A=
=0A=
It makes sense, I'll change it.=0A=
=0A=
> =0A=
> Ross=0A=
=0A=
Frediano=0A=

