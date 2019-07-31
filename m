Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BE87CB4E
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 20:00:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hssr6-0000W0-Hz; Wed, 31 Jul 2019 17:57:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bdxT=V4=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hssr4-0000Vv-PC
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 17:57:38 +0000
X-Inumbo-ID: acb2b758-b3bc-11e9-8980-bc764e045a96
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.62]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id acb2b758-b3bc-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 17:57:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lA+dNrcXcrCF6iexTIvS43fws1ofILTcVfFW25thKFtIAMK5GXzvNPwaxGU2cyApso+BfzD+Ws2XG6E1H/rj2Woi2puhHewkxGlPx56dAK9JElY54hW4od7ksD6ASgeWY5R0T09KdZ98lZx4+JBxrZ9eXD/UdtP3AIXxhDDtA55zhVTzcF6JFfpBRYLQt7BMrzWOx7YIzzLxvOd0rllrmIREOZF/DP1Qd2P0tAMofTT+HpfAGmwsaHPFEaTV8RkWcbjtU78Uz/DjnDvOl82q08bFx1qr9hkz38U5gfyGOr6SBPiu0JOm491uFDwBpohlDfWDCwBYzuok8MBRHNqTZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USb0LlIOSHhMO8610XlnDxQmfkz/doJ18PZsF3anGNc=;
 b=MQ/UkzUeWkE9xZa6z+lqn2l5nI8PJKKfYBoeuHIgJ17b9VNwdhKFBSWxi/sXv5UIkLxUIWYP8fWACDj7bp4d1hZ75LdNGLkYhxX2IzHKz1KAUmFhqSa3mxfSx7wBJw4euk0t8ejygb4b7FQ2sAuQ7bLO2PsiPpeTtdjJOGfF6vm9IeK6kt9AWyjN035rA/BgBvN25u0CukS+sHEyTQhkRUcFvvZLduiz7ej0vcs5ikZqgPWRf+ogXKbZNL6ue9tjlElgjuOsTDSzRte3xS6Seab1qJALDX8dOlpUnL4AaOtevutsz2CZ5ipjjLQCPb81SseaQsMYXrucDtoCCg7Q6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USb0LlIOSHhMO8610XlnDxQmfkz/doJ18PZsF3anGNc=;
 b=FMGTEBooB4yk1qiJpFSnrIjcWVpcB7O0k3XYVFOhOsgDniqaUJKEgL4fY4+QVi5njSbv5qIAeA43R+tr79YdD587FF4x8WDQfHk4QZahhhWtTJK45KcYq3U4bET14n2B2e6HuwagC+Vwet7izxqbkVXaOzd9j3rI9jefPslrsOl//jLFSax7eh8cvLdLAqo2/O2wxYg1V+mWRXq4M6D9tI/oBFvAKvmsRiqHckum2314kLle+g/g9P7fVcbY/GJu8fWurmLVWtZquNWmPh9vQ22y/5YBYsLRr+Nxf2wpqBDzoo8I/STl0Mf3G/F3+1lyEwNYT23ujGhTZu2I3Zgw5g==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4658.eurprd03.prod.outlook.com (20.177.41.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Wed, 31 Jul 2019 17:57:32 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 17:57:32 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Thread-Topic: [PATCH] CODING_STYLE: clarify function argument indentation
Thread-Index: AQHVR7xxvb8iYZ/UOE68NI2ovvNVU6bk70gAgAACfACAAAMHAIAADpSA
Date: Wed, 31 Jul 2019 17:57:32 +0000
Message-ID: <8736imhyt0.fsf@epam.com>
References: <20190731162434.12837-1-volodymyr_babchuk@epam.com>
 <bb494090-f6d4-8f19-5784-8f8b20cbafdd@citrix.com>
 <CAOcoXZY5Kwtuy9nLxaxw5FLd0jSmjuvZfNc3SYyuKVP7HtG2tg@mail.gmail.com>
 <FA7398EE-7206-40B7-9AAD-D0D6155C5DE4@gmail.com>
