Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAB117B92C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 10:25:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA9Bg-0003j9-Lh; Fri, 06 Mar 2020 09:22:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FvQx=4X=amazon.co.uk=prvs=32702b987=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jA9Bf-0003iz-Az
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 09:22:31 +0000
X-Inumbo-ID: fe93346c-5f8b-11ea-a77d-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe93346c-5f8b-11ea-a77d-12813bfff9fa;
 Fri, 06 Mar 2020 09:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583486547; x=1615022547;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=PlfbDt99oy8sqEGoueqt1Cz+aPqB3hdcO/mQe+yuKQ0=;
 b=PzwB4xk3Xk6YfQeU0HJokcx+wc/01ljeOGG3PfS/KOUV3nodHoS7S6QX
 qIu6RNq0DxKW2kKn8GZz9kFQy1EyHba0G6p8AyiSjQuZV6iKsI6zGs4M9
 pZASwFiofDF0G4Pz6V3z1UD4PgkDOCz1ijnViGGaErF/8QEp5XdDz5fOJ 4=;
IronPort-SDR: lVLTsgziyIiLsOc7QGJCdy7LOlv6nXXSqNoxhgdebceG8us5IprMKkaFkzBkEplIfRS1kiekEV
 yQO7KPvWiOtQ==
X-IronPort-AV: E=Sophos;i="5.70,521,1574121600"; d="scan'208";a="29631399"
Thread-Topic: [Xen-devel] [PATCH v3 5/6] mm: add 'is_special_page' macro...
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 06 Mar 2020 09:22:24 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id D8C9F283138; Fri,  6 Mar 2020 09:22:19 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 6 Mar 2020 09:22:19 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Mar 2020 09:22:18 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 6 Mar 2020 09:22:18 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "Alan.Robinson@ts.fujitsu.com" <Alan.Robinson@ts.fujitsu.com>,
 "pdurrant@amzn.com" <pdurrant@amzn.com>
Thread-Index: AQHV8uvzxGIBlfeLUUGZcXfQktffOqg7JI6AgAAmn8A=
Date: Fri, 6 Mar 2020 09:22:18 +0000
Message-ID: <bc581a28684145058c3e6c7a6fbb1727@EX13D32EUC003.ant.amazon.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-6-pdurrant@amzn.com>
 <20200306070229.GA24998@ts.fujitsu.com>
In-Reply-To: <20200306070229.GA24998@ts.fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.87]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 5/6] mm: add 'is_special_page' macro...
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>, Tamas
 K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IGRldGVjdGVkLWFzLXNwYW1AYW1h
em9uLmNvbSA8ZGV0ZWN0ZWQtYXMtc3BhbUBhbWF6b24uY29tPiBPbiBCZWhhbGYgT2YgQWxhbiBS
b2JpbnNvbgo+IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMDc6MDIKPiBUbzogcGR1cnJhbnRAYW16bi5j
b20KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwKPiA8anVsaWVuQHhlbi5v
cmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQu
d2lsa0BvcmFjbGUuY29tPjsgQW5kcmV3IENvb3Blcgo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPjsgRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgSWFuIEphY2tzb24K
PiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT47IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPjsgVGFtYXMKPiBLIExlbmd5
ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
OyBSb2dlciBQYXUgTW9ubsOpCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IFN1YmplY3Q6IFJF
OiBbRVhURVJOQUxdW1hlbi1kZXZlbF0gW1BBVENIIHYzIDUvNl0gbW06IGFkZCAnaXNfc3BlY2lh
bF9wYWdlJyBtYWNyby4uLgo+IAo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9t
IG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4K
PiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZS4KPiAKPiAKPiAKPiBBIHR5cG8uLi4KPiAKPiBPbiBUaHUsIE1h
ciAwNSwgMjAyMCBhdCAwMTo0NTowM1BNICswMTAwLCBwZHVycmFudEBhbXpuLmNvbSB3cm90ZToK
PiA+Cj4gPiBQR0NfZXh0cmEgcGFnZXMgYXJlIGludGVuZGVkIHRvIGhvbGQgZGF0YSBzdHJ1Y3R1
cmVzIHRoYXQgYXJlIGFzc29jaWF0ZWQKPiA+IHdpdGggYSBkb21haW4gYW5kIG15IGJlIG1hcHBl
ZCBieSB0aGF0IGRvbWFpbi4gVGhleSBzaG91bGQgbm90IGJlIHRyZWF0ZWQKPiAKPiBzL215L21h
eS8KCkdvb2Qgc3BvdC4gV2lsbCBmaXguIFRoYW5rcywKCiAgUGF1bAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
