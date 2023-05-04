Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 210FD6F6859
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 11:33:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529652.824270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puVLK-0006C3-0U; Thu, 04 May 2023 09:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529652.824270; Thu, 04 May 2023 09:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puVLJ-00069b-TT; Thu, 04 May 2023 09:33:41 +0000
Received: by outflank-mailman (input) for mailman id 529652;
 Thu, 04 May 2023 09:33:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Xb8=AZ=epam.com=prvs=9488c893be=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1puVLI-00069C-6H
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 09:33:40 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id beeaea84-ea5e-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 11:33:37 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3446m1I2022834; Thu, 4 May 2023 09:33:17 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3qc7rj8mwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 09:33:17 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PAWPR03MB8914.eurprd03.prod.outlook.com (2603:10a6:102:332::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.25; Thu, 4 May
 2023 09:33:12 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::bcf5:cd14:fd35:1300]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::bcf5:cd14:fd35:1300%4]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 09:33:11 +0000
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
X-Inumbo-ID: beeaea84-ea5e-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVYcjlctwyKuhngP4otlVbHV8rz8lvBwoZwDY9n1iwcEdfi6t8h+8wHaOnq6I930Qm66o5khLwoayspFAiSK3H21cyPWs2CmG7RjOAcUpztrZd24Mt0E76wKahgV4BEJKVn4VnLo9AfZPavA83qS8KbCftOqja1kMqZoZR5p2DXX0O03a5MOGwniXz7gDIH6clhUS5axQcAF42+kURIn6ImEZb6HqHnNS/PDzeI5PfkpBjxwy3lQy2lJUbkZ6NuWK96iwP20oeXpsTF2bIIOQqVEBl/o/cqBqZzKxNsIr3KZ4KIXIxTfkRBYPZLpeel2p9OwMSMpyCVilv4dks3wNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDao+USfzRI6dC60XrUYVQ0VZ4TY5qoaErLxSCvXCag=;
 b=mn3TlgxCdcJO8Zwh+rqLpe3s/bLZb/6dnp7oLMKqHGOjD2OZ4PXPKwcuxDShHX558BxUm52wGOikNCrbtfBUntEOmvCzzTUsbp+EpsG09ZxFvnkoop3mR2Ybcq1jSK4r7X39zFIfhxrv5GtCGgUDLDI7Dv6N6xgo1EC5Yy+xrhEu/2lJGTkxU9TN4l0tFLwYkEOynZPTqU0i16JTbDZdWYe74P5kgxJnxdG4q0ZUN3jjCyiQtJgZLJvShAeu4+mIIh1uCR5LiPYGCgih6pPPVIZihTSd3hwr0BwdDt03y+osK8VT02Pcj1f7wJqaaYGf+AE3k9VgHHCoPO+lpyo8eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDao+USfzRI6dC60XrUYVQ0VZ4TY5qoaErLxSCvXCag=;
 b=D9RaDaA6gP+xPjNpWrPx/4hPrwNstN652ZI0foumcpv5FoTlVLb5KSwtQElnp5lbXPcrJrVLik/0ByfbqpFUNNubmhihTWULudQqxRvP4MAbe0vAedA8ZTv7l0UYYIE8+WppZUaH0D3W8Sc3ss5vH3wxv11Z19odwz3cR7+jVsWiap0Z9bFiiaeV3dOGj07Zf/G4liPX+zxTfbhS24GbwRtAMgMn4STUF55FcVGHLJSYXfBcj9qhzJZEWBYyryqXd97KMLHTk3o+OjXKlGnYe3yCcNbEtvfgYaAcFg12mKqj6V8BNpOqWfscX0Nd0fsXD+R23CbqJCi4ay9KDqR4tg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "julien@xen.org" <julien@xen.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "olekstysh@gmail.com"
	<olekstysh@gmail.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: xen: document Xen iommu device
