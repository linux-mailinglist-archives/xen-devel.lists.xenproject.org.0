Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC88200988
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 15:06:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmGir-0007En-2G; Fri, 19 Jun 2020 13:06:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oDvs=AA=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jmGiq-0007Ei-BM
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 13:06:20 +0000
X-Inumbo-ID: aa034316-b22d-11ea-bca7-bc764e2007e4
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::615])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa034316-b22d-11ea-bca7-bc764e2007e4;
 Fri, 19 Jun 2020 13:06:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmo23AvDRLbD9rNDDO2LXj1x50WFDfJ7XNCYNNhOCQLsQ+m8IBgpNS+OGIGSeUj1v5vfqkHF+OXQddys70crh/y6Q3tQyC6ToArqGFbJVdn8JhiGFaiBeYuDRwa1bBR5rJM7Bz2mmymbU/QSTNJxdTRw3qU2l873pkCYWUrlA5YN+ckrzcYH693TugyeayyGEy7EQWH84j7coZoUAi6xfxEG/5HPRSyGDFksF1J4cEG9ZovOpMYYIY+ahM1X9YKMl2ng70Wan88Ls58xy/geetw04a/NoCHhoiUFRTyP/Pkl7OS9TO6lIoLPJstxNiWWX8SF1WuC0PiT1M0oTuqw/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4IG927phKcKuWZha4ldwB8ecfLzlDq4Hy3RACrniXk=;
 b=ddZ7jZq8rlKGdKPlI4ySljsSgGIJwJ2YUgFuXsDD+9N8AmYUTkOfKZatIb9s6QyezKRWKYGH/7DtSjoy1UweS/zTQvlwyJjKyrrADkTxI6FPf8gc1CYmpFq6B0ayy75EB/Ve22xLdPREg+QXXUJCF+O9T+Frar019lRHLLz2FEz+f9N3EUq7ZPpUGT1GdogA0dlduQx8yUAXrXDub6uM81wYfYlLhljNfaP376r5wCezwC0msq9In/tWHfvv6KjFylgyr1QMhy4lE6WIwBIb/o5dhDXssNhwLqqrByLzS9U5feUz3eMAil256PkfWZf/nsRfKz2tqBkONqqbcNeLcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4IG927phKcKuWZha4ldwB8ecfLzlDq4Hy3RACrniXk=;
 b=L5G13lbb6lJarkGOxPsAIdfvaxiFXzN81i81TXEz0lS/NUGOxPhGriISNOyRRHGQwp3PzfdEGexouQGmA3e6yhnoJjIOS913xqJIdVRkAtiz7UQ9H+0k/UJe9dTKu8kkRE7spZ0iyHh2MPIXtbFjT9Et9A18hz3dL+HLheuJSR/9yeDE3XNTulCYt1YDd64aHnhSNo2sYUrqGNIyra+OBGJ6LsnHHxSJ0QrtbmS5wkDpgfeLqYZ7jDcBtxKdd3xDkUGzAYgzZxUErc95niubJXjEUR4g6TubTO+pfmaGIxhUAJDRYAsQb6Wvve08seO9QhAnP3U/uaDPaml0MTQb7Q==
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com (2603:10a6:803:72::14)
 by VI1PR03MB3920.eurprd03.prod.outlook.com (2603:10a6:803:6a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 13:06:17 +0000
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4]) by VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4%7]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 13:06:17 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: UEFI support in ARM DomUs
Thread-Topic: UEFI support in ARM DomUs
Thread-Index: AQHWOoSI1wnhumD+IkWBnAQX9mudyajIlWsAgBVWbwCAAJ62gIAAeBOAgAANxQCAAOXggIAABCWAgAABUwCAAAIogIAAAeMA
Date: Fri, 19 Jun 2020 13:06:17 +0000
Message-ID: <424cfbdc-0744-fcf7-5bb4-52aca2357df7@epam.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
 <17a14578-6fc7-925d-6f69-8b2fcbf40ff3@epam.com>
 <9d4a6e78-49d3-01c3-251b-6d66f56c2761@xen.org>
 <ebf32205-55b0-8a40-1935-d3591be058ce@epam.com>
 <d7334aea-363e-49f6-f8c3-336e3c20eb0f@xen.org>
