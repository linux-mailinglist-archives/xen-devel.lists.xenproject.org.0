Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BB6203996
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 16:34:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnNWN-00067z-4g; Mon, 22 Jun 2020 14:34:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+IWF=AD=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jnNWM-00067u-DB
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 14:34:02 +0000
X-Inumbo-ID: 67c895e0-b495-11ea-bca7-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67c895e0-b495-11ea-bca7-bc764e2007e4;
 Mon, 22 Jun 2020 14:33:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOo85M+L+9z5oyyd+xwWwrJlMdVud17kCNV26VKYBVJkUImd0WCvTT+a6pRmsnuVcb8BozPLJ+nq2Ubp6t3uydFbVVXsI04S2sBqDWs8jadYxUSd4lC7JN9R+H/DUdFnwa5RXaCq0f8aN/aiUDgXDJxu8RcK8N6oFgUIXf3J1IFlV32wrh6kT4HYAjQ5aeOz3r4bPwLbeGxNl3RMRgCRTjVDiIklen+h2/G8eogCG9O6AeDgJnx/LeE0WM2yvTMeMqspLTAwmEgTF510c2jMDAsKlx/HVvhgPAtucczvzXlgAtxm3HtID10RkQ4Xic8t/WcQoYUrzn62i5NKn2SBQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1MVAF7AYJDnpBfewUOntEO3RdJbQ5xhbYNZrtFpTLE=;
 b=DlTU4pOBGsNvoRQVuA9Ix7pbcSuJvbGv5eopP08VLV6pEXzqGfaqx2epKX2WEaqaRn32+OpqW0E4zsIghNg5X4zDnCYJazi3QFxNSmXqIoT/r84T6d15Yx2JJAUA5XDLlsihjCEZOtKHWC/hW0736rtKybR1SU1lH3eHY83v1HqeyDKbgKdG78SUDTegE+5PNdkleEZPZi4cln/hFUdWr0MSlAEI+XhzMmq7tXxNtGqMxcCoDIg5by5k+4DNc0rw2lX772k4hH3/IS8T5/unL26hZfbgWtA11/fg3BigTovgysB+ZYAsQd41geciq+LMMLQ82eZFVnY112SGd4iTvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1MVAF7AYJDnpBfewUOntEO3RdJbQ5xhbYNZrtFpTLE=;
 b=H8Z1QhfZ581m6nShu5xMtBw/K98Bg3ZaY4Bb4VScaFUL+O09YwAcLhOAyH9xzeNvs1C/X5gyZ66V+Cc0vM2Er5ATWlzjSfKqN9bcPKe3kVx7vszGHdZorWJkGX+g8kNgzNjSyXUa7wgEJMAjn4K/f4AY6msv+cX/1u59Ol9/NBdIFplH05KJj2rhiq76+o7+7KbueHGBBlJtNSxoqvaGRxQmJenhFHfSpCw2wqTYTfjrGwtyNjWwrA1vedJT+U8h1nRuUJtbeiEwXtetb3Aqs+/W2Weh9ux4wdpWxVvng8O0kwdVd6YuGGUZud/eG8MbW/zF34qssUoACgyLok5VrA==
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com (2603:10a6:803:72::14)
 by VI1PR03MB6238.eurprd03.prod.outlook.com (2603:10a6:800:13f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 14:33:54 +0000
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4]) by VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4%7]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 14:33:53 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien.grall.oss@gmail.com>
Subject: Re: UEFI support in ARM DomUs
Thread-Topic: UEFI support in ARM DomUs
Thread-Index: AQHWOoSI1wnhumD+IkWBnAQX9mudyajIlWsAgBVWbwCAAJ62gIAAeBOAgAANxQCAAWPDgIAEUtgAgAAGgYCAAAHAgA==
Date: Mon, 22 Jun 2020 14:33:53 +0000
Message-ID: <4ece84cf-dd68-6eb4-a0e2-e9008d264ba5@epam.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
 <alpine.DEB.2.21.2006191020110.12730@sstabellini-ThinkPad-T480s>
 <c5905f40-6d0a-358f-35e4-239e88ace7d8@epam.com>
 <94bfe57c-c1be-62b4-3799-b90415264487@xen.org>