Thread-Topic: [PATCH v3 1/2] dt-bindings: arm: xen: document Xen iommu device
Thread-Index: AQHZfmttKueJIQgVZkeItcqDtfTLRQ==
Date: Thu, 4 May 2023 09:33:10 +0000
Message-ID: <3fb45717-46a2-6465-ff3f-30a641ba67a4@epam.com>
References: 
 <alpine.DEB.2.22.394.2202071616300.2091381@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2202071616300.2091381@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|PAWPR03MB8914:EE_
x-ms-office365-filtering-correlation-id: d0857f72-4333-4e40-ac8f-08db4c8293b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 t5AK+5C4amBvwaLBuawZcCJso0WltRlSi2f+bwrzJiukcy40CUQVRBVCuVjLpDIgjnU/F4DfrziHFvteMA7ArxCCv8u/7IQlxeU9scxiBPcNCTOoKl3dYuAaPJ47ntE3xXcS9Db72QqUSzogiobRiSVZBWttiLvTZxvIW395dR1eAy0zH4TxTSjzw3dUQVdGuD5h5PwPrtw0gSz9hABrMDeiR0KHUxmc0NgHQsEP+TJePDCXVrDCe41nTEOdf/RAGG0o22jBHbL3bpiLZQy2B8RPkvezsrJhbbDVYKo+oVzI1060/gNhiV3L3ZyOchmy5QCVizDTyFDamEaBVu5rPuTKtNyOXoSUa4AiaVZK2MzQCVKNWoj0T7ptw1U+I0TKlgbxrTq2DAbxyznQXIgZv0+h3jynWLyUrCiDd95Wttn8j4Eh8jNIZy88bQhTVco+0387gSfdq7KHRN5Pl2M8ka/tz3ZXFUqJiygZUSYf/BrrhB8s5+cUfjUKXFtlS7U66FmUITomTi8ZeEX3d//U9eC5lHGfqEVFryX63C/UNiluA7MuQAI+jANcxMTIhaEfQ2LSuqN8RECHrd1VnhkRRBBoGCtMGiGu4R5cOzlfJw3Wyt13sAwSIzM5CMsj7alqDV7YWIAjoASZa/ugMJbqAQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199021)(316002)(41300700001)(6506007)(186003)(2906002)(71200400001)(26005)(6512007)(31696002)(2616005)(6916009)(83380400001)(6486002)(4326008)(66946007)(76116006)(66476007)(86362001)(64756008)(66446008)(66556008)(91956017)(31686004)(4744005)(38070700005)(36756003)(54906003)(478600001)(8676002)(8936002)(5660300002)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aitwdzl6QVZBMFMvVVkrSzRqaUpMcFNQaHRzaXdFeDRkdUE3NjFycjRiV0Er?=
 =?utf-8?B?VkNXRDJMd1BPS01Rd3pEWEZjTFl0RnRaN3FCRmRxWU1yUlRIWlIzZ2ozUFp5?=
 =?utf-8?B?NXhCdnpLUEZteGlEUlh0TVJVRnA2QXJ0b3F3QW43VitTVEY0L01jd0Z1V2VX?=
 =?utf-8?B?MG9TdTBLcEZYbnpJdHJmOFNrOGZIamFzVmxrWTgxUkVEUUFCOXd5N1hmRGNK?=
 =?utf-8?B?N2xUU01IVXdSZXloRWpUSExJK1A4Uis3ZmxpZ0xWYStyNnR4NldWTCtKaDVR?=
 =?utf-8?B?NnRyVEZZQ0FZbTJYbmk5RW5iZU9sdWJKOXM0RkMrVitlL1IxZ3Rmd1IrNGZh?=
 =?utf-8?B?aXB4MitXZlRNUTJHU3FvTllNS2tFNzE4WkgxUzdqaFlsMUE2MWdwWUtaakZK?=
 =?utf-8?B?Nm5ZNFlpSEllcWpFTDVtZHczdUpmRnhjcCtueEFzQjdSZnZIa2VYelBiNWFz?=
 =?utf-8?B?QUJYUUZRM3dTVktzOVRCYlRwRkJPNkV4cERlaVZGUlQ4Uk9xYjZQS2VvR1JS?=
 =?utf-8?B?RVMzbWxsUDRkVnZGQ29OSDhpY0tkVU1xeXlXSW1SNzNvY01kWEZuVmh6eHNk?=
 =?utf-8?B?QTBvUUgrYjdwR2Z2Vnlza0dxbGszWW5aQ3c5TmIvdVdnRGV2bUJkL3hBVTRy?=
 =?utf-8?B?Qk00b0d2RDI5cmRxWnhjYVFzRlV6Y21qY1BtdWVleXA3eWZoWk5SeTdQS1Ry?=
 =?utf-8?B?KzBZU2t5c2pFR3pxNHFWWHFFUHNVR3FKT0pTMndDNVR4ZFZNaTY1MWkvWVFt?=
 =?utf-8?B?YlNXU21BYndCS2lZZ3FkeHkvanAxd0tQTmJjdHRhbTdycG05VG9TNUVqWFZR?=
 =?utf-8?B?MjhWdmxuVC9URmZodnJVSk1jNG53QWtpNjcyZ2ZQUXdwOU92YjUxaFJYN2dT?=
 =?utf-8?B?dUF3WjdUNWh2d0d4K1NhbCttRlk1NE93cWltNUl5VVREVVBGY3ZCd0doYU40?=
 =?utf-8?B?UnZDMlZzUDJhdVRMYXd3YW1RQVJ2dVBUSmhGdkVpU1pFSDRRRFVxVFdRVVY0?=
 =?utf-8?B?VDIvZmNJaHFseTJrSEJqT0VoUEJJTHhBTklZOUNqK3JrUFljWE0ybDRRVnhI?=
 =?utf-8?B?WlRkNmgrWXRuMFJ4R3NGYUdWNmNTVVNCUWRpZlk0Y0E1Z2Y3dUtGWDJCMmxu?=
 =?utf-8?B?ZVZ1RHMxbFZZSEU4VHJrM2hyT1ZGb2JkY3IrQ2NJZFdGODVOelVqTnFTNEJo?=
 =?utf-8?B?TGZyK21DeEVDS3d1ZHVDSUJtMm9VL1hhUmV2d0V2VFc1MyswYm5rOXk4QXNJ?=
 =?utf-8?B?ZzIzcExlY2pRaGFGM29MNHhiaGYvUHhYZFdKczVBc0FLc2F3b1U3UHZEeHN3?=
 =?utf-8?B?RnB1eWM1YU81a0wza3kxOGswL3lGaWV0c20wZSs4WEl4K2IzbjZveWxJUVor?=
 =?utf-8?B?amw4dTh4My92OStuZmg5M0ZuN3JQbFR1cjJtN2JmZDhId2FHaW1RSUpNcUNC?=
 =?utf-8?B?Wi9ROWtNemVseURkQnZyZXRlSWpIak5MVmpnc1BENHNKRCtxclMxRzRVaTY2?=
 =?utf-8?B?T05Sc0NqeUgrZW5xdlE3WGo5bmJnSHorREdBL2IrZityTmhzWU5kSmEvOVJ4?=
 =?utf-8?B?aDlHUlZtOTBmczRuNGs4dGxQVnVCWkpKRUgwR3dzTzJ5azU4UTBETStERXo0?=
 =?utf-8?B?SHVqbGhOMnR1RytwdEV3cVB3ajZBOXdsSnp5TC9IVzhlOUt3bGJ3MUJENmIr?=
 =?utf-8?B?REkveml2K0dYRUhKSGF1UGo1eXZVYzQ0ei9aRGtCcjRwSnN0Z29scktCRUZh?=
 =?utf-8?B?SFp3ejdyUEtrdDEwZ2lGU0JRWEJhcmN6YmxZL3F3SVBjQStyNkVMcWxPTGNt?=
 =?utf-8?B?d3o0OXBzd01GbkN4Zmovd0k2UDJNUHdWK2ZtVDZOeEd2VDJha0tHTVArODRs?=
 =?utf-8?B?OFJ0VGFENWVWQU4vUDBDYk1wc0JQUmJaVzlncHFmdi9aQzl4Wlp2a1ZwTTg4?=
 =?utf-8?B?amNIQjREdFNFZS8vVGhQS1lZbVhUU0FaT0xKQ0IwV2N1TitOcnN0OXRJR2w0?=
 =?utf-8?B?R0FPVStDdVppT1pSK1lqemFjb0FES3FiS0dueU9oNHBDZW5WVitjWGI0MGJF?=
 =?utf-8?B?Vk9JaHB3QVI5ZFc2SHFIOEZGUWdlWTNjOVBQbS9ldmFhRHczZFpLdmlFZlJ3?=
 =?utf-8?B?UXlLeDVpOU43WWNlNm1uMWs3aVBqSEUxTndMNjYycEp2ZVBBM2lzM3B0cHN2?=
 =?utf-8?B?Zmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB841656C7DC464999D21799E398A141@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0857f72-4333-4e40-ac8f-08db4c8293b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 09:33:10.9929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eDAKFVIAj7b2qN9jgD/Yk9gWkFBBlrjNk/aD+yuAyPr6JtMCrGNUuke9ZZ+de7UGOvlLa71+rFzzz7XoHPbmu6ImSpaKuFKfzeNietFuFfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB8914
