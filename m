Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE12D123341
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 18:14:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihGMl-0005r8-Eq; Tue, 17 Dec 2019 17:10:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q1hL=2H=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ihGMk-0005r3-24
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 17:10:34 +0000
X-Inumbo-ID: 1d187fe4-20f0-11ea-a914-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d187fe4-20f0-11ea-a914-bc764e2007e4;
 Tue, 17 Dec 2019 17:10:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B13D5AC23;
 Tue, 17 Dec 2019 17:10:22 +0000 (UTC)
To: SeongJae Park <sjpark@amazon.com>
References: <20191217162406.4711-1-sjpark@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f9a601af-4413-ed1d-f7f4-89343118a2f1@suse.com>
Date: Tue, 17 Dec 2019 18:10:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191217162406.4711-1-sjpark@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v11 2/6] xenbus/backend: Protect xenbus
 callback with lock
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
Cc: axboe@kernel.dk, sj38.park@gmail.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMTIuMTkgMTc6MjQsIFNlb25nSmFlIFBhcmsgd3JvdGU6Cj4gT24gVHVlLCAxNyBEZWMg
MjAxOSAxNzoxMzo0MiArMDEwMCAiSsO8cmdlbiBHcm/DnyIgPGpncm9zc0BzdXNlLmNvbT4gd3Jv
dGU6Cj4gCj4+IE9uIDE3LjEyLjE5IDE3OjA3LCBTZW9uZ0phZSBQYXJrIHdyb3RlOgo+Pj4gRnJv
bTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KPj4+Cj4+PiAncmVjbGFpbV9tZW1v
cnknIGNhbGxiYWNrIGNhbiByYWNlIHdpdGggYSBkcml2ZXIgY29kZSBhcyB0aGlzIGNhbGxiYWNr
Cj4+PiB3aWxsIGJlIGNhbGxlZCBmcm9tIGFueSBtZW1vcnkgcHJlc3N1cmUgZGV0ZWN0ZWQgY29u
dGV4dC4gIFRvIGRlYWwgd2l0aAo+Pj4gdGhlIGNhc2UsIHRoaXMgY29tbWl0IGFkZHMgYSBzcGlu
bG9jayBpbiB0aGUgJ3hlbmJ1c19kZXZpY2UnLiAgV2hlbmV2ZXIKPj4+ICdyZWNsYWltX21lbW9y
eScgY2FsbGJhY2sgaXMgY2FsbGVkLCB0aGUgbG9jayBvZiB0aGUgZGV2aWNlIHdoaWNoIHBhc3Nl
ZAo+Pj4gdG8gdGhlIGNhbGxiYWNrIGFzIGl0cyBhcmd1bWVudCBpcyBsb2NrZWQuICBUaHVzLCBk
cml2ZXJzIHJlZ2lzdGVyaW5nCj4+PiB0aGVpciAncmVjbGFpbV9tZW1vcnknIGNhbGxiYWNrIHNo
b3VsZCBwcm90ZWN0IHRoZSBkYXRhIHRoYXQgbWlnaHQgcmFjZQo+Pj4gd2l0aCB0aGUgY2FsbGJh
Y2sgd2l0aCB0aGUgbG9jayBieSB0aGVtc2VsdmVzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFNl
b25nSmFlIFBhcmsgPHNqcGFya0BhbWF6b24uZGU+Cj4+PiAtLS0KPj4+ICAgIGRyaXZlcnMveGVu
L3hlbmJ1cy94ZW5idXNfcHJvYmUuYyAgICAgICAgIHwgIDEgKwo+Pj4gICAgZHJpdmVycy94ZW4v
eGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMgfCAxMCArKysrKysrKy0tCj4+PiAgICBpbmNs
dWRlL3hlbi94ZW5idXMuaCAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrCj4+PiAgICAzIGZp
bGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYyBiL2RyaXZlcnMveGVu
L3hlbmJ1cy94ZW5idXNfcHJvYmUuYwo+Pj4gaW5kZXggNWI0NzE4ODlkNzIzLi5iODYzOTNmMTcy
ZTYgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMKPj4+
ICsrKyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYwo+Pj4gQEAgLTQ3Miw2ICs0
NzIsNyBAQCBpbnQgeGVuYnVzX3Byb2JlX25vZGUoc3RydWN0IHhlbl9idXNfdHlwZSAqYnVzLAo+
Pj4gICAgCQlnb3RvIGZhaWw7Cj4+PiAgICAKPj4+ICAgIAlkZXZfc2V0X25hbWUoJnhlbmRldi0+
ZGV2LCAiJXMiLCBkZXZuYW1lKTsKPj4+ICsJc3Bpbl9sb2NrX2luaXQoJnhlbmRldi0+cmVjbGFp
bV9sb2NrKTsKPj4+ICAgIAo+Pj4gICAgCS8qIFJlZ2lzdGVyIHdpdGggZ2VuZXJpYyBkZXZpY2Ug
ZnJhbWV3b3JrLiAqLwo+Pj4gICAgCWVyciA9IGRldmljZV9yZWdpc3RlcigmeGVuZGV2LT5kZXYp
Owo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2Vu
ZC5jIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMKPj4+IGluZGV4
IDdlNzhlYmVmN2M1NC4uNTE2YWE2NGI5OTY3IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy94ZW4v
eGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMKPj4+ICsrKyBiL2RyaXZlcnMveGVuL3hlbmJ1
cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jCj4+PiBAQCAtMjUxLDEyICsyNTEsMTggQEAgc3RhdGlj
IGludCBiYWNrZW5kX3Byb2JlX2FuZF93YXRjaChzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5vdGlm
aWVyLAo+Pj4gICAgc3RhdGljIGludCBiYWNrZW5kX3JlY2xhaW1fbWVtb3J5KHN0cnVjdCBkZXZp
Y2UgKmRldiwgdm9pZCAqZGF0YSkKPj4+ICAgIHsKPj4+ICAgIAljb25zdCBzdHJ1Y3QgeGVuYnVz
X2RyaXZlciAqZHJ2Owo+Pj4gKwlzdHJ1Y3QgeGVuYnVzX2RldmljZSAqeGRldjsKPj4+ICsJdW5z
aWduZWQgbG9uZyBmbGFnczsKPj4+ICAgIAo+Pj4gICAgCWlmICghZGV2LT5kcml2ZXIpCj4+PiAg
ICAJCXJldHVybiAwOwo+Pj4gICAgCWRydiA9IHRvX3hlbmJ1c19kcml2ZXIoZGV2LT5kcml2ZXIp
Owo+Pj4gLQlpZiAoZHJ2ICYmIGRydi0+cmVjbGFpbV9tZW1vcnkpCj4+PiAtCQlkcnYtPnJlY2xh
aW1fbWVtb3J5KHRvX3hlbmJ1c19kZXZpY2UoZGV2KSk7Cj4+PiArCWlmIChkcnYgJiYgZHJ2LT5y
ZWNsYWltX21lbW9yeSkgewo+Pj4gKwkJeGRldiA9IHRvX3hlbmJ1c19kZXZpY2UoZGV2KTsKPj4+
ICsJCXNwaW5fdHJ5bG9ja19pcnFzYXZlKCZ4ZGV2LT5yZWNsYWltX2xvY2ssIGZsYWdzKTsKPj4K
Pj4gWW91IG5lZWQgc3Bpbl9sb2NrX2lycXNhdmUoKSBoZXJlLiBPciBtYXliZSBzcGluX2xvY2so
KSB3b3VsZCBiZSBmaW5lLAo+PiB0b28/IEkgY2FuJ3Qgc2VlIGEgcmVhc29uIHdoeSB5b3UnZCB3
YW50IHRvIGRpc2FibGUgaXJxcyBoZXJlLgo+IAo+IEkgbmVlZGVkIHRvIGRpYWJsZSBpcnEgaGVy
ZSBhcyB0aGlzIGlzIGNhbGxlZCBmcm9tIHRoZSBtZW1vcnkgc2hyaW5rZXIgY29udGV4dC4KCk9r
YXkuCgo+IAo+IEFsc28sIHVzZWQgJ3RyeWxvY2snIGJlY2F1c2UgdGhlICdwcm9iZSgpJyBhbmQg
J3JlbW92ZSgpJyBjb2RlIG9mIHRoZSBkcml2ZXIKPiBtaWdodCBpbmNsdWRlIG1lbW9yeSBhbGxv
Y2F0aW9uLiAgQW5kIHRoZSB4ZW4tYmxrYmFjayBhY3R1YWxseSBkb2VzLiAgSWYgdGhlCj4gYWxs
b2NhdGlvbiBzaG93cyBhIG1lbW9yeSBwcmVzc3VyZSBkdXJpbmcgdGhlIGFsbG9jYXRpb24sIGl0
IHdpbGwgdHJpZ2dlciB0aGlzCj4gc2hyaW5rZXIgY2FsbGJhY2sgYWdhaW4gYW5kIHRoZW4gZGVh
ZGxvY2suCgpJbiB0aGF0IGNhc2UgeW91IG5lZWQgdG8gZWl0aGVyIHJldHVybiB3aGVuIHlvdSBk
aWRuJ3QgZ2V0IHRoZSBsb2NrIG9yCgotIHdoZW4gb2J0YWluaW5nIHRoZSBsb2NrIGR1cmluZyBw
cm9iZSgpIGFuZCByZW1vdmUoKSBzZXQgYSB2YXJpYWJsZQogICBjb250YWluaW5nIHRoZSBjdXJy
ZW50IGNwdSBudW1iZXIKLSBhbmQgcmVzZXQgdGhhdCB0byBlLmcgTlJfQ1BVUyBiZWZvcmUgcmVs
ZWFzaW5nIHRoZSBsb2NrIGFnYWluCi0gaW4gdGhlIHNocmlua2VyIGNhbGxiYWNrIGRvIHRyeWxv
Y2ssIGFuZCBpZiB5b3UgZGlkbid0IGdldCB0aGUgbG9jawogICB0ZXN0IHdoZXRoZXIgdGhlIGNw
dS12YXJpYWJsZSBhYm92ZSBpcyBzZXQgdG8geW91ciBjdXJyZW50IGNwdSBhbmQKICAgY29udGlu
dWUgb25seSBpZiB5ZXM7IGlmIG5vdCwgcmVkbyB0aGUgdGhlIHRyeWxvY2sKCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
