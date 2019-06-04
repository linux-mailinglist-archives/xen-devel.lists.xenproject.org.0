Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4068348F3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 15:36:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY9Xh-0007yi-D5; Tue, 04 Jun 2019 13:31:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gtXt=UD=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hY9Xg-0007yd-Ac
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 13:31:56 +0000
X-Inumbo-ID: 1db24ab5-86cd-11e9-8980-bc764e045a96
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::60d])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1db24ab5-86cd-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 13:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joPiC0ZBjJlhjtPbvNS8qpeXa0Sjc53K/6tEaya7cNA=;
 b=RAsYih7iBvpu5G8P2j5TL8u1DiQ+tqF7F7lv3jog1cIHREqkTPqaqdlAbm8Ua99wAPnF3/NcKALNdrjCespQ9XXnbGZe/dlS4g49vXc2w5JyuhUp4LzjcfDawz4nh8A5DJBCtpOZZ0SyCxrrNBxQAJXt/9Av3I5v+4rYS7z61LHvY/IOGVlRyKsQ5V5i90Jgx4i3LxMpYOOFUTWkvHANlgtxvNE673NajSTiWy0QynZNubeTvDDJWru2kFgoXXkbY+E3Qi2rfBcaZ1QBL540o5vLz4kgyYcuHnfpgAcdsS3CkB60zCA0vSinppT3ovYkBZcwsT5TWEhevuJTKxujiw==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB4756.eurprd03.prod.outlook.com (20.177.41.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 4 Jun 2019 13:31:52 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a%3]) with mapi id 15.20.1922.025; Tue, 4 Jun 2019
 13:31:52 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v5 00/10] TEE mediator (and OP-TEE) support in XEN
Thread-Index: AQHVGIlVzDL8mSGCTEW70ujDnLhEbqaG9wMAgAANsICABH30AA==
Date: Tue, 4 Jun 2019 13:31:51 +0000
Message-ID: <871s098ojd.fsf@epam.com>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <06a4f534-e671-004c-93bb-31b60ed77d28@arm.com> <8736kt8f2z.fsf@epam.com>
 <59439dbd-dce8-072e-4258-4778f38ebe2a@arm.com>
In-Reply-To: <59439dbd-dce8-072e-4258-4778f38ebe2a@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 919c6635-cfae-4a0d-48c2-08d6e8f100fe
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4756; 
x-ms-traffictypediagnostic: AM0PR03MB4756:
x-microsoft-antispam-prvs: <AM0PR03MB4756ED6F1FF908378812DE18E6150@AM0PR03MB4756.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(136003)(396003)(39860400002)(366004)(189003)(199004)(36756003)(66066001)(8676002)(11346002)(305945005)(81166006)(81156014)(6916009)(7736002)(6436002)(2616005)(446003)(4326008)(6512007)(7416002)(6486002)(8936002)(53936002)(25786009)(476003)(71190400001)(71200400001)(4744005)(5660300002)(73956011)(66476007)(64756008)(486006)(6246003)(66556008)(99286004)(316002)(6506007)(80792005)(55236004)(53546011)(256004)(76176011)(102836004)(14454004)(2906002)(66446008)(72206003)(68736007)(229853002)(26005)(54906003)(186003)(6116002)(3846002)(86362001)(478600001)(76116006)(66946007)(91956017);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4756;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q5ETVLG5y/UdYf5PJJZuYk2Sf7ndA+UbVjo1hNOT72Q4+XVitYGJuUz/nM09/GBpiL7fZL1WKG2R1nPuE3mL3oCL+SgKCz8Ww+z+qSjRVWXh281ivhMOwHOW8WHyT8NKk356C91j3M0YZW3rQqRXPHWt1WIjcyPvj/3szE+LGupkd6a2fdL74nAIvm0xuw+PFNjq1n2QF/ZiDZh3fXE06cAeOWekTn6vje30WUNljr6wknZCHRx5qbE/OXA3E71C8c094wWXy2FTi2Z+VW/OfuKF3XxCxswOj3ieOT1mcHsdT1a2rZgMwoUjBnGi0k+u13+1/MgRkS22vuxXjq0mWerJY6u2buvpUq3SxknL8fwX1e/NiowfI382LsNFWRql/ZTeoTB4Chcxp66JPO/chvEuRS+65Ord4e6uwhVorK0=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 919c6635-cfae-4a0d-48c2-08d6e8f100fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 13:31:51.9603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4756
Subject: Re: [Xen-devel] [PATCH v5 00/10] TEE mediator (and OP-TEE) support
 in XEN
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhlbGxvIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IE9uIDYvMS8xOSA1OjA3IFBN
LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4KPj4gSGkgSnVsaWVuLAo+Cj4gSGkgVm9sb2R5
bXlyLAo+Cj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+Cj4+PiBIaSBWb2xvZHlteXIsCj4+Pgo+
Pj4gSSB0cmllZCB0byBhcHBseSB0aGUgcGF0Y2hlcyB0byBzdGFnaW5nIGJ1dCBmYWlsIGJlY2F1
c2UgdGhlIHBhdGNoZXMKPj4+IGNvbnRhaW5zID0yMC4gRG8geW91IGhhdmUgYSB0cmVlIHdpdGgg
dGhlIHNlcmllcyBhcHBsaWVkPwo+Pgo+PiBTdXJlLCB5b3UgY2FuIGZpbmQgdGhlbSBhdCBbMV0K
Pgo+IFRoYW5rIHlvdSEgVGhlIGJyYW5jaCBpcyBiYXNlZCBvbiBtYXN0ZXIuIFRoaXMgaXMgZmFp
cmx5IGJlaGluZAo+IHN0YWdpbmcuIENvdWxkIHlvdSByZWJhc2UgdGhpcyBvbiB0b3Agb2Ygc3Rh
Z2luZz8KPgo+IEkgd2lsbCBnbyB0aHJvdWdoIHRoZSBzZXJpZXMgbmV4dCB3ZWVrLiBBcyB0aGlz
IGlzIGEgdGVjaCBwcmV2aWV3LCBJCj4gYW0gcGxhbm5pbmcgdG8gbWVyZ2UgdGhpcyB2ZXJzaW9u
IHVubGVzcyBJIGZpbmQgc29tZXRoaW5nIGhvcnJpYmx5Cj4gd3JvbmcgaW4gaXQuClRoYW5rIHlv
dSBmb3IgcmV2aWV3LiBJIHJlYWxseSBhcHByZWNpYXRlIHRoaXMuCgpJIGp1c3Qgd2FudCB0byBj
bGFyaWZ5LCB3aGF0IEkgc2hvdWxkIGRvIG5leHQuIElmIEkgZ290IHlvdSByaWdodCwgSQpzaG91
bGQgc2VuZCB2NiwgcmViYXNlZCBvbiBzdGFnaW5nIGFuZCB3aXRoIHlvdXIgY29tbWVudHMgYWRk
cmVzc2VkLiBJcwp0aGlzIHJpZ2h0PwoKLS0KQmVzdCByZWdhcmRzLFZvbG9keW15ciBCYWJjaHVr
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
