Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC355296C41
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 11:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10812.28851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVtXs-0004oG-1o; Fri, 23 Oct 2020 09:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10812.28851; Fri, 23 Oct 2020 09:39:36 +0000
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
	id 1kVtXr-0004nr-UL; Fri, 23 Oct 2020 09:39:35 +0000
Received: by outflank-mailman (input) for mailman id 10812;
 Fri, 23 Oct 2020 09:39:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OWdy=D6=epam.com=prvs=8565980f29=anastasiia_lukianenko@srs-us1.protection.inumbo.net>)
 id 1kVtXq-0004nm-0D
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 09:39:34 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04563125-10c4-4ad9-9b4d-c78cb3a8852d;
 Fri, 23 Oct 2020 09:39:33 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09N9TXTA019557; Fri, 23 Oct 2020 09:39:29 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 by mx0a-0039f301.pphosted.com with ESMTP id 34bs0c0w8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Oct 2020 09:39:29 +0000
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com (2603:10a6:20b:1c2::6)
 by AM5PR03MB2946.eurprd03.prod.outlook.com (2603:10a6:206:24::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Fri, 23 Oct
 2020 09:39:27 +0000
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8]) by AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8%5]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 09:39:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OWdy=D6=epam.com=prvs=8565980f29=anastasiia_lukianenko@srs-us1.protection.inumbo.net>)
	id 1kVtXq-0004nm-0D
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 09:39:34 +0000
X-Inumbo-ID: 04563125-10c4-4ad9-9b4d-c78cb3a8852d
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 04563125-10c4-4ad9-9b4d-c78cb3a8852d;
	Fri, 23 Oct 2020 09:39:33 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09N9TXTA019557;
	Fri, 23 Oct 2020 09:39:29 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
	by mx0a-0039f301.pphosted.com with ESMTP id 34bs0c0w8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2020 09:39:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKAFgYsIMOjE3wYto/Lg/sM8bzKfWnCd3XkTVec6Y8IQsU9Vz5ATLSDPx7ZGsFPvCVOVa2KAqZnopTWNehlj1WqTcFO4pc47hbtflsRs4366OWPV2u1kj7YB0eoGCeOQj/GufYDnIUY9BhJVeJHQSBF4jN1CrAfcpFsjuNEDSj8pHgxFPAkMkum578poQe1O0n3xZf9tLvqSIbBzVneImNG1Rs/9jjxBmeh9bINlGNxKPtN/t9N0QrsrZKK5vhaD4JTXj5XqrgHIEPFIKs++2X5TFVvnRdESYoYn+yGf+9/HgMI+ltKv4fkPfHuif65cwb7px+oWV9t/jvyHMRr/Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0Hqt4b9mc6qsgWaLB9t91UVzflAV03FQ6d6JphpDKA=;
 b=Z64vHhi/5PhqHbhdJzTcmcUUeL3k/85NZweIskXkE0hgLB6AnRMClaZQ2mYCy1shHosOa1dpLIk1P02/QGlfI3QGm+7aWe3VNF+yoE3bvhOV/yPSx6jVOvZDgmR0XiDv8amf2jqbeHd5Kb8N80BUPSx673SP+KayVaE+GGz/r39++tiV7Wgf+rKavYzIyppYKtpwAP9l0lnv1qlidB7SE6fja5SUMJBBPFLryQkD9NaRarEu9EeL4ydxvDhrXSkcRDBw9v5GToeFHpcPlzGJ7gv2aWUWzKhDtBRxYmC0HTLYYdoD2a+Wfr0MT0wRq2tWnwVDLsOjeQN4Fr/hAtRxQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0Hqt4b9mc6qsgWaLB9t91UVzflAV03FQ6d6JphpDKA=;
 b=0r7HUqkrj1fxjzPYIOo1R4SbU82KNdBTahRS+MTfIZPAv5mPA/H132ZyZNxar1PEBK2RTNh5/MeTCR8+4QpQ4APOxbR7wzvLGkcNWMS1+C3G3PhCpR+n9B8pSGqycSKimrfISLUZtv45U1cdGbS9w0BxW59Gdab3min1chRHnAKUpeIW/zskPWSLuuHaqhhFOF7+5OwK+UdBS9gKesmv3NIBTY/pinPEQWXxSuou25X8tGec/q0fFaKGnnlzmTVKuVr5PB6s7A99dpP79Y5fxcPMxRcJw498hYur48gPOpi8Pc6kJcxQY3gk+xF2PdFyngEcMbpUmSu2GPV6rtFBqA==
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com (2603:10a6:20b:1c2::6)
 by AM5PR03MB2946.eurprd03.prod.outlook.com (2603:10a6:206:24::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Fri, 23 Oct
 2020 09:39:27 +0000
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8]) by AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8%5]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 09:39:27 +0000
From: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
To: Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "julien@xen.org" <julien@xen.org>
CC: "committers@xenproject.org" <committers@xenproject.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "vicooodin@gmail.com"
	<vicooodin@gmail.com>,
        "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "viktor.mitin.19@gmail.com" <viktor.mitin.19@gmail.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: Xen Coding style and clang-format
