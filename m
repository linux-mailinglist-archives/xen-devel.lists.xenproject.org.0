Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AFB2AF344
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 15:13:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24850.52304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcqsB-0007kN-M1; Wed, 11 Nov 2020 14:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24850.52304; Wed, 11 Nov 2020 14:13:19 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcqsB-0007jy-Ik; Wed, 11 Nov 2020 14:13:19 +0000
Received: by outflank-mailman (input) for mailman id 24850;
 Wed, 11 Nov 2020 14:13:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pxcb=ER=epam.com=prvs=9584594409=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kcqsA-0007jt-6e
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:13:18 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 763c3517-2d88-454c-a8c7-4bbdedde1955;
 Wed, 11 Nov 2020 14:13:16 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ABED9Rq003303; Wed, 11 Nov 2020 14:13:09 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by mx0a-0039f301.pphosted.com with ESMTP id 34rf808h8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Nov 2020 14:13:05 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5012.eurprd03.prod.outlook.com (2603:10a6:208:106::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Wed, 11 Nov
 2020 14:12:56 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 14:12:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Pxcb=ER=epam.com=prvs=9584594409=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kcqsA-0007jt-6e
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:13:18 +0000
X-Inumbo-ID: 763c3517-2d88-454c-a8c7-4bbdedde1955
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 763c3517-2d88-454c-a8c7-4bbdedde1955;
	Wed, 11 Nov 2020 14:13:16 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ABED9Rq003303;
	Wed, 11 Nov 2020 14:13:09 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
	by mx0a-0039f301.pphosted.com with ESMTP id 34rf808h8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2020 14:13:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrUYWvfxJLUcNC9jMdpW7vHQt26MvivY+Y7kpf6VsHt1nrG440uB2kYLpwHSmChXSluZQZkVRWvDNjkkSiVe0Q8yCnnIPbaWm1AuzJAZYSNSOQSGAfQOf4Cr3EMWLB+sFgXky7m7EhHIvIlulYxYxPx14PvLdFndC8O/qzX8TwdwafEprhfj8hTLpYHWVOCVi9Viq97QF6niaUB1AKlPPuqzBO522CR8+paqX3nwv6lu1T0z0U7MVx8cXBPCKxeCooYzQ4L+Efgvh1K2jgL5bLZcyNgZqBCfhz4I7Db3JSmK8neupQs9LUPES6NS4yFQ7t+KHBd4YFWTvQxjJaTDpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iG75p0ZMhhX6mbehzPC/+pblUTXNaQ9WSXon7+B8TqQ=;
 b=nsNkNPoqaAIJz8s1IbHwM5Wg1b3uN6OxHHRAeO2/epd10g37pzu/7VNE2vqClMeHGayCZIqOYsZByqs9pURiQzPlcPrc1bGNXDcd8SPtbWU4D3SdCEilnnQrr0yTgOS3OSEmrCPJnA7EVBJc8B/Li3qnMCqeNah0fmzBHP3cEKPvLt2Xr3QV77IvVVw936QGr/hqbWskqR+ed7VuZQSeVH6xh3i2pd/Viyq6rrSRM3GLwz+SKBZbiUrUX0uCd7yodyqETSkZ5LwExTlxr2DkjICcV97GvfPmy/UctQQgfhrWtderBXUKavS4ixxgn1WAM3wprCGjeVFeDYK/Ulmp5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iG75p0ZMhhX6mbehzPC/+pblUTXNaQ9WSXon7+B8TqQ=;
 b=Cb1rcjcOMyna1o67l+zcyZyugAqiAlGGmaL0X9Th4J7ZOjokXkVrenoM6xzDhq+MnvhMCl7UKXC62rgC2LSvV6WlOOuMed7b5wistGUHDTggsBirMJ8YE7ClviOATkEqXM4BspjfyHGzazUYLDnUBJjbcUtuZCyotaxXv1pGsBiqOfUgk4y9XxVWJcUTrMaDgLR9xaGkAP9gsXK8wj/+z6FwjLpdlheUPRNKTT08SIB1ZOteOQiKAdo8rpGWXxda0gfP5+6uGqiNVgyYCBBU15McY8x/LsNyxhkJ5KaNNF2hfz/FsWwSSjlRGays1Rn/RBTBp80ft9+ya3l0M2Pt6g==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5012.eurprd03.prod.outlook.com (2603:10a6:208:106::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Wed, 11 Nov
 2020 14:12:56 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 14:12:56 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>,
        "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>,
        "julien.grall@arm.com" <julien.grall@arm.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
        Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [SUSPECTED SPAM][PATCH 01/10] pci/pvh: Allow PCI toolstack code
 run with PVH domains on ARM
Thread-Topic: [SUSPECTED SPAM][PATCH 01/10] pci/pvh: Allow PCI toolstack code
 run with PVH domains on ARM
Thread-Index: AQHWtpbtW65RafIiXE60uDMyi8KYhqnC4BMAgAAKqgCAAAyigIAABPKA
Date: Wed, 11 Nov 2020 14:12:56 +0000
Message-ID: <fc3a73cc-824b-d941-8ec8-dfcae8ee1756@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-2-andr2000@gmail.com>
 <20201111123150.7lkabdo3wix7jkdk@Air-de-Roger>
 <57fefaee-9684-4c67-662e-f4c57313886e@epam.com>
 <20201111135513.yvqfe4xongnhtjcq@Air-de-Roger>
In-Reply-To: <20201111135513.yvqfe4xongnhtjcq@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 725eafb7-30fd-43cc-6053-08d8864be31c
x-ms-traffictypediagnostic: AM0PR03MB5012:
x-microsoft-antispam-prvs: 
 <AM0PR03MB50125236C00D07ABF2470183E7E80@AM0PR03MB5012.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 R6OXV+Tgb6nziHTGKbdh+nK7Yxa0Ho5jwdw3rWPw3Q9dOlEb5QLhyv79yvVBKmULBN/r33D1lPGlCZLIPCG+wAUJSriD5rg1AI0Dd9+iPx4VhvLeK4Db/P2HHObdwtwGcO53yjnyf+wQGulelWafYESBmzAyvv62MMzhbOOAAdrI+QbbmNeNiFD4priwkQVqHRZxTpv0ZK4Bd9OQ5d5DMNu2D3z/7/C9Av2kzbGM/0EF+nmID+NeskRP/A2itJ9+4NXC6b2cIT10yuM2r14QKWD67NJNtz5Eu52wIGgrhjGGl5K4D6shr5st8491MLJ0AUIHLVEGzPvJSGNk20K05xiB8761xusl7W32qYl640yvqE6++L845i9f5iJQ0VxKJDSLioe45XKgkG0lzMw/Bg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(86362001)(26005)(6506007)(4326008)(54906003)(8676002)(316002)(186003)(2906002)(31696002)(7416002)(8936002)(6486002)(31686004)(71200400001)(966005)(36756003)(6512007)(53546011)(83380400001)(478600001)(6916009)(76116006)(91956017)(5660300002)(2616005)(66946007)(66446008)(66476007)(66556008)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 LyHnL/5DLqX8Sel5gc5ir9piO3WEAf70KsuVPWbOkBNUn4U80s8/GV8kZtxDrTTEPDGM6x//KEON1OMEvC1FUPrcmvPaGsObvMrMqPVHtckl/tE8LVqcy8mvTVpLGwVxjruY/lV+PsNNZZGGxevC0BrKLjMe1N5E/tAcDKmvpiWbLL8SJr5MU41ORUA5Cm2t0Vgbh0RZ2wW0qQYSTyyWeJmQuMRwAkitFuB8rS1Kb7kn02LraAarMyM2bT3VBZo4i8mpg7cHtzDfuTQdQcdjM/7t03/zpmjU/QMxTOZnDJci7IGZCetcmyzEZ4iPRH1EKQWCUDoKeWqgeN8CX2NAndEi/abHwVlDePswADb1hIGhSTMr1sUvq5LHTSG+7TH35RFvc4nGqZLO3XjsehPejdxhBIkzVa53l8CPwBECF/d4Bg1yJxTvcSSuAWlJr+gPOqIh/nji9ZdmqGsqkvzlPtUjRurOyhf0VpSOdCdbpT7StyKV+zbHOOzbjHC4WyjoUn/v9PzrsBDxVEjB89XLA2NswMmqWOpSamQKaQnRXObTzrYtJBhSewA7VB7nOqmW12XJOQMtpjINfaxaZcccWb0izEAOSICWjE/tCBQTbZqLz59YBh+3T/5x2QKGv+BpvG47Nrl5t4/h3HJH9c0buw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A9CE19DBA30604081B156018D65F3B5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 725eafb7-30fd-43cc-6053-08d8864be31c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 14:12:56.2856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6NqABm3e2i2P7oXl/FqnHNj2gnUbrCmLPfBZxnP6oJAUxmxtR/YiHUEMQbtgXNWKV1AaFZc+Tc3vvpi9FnK7OQTwwWTIlkKC6UjZOuUEqYzT6E+MLkBKEZSWERWNt/bS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5012
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-11_06:2020-11-10,2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011110083

DQpPbiAxMS8xMS8yMCAzOjU1IFBNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBXZWQs
IE5vdiAxMSwgMjAyMCBhdCAwMToxMDowMVBNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IE9uIDExLzExLzIwIDI6MzEgUE0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6
DQo+Pj4gT24gTW9uLCBOb3YgMDksIDIwMjAgYXQgMDI6NTA6MjJQTSArMDIwMCwgT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4NCj4+Pj4gQWNjb3JkaW5n
IHRvIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3dpa2kueGVucHJvamVjdC5v
cmcvd2lraS9MaW51eF9QVkhfXzshIUdGXzI5ZGJjUUlVQlBBIW5FSGQ2ZWl2bXF0ZEp4dHJoTy0z
eDJNejlGNTBKc0tVb1Y3V1RFSmRfRDFOMDFEckJPSlh6R1cxUUFxd3NoWjlBTXh5d2JVaE9BJCBb
d2lraVsuXXhlbnByb2plY3RbLl1vcmddOg0KPj4+Pg0KPj4+PiBJdGVtcyBub3Qgc3VwcG9ydGVk
IGJ5IFBWSA0KPj4+PiAgICAtIFBDSSBwYXNzIHRocm91Z2ggKGFzIG9mIFhlbiA0LjEwKQ0KPj4+
Pg0KPj4+PiBBbGxvdyBydW5uaW5nIFBDSSByZW1vdmUgY29kZSBvbiBBUk0gYW5kIGRvIG5vdCBh
c3NlcnQgZm9yIFBWSCBkb21haW5zLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+
IC0tLQ0KPj4+PiAgICB0b29scy9saWJ4bC9NYWtlZmlsZSAgICB8IDQgKysrKw0KPj4+PiAgICB0
b29scy9saWJ4bC9saWJ4bF9wY2kuYyB8IDQgKysrLQ0KPj4+PiAgICAyIGZpbGVzIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGwvTWFrZWZpbGUgYi90b29scy9saWJ4bC9NYWtlZmlsZQ0KPj4+PiBpbmRleCAy
NDFkYTdmZmY2ZjQuLmYzODA2YWFmY2I0ZSAxMDA2NDQNCj4+Pj4gLS0tIGEvdG9vbHMvbGlieGwv
TWFrZWZpbGUNCj4+Pj4gKysrIGIvdG9vbHMvbGlieGwvTWFrZWZpbGUNCj4+Pj4gQEAgLTEzMCw2
ICsxMzAsMTAgQEAgZW5kaWYNCj4+Pj4gICAgDQo+Pj4+ICAgIExJQlhMX0xJQlMgKz0gLWx5YWps
DQo+Pj4+ICAgIA0KPj4+PiAraWZlcSAoJChDT05GSUdfQVJNKSx5KQ0KPj4+PiArQ0ZBTEdTICs9
IC1EQ09ORklHX0FSTQ0KPj4+PiArZW5kaWYNCj4+Pj4gKw0KPj4+PiAgICBMSUJYTF9PQkpTID0g
ZmxleGFycmF5Lm8gbGlieGwubyBsaWJ4bF9jcmVhdGUubyBsaWJ4bF9kbS5vIGxpYnhsX3BjaS5v
IFwNCj4+Pj4gICAgCQkJbGlieGxfZG9tLm8gbGlieGxfZXhlYy5vIGxpYnhsX3hzaGVscC5vIGxp
YnhsX2RldmljZS5vIFwNCj4+Pj4gICAgCQkJbGlieGxfaW50ZXJuYWwubyBsaWJ4bF91dGlscy5v
IGxpYnhsX3V1aWQubyBcDQo+Pj4+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9wY2ku
YyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jDQo+Pj4+IGluZGV4IGJjNTg0M2IxMzcwMS4uYjkz
Y2Y5NzY2NDJiIDEwMDY0NA0KPj4+PiAtLS0gYS90b29scy9saWJ4bC9saWJ4bF9wY2kuYw0KPj4+
PiArKysgYi90b29scy9saWJ4bC9saWJ4bF9wY2kuYw0KPj4+PiBAQCAtMTkxNSw4ICsxOTE1LDEw
IEBAIHN0YXRpYyB2b2lkIGRvX3BjaV9yZW1vdmUobGlieGxfX2VnYyAqZWdjLCB1aW50MzJfdCBk
b21pZCwNCj4+Pj4gICAgICAgICAgICAgICAgZ290byBvdXRfZmFpbDsNCj4+Pj4gICAgICAgICAg
ICB9DQo+Pj4+ICAgICAgICB9IGVsc2Ugew0KPj4+PiArICAgICAgICAvKiBQQ0kgcGFzc3Rocm91
Z2ggY2FuIGFsc28gcnVuIG9uIEFSTSBQVkggKi8NCj4+Pj4gKyNpZm5kZWYgQ09ORklHX0FSTQ0K
Pj4+PiAgICAgICAgICAgIGFzc2VydCh0eXBlID09IExJQlhMX0RPTUFJTl9UWVBFX1BWKTsNCj4+
Pj4gLQ0KPj4+PiArI2VuZGlmDQo+Pj4gSSB3b3VsZCBqdXN0IHJlbW92ZSB0aGUgYXNzZXJ0IG5v
dyBpZiB0aGlzIGlzIHRvIGJlIHVzZWQgYnkgQXJtIGFuZA0KPj4+IHlvdSBkb24ndCBuZWVkIHRv
IGZvcmsgdGhlIGZpbGUgZm9yIEFybS4NCj4+IFNvdW5kcyBnb29kLCBJIHdpbGwgZHJvcCB0aGVu
DQo+Pg0KPj4gQnV0IHdoYXQgd291bGQgYmUgdGhlIHJpZ2h0IGV4cGxhbmF0aW9uIHRoZW4/IEkg
bWVhbiB3aHkgdGhlcmUgd2FzIGFuIEFTU0VSVA0KPj4NCj4+IGFuZCBub3cgaXQgaXMgc2FmZSAo
Zm9yIHg4NikgdG8gcmVtb3ZlIHRoYXQ/DQo+IEFuIGFzc2VydCBpcyBqdXN0IGEgc2FmZSBiZWx0
LCB0aGUgZXhwZWN0YXRpb24gaXMgdGhhdCBpdCdzIG5ldmVyIGhpdA0KPiBieSBhY3R1YWwgY29k
ZS4gR2l2ZW4gdGhhdCB0aGlzIHBhdGggd2lsbCBub3cgYWxzbyBiZSB1c2VkIGJ5IFBWSA0KPiAo
ZXZlbiBpZiBvbmx5IG9uIEFybSkgSSBkb24ndCBzZWUgdGhlIHBvaW50IGluIGtlZXBpbmcgdGhl
IGFzc2VydCwgYW5kDQo+IG1ha2luZyBpdCBjb25kaXRpb25hbCB0byAhPSBBcm0gc2VlbXMgd29y
c2UgdGhhbiBqdXN0IGRyb3BwaW5nIGl0Lg0KDQpPaywgc28gSSBjYW4gd3JpdGUgaW4gdGhlIHBh
dGNoIGRlc2NyaXB0aW9uIHNvbWV0aGluZyBsaWtlOg0KDQoidGhpcyBwYXRoIGlzIG5vdyB1c2Vk
IGJ5IFBWSCwgc28gdGhlIGFzc2VydCBpcyBubyBsb25nZXIgdmFsaWQiDQoNCkRvZXMgaXQgc291
bmQgb2s/DQoNCj4gVGhhbmtzLCBSb2dlci4NCg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg==

