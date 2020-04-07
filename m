Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F011A09DD
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 11:16:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLkLV-0008At-1v; Tue, 07 Apr 2020 09:16:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vrvj=5X=amazon.de=prvs=35999e6e1=mheyne@srs-us1.protection.inumbo.net>)
 id 1jLkLT-0008Ao-7p
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 09:16:35 +0000
X-Inumbo-ID: 783a978c-78b0-11ea-8086-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 783a978c-78b0-11ea-8086-12813bfff9fa;
 Tue, 07 Apr 2020 09:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1586250992; x=1617786992;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=s/GBJ+Z7huKjAQYz7kemBNGpmflj5qV1JRIPYIE+Ans=;
 b=lAL1DaXa34+eQCgQWK7Y3OR9Nt9sAkew3Pj4KmHKKsrlHLsqKn+6NRFM
 UWtInrMNnXnlmEAT7cq6jwQKTFoCAMtO9nvBusEfqPj9HVLbQhwWaUhDa
 WJykuDvxqdDohnnZTcU7r7sWKd2K/q3rUws1nODuBt2kKmOQWBmH618SH s=;
IronPort-SDR: YsI3VwZCBvwU2QBHeIXbAZSKOJ8xt1EWbR6/hbqPjhOWoL2OIWg6+elR5bOaLMoZSuauYBKl9m
 Fxx0ocjm7Pug==
X-IronPort-AV: E=Sophos;i="5.72,353,1580774400"; d="scan'208";a="24813890"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-c5104f52.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 07 Apr 2020 09:16:19 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-c5104f52.us-west-2.amazon.com (Postfix) with ESMTPS
 id 43796A1E61; Tue,  7 Apr 2020 09:16:18 +0000 (UTC)
Received: from EX13D08EUC004.ant.amazon.com (10.43.164.176) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 7 Apr 2020 09:16:17 +0000
Received: from [192.168.4.136] (10.43.162.147) by EX13D08EUC004.ant.amazon.com
 (10.43.164.176) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 7 Apr 2020 09:16:14 +0000
Subject: Re: [PATCH 0/3] Cleanup IOREQ server on exit
From: Maximilian Heyne <mheyne@amazon.de>
To: <xen-devel@lists.xenproject.org>
References: <20200313123316.122003-1-mheyne@amazon.de>
Message-ID: <6f476505-5e85-8a8a-d6d7-db56ea921637@amazon.de>
Date: Tue, 7 Apr 2020 11:16:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200313123316.122003-1-mheyne@amazon.de>
Content-Language: en-US
X-Originating-IP: [10.43.162.147]
X-ClientProxiedBy: EX13D42UWA002.ant.amazon.com (10.43.160.16) To
 EX13D08EUC004.ant.amazon.com (10.43.164.176)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@citrix.com>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q291bGQgc29tZW9uZSBwbGVhc2UgaGF2ZSBhIGxvb2sgYXQgdGhpcyBwYXRjaD8gSXQgc29sdmVz
IGFuIGFjdHVhbCBpc3N1ZToKVHJ5IHNvZnQtcmVzZXQgd2l0aCBxZW11LXhlbi10cmFkaXRpb25h
bCBhbmQgaXQgd2lsbCBmYWlsLgoKT24gMy8xMy8yMCAxOjMzIFBNLCBNYXhpbWlsaWFuIEhleW5l
IHdyb3RlOgo+IEZvbGxvd2luZyB1cCBvbiBjb21taXQgOWMwZWVkNjEgKCJxZW11LXRyYWQ6IHN0
b3AgdXNpbmcgdGhlIGRlZmF1bHQgSU9SRVEKPiBzZXJ2ZXIiKSwgY2xlYW4gdXAgdGhlIElPUkVR
IHNlcnZlciBvbiBleGl0LiBUaGlzIGZpeGVzIGEgYnVnIHdpdGggc29mdC1yZXNldAo+IHRoYXQg
c2hvd3MgdXAgYXMgImJpbmQgaW50ZXJkb21haW4gaW9jdGwgZXJyb3IgMjIiIGJlY2F1c2UgdGhl
IGV2ZW50IGNoYW5uZWxzCj4gd2VyZSBub3QgY2xvc2VkIGF0IHRoZSBzb2Z0LXJlc2V0IGFuZCBj
YW4ndCBiZSBib3VuZCBhZ2Fpbi4KPiAKPiBGb3IgdGhpcyBJIHVzZWQgdGhlIGV4aXQgbm90aWZp
ZXJzIGZyb20gUUVNVSB0aGF0IEkgYmFja3BvcnRlZCB0b2dldGhlciB3aXRoIHRoZQo+IHJlcXVp
cmVkIGdlbmVyaWMgbm90aWZpZXIgbGlzdHMuCj4gCj4gQW50aG9ueSBMaWd1b3JpICgxKToKPiAg
ICBBZGQgc3VwcG9ydCBmb3IgZ2VuZXJpYyBub3RpZmllciBsaXN0cwo+IAo+IEdlcmQgSG9mZm1h
bm4gKDEpOgo+ICAgIEFkZCBleGl0IG5vdGlmaWVycy4KPiAKPiBNYXhpbWlsaWFuIEhleW5lICgx
KToKPiAgICB4ZW46IGNsZWFudXAgSU9SRVEgc2VydmVyIG9uIGV4aXQKPiAKPiAgIE1ha2VmaWxl
ICAgICAgICAgICAgfCAgMSArCj4gICBody94ZW5fbWFjaGluZV9mdi5jIHwgMTEgKysrKysrKysr
KysKPiAgIG5vdGlmeS5jICAgICAgICAgICAgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgIG5vdGlmeS5oICAgICAgICAgICAgfCA0MyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICBzeXMtcXVldWUuaCAgICAgICAgIHwg
IDUgKysrKysKPiAgIHN5c2VtdS5oICAgICAgICAgICAgfCAgNSArKysrKwo+ICAgdmwuYyAgICAg
ICAgICAgICAgICB8IDIwICsrKysrKysrKysrKysrKysrKysrCj4gICA3IGZpbGVzIGNoYW5nZWQs
IDEyNCBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgbm90aWZ5LmMKPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBub3RpZnkuaAo+IAoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVy
IEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhy
dW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBKb25hdGhhbiBXZWlzcwpFaW5nZXRyYWdlbiBhbSBB
bXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGlu
ClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgo=