Thread-Topic: Xen Coding style and clang-format
Thread-Index: 
 AQHWlwq4nKYEhMN38U+xmvwRsutq+amA8joAgAAHUgCAAXyKAIAAENkAgAlxpgCACF7sgIABM44AgASIOQCAAAt9gIAAE8BwgAUk8gCAAYMogIAEOBYA
Date: Fri, 23 Oct 2020 09:39:27 +0000
Message-ID: <4d717bf66ed3f4874ed95061f6324d6395e66064.camel@epam.com>
References: <300923eb27aea4d19bff3c21bc51d749c315f8e3.camel@epam.com>
	 <4238269c-3bf4-3acb-7464-3d753f377eef@suse.com>
	 <E068C671-8009-4976-87B8-0709F6A5C3BF@citrix.com>
	 <b16dfb26e0916166180d5cbbe95278dc99277330.camel@epam.com>
	 <B64C5E67-7BEA-4C31-9089-AB8CC1F1E80F@citrix.com>
	 <3ff3f7d16cdab692178ce638da1a6b880817fb7e.camel@epam.com>
	 <64FE5ADB-2359-4A31-B1A1-925750515D98@citrix.com>
	 <b4d7e9a7-6c25-1f7f-86ce-867083beb81a@suse.com>
	 <4d4f351b152df2c50e18676ccd6ab6b4dc667801.camel@epam.com>
	 <5bd7cc00-c4c9-0737-897d-e76f22e2fd5b@xen.org>
	 <AM6PR03MB3687A99424FA9FD062F5FE4BF4030@AM6PR03MB3687.eurprd03.prod.outlook.com>
	 <alpine.DEB.2.21.2010191101250.12247@sstabellini-ThinkPad-T480s>
	 <b0f9c9e0-d43e-e05b-d4ab-40f3bf437643@xen.org>
