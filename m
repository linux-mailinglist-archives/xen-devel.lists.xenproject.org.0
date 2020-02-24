Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5C916B552
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 00:22:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Mzu-0006a5-IQ; Mon, 24 Feb 2020 23:18:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uC+N=4M=renesas.com=yoshihiro.shimoda.uh@srs-us1.protection.inumbo.net>)
 id 1j6Mzs-0006a0-TD
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 23:18:44 +0000
X-Inumbo-ID: fed4595c-575b-11ea-926b-12813bfff9fa
Received: from JPN01-OS2-obe.outbound.protection.outlook.com (unknown
 [40.107.141.113]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fed4595c-575b-11ea-926b-12813bfff9fa;
 Mon, 24 Feb 2020 23:18:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIFiDt6zVP3bJ3/bC5ZdPajL7n4RVF4lH7jfADQWmurm4kWPv7SQ+kV+RrPeZpkrgN+p0xc5q9z+B7ZiRWZGN4y710L+suvGpAvZhD3krsvAqNgwVN16HQLEIhHcBckubFYX2eI84waGzkEKNhUDb0gIsBjNJvWP1131+J81LgRCXUDB9AsYmxcNNXLmz800jcMVk7MIp/pa4+reIXodg35FC/4kPa2L0yde4FkOrGj8aXRUxnOdKbNyP2BYsBEd636XcZWigWnalp6kSTaAs3X8WzbhkjQ9R+iPIYDdmJGYg4jonMVDNQzEzYv6EGalBTVLD14idObyqmgi9cyjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEUzubGUs1sPoUFA8gkh7nWVVPlZ+Qz+4oLiw9Tonew=;
 b=cKUE953f6AtwHQtr74RkdIWxhsCM0WCpsWuuNRHKrMN4lWpRf4cM8V3BR6EZAseXCikPR8H443bz32e2JF9p0PBWuB8gMFA18YeeaQLJhHBKdpDaKB0tsCG0XnvquoAWy1MY3weNVhpJTpNiv03ysM3B4V202z73pH7xG/xnb7WZQ7WqHAx6mq5AopYLvC0qLZh3GGEEIlWAdf7lev9b7lLFf0dnnH57a4+DPxhFagbGNne+siK3ehpjWBqRcvO1i1bWd4BZ/cOiSYG7CRd8M9U9P2nNNkqJp3FLnx5ST96qa0nanSOete1s1vRAxB6PdG2qUu1QAWDOPMBAT7ZJVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEUzubGUs1sPoUFA8gkh7nWVVPlZ+Qz+4oLiw9Tonew=;
 b=pwlGT16SSkeTcfKoWIBr1d34GlxNBfAkpMlzzLPnplZ9f+h7xZK1uEHfsP6mqaTcb49ZxciwMqYlYzEpRzIPX1Lwnr3dGXQEwRMM5dnzClEA2twKfzOtfBqrczxQ9J42bN22scp8ok6z/X4fvmcc8WzgThOnJTMR7+CvdA2jAOQ=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3680.jpnprd01.prod.outlook.com (20.178.138.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17; Mon, 24 Feb 2020 23:18:40 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::dccc:154d:a04e:3ee3]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::dccc:154d:a04e:3ee3%3]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 23:18:40 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V2] iommu/arm: Don't allow the same micro-TLB to be
 shared between domains
Thread-Index: AQHV5aO6Hf58YyJtEUexQIy/H5HDm6grBdQw
Date: Mon, 24 Feb 2020 23:18:40 +0000
Message-ID: <TYAPR01MB45449D0E8B0C2C0357A22F86D8EC0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1581951935-5279-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1581951935-5279-1-git-send-email-olekstysh@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 01c4b1b7-d859-4401-7453-08d7b97fe22b
x-ms-traffictypediagnostic: TYAPR01MB3680:
x-microsoft-antispam-prvs: <TYAPR01MB3680EAADCB21B091B9FEA981D8EC0@TYAPR01MB3680.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(39850400004)(136003)(396003)(366004)(346002)(199004)(189003)(54906003)(4744005)(86362001)(66946007)(66556008)(66476007)(76116006)(316002)(66446008)(2906002)(7696005)(186003)(64756008)(478600001)(81156014)(26005)(9686003)(8936002)(55016002)(33656002)(4326008)(5660300002)(81166006)(71200400001)(8676002)(52536014)(55236004)(110136005)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TYAPR01MB3680;
 H:TYAPR01MB4544.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /SpaJGzxzHyEpxqK0J/i0evUMVS+BRPGkFSsSlKHLnDlwt4DJYBJOlK+Ub8n0UbPoovTtTJ4o+NaeZ+0B0a6xV0gg44a5ULjUGizsy8xSYMY39+FaWgtfNRs5lY6Cq6FoxYaueGzGumYNe/LP2siM2yEBMpcdX/trTlkj/m3913cZIjFv8v38l4LhKZZaTlTcQ5kkBe9IxP7qEu6mo+N7NoeM9alqoxdQBd1uSwVFxQzRL3LtmHfKfnbPhbve7PBDClP9PJ4468wO/hbD/K5BFTwaERic2Qe+LhLIwV/NBsv7ie1CfbjYxj06lgHVmQVNSxMN7HUpeZvK+BQbKyO883XpKTOXw91dvm5lHPNFmZg6z2rSP1JDgHEOOJt42mOaklADS4El/7vuwne3kGTDj9hQFU38EDIXpuCwYVyEa0gHpyj5TFcEUgMoP12RR7K
