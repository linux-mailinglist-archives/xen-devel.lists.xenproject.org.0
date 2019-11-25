Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F023108B89
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 11:21:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZBSd-0003DH-Cx; Mon, 25 Nov 2019 10:19:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k6Mi=ZR=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1iZBSb-0003D7-50
 for xen-devel@lists.xen.org; Mon, 25 Nov 2019 10:19:13 +0000
X-Inumbo-ID: 05323ef4-0f6d-11ea-9455-bc764e2007e4
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.51]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05323ef4-0f6d-11ea-9455-bc764e2007e4;
 Mon, 25 Nov 2019 10:19:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFX2CDhmmtqnLdFqq6dh68simyL6g+pJ8xWIiuH65p4nG5tX/TeokrR/gxNXFEIzNJaw3XbZi0OWZmv4yZGMOWkNBdRD3C1WKuJijmRQ+Opd/i61KwT4meGWd58EGUl7/bLWE6zXhlasmN2eElJoGWs/43wWuMaN2A4Ur0QXsrWLNLqdVmTcmGJ22LYQYZy8CnMi6MygSwGg0Ojbgfrl4yI52kjV8GCyZHJsWJR7vnHLbv82ys5IlEKhClYcEBEv5ofzz2MgudyLumRPEV1NwAhHv1CAtp+FGYJjVRzFlImmjYtj2Wy2uecwSo58DNRhvA5UWxhftu7SQR3/VMn0Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=go8sg3x1pNYZeOD2eDw5N+Cld7WjzbfweNKV0JnNpIk=;
 b=bDT+DzqE40YXoP8LdV+Y2eDFDFLBA6B7VH0T61coRfv/g8l2uV+6kp8zI0MG8ItZ6f7HAtB592E4a8KEvtVGJDj5cyjNcEdR9MbdpPYwvbuOArd5kWwIGb6bb+CzD0ZvM5DdWSxB0UcNfjL3DPptEgbQildlOeq238AKNCZuFTXy5KsgHmzwn3KzKDegjEauHRHfWh/ldwazO2RIJT4eX1KMckwdB8nPyyDJp8D3O2n7pOHmOXpwp9q67STdrSPuENHMtXSWnDkbyPs56atyMDjv8u5mCQfUKhkoFlgfj0D4D/47Nr5Q30yT6YfNHvcRf7LsDxrDkIab16Wpy6T8SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=go8sg3x1pNYZeOD2eDw5N+Cld7WjzbfweNKV0JnNpIk=;
 b=Hmu/fkI4tik6h1TL0d0WqRuXywUDhOgLBRSaLP+ZzMRg1pkVR/Y3qClp1vBwEL+gmR8mgBEv7OxRVovjpjL3RiaoRP1W6MOBO49TLQqODSMZWrK3nuaI0SJJ1PVh1GulbA9Lzox7hAiNecZUGwyNAN8idV99UST5AKUXpkUheas=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0SPR01MB0081.eurprd04.prod.outlook.com (20.179.39.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Mon, 25 Nov 2019 10:19:08 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c%4]) with mapi id 15.20.2474.023; Mon, 25 Nov 2019
 10:19:08 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Thread-Topic: vsnd issue
