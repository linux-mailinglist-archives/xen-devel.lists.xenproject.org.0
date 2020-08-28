Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD2D255A64
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 14:42:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBdhp-0008R4-Q7; Fri, 28 Aug 2020 12:42:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nNC1=CG=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kBdho-0008Qz-7T
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 12:42:08 +0000
X-Inumbo-ID: cd82868f-450e-4f55-b85c-b0d8d7927e63
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd82868f-450e-4f55-b85c-b0d8d7927e63;
 Fri, 28 Aug 2020 12:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598618526;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QfG1v8JLwaCAIDhZJP/gI4IjxAXGw+vfs4sLLYg4ysk=;
 b=C/vefwGm8tEmO6ad/uIqtK2wg71JjNIFqAJnVjphE7XUWlwcqFrgO3PG
 yWMUBoVk3chrQjF5HIXDOvqAoNTo/ULmoVuDppJZBufkodtR4i9EMIjsA
 mddNHwTgJd9Tw7qXicm4yZfc1nG5xpw1TcqLNuoLGmk8sGiOzvRdGKMAB c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: jDaL9k4Az0QrWByHKvcmSuatipuqVcnZ4eWDwPgfdtc8CNOWZjov/u+xCtLB967k6okibMpaC2
 TGi8GRhm7X06DVF35t4go2XyZMjSEFIwN+x1FkC8zizoN/G62Ije+AJYquleiu7StdjcFUYG1o
 sIFRoVOorluvechwhGl3T/uLVjY72htJJ9QKsoQAFU2nTg36IqghxlzvNitwtW3c6oHHTZqJ1B
 hSRODng6+2rnid+LUhnFajkY9glR6Dnrrh4uP3+eMiNVRKt3r6e2s5RDxRdKSWU3IrazEaQ/LQ
 pV8=
X-SBRS: 2.7
X-MesageID: 26463249
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,363,1592884800"; d="scan'208";a="26463249"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKHIuE96u/sFGxyHwE+M4Yeotz47aEYopfm9PPZ7mZNkSce2BGtYgjBJVSIqMY9EEhBc/4d7IZzJu6sTT7dX56mPTGKD7attJ5A3aAdPNIIbWntGPU/PocT5nSp1lx7R3MPJnbtQkppZSaB8ZxBqpm1GYnhXWxD4E1GPocZS30IHrp2vLt9uhgERrGiXUoWLclxk+AaS0j+hZaWPsiAclweN6bcxwMScLWAX/fwVnoBeqqm9s3fY4PG36GmZYXt0b5A/EsaeliJxwlY5Vl7LtjP0P/QNj6VfGHscoXFwa3O1iABaM2HQN5QUpVCwLEfla2ccNKXBXlrV+qK4TX3WKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfG1v8JLwaCAIDhZJP/gI4IjxAXGw+vfs4sLLYg4ysk=;
 b=UwYUpBhKKBvBbQqRKjbaj99G6S6w/k4oI/lZvQTpmeTR+zVDFvAsL5Sw+lR6UjJKTo2OX3WwU7E/rVME78nLyYhrofAglK/mhPhHdi4vfRXLgQyxj/x2mF4/J0KpM/k840tH+5hmfq80DHj98FksrB1QvvtMA7liumYG9oHYg5h1W5+fq1hR7TYmVOAogKGLwMi+uQkEwz3WQXZpRiwZw1ve1e4uyzE9AMybkq1Ov7Sp0SlmhDKYBBY+cOxIVaJwM9MsHOLk2jd+/WcOERlMLhWm0nZ7c2GCfHp41JeFKn22U9PllOz5IiDxSJBjfqzBG8QERe20y/mar8VRLsXXCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfG1v8JLwaCAIDhZJP/gI4IjxAXGw+vfs4sLLYg4ysk=;
 b=pQXa5d3PDW+iQiUKMhP+EeYYScXsS4S2ChLwsCV3oOPN3/4MuTbpqTw//eTcfuwdX25+pXM68gZfIsx1nRxF7MG92srkt4+OcUMh4aN6BeDdxvur5GUq9GfAQkEH+PWBXIOTwyFPJ9dfkY/bBTsKH1IX3iGfKHzU6CVQp1mHbJY=
From: George Dunlap <George.Dunlap@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
CC: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "intel-xen@intel.com"
 <intel-xen@intel.com>, "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Sergey Dyasli
 <sergey.dyasli@citrix.com>, Christopher Clark
 <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, "Kevin
 Pearson" <kevin.pearson@ortmanconsulting.com>, Juergen Gross
 <jgross@suse.com>, "Ji, John" <john.ji@intel.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 "robin.randhawa@arm.com" <robin.randhawa@arm.com>, Artem Mygaiev
 <Artem_Mygaiev@epam.com>, Matt Spencer <Matt.Spencer@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>, "Stewart
 Hildebrand" <Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, "mirela.simonovic@aggios.com"
 <mirela.simonovic@aggios.com>, Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Ian Jackson
 <Ian.Jackson@citrix.com>, Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>,
 =?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
 <cardoe@cardoe.com>, "Woodhouse, David" <dwmw@amazon.co.uk>,
 =?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
 =?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
 <varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
 <rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>, "Olivier
 Lambert" <olivier.lambert@vates.fr>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, "open list:X86"
 <xen-devel@lists.xenproject.org>
Subject: Re: [ANNOUNCE] Call for agenda items for 3 September Community Call @
 15:00 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for 3 September Community Call
 @ 15:00 UTC