In-Reply-To: <b0f9c9e0-d43e-e05b-d4ab-40f3bf437643@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.213.80]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad20fb3f-4cce-4a9c-4dc6-08d87737889d
x-ms-traffictypediagnostic: AM5PR03MB2946:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM5PR03MB2946BE253F62AE5986623D04F21A0@AM5PR03MB2946.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3RhQCjEesb9OjUahSTeiegClHbjQ+dkTgHSe4wq8XFoQklIK2TEBiWf/bYG5w4P9l4kv71g5Lizttd2O8Ob+pH8e5QGX0bgvYyONROJELHn7G8iWXipGCDAGLBcx+5qxE03gkeXqbUpXekcDfBewdRzPb1hQqb5srbpJUx5Q7v45cQHsXSX/TjvFtI8Z1NIBi8wGusoan6Wg5vhJMXrn2nyf5uq0pDt9l9n6kW8S3xnnZ6Oql646O7B+poZNNo9WIEkjDffFZMzRKgnbv8oOxwKxrzdT2v97Sv6T+YGGHDmLNBaKZNA0xTYhWeU03qRyYcvNRUJTRMKODQ+mK92sGg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6531.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(55236004)(54906003)(110136005)(6512007)(4326008)(86362001)(71200400001)(8676002)(4001150100001)(66946007)(316002)(83380400001)(76116006)(2616005)(5660300002)(478600001)(186003)(26005)(8936002)(36756003)(66556008)(66446008)(66476007)(6506007)(53546011)(107886003)(6486002)(64756008)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 j+A9Ty2XewwEcPKfqDxN49kb+qXIGPt66Ozh+qkXyUg9tF0Y/JJRUujGl/wI7kJ+0ALYqTQT40Y2lW2NeTxaZbjwfuAP4kvRPArniUCqmh1y4cVunobFXzLMbOeFLdBoo+7f2IjMes5QD3VE9ND6HgBeU4A57T/YfZaZNlDd3iotfxadjjLbgNrdpgZCqh/cANuf5+57GBp8yZvZofYe5wOx9z8GhEVVutUGitBPibifyJ/2siJbnwMrEkfdK4HFg+X4B50b8mD6tbXM+mlGIC/6lqnI+Swy6CBfqvdCy1WH/nW3cmRCZIOZjHFDlR4d8MEq7ENhBTdsm5DzfPtpg14Vb8KsMvFoJUgpS2Becys+K6sBlSV6LcufA+BrKc5BhPyKqqrGUeAweW+KLm5tfge9BlKlVMes1LJYxUmnrBQntxwMc7BQI5jJYpchQtJre/SAcKZb0phqlbJrF6lQQPJEwRI7mpYZd3nxa2As+3PqVDp7/TvjJjaK62ES/7lAd3NC37oxCS3zlXJ2hcZI7zhnWjLQJmLcjyNuQi5Rb1D/uHgRVBwV+Qf16pCQrH1J8owLxNFWklZhaFWbnHfopkjwtAu/jMGFhKlPXhckPHQoOs28KZzS9z8Xcl/x0rC/K0Qy/J2TTfN4SKo7Ws3RVQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <4EDE1D24A5CE004485C3F02D7F21119E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6531.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad20fb3f-4cce-4a9c-4dc6-08d87737889d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2020 09:39:27.0856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L4+CfWUUU16NWl5HDiJr+Qs/i5B9XBVjFK2wJhDHiHtlA+/BP1rzlIlRZQiWqqdfaTBiiFJomuPBJUmhv7BaVDzd7VRCfSbwbUrXzle34tA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR03MB2946
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.737
 definitions=2020-10-23_04:2020-10-23,2020-10-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1011 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010230066

