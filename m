Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F352114BDCA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 17:32:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwTkj-0007mz-4o; Tue, 28 Jan 2020 16:30:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4Njv=3R=mellanox.com=jgg@srs-us1.protection.inumbo.net>)
 id 1iwTkh-0007mu-Nu
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 16:30:11 +0000
X-Inumbo-ID: 73ceffa4-41eb-11ea-b211-bc764e2007e4
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::628])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73ceffa4-41eb-11ea-b211-bc764e2007e4;
 Tue, 28 Jan 2020 16:30:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIWzUeAIaHBYlX2ZRH0MI3I422T7twpXxHI1fGE7DssIkFoIqKbDggtje2EJq0LnajOSBerCjFGgrVjn0ZPwyVSEexlfpA2EsI6erqFQmt/xcGy5olz9oZBDIQy5ssRYRNMK6MhOGVd3hujK8trPTRTNALUpiFbBU37Ffs5B8qYjbR8JeFplyRPqULcFExxNnIouDgUjuPk8BJC7ycnOXFlRGpqeENBb+jdAGhOh25RFuUUg+6S7+Lo/ion+7rl1IzTO15YCQAc1mjTS0/qCIP9S6woswRtnJmLemAgTZllkg9xZEg+4G8i/vzFkHu6dtUQDz4srcKq8zNgoW1PzKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KETHOV4BbEA3BJ+dCOM66p9KRiXKHqu5SALDdvIZ+zU=;
 b=cU5Qk84sOMIzDmtVkxOHRNoOSAxVCqXECljia0aLLDKNMjU5fCX7rQCwLdrqXrqN7uoTpGZNallgZfOdYCfAP3F53k90Bel4NWd15FT297tOuBPGuMXgKWwj9SzPHyMYyoai+uE8ADNaoVpNWLUxYqBIBtW7UDvDHMjeucgtO5vdnOhhH9AEG8j63bJQZgwldGG4ve4ifk+3ElT5762uL8y/2RdZdV8K/kTUdO5/7lVmLudPMUAIyWWIzrVy78ROe63oyOWuL/JVx1zg6LRpAVXgDsnyxVKJcGPxeJFsZp+pyLpPTHpCk7BmCK+O0itKRtPT4QRzbh+QHMSfzZ6mrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KETHOV4BbEA3BJ+dCOM66p9KRiXKHqu5SALDdvIZ+zU=;
 b=IOTFIg1e6sE9hMbWNG8Tc/PXf/M0o8NHk+5+RPsfay3rFVCoyool8OP8GRZKGI7vHdaAZsDyCPshqxEsr8plx9huvb8DEDalw2XvjKHvtpK6K48mVeuaFdXFUyKQZqeLAFE/oPPmA33u1pKZ7GD0YTSFtQG6vtiVRPmQqh1ry0E=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4749.eurprd05.prod.outlook.com (20.176.8.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Tue, 28 Jan 2020 16:30:09 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d%7]) with mapi id 15.20.2665.026; Tue, 28 Jan 2020
 16:30:09 +0000
