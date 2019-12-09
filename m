Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0705116A21
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 10:50:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieFce-0003bj-2m; Mon, 09 Dec 2019 09:46:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BuSh=Z7=amazon.com=prvs=2393b02c0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ieFcc-0003be-Tn
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 09:46:30 +0000
X-Inumbo-ID: c6ed0a5a-1a68-11ea-a1e1-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6ed0a5a-1a68-11ea-a1e1-bc764e2007e4;
 Mon, 09 Dec 2019 09:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575884790; x=1607420790;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4cIuMxtJH4KZz9+iT3cGj9msbb3a41ZVBSEqjbz+WdA=;
 b=IcdTXsH7M3J3E9CP83RGGpwV4GC5PvaSUEo+C8el8tHMNR59cK37D8b7
 UN5gs9RKX6mVf+Nh87DalQo259UakNbeMAVFNCjcrxDUUB9BwysbGcuoS
 oCBjZA+CMQLdvLmK/o2wRfQA5blX78WUvReslFWD5XS21jkzGZHtweV1F 4=;
IronPort-SDR: arqHB+twrTT98tJnLn4AETwVom5+UNCEXWZoX+SoypLJ7tOeZxnXbkSGFvksFQPtNgtDUfSYSt
 G+F8qhe4JlUg==
X-IronPort-AV: E=Sophos;i="5.69,294,1571702400"; 
   d="scan'208";a="8224098"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 09 Dec 2019 09:46:30 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 963E2A22A5; Mon,  9 Dec 2019 09:46:27 +0000 (UTC)
Received: from EX13D31EUB001.ant.amazon.com (10.43.166.210) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 09:46:26 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D31EUB001.ant.amazon.com (10.43.166.210) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 09:46:25 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 9 Dec 2019 09:46:25 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, "Park, Seongjae"
 <sjpark@amazon.com>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "roger.pau@citrix.com"
 <roger.pau@citrix.com>
Thread-Topic: [PATCH v3 0/1] xen/blkback: Squeeze page pools if a memory
 pressure
Thread-Index: AQHVrm7tNfXN4zMxAE2n5qoiVkODNaexjBwAgAABEcA=
Date: Mon, 9 Dec 2019 09:46:25 +0000
Message-ID: <026ba79524da43648371e5bca437a5e4@EX13D32EUC003.ant.amazon.com>
References: <20191209085839.21215-1-sjpark@amazon.com>
 <954f7beb-9d40-253e-260b-4750809bf808@suse.com>