x-ms-exchange-antispam-messagedata: 25w+SRjUMuqCH9IeKd2HqMCCsbmJj7+Dfcs6qNWoRuaFW44ITe1Z0UNVvxuVTUyA/AtiwjEuUbQ2N3IBVhewOB7Cn8HlulKCjuM4vjMIzEPxWeZGXgygTv0HtTvBG2Rfbwi7TSgUEEa48IJoVDfxNw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c4b1b7-d859-4401-7453-08d7b97fe22b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 23:18:40.1049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6KseSIrXmSuDkxZ0OjHxMelL7gNTsdSNzufzm4O6uqEsFVJG6pO6XJZjl/w/yZt/e6AmvyK6RxnDxih2+7ukeQB45C6UVSEWiDaxsv7xT6PsQLXtnSdjRrMbKPvnYLFC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3680
Subject: Re: [Xen-devel] [PATCH V2] iommu/arm: Don't allow the same
 micro-TLB to be shared between domains
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLXNhbiwKCj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28sIFNlbnQ6IFR1
ZXNkYXksIEZlYnJ1YXJ5IDE4LCAyMDIwIDEyOjA2IEFNCj4gCj4gRm9yIHRoZSBJUE1NVS1WTVNB
IHdlIG5lZWQgdG8gcHJldmVudCB0aGUgdXNlIGNhc2VzIHdoZXJlIGRldmljZXMKPiB3aGljaCB1
c2UgdGhlIHNhbWUgbWljcm8tVExCIGFyZSBhc3NpZ25lZCB0byBkaWZmZXJlbnQgWGVuIGRvbWFp
bnMKPiAobWljcm8tVExCIGNhbm5vdCBiZSBzaGFyZWQgYmV0d2VlbiBtdWx0aXBsZSBYZW4gZG9t
YWlucywgc2luY2UgaXQKPiBwb2ludHMgdG8gdGhlIGNvbnRleHQgYmFuayB0byB1c2UgZm9yIHRo
ZSBwYWdlIHdhbGspLgo+IAo+IEFzIGVhY2ggWGVuIGRvbWFpbiB1c2VzIGluZGl2aWR1YWwgY29u
dGV4dCBiYW5rIHBvaW50ZWQgYnkgY29udGV4dF9pZCwKPiB3ZSBjYW4gcG90ZW50aWFsbHkgcmVj
b2duaXplIHRoYXQgdXNlIGNhc2UgYnkgY29tcGFyaW5nIGN1cnJlbnQgYW5kIG5ldwo+IGNvbnRl
eHRfaWQgZm9yIHRoZSBhbHJlYWR5IGVuYWJsZWQgbWljcm8tVExCIGFuZCBwcmV2ZW50IGRpZmZl
cmVudAo+IGNvbnRleHQgYmFuayBmcm9tIGJlaW5nIHNldC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBP
bGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4gCj4g
LS0tCj4gCj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4gQ0M6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDQzogVm9sb2R5bXlyIEJhYmNo
dWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgo+IENDOiBZb3NoaWhpcm8gU2hpbW9kYSA8
eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+CgpUaGFuayB5b3UgZm9yIHRoZSBwYXRj
aCEKClJldmlld2VkLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhA
cmVuZXNhcy5jb20+CgpCZXN0IHJlZ2FyZHMsCllvc2hpaGlybyBTaGltb2RhCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