Thread-Index: AdWjeYM0mJR1EPMQS6mJNQqqC3DsNQ==
Date: Mon, 25 Nov 2019 10:19:08 +0000
Message-ID: <AM0PR04MB4481F51148AB1FA7F4A19393884A0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9645897e-8396-419a-2e00-08d77190e8a4
x-ms-traffictypediagnostic: AM0SPR01MB0081:
x-microsoft-antispam-prvs: <AM0SPR01MB008102B7272D4089F4B0B087884A0@AM0SPR01MB0081.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(53754006)(189003)(199004)(8936002)(2501003)(66946007)(76116006)(81156014)(81166006)(66446008)(66476007)(71200400001)(221733001)(52536014)(5660300002)(2906002)(2351001)(316002)(14444005)(3846002)(6116002)(66556008)(8676002)(64756008)(71190400001)(54906003)(3480700005)(6436002)(99286004)(66066001)(14454004)(25786009)(478600001)(256004)(26005)(5640700003)(6916009)(7116003)(6506007)(33656002)(305945005)(4326008)(55016002)(44832011)(102836004)(9686003)(7696005)(74316002)(86362001)(186003)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0SPR01MB0081;
 H:AM0PR04MB4481.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KgsOK4X48AK0/ylF6NX7lYGL/64fSOZKLaFx7a7aw/h8bR9CpQ1kBQbB0h0HNOdec/wagJO9yWJX1BnVd4S1Bc6qKBeDjr0c29QIRLoOR/GZQdjVWHsUYTtJcEV5GpVCN6drvpwJIU8CvD5e3mFsCWFuVxmvgjJlQZYad+aWE47sA3ti2EN70wLf1efReEhvuq1n6KMjFNg2GgTc3CU3EUTd8akua9qGQge12AJ7639H8Ciuv9+s/+uWnummivr3G7o+muwpbLOmLE/3ULrbE3YvqSX2nPjfhYB9dlcHgtqgvY1be3BAMyjMxMhEgk5G40z2O0ewk06JDoiLfAANtmoKob8eFQSJTJ7hBcC6dJgMxJoim2ITF4wrlqUNKiOW/tfZatOYo3ERpZH0yPetWnDUxKReyi5xHhp8D2YAqyigBypVY6urtOdPtAROiXnL
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9645897e-8396-419a-2e00-08d77190e8a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 10:19:08.7977 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pssb2t6y7gvgr523r/eBCyzgFef8kIFlid1thnbt3MpOo/awMt3hFojC2dhSgoMP9KeBjWCKJEXeczjpsoYAUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0SPR01MB0081
Subject: [Xen-devel] vsnd issue
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
Cc: "julien.grall@arm.com" <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQWxsLAoKSSBhbSB0cnlpbmcgdnNuZCBmcm9tIHhlbi10cm9vcHMgd2l0aCB4ZW4gNC4xMyBh
bmQgTGludXggNS40LCBidXQgZG9tdSByZXBvcnRzOgphcGxheSBjb21wbC5tcDMKQUxTQSBsaWIg
Li4vLi4vLi4vYWxzYS1saWItMS4xLjkvc3JjL3BjbS9wY21fZGlyZWN0LmM6MTE1Njooc25kMV9w
Y21fZGlyZWN0X2luaXRpYWxpemVfc2xhdmUpIHNsYXZlIHBsdWdpbiBkb2VzIG5vdCBzdXBwb3J0
IG1tYXAgaW50ZXJsZWF2ZWQgb3IgbW1hcCBub25pbnRlcmxlYXZlZCBhY2Nlc3MKQUxTQSBsaWIg
Li4vLi4vLi4vYWxzYS1saWItMS4xLjkvc3JjL3BjbS9wY21fZG1peC5jOjExMjA6KHNuZF9wY21f
ZG1peF9vcGVuKSB1bmFibGUgdG8gaW5pdGlhbGl6ZSBzbGF2ZQphcGxheTogbWFpbjo4Mjg6IGF1
ZGlvIG9wZW4gZXJyb3I6IEludmFsaWQgYXJndW1lbnQKCldoZW4gZXhlY3V0aW5nIGFwbGF5IGlu
IGRvbXUsIGRvbTAgc2lkZSBsb2c6CnJvb3RAaW14OHFtbWVrOn4jIDEzLjExLjE5IDA4OjI0OjU3
LjQ4NCB8IFhlbkV2dGNobiAgICAgICB8IERCRyAtIEV2ZW50IHJlY2VpdmVkLCBwb3J0OiAxMAox
My4xMS4xOSAwODoyNDo1Ny40OTEgfCBTdHJlYW1SaW5nICAgICAgfCBEQkcgLSBSZXF1ZXN0IHJl
Y2VpdmVkLCBpZDogYWxzYTxodzoyOzA+LCBjbWQ6OQoxMy4xMS4xOSAwODoyNDo1Ny41MDAgfCBD
b21tYW5kSGFuZGxlciAgfCBEQkcgLSBIYW5kbGUgY29tbWFuZCBbUVVFUllfSFdfUEFSQU1dCjEz
LjExLjE5IDA4OjI0OjU3LjUwOCB8IEFsc2FQY20gICAgICAgICB8IERCRyAtIFF1ZXJ5IHBjbSBk
ZXZpY2UgaHc6MiwwIGZvciBIVyBwYXJhbWV0ZXJzCjEzLjExLjE5IDA4OjI0OjU3LjUxNiB8IENv
bW1hbmRIYW5kbGVyICB8IERCRyAtIFJldHVybiBzdGF0dXM6IFswXQoxMy4xMS4xOSAwODoyNDo1
Ny41MjMgfCBYZW5FdnRjaG4gICAgICAgfCBEQkcgLSBOb3RpZnkgZXZlbnQgY2hhbm5lbCwgcG9y
dDogMTAKMTMuMTEuMTkgMDg6MjQ6NTcuNTMxIHwgWGVuRXZ0Y2huICAgICAgIHwgREJHIC0gRXZl
bnQgcmVjZWl2ZWQsIHBvcnQ6IDEwCjEzLjExLjE5IDA4OjI0OjU3LjUzOCB8IFN0cmVhbVJpbmcg
ICAgICB8IERCRyAtIFJlcXVlc3QgcmVjZWl2ZWQsIGlkOiBhbHNhPGh3OjI7MD4sIGNtZDo5CjEz
LjExLjE5IDA4OjI0OjU3LjU0NiB8IENvbW1hbmRIYW5kbGVyICB8IERCRyAtIEhhbmRsZSBjb21t
YW5kIFtRVUVSWV9IV19QQVJBTV0KMTMuMTEuMTkgMDg6MjQ6NTcuNTU0IHwgQWxzYVBjbSAgICAg
ICAgIHwgREJHIC0gUXVlcnkgcGNtIGRldmljZSBodzoyLDAgZm9yIEhXIHBhcmFtZXRlcnMKMTMu
MTEuMTkgMDg6MjQ6NTcuNTYzIHwgQ29tbWFuZEhhbmRsZXIgIHwgREJHIC0gUmV0dXJuIHN0YXR1
czogWzBdCjEzLjExLjE5IDA4OjI0OjU3LjU3MCB8IFhlbkV2dGNobiAgICAgICB8IERCRyAtIE5v
dGlmeSBldmVudCBjaGFubmVsLCBwb3J0OiAxMAoxMy4xMS4xOSAwODoyNDo1Ny41NzcgfCBYZW5F
dnRjaG4gICAgICAgfCBEQkcgLSBFdmVudCByZWNlaXZlZCwgcG9ydDogMTAKMTMuMTEuMTkgMDg6
MjQ6NTcuNTg0IHwgU3RyZWFtUmluZyAgICAgIHwgREJHIC0gUmVxdWVzdCByZWNlaXZlZCwgaWQ6
IGFsc2E8aHc6MjswPiwgY21kOjkKMTMuMTEuMTkgMDg6MjQ6NTcuNTkzIHwgQ29tbWFuZEhhbmRs
ZXIgIHwgREJHIC0gSGFuZGxlIGNvbW1hbmQgW1FVRVJZX0hXX1BBUkFNXQoxMy4xMS4xOSAwODoy
NDo1Ny42MDEgfCBBbHNhUGNtICAgICAgICAgfCBEQkcgLSBRdWVyeSBwY20gZGV2aWNlIGh3OjIs
MCBmb3IgSFcgcGFyYW1ldGVycwoxMy4xMS4xOSAwODoyNDo1Ny42MTAgfCBDb21tYW5kSGFuZGxl
ciAgfCBEQkcgLSBSZXR1cm4gc3RhdHVzOiBbMF0KMTMuMTEuMTkgMDg6MjQ6NTcuNjE2IHwgWGVu
RXZ0Y2huICAgICAgIHwgREJHIC0gTm90aWZ5IGV2ZW50IGNoYW5uZWwsIHBvcnQ6IDEwCjEzLjEx
LjE5IDA4OjI0OjU3LjYyNCB8IFhlbkV2dGNobiAgICAgICB8IERCRyAtIEV2ZW50IHJlY2VpdmVk
LCBwb3J0OiAxMAoxMy4xMS4xOSAwODoyNDo1Ny42MzEgfCBTdHJlYW1SaW5nICAgICAgfCBEQkcg
LSBSZXF1ZXN0IHJlY2VpdmVkLCBpZDogYWxzYTxodzoyOzA+LCBjbWQ6OQoxMy4xMS4xOSAwODoy
NDo1Ny42NDAgfCBDb21tYW5kSGFuZGxlciAgfCBEQkcgLSBIYW5kbGUgY29tbWFuZCBbUVVFUllf
SFdfUEFSQU1dCjEzLjExLjE5IDA4OjI0OjU3LjY0NyB8IEFsc2FQY20gICAgICAgICB8IERCRyAt
IFF1ZXJ5IHBjbSBkZXZpY2UgaHc6MiwwIGZvciBIVyBwYXJhbWV0ZXJzCjEzLjExLjE5IDA4OjI0
OjU3LjY1NiB8IENvbW1hbmRIYW5kbGVyICB8IERCRyAtIFJldHVybiBzdGF0dXM6IFswXQoxMy4x
MS4xOSAwODoyNDo1Ny42NjMgfCBYZW5FdnRjaG4gICAgICAgfCBEQkcgLSBOb3RpZnkgZXZlbnQg
Y2hhbm5lbCwgcG9ydDogMTAKMTMuMTEuMTkgMDg6MjQ6NTcuNjcxIHwgWGVuRXZ0Y2huICAgICAg
IHwgREJHIC0gRXZlbnQgcmVjZWl2ZWQsIHBvcnQ6IDEwCjEzLjExLjE5IDA4OjI0OjU3LjY3OCB8
IFN0cmVhbVJpbmcgICAgICB8IERCRyAtIFJlcXVlc3QgcmVjZWl2ZWQsIGlkOiBhbHNhPGh3OjI7
MD4sIGNtZDo5CjEzLjExLjE5IDA4OjI0OjU3LjY4NiB8IENvbW1hbmRIYW5kbGVyICB8IERCRyAt
IEhhbmRsZSBjb21tYW5kIFtRVUVSWV9IV19QQVJBTV0KMTMuMTEuMTkgMDg6MjQ6NTcuNjk0IHwg
QWxzYVBjbSAgICAgICAgIHwgREJHIC0gUXVlcnkgcGNtIGRldmljZSBodzoyLDAgZm9yIEhXIHBh
cmFtZXRlcnMKMTMuMTEuMTkgMDg6MjQ6NTcuNzAzIHwgQ29tbWFuZEhhbmRsZXIgIHwgREJHIC0g
UmV0dXJuIHN0YXR1czogWzBdCjEzLjExLjE5IDA4OjI0OjU3LjcwOSB8IFhlbkV2dGNobiAgICAg
ICB8IERCRyAtIE5vdGlmeSBldmVudCBjaGFubmVsLCBwb3J0OiAxMAoKCk15IHhsLmNmZzoKICAg
IHZzbmQgPSBbCiAgICAgICAgWydDQVJELCBzaG9ydC1uYW1lPU1haW4sIHNhbXBsZS1mb3JtYXRz
PXMxNl9sZTtzODt1MzJfYmUnLAogICAgICAgICAgICAnUENNLCBuYW1lPU1haW4nLAogICAgICAg
ICAgICAgICAgJ1NUUkVBTSwgdW5pcXVlLWlkPWFsc2E8aHc6MjswPiwgdHlwZT1wJywKICAgICAg
ICAgICAgICAgICdTVFJFQU0sIHVuaXF1ZS1pZD1hbHNhPGh3OjI7MT4sIHR5cGU9YywgY2hhbm5l
bHMtbWF4PTInCiAgICAgICAgXSwKICAgIF0KClRoZSBhdWRpbyBkZXZpY2Ugb24gbXkgYm9hcmQ6
CmFwbGF5IC1sCioqKiogTGlzdCBvZiBQTEFZQkFDSyBIYXJkd2FyZSBEZXZpY2VzICoqKioKY2Fy
ZCAwOiBpbXhhdWRtaXggW2lteC1hdWRtaXhdLCBkZXZpY2UgMDogSGlGaS1BVURNSVgtRkUgKCop
IFtdCiAgU3ViZGV2aWNlczogMS8xCiAgU3ViZGV2aWNlICMwOiBzdWJkZXZpY2UgIzAKY2FyZCAw
OiBpbXhhdWRtaXggW2lteC1hdWRtaXhdLCBkZXZpY2UgMTogSGlGaS1BVURNSVgtRkUgKCopIFtd
CiAgU3ViZGV2aWNlczogMS8xCiAgU3ViZGV2aWNlICMwOiBzdWJkZXZpY2UgIzAKY2FyZCAxOiBj
czQyODg4YXVkaW8gW2NzNDI4ODgtYXVkaW9dLCBkZXZpY2UgMDogSGlGaSBjczQyODg4LTAgW0hp
RmkgY3M0Mjg4OC0wXQogIFN1YmRldmljZXM6IDEvMQogIFN1YmRldmljZSAjMDogc3ViZGV2aWNl
ICMwCmNhcmQgMTogY3M0Mjg4OGF1ZGlvIFtjczQyODg4LWF1ZGlvXSwgZGV2aWNlIDE6IEhpRmkt
QVNSQy1GRSAoKikgW10KICBTdWJkZXZpY2VzOiAxLzEKICBTdWJkZXZpY2UgIzA6IHN1YmRldmlj
ZSAjMApjYXJkIDI6IHdtODk2MGF1ZGlvIFt3bTg5NjAtYXVkaW9dLCBkZXZpY2UgMDogSGlGaSB3
bTg5NjAtaGlmaS0wIFtdCiAgU3ViZGV2aWNlczogMC8xCiAgU3ViZGV2aWNlICMwOiBzdWJkZXZp
Y2UgIzAKCklzIHRoZXJlIHNvbWV0aGluZyB3cm9uZyBpbiBteSBjb25maWd1cmF0aW9uPwoKVGhh
bmtzLApQZW5nLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
