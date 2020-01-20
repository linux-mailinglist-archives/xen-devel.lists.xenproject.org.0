Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9E01424EC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 09:22:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itSGD-0003tS-Hn; Mon, 20 Jan 2020 08:18:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0TSi=3J=amazon.co.uk=prvs=281953620=pdurrant@srs-us1.protection.inumbo.net>)
 id 1itSGC-0003tN-1O
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 08:18:12 +0000
X-Inumbo-ID: 6365e9a0-3b5d-11ea-b932-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6365e9a0-3b5d-11ea-b932-12813bfff9fa;
 Mon, 20 Jan 2020 08:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579508288; x=1611044288;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kHn6/TihpXh1K5oq2Y25qriZKV9sAgXCLeHcOYMQa10=;
 b=eeD8r+0LndVAJLOp/2z0vt6I9QvjD+CBMHKt9XIppZFn0Kf399p6PB7S
 uRfRluKZ4S/fqHPejOk/0mauWjompEZ2qpVLLxkjexfRCoxoILDjkkCvd
 KOeEPwKX7SIWLjFR11AlUWWlNpHtevQmU0XZhoFfre5sMBZTD1W1g1RF1 8=;
IronPort-SDR: et5HbGinTn/6tNJlapXPgNYDPzBmUOS7JiCaTRtH7+qYrJH/KZxiwWV9TINL3USElk217Yba3n
 v+Rjq4wnCMOw==
X-IronPort-AV: E=Sophos;i="5.70,341,1574121600"; d="scan'208";a="13706843"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 20 Jan 2020 08:18:07 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9D5CFA06F5; Mon, 20 Jan 2020 08:18:03 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 20 Jan 2020 08:18:02 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 20 Jan 2020 08:18:02 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 20 Jan 2020 08:18:02 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH v3 4/6] libxl: allow creation of domains with a specified
 or random domid
Thread-Index: AQHVzFBoLAnvKVVhW06F0xOPMrYEQKftnwCAgAD5nnCAACM9gIAACGbQgAA5WICABD22MA==
Date: Mon, 20 Jan 2020 08:18:01 +0000
Message-ID: <39c09f379fac4662901b8719355da32c@EX13D32EUC003.ant.amazon.com>
References: <20200116093602.4203-1-pdurrant@amazon.com>
 <20200116093602.4203-5-pdurrant@amazon.com>
 <24096.44311.441643.264877@mariner.uk.xensource.com>
 <402866798e2a40e192fd8052548374c5@EX13D32EUC003.ant.amazon.com>
 <24097.39947.159860.741920@mariner.uk.xensource.com>
 <d5ca972f0e7a429d847a522e9f21c54b@EX13D32EUC003.ant.amazon.com>
 <24097.54065.383121.600036@mariner.uk.xensource.com>
In-Reply-To: <24097.54065.383121.600036@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.33]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 4/6] libxl: allow creation of domains
 with a specified or random domid
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "jandryuk@gmail.com" <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AY2l0cml4LmNvbT4KPiBTZW50OiAxNyBKYW51YXJ5IDIwMjAgMTU6MzEKPiBUbzogRHVy
cmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbnRob255IFBlcmFyZAo+IDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNA
Y2l0cml4LmNvbT47Cj4gR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsg
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsKPiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrCj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+
OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Owo+IGphbmRyeXVr
QGdtYWlsLmNvbQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjMgNC82XSBsaWJ4bDogYWxsb3cgY3Jl
YXRpb24gb2YgZG9tYWlucyB3aXRoIGEKPiBzcGVjaWZpZWQgb3IgcmFuZG9tIGRvbWlkCj4gCj4g
RHVycmFudCwgUGF1bCB3cml0ZXMgKCJSRTogW1BBVENIIHYzIDQvNl0gbGlieGw6IGFsbG93IGNy
ZWF0aW9uIG9mIGRvbWFpbnMKPiB3aXRoIGEgc3BlY2lmaWVkIG9yIHJhbmRvbSBkb21pZCIpOgo+
ID4gT2ssIHRvIGNvdmVyIGFsbCBiYXNlcyB0aGVuIGl0IHNlZW1zIGxpa2UgY2hlY2tpbmcgdGhl
IGRvbWlkIGFmdGVyCj4gY3JlYXRpb24gYW5kIHRoZW4gZGVzdHJveWluZyBpZiBpdCBpcyB0b28g
cmVjZW50IGlzIHRoZSBiZXR0ZXIgb3B0aW9uLgo+IAo+IEkgdGhpbmsgc28sIHllcy4gIEkgdGhp
bmsgdGhlIHJlY2VudCB0aW1lc3RhbXAgc2hvdWxkIGJlIHVwZGF0ZWQgaW4KPiB0aGlzIGNhc2Uu
ICAoRmFmZiEpCj4gCgpJIGRvbid0IHRoaW5rIHdlIG5lZWQgdG8gbWVzcyB3aXRoIHRoZSB0aW1l
LXN0YW1wIGluIHRoaXMgY2FzZS4gVGhlIGRvbWFpbiB3aWxsIGJlIGtpbGxlZCB2ZXJ5IHF1aWNr
bHksIGJlZm9yZSBhbnkgUFYgYmFja2VuZHMgYXJlIGJ1aWx0IGFuZCBJSVVDIHRoYXQncyB3aGF0
IHdlIGNhcmUgYWJvdXQgd2hlbiBpdCBjb21lcyB0byByZS11c2luZyBkb21pZHMgdG9vIHF1aWNr
bHkuCgogIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
