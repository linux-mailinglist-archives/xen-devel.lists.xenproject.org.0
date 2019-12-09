Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECC0116D1D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 13:27:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieI5y-00059T-DC; Mon, 09 Dec 2019 12:24:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BuSh=Z7=amazon.com=prvs=2393b02c0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ieI5x-00059O-AP
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 12:24:57 +0000
X-Inumbo-ID: e92461c0-1a7e-11ea-88e7-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e92461c0-1a7e-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 12:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575894297; x=1607430297;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QtCj/9K/AIAe1MY4j6H683/S6PECk5x09PNGWvLJxjo=;
 b=PL0SdY+OHxQ8Ytnyo/1c99uW9+Mk0UzY0A7xGUMbV0vMz9ZlcJx/2lsu
 2ag5jde6Sj2oIoDxEcDqp5VoldzkUePVTZiqDPoDtNs3Vo99QtC4qvjcZ
 UcDtm5/f2uTOZOYqN4/sN0JePwT66DYZzA5EiBqWwvgSjrAiLwzdc3DaV w=;
IronPort-SDR: NrS8ksYiTcwjYGii7UpFE4VAW7by8aX/VuTQ+PhuPvZE6KtQRtp0I0buCLSe9A3LTZUgdY5CuJ
 mu5bs2s59l0w==
X-IronPort-AV: E=Sophos;i="5.69,294,1571702400"; 
   d="scan'208";a="6802387"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 09 Dec 2019 12:24:56 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 45F7EA21B5; Mon,  9 Dec 2019 12:24:53 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 12:24:53 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 12:24:50 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 9 Dec 2019 12:24:49 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Thread-Topic: [PATCH 4/4] xen-blkback: support dynamic unbind/bind
Thread-Index: AQHVq3SGozEa3lNeXkCoixgttFczb6exvlMAgAABmYA=
Date: Mon, 9 Dec 2019 12:24:49 +0000
Message-ID: <215c57c1096548769aeaaeaa76e7c73b@EX13D32EUC003.ant.amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-5-pdurrant@amazon.com>
 <20191209121726.GU980@Air-de-Roger>
In-Reply-To: <20191209121726.GU980@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.211]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 4/4] xen-blkback: support dynamic unbind/bind
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+IFNlbnQ6IDA5IERlY2VtYmVyIDIwMTkgMTI6MTcKPiBUbzog
RHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiBDYzogbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZzsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBLb25yYWQKPiBS
emVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEplbnMgQXhib2UgPGF4Ym9l
QGtlcm5lbC5kaz47Cj4gQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNv
bT47IEp1ZXJnZW4gR3Jvc3MKPiA8amdyb3NzQHN1c2UuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNC80XSB4ZW4t
YmxrYmFjazogc3VwcG9ydCBkeW5hbWljIHVuYmluZC9iaW5kCj4gCj4gT24gVGh1LCBEZWMgMDUs
IDIwMTkgYXQgMDI6MDE6MjNQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+ID4gQnkgc2lt
cGx5IHJlLWF0dGFjaGluZyB0byBzaGFyZWQgcmluZ3MgZHVyaW5nIGNvbm5lY3RfcmluZygpIHJh
dGhlciB0aGFuCj4gPiBhc3N1bWluZyB0aGV5IGFyZSBmcmVzaGx5IGFsbG9jYXRlZCAoaS5lIGFz
c3VtaW5nIHRoZSBjb3VudGVycyBhcmUgemVybykKPiA+IGl0IGlzIHBvc3NpYmxlIGZvciB2YmQg
aW5zdGFuY2VzIHRvIGJlIHVuYm91bmQgYW5kIHJlLWJvdW5kIGZyb20gYW5kIHRvCj4gPiAocmVz
cGVjdGl2ZWx5KSBhIHJ1bm5pbmcgZ3Vlc3QuCj4gPgo+ID4gVGhpcyBoYXMgYmVlbiB0ZXN0ZWQg
YnkgcnVubmluZzoKPiA+Cj4gPiB3aGlsZSB0cnVlOyBkbyBkZCBpZj0vZGV2L3VyYW5kb20gb2Y9
dGVzdC5pbWcgYnM9MU0gY291bnQ9MTAyNDsgZG9uZQo+ID4KPiA+IGluIGEgUFYgZ3Vlc3Qgd2hp
bHN0IHJ1bm5pbmc6Cj4gPgo+ID4gd2hpbGUgdHJ1ZTsKPiA+ICAgZG8gZWNobyB2YmQtJERPTUlE
LSRWQkQgPnVuYmluZDsKPiA+ICAgZWNobyB1bmJvdW5kOwo+ID4gICBzbGVlcCA1Owo+ID4gICBl
Y2hvIHZiZC0kRE9NSUQtJFZCRCA+YmluZDsKPiA+ICAgZWNobyBib3VuZDsKPiA+ICAgc2xlZXAg
MzsKPiA+ICAgZG9uZQo+IAo+IFNvIHRoaXMgZG9lcyB1bmJpbmQgYmxrYmFjayB3aGlsZSBsZWF2
aW5nIHRoZSBQViBpbnRlcmZhY2UgYXMKPiBjb25uZWN0ZWQ/Cj4gCgpZZXMsIGV2ZXJ5dGhpbmcg
aXMgbGVmdCBpbiBwbGFjZSBpbiB0aGUgZnJvbnRlbmQuIFRoZSBiYWNrZW5kIGRldGFjaGVzIGZy
b20gdGhlIHJpbmcsIGNsb3NlcyBpdHMgZW5kIG9mIHRoZSBldmVudCBjaGFubmVscywgZXRjLiBi
dXQgdGhlIGd1ZXN0IGNhbiBzdGlsbCBzZW5kIHJlcXVlc3RzIHdoaWNoIHdpbGwgZ2V0IHNlcnZp
Y2VkIHdoZW4gdGhlIG5ldyBiYWNrZW5kIGF0dGFjaGVzLgoKICBQYXVsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