X-Proofpoint-GUID: vjyAbJriD-icjyqPmRKJL_QZO1Qh5wrr
X-Proofpoint-ORIG-GUID: vjyAbJriD-icjyqPmRKJL_QZO1Qh5wrr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_06,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=986
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 clxscore=1011 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040078

SGkgU3RlZmFubywNCg0KID4gVGhlIHRpbnkgInhlbixpb21tdS1lbDItdjEiIGRyaXZlciBjb3Vs
ZCBiZSBiYWNrcG9ydGVkIHRvIHRoZSBzdGFibGUNCiA+IHRyZWVzLCBJIHdvdWxkIGltYWdpbmUu
IE90aGVyd2lzZSwgZG8geW91IGhhdmUgYW5vdGhlciBzdWdnZXN0aW9uPw0KDQpUaGVyZSBpcyBz
dHViIElPTU1VIGRyaXZlciBhbHJlYWR5IG1lcmdlZCB0byB0aGUgTGludXggS2VybmVsOg0KQ29t
bWl0IDFjYTU1ZDUwZTUwYzc0NzQ3YTdiODg0NmRhYzMwNmZiZTVhYzRjZjUgKCJ4ZW4vZ3JhbnQt
ZG1hLWlvbW11OiANCkludHJvZHVjZSBzdHViIElPTU1VIGRyaXZlciIgYWRkZWQgYnkgT2xla3Nh
bmRyIFR5c2hjaGVua28uDQoNCkkgd2FzIGFibGUgdG8gdXNlIGl0IGFzIGFuIGVtcHR5IElPTU1V
IGRyaXZlciBvbiBteSB0ZXN0IHNldHVwOg0KTWFkZSB0aGUgZm9sbG93aW5nIGRldmljZS10cmVl
IGNoYW5nZXM6DQoNCnhlbl9pb21tdTogeGVuLWlvbW11IHsNCgljb21wYXRpYmxlID0gInhlbixn
cmFudC1kbWEiOw0KCWlvbW11LWNlbGxzID0gPDA+Ow0KfTsNCg0KaTJjQGU2MGIwMDAwIHsNCglp
b21tdXMgPSA8Jnhlbl9pb21tdSAweDA+Ow0KfTsNCg0KTWF5YmUgdGhpcyBkcml2ZXIgY2FuIGJl
IHVzZWQgdG8gc29sdmUgdGhlIGRlZmVycmVkIHByb2JsZW0gd2l0aCBzb21lIA0KbW9kaWZpY2F0
aW9ucz8NCldoYXQgaXMgeW91ciBvcGluaW9uPw0KDQpCZXN0IHJlZ2FyZHMsDQpPbGVrc2lpLg==

