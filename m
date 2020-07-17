Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AFC223AB9
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 13:42:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwOkg-0008Or-S2; Fri, 17 Jul 2020 11:42:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6P0s=A4=epam.com=prvs=5467d6a743=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jwOkf-0008Om-78
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 11:42:05 +0000
X-Inumbo-ID: 88007af8-c822-11ea-95d4-12813bfff9fa
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88007af8-c822-11ea-95d4-12813bfff9fa;
 Fri, 17 Jul 2020 11:42:02 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06HBfVxf012038; Fri, 17 Jul 2020 11:41:57 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 by mx0a-0039f301.pphosted.com with ESMTP id 32a1nrx44u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 11:41:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIfWzTERBW5KHbenM2b0UOPO0Vj/A8w6GPXowLBSVuzsxxrarAtLlDYtjJ7XUzKZouF7GW2h8AcTKDr8UulMcj0I4jp6GQzgJRsuRi6hwgcoIZS9N9dB1h7xAgF7m6bz0emQs86DoC2Ul2wLQEat1LlHLwQuZGzkmSBKYwAHzYaP+F4CW3mkIqAyP1Rfy7C3pylvvKPwXpc6Y+6Py0U+Uq0GlUNQmMwrfTi4G+E5aiFEfu5mZFYEs5F3/InIcH7VhuB2hgH5fCHbC6uGzi0DjMLfCiuWRwZEY+A1yKLumRnO6mNSCY3J8UphvnIYIexnDRdra4Za730RLAVbXAv3cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RIiAIK16zN+pwbDHiqilk8OyUtBGYsWq8/wR1DF/+Y=;
 b=Yjoq4qd7n0VMMVdt8Q5I+4gVezOnQMtebupv7+UN2U+914VYNBpWr2AbEC4eQsuSuu9RrdFSb4uIiyCfj6Yr4Ucjx11vkOTdck93kfdQEoVhxetOOB76rFaGyDxqo43u1rAslUipSZ5MG13vTkFPVHMhaqOymLqdJ1vGRiUA/j5YXaAJ9KoMeQ/llmvVgoXvI7/LJw7/C77FxlBAXhUSvkyU30UTa9ebgOlnhX2sL75F96J7FnQ8aW7LatnY0dO24hSYfrtkbwg6cjYAxZ6RQPYyCRPMZfPJCjtH2zTXuKiO164Z5d8u1LrYtbUXbxkrxuDegp5MRUPTKszRlORpkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RIiAIK16zN+pwbDHiqilk8OyUtBGYsWq8/wR1DF/+Y=;
 b=LknPjq56u7A2QVAmPNFcak2tUHGh6ytJ54tvTm83cn3rzXq5BH4coZTYICajxvGfojLfuH+CcGfv2+89Seqg1Tc4eBr7m7yYFhh/i53p3Hi7MoVjqv0rruUfPZCID6IiwN2p+MU0No9FxIenWYmMjc+NNazgzh6paUyUyUFw44VpYFgKrBbAPek1FtgIqw/EVLDaHlNqY2LOH9/mSKHHCvFyy+GSp1evxJK2pxz5IusooANyAw7qORE8bfEvZzwwbKkTU0/DPF275A8ZC/+nfCRJFizMfEq2XH/XTvPDWSUO9g0S/XWYq9He0XqTozLURY1CzvCdk7/XFHMgYDHiLQ==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3425.eurprd03.prod.outlook.com (2603:10a6:208:3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Fri, 17 Jul
 2020 11:41:53 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508%9]) with mapi id 15.20.3195.022; Fri, 17 Jul 2020
 11:41:53 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Thread-Topic: RFC: PCI devices passthrough on Arm design proposal
Thread-Index: AQHWXA26EtJZFfhoUEGdjsOmzYm6XqkLokCAgAAEKwA=
Date: Fri, 17 Jul 2020 11:41:53 +0000
Message-ID: <0cfe750e-2213-d6d3-80c5-494ede727304@epam.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <alpine.DEB.2.21.2007161258160.3886@sstabellini-ThinkPad-T480s>
 <BB4645DF-A040-4912-AC35-C98105917FD5@arm.com>
 <f69f86dc-7a8c-4c25-c059-0e391de51d7f@epam.com>
 <547d91e8-a6fe-6430-b020-f9c550bfc22b@xen.org>
