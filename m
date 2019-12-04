Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D113112AC9
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 12:55:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icTCg-0008CI-8Z; Wed, 04 Dec 2019 11:52:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5CfZ=Z2=amazon.com=prvs=234ff90fd=pdurrant@srs-us1.protection.inumbo.net>)
 id 1icTCe-0008CD-Vx
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 11:52:21 +0000
X-Inumbo-ID: 86949142-168c-11ea-aea8-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86949142-168c-11ea-aea8-bc764e2007e4;
 Wed, 04 Dec 2019 11:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575460340; x=1606996340;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=subuGb31/4BvlNMMaELIqppLGL3pCYIbeSsP2T2kb6A=;
 b=hEeAN2ygpC7HruauDTdiiera0rHtIJ6J5vazyQ2MS8qde9TO5w8uvGPZ
 sQbCKMTkWZlLdcIrQO1Kr96DBNnrVacJP6BRpwMn/EWUhk4c+4ZplaeeU
 PyH0Wy5gOKo1+o+TSfAuByb49SMmwFtqjIHsL/pUgWqeEx9rSnwZIA/IV A=;
IronPort-SDR: LPDeFf1hwrW5njIZKDQ/+xU+QNaLygCTTCMyzbeIsa9VPg1AuD/U2+aBjxtQo+fnYgCQuqFEV2
 QED0WsNMtctw==
X-IronPort-AV: E=Sophos;i="5.69,277,1571702400"; 
   d="scan'208";a="3133749"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 04 Dec 2019 11:52:07 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9B588A25D4; Wed,  4 Dec 2019 11:52:06 +0000 (UTC)
Received: from EX13D31EUA003.ant.amazon.com (10.43.165.95) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 11:52:06 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D31EUA003.ant.amazon.com (10.43.165.95) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 11:52:04 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 4 Dec 2019 11:52:04 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: "Park, Seongjae" <sjpark@amazon.com>, "konrad.wilk@oracle.com"
 <konrad.wilk@oracle.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "axboe@kernel.dk" <axboe@kernel.dk>
Thread-Topic: [Xen-devel] [PATCH 0/2] xen/blkback: Aggressively shrink page
 pools if a memory pressure is detected
Thread-Index: AQHVqpcoosgr7ogcY0K6hF0oa7O7wqep3Ncw
Date: Wed, 4 Dec 2019 11:52:04 +0000
Message-ID: <62c68f53cc0145ad9d0dfb167b50eac4@EX13D32EUC003.ant.amazon.com>
References: <20191204113419.2298-1-sjpark@amazon.com>
In-Reply-To: <20191204113419.2298-1-sjpark@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.177]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 0/2] xen/blkback: Aggressively shrink page
 pools if a memory pressure is detected
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sj38.park@gmail.com" <sj38.park@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Park, 
 Seongjae" <sjpark@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gU2VvbmdKYWUg
UGFyaw0KPiBTZW50OiAwNCBEZWNlbWJlciAyMDE5IDExOjM0DQo+IFRvOiBrb25yYWQud2lsa0Bv
cmFjbGUuY29tOyByb2dlci5wYXVAY2l0cml4LmNvbTsgYXhib2VAa2VybmVsLmRrDQo+IENjOiBz
ajM4LnBhcmtAZ21haWwuY29tOyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IGxpbnV4
LQ0KPiBibG9ja0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IFBhcmssIFNlb25namFlDQo+IDxzanBhcmtAYW1hem9uLmNvbT4NCj4gU3ViamVjdDogW1hlbi1k
ZXZlbF0gW1BBVENIIDAvMl0geGVuL2Jsa2JhY2s6IEFnZ3Jlc3NpdmVseSBzaHJpbmsgcGFnZQ0K
PiBwb29scyBpZiBhIG1lbW9yeSBwcmVzc3VyZSBpcyBkZXRlY3RlZA0KPiANCj4gRWFjaCBgYmxr
aWZgIGhhcyBhIGZyZWUgcGFnZXMgcG9vbCBmb3IgdGhlIGdyYW50IG1hcHBpbmcuICBUaGUgc2l6
ZSBvZg0KPiB0aGUgcG9vbCBzdGFydHMgZnJvbSB6ZXJvIGFuZCBiZSBpbmNyZWFzZWQgb24gZGVt
YW5kIHdoaWxlIHByb2Nlc3NpbmcNCj4gdGhlIEkvTyByZXF1ZXN0cy4gIElmIGN1cnJlbnQgSS9P
IHJlcXVlc3RzIGhhbmRsaW5nIGlzIGZpbmlzaGVkIG9yIDEwMA0KPiBtaWxsaXNlY29uZHMgaGFz
IHBhc3NlZCBzaW5jZSBsYXN0IEkvTyByZXF1ZXN0cyBoYW5kbGluZywgaXQgY2hlY2tzIGFuZA0K
PiBzaHJpbmtzIHRoZSBwb29sIHRvIG5vdCBleGNlZWQgdGhlIHNpemUgbGltaXQsIGBtYXhfYnVm
ZmVyX3BhZ2VzYC4NCj4gDQo+IFRoZXJlZm9yZSwgYGJsa2Zyb250YCBydW5uaW5nIGd1ZXN0cyBj
YW4gY2F1c2UgYSBtZW1vcnkgcHJlc3N1cmUgaW4gdGhlDQo+IGBibGtiYWNrYCBydW5uaW5nIGd1
ZXN0IGJ5IGF0dGFjaGluZyBhcmJpdHJhcmlseSBsYXJnZSBudW1iZXIgb2YgYmxvY2sNCj4gZGV2
aWNlcyBhbmQgaW5kdWNpbmcgSS9PLg0KDQpPT0kuLi4gSG93IGRvIGd1ZXN0cyB1bmlsYXRlcmFs
bHkgY2F1c2UgdGhlIGF0dGFjaG1lbnQgb2YgYXJiaXRyYXJ5IG51bWJlcnMgb2YgUFYgZGV2aWNl
cz8NCg0KICBQYXVsDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
