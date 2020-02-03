Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E808D150679
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 13:59:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iybHT-0003i7-2G; Mon, 03 Feb 2020 12:56:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iybHR-0003i2-E0
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 12:56:45 +0000
X-Inumbo-ID: a1153bac-4684-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1153bac-4684-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 12:56:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7C88CAE1C;
 Mon,  3 Feb 2020 12:56:43 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-2-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9a162fec-989d-c85c-68e5-4e5064d90ca9@suse.com>
Date: Mon, 3 Feb 2020 13:56:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200131174930.31045-2-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 01/11] x86/hypervisor: make
 hypervisor_ap_setup return an error code
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMDEuMjAyMCAxODo0OSwgV2VpIExpdSB3cm90ZToKPiBXZSB3YW50IHRvIGJlIGFibGUg
dG8gaGFuZGxlIEFQIHNldHVwIGVycm9yIGluIHRoZSB1cHBlciBsYXllci4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+IC0tLQo+IHY2Ogo+IDEuIENo
YW5nZSBtYXBfdmNwdWluZm8gYXMgd2VsbAoKQW5kIGJ5IGltcGxpY2F0aW9uIHRoZW4gLi4uCgo+
IEBAIC0yNTcsMTEgKzI1NywxNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXAodm9pZCkKPiAg
ICAgIGluaXRfZXZ0Y2huKCk7Cj4gIH0KPiAgCj4gLXN0YXRpYyB2b2lkIGFwX3NldHVwKHZvaWQp
Cj4gK3N0YXRpYyBpbnQgYXBfc2V0dXAodm9pZCkKPiAgewo+ICsgICAgaW50IHJjOwo+ICsKPiAg
ICAgIHNldF92Y3B1X2lkKCk7Cj4gLSAgICBtYXBfdmNwdWluZm8oKTsKPiAtICAgIGluaXRfZXZ0
Y2huKCk7Cj4gKyAgICByYyA9IG1hcF92Y3B1aW5mbygpOwo+ICsKPiArICAgIGlmICggIXJjICkK
PiArICAgICAgICBpbml0X2V2dGNobigpOwoKLi4uIGluaXRfZXZ0Y2huKCkgYXMgd2VsbD8KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