In-Reply-To: <954f7beb-9d40-253e-260b-4750809bf808@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.211]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 0/1] xen/blkback: Squeeze page pools if a
 memory pressure
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "sj38.park@gmail.com" <sj38.park@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDA5IERlY2VtYmVyIDIwMTkgMDk6MzkNCj4gVG86IFBhcmss
IFNlb25namFlIDxzanBhcmtAYW1hem9uLmNvbT47IGF4Ym9lQGtlcm5lbC5kazsNCj4ga29ucmFk
LndpbGtAb3JhY2xlLmNvbTsgcm9nZXIucGF1QGNpdHJpeC5jb20NCj4gQ2M6IGxpbnV4LWJsb2Nr
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgRHVycmFudCwN
Cj4gUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT47IHNqMzgucGFya0BnbWFpbC5jb207IHhlbi0N
Cj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAw
LzFdIHhlbi9ibGtiYWNrOiBTcXVlZXplIHBhZ2UgcG9vbHMgaWYgYSBtZW1vcnkNCj4gcHJlc3N1
cmUNCj4gDQo+IE9uIDA5LjEyLjE5IDA5OjU4LCBTZW9uZ0phZSBQYXJrIHdyb3RlOg0KPiA+IEVh
Y2ggYGJsa2lmYCBoYXMgYSBmcmVlIHBhZ2VzIHBvb2wgZm9yIHRoZSBncmFudCBtYXBwaW5nLiAg
VGhlIHNpemUgb2YNCj4gPiB0aGUgcG9vbCBzdGFydHMgZnJvbSB6ZXJvIGFuZCBiZSBpbmNyZWFz
ZWQgb24gZGVtYW5kIHdoaWxlIHByb2Nlc3NpbmcNCj4gPiB0aGUgSS9PIHJlcXVlc3RzLiAgSWYg
Y3VycmVudCBJL08gcmVxdWVzdHMgaGFuZGxpbmcgaXMgZmluaXNoZWQgb3IgMTAwDQo+ID4gbWls
bGlzZWNvbmRzIGhhcyBwYXNzZWQgc2luY2UgbGFzdCBJL08gcmVxdWVzdHMgaGFuZGxpbmcsIGl0
IGNoZWNrcyBhbmQNCj4gPiBzaHJpbmtzIHRoZSBwb29sIHRvIG5vdCBleGNlZWQgdGhlIHNpemUg
bGltaXQsIGBtYXhfYnVmZmVyX3BhZ2VzYC4NCj4gPg0KPiA+IFRoZXJlZm9yZSwgYGJsa2Zyb250
YCBydW5uaW5nIGd1ZXN0cyBjYW4gY2F1c2UgYSBtZW1vcnkgcHJlc3N1cmUgaW4gdGhlDQo+ID4g
YGJsa2JhY2tgIHJ1bm5pbmcgZ3Vlc3QgYnkgYXR0YWNoaW5nIGEgbGFyZ2UgbnVtYmVyIG9mIGJs
b2NrIGRldmljZXMgYW5kDQo+ID4gaW5kdWNpbmcgSS9PLg0KPiANCj4gSSdtIGhhdmluZyBwcm9i
bGVtcyB0byB1bmRlcnN0YW5kIGhvdyBhIGd1ZXN0IGNhbiBhdHRhY2ggYSBsYXJnZSBudW1iZXIN
Cj4gb2YgYmxvY2sgZGV2aWNlcyB3aXRob3V0IHRob3NlIGhhdmluZyBiZWVuIGNvbmZpZ3VyZWQg
YnkgdGhlIGhvc3QgYWRtaW4NCj4gYmVmb3JlLg0KPiANCj4gSWYgdGhvc2UgZGV2aWNlcyBoYXZl
IGJlZW4gY29uZmlndXJlZCwgZG9tMCBzaG91bGQgYmUgcmVhZHkgZm9yIHRoYXQNCj4gbnVtYmVy
IG9mIGRldmljZXMsIGUuZy4gYnkgaGF2aW5nIGVub3VnaCBzcGFyZSBtZW1vcnkgYXJlYSBmb3Ig
YmFsbG9vbmVkDQo+IHBhZ2VzLg0KPiANCj4gU28gZWl0aGVyIEknbSBtaXNzaW5nIHNvbWV0aGlu
ZyBoZXJlIG9yIHlvdXIgcmVhc29uaW5nIGZvciB0aGUgbmVlZCBvZg0KPiB0aGUgcGF0Y2ggaXMg
d3JvbmcuDQo+IA0KDQpJIHRoaW5rIHRoZSB1bmRlcmx5aW5nIGlzc3VlIGlzIHRoYXQgcGVyc2lz
dGVudCBncmFudCBzdXBwb3J0IGlzIGhvZ2dpbmcgbWVtb3J5IGluIHRoZSBiYWNrZW5kcywgdGhl
cmVieSBjb21wcm9taXNpbmcgc2NhbGFiaWxpdHkuIElJVUMgdGhpcyBwYXRjaCBpcyBlc3NlbnRp
YWxseSBhIGJhbmQtYWlkIHRvIGdldCBiYWNrIHRvIHRoZSBzY2FsYWJpbGl0eSB0aGF0IHdhcyBw
b3NzaWJsZSBiZWZvcmUgcGVyc2lzdGVudCBncmFudCBzdXBwb3J0IHdhcyBhZGRlZC4gVWx0aW1h
dGVseSB0aGUgcmlnaHQgYW5zd2VyIHNob3VsZCBiZSB0byBnZXQgcmlkIG9mIHBlcnNpc3RlbnQg
Z3JhbnRzIHN1cHBvcnQgYW5kIHVzZSBncmFudCBjb3B5LCBidXQgc3VjaCBhIGNoYW5nZSBpcyBj
bGVhcmx5IG1vcmUgaW52YXNpdmUgYW5kIHdvdWxkIG5lZWQgZmFyIG1vcmUgdGVzdGluZy4NCg0K
ICBQYXVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
