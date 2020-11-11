Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4872AF488
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 16:14:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25046.52611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrox-0007sG-HJ; Wed, 11 Nov 2020 15:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25046.52611; Wed, 11 Nov 2020 15:14:03 +0000
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
	id 1kcrox-0007rt-E2; Wed, 11 Nov 2020 15:14:03 +0000
Received: by outflank-mailman (input) for mailman id 25046;
 Wed, 11 Nov 2020 15:14:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pxcb=ER=epam.com=prvs=9584594409=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kcrov-0007rn-9z
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:14:01 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80dcbc8f-5fd9-4181-bd7d-93a3a546ccab;
 Wed, 11 Nov 2020 15:14:00 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ABFBW7I012119; Wed, 11 Nov 2020 15:13:54 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 by mx0b-0039f301.pphosted.com with ESMTP id 34rf80rrex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Nov 2020 15:13:54 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4434.eurprd03.prod.outlook.com (2603:10a6:208:c7::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Wed, 11 Nov
 2020 15:13:52 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 15:13:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Pxcb=ER=epam.com=prvs=9584594409=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kcrov-0007rn-9z
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:14:01 +0000
X-Inumbo-ID: 80dcbc8f-5fd9-4181-bd7d-93a3a546ccab
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 80dcbc8f-5fd9-4181-bd7d-93a3a546ccab;
	Wed, 11 Nov 2020 15:14:00 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
	by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ABFBW7I012119;
	Wed, 11 Nov 2020 15:13:54 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
	by mx0b-0039f301.pphosted.com with ESMTP id 34rf80rrex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2020 15:13:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGca0Oi92dsQ+dpELevReIcnpRn3Gp5AifshGjTnnv6ljaiSyVZTfHjA4MxjEykY5IYGxptHjzD4w+qSSjlGUESfKnfm+0I0c9N7O8MrHSmCKGAvOy/jd4MYDPifz74LDKN922qSClbV+dwIW25TZrW4g0LggP/D7utJ2/Nxiqz2Mie8OSeOaRaOl5j7pHOx4yjBM5lugIXrTJsLrDOSQGkRo99HEko8upjzy7SxnOfvoV7yV60Pv2sQscYg3kyaH8N3WANu6L4UCU71YrN91abNc5JkjvLgZAOwexVwrihlH+c/fFvx5hInXCgQoVuIq4wb9wJscmEPEJjaK74DmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhN9hHLd1SCyp79g9d0bOlLuqe506bMtBCVVE3ev64g=;
 b=iyfs+EfoPVzk1pghP2FNFApiXD/O66pCUCDxfhGFeGp0P73Vgf1ClaPwqokm0HP5v1u5J9kKJCX/3pCFS9iLIAzvRZdFMmqdrajPn6Mo0rinUxyLSM9v8XQHB71jngwX6fVRS0D8IWlLacynvfIpFYdq4iKIKDGSwNvVdqP3N0mN6FAMZSgGdMRa8po+C1h7ICykuD33Lsp/e6RSpy5uMmGtlPJgLVKQE3nTLDf18IcBxJqDuv/2mudAq7Xpk3aznv4Z7fUFLmbB+z5MnIWIoYous07zxMsO5qowdIvrNEWYlJf/DKl+hDu4vY0IdEEghUxlnaSuFmVYZoRbTjFOSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhN9hHLd1SCyp79g9d0bOlLuqe506bMtBCVVE3ev64g=;
 b=hx7MdOzW6Sa2JRABlDgszRT1COIAKYtAMd0qqcj4Dr7FTm5xmKUNRcJY6ZN2V0it/4fElfFQDGFBkLh2tr/eLLbn3kop2cmyX8C/lBOiRHtv/0crS1YPZrdNekO6yQQUoWP08vzKnRJ9ffpyTXyl2OleIQy6vpHyF/yOTHGAN9gzIpEWRd+XRLlZ/YRvzwaBnmScmxJE5o5hQQ/HDRBHFXM7SWAvGXqfW4raeAQJS1sH+kB0kKK/38PKIp2sHi+NI2XhUork5ohoCxfXP6ZPV3KkThePicKmdVgSJLkLzOW3oye/pEkPe36M6SkPk7YTR9Lk6HEbDozMsaV2v55NZw==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4434.eurprd03.prod.outlook.com (2603:10a6:208:c7::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Wed, 11 Nov
 2020 15:13:52 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 15:13:52 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Oleksandr
 Andrushchenko <andr2000@gmail.com>
CC: "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>,
        "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>,
        "julien.grall@arm.com" <julien.grall@arm.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH 02/10] arm/pci: Maintain PCI assignable list
Thread-Topic: [PATCH 02/10] arm/pci: Maintain PCI assignable list
Thread-Index: AQHWtpbuKiRgL1HiZkyNC2yoNcmnl6nC9s6AgAAMvACAAAbRAIAAAv4A
Date: Wed, 11 Nov 2020 15:13:52 +0000
Message-ID: <d94e37a3-d8b3-7d3d-0ba5-c7885a5ef512@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-3-andr2000@gmail.com>
 <20201111135311.6jhskiss2qswm3zp@Air-de-Roger>
 <03d6a75c-075d-6c57-1d66-2514ef1d0cb8@epam.com>
 <20201111150310.2wo33lr3f5xrd6sj@Air-de-Roger>
In-Reply-To: <20201111150310.2wo33lr3f5xrd6sj@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4efdecf-598a-441b-15a2-08d886546668
x-ms-traffictypediagnostic: AM0PR03MB4434:
x-microsoft-antispam-prvs: 
 <AM0PR03MB4434F715A4B745913BCCA46FE7E80@AM0PR03MB4434.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IdVgiCe3ttLeQRlWTxBKWJUo1IICRAL/sL44w6LOjZ61N7bNDSuD+p2pUyBLeitn7ltNxD8JmkJDq641CHWGKc2I9MjQGmGVbGyPQ5bvl6mlqFiNTCZ1KczWE9IwFU7fXXqtwiOaFRO4Bf/M3Kp8o1wE1OVFPdEEiK4/hfD0HaEcbBOFOEIA69eQ2S3xbQUrefiNezQBmomqAyjg0ixXdfmkvJ+Ifi5LhTVRANp+7kenTqsbRtvziSubWLyuFn3i6tljPWLHsEEKCgztzTkdBJWdaSKHVcomfmHbAn0ilXKISeKczAyoHd6I276WIVqOkYF25dQxfIqeABzsEu0o+A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(478600001)(31686004)(31696002)(66446008)(86362001)(71200400001)(26005)(66476007)(2616005)(6512007)(66946007)(66556008)(64756008)(91956017)(4326008)(6486002)(5660300002)(8676002)(7416002)(36756003)(316002)(6506007)(8936002)(54906003)(76116006)(2906002)(110136005)(53546011)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 mebQqzF4SpErUVoZ2iADBlSaq2pp898lyKIromIjMu8vXlXGFIWYh0g5ymfA0ipnHccZjD/CJqP5tFBdDsEkGl0kcfnZz6VXEn/Z++IYTp+HWD8ENmYzIQByTQ7PVUbQoctkD3Gq6Mq9LATWuVj5ZC7u0PT557Rau81MNSuh/eGvuttiCI+98kKbrkUqOQ4oapeihmdLpCMJXjug8KeSbC4hpdFYcblOIAzI8LODjK5Rb5h4htDSG6iF71AsZt2b0S+4QeaUL/4ncJH1qMsEX5xmizy0I7erRluoY9a44YS5jvjpH8UGhi7wCVA1ag5TBTSY0thOU+J8D0EQ/53+cWutVAR5CKn4AORKzUGoBtkZJKrhpW2Q2fVX/sIUeqC51ACINT+qSyKLNh3h7/sj2PT+8yBVChO96i95G/48BctHZPjlyByivZmuiK9g0qVMAf3qaZah90qaX53RptHLRZeHmi3HRFD3H+FbCmpEfHF7EJqz53D61kBr47/BTRebKqsxO+wHsBzWAZFhP2LOgKNyFrigdaCb4idNVygdSJn5J5g8hnKBLGd0paOFGsRQ5ijklKyAfCSXsckVJ7oPXHBwEIFefbToa/ViS3eagavw60cdMxjaf6Yvu/GkY/wDI8oLO2cP0mwM0IJSij02tw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F94A906D5F079B43B9BDB597E424184F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4efdecf-598a-441b-15a2-08d886546668
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 15:13:52.5033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 06XPNJtMb9o7wr+VLjSmE83HBIm7EbCJ75N9QUrP1tD0ZXTdokjIZfbBma7aV3StR8gXwKTkv8DWrYMXn7lW4S9nCoF5FMo9ycsReUm0cTS5ZtWTIThgM6BbZBhuSrB/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4434
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-11_07:2020-11-10,2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011110092

T24gMTEvMTEvMjAgNTowMyBQTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gV2VkLCBO
b3YgMTEsIDIwMjAgYXQgMDI6Mzg6NDdQTSArMDAwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
d3JvdGU6DQo+PiBPbiAxMS8xMS8yMCAzOjUzIFBNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0K
Pj4+IE9uIE1vbiwgTm92IDA5LCAyMDIwIGF0IDAyOjUwOjIzUE0gKzAyMDAsIE9sZWtzYW5kciBB
bmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8
b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+DQo+Pj4+IFRoZSBvcmlnaW5h
bCBjb2RlIGRlcGVuZHMgb24gcGNpYmFjayB0byBtYW5hZ2UgYXNzaWduYWJsZSBkZXZpY2UgbGlz
dC4NCj4+Pj4gVGhlIGZ1bmN0aW9uYWxpdHkgd2hpY2ggaXMgaW1wbGVtZW50ZWQgYnkgdGhlIHBj
aWJhY2sgYW5kIHRoZSB0b29sc3RhY2sNCj4+Pj4gYW5kIHdoaWNoIGlzIHJlbGV2YW50L21pc3Np
bmcvbmVlZGVkIGZvciBBUk06DQo+Pj4+DQo+Pj4+IDEuIHBjaWJhY2sgaXMgdXNlZCBhcyBhIGRh
dGFiYXNlIGZvciBhc3NpZ25hYmxlIFBDSSBkZXZpY2VzLCBlLmcuIHhsDQo+Pj4+ICAgICAgcGNp
LWFzc2lnbmFibGUte2FkZHxyZW1vdmV8bGlzdH0gbWFuaXB1bGF0ZXMgdGhhdCBsaXN0LiBTbywg
d2hlbmV2ZXIgdGhlDQo+Pj4+ICAgICAgdG9vbHN0YWNrIG5lZWRzIHRvIGtub3cgd2hpY2ggUENJ
IGRldmljZXMgY2FuIGJlIHBhc3NlZCB0aHJvdWdoIGl0IHJlYWRzDQo+Pj4+ICAgICAgdGhhdCBm
cm9tIHRoZSByZWxldmFudCBzeXNmcyBlbnRyaWVzIG9mIHRoZSBwY2liYWNrLg0KPj4+Pg0KPj4+
PiAyLiBwY2liYWNrIGlzIHVzZWQgdG8gaG9sZCB0aGUgdW5ib3VuZCBQQ0kgZGV2aWNlcywgZS5n
LiB3aGVuIHBhc3NpbmcgdGhyb3VnaA0KPj4+PiAgICAgIGEgUENJIGRldmljZSBpdCBuZWVkcyB0
byBiZSB1bmJvdW5kIGZyb20gdGhlIHJlbGV2YW50IGRldmljZSBkcml2ZXIgYW5kIGJvdW5kDQo+
Pj4+ICAgICAgdG8gcGNpYmFjayAoc3RyaWN0bHkgc3BlYWtpbmcgaXQgaXMgbm90IHJlcXVpcmVk
IHRoYXQgdGhlIGRldmljZSBpcyBib3VuZCB0bw0KPj4+PiAgICAgIHBjaWJhY2ssIGJ1dCBwY2li
YWNrIGlzIGFnYWluIHVzZWQgYXMgYSBkYXRhYmFzZSBvZiB0aGUgcGFzc2VkIHRocm91Z2ggUENJ
DQo+Pj4+ICAgICAgZGV2aWNlcywgc28gd2UgY2FuIHJlLWJpbmQgdGhlIGRldmljZXMgYmFjayB0
byB0aGVpciBvcmlnaW5hbCBkcml2ZXJzIHdoZW4NCj4+Pj4gICAgICBndWVzdCBkb21haW4gc2h1
dHMgZG93bikNCj4+Pj4NCj4+Pj4gMS4gQXMgQVJNIGRvZXNuJ3QgdXNlIHBjaWJhY2sgaW1wbGVt
ZW50IHRoZSBhYm92ZSB3aXRoIGFkZGl0aW9uYWwgc3lzY3RsczoNCj4+Pj4gICAgLSBYRU5fU1lT
Q1RMX3BjaV9kZXZpY2Vfc2V0X2Fzc2lnbmVkDQo+Pj4gSSBkb24ndCBzZWUgdGhlIHBvaW50IGlu
IGhhdmluZyB0aGlzIHN5c2ZzLCBYZW4gYWxyZWFkeSBrbm93cyB3aGVuIGENCj4+PiBkZXZpY2Ug
aXMgYXNzaWduZWQgYmVjYXVzZSB0aGUgWEVOX0RPTUNUTF9hc3NpZ25fZGV2aWNlIGh5cGVyY2Fs
bCBpcw0KPj4+IHVzZWQuDQo+PiBCdXQgaG93IGRvZXMgdGhlIHRvb2xzdGFjayBrbm93IGFib3V0
IHRoYXQ/IFdoZW4gdGhlIHRvb2xzdGFjayBuZWVkcyB0bw0KPj4NCj4+IGxpc3Qva25vdyBhbGwg
YXNzaWduZWQgZGV2aWNlcyBpdCBxdWVyaWVzIHBjaWJhY2sncyBzeXNmcyBlbnRyaWVzLiBTbywg
d2l0aA0KPj4NCj4+IFhFTl9ET01DVExfYXNzaWduX2RldmljZSB3ZSBtYWtlIHRoYXQga25vd2xl
ZGdlIGF2YWlsYWJsZSB0byBYZW4sDQo+Pg0KPj4gYnV0IHRoZXJlIGFyZSBubyBtZWFucyBmb3Ig
dGhlIHRvb2xzdGFjayB0byBnZXQgaXQgYmFjay4NCj4gQnV0IHRoZSB0b29sc3RhY2sgd2lsbCBm
aWd1cmUgb3V0IHdoZXRoZXIgYSBkZXZpY2UgaXMgYXNzaWduZWQgb3INCj4gbm90IGJ5IHVzaW5n
DQo+IFhFTl9TWVNDVExfcGNpX2RldmljZV9nZXRfYXNzaWduZWQvWEVOX1NZU0NUTF9wY2lfZGV2
aWNlX2VudW1fYXNzaWduZWQ/DQo+DQo+IEFGQUlDVCBYRU5fU1lTQ1RMX3BjaV9kZXZpY2Vfc2V0
X2Fzc2lnbmVkIHRlbGxzIFhlbiBhIGRldmljZSBoYXMgYmVlbg0KPiBhc3NpZ25lZCwgYnV0IFhl
biBzaG91bGQgYWxyZWFkeSBrbm93IGl0IGJlY2F1c2UNCj4gWEVOX0RPTUNUTF9hc3NpZ25fZGV2
aWNlIHdvdWxkIGhhdmUgYmVlbiB1c2VkIHRvIGFzc2lnbiB0aGUgZGV2aWNlPw0KDQpBaCwgSSBt
aXN1bmRlcnN0b29kIHlvdSB0aGVuLiBTbywgd2Ugb25seSB3YW50IHRvIGRyb3AgWEVOX0RPTUNU
TF9hc3NpZ25fZGV2aWNlDQoNCmFuZCBrZWVwIHRoZSByZXN0Lg0KDQo+DQo+Pj4+ICAgIC0gWEVO
X1NZU0NUTF9wY2lfZGV2aWNlX2dldF9hc3NpZ25lZA0KPj4+PiAgICAtIFhFTl9TWVNDVExfcGNp
X2RldmljZV9lbnVtX2Fzc2lnbmVkDQo+Pj4+IDIuIEV4dGVuZCBzdHJ1Y3QgcGNpX2RldiB0byBo
b2xkIGFzc2lnbm1lbnQgc3RhdGUuDQo+Pj4gSSdtIG5vdCByZWFsbHkgZm91bmQgb2YgdGhpcywg
dGhlIGh5cGVydmlzb3IgaXMgbm8gcGxhY2UgdG8gc3RvcmUgYQ0KPj4+IGRhdGFiYXNlIGxpa2Ug
dGhpcywgdW5sZXNzIGl0J3Mgc3RyaWN0bHkgbmVlZGVkLg0KPj4gSSBkbyBhZ3JlZSBhbmQgaXQg
d2FzIHByZXZpb3VzbHkgZGlzY3Vzc2VkIGEgYml0DQo+Pj4gSU1PIHRoZSByaWdodCBpbXBsZW1l
bnRhdGlvbiBoZXJlIHdvdWxkIGJlIHRvIHNwbGl0IExpbnV4IHBjaWJhY2sgaW50bw0KPj4+IHR3
byBkaWZmZXJlbnQgZHJpdmVyczoNCj4+Pg0KPj4+ICAgIC0gVGhlIHB2LXBjaSBiYWNrZW5kIGZv
ciBkb2luZyBwYXNzdGhyb3VnaCB0byBjbGFzc2ljIFBWIGd1ZXN0cy4NCj4+IE9rDQo+Pj4gICAg
LSBUaGUgcmVzdCBvZiBwY2liYWNrOiBkZXZpY2UgcmVzZXQsIGhhbmQtaG9sZGluZyBkcml2ZXIg
Zm9yIGRldmljZXMNCj4+PiAgICAgIHRvIGJlIGFzc2lnbmVkIGFuZCBkYXRhYmFzZS4NCj4+IFRo
ZXNlIGFuZCBhc3NpZ25lZCBkZXZpY2VzIGxpc3Qgc2VlbSB0byBiZSB0aGUgY29tcGxldGUgc2V0
IHdoaWNoDQo+Pg0KPj4gaXMgbmVlZGVkIGJ5IHRoZSB0b29sc3RhY2sgb24gQVJNLiBBbGwgb3Ro
ZXIgZnVuY3Rpb25hbGl0eSBwcm92aWRlZCBieQ0KPj4NCj4+IHBjaWJhY2sgaXMgbm90IG5lZWRl
ZCBmb3IgQVJNLg0KPj4NCj4+IEphbiB3YXMgc2F5aW5nIFsxXSB0aGF0IHdlIG1pZ2h0IHN0aWxs
IHVzZSBwY2liYWNrIGFzIGlzLCBidXQgc2ltcGx5IHVzZSBvbmx5DQo+Pg0KPj4gdGhlIGZ1bmN0
aW9uYWxpdHkgd2UgbmVlZC4NCj4+DQo+Pj4gSSB0aGluayB0aGVyZSBtdXN0IGJlIHNvbWV0aGlu
ZyBzaW1pbGFyIGluIEtWTSB0aGF0IHBlcmZvcm1zIHRoZSB0YXNrcw0KPj4+IG9mIG15IGxhc3Qg
cG9pbnQsIG1heWJlIHdlIGNvdWxkIHBpZ2d5YmFjayBvbiBpdD8NCj4+IEkgcHJvbWlzZWQgdG8g
bG9vayBhdCBpdC4gSSBvd2UgdGhpcw0KPj4+IElmIHdlIHdhbnQgdG8gZ28gdGhlIHJvdXRlIHBy
b3Bvc2VkIGJ5IHRoaXMgcGF0Y2gsIGllOiBYZW4gcGVyZm9ybWluZw0KPj4+IHRoZSBmdW5jdGlv
bnMgb2YgcGNpYmFjayB5b3Ugd291bGQgYWxzbyBoYXZlIHRvIG1vdmUgdGhlIFBDSSByZXNldA0K
Pj4+IGNvZGUgdG8gWGVuLCBzbyB0aGF0IHlvdSBjYW4gZnVsbHkgbWFuYWdlIHRoZSBQQ0kgZGV2
aWNlcyBmcm9tIFhlbi4NCj4+IEluIGNhc2Ugb2YgZG9tMGxlc3MgdGhpcyB3b3VsZCBiZSB0aGUg
Y2FzZTogbm8gcGNpYmFjaywgbm8gRG9tYWluLTANCj4gQnV0IGZvciBkb20wbGVzcyB0aGVyZSdz
IG5vIG5lZWQgZm9yIGFueSBkYXRhYmFzZSBvZiBhc3NpZ25hYmxlDQo+IGRldmljZXMsIG5vciB0
aGUgbmVlZCB0byBwZXJmb3JtIHBjaSBkZXZpY2UgcmVzZXRzLCBhcyBpdCdzIGFsbA0KPiBhc3Np
Z25lZCBhdCBib290IHRpbWUgYW5kIHRoZW4gbmV2ZXIgbW9kaWZpZWQ/DQpZb3UgYXJlIHJpZ2h0
DQo+DQo+IFJvZ2VyLg0KDQpUaGFuayB5b3UsDQoNCk9sZWtzYW5kcg0K

