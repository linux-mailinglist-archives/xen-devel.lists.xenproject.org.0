Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DAF21680B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 10:12:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsii7-0008Hd-PZ; Tue, 07 Jul 2020 08:12:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VMuD=AS=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jsii5-0008HY-PP
 for xen-devel@lists.xen.org; Tue, 07 Jul 2020 08:12:13 +0000
X-Inumbo-ID: 8f6de7fe-c029-11ea-8496-bc764e2007e4
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f6de7fe-c029-11ea-8496-bc764e2007e4;
 Tue, 07 Jul 2020 08:12:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wdse/6Au+t6KJKzFeyHDzhDcBUa3EcoEwwS9dXu8+b+iaxDOq1dsQoSSf5Vk05iX/yhK9JVBHivwQiP4SzeKbAVFOmet9DIXdgMqpj/GnNa9Q8zARQgCC/bcteJg8Td18lY9oxuodIaRACcR8NmzkUN6J4kA06QnfXNGmRqtipMavt9IslluTJnSMdwXC7R9qwg3aDGOx3dFbUJB6vhnwR3vLNQDL1miskvCpBis1vdp9r1y7z++wgtEwXO5i8lpsvgMd59mYP0kOgFUZMEnJO/HhbRYn6gzXd6Gk2lc4ERPFPfxr1m22qECPozX6hBuRZ1HRHkulq8zOM+IEyJhSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuCSkKk+ldTmqyFOdGjcrn7E6I4yOU4d/kDBxiYg7+M=;
 b=IXT5fslaCFCwXLC2J1rm1uSdZkGPX5yfDVIHkvWLjHlvg3bvjuG5bt3DVwyZUaCm9cSmyctQPYXufpDncQeQ8IxA5eiVwC3ctEqFRkWnXAcxtKl25yoxVDTIPK+zYykuYLveQd2Fz7m0v6rZIK0WOdBeAh5zEJEOvhXC8o+Y+6NMUAESzXiY2KJvo3YjSbNbjhKiE1JyfDX1VrzWjT0qyVyw+F+u086vdChpoPOODVtXaDy/o+KiPUQG94qhTwPciyaJMHX/ORNA479zNdnBDerGlrwPf6wskLMbLrL0ntWWxCWNgdnWGlAMk2KIBn+1Wtl8UPg9SHZ13rvI9zyy+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuCSkKk+ldTmqyFOdGjcrn7E6I4yOU4d/kDBxiYg7+M=;
 b=SPQ+dHscOhItxiBd+8YjFiiCmo9MIxe2i/ezQfh0Ms8z+b6cwpgzwwTTmV906yqcuj6QohdpeJKGVJyP5ZUAHAj8LuEF5qSChl8kzc3oD5Bk23BOnMoDCM3yPJNmuZJmQau8XeN5fWv4FZ1edtFwEvtGmHLRdEw3B23gu4DZgmRhaUhP9B/iMgvRAN8fkLgaIUirct4mYH0caydNendZq4i4mq5+MUN9vQLg0SpPyBq6B9a9NVJQLtVu8Ugj8yKpFBYmFAW4GA0xQXEvtDXTlJLGgDifLTaoobqW8SDFMUINqEb1UdXLpmax7NFlk++e1fMlkJvudyrLrp10riRDew==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4308.eurprd03.prod.outlook.com (2603:10a6:208:ce::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.29; Tue, 7 Jul
 2020 08:12:11 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508%9]) with mapi id 15.20.3174.020; Tue, 7 Jul 2020
 08:12:11 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: "Manikandan Chockalingam (RBEI/ECF3)"
 <Manikandan.Chockalingam@in.bosch.com>, "xen-devel@lists.xen.org"
 <xen-devel@lists.xen.org>
Subject: Re: [BUG] Xen build for RCAR failing
Thread-Topic: [BUG] Xen build for RCAR failing
Thread-Index: AQHWVDZQf0pjwKxk/0KTFStJ+XMxEQ==
Date: Tue, 7 Jul 2020 08:12:10 +0000
Message-ID: <48b1ea69-f5c1-4ea2-455c-50bab72bc1da@epam.com>
References: <1b60ed1cd7834ed5957a2b4870602073@in.bosch.com>
In-Reply-To: <1b60ed1cd7834ed5957a2b4870602073@in.bosch.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: in.bosch.com; dkim=none (message not signed)
 header.d=none;in.bosch.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6318028d-8239-47c7-b736-08d8224d7300
