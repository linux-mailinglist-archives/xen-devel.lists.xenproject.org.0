Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0D8A15D5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 12:23:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3HX7-0003lX-5s; Thu, 29 Aug 2019 10:20:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3HX5-0003kt-PD
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 10:19:59 +0000
X-Inumbo-ID: 7ce8102c-ca46-11e9-ae64-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ce8102c-ca46-11e9-ae64-12813bfff9fa;
 Thu, 29 Aug 2019 10:19:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ABACDAF43;
 Thu, 29 Aug 2019 10:19:31 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-11-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <86fbb756-85ce-5def-87bc-6a90cce22018@suse.com>
Date: Thu, 29 Aug 2019 12:19:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566177928-19114-11-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 10/15] microcode: split out
 apply_microcode() from cpu_request_microcode()
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDguMjAxOSAwMzoyNSwgQ2hhbyBHYW8gd3JvdGU6Cj4gQEAgLTMwMCwzMiArMzIyLDQ0
IEBAIGludCBtaWNyb2NvZGVfdXBkYXRlKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oY29uc3Rfdm9p
ZCkgYnVmLCB1bnNpZ25lZCBsb25nIGxlbikKPiAgICAgIGlmICggbWljcm9jb2RlX29wcyA9PSBO
VUxMICkKPiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAgCj4gLSAgICBpbmZvID0geG1hbGxv
Y19ieXRlcyhzaXplb2YoKmluZm8pICsgbGVuKTsKPiAtICAgIGlmICggaW5mbyA9PSBOVUxMICkK
PiArICAgIGJ1ZmZlciA9IHhtYWxsb2NfYnl0ZXMobGVuKTsKPiArICAgIGlmICggIWJ1ZmZlciAp
Cj4gICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gIAo+IC0gICAgcmV0ID0gY29weV9mcm9tX2d1
ZXN0KGluZm8tPmJ1ZmZlciwgYnVmLCBsZW4pOwo+IC0gICAgaWYgKCByZXQgIT0gMCApCj4gKyAg
ICBpZiAoIGNvcHlfZnJvbV9ndWVzdChidWZmZXIsIGJ1ZiwgbGVuKSApCj4gICAgICB7Cj4gLSAg
ICAgICAgeGZyZWUoaW5mbyk7Cj4gLSAgICAgICAgcmV0dXJuIHJldDsKPiArICAgICAgICByZXQg
PSAtRUZBVUxUOwo+ICsgICAgICAgIGdvdG8gZnJlZTsKPiAgICAgIH0KPiAgCj4gLSAgICBpbmZv
LT5idWZmZXJfc2l6ZSA9IGxlbjsKPiAtICAgIGluZm8tPmVycm9yID0gMDsKPiAtICAgIGluZm8t
PmNwdSA9IGNwdW1hc2tfZmlyc3QoJmNwdV9vbmxpbmVfbWFwKTsKPiAtCj4gICAgICBpZiAoIG1p
Y3JvY29kZV9vcHMtPnN0YXJ0X3VwZGF0ZSApCj4gICAgICB7Cj4gICAgICAgICAgcmV0ID0gbWlj
cm9jb2RlX29wcy0+c3RhcnRfdXBkYXRlKCk7Cj4gICAgICAgICAgaWYgKCByZXQgIT0gMCApCj4g
LSAgICAgICAgewo+IC0gICAgICAgICAgICB4ZnJlZShpbmZvKTsKPiAtICAgICAgICAgICAgcmV0
dXJuIHJldDsKPiAtICAgICAgICB9Cj4gKyAgICAgICAgICAgIGdvdG8gZnJlZTsKPiAgICAgIH0K
PiAgCj4gLSAgICByZXR1cm4gY29udGludWVfaHlwZXJjYWxsX29uX2NwdShpbmZvLT5jcHUsIGRv
X21pY3JvY29kZV91cGRhdGUsIGluZm8pOwo+ICsgICAgcGF0Y2ggPSBwYXJzZV9ibG9iKGJ1ZmZl
ciwgbGVuKTsKPiArICAgIGlmICggSVNfRVJSKHBhdGNoKSApCj4gKyAgICB7Cj4gKyAgICAgICAg
cmV0ID0gUFRSX0VSUihwYXRjaCk7Cj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJQYXJz
aW5nIG1pY3JvY29kZSBibG9iIGVycm9yICVkXG4iLCByZXQpOwoKSSB0aGluayB0aGlzIHdhbnRz
IHRvIGJlIGF0IGxlYXN0IFhFTkxPR19XQVJOSU5HLgoKPiBAQCAtMzcyLDIzICs0MDYsNDYgQEAg
aW50IF9faW5pdCBlYXJseV9taWNyb2NvZGVfdXBkYXRlX2NwdShib29sIHN0YXJ0X3VwZGF0ZSkK
PiAgCj4gICAgICBtaWNyb2NvZGVfb3BzLT5jb2xsZWN0X2NwdV9pbmZvKCZ0aGlzX2NwdShjcHVf
c2lnKSk7Cj4gIAo+IC0gICAgaWYgKCBkYXRhICkKPiArICAgIGlmICggIWRhdGEgKQo+ICsgICAg
ICAgIHJldHVybiAtRU5PTUVNOwo+ICsKPiArICAgIGlmICggc3RhcnRfdXBkYXRlICkKPiAgICAg
IHsKPiAtICAgICAgICBpZiAoIHN0YXJ0X3VwZGF0ZSAmJiBtaWNyb2NvZGVfb3BzLT5zdGFydF91
cGRhdGUgKQo+ICsgICAgICAgIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNoOwo+ICsKPiAr
ICAgICAgICBpZiAoIG1pY3JvY29kZV9vcHMtPnN0YXJ0X3VwZGF0ZSApCj4gICAgICAgICAgICAg
IHJjID0gbWljcm9jb2RlX29wcy0+c3RhcnRfdXBkYXRlKCk7Cj4gIAo+ICAgICAgICAgIGlmICgg
cmMgKQo+ICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gIAo+IC0gICAgICAgIHJjID0gbWljcm9j
b2RlX3VwZGF0ZV9jcHUoZGF0YSwgbGVuKTsKPiArICAgICAgICBwYXRjaCA9IHBhcnNlX2Jsb2Io
ZGF0YSwgbGVuKTsKPiArICAgICAgICBpZiAoIElTX0VSUihwYXRjaCkgKQo+ICsgICAgICAgIHsK
PiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJQYXJzaW5nIG1pY3JvY29kZSBibG9i
IGVycm9yICVsZFxuIiwKClNhbWUgaGVyZS4KCj4gKyAgICAgICAgICAgICAgICAgICBQVFJfRVJS
KHBhdGNoKSk7Cj4gKyAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHBhdGNoKTsKPiArICAgICAg
ICB9Cj4gKwo+ICsgICAgICAgIGlmICggIXBhdGNoICkKPiArICAgICAgICB7Cj4gKyAgICAgICAg
ICAgIHByaW50ayhYRU5MT0dfSU5GTyAiTm8gdWNvZGUgZm91bmQuIFVwZGF0ZSBhYm9ydGVkIVxu
Iik7CgpIZXJlIEknbSBub3Qgc3VyZSB0aGUgbWVzc2FnZSBpcyB3b3J0aHdoaWxlIHRvIGhhdmUu
Cgo+IEBAIC00MSw4ICs0Miw2IEBAIHN0cnVjdCBjcHVfc2lnbmF0dXJlIHsKPiAgREVDTEFSRV9Q
RVJfQ1BVKHN0cnVjdCBjcHVfc2lnbmF0dXJlLCBjcHVfc2lnKTsKPiAgZXh0ZXJuIGNvbnN0IHN0
cnVjdCBtaWNyb2NvZGVfb3BzICptaWNyb2NvZGVfb3BzOwo+ICAKPiAtY29uc3Qgc3RydWN0IG1p
Y3JvY29kZV9wYXRjaCAqbWljcm9jb2RlX2dldF9jYWNoZSh2b2lkKTsKPiAtYm9vbCBtaWNyb2Nv
ZGVfdXBkYXRlX2NhY2hlKHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNoKTsKCklmIHlvdSBy
ZW1vdmUgdGhlIGRlY2xhcmF0aW9uIGJ1dCBub3QgdGhlIGRlZmluaXRpb24sIHRoZW4gdGhlCmxh
dHRlciBzaG91bGQgYmVjb21lIHN0YXRpYy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
