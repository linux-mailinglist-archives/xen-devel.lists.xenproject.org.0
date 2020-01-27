Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A512D14A4D3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 14:20:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw4Hg-0002Tn-1A; Mon, 27 Jan 2020 13:18:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5TJ9=3Q=amazon.co.uk=prvs=288783767=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iw4Hf-0002Ti-70
 for xen-devel@lists.xen.org; Mon, 27 Jan 2020 13:18:31 +0000
X-Inumbo-ID: 830a19e8-4107-11ea-8e9a-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 830a19e8-4107-11ea-8e9a-bc764e2007e4;
 Mon, 27 Jan 2020 13:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580131111; x=1611667111;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5iII9D7OcsmXp3W635LQ7rgR90w5oLyfzy6lNNejpNw=;
 b=kj5R9DUEyjotqsyCzV2Wf2ZZm4WuDvKRpiP17lbKnxepAIhCKX3NFhjT
 1X+ppgUkdQk0VdMgxYyvvIMyLwnJODfZobjroApn2Ge2j/1S9C9fGH3M/
 QVN0GoxpgEJ0yKeP4fVYElBFYWRvlRKaPE1oI+7L8DdGglbIDY2aEUjRv U=;
IronPort-SDR: hx0MALNumJsd9k0ZjJgXLjrXCveU4kVqeqgApS730HblQTEfU/uOdogB11uHzf7Z38CJMa3Q+0
 un+crF8HlQGw==
X-IronPort-AV: E=Sophos;i="5.70,369,1574121600"; d="scan'208";a="14915626"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 27 Jan 2020 13:18:31 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 4D42AA2787; Mon, 27 Jan 2020 13:18:28 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 27 Jan 2020 13:18:28 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 27 Jan 2020 13:18:27 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 27 Jan 2020 13:18:27 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Olaf Hering <olaf@aepfle.de>
Thread-Topic: [Xen-devel] live migration from 4.12 to 4.13 fails due to
 qemu-xen bug
Thread-Index: AQHVyf11gUSmbB+iq0KEPStCWv0JQaf+dkOAgAADHTCAABXwgIAABIag
Date: Mon, 27 Jan 2020 13:18:27 +0000
Message-ID: <238d49d15a6a4b23ba4cc78eded155c6@EX13D32EUC003.ant.amazon.com>
References: <20200113113627.08786ba0.olaf@aepfle.de>
 <20200127123005.7d6767c2.olaf@aepfle.de>
 <580201e5daa849399b79641bd610ec93@EX13D32EUC003.ant.amazon.com>
 <20200127135945.54fe945d.olaf@aepfle.de>
In-Reply-To: <20200127135945.54fe945d.olaf@aepfle.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.48]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] live migration from 4.12 to 4.13 fails due to
 qemu-xen bug
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IE9sYWYgSGVyaW5nIFttYWlsdG86
b2xhZkBhZXBmbGUuZGVdCj4gU2VudDogMjcgSmFudWFyeSAyMDIwIDEzOjAwCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bi5vcmcKPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gbGl2ZSBtaWdyYXRpb24gZnJvbSA0LjEy
IHRvIDQuMTMgZmFpbHMgZHVlIHRvCj4gcWVtdS14ZW4gYnVnCj4gCj4gQW0gTW9uLCAyNyBKYW4g
MjAyMCAxMTo1NDozNyArMDAwMAo+IHNjaHJpZWIgIkR1cnJhbnQsIFBhdWwiIDxwZHVycmFudEBh
bWF6b24uY28udWs+Ogo+IAo+ID4gPiBTaG91bGQgdGhlIHN0cmluZyAicGMtaTQ0MGZ4LTMuMCIg
YmVjb21lIGEgY29uZmlndXJlIG9wdGlvbj8KPiA+IEkgc3VwcG9zZS4gQ291bGQgd2UgaGF2ZSAi
cGMtaTQ0MGZ4IiBhcyB0aGUgZGVmYXVsdCwgd2hpY2ggbGlieGwgcHJlZml4Cj4gbWF0Y2hlcyBh
Z2FpbnN0IHFlbXUncyBzdXBwb3J0ZWQgdmVyc2lvbnMgdG8gc2VsZWN0IHRoZSBsYXRlc3Q/Cj4g
Cj4gSSB0aGluayB0aGUgcWVtdSBtYWNoaW5lIHZhcmlhbnQgbXVzdCBiZWNvbWUgYSBwcm9wZXJ0
eSBvZiB0aGUgcnVubmluZwo+IGRvbVUsIHNvIHRoYXQgaXQgd2lsbCBub3QgZ2V0IGxvc3QgZHVy
aW5nIG1pZ3JhdGlvbi4gRm9yIGluY29taW5nIGRvbVVzCj4gd2l0aG91dCBzdWNoIHByb3BlcnR5
IHNvbWUgZGVmYXVsdCBtdXN0IGJlIHNlbGVjdGVkIGJ5IGxpYnhsLiBsaWJ4bCBhdAo+IHJ1bnRp
bWUgaGFzIG5vIGluZm8gd2hhdCB0aGUgaW5pdGlhbCBxZW11IGNvbW1hbmQgd2FzLiBTbyB0aGlz
IGZhbGxiYWNrCj4gbXVzdCBiZWNvbWUgYSBjb21waWxlIG9yIHJ1bnRpbWUga25vYiBhcyB3ZWxs
LiBOb3Qgc3VyZSBpZiBpdCB3b3VsZCBiZSB0b28KPiBjdW1iZXJzb21lIGZvciBob3N0IGFkbWlu
cyB0byBhcHBseSB0aGUgZXF1aXZhbGVudCBvZgo+ICJkZXZpY2VfbW9kZWxfYXJnc19odm09IiB0
byBhIGZpdmUgb3Igc2l4IGRpZ2l0IG51bWJlciBvZiBydW5uaW5nIGRvbVVzCj4gZHVyaW5nIG9y
IHByaW9yIHRoZWlyIG1pZ3JhdGlvbi4KPiAKPiBUaGVyZSBzaG91bGQgYmUgYSAtLXFlbXV1LWh2
bS1tYWNoaW5lLCB3aGljaCBtYXkganVzdCBkZWZhdWx0IHRvICdwYy0xLjAnCj4gaWYgbm90IHNw
ZWNpZmllZC4gVGhhdCBzdHJpbmcgc2hvdWxkIGdvIHRvCj4gZG9tYWluX2J1aWxkX2luZm8udS5o
dm0ucWVtdXVfbWFjaGluZSwgc28gdGhhdCBpdCBiZWNvbWVzIHBhcnQgb2YgdGhlIGRvbVUKPiBw
cm9wZXJ0aWVzLgo+IAoKQ291bGQgd2UgaGF2ZSBhbiBvcGluaW9uIGZyb20gYSB0b29sc3RhY2sg
bWFpbnRhaW5lciAoY2MtZWQpLCBwbGVhc2U/CgogIFBhdWwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