x-ms-traffictypediagnostic: AM0PR03MB4308:
x-microsoft-antispam-prvs: <AM0PR03MB430862B593EFEBAF0BD37C0CE7660@AM0PR03MB4308.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D1w/wy/E8HGCK0X0TcbxLCG/6J55DOsnmxLpz+646QkZilRNCc2lja1X3thsam17C4jPzIfw1QM45FgLTJ+oTlSJVoNZN0ASsvAZtDxeemzLHscecwggDpcm2Lep+zTqFEoKivGXdb9XCHC5j+SAFSKwIylPDI5QaXpmpNU9EPA2A/QssJTni8Q+2jhbjajw5UNC+b2TdtBqb/5VK4rUEcsuKgHqF6PrMCcSnujRHzddZEgPihs3RolYiHLR+wOgMoK5js1Jx8335NUp9yhdcwNZDe3OOlLDRYyBeSSfXOi5V3w9lD9wsJLNpgUmGkbFk4VsXTqYjFOMj50XtoJz7BiI9zffVa4Vc0o+ZOAouTzG+v2+RESkv2tzEOPysCnWg2L7p0IixruDa3uv5eIoSA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(2906002)(966005)(26005)(71200400001)(186003)(8936002)(36756003)(8676002)(66446008)(64756008)(66556008)(31686004)(110136005)(91956017)(76116006)(66946007)(316002)(66476007)(6506007)(86362001)(31696002)(6486002)(53546011)(5660300002)(478600001)(6512007)(2616005)(4744005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: FANMJz84mkLyL0fYW7cLy3TxMoA5VxqqEihFgnxXtZo5swo8I1hWc6cSwTdhaUR77uTZo7+FCGJ8PYr/LZ3l5ufGf/yTcLGmv52EGjn0oAo59X3CjTuOjn71kU2jpxAWBw9gB/ByQUb3OFFKQw/wKpgMoRmR4ehX108b7lxgnsag5A3+gS6mMTNh0CmW2UvZonemegXPMCyUbDUWCnBWG0Jl5vieeS2b87CR8p3IPEtZ8xnR+EWsKUWry75r3O6Lo61ZF0J1vojnA163h7GLVA73h4tnxa4y+s4TywJiH4fBWWEohGSqZh+58nKGUgl1l/FF6FQ+C1j0uedhU1a7ykDuTWftpu/bswzWCGhhTnLYvVEOGp79q4Q4VefPWIe8FNH8hsHxm97XNSs61f52iJ4INiu8uK5l3yW4vah4tPP83FZtc/DIesjaWdwdS4Qe2oPSWVWE6UMDddIc3IE9xm6ItizFmnTEawJ58McqQ9U=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D58609778F27B346B8C6F934138BFC5D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6318028d-8239-47c7-b736-08d8224d7300
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 08:12:10.8774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JzR/49QpKheqcDolNHF+271WT7GwDDibNWRhNJwB1IYBoCKfyZ8MZeF2kOOfTVXqFRFC4B0fSe2M+hA8Zg8W+219zc0EJaH+n8t1dPCTZ6r8WPWWlglkr1XxR/9ZtUtq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4308
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

DQpPbiA3LzcvMjAgMTA6NTggQU0sIE1hbmlrYW5kYW4gQ2hvY2thbGluZ2FtIChSQkVJL0VDRjMp
IHdyb3RlOg0KPg0KPiBIZWxsbyBUZWFtLA0KPg0KPiBJIGFtIHRyeWluZyB0byBidWlsZCB4ZW4g
aHlwZXJ2aXNvciBmb3IgUkNBUiBhbmQgZm9sbG93aW5nIHRoZSBodHRwczovL3dpa2kueGVucHJv
amVjdC5vcmcvd2lraS9YZW5fQVJNX3dpdGhfVmlydHVhbGl6YXRpb25fRXh0ZW5zaW9ucy9TYWx2
YXRvci1YIHN0ZXBzLg0KPg0KPiBCdXQgYW0gZmFjaW5nIHRoZSBmb2xsb3dpbmcgaXNzdWVzDQo+
DQo+IDEuU1JDX1VSST0iaHR0cDovL3YzLnNrL35sa3VuZHJhay9kZXY4Ni9hcmNoaXZlL0Rldjg2
c3JjLSR7UFZ9LnRhci5neiBpbiByZWNpcGVzLWV4dGVuZGVkL2Rldjg2L2Rldjg2XzAuMTYuMjAu
YmIgaXMgbm90IGFjY2VzaWJsZQ0KPg0KPiAqTW9kaWZpY2F0aW9uIGRvbmU6KlNSQ19VUkk9aHR0
cHM6Ly9zcmMuZmVkb3JhcHJvamVjdC5vcmcvbG9va2FzaWRlL2V4dHJhcy9kZXY4Ni9EZXY4NnNy
Yy0wLjE2LjIwLnRhci5nei81NjdjZjQ2MGQxMzJmOWQ4Nzc1ZGQ5NWY5MjA4ZTQ5YS9EZXY4NnNy
Yy0ke1BWfS50YXIuZ3ogPGh0dHBzOi8vc3JjLmZlZG9yYXByb2plY3Qub3JnL2xvb2thc2lkZS9l
eHRyYXMvZGV2ODYvRGV2ODZzcmMtMC4xNi4yMC50YXIuZ3ovNTY3Y2Y0NjBkMTMyZjlkODc3NWRk
OTVmOTIwOGU0OWEvRGV2ODZzcmMtJCU3YlBWJTdkLnRhci5nej4NCj4NCllvdSBjYW4gdHJ5IHdo
YXQgd2UgdXNlIFsxXS4gQW5kIHRoZSBpc3N1ZSB5b3UgYXJlIGZhY2luZyBpcyByYXRoZXIgWW9j
dG8gcmVsYXRlZCwgbm90IFItQ2FyIHNwZWNpZmljLCBJTU8NCg0KWzFdIGh0dHBzOi8vZ2l0aHVi
LmNvbS94ZW4tdHJvb3BzL21ldGEteHQtcHJvZC1kZXZlbC9ibG9iL21hc3Rlci9yZWNpcGVzLWRv
bWQvZG9tZC1pbWFnZS13ZXN0b24vZmlsZXMvbWV0YS14dC1wcm9kLWV4dHJhL3JlY2lwZXMtZXh0
ZW5kZWQvZGV2ODYvZGV2ODZfJTI1LmJiYXBwZW5k

