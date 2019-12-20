Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC2812805F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 17:08:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiKm3-0000OF-6x; Fri, 20 Dec 2019 16:05:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiKm1-0000OA-UE
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 16:05:05 +0000
X-Inumbo-ID: 770511c6-2342-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 770511c6-2342-11ea-88e7-bc764e2007e4;
 Fri, 20 Dec 2019 16:04:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8BBD7B1AC;
 Fri, 20 Dec 2019 16:04:55 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191218144233.15372-1-liuwe@microsoft.com>
 <20191218144233.15372-7-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6cb667f8-0ace-75f5-e0b0-c35f8900952d@suse.com>
Date: Fri, 20 Dec 2019 17:05:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191218144233.15372-7-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 6/6] x86: implement Hyper-V clock source
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

T24gMTguMTIuMjAxOSAxNTo0MiwgV2VpIExpdSB3cm90ZToKPiAtLS0gYS94ZW4vYXJjaC94ODYv
dGltZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L3RpbWUuYwo+IEBAIC0zMSw2ICszMSw3IEBACj4g
ICNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+Cj4gICNpbmNsdWRlIDxhc20vZml4bWFwLmg+Cj4g
ICNpbmNsdWRlIDxhc20vZ3Vlc3QuaD4KPiArI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnYtdGxm
cy5oPgoKQ2FuIHRoaXMgcGxlYXNlIG1vdmUgLi4uCgo+IEBAIC02NDQsNiArNjQ1LDEwMyBAQCBz
dGF0aWMgc3RydWN0IHBsYXRmb3JtX3RpbWVzb3VyY2UgX19pbml0ZGF0YSBwbHRfeGVuX3RpbWVy
ID0KPiAgfTsKPiAgI2VuZGlmCj4gIAo+ICsjaWZkZWYgQ09ORklHX0hZUEVSVl9HVUVTVAoKLi4u
IGhlcmUsIHRvIGF2b2lkIHRoZSBkZXBlbmRlbmN5IG9uIHRoZSBoZWFkZXIgd2hlbiB0aGUgb3B0
aW9uIGlzCm9mZj8KCj4gKy8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioKPiArICogSFlQRVItViBSRUZFUkVOQ0UgVFNDCj4gKyAqLwo+
ICsKPiArc3RhdGljIHN0cnVjdCBtc19oeXBlcnZfdHNjX3BhZ2UgKmh5cGVydl90c2M7Cj4gK3N0
YXRpYyBzdHJ1Y3QgcGFnZV9pbmZvICpoeXBlcnZfdHNjX3BhZ2U7Cj4gKwo+ICtzdGF0aWMgaW50
NjRfdCBfX2luaXQgaW5pdF9oeXBlcnZfdGltZXIoc3RydWN0IHBsYXRmb3JtX3RpbWVzb3VyY2Ug
KnB0cykKPiArewo+ICsgICAgcGFkZHJfdCBtYWRkcjsKPiArICAgIHVpbnQ2NF90IHRzY19tc3Is
IGZyZXE7Cj4gKwo+ICsgICAgaWYgKCAhKG1zX2h5cGVydi5mZWF0dXJlcyAmIEhWX01TUl9SRUZF
UkVOQ0VfVFNDX0FWQUlMQUJMRSkgKQo+ICsgICAgICAgIHJldHVybiAwOwo+ICsKPiArICAgIGh5
cGVydl90c2NfcGFnZSA9IGFsbG9jX2RvbWhlYXBfcGFnZShOVUxMLCAwKTsKPiArICAgIGlmICgg
IWh5cGVydl90c2NfcGFnZSApCj4gKyAgICAgICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgaHlwZXJ2
X3RzYyA9IF9fbWFwX2RvbWFpbl9wYWdlX2dsb2JhbChoeXBlcnZfdHNjX3BhZ2UpOwo+ICsgICAg
aWYgKCAhaHlwZXJ2X3RzYyApCj4gKyAgICB7Cj4gKyAgICAgICAgZnJlZV9kb21oZWFwX3BhZ2Uo
aHlwZXJ2X3RzY19wYWdlKTsKPiArICAgICAgICBoeXBlcnZfdHNjX3BhZ2UgPSBOVUxMOwo+ICsg
ICAgICAgIHJldHVybiAwOwo+ICsgICAgfQo+ICsKPiArICAgIG1hZGRyID0gcGFnZV90b19tYWRk
cihoeXBlcnZfdHNjX3BhZ2UpOwo+ICsKPiArICAgIC8qCj4gKyAgICAgKiBQZXIgSHlwZXItViBU
TEZTOgo+ICsgICAgICogICAxLiBSZWFkIGV4aXN0aW5nIE1TUiB2YWx1ZQo+ICsgICAgICogICAy
LiBQcmVzZXJ2ZSBiaXRzIFsxMToxXQo+ICsgICAgICogICAzLiBTZXQgYml0cyBbNjM6MTJdIHRv
IGJlIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3Mgb2YgdHNjIHBhZ2UKPiArICAgICAqICAgNC4gU2V0
IGVuYWJsZWQgYml0ICgwKQo+ICsgICAgICogICA1LiBXcml0ZSBiYWNrIG5ldyBNU1IgdmFsdWUK
PiArICAgICAqLwo+ICsgICAgcmRtc3JsKEhWX1g2NF9NU1JfUkVGRVJFTkNFX1RTQywgdHNjX21z
cik7Cj4gKyAgICB0c2NfbXNyICY9IDB4ZmZlVUxMOwoKVGhlcmUncyBubyByZWFsIG5lZWQgZm9y
IHRoZSBVTEwgc3VmZml4LgoKPiArICAgIHRzY19tc3IgfD0gIG1hZGRyIHwgMSAvKiBlbmFibGVk
ICovOwoKU3RyYXkgZG91YmxlIGJsYW5rIGFmdGVyIHw9ID8KCj4gKyAgICB3cm1zcmwoSFZfWDY0
X01TUl9SRUZFUkVOQ0VfVFNDLCB0c2NfbXNyKTsKPiArCj4gKyAgICAvKiBHZXQgVFNDIGZyZXF1
ZW5jeSBmcm9tIEh5cGVyLVYgKi8KPiArICAgIHJkbXNybChIVl9YNjRfTVNSX1RTQ19GUkVRVUVO
Q1ksIGZyZXEpOwo+ICsgICAgcHRzLT5mcmVxdWVuY3kgPSBmcmVxOwo+ICsKPiArICAgIHJldHVy
biBmcmVxOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHVpbnQ2NF90IHJlYWRfaHlwZXJ2X3Rp
bWVyKHZvaWQpCj4gK3sKPiArICAgIHVpbnQ2NF90IHNjYWxlLCBvZmZzZXQsIHJldCwgdHNjOwo+
ICsgICAgdWludDMyX3Qgc2VxOwo+ICsgICAgY29uc3Qgc3RydWN0IG1zX2h5cGVydl90c2NfcGFn
ZSAqdHNjX3BhZ2UgPSBoeXBlcnZfdHNjOwo+ICsKPiArICAgIGRvIHsKPiArICAgICAgICBzZXEg
PSB0c2NfcGFnZS0+dHNjX3NlcXVlbmNlOwo+ICsKPiArICAgICAgICAvKiBTZXEgMCBpcyBzcGVj
aWFsLiBJdCBtZWFucyB0aGUgVFNDIGVubGlnaHRlbm1lbnQgaXMgbm90Cj4gKyAgICAgICAgICog
YXZhaWxhYmxlIGF0IHRoZSBtb21lbnQuIFRoZSByZWZlcmVuY2UgdGltZSBjYW4gb25seSBiZQo+
ICsgICAgICAgICAqIG9idGFpbmVkIGZyb20gdGhlIFJlZmVyZW5jZSBDb3VudGVyIE1TUi4KPiAr
ICAgICAgICAgKi8KPiArICAgICAgICBpZiAoIHNlcSA9PSAwICkKPiArICAgICAgICB7Cj4gKyAg
ICAgICAgICAgIHJkbXNybChIVl9YNjRfTVNSX1RJTUVfUkVGX0NPVU5ULCByZXQpOwo+ICsgICAg
ICAgICAgICByZXR1cm4gcmV0Owo+ICsgICAgICAgIH0KPiArCj4gKyAgICAgICAgLyogcmR0c2Nf
b3JkZXJlZCBhbHJlYWR5IGNvbnRhaW5zIGEgbG9hZCBmZW5jZSAqLwo+ICsgICAgICAgIHRzYyA9
IHJkdHNjX29yZGVyZWQoKTsKPiArICAgICAgICBzY2FsZSA9IHRzY19wYWdlLT50c2Nfc2NhbGU7
Cj4gKyAgICAgICAgb2Zmc2V0ID0gdHNjX3BhZ2UtPnRzY19vZmZzZXQ7Cj4gKwo+ICsgICAgICAg
IHNtcF9ybWIoKTsKPiArCj4gKyAgICB9IHdoaWxlICh0c2NfcGFnZS0+dHNjX3NlcXVlbmNlICE9
IHNlcSk7Cj4gKwo+ICsgICAgLyogcmV0ID0gKCh0c2MgKiBzY2FsZSkgPj4gNjQpICsgb2Zmc2V0
OyAqLwo+ICsgICAgYXNtICggIm11bCAlW3NjYWxlXTsgYWRkICVbb2Zmc2V0XSwgJVtyZXRdIgo+
ICsgICAgICAgICAgOiAiK2EiICh0c2MpLCBbcmV0XSAiPWQiIChyZXQpCgpUaGlzIG5lZWRzIHRv
IGJlICI9JmQiLCBvciBlbHNlICVyZHggbWF5IGJlIHVzZWQgdG8gYWRkcmVzcwolW29mZnNldF0g
KHdoZW4gaW4gbWVtb3J5KS4KCldpdGggdGhlc2UgdGFrZW4gY2FyZSBvZgpSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
