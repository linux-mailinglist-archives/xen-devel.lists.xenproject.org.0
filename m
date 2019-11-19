Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465401022D5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 12:18:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX1SM-0007in-HW; Tue, 19 Nov 2019 11:14:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=56Vh=ZL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iX1SL-0007ih-7q
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 11:14:01 +0000
X-Inumbo-ID: ae636926-0abd-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae636926-0abd-11ea-b678-bc764e2007e4;
 Tue, 19 Nov 2019 11:13:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 39FABB2D6;
 Tue, 19 Nov 2019 11:13:57 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191118181509.10981-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7a24ae9e-ec83-b3f4-7b28-5de90782f7f9@suse.com>
Date: Tue, 19 Nov 2019 12:13:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191118181509.10981-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/nested-hap: Fix handling of L0_ERROR
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTEuMjAxOSAxOToxNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBXaGVuIG5lc3RlZGh2
bV9oYXBfbmVzdGVkX3BhZ2VfZmF1bHQoKSByZXR1cm5zIEwwX0VSUk9SLAo+IGh2bV9oYXBfbmVz
dGVkX3BhZ2VfZmF1bHQoKSBvcGVyYXRlcyBvbiB0aGUgYWRqdXN0ZWQgZ3BhLiAgSG93ZXZlciwg
aXQKPiBvcGVyYXRlcyB3aXRoIHRoZSBvcmlnaW5hbCBucGZlYywgd2hpY2ggaXMgbm8gbG9uZ2Vy
IGJlIGNvcnJlY3QuCgpOaXQ6IFBlcmhhcHMgIm1heSIgaW5zdGVhZCBvZiAiaXMiPwoKPiBJbiBw
YXJ0aWN1bGFyLCBpdCBpcyBwb3NzaWJsZSB0byBnZXQgYSBuZXN0ZWQgZmF1bHQgd2hlcmUgdGhl
IHRyYW5zbGF0aW9uIGlzCj4gbm90IHByZXNlbnQgaW4gTDEyIChhbmQgdGhlcmVmb3JlIEwwMiks
IHdoaWxlIGl0IGlzIHByZXNlbnQgaW4gTDAxLgoKSSdtIGFmcmFpZCBJIGRvbid0IHNlZSB0aGUg
Y29ubmVjdGlvbiB0byB0aGUgaXNzdWUgYXQgaGFuZCwgd2hlcmUKd2UgaGF2ZSBhIHBhZ2UgcHJl
c2VudCBpbiBib3RoIEwwMSBhbmQgTDEyLCBqdXN0IG5vdCBpbiBMMDIuIEFuZAp0aGVyZSdzIGFs
c28gbm8gTDBfRVJST1IgaGVyZSAtIGJvdGggdGhlIGluaXRpYWwgKHByb3BhZ2F0aW9uKSBhbmQK
dGhlIHN1YnNlcXVlbnQgKGxpdmUtbG9ja2luZykgZXhpdHMgcmVwb3J0IERPTkUgYWNjb3JkaW5n
IHRvIHdoYXQKSSB0aG91Z2h0IHdhcyB0aGUgb3V0Y29tZSBvZiB5ZXN0ZXJkYXkncyBkaXNjdXNz
aW9uIG9uIGlyYy4KCkkgdGFrZSBpdCB5b3UgaW1wbHkgdGhhdCBMMF9FUlJPUiB3b3VsZCBuZWVk
IHJhaXNpbmcgKGFzIHBlciB0aGUKYXV4aWxpYXJ5IGNvZGUgZnJhZ21lbnQgYWRkaW5nIHRoZSAi
KGFjY2Vzc194ICYmICpwYWdlX29yZGVyKSIKY2hlY2spLCBidXQgSSB3b25kZXIgd2hldGhlciB0
aGF0IHdvdWxkIHJlYWxseSBiZSBjb3JyZWN0LiBUaGlzCmRlcGVuZHMgb24gd2hhdCBMMF9FUlJP
UiByZWFsbHkgaXMgc3VwcG9zZWQgdG8gbWVhbjogQW4gZXJyb3IKYmVjYXVzZSBvZiBhY3R1YWwg
TDAgc2V0dGluZ3MgKHg9MCBpbiBvdXIgY2FzZSksIG9yIGFuIGVycm9yCmJlY2F1c2Ugb2YgaW50
ZW5kZWQgTDAgc2V0dGluZ3MgKHg9MSBpbiBvdXIgY2FzZSkuIEFmdGVyIGFsbCBhCnZpb2xhdGlv
biBvZiBqdXN0IHRoZSBwMm1fYWNjZXNzICh3aGljaCBhbHNvIGFmZmVjdHMgci93L3gpCmRvZXNu
J3QgZ2V0IHJlcG9ydGVkIGJ5IG5lc3RlZGhhcF93YWxrX0wwX3AybSgpIGFzIEwwX0VSUk9SCmVp
dGhlciAoYW5kIGhlbmNlIHdvdWxkLCBhcyBpdCBzZWVtcyB0byBtZSwgbGVhZCB0byBhIHNpbWls
YXIKbGl2ZSBsb2NrKS4KClRoZXJlZm9yZSBJIHdvbmRlciB3aGV0aGVyIHlvdXIgaW5pdGlhbCBp
ZGVhIG9mIGRvaW5nIHRoZQpzaGF0dGVyaW5nIHJpZ2h0IGhlcmUgd291bGRuJ3QgYmUgdGhlIGJl
dHRlciBjb3Vyc2Ugb2YgYWN0aW9uLgpuZXN0ZWRoYXBfZml4X3AybSgpIGNvdWxkIGVpdGhlciBp
bnN0YWxsIHRoZSBsYXJnZSBwYWdlIGFuZCB0aGVuCnNoYXR0ZXIgaXQgcmlnaHQgYXdheSwgb3Ig
aXQgY291bGQgaW5zdGFsbCBqdXN0IHRoZSBpbmRpdmlkdWFsCnNtYWxsIHBhZ2UuIFRvZ2V0aGVy
IHdpdGggdGhlIGRpZmZlcmVudCBucGZlYyBhZGp1c3RtZW50IG1vZGVsCnN1Z2dlc3RlZCBiZWxv
dyAobGVhZGluZyB0byBucGZlYy5wcmVzZW50IHRvIGFsc28gZ2V0IHVwZGF0ZWQgaW4KdGhlIERP
TkUgY2FzZSkgYSBzaW1pbGFyICJpbnNuLWZldGNoICYmIHByZXNlbnQiIGNvbmRpdGlvbmFsICh0
bwp0aGF0IGludHJvZHVjZWQgZm9yIFhTQS0zMDQpIGNvdWxkIHRoZW4gYmUgdXNlZCB0aGVyZS4K
CkV2ZW4gYmV0dGVyIC0gYnkgbWFraW5nIHRoZSB2aW9sYXRpb24gY2hlY2tpbmcgYXJvdW5kIHRo
ZQpvcmlnaW5hbCBYU0EtMzA0IGFkZGl0aW9uIGEgZnVuY3Rpb24gKHRvZ2V0aGVyIHdpdGggdGhl
IDMwNAphZGRpdGlvbiksIHN1Y2ggYSBmdW5jdGlvbiBtaWdodCB0aGVuIGJlIHJldXNhYmxlIGhl
cmUuIFRoaXMKbWlnaHQgdGhlbiBhZGRyZXNzIHRoZSBwMm1fYWNjZXNzIHJlbGF0ZWQgbGl2ZSBs
b2NrIGFzIHdlbGwuCgo+IFdoZW4gaGFuZGxpbmcgYW4gTDBfRVJST1IsIGFkanVzdCBucGZlYyBh
cyB3ZWxsIGFzIGdwYS4KClRoZSBncGEgYWRqdXN0bWVudCByZWZlcnJlZCB0byBoZXJlIGlzIG5v
dCBpbiBuZXN0ZWRoYXBfd2Fsa19MMF9wMm0oKQpidXQgaW4gbmVzdGVkaHZtX2hhcF9uZXN0ZWRf
cGFnZV9mYXVsdCgpLCBpZiBJJ20gbm90IG1pc3Rha2VuPwoKPiBAQCAtMTgxLDYgKzE4MCwxOCBA
QCBuZXN0ZWRoYXBfd2Fsa19MMF9wMm0oc3RydWN0IHAybV9kb21haW4gKnAybSwgcGFkZHJfdCBM
MV9ncGEsIHBhZGRyX3QgKkwwX2dwYSwKPiAgICAgICpMMF9ncGEgPSAobWZuX3gobWZuKSA8PCBQ
QUdFX1NISUZUKSArIChMMV9ncGEgJiB+UEFHRV9NQVNLKTsKPiAgb3V0Ogo+ICAgICAgX19wdXRf
Z2ZuKHAybSwgTDFfZ3BhID4+IFBBR0VfU0hJRlQpOwo+ICsKPiArICAgIC8qCj4gKyAgICAgKiBX
aGVuIHJlcG9ydGluZyBMMF9FUlJPUiwgcmV3cml0ZSBuZnBlYyB0byBtYXRjaCB3aGF0IHdvdWxk
IGhhdmUgb2NjdXJlZAo+ICsgICAgICogaWYgaGFyZHdhcmUgaGFkIHdhbGtlZCB0aGUgTDAsIHJh
dGhlciB0aGFuIHRoZSBjb21iaW5lZCBMMDIuCj4gKyAgICAgKi8KPiArICAgIGlmICggcmMgPT0g
TkVTVEVESFZNX1BBR0VGQVVMVF9MMF9FUlJPUiApCj4gKyAgICB7Cj4gKyAgICAgICAgbnBmZWMt
PnByZXNlbnQgPSAhbWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4pOwoKVG8gYmUgaW4gbGluZSB3aXRo
IHRoZSBjb25kaXRpb25hbCBhIGZldyBsaW5lcyB1cCBmcm9tIGhlcmUsCndvdWxkbid0IHRoaXMg
YmV0dGVyIGJlICFtZm5fdmFsaWQobWZuKT8KClNob3VsZCB0aGVyZSBldmVyIGJlIGEgY2FzZSB0
byBjbGVhciB0aGUgZmxhZyB3aGVuIGl0IHdhcyBzZXQ/IElmCmEgbWFwcGluZyBoYXMgZ29uZSBh
d2F5IGJldHdlZW4gdGhlIHRpbWUgdGhlIGV4aXQgY29uZGl0aW9uIHdhcwpkZXRlY3RlZCBhbmQg
dGhlIHRpbWUgd2UgcmUtZXZhbHVhdGUgdGhpbmdzIGhlcmUsIEkgdGhpbmsgaXQKc2hvdWxkIHN0
aWxsIHJlcG9ydCAicHJlc2VudCIgYmFjayB0byB0aGUgY2FsbGVyLiBUYWtpbmcgYm90aApyZW1h
cmtzIHRvZ2V0aGVyIEknbSB0aGlua2luZyBvZgoKICAgICAgICBpZiAoIG1mbl92YWxpZChtZm4p
ICkKICAgICAgICAgICAgbnBmZWMtPnByZXNlbnQgPSAxOwoKPiArICAgICAgICBucGZlYy0+Z2xh
X3ZhbGlkID0gMDsKCkZvciB0aGlzLCBvbmUgdGhlIHF1ZXN0aW9uIGlzIHdob3NlIGxpbmVhciBh
ZGRyZXNzIGlzIG1lYW50IGhlcmUuCklmIGl0J3MgTDIncywgdGhlbiBpdCBzaG91bGRuJ3QgYmUg
Y2xlYXJlZC4gSWYgaXQncyBMMSdzLCB0aGVuCml0IHdvdWxkIHNlZW0gdG8gbWUgdGhhdCBpdCBz
aG91bGQgaGF2ZSBiZWVuIGF2b2lkZWQgdG8gc2V0IHRoZQpmaWVsZCwgb3IgYXQgbGVhc3QgaXQg
c2hvdWxkIGhhdmUgYmVlbiBjbGVhcmVkIHRoZSBtb21lbnQgd2UncmUKcGFzdCBMMTIgaGFuZGxp
bmcuCgpBbmQgdGhlbiB0aGVyZSBpcyB0aGUgcXVlc3Rpb24gb2Ygb3ZlcmFsbCBmbG93IGhlcmUu
IE9uIHRoZSBiYXNpcwpvZiBucGZlYyBub3QgYmVpbmcgb2YgYW55IGludGVyZXN0IGFueW1vcmUg
dG8gdGhlIGNhbGxlcidzIGNhbGxlcgppZiByZXBvcnRpbmcgYmFjayBET05FIChidXQgYXMgcGVy
IGZhciBhYm92ZSBpdCBtaWdodCBoZWxwIG91cgppbW1lZGlhdGUgY2FsbGVyKSBJIHdvbmRlciB3
aGV0aGVyCgpzdGF0aWMgaW50Cm5lc3RlZGhhcF93YWxrX0wwX3AybShzdHJ1Y3QgcDJtX2RvbWFp
biAqcDJtLCBwYWRkcl90IEwxX2dwYSwgcGFkZHJfdCAqTDBfZ3BhLAogICAgICAgICAgICAgICAg
ICAgICAgcDJtX3R5cGVfdCAqcDJtdCwgcDJtX2FjY2Vzc190ICpwMm1hLAogICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgaW50ICpwYWdlX29yZGVyLCBzdHJ1Y3QgbnBmZWMgKm5wZmVjKQp7
CiAgICBtZm5fdCBtZm47CiAgICBpbnQgcmM7CgogICAgLyogd2FsayBMMCBQMk0gdGFibGUgKi8K
ICAgIG1mbiA9IGdldF9nZm5fdHlwZV9hY2Nlc3MocDJtLCBMMV9ncGEgPj4gUEFHRV9TSElGVCwg
cDJtdCwgcDJtYSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMCwgcGFnZV9vcmRlcik7
CgogICAgcmMgPSBORVNURURIVk1fUEFHRUZBVUxUX0RJUkVDVF9NTUlPOwogICAgaWYgKCAqcDJt
dCA9PSBwMm1fbW1pb19kaXJlY3QgKQogICAgICAgIGdvdG8gZGlyZWN0X21taW9fb3V0OwogICAg
cmMgPSBORVNURURIVk1fUEFHRUZBVUxUX01NSU87CiAgICBpZiAoICpwMm10ID09IHAybV9tbWlv
X2RtICkKICAgICAgICBnb3RvIG91dDsKCiAgICByYyA9IE5FU1RFREhWTV9QQUdFRkFVTFRfTDBf
RVJST1I7CiAgICAvKgogICAgICogV2hlbiByZXBvcnRpbmcgTDBfRVJST1IsIHJld3JpdGUgbmZw
ZWMgdG8gbWF0Y2ggd2hhdCB3b3VsZCBoYXZlIG9jY3VycmVkCiAgICAgKiBpZiBoYXJkd2FyZSBo
YWQgd2Fsa2VkIHRoZSBMMCwgcmF0aGVyIHRoYW4gdGhlIGNvbWJpbmVkIEwwMi4KICAgICAqLwog
ICAgbnBmZWMtPmdsYV92YWxpZCA9IDA7CiAgICBucGZlYy0+a2luZCA9IG5wZmVjX2tpbmRfdW5r
bm93bjsKCiAgICBpZiAoICFtZm5fdmFsaWQobWZuKSApCiAgICAgICAgZ290byBvdXQ7CgogICAg
bnBmZWMtPnByZXNlbnQgPSAxOwoKICAgIGlmICggbnBmZWMtPndyaXRlX2FjY2VzcyAmJiBwMm1f
aXNfcmVhZG9ubHkoKnAybXQpICkKICAgICAgICBnb3RvIG91dDsKCiAgICBpZiAoIHAybV9pc19w
YWdpbmcoKnAybXQpIHx8IHAybV9pc19zaGFyZWQoKnAybXQpIHx8ICFwMm1faXNfcmFtKCpwMm10
KSApCiAgICAgICAgZ290byBvdXQ7CgogICAgcmMgPSBORVNURURIVk1fUEFHRUZBVUxUX0RPTkU7
CiBkaXJlY3RfbW1pb19vdXQ6CiAgICAqTDBfZ3BhID0gKG1mbl94KG1mbikgPDwgUEFHRV9TSElG
VCkgKyAoTDFfZ3BhICYgflBBR0VfTUFTSyk7CiBvdXQ6CiAgICBfX3B1dF9nZm4ocDJtLCBMMV9n
cGEgPj4gUEFHRV9TSElGVCk7CiAgICByZXR1cm4gcmM7Cn0KCndvdWxkbid0IGJlIHByZWZlcmFi
bGUuCgpQbHVzIEkgbm90aWNlIHRoYXQgbmVpdGhlciB5b3VyIG5vciBteSB2YXJpYW50IHRha2Ug
Y2FyZSBvZiB0aGUKTkVTVEVESFZNX1BBR0VGQVVMVF9ESVJFQ1RfTU1JTyBjYXNlICh3aGVyZSAi
cHJlc2VudCIgd291bGQgYWxzbwp3YW50IHRvIGJlY29tZSBzZXQgYWZhaWN0LCBhbmQgSSBndWVz
cyB0aGUgb3RoZXIgdHdvIG5wZmVjCmFkanVzdG1lbnRzIHdvdWxkIGFsc28gYmUgYXBwbGljYWJs
ZSkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