In-Reply-To: <FA7398EE-7206-40B7-9AAD-D0D6155C5DE4@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57b9720b-a964-47d0-0ede-08d715e08fa0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4658; 
x-ms-traffictypediagnostic: AM0PR03MB4658:|AM0PR03MB4658:
x-microsoft-antispam-prvs: <AM0PR03MB4658DC1C92BC74F086B9ED4AE6DF0@AM0PR03MB4658.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(53754006)(199004)(189003)(71200400001)(71190400001)(66556008)(66476007)(66066001)(99286004)(6436002)(53546011)(2906002)(54906003)(486006)(478600001)(55236004)(91956017)(102836004)(6506007)(76116006)(66946007)(229853002)(14444005)(256004)(86362001)(4744005)(6116002)(6246003)(6486002)(64756008)(66446008)(53936002)(76176011)(6512007)(3846002)(305945005)(446003)(186003)(4326008)(316002)(476003)(81166006)(81156014)(14454004)(36756003)(107886003)(7736002)(26005)(68736007)(8676002)(8936002)(80792005)(7416002)(25786009)(11346002)(6916009)(5660300002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4658;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: u4CMCen4uYhc+ktZAn/F+vMBpoq+52xiBUjYV4NvNcynmqFLrzbvWwzYTF9nBO9s9SvsTRHZ3OWsv9YjgjEQtDwd9TWTno3wZOi1eUlGXlwbhYp24wjGsXwZ4/s6xBEKNnzoQWnBuo1ne1GpLpjiOXHHXUQInD+lOTdyvKCkUWSzNhvgVusHE51T9WX5+vPpsBaFUWBJ65MGh3+saocvgw+vF7FWLtX3qEfIAakA0bxoCfXnYf17xJ+C1KXRyYwet+v4BfvkdhQ6qOrA4kGlY66hb9VZ28WlEjJOh+vGMwQsZuqqtHq68IM4/WaNjYY/RnjWJMQf2DcpAK0Id0MXfDZKuT44+meddvAquiYRYH3ZENIHYi4NtGPTQZ8QZI1jySics3fndZFc7r57uAN5kt564Y/Sc1Q5TVxE1v65M2k=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b9720b-a964-47d0-0ede-08d715e08fa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 17:57:32.1804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4658
Subject: Re: [Xen-devel] [PATCH] CODING_STYLE: clarify function argument
 indentation
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIExhcnMsCgpMYXJzIEt1cnRoIHdyaXRlczoKCj4+IE9uIDMxIEp1bCAyMDE5LCBhdCAxNzo1
NCwgVmlrdG9yIE1pdGluIDx2aWt0b3IubWl0aW4uMTlAZ21haWwuY29tPiB3cm90ZToKPj4gCj4+
IEhpIEFsbCwKPj4gCj4+IE9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDc6NDUgUE0gQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiAKPj4+IE9uIDMxLzA3
LzIwMTkgMTc6MjQsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgoKWy4uLl0KCj4gVWx0aW1hdGVs
eSB3ZSBoYXZlIHRvIG1ha2Ugc29tZSB0cmFkZS1vZmZzIGFzIHRvIHdoYXQgaXMgbW9yZSBpbXBv
cnRhbnQ6Cj4gYSkgYXV0b21hdGljIHN0eWxlIGNoZWNraW5nIC0gd2hpY2ggbWVhbnMgImNvbW1v
biBzZW5zZSIgY2FuJ3QgYmUgZm9ybWFsaXNlZCBhbmQgdGhlcmUgd2lsbCBiZSBib3VuZGFyeSBj
YXNlcyBsaWtlIHRoZSBhYm92ZQo+IGIpIHJlY2xhaW1pbmcgY29kZSByZXZpZXcgYmFuZHdpZHRo
IHRocm91Z2ggYXV0b21hdGlvbiBvciBnb2luZyBmb3IgYSBsYWJvdXIgaW50ZW5zaXZlIG1hbnVh
bCBhcHByb2FjaApJIGxpa2UgdGhlIGxpbnV4IGtlcm5lbCBhcHByb2FjaC4gIGNoZWNrcGF0Y2gu
cGwgcHJvZHVjZXMgZXJyb3JzLCB3aGljaCBhcmUKIm5vIGdvIiwgYnV0IGl0IGFsc28gcHJvZHVj
ZXMgd2FybmluZ3MgZm9yIHN1Y2ggYm91bmRhcnkgY2FzZXMsIGZvcgptYWludGFpbmVyL3Jldmll
d2VyIHRvIGRlY2lkZS4KCj4gSSBzdWdnZXN0IHdlIGRpc2N1c3MgaW4gdG9tb3Jyb3cncyBjb21t
dW5pdHkgY2FsbCBob3cgdG8gYXBwcm9hY2gKPiB0aGlzLgpHb29kIGlkZWEsIEknbGwgYXR0ZW5k
LgoKPiBJIHRoaW5rIHRoZSBtb3N0IGltcG9ydGFudCBmaXJzdCBzdGVwIGlzIHRvIGhhdmUgYSBn
b29kIHZpZXcgb24gdGhlIGtpbmQgb2YgYm91bmRhcnkgY2FzZXMgdGhhdCB3ZSBtYXkgZmFjZQpU
aGVuIHdlIG5lZWQgc29tZSB2b2x1bnRlZXIgd2hvJ2xsIHRyeSB0byBjb3ZlciBhbGwgY29ybmVy
IGNhc2VzLgoKLS0gClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