Thread-Index: AQHWfSjDNMl3H/SbY0m578uAtl5EmalNWraAgAAcJgA=
Date: Fri, 28 Aug 2020 12:41:47 +0000
Message-ID: <78C90064-D606-4D0E-81A1-AB8179EE9D83@citrix.com>
References: <0CF41EE7-BA9F-4CB6-A431-28AA0A145BE6@citrix.com>
 <964f910bb7b9495ab2612eaeedb17e06@EX13D32EUC003.ant.amazon.com>
In-Reply-To: <964f910bb7b9495ab2612eaeedb17e06@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f352f4a-f753-41fb-63dd-08d84b4fba7a
x-ms-traffictypediagnostic: BYAPR03MB4471:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB44711096974D1CFA4057DC5C99520@BYAPR03MB4471.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hoj8QlGTR73htAqRQpLY1IwbmpUm6JXpSQ7Qcnwnq+lKsnGddKLjWg1RecfcYo2YEZJAGKzdRRg2tOoSiT5V+z+0IltWwxMNaxuq/HJBhZUVS1uTj4YqxZAHIgKRLp7IKZE2IFzcrV6WmsjyL231d9kCqnCEVFttzS+s9pINzSfNHigZb+g09WkueFQuDlvrJPmdiC/GRFRcGDGzb0Wxt8DiCLCLrhGYqYepcE7hNo5MuP1El5E7YiZFL5cMlX5n4nJ7n9EAx6p0NDWptM2kLmaz7ITVv6Sh8WJX6UJB1jMQhR2n5EMHtgcGHZhgFuNIDlLcky3fTqU1jyMnSUAuyrG/BV7RWvjwyPYErufMgUXs2xvJXKJ4ELJllilgBgcuZm0IU632aYhD5hfVpBrYPg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(4744005)(6506007)(53546011)(966005)(478600001)(2906002)(83380400001)(186003)(26005)(86362001)(33656002)(5660300002)(66946007)(66446008)(66476007)(91956017)(8936002)(66556008)(76116006)(54906003)(6916009)(6486002)(2616005)(36756003)(8676002)(7416002)(6512007)(64756008)(71200400001)(4326008)(316002)(7406005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ZYFGkMiDRPj1U5JFwxKSbYPmtXMEO62fO7nbPW362fDUzX45WAiZDqH6fxfIVNesJXGr+ubKLnjdJbbzHKu9A8dwvZ2gDqeGI1H/z0rJsR1UD3P88T8gJt5HkypCVExsPHq9j5vtibOU9mKqlstJayX+fsuiovQI8NolDWr/OASV8nb4bU6diP7NtqaiSvOOQWldGAle/9hcc30ieaOEDKc70pESYbbmk8RS5mvQgWwOTHv77DBtZKLxHsX7k3h7l+Gq5iX8T/aOFO4QgXI/N119YRsoH0y03a+7v/6vEQ+U56pjY5f43hqoF6YKkr1iXpnFAd2dtJiVSzxbPkjyFL/Oeht+xjIQYOiPRSIfVx8BaUCXj3dZbwNp8Y52Fu3Gcb3sAwoTolvbb4nvwLztvoYLhaKNaPPtLtR2NIpY7O+4/1AztdziygMMUtttvN84Q7omSfOw2FBQQqzXuDzSZDjvBE6fX5tvZIp/Ct0TQqPVIi09pLBBki6DDhNGb8ELezv1nfOXGHefbWzlplm17BeiCKCR3OPFJTCWCfUNhb6cIbSJEB86DDzxykGQ2Zm7KanZxQ5nafjiDU6ZwPBCOcYd56UcBmVCAcGKG51mKg6rBihXhrI05cScJoqkOMAPLUOjkR52/dY9TFuoUPkg3w==
Content-Type: text/plain; charset="utf-8"
Content-ID: <32A5C83FE9C5CF4E93C51DFCD727D39F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f352f4a-f753-41fb-63dd-08d84b4fba7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 12:41:47.2909 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0dazOKXafvF7q6vk1uUez8w/OaWYokGMpASeokbOjSfhriQYgROMmdGOC7Qc6viNtND8XZfYZCVKAMx8QlsPqPAwxyJEuA0EDIp1ET2+IIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4471
X-OriginatorOrg: citrix.com
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXVnIDI4LCAyMDIwLCBhdCAxMjowMSBQTSwgRHVycmFudCwgUGF1bCA8cGR1cnJh
bnRAYW1hem9uLmNvLnVrPiB3cm90ZToNCj4+IA0KPj4gVGhlIHByb3Bvc2VkIGFnZW5kYSBpcyBp
biBodHRwczovL2NyeXB0cGFkLmZyL3BhZC8jLzMvcGFkL2VkaXQvZjE0N2IwYWVkOGZlMjZhZjcy
MWNhM2NkMDA0MjUzNjEvIGFuZA0KPj4geW91IGNhbiBlZGl0IHRvIGFkZCBpdGVtcy4gIEFsdGVy
bmF0aXZlbHksIHlvdSBjYW4gcmVwbHkgdG8gdGhpcyBtYWlsIGRpcmVjdGx5Lg0KPiANCj4gR2Vv
cmdlLA0KPiANCj4gSSBkb24ndCBzZWVtIHRvIGJlIGFibGUgdG8gYWNjZXNzIHRoZSBkb2Mgdmlh
IHRoYXQgbGluay4gRG8geW91IG5lZWQgdG8gZ2l2ZSBwZXJtaXNzaW9ucz8NCg0KU29ycnksIHRy
eSB0aGlzIG9uZToNCg0KaHR0cHM6Ly9jcnlwdHBhZC5mci9wYWQvIy8yL3BhZC9lZGl0L2JtZlls
TUlhakpWdEsxOHRsZ3g2RE14ZC8NCg0KIC1HZW9yZ2U=