SGkgYWxsLA0KDQpPbiBUdWUsIDIwMjAtMTAtMjAgYXQgMTg6MTMgKzAxMDAsIEp1bGllbiBHcmFs
bCB3cm90ZToNCj4gSGksDQo+IA0KPiBPbiAxOS8xMC8yMDIwIDE5OjA3LCBTdGVmYW5vIFN0YWJl
bGxpbmkgd3JvdGU6DQo+ID4gT24gRnJpLCAxNiBPY3QgMjAyMCwgQXJ0ZW0gTXlnYWlldiB3cm90
ZToNCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiA+ID4gU2VudDog0L/Rj9GC0L3QuNGG0LAsIDE2INC+
0LrRgtGP0LHRgNGPIDIwMjAg0LMuIDEzOjI0DQo+ID4gPiBUbzogQW5hc3Rhc2lpYSBMdWtpYW5l
bmtvIDxBbmFzdGFzaWlhX0x1a2lhbmVua29AZXBhbS5jb20+OyANCj4gPiA+IGpiZXVsaWNoQHN1
c2UuY29tOyBHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20NCj4gPiA+IENjOiBBcnRlbSBNeWdhaWV2
IDxBcnRlbV9NeWdhaWV2QGVwYW0uY29tPjsgdmljb29vZGluQGdtYWlsLmNvbTsgDQo+ID4gPiB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IGNvbW1pdHRlcnNAeGVucHJvamVjdC5vcmc7
IA0KPiA+ID4gdmlrdG9yLm1pdGluLjE5QGdtYWlsLmNvbTsgVm9sb2R5bXlyIEJhYmNodWsgPA0K
PiA+ID4gVm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+DQo+ID4gPiBTdWJqZWN0OiBSZTogWGVu
IENvZGluZyBzdHlsZSBhbmQgY2xhbmctZm9ybWF0DQo+ID4gPiANCj4gPiA+ID4gSGksDQo+ID4g
PiA+IA0KPiA+ID4gPiBPbiAxNi8xMC8yMDIwIDEwOjQyLCBBbmFzdGFzaWlhIEx1a2lhbmVua28g
d3JvdGU6DQo+ID4gPiA+ID4gVGhhbmtzIGZvciB5b3VyIGFkdmljZXMsIHdoaWNoIGhlbHBlZCBt
ZSBpbXByb3ZlIHRoZSBjaGVja2VyLg0KPiA+ID4gPiA+IEkNCj4gPiA+ID4gPiB1bmRlcnN0YW5k
IHRoYXQgdGhlcmUgYXJlIHN0aWxsIHNvbWUgZGlzYWdyZWVtZW50cyBhYm91dCB0aGUNCj4gPiA+
ID4gPiBmb3JtYXR0aW5nLCBidXQgYXMgSSBzYWlkIGJlZm9yZSwgdGhlIGNoZWNrZXIgY2Fubm90
IGJlIHZlcnkNCj4gPiA+ID4gPiBmbGV4aWJsZQ0KPiA+ID4gPiA+IGFuZCB0YWtlIGludG8gYWNj
b3VudCBhbGwgdGhlIGF1dGhvcidzIGlkZWFzLg0KPiA+ID4gPiANCj4gPiA+ID4gSSBhbSBub3Qg
c3VyZSB3aGF0IHlvdSByZWZlciBieSAiYXV0aG9yJ3MgaWRlYXMiIGhlcmUuIFRoZQ0KPiA+ID4g
PiBjaGVja2VyDQo+ID4gPiA+IHNob3VsZCBmb2xsb3cgYSBjb2Rpbmcgc3R5bGUgKFhlbiBvciBh
IG1vZGlmaWVkIHZlcnNpb24pOg0KPiA+ID4gPiAgICAgIC0gQW55dGhpbmcgbm90IGZvbGxvd2lu
ZyB0aGUgY29kaW5nIHN0eWxlIHNob3VsZCBiZQ0KPiA+ID4gPiBjb25zaWRlcmVkIGFzDQo+ID4g
PiA+IGludmFsaWQuDQo+ID4gPiA+ICAgICAgLSBBbnl0aGluZyBub3Qgd3JpdHRlbiBpbiB0aGUg
Y29kaW5nIHN0eWxlIHNob3VsZCBiZSBsZWZ0DQo+ID4gPiA+IHVudG91Y2hlZC91bmNvbW1lbnRl
ZCBieSB0aGUgY2hlY2tlci4NCj4gPiA+ID4gDQo+ID4gPiANCj4gPiA+IEFncmVlDQo+ID4gPiAN
Cj4gPiA+ID4gPiBJIHN1Z2dlc3QgdXNpbmcgdGhlDQo+ID4gPiA+ID4gY2hlY2tlciBub3QgYXMg
YSBtYW5kYXRvcnkgY2hlY2ssIGJ1dCBhcyBhbiBpbmRpY2F0aW9uIHRvIHRoZQ0KPiA+ID4gPiA+
IGF1dGhvciBvZg0KPiA+ID4gPiA+IHBvc3NpYmxlIGZvcm1hdHRpbmcgZXJyb3JzIHRoYXQgaGUg
Y2FuIGNvcnJlY3Qgb3IgaWdub3JlLg0KPiA+ID4gPiANCj4gPiA+ID4gSSBjYW4gdW5kZXJzdGFu
ZCB0aGF0IHNob3J0IHRlcm0gd2Ugd291bGQgd2FudCB0byBtYWtlIGl0DQo+ID4gPiA+IG9wdGlv
bmFsIHNvDQo+ID4gPiA+IGVpdGhlciB0aGUgY29kaW5nIHN0eWxlIG9yIHRoZSBjaGVja2VyIGNh
biBiZSB0dW5lZC4gQnV0IEkNCj4gPiA+ID4gZG9uJ3QgdGhpbmsNCj4gPiA+ID4gdGhpcyBpcyBh
biBpZGVhbCBzaXR1YXRpb24gdG8gYmUgaW4gbG9uZyB0ZXJtLg0KPiA+ID4gPiANCj4gPiA+ID4g
VGhlIGdvYWwgb2YgdGhlIGNoZWNrZXIgaXMgdG8gYXV0b21hdGljYWxseSB2ZXJpZnkgdGhlIGNv
ZGluZw0KPiA+ID4gPiBzdHlsZSBhbmQNCj4gPiA+ID4gZ2V0IGl0IGNvbnNpc3RlbnQgYWNyb3Nz
IFhlbi4gSWYgd2UgbWFrZSBpdCBvcHRpb25hbCBvciBpdCBpcw0KPiA+ID4gPiAidW5yZWxpYWJs
ZSIsIHRoZW4gd2UgbG9zZSB0aGUgdHdvIGJlbmVmaXRzIGFuZCBwb3NzaWJseQ0KPiA+ID4gPiBp
bmNyZWFzZSB0aGUNCj4gPiA+ID4gY29udHJpYnV0b3IgZnJ1c3RyYXRpb24gYXMgdGhlIGNoZWNr
ZXIgd291bGQgc2F5IEEgYnV0IHdlIG5lZWQNCj4gPiA+ID4gQi4NCj4gPiA+ID4gDQo+ID4gPiA+
IFRoZXJlZm9yZSwgd2UgbmVlZCB0byBtYWtlIHN1cmUgdGhlIGNoZWNrZXIgYW5kIHRoZSBjb2Rp
bmcNCj4gPiA+ID4gc3R5bGUgbWF0Y2guDQo+ID4gPiA+IEkgZG9uJ3QgaGF2ZSBhbnkgb3Bpbmlv
bnMgb24gdGhlIGFwcHJvYWNoIHRvIGFjaGlldmUgdGhhdC4NCj4gPiA+IA0KPiA+ID4gT2YgdGhl
IGxpc3Qgb2YgcmVtYWluaW5nIGlzc3VlcyBmcm9tIEFuYXN0YXNpaWEsIGxvb2tzIGxpa2Ugb25s
eQ0KPiA+ID4gaXRlbXMgNQ0KPiA+ID4gYW5kIDYgYXJlIGNvbmZvcm0gdG8gb2ZmaWNpYWwgWGVu
IGNvZGluZyBzdHlsZS4gQXMgZm9yIHJlbWFpbm5pbmcNCj4gPiA+IG9uZXMsDQo+ID4gPiBJIHdv
dWxkIGxpa2UgdG8gc3VnZ2VzdCBkaXNhYmxpbmcgdGhvc2UgdGhhdCBhcmUgY29udHJvdmVyc2lh
bA0KPiA+ID4gKGl0ZW1zIDEsDQo+ID4gPiAyLCA0LCA4LCA5LCAxMCkuIE1heWJlIHdlIHdhbnQg
dG8gaGF2ZSBmdXJ0aGVyIGRpc2N1c3Npb24gb24NCj4gPiA+IHJlZmluaW5nDQo+ID4gPiBjb2Rp
bmcgc3R5bGUsIHdlIGNhbiB1c2UgdGhlc2UgYXMgc3RhcnRpbmcgcG9pbnQuIElmIHdlIGFyZSBv
cGVuDQo+ID4gPiB0bw0KPiA+ID4gZXh0ZW5kaW5nIHN0eWxlIG5vdywgSSB3b3VsZCBzdWdnZXN0
IHRvIGFkZCBydWxlcyB0aGF0IHNlZW0gdG8gYmUNCj4gPiA+IG1lYW5pbmdmdWwgKGl0ZW1zIDMs
IDcpIGFuZCBrZWVwIHRoZW0gaW4gY2hlY2tlci4NCj4gPiANCj4gPiBHb29kIGFwcHJvYWNoLiBZ
ZXMsIEkgd291bGQgbGlrZSB0byBrZWVwIDMsIDcgaW4gdGhlIGNoZWNrZXIuDQo+ID4gDQo+ID4g
SSB3b3VsZCBhbHNvIGtlZXAgOCBhbmQgYWRkIGEgc21hbGwgbm90ZSB0byB0aGUgY29kaW5nIHN0
eWxlIHRvIHNheQ0KPiA+IHRoYXQNCj4gPiBjb21tZW50cyBzaG91bGQgYmUgYWxpZ25lZCB3aGVy
ZSBwb3NzaWJsZS4NCj4gDQo+ICsxIGZvciB0aGlzLiBBbHRob3VnaCwgSSBkb24ndCBtaW5kIHRo
ZSBjb2Rpbmcgc3R5bGUgdXNlZCBhcyBsb25nIGFzDQo+IHdlIA0KPiBoYXZlIGEgY2hlY2tlciBh
bmQgdGhlIGNvZGUgaXMgY29uc2lzdGVudCA6KS4NCj4gDQo+IENoZWVycywNCj4gDQpUaGFuayB5
b3UgZm9yIGFkdmljZXMgOikNCk5vdyBJJ20gdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgdGhlIG9wdGlv
biB0aGF0IG5lZWRzIHRvIGJlIGNvcnJlY3RlZCBmb3INCnRoZSBjaGVja2VyIHRvIHdvcmsgY29y
cmVjdGx5Og0KV3JhcHBpbmcgYW4gb3BlcmF0aW9uIHRvIGEgbmV3IGxpbmUgd2hlbiB0aGUgc3Ry
aW5nIGxlbmd0aCBpcyBsb25nZXINCnRoYW4gdGhlIGFsbG93ZWQNCi0gICAgc3RhdHVzID0gYWNw
aV9nZXRfdGFibGUoQUNQSV9TSUdfU1BDUiwgMCwNCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKHN0cnVjdCBhY3BpX3RhYmxlX2hlYWRlciAqKikmc3Bjcik7DQorICAgIHN0YXR1cyA9DQor
ICAgICAgICBhY3BpX2dldF90YWJsZShBQ1BJX1NJR19TUENSLCAwLCAoc3RydWN0IGFjcGlfdGFi
bGVfaGVhZGVyDQoqKikmc3Bjcik7DQpBcyBpdCB0dXJuZWQgb3V0LCB0aGlzIGNhc2UgaXMgcXVp
dGUgcmFyZSBhbmQgdGhlIHJ1bGUgZm9yIHRyYW5zZmVycmluZw0KcGFyYW1ldGVycyB3b3JrcyBj
b3JyZWN0bHkgaW4gb3RoZXIgY2FzZXM6DQotICAgIHN0YXR1cyA9IGFjcGlfZ2V0X3RhYmxlKEFD
UElfU0lHX1NQQ1IsIDAsICZzcGNyLCBBQ1BJX1NJR19TUEMsIDAsDQpBQ1BJX1NJR19TUCwgMCk7
DQorICAgIHN0YXR1cyA9IGFjcGlfZ2V0X3RhYmxlKEFDUElfU0lHX1NQQ1IsIDAsICZzcGNyLCBB
Q1BJX1NJR19TUEMsIDAsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFDUElfU0lHX1NQ
LCAwKTsNClRodXMgdGhlIGNoZWNrZXIgZG9lcyBub3Qgd29yayBjb3JyZWN0bHkgaW4gdGhlIGNh
c2Ugd2hlbiB0aGUgcHJvdG90eXBlDQpwYXJhbWV0ZXIgc3RhcnRzIHdpdGggYSBwYXJlbnRoZXNp
cy4gSSdtIGdvaW5nIHRvIGFzayBjbGFuZyBjb21tdW5pdHkNCmlzIHRoaXMgYmVoYXZpb3IgaXMg
ZXhwZWN0ZWQgb3IgbWF5YmUgaXQncyBhIGJ1Zy4NCg0KUmVnYXJkcywNCkFuYXN0YXNpaWENCg==