In-Reply-To: <94bfe57c-c1be-62b4-3799-b90415264487@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.245.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a8a8e7c-8980-4221-0e14-08d816b94a0b
x-ms-traffictypediagnostic: VI1PR03MB6238:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR03MB6238CB9F67F428E31512920DE7970@VI1PR03MB6238.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0442E569BC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dGRqQBXJphRu1kADDgr9VLuQDYyDf3hq3bX3OdL2nXng2RJRKsVewzq2XVyV1LUvczPRdJcGshMl/xNjwpg2OAmMFVw/l7o1XimQ7BvPmWtuUyG3koKmzqJmFdpbLCTC8FfZDpATELgZUUpDexf8OmB8fItXwUNcyC0xQIiPr/j9ko4YTGcl3wT6LWjbjKlxZLRq1vM4HHd8IRAFh7tHvyoKk5iSybZParXGswE4m/076Bd0J7nJ1eklUQgrwkAyd6B7OwlVZM5/5zuJKXlM80Ay49Izl5WpOLf9o07+W5vhprlAsxM0/IktM5ekZ/Zp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB3998.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(316002)(5660300002)(8936002)(36756003)(478600001)(8676002)(31686004)(7416002)(54906003)(6512007)(4326008)(110136005)(66556008)(64756008)(31696002)(26005)(91956017)(76116006)(66476007)(66946007)(66446008)(2616005)(2906002)(186003)(86362001)(71200400001)(55236004)(53546011)(6506007)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: KUYyrZOsG2OCdmIyXganATft7xNx1WM6wXesiHVyXD2Jg+GjXfQQwWUI1b7jQ8JV+y0NjdEHQMQxwlLWIlHxroTVdEO6GAsuspQyn8nMLAHXuJI0v0kOl7wocnINQnc8KMC7AmpDDMYtui9ANynJz7AVmIIv4XPFPbGEz9sEgygIs4AXqyrLIz3nIpuQoVBa8I/1Wlg/TloGOGBxWj/V/BvPE7AHcFPR/XQLy7+whnwaY2wp+eItDcjc8DQpU+P8vVSq+U5D2NV2OEKANE+Tv0GuUzPXVr9T5TBn5NTUV2gaSA+5m4vMNIs/evMGzfNddKry1ejgpy1QRq4jjoRxSffDCV+aqkyUZI8JaGsqCElchNd4E3u32SB34TmLsbIi8iJ2BbL5CVjvg6t9WPpNp0KDZuZsIA8Ba39nrtw1uOHUBdh1u0jCjwGjDX6R75dl3Qfaf8cWihUOfFisjOwqO5I3oAPRuOaCnMDuRdrSdv1DRCoDF5dGDZ41S+3OY6tt
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B4F707C5A06344B9ED31CE4B55D91A0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8a8e7c-8980-4221-0e14-08d816b94a0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2020 14:33:53.8195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zbxb5eLMi/KnXF2LsLMiQ8pIujU7BjshSWZ7YKkE2tdL8ioWX4L1wFia0t3vAIVjyl7/f5qSs0oD8x6Vqjn7TyP+uohVzEPmweEgQOwhrmtkeEBzHsEXBlywzfO5N/ga
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6238
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
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiA2LzIyLzIwIDU6MjcgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgT2xla3NhbmRy
LA0KPg0KPiBPbiAyMi8wNi8yMDIwIDE1OjA0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90
ZToNCj4+IE9uIDYvMTkvMjAgMTE6MDIgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+
PiBPbiBUaHUsIDE4IEp1biAyMDIwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBpZmVxICgkKENP
TkZJR19YRU4pLHkpDQo+PiBhcmNoLXkgKz0gLURfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fPTB4
MDAwNDBkMDANCj4+IGVuZGlmDQo+Pg0KPj4gYW5kIHdlIGFsc28gaGF2ZSBYZW4gNC4xMyBoZWFk
ZXJzIGluIHRoZSBVLWJvb3QgdHJlZS4NCj4NCj4gU29ycnkgaWYgdGhpcyB3YXMgYWxyZWFkeSBh
c2tlZCBiZWZvcmUuIFdoeSBkbyB5b3UgbmVlZCB0byBzcGVjaWZ5IF9fWEVOX0lOVEVSRkFDRV9W
RVJTSU9OX18/DQoNClRoaXMgaXMgYmVjYXVzZSBvZiBpbmNsdWRlL3hlbi9pbnRlcmZhY2UveGVu
LWNvbXBhdC5oOg0KDQojaWYgZGVmaW5lZChfX1hFTl9fKSB8fCBkZWZpbmVkKF9fWEVOX1RPT0xT
X18pDQoNCi8qIFhlbiBpcyBidWlsdCB3aXRoIG1hdGNoaW5nIGhlYWRlcnMgYW5kIGltcGxlbWVu
dHMgdGhlIGxhdGVzdCBpbnRlcmZhY2UuICovDQojZGVmaW5lIF9fWEVOX0lOVEVSRkFDRV9WRVJT
SU9OX18gX19YRU5fTEFURVNUX0lOVEVSRkFDRV9WRVJTSU9OX18NCiNlbGlmICFkZWZpbmVkKF9f
WEVOX0lOVEVSRkFDRV9WRVJTSU9OX18pDQovKiBHdWVzdHMgd2hpY2ggZG8gbm90IHNwZWNpZnkg
YSB2ZXJzaW9uIGdldCB0aGUgbGVnYWN5IGludGVyZmFjZS4gKi8NCiNkZWZpbmUgX19YRU5fSU5U
RVJGQUNFX1ZFUlNJT05fXyAweDAwMDAwMDAwDQojZW5kaWYNCg0KU28sIG9uZSBuZWVkcyB0byBz
cGVjaWZ5IHRoZSB2ZXJzaW9uIChRRU1VIGRvZXMgdGhhdCB2aWEgaXRzIGNvbmZpZ3VyZSBzY3Jp
cHQgYWZ0ZXINCg0Kc29tZSB0ZXN0cykNCg0KPg0KPj4NCj4+IEZvciB0aGUgZmlyc3QgcGFydCAo
X19YRU5fSU5URVJGQUNFX1ZFUlNJT05fXykgSSB0aGluayB3ZSBjYW4gcHJvdmlkZSBpdCB2aWEN
Cj4+DQo+PiBDRkxBR1Mgb3Igc29tZXRoaW5nLiBUaGlzIGNhbiBhbHNvIGJlIGRvbmUgZm9yIHRo
ZSBsb2NhdGlvbiBvZiBYZW4gaGVhZGVycy4NCj4NCj4gX19YRU5fSU5URVJGQUNFX1ZFUlNJT05f
XyBzaG91bGQgd29yayB0aHJvdWdoIHRoZSBDRkxBR1MuIEFuIGFsdGVybmF0aXZlIHdvdWxkIGJl
IHRvIGFsbG93IHRoZSB1c2VyIHRvIHNwZWNpZnkgdGhyb3VnaCB0aGUgS2NvbmZpZy4NCg0KWW91
IG1lYW4gc3BlY2lmeWluZyB2aWEgS2NvbmZpZyBzb21ldGhpbmcgbGlrZSAiMHgwMDA0MGQwMCI/
DQoNCkFuZCB3aGF0IGFib3V0IHRoZSBoZWFkZXJzPyBIb3cgd2lsbCB3ZSBwcm92aWRlIHRoZWly
IGxvY2F0aW9uIGlmIHdlIGRlY2lkZSBub3QgdG8gaW5jbHVkZSB0aG9zZQ0KDQppbiB0aGUgdHJl
ZT8NCg0KPiBDaGVlcnMsDQo+