In-Reply-To: <547d91e8-a6fe-6430-b020-f9c550bfc22b@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c775fe10-41ea-44dd-35c0-08d82a4666f1
x-ms-traffictypediagnostic: AM0PR0302MB3425:
x-microsoft-antispam-prvs: <AM0PR0302MB3425C5A416F7CE40E7D59023E77C0@AM0PR0302MB3425.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vQzahmauYlanfE25dCjemKfa+JZGE39EM214gmB0Fw6rUeG3ii1ylfsCVUuo9QOjFlD5TXcqiaxNLCR7T1OS/Q+O0dnf1Zl/rSizlCtr/ITvUZA1UCQlLLtDJrqSQPp2EQGwzqocHtDj1MOfda3iqrcZ6ymX64f9bA7IxRU6FmtTJpXxCa9NO2/JtI4RXX5Uvchfu+Tr9H7duzCaL/lkACngEvAz2TMKDFXi1yYfR0QVFMUBHw8ZsNz02yoso5JnrwXhHXcQbhpvkFE1ROR0eVqMr6hRDAXgFVbUDvHESUlcLwmQs6eE3r3fbBWMyrROVHv92Ij7oYzWNmv9a1cHag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(4326008)(316002)(478600001)(8676002)(2906002)(91956017)(110136005)(31696002)(54906003)(76116006)(8936002)(6512007)(64756008)(66446008)(66476007)(66556008)(71200400001)(83380400001)(186003)(31686004)(2616005)(6486002)(53546011)(6506007)(66946007)(86362001)(26005)(36756003)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: WBGeEKacMFbouKDslMpx/xREzUONxm8mDVzIsWSmZ43deIbteocyIRpCErePch53J4tPelXAGnkIFNhBVH2jphSpiYQAzEOjwQxfAQN0/vc1UL793GK51YKs3bDUYW631Aa9ebE/JCl1ekZ4jYIP5hM2W/yyxItCSTT7l0+do03yTnsbONkSvygYxe2HfjzIUXrZGORYxaFMDVv0rMSG2METsY3QVA0F31cXgNrtm23DHnu/Qo6E/6qQPjV5mU0OQlbeQuap1XlxwvRcWHU3wPCt793tW/UETULS2rD3zCBDhQENT5lvoowFtCDDvkwWNCgEPqJTSTdgCpPTQRHHaee1U1IxSpnMSWofhzhZKHuMkH43PBZ1M94e/AVfAmOCQRR1XPZQnf8/+psW1N9PecxJA7p99RGresgAd8nd7BZ+djJysrghztvEm5HYZSgimwM1e9Ezwpx3z6GyQF5gWqRRuW1+aBu1Ew95RIRYgNk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E92BDBDA81883048B0B7E3A1C2079E98@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c775fe10-41ea-44dd-35c0-08d82a4666f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 11:41:53.5225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: amQ/7nsy0hMERTCMpM46a+gf2TYuftnINGObIIoeU8SnvoN7ctTz86BRTWkUbVE63voX3mTcusGZmZhg0wpJdnAR+riqGR4VAp3CSJZFZCcRqNffbCv2rOW/NWChbH2m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3425
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_06:2020-07-17,
 2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 suspectscore=0 clxscore=1011 malwarescore=0 adultscore=0 spamscore=0
 mlxlogscore=605 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007170085
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiA3LzE3LzIwIDI6MjYgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToNCj4NCj4NCj4gT24gMTcv
MDcvMjAyMCAwODo0MSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IFdlIG5l
ZWQgdG8gY29tZSB1cCB3aXRoIHNvbWV0aGluZyBzaW1pbGFyIGZvciBkb20wbGVzcyB0b28uIEl0
IGNvdWxkIGJlDQo+Pj4+IGV4YWN0bHkgdGhlIHNhbWUgdGhpbmcgKGEgbGlzdCBvZiBCREZzIGFz
IHN0cmluZ3MgYXMgYSBkZXZpY2UgdHJlZQ0KPj4+PiBwcm9wZXJ0eSkgb3Igc29tZXRoaW5nIGVs
c2UgaWYgd2UgY2FuIGNvbWUgdXAgd2l0aCBhIGJldHRlciBpZGVhLg0KPj4+IEZ1bGx5IGFncmVl
Lg0KPj4+IE1heWJlIGEgdHJlZSB0b3BvbG9neSBjb3VsZCBhbGxvdyBtb3JlIHBvc3NpYmlsaXRp
ZXMgKGxpa2UgZ2l2aW5nIEJBUiB2YWx1ZXMpIGluIHRoZSBmdXR1cmUuDQo+Pj4+DQo+Pj4+PiAj
IEVtdWxhdGVkIFBDSSBkZXZpY2UgdHJlZSBub2RlIGluIGxpYnhsOg0KPj4+Pj4NCj4+Pj4+IExp
YnhsIGlzIGNyZWF0aW5nIGEgdmlydHVhbCBQQ0kgZGV2aWNlIHRyZWUgbm9kZSBpbiB0aGUgZGV2
aWNlIHRyZWUgdG8gZW5hYmxlIHRoZSBndWVzdCBPUyB0byBkaXNjb3ZlciB0aGUgdmlydHVhbCBQ
Q0kgZHVyaW5nIGd1ZXN0IGJvb3QuIFdlIGludHJvZHVjZWQgdGhlIG5ldyBjb25maWcgb3B0aW9u
IFt2cGNpPSJwY2lfZWNhbSJdIGZvciBndWVzdHMuIFdoZW4gdGhpcyBjb25maWcgb3B0aW9uIGlz
IGVuYWJsZWQgaW4gYSBndWVzdCBjb25maWd1cmF0aW9uLCBhIFBDSSBkZXZpY2UgdHJlZSBub2Rl
IHdpbGwgYmUgY3JlYXRlZCBpbiB0aGUgZ3Vlc3QgZGV2aWNlIHRyZWUuDQo+Pj4+Pg0KPj4+Pj4g
QSBuZXcgYXJlYSBoYXMgYmVlbiByZXNlcnZlZCBpbiB0aGUgYXJtIGd1ZXN0IHBoeXNpY2FsIG1h
cCBhdCB3aGljaCB0aGUgVlBDSSBidXMgaXMgZGVjbGFyZWQgaW4gdGhlIGRldmljZSB0cmVlIChy
ZWcgYW5kIHJhbmdlcyBwYXJhbWV0ZXJzIG9mIHRoZSBub2RlKS4gQSB0cmFwIGhhbmRsZXIgZm9y
IHRoZSBQQ0kgRUNBTSBhY2Nlc3MgZnJvbSBndWVzdCBoYXMgYmVlbiByZWdpc3RlcmVkIGF0IHRo
ZSBkZWZpbmVkIGFkZHJlc3MgYW5kIHJlZGlyZWN0cyByZXF1ZXN0cyB0byB0aGUgVlBDSSBkcml2
ZXIgaW4gWGVuLg0KPj4+Pj4NCj4+Pj4+IExpbWl0YXRpb246DQo+Pj4+PiAqIE9ubHkgb25lIFBD
SSBkZXZpY2UgdHJlZSBub2RlIGlzIHN1cHBvcnRlZCBhcyBvZiBub3cuDQo+Pj4+IEkgdGhpbmsg
dnBjaT0icGNpX2VjYW0iIHNob3VsZCBiZSBvcHRpb25hbDogaWYgcGNpPVsgIlBDSV9TUEVDX1NU
UklORyIsDQo+Pj4+IC4uLl0gaXMgc3BlY2lmaWZlZCwgdGhlbiB2cGNpPSJwY2lfZWNhbSIgaXMg
aW1wbGllZC4NCj4+Pj4NCj4+Pj4gdnBjaT0icGNpX2VjYW0iIGlzIG9ubHkgdXNlZnVsIG9uZSBk
YXkgaW4gdGhlIGZ1dHVyZSB3aGVuIHdlIHdhbnQgdG8gYmUNCj4+Pj4gYWJsZSB0byBlbXVsYXRl
IG90aGVyIG5vbi1lY2FtIGhvc3QgYnJpZGdlcy4gRm9yIG5vdyB3ZSBjb3VsZCBldmVuIHNraXAN
Cj4+Pj4gaXQuDQo+Pj4gVGhpcyB3b3VsZCBjcmVhdGUgYSBwcm9ibGVtIGlmIHhsIGlzIHVzZWQg
dG8gYWRkIGEgUENJIGRldmljZSBhcyB3ZSBuZWVkIHRoZSBQQ0kgbm9kZSB0byBiZSBpbiB0aGUg
RFRCIHdoZW4gdGhlIGd1ZXN0IGlzIGNyZWF0ZWQuDQo+Pj4gSSBhZ3JlZSB0aGlzIGlzIG5vdCBu
ZWVkZWQgYnV0IHJlbW92aW5nIGl0IG1pZ2h0IGNyZWF0ZSBtb3JlIGNvbXBsZXhpdHkgaW4gdGhl
IGNvZGUuDQo+Pg0KPj4gSSB3b3VsZCBzdWdnZXN0IHdlIGhhdmUgaXQgZnJvbSBkYXkgMCBhcyB0
aGVyZSBhcmUgcGxlbnR5IG9mIEhXIGF2YWlsYWJsZSB3aGljaCBpcyBub3QgRUNBTS4NCj4+DQo+
PiBIYXZpbmcgdnBjaSBhbGxvd3Mgb3RoZXIgYnJpZGdlcyB0byBiZSBzdXBwb3J0ZWQNCj4NCj4g
U28gSSBjYW4gdW5kZXJzdGFuZCB3aHkgeW91IHdvdWxkIHdhbnQgdG8gaGF2ZSBhIGRyaXZlciBm
b3Igbm9uLUVDQU0gaG9zdCBQQ0kgY29udHJvbGxlci4gSG93ZXZlciwgd2h5IHdvdWxkIHlvdSB3
YW50IHRvIGVtdWxhdGUgYSBub24tRUNBTSBQQ0kgY29udHJvbGxlciB0byBhIGd1ZXN0Pw0KSW5k
ZWVkLiBObyBuZWVkIHRvIGVtdWxhdGUgbm9uLUVDQU0NCj4NCj4gQ2hlZXJzLA0KPg==

