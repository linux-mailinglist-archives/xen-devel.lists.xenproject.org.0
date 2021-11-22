Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471DE4590A0
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 15:54:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228952.396227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpAiR-000348-O0; Mon, 22 Nov 2021 14:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228952.396227; Mon, 22 Nov 2021 14:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpAiR-00031n-K2; Mon, 22 Nov 2021 14:54:43 +0000
Received: by outflank-mailman (input) for mailman id 228952;
 Mon, 22 Nov 2021 14:54:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zq3Z=QJ=dornerworks.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1mpAiP-00031d-Pn
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 14:54:41 +0000
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0604.outbound.protection.office365.us
 [2001:489a:2202:c::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d92e668-4ba4-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 15:54:40 +0100 (CET)
Received: from BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:40b::16)
 by BN3P110MB0498.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:40b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 14:54:36 +0000
Received: from BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM
 ([fe80::ac43:aa11:ae5e:da54]) by BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM
 ([fe80::ac43:aa11:ae5e:da54%6]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 14:54:36 +0000
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
X-Inumbo-ID: 1d92e668-4ba4-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=CVoz8R0cRaB/HM9zeX8vZSB1bB0LXsUrfznrpUq0yAEjFL5ZdBRVMsOISjW8dkg0d0Cm/sOAiXRdlHNPrYX+j7baohRXWeDTGl0gnUvPIPxzz3FTik3IsbPT0YdWnJqG869WeuDg0yqTuWjJyYvRXhV9OlZw0LOaLf2mjJtiYoSddYumbPkg4jBVgpcjIuwkenSkMP5XnMtGkRlJNpGw2H+maE3RAaPms5qIc+Z8v9GFaBO6FJ8VPYRdzFXMUwtmZCkufV8kY88veOZ87lc6GYEJ/rTYWm7s4CbrvN2NVk4G2kpF+zcAbvUwQs3BS+l1FOOccKT7yVKqUr5aK9EMkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=m0npmkhjOYDnSSNQCT8/EGwu+NihJtkLjwgge6dveg4=;
 b=lV7sMy7YURLrFcsl8/0reSglWj8w6cfY9JOZJMN+SNSb9WMcJmw9o9bwcLz9fsfJRdkzKREXO4Mie68kqEJiNhs+ITmP4JthMMBn7Ss7jdFFk18emRgQtaJy+igKwFcg1HrElksdUsZ4cNiJ9t8wC7NaMO+uPkBFc3SR3YrATn+Brqm3jbto2H7mdfYcRcP1t2NcA/2X64XU0GyPNHlDmxzKlrwOoVdSl8qmvjv0z6YMc6Xqnp2GY5vxACve04HlwvMzVnypxEXdmVBqBgB51YWQCOD7Cbrl4xoK9J9Hv0ocw5lLipq/a7tsVu6MzhaIA+a7VajjXIU1J3Li5DPRHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0npmkhjOYDnSSNQCT8/EGwu+NihJtkLjwgge6dveg4=;
 b=Yn+BPnkmENcn6WY2UXga63iGjygjIsxqFlEWdK05KtdJ6qz/EkNI3i5f1cMKIazL6RAi+HBoWu7ejQNe+gWIlilV/H0024S+8ICFDDvCE+T3FYj4zrBt2CxQxDwHdjd2mCMH5r+dnTTxNRmWryAlSkix7NGwWPvif8yTcqTLvbO+Dmnpf/y9c8+WrQkwUE+Tg5NgJxyV9bR9wtM6GBaaT6Cvfv2yFNdyRWqi0MJGPQSSm67qk+xP4e9mZo9IHe6I37rGubo3JkeV2GiuSmyrz2/3rrpLEj+SagOVCqkFLQwKacUpE8tnfc1G+Wn8+B6rEspUMU11ns94YTKH10+kpg==
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "joshua.c.whitehead@gmail.com"
	<joshua.c.whitehead@gmail.com>
Subject: RE: [PATCH] MAINTAINERS: remove Josh from ARINC 653 maintainers
Thread-Topic: [PATCH] MAINTAINERS: remove Josh from ARINC 653 maintainers
Thread-Index: AQHX36vD17guMUdgIUiaApgKD9n8y6wPng8AgAADJpA=
Date: Mon, 22 Nov 2021 14:54:36 +0000
Message-ID:
 <BN3P110MB0484716C62279B1525F351E88C9F9@BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM>
References: <20211122141742.3075-1-stewart.hildebrand@dornerworks.com>
 <c0228394-2dfe-717d-e35e-7120621df27f@suse.com>
In-Reply-To: <c0228394-2dfe-717d-e35e-7120621df27f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dornerworks.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39fdcfb8-87f4-4381-1c2d-08d9adc800a1
x-ms-traffictypediagnostic: BN3P110MB0498:
x-microsoft-antispam-prvs:
 <BN3P110MB0498E00D8678BDE29AB21AE08C9F9@BN3P110MB0498.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:404;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hCAFzqU/5xX4nPG9ujyEDYS9XwFsixgY/tcFIUF2frKQWdbgPxmjZLsu5LESt9TlMasWdqws57x797I/yoIQ/kqLgpHD0/sDhzP0htt1sbB+oJfcyLsbMwJ6JtJIKz3qKfYw6SNBo1NvhhK8oNWvgnnvREx7/n3mlobcVTGnGKX1vlrpeRFm+tLGkISSW4QdMSF3k9Uoqi3DNTG0k3Dh+ep2udmML5Xvll8CyVj1Poa0HoK+A67e4zRbWvDNPoa8vXnxCPGPdahgSKDY+euE6uP1G0wZlzurEQ6JuYwBM/gu7ytRodaHggsrwt5PBhAfXKbHSb6Btb+sf1+HU2wXSJGe6H0MloIWYBKDenekNRKIGWfDGngCEnH7UBu3qS1jbhHK/x7FRdKBMTnDAIwexRwoY/Du1OUy+rW9REA4F+5pkivOmwmXzp7MzoHiwfC3eayPWSb+nEyyXd0Ejke2Ma43ZzaIfiQF1KWpxKQNXNqkju4CB8fiIjwTY/OPSG46nw3QnpoBq5fAaXk+6DYlZxJZiE0Ux4XzBpA3Hmyq/lC3gn9rhGrf2O/7b8HpwpUQ2921aM2amkmx91BKXBMkkUysIZEIfT1UbJpXv2JziFwEnTd+XCpiCSun7zOEw9zs
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39830400003)(346002)(376002)(396003)(66446008)(5660300002)(38100700002)(122000001)(66476007)(54906003)(316002)(66946007)(2906002)(6506007)(6916009)(9686003)(76116006)(64756008)(66556008)(71200400001)(4744005)(86362001)(52536014)(55016002)(508600001)(4326008)(8676002)(38070700005)(186003)(7696005)(8936002)(83380400001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 F5zR0/fEDI1H8tSDhiCo/1p7w4xovw0CvVbPwlUHKJ0AZiGSFyA3j1UqLy+7CmLTzJ46MfK+gNlZDukHskB8p5SFLahqVfa3TUoZx5popeEHGZfJZmXFRL3MxFcJQlknVtoLEZRvwxp0qbFwFd6E3QXXIrlTTd4eRFjjh5KI5BNR6EDcbUiyaW/MrrjAY546OHA6p+Vpax/uMvBJOHlRjzr7Frw2NXbfV8dY9hJRvio6ERiz/OsF6dJ4o9o2TBkMdPvqzejCKdd217APnGCUCuqZwklChS0RPe1AUnryES0OMk/6t9opNVqmxqwtW0OMWjJR1qRzHHsHxvSLfZ/b7RW3gpk9Zdtzr5v+/GA7xo7pxGbA4TvTnpO10XVOI83DLm1zx2s9xyPwr3g3SF8RUSNIgE/hnURC/iNP07H52wokustF1CG44GUMBgZrSmP/vK/JFpDnVuRclYtPt9mlADGn6hxzDzEbo09x1F99cUikmHgnoaRhNjL1Urncv8UesFHsnlng/jXZb47K6mM01eHuDQm8dRrJ/4GeE7X6jJfOKoDc8lppo2DYr6vLZ/AfwzPWEAtmL8hK8/upm89PTfirHCNbjUECLgCNvj2shS2E/lu4BGZl5HA3A38e+HSKIX+h0hQ5qx1IKNyEBaOzUwAXnqKzJIcviKA9kP8YuUhf6BV3XXop8APFINcFEOlj7VmqoTEKWMKkGu57SjezTEohSGKAn+1TxOeGb+nFjzvpb2PoS1enb8YXRJ4taZinzxo1frWRyfD0lkUaH/5qGzEpn5dqcyeHz8DUttws2jE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fdcfb8-87f4-4381-1c2d-08d9adc800a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2021 14:54:36.4239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3P110MB0498

T24gTW9uZGF5LCBOb3ZlbWJlciAyMiwgMjAyMSA5OjM5IEFNLCBGcm9tOiBKYW4gQmV1bGljaCB3
cm90ZToNCj5PbiAyMi4xMS4yMDIxIDE1OjE3LCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6DQo+
PiBKb3NoIHdvcmtzIGF0IGFub3RoZXIgY29tcGFueSBub3cNCj4NCj5Zb3UgZG9uJ3QgaGFwcGVu
IHRvIGtub3cgaGlzIGVtYWlsIHRoZXJlLCBkbyB5b3U/IEVsc2UgaWYgd291bGQgaGF2ZSBiZWVu
DQo+Z29vZCB0byBDYyBoaW0gc28gaGUgY291bGQgY29uZmlybS4NCj4NCj5KYW4NCg0KSSBhZGRl
ZCBKb3NoIGluIENDLiBKb3NoIC0gd2lsbCB5b3UgY29uZmlybT8NCg0KU3Rldw0KDQo+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBTdGV3YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBkb3Ju
ZXJ3b3Jrcy5jb20+DQo+PiAtLS0NCj4+ICBNQUlOVEFJTkVSUyB8IDEgLQ0KPj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIv
TUFJTlRBSU5FUlMNCj4+IGluZGV4IDQ5NTZkYjEwMTEuLmZjOGIyYzExNjkgMTAwNjQ0DQo+PiAt
LS0gYS9NQUlOVEFJTkVSUw0KPj4gKysrIGIvTUFJTlRBSU5FUlMNCj4+IEBAIC0yMjEsNyArMjIx
LDYgQEAgRjogICAgICAgIHhlbi9pbmNsdWRlL3hlbi9hcmdvLmgNCj4+ICBGOiAgIHhlbi9jb21t
b24vYXJnby5jDQo+Pg0KPj4gIEFSSU5DNjUzIFNDSEVEVUxFUg0KPj4gLU06ICAgSm9zaCBXaGl0
ZWhlYWQgPGpvc2gud2hpdGVoZWFkQGRvcm5lcndvcmtzLmNvbT4NCj4+ICBNOiAgIFN0ZXdhcnQg
SGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJyYW5kQGRvcm5lcndvcmtzLmNvbT4NCj4+ICBTOiAg
IFN1cHBvcnRlZA0KPj4gIEw6ICAgeGVuLWRldmVsQGRvcm5lcndvcmtzLmNvbQ0KPj4NCg0K

