Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F005D10D79D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 16:07:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahn9-0006FR-Rr; Fri, 29 Nov 2019 15:02:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3pi/=ZV=amazon.com=prvs=22965b742=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iahn7-0006FK-TR
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:02:41 +0000
X-Inumbo-ID: 4a4aac52-12b9-11ea-a3e7-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a4aac52-12b9-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 15:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575039761; x=1606575761;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FBmcn7qg/GoPD9g1g6BUkkjLeolf0VTqzn6bihHReQU=;
 b=Gl28a1+EPMjJAmJ67a7w5DikIKR8TSBzJGvAGncv/YjSr47s34+auMhm
 is9iYWk7l3TO2L3URfx2ID2KO55qOwKeI9cvKzdLMxo9VjzIZhBHP1WjQ
 wbRuI+lFTJmk359HbRiOyLzi4DH100wp5a+hc5fQEO8ePAkDOBJRyzsD/ c=;
IronPort-SDR: Rf2O4UJ4AzwTF7t1/MajgDmbDCYYpaYTzE3dDwNd4Aw4Xf4LrbC4jyRFXCA52lqF6qCA9tdalw
 8WNtgjzbiKlQ==
X-IronPort-AV: E=Sophos;i="5.69,257,1571702400"; 
   d="scan'208";a="5434371"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 29 Nov 2019 15:02:40 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id 461FAA1F12; Fri, 29 Nov 2019 15:02:39 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 15:02:38 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 15:02:38 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 29 Nov 2019 15:02:37 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Thread-Topic: [PATCH v2 2/2] block/xen-blkback: allow module to be cleanly
 unloaded
Thread-Index: AQHVprr1wqXBoNh5XEupYuifQUpCwqeiPekAgAAAkLA=
Date: Fri, 29 Nov 2019 15:02:37 +0000
Message-ID: <f06bf1967bdf43ca9b218f9b5c5202a6@EX13D32EUC003.ant.amazon.com>
References: <20191129134306.2738-1-pdurrant@amazon.com>
 <20191129134306.2738-3-pdurrant@amazon.com>
 <20191129150006.GZ980@Air-de-Roger>
In-Reply-To: <20191129150006.GZ980@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 2/2] block/xen-blkback: allow module to
 be cleanly unloaded
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+IFNlbnQ6IDI5IE5vdmVtYmVyIDIwMTkgMTU6MDAKPiBUbzog
RHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiBDYzogbGludXgtYmxvY2tAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyB4ZW4tCj4gZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IEtvbnJhZCBSemVzenV0ZWsgV2lsawo+IDxrb25yYWQud2ls
a0BvcmFjbGUuY29tPjsgSmVucyBBeGJvZSA8YXhib2VAa2VybmVsLmRrPgo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjIgMi8yXSBibG9jay94ZW4tYmxrYmFjazogYWxsb3cgbW9kdWxlIHRvIGJlIGNs
ZWFubHkKPiB1bmxvYWRlZAo+IAo+IE9uIEZyaSwgTm92IDI5LCAyMDE5IGF0IDAxOjQzOjA2UE0g
KzAwMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+IEFkZCBhIG1vZHVsZV9leGl0KCkgdG8gcGVy
Zm9ybSB0aGUgbmVjZXNzYXJ5IGNsZWFuLXVwLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwg
RHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAKPiBMR1RNOgo+IAo+IFJldmlld2VkLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKClRoYW5rcy4KCj4g
QUZBSUNUIHdlIHNob3VsZCBtYWtlIHN1cmUgdGhpcyBpcyBub3QgY29tbWl0dGVkIGJlZm9yZSBw
YXRjaCAxLCBvcgo+IGVsc2UgeW91IGNvdWxkIHVubG9hZCBhIGJsa2JhY2sgbW9kdWxlIHRoYXQn
cyBzdGlsbCBpbiB1c2U/Cj4gCgpZZXMsIHRoYXQncyBjb3JyZWN0LgoKICBQYXVsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
