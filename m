Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E2D1295AE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 12:49:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijMAU-0005mR-MS; Mon, 23 Dec 2019 11:46:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Htmo=2N=amazon.com=prvs=2537494bb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ijMAT-0005mM-2S
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 11:46:33 +0000
X-Inumbo-ID: dd75906e-2579-11ea-a1e1-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd75906e-2579-11ea-a1e1-bc764e2007e4;
 Mon, 23 Dec 2019 11:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1577101592; x=1608637592;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vvmp92KNUpBEgXRjRfQ+MICqzu1qMXT+80kMSZKetok=;
 b=dRX3UNJgEobMXWf0AvoDO3hEZe6DBAAZKvLGIIkztcT89uR+WbjZhVwz
 6XR+hPUAStO7q9sehGfFrWzNeEnEryILsuVH94SKiVQ1Vpx1zS2Lq8iGt
 AjEViQgCMgBpgGTIq+NzJL92EDcSbol9sQPDPqrfUOu2vEKYyVVd3QQkb 4=;
IronPort-SDR: bYFdawsqLJaf///3+Xmev8apsMjp4iYZk+WyLjr5J5nVgZ60Q04Yv7ot07mFMeKy50f3Bvfqg2
 YdpJMNxOkl2g==
X-IronPort-AV: E=Sophos;i="5.69,347,1571702400"; 
   d="scan'208";a="9790850"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 23 Dec 2019 11:46:31 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id 6C2C1A27B1; Mon, 23 Dec 2019 11:46:31 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 23 Dec 2019 11:46:30 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 23 Dec 2019 11:46:29 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 23 Dec 2019 11:46:29 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Wei Liu <wei.liu@kernel.org>
Thread-Topic: [PATCH net-next] xen-netback: support dynamic unbind/bind
Thread-Index: AQHVuXeo48GmlxuNH0abtWhDKbfEbafHl0uAgAACIOA=
Date: Mon, 23 Dec 2019 11:46:29 +0000
Message-ID: <1d1189a3acd8473fadc420d902fd4692@EX13D32EUC003.ant.amazon.com>
References: <20191223095923.2458-1-pdurrant@amazon.com>
 <20191223113545.nwugg7lsorttunuu@debian>
