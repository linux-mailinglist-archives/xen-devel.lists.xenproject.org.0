Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A77B8C3F7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 23:54:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxehT-0002xl-9d; Tue, 13 Aug 2019 21:51:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mu8E=WJ=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1hxehS-0002xg-B0
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 21:51:26 +0000
X-Inumbo-ID: 7d58f03a-be14-11e9-8e10-abc0c7e16098
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.137]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d58f03a-be14-11e9-8e10-abc0c7e16098;
 Tue, 13 Aug 2019 21:51:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcTEkdqDGbqEUi8pn5FsiDOCm9wKzK+vICXpPbTWzMYWKXhLP3tkC2pUdMxDMeBPTL+44rMIeVB3zkVkGRm/TtKlpunFfddcK0sR1SdvwqsHhwAVHfhLDlj6WqCsOaFfGxnu4h31Wv6vA0vOSM5C/02q7Z140zL04RGJnWj/F383m4g1s+S5PWM9XhsNq4+39PaMWR1HQ7GCluDXI6Zln/4hOBPwOUWBIw2Wdlr2wAWP9wsWdh+UlvYLiNaP2DU0DQcyFh63bX/agP2AdBQPtvm/6DeTLEnIwl5tD/8XnpOOtJ5iVa++zFc3mu/v4vGvU7yF9lfnHLBJkeaDJ97qQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6msSZoCAjcrK0l/0e1dhr9vBeFsYQu4RNIfsaeyp050=;
 b=YjZLiHmrgP3cd6cZnT9iYhAKDbkYxXfafdkcrhpyf6jDtCGFUxnpF+hC2BbBCX3bsoXVoYz9aEF322+UlSa7cuPrbi9tdVcvB7ykUt/uNm2LuivOlmimWePjQ2EwzePSKD5Qi3gED4I3N596XEI1/Ngw3HKJhU0+4jFiDn/ic3U1aB3pzITymTSG/tDlqtwOQm41oPQcX1M2FSvzYuxekOclKUZqErAopJsJiwe4Gglo0PkXPORWptEN5+2pItnP4hKgJ/wsQqxs7OuKyXegVwAXHztSjI+0XfTGYh630OpCaE+VIttVkGG4hz00mV59+GtVHmHq/DpPLCKQ+mL4iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6msSZoCAjcrK0l/0e1dhr9vBeFsYQu4RNIfsaeyp050=;
 b=F34TxTe7LFxGr+YfsC1nQDg47DN0rnjZJ1GiQJltv50/HyoZND2XgTyG+ahufkChu/9oyfwgKKC+Eao9FL7Qf+lnfOqC19+m5TTR1zgH8XKnfvIlOj+EfY7NlaxogiBlnvQVgc5pzgdNlIUMVkPS5FpLABiCJjHMG4QkDkpLsCo=
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com (20.177.200.18) by
 VI1PR06MB5982.eurprd06.prod.outlook.com (20.178.124.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Tue, 13 Aug 2019 21:51:18 +0000
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::3164:1b3d:165e:ac42]) by VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::3164:1b3d:165e:ac42%6]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 21:51:18 +0000
From: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] failing to set value to 0 in Grub2ConfigFile
Thread-Index: AQHVUhpuA7gOz+/Ark2RBY58DX7TkKb5kqGAgAALn4A=
Date: Tue, 13 Aug 2019 21:51:18 +0000
Message-ID: <alpine.LFD.2.21.1908132223440.3016@austen3.home>
References: <alpine.LFD.2.21.1908132143580.3016@austen3.home>
 <5d38908a-30b9-6ca6-c5de-f612679b2f0e@citrix.com>