In-Reply-To: <d7334aea-363e-49f6-f8c3-336e3c20eb0f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13403899-cc69-4d96-ad96-08d814518d96
x-ms-traffictypediagnostic: VI1PR03MB3920:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR03MB39206D13A6CA741B41753F2BE7980@VI1PR03MB3920.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FUYpAmmwHP1ThhsxTlMrFZxh0Zw47cfdQdw8raqLA767hFq2uptIdQsKrKEuvz+Bm8WCyPv1PViZlT1bePXUGBaX3f2qTu5fdimIN1sGDsyUtbAMUgW56rRUlrQodkfPF3paEnT+dOTSn9g3SKRqiApZj46RNiUYfYRVe/lzC9C/nBDNGVQxFtxOmphb+3cb84k/ZdkoV9WjgFIFDL0QJPMuUSLl898Ex7/HLudLGyGoS0umZscQ2g8HY9J7AsqhrfB7Ijcy9MuvRo5OR01qstgDXuBZGKLGfE9gBRTJszfi8+4bL4sQmlY2xDJx2pTMVetWBfWh9NN4yiC3LVCVKw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB3998.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(2906002)(26005)(66946007)(91956017)(66476007)(64756008)(66556008)(66446008)(76116006)(54906003)(4326008)(5660300002)(6512007)(110136005)(316002)(186003)(6506007)(53546011)(36756003)(478600001)(2616005)(83380400001)(31686004)(86362001)(31696002)(8936002)(71200400001)(8676002)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Z+vRQlwu+ABVk6ZuIt0vqAfcd5jKwo7Fcn6BwoseugmBgujyHKyPzdsMRlNqn9iJHjnmO3W6qxy5hfE5R7vKKi7v2uI/ccbWqV7X2VuNmw96OzowEOWI6zlpEAOwv4IBWiClvj2HAbDsRttoUDhE9buySzwQZQVa0808JPs1Mm9gexiCCRNsn+T1LtYnxmcoU3Swpl5zrVf7aENwx07eLfGDmEkJxUIliVQFiUwhjDMZ0WEVCIT6bQeT2O703QXTgIl8CyfYNQybJ4p3cWZNmKJjQlXlOmxdsV5rp8ysonm7MAqvWwp7A/2xilf3YX0w0HkASCEwaGQ4pLh7EI5Qyo60iY+SxxW1ERpEPZyZYSsPdGISoxrWBwBcVfIO0YF8NWs+WKH/O7cECfTFigdl+oKFOpoUl9c6PDb7ubXP3eN9p+kgTdDXmM+vneTzCe5B4SJVQyZcHWtNY1Cs+i8or6oTtkleuSXU7Xk9IC6ZRmM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD5906118C7EFD47B0758E6CE9D6A96D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13403899-cc69-4d96-ad96-08d814518d96
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 13:06:17.1724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bkmTD/7D36MmZAbV11rq5sgpAdBBe+p4mErvHxRP1znhk+LFfrsIuivN4ETqYbrJCP1mRiK/2c3TeRmKHrCc/cJHo2ThAMBxKuZQKFHq+thhbW4vpkKqOcf7HyrH75y2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3920
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
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiA2LzE5LzIwIDM6NTkgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+DQo+IE9u
IDE5LzA2LzIwMjAgMTM6NTEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24g
Ni8xOS8yMCAzOjQ3IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4gVGhleSB3aWxsIG5vdCBi
ZSBhdmFpbGFibGUgZnJvbSB0aGUgZmR0LCBidXQgeW91IGNhbiByZXRyaWV2ZSB0aGVtIHdpdGgg
YW4gaHlwZXJ2aXNvciBjYWxsIChzZWUgSFZNX1BBUkFNX1NUT1JFX1BGTiwgSFZNX1BBUkFNX0NP
TlNPTEVfUEZOKS4NCj4+IFllcywgYW5kIGl0IHVzZWQgaW4gdGhlIHJlbGV2YW50IHBpZWNlcyBv
ZiBjb2RlIChoeXAgY2FsbHMpDQo+Pj4gT25lIHF1ZXN0aW9uIHRob3VnaCwgd2h5IGRvIHlvdSBu
ZWVkIHRvIG1hcCB0aGVtIGluIGFkdmFuY2U/IENvdWxkbid0IHlvdSBtYXAgdGhlbSBvbiBkZW1h
bmQ/DQo+Pg0KPj4gV2VsbCwgd2UgbmVlZCB0byBhdCBsZWFzdCBlc3RpbWF0ZSB0aGUgcGdfdGFi
bGUgc2l6ZSBzbyB3ZSBjYW4gcmVzZXJ2ZSBhbmQgYWxsb2NhdGUgbWVtb3J5IGxhdGVyLA0KPg0K
PiBPaCwgc28gVS1ib290IGRvZXNuJ3Qgc3VwcG9ydCBydW50aW1lIHBhZ2UtdGFibGUgdGFibGUg
YWxsb2NhdGlvbi4gSXMgdGhhdCByaWdodD8NCkFzIHBlciBteSB1bmRlcnN0YW5kaW5nIG5vLCB3
ZSBwcm92aWRlIGEgbWVtb3J5IG1hcCBhbmQgdGhlIHRhYmxlcyBhcmUgYWxsb2NhdGVkIGJlZm9y
ZWhhbmQNCj4NCj4+DQo+PiBzbyBJIGhhdmUgdG8gcHJvdmlkZSBtZW1vcnkgcmFuZ2UgZnJvbSBl
aXRoZXIgYnkgY29kaW5nIGEgY29uc3RhbnQgb3IgbG9va2luZyBpbnRvIHRoZSBkZXZ0cmVlIGF0
DQo+Pg0KPj4gaHlwZXJ2aXNvciB7IHJlZyA9IDw+OyB9LiBJdCBpcyBhIGJpdCB0cmlja3kgdGhv
dWdoDQo+DQo+IExvb2tpbmcgZm9yIGEgbm9kZSBpbiB0aGUgZGV2aWNlLXRyZWUgc2hvdWxkbid0
IGJlIHRvbyBkaWZmaWN1bHQgZ2l2ZW4gdGhhdCB5b3UgaGF2ZSBmZHRfKiBhdmFpbGFibGUuDQo+
DQo+IEhvd2V2ZXIsIHBsZWFzZSBub3QgdGhhdCA8cmVnPiBkb2Vzbid0IHJlZmVyIHRvIHRoZSBn
dWVzdCBtYWdpYyBwYWdlcy4gSW5zdGVhZCwgaXQgcHJvdmlkZXMgYSByZWdpb24geW91IGNhbiB1
c2UgZm9yIG1hcHBpbmcgdGhlIGdyYW50LXRhYmxlIGZyYW1lcw0KDQpJbmRlZWQsIHRoaXMgaXMg
aW4gbXkgY2FzZSAweDM4MDAwMDAwLCBidXQgdGhlIG1hZ2ljIGlzIGF0IDB4MzkwMDAwMDANCg0K
U28sIEkgbmVlZCB0aGUgbWVtb3J5IHJhbmdlIHNldCB1cCBiZWZvcmVoYW5kLCBidXQgSSBjYW4n
dCBhcyB0aGVyZSBpcyBubyBjdXRlIHdheSB0byBnZXQgdGhhdC4NCg0KT2YgY291cnNlLCBJIGNh
biBpc3N1ZSBhIGh5cCBjYWxsIHRvIGdldCBIVk1fUEFSQU1fQ09OU09MRV9QRk4gYW5kIHVzZSBp
dCBhcyB0aGUgYmFzZSBhZGRyZXNzLA0KDQpidXQgdGhpcyBzbWVsbHMgbGlrZSBhIGhhY2suIEkg
Y2FuIGNhbGwgb3RoZXIgSFZNX1BBUkFNXyB0byBnZXQgdGhlaXIgcGZucyBhbmQgc2V0IHVwIHRo
ZSBtZW1vcnkgcmVnaW9ucywNCg0KYnV0IHRoaXMgbG9va3MgYSBiaXQgd2VpcmQuIEkgbmVlZCB0
aGF0IGNvbnN0YW50IGJhZGx5IDspDQoNCj4NCj4gQ2hlZXJzLA0KPg==

