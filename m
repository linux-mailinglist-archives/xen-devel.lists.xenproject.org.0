Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EE817DCE3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 11:03:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBFD2-0006YU-7j; Mon, 09 Mar 2020 10:00:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kp90=42=amazon.co.uk=prvs=330e54f6a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jBFD1-0006YO-8k
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 10:00:27 +0000
X-Inumbo-ID: c9e51a56-61ec-11ea-8eb5-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9e51a56-61ec-11ea-8eb5-bc764e2007e4;
 Mon, 09 Mar 2020 10:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583748023; x=1615284023;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/oWFly73nWXPPgBuLZOGI5ZY1TgQrNp8nQs+zUjo1rE=;
 b=JOnvaMgPctvGvqu9bofDliM9LvnQR8b9GB3A4wlJAVBr9cSmRpznf8xo
 Dqq4sS9sIc6rDCcSNfnvU/b51rBStJpU5/SPPJT9DClhXZ4x1i/r4bZR1
 j+CG/6mVVcYvdot5i+JS8xIM2fSWyXgkcmVPexuqD3F2xUYwcu9Si1UMS 4=;
IronPort-SDR: MI9jG1Wss5G1Y6jsctrAIH1C8Etk8vFT9LT0QHrse7RajJFOCp/GkAkFC6pTqAeo1i39k64ZbZ
 3I/Ap19To5Hg==
X-IronPort-AV: E=Sophos;i="5.70,532,1574121600"; d="scan'208";a="31427986"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-859fe132.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 09 Mar 2020 10:00:20 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-859fe132.us-west-2.amazon.com (Postfix) with ESMTPS
 id 21DAC22A911; Mon,  9 Mar 2020 10:00:19 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 9 Mar 2020 10:00:18 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 9 Mar 2020 10:00:17 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 9 Mar 2020 10:00:17 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "paul@xen.org" <paul@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 6/6] domain: use PGC_extra domheap page for shared_info
Thread-Index: AQJ67pNJ24W66LNnVrJf5nGAmz5EyAGOWyi5pumiUrA=
Date: Mon, 9 Mar 2020 10:00:17 +0000
Message-ID: <2db0cb4e6239455bafa39eda27c8b41e@EX13D32EUC003.ant.amazon.com>
References: <20200309093511.1727-1-paul@xen.org>
 <20200309093511.1727-7-paul@xen.org>
In-Reply-To: <20200309093511.1727-7-paul@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.183]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 6/6] domain: use PGC_extra domheap page
 for shared_info
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IHBhdWxAeGVuLm9yZyA8cGF1bEB4
ZW4ub3JnPgo+IFNlbnQ6IDA5IE1hcmNoIDIwMjAgMDk6MzUKPiBUbzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCj4gQ2M6IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51
az47IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pCj4gPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgVm9s
b2R5bXlyIEJhYmNodWsKPiA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcAo+IDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47Cj4gS29ucmFkIFJ6ZXN6dXRlayBX
aWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBTdWJq
ZWN0OiBbUEFUQ0ggdjQgNi82XSBkb21haW46IHVzZSBQR0NfZXh0cmEgZG9taGVhcCBwYWdlIGZv
ciBzaGFyZWRfaW5mbwo+IAo+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNv
bT4KPiAKPiBDdXJyZW50bHkgc2hhcmVkX2luZm8gaXMgYSBzaGFyZWQgeGVuaGVhcCBwYWdlIGJ1
dCBzaGFyZWQgeGVuaGVhcCBwYWdlcwo+IGNvbXBsaWNhdGUgZnV0dXJlIHBsYW5zIGZvciBsaXZl
LXVwZGF0ZSBvZiBYZW4gc28gaXQgaXMgZGVzaXJhYmxlIHRvLAo+IHdoZXJlIHBvc3NpYmxlLCBu
b3QgdXNlIHRoZW0gWzFdLiBUaGlzIHBhdGNoIHRoZXJlZm9yZSBjb252ZXJ0cyBzaGFyZWRfaW5m
bwo+IGludG8gYSBQR0NfZXh0cmEgZG9taGVhcCBwYWdlLiBUaGlzIGRvZXMgZW50YWlsIGZyZWVp
bmcgc2hhcmVkX2luZm8gZHVyaW5nCj4gZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkgcmF0
aGVyIHRoYW4gZG9tYWluX2Rlc3Ryb3koKSBzbyBjYXJlIGlzCj4gbmVlZGVkIHRvIGF2b2lkIGRl
LXJlZmVyZW5jaW5nIGEgTlVMTCBzaGFyZWRfaW5mbyBwb2ludGVyIGhlbmNlIHNvbWUKPiBleHRy
YSBjaGVja3Mgb2YgJ2lzX2R5aW5nJyBhcmUgbmVlZGVkLgo+IAo+IE5PVEU6IEZvciBBcm0sIHRo
ZSBjYWxsIHRvIGZyZWVfc2hhcmVkX2luZm8oKSBpbiBhcmNoX2RvbWFpbl9kZXN0cm95KCkgaXMK
PiAgICAgICBsZWZ0IGluIHBsYWNlIHNpbmNlIGl0IGlzIGlkZW1wb3RlbnQgYW5kIGNhbGxlZCBp
biB0aGUgZXJyb3IgcGF0aCBmb3IKPiAgICAgICBhcmNoX2RvbWFpbl9jcmVhdGUoKS4KPiAKPiBb
MV0gU2VlIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2
ZWwvMjAyMC0wMi9tc2cwMjAxOC5odG1sCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50
IDxwYXVsQHhlbi5vcmc+CgpJIHJlYWxpc2UgSSBmb3Jnb3QgdG8gZm9sZCBpbiB0aGUgbmV3IGR1
bXAgZnVuY3Rpb24gZm9yIHNoYXJlZF9pbmZvIChuZWVkZWQgc2luY2UgaXQgd2lsbCBubyBsb25n
ZXIgZmVhdHVyZSBpbiB0aGUgZHVtcCBvZiB4ZW4gcGFnZXMpIHNvIEkgd2lsbCBzZW5kIGEgdjUg
b2YgdGhpcyBzZXJpZXMgc2hvcnRseS4KCiAgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