In-Reply-To: <5d38908a-30b9-6ca6-c5de-f612679b2f0e@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Alpine 2.21 (LFD 202 2017-01-01)
x-originating-ip: [2a00:23c4:9208:400:c49a:db08:8036:b390]
x-clientproxiedby: LO2P265CA0381.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::33) To VI1PR06MB4720.eurprd06.prod.outlook.com
 (2603:10a6:803:90::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=m.a.young@durham.ac.uk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-x-sender: michael@austen3.home
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50726684-beb5-49e1-590f-08d720385ebc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR06MB5982; 
x-ms-traffictypediagnostic: VI1PR06MB5982:
x-microsoft-antispam-prvs: <VI1PR06MB5982AAB2CCA8AC70F3943AD587D20@VI1PR06MB5982.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(199004)(189003)(66946007)(256004)(9686003)(478600001)(53936002)(6436002)(6916009)(36756003)(6486002)(229853002)(305945005)(6512007)(25786009)(7736002)(6116002)(58126008)(53546011)(66556008)(66476007)(386003)(102836004)(6506007)(66446008)(64756008)(54906003)(52116002)(8936002)(2906002)(786003)(316002)(81156014)(81166006)(186003)(76176011)(99286004)(46003)(5660300002)(14454004)(86362001)(71190400001)(71200400001)(8676002)(4326008)(6246003)(11346002)(476003)(53346004)(446003)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR06MB5982;
 H:VI1PR06MB4720.eurprd06.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:3; MX:1; 
received-spf: None (protection.outlook.com: durham.ac.uk does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HoreqBSi0yZR26mt1oW01jexvV+Dwml/P8u8g+W5Lau472EcWYvMe8iRrrEfUcN6gnrVUaoonbf0llOkSHe/zevg6vHQfUuirTMcVd5Bdos/SCdr105BEySiVuV29BT8dT/oVAB6V456FXUT5BR1D3iDUClPj2x/uVZ2o+gfsaY43gHly49zpfYhFDzeoWY8krVM/asOC4i7i+HNzwma1a/P8TQtfBJ4+uBRziAIdxcgEzOsSESQSEZpbKk6g1XJDC/BtzhDMYCzx5z5VGA1DuQsmis6m/rHTc3TWXHqUi4cd5w1N46gEaJOSj5f8JuI7Ax3U5gzIqmtjRdHi9cbsfP+2iVLOA/5/S2oOwp7x272uEAlQMt3oMMGxitwSNUmd9ohfatkyzzZyytD3r+EaXx/Jr+OiqNgZ8eBkFEebH4=
x-ms-exchange-transport-forked: True
Content-ID: <D0907E64C0F1BE45A12CFAD38A019226@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 50726684-beb5-49e1-590f-08d720385ebc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 21:51:18.3649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ps1q7ZDlWvYZoebZ5WrF12jNDXntvjAHZS1nSI2FQqkDLKisx+obMZa35eihZqVq3J5W0KoTAd5IXwnlfFwfMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB5982
Subject: Re: [Xen-devel] [PATCH] failing to set value to 0 in Grub2ConfigFile
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Steven Haigh <netwiz@crc.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxMyBBdWcgMjAxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKCj4gT24gMTMvMDgvMjAx
OSAyMjowMiwgWU9VTkcsIE1JQ0hBRUwgQS4gd3JvdGU6Cj4+IEkgaGF2ZSBiZWVuIGxvb2tpbmcg
YXQgdGhlIHB5Z3J1YiBjb2RlIHRvIHNlZSBpZiBpdCBpcyBwb3NzaWJsZSB0byBjb3BlCj4+IHdp
dGggZ3J1YiBmaWxlcyB3aXRoIEJMU0NGRyBhbmQgc3BvdHRlZCB0aGlzIG1pbm9yIGlzc3VlIGlu
IEdydWJDb25mLnB5Cj4+IHdoZXJlIHRoZSBjb2RlIGludGVuZHMgdG8gcmVwbGFjZSAke3NhdmVk
X2VudHJ5fSBhbmQgJHtuZXh0X2VudHJ5fSB3aXRoIDAKPj4gYnV0IGRvZXNuJ3Qgc3VjY2VlZC4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBZb3VuZyA8bS5hLnlvdW5nQGR1cmhhbS5hYy51
az4KPgo+IEFoIC0gdGhpcyBsb29rcyBzdXNwaWNpb3VzbHkgbGlrZSBpdCBtaWdodCBiZSB0aGUg
YnVnZml4IGZvciBhbiBpc3N1ZQo+IHJlcG9ydGVkIGJ5IFN0ZXZlbi4KPgo+IFN0ZXZlbiAtIGRv
IHlvdSBtaW5kIGdpdmluZyB0aGlzIHBhdGNoIGEgdHJ5IGZvciB5b3VyICJGZWRvcmEgMzAgRG9t
VSAtCj4gcHlncnViIGFsd2F5cyBib290cyB0aGUgc2Vjb25kIG1lbnUgb3B0aW9uIiBwcm9ibGVt
PwoKU2FkbHkgSSBkb24ndCB0aGluayBpdCBpcyB0aGF0IHNpbXBsZSBhbmQgdG8gaXQgcHJvcGVy
bHkgd291bGQgcmVxdWlyZSAKcGFyc2luZyBpZiBjbGF1c2VzIGluIHRoZSBncnViIGZpbGUgYW5k
IGFsc28gcmVhZGluZyB2YXJpYWJsZXMgZnJvbSB0aGUgCmdydWJlbnYgZmlsZS4KCkkgZG8gaG93
ZXZlciBoYXZlIGFuIGlkZWEgd2hpY2ggbWlnaHQgd29yayB3aGljaCBpcyB0byBpZ25vcmUgYW55
dGhpbmcgaW4gCmlmIGNsYXVzZXMsIHJlYWQgdGhlIGdydWJlbnYgZmlsZSAod2hpY2ggSSBub3cg
aGF2ZSBhIGhhY2t5IHdheSBvZiBkb2luZykgCmFuZCB0cmVhdGluZyB0aGUgdmFsdWUgb2YgbmV4
dF9lbnRyeSBvciBzYXZlZF9lbnRyeSBhcyB0aGUgc2V0dGluZyBmb3IKdGhlIGRlZmF1bHQga2Vy
bmVsIHRvIHBpY2suIElmIEkgZmluaXNoIGEgcGF0Y2ggdGhhdCBkb2VzIHRoaXMgSSB3aWxsIHBv
c3QKaXQgb24gdGhlIGxpc3QsIGJ1dCBJIHZlcnkgbXVjaCBkb3VidCBpdCB3aWxsIGJlIG9mIGNv
bW1pdGFibGUgcXVhbGl0eS4KCiAJTWljaGFlbCBZb3VuZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