In-Reply-To: <20191223113545.nwugg7lsorttunuu@debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.29]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH net-next] xen-netback: support dynamic
 unbind/bind
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "David S. Miller" <davem@davemloft.net>, Paul Durrant <paul@xen.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdlaS5saXVAa2Vy
bmVsLm9yZz4KPiBTZW50OiAyMyBEZWNlbWJlciAyMDE5IDExOjM2Cj4gVG86IER1cnJhbnQsIFBh
dWwgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZzsgbmV0ZGV2QHZnZXIua2VybmVsLm9yZzsgbGludXgtCj4ga2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgV2VpIExpdSA8d2VpLmxpdUBrZXJuZWwub3JnPjsgUGF1bCBEdXJyYW50Cj4gPHBhdWxA
eGVuLm9yZz47IERhdmlkIFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KPiBTdWJqZWN0
OiBSZTogW1BBVENIIG5ldC1uZXh0XSB4ZW4tbmV0YmFjazogc3VwcG9ydCBkeW5hbWljIHVuYmlu
ZC9iaW5kCj4gCj4gT24gTW9uLCBEZWMgMjMsIDIwMTkgYXQgMDk6NTk6MjNBTSArMDAwMCwgUGF1
bCBEdXJyYW50IHdyb3RlOgo+IFsuLi5dCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQveGVu
LW5ldGJhY2svaW50ZXJmYWNlLmMgYi9kcml2ZXJzL25ldC94ZW4tCj4gbmV0YmFjay9pbnRlcmZh
Y2UuYwo+ID4gaW5kZXggZjE1YmEzZGU2MTk1Li4wYzhhMDJhMWVhZDcgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYwo+ID4gKysrIGIvZHJpdmVycy9u
ZXQveGVuLW5ldGJhY2svaW50ZXJmYWNlLmMKPiA+IEBAIC01ODUsNiArNTg1LDcgQEAgaW50IHhl
bnZpZl9jb25uZWN0X2N0cmwoc3RydWN0IHhlbnZpZiAqdmlmLAo+IGdyYW50X3JlZl90IHJpbmdf
cmVmLAo+ID4gIAlzdHJ1Y3QgbmV0X2RldmljZSAqZGV2ID0gdmlmLT5kZXY7Cj4gPiAgCXZvaWQg
KmFkZHI7Cj4gPiAgCXN0cnVjdCB4ZW5fbmV0aWZfY3RybF9zcmluZyAqc2hhcmVkOwo+ID4gKwlS
SU5HX0lEWCByc3BfcHJvZCwgcmVxX3Byb2Q7Cj4gPiAgCWludCBlcnI7Cj4gPgo+ID4gIAllcnIg
PSB4ZW5idXNfbWFwX3JpbmdfdmFsbG9jKHhlbnZpZl90b194ZW5idXNfZGV2aWNlKHZpZiksCj4g
PiBAQCAtNTkzLDcgKzU5NCwxNCBAQCBpbnQgeGVudmlmX2Nvbm5lY3RfY3RybChzdHJ1Y3QgeGVu
dmlmICp2aWYsCj4gZ3JhbnRfcmVmX3QgcmluZ19yZWYsCj4gPiAgCQlnb3RvIGVycjsKPiA+Cj4g
PiAgCXNoYXJlZCA9IChzdHJ1Y3QgeGVuX25ldGlmX2N0cmxfc3JpbmcgKilhZGRyOwo+ID4gLQlC
QUNLX1JJTkdfSU5JVCgmdmlmLT5jdHJsLCBzaGFyZWQsIFhFTl9QQUdFX1NJWkUpOwo+ID4gKwly
c3BfcHJvZCA9IFJFQURfT05DRShzaGFyZWQtPnJzcF9wcm9kKTsKPiA+ICsJcmVxX3Byb2QgPSBS
RUFEX09OQ0Uoc2hhcmVkLT5yZXFfcHJvZCk7Cj4gPiArCj4gPiArCUJBQ0tfUklOR19BVFRBQ0go
JnZpZi0+Y3RybCwgc2hhcmVkLCByc3BfcHJvZCwgWEVOX1BBR0VfU0laRSk7Cj4gPiArCj4gPiAr
CWVyciA9IC1FSU87Cj4gPiArCWlmIChyZXFfcHJvZCAtIHJzcF9wcm9kID4gUklOR19TSVpFKCZ2
aWYtPmN0cmwpKQo+ID4gKwkJZ290byBlcnJfdW5tYXA7Cj4gCj4gSSB0aGluayBpdCBtYWtlcyBt
b3JlIHNlbnNlIHRvIGF0dGFjaCB0aGUgcmluZyBhZnRlciB0aGlzIGNoZWNrIGhhcyBiZWVuCj4g
ZG9uZSwgYnV0IEkgY2FuIHNlZSB5b3Ugd2FudCB0byBzdHJ1Y3R1cmUgY29kZSBsaWtlIHRoaXMg
dG8gcmV1c2UgdGhlCj4gdW5tYXAgZXJyb3IgcGF0aC4KCkxvb2tzIGEgbGl0dGxlIG9kZCwgYWdy
ZWVkLiBUaGUgcmVhc29uIEkgZGlkIGl0IHRoaXMgd2F5IGlzIHNvIHRoYXQgSSBjYW4gdXNlIFJJ
TkdfU0laRSgpIHJhdGhlciB0aGFuIGhhdmluZyB0byB1c2UgX19SSU5HX1NJWkUoKTsgbWFrZXMg
dGhlIGNvZGUganVzdCBhIGxpdHRsZSBiaXQgc2hvcnRlci4uLiB3aGljaCByZW1pbmRzIG1lIEkg
b3VnaHQgdG8gbmVhdGVuIHVwIGJsa2JhY2sgc2ltaWxhcmx5LgoKPiAKPiBTbzoKPiAKPiBSZXZp
ZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdUBrZXJuZWwub3JnPgo+IAo+IE5pY2Ugd29yayBidHcu
CgpUaGFua3MgOi0pCgogIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