Received: from mlx.ziepe.ca (142.68.57.212) by
 BN6PR16CA0010.namprd16.prod.outlook.com (2603:10b6:404:f5::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.22 via Frontend Transport; Tue, 28 Jan 2020 16:30:08 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1iwTka-000500-63; Tue, 28 Jan 2020 12:30:04 -0400
From: Jason Gunthorpe <jgg@mellanox.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Thread-Topic: [PATCH] xen/gntdev: Do not use mm notifiers with autotranslating
 guests
Thread-Index: AQHV1fdr4rfmN5j5BkWz1GaT1QrDOagARHQA
Date: Tue, 28 Jan 2020 16:30:08 +0000
Message-ID: <20200128163004.GI21192@mellanox.com>
References: <1580228659-6086-1-git-send-email-boris.ostrovsky@oracle.com>
In-Reply-To: <1580228659-6086-1-git-send-email-boris.ostrovsky@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR16CA0010.namprd16.prod.outlook.com
 (2603:10b6:404:f5::20) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.68.57.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 362e6f7f-621c-4419-9869-08d7a40f56b8
x-ms-traffictypediagnostic: VI1PR05MB4749:
x-microsoft-antispam-prvs: <VI1PR05MB4749A005A6C92603CDC167F8CF0A0@VI1PR05MB4749.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 029651C7A1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(189003)(199004)(186003)(26005)(6916009)(2906002)(4744005)(4326008)(5660300002)(9746002)(9786002)(1076003)(8936002)(8676002)(478600001)(2616005)(81166006)(81156014)(52116002)(36756003)(86362001)(71200400001)(54906003)(66946007)(64756008)(316002)(66476007)(66556008)(66446008)(33656002)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4749;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zm8x+qLpnv5B2a38pJQ+pGyqMMYrI1SK/w0G/2tn3kLGahk7CaSAQoW+cLEeIoH9iZkkLRMxjeANH7VYlPu9JJMQWzW6MAh5q/oRsSxo8Ox7euvQgM6DbmbNd+6ZHDUvrR2NhR+lv7kXILjRryZietN8VhnM2Le49B4dpDRFXuQ4XhDhQS84bFjoQkbNEitNkREjlkmOGgA+CfJ74FDfa5xfvJ9hdvVb2sor1hWzstNLFxL0l786p2SFrlkRfbr4WROR7EbcvMxF9dFE2M9tfJqEH5tbm1Z0agaD4/goDs7S2nhARR1oP4g0SxKwxvDD3SkZKRauEDudMG+QJjTpMr94Xdg55MBJLfYbkYWDeFlBLbdzGj7Vqer/WiCF0OWWCydh61067/m0y7fckk+xt1M9QSmTUBflBN9CyRnbhXgfoSXACyDcstA07akNtv4UuJ5IB/R5s4+sZyM2zX+hqrg1iNY4NsAKhQNF6+vYzoOkQaTsKEUMCxG7v43ctkDn
x-ms-exchange-antispam-messagedata: LV/vPAZ/eki6CGNzi6HyEQIQgnEboFqEIffFrFeXbdKRv7JgFmI9bcwYR9VY87cw7INCjrN7Qi0q84YeWydAKgbVuBqCWpqZjCrOlKLugySInN1bZLPxA3ywmI2iEgAXCmmuCVxb3Lfqn9sX9GCSEQ==
x-ms-exchange-transport-forked: True
Content-ID: <472CD4A5B98D3E4785753939EB7D6FC1@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 362e6f7f-621c-4419-9869-08d7a40f56b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2020 16:30:08.6065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y0ffG5GA26V4lS3M6K5CrQpq+xomGcdewk1eGTYvt2Si92aI/QY/f7MDfGRgx+c2am3IPO1CVPgNu6fMIr5Huw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4749
Subject: Re: [Xen-devel] [PATCH] xen/gntdev: Do not use mm notifiers with
 autotranslating guests
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "ilpo.jarvinen@cs.helsinki.fi" <ilpo.jarvinen@cs.helsinki.fi>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMTE6MjQ6MTlBTSAtMDUwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOg0KPiBDb21taXQgZDNlZWIxZDc3YzVkICgieGVuL2dudGRldjogdXNlIG1tdV9pbnRl
cnZhbF9ub3RpZmllcl9pbnNlcnQiKQ0KPiBtaXNzZWQgYSB0ZXN0IGZvciB1c2VfcHRlbW9kIHdo
ZW4gY2FsbGluZyBtbXVfaW50ZXJ2YWxfcmVhZF9iZWdpbigpLiBGaXgNCj4gdGhhdC4NCj4gDQo+
IEZpeGVzOiBkM2VlYjFkNzdjNWQgKCJ4ZW4vZ250ZGV2OiB1c2UgbW11X2ludGVydmFsX25vdGlm
aWVyX2luc2VydCIpDQo+IENDOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMgNS41DQo+IFJlcG9y
dGVkLWJ5OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBjcy5oZWxzaW5raS5maT4NCj4g
VGVzdGVkLWJ5OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBjcy5oZWxzaW5raS5maT4N
Cj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xl
LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3hlbi9nbnRkZXYuYyB8IDI0ICsrKysrKysrKysrKy0t
LS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEyIGRlbGV0
aW9ucygtKQ0KDQpZZXMsIHRoaXMgbG9va3MgbGlrZSBpdCBmb3IgdGhlIHB0ZW1vZCBtaXNzLCB0
aGFua3MNCg0KUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4N
Cg0KSmFzb24NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
