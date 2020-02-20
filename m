Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B12CF166177
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 16:54:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4o7c-0004A1-II; Thu, 20 Feb 2020 15:52:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4o7b-00049u-44
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 15:52:15 +0000
X-Inumbo-ID: f64bb1c4-53f8-11ea-855e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f64bb1c4-53f8-11ea-855e-12813bfff9fa;
 Thu, 20 Feb 2020 15:52:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 52E64AFA9;
 Thu, 20 Feb 2020 15:52:13 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200220120231.86907-1-roger.pau@citrix.com>
 <ecf1c47c-4cbb-c7c4-7ccf-d3620a1992b3@suse.com>
 <20200220141117.GK4679@Air-de-Roger>
 <ac515c56-e391-3636-244d-4b660c615dee@suse.com>
 <20200220143841.GL4679@Air-de-Roger>
 <a2111136-e91c-4077-5bea-ea310a43979e@suse.com>
 <20200220152004.GN4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6d52992a-e4d5-a86e-51ff-5d1204dd8107@suse.com>
Date: Thu, 20 Feb 2020 16:52:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200220152004.GN4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] rwlock: allow recursive read locking when
 already locked in write mode
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDIuMjAyMCAxNjoyMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIEZl
YiAyMCwgMjAyMCBhdCAwNDoxMTowOFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjAuMDIuMjAyMCAxNTozOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFRodSwgRmVi
IDIwLCAyMDIwIGF0IDAzOjIzOjM4UE0gKzAxMDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+Pj4g
T24gMjAuMDIuMjAgMTU6MTEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+IE9uIFRodSwg
RmViIDIwLCAyMDIwIGF0IDAxOjQ4OjU0UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
Pj4gT24gMjAuMDIuMjAyMCAxMzowMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4+Pj4+IEBA
IC0xNjYsNyArMTgwLDggQEAgc3RhdGljIGlubGluZSB2b2lkIF93cml0ZV91bmxvY2socndsb2Nr
X3QgKmxvY2spCj4+Pj4+Pj4gICAgICAgICogSWYgdGhlIHdyaXRlciBmaWVsZCBpcyBhdG9taWMs
IGl0IGNhbiBiZSBjbGVhcmVkIGRpcmVjdGx5Lgo+Pj4+Pj4+ICAgICAgICAqIE90aGVyd2lzZSwg
YW4gYXRvbWljIHN1YnRyYWN0aW9uIHdpbGwgYmUgdXNlZCB0byBjbGVhciBpdC4KPj4+Pj4+PiAg
ICAgICAgKi8KPj4+Pj4+PiAtICAgIGF0b21pY19zdWIoX1FXX0xPQ0tFRCwgJmxvY2stPmNudHMp
Owo+Pj4+Pj4+ICsgICAgQVNTRVJUKF9pc193cml0ZV9sb2NrZWRfYnlfbWUoYXRvbWljX3JlYWQo
JmxvY2stPmNudHMpKSk7Cj4+Pj4+Pj4gKyAgICBhdG9taWNfc3ViKF93cml0ZV9sb2NrX3ZhbCgp
LCAmbG9jay0+Y250cyk7Cj4+Pj4+Pgo+Pj4+Pj4gSSB0aGluayB0aGlzIHdvdWxkIGJlIG1vcmUg
ZWZmaWNpZW50IHdpdGggYXRvbWljX2FuZCgpLCBub3QKPj4+Pj4+IHRoZSBsZWFzdCBiZWNhdXNl
IG9mIHRoZSB0aGVuIGF2b2lkZWQgc21wX3Byb2Nlc3Nvcl9pZCgpLgo+Pj4+Pj4gV2hldGhlciB0
byBtYXNrIG9mZiBqdXN0IF9RV19XTUFTSyBvciBhbHNvIHRoZSBDUFUgbnVtYmVyIG9mCj4+Pj4+
PiB0aGUgbGFzdCB3cml0ZSBvd25lciB3b3VsZCBuZWVkIHRvIGJlIGRldGVybWluZWQuIEJ1dCB3
aXRoCj4+Pj4+PiB1c2luZyBzdWJ0cmFjdGlvbiwgaW4gY2FzZSBvZiBwcm9ibGVtcyBpdCdsbCBs
aWtlbHkgYmUKPj4+Pj4+IGhhcmRlciB0byB1bmRlcnN0YW5kIHdoYXQgYWN0dWFsbHkgd2VudCBv
biwgZnJvbSBsb29raW5nIGF0Cj4+Pj4+PiB0aGUgcmVzdWx0aW5nIHN0YXRlIG9mIHRoZSBsb2Nr
ICh0aGlzIGlzIGluIHBhcnQgYSBwcmUtCj4+Pj4+PiBleGlzdGluZyBwcm9ibGVtLCBidXQgZ2V0
cyB3b3JzZSB3aXRoIHN1YnRyYWN0aW9uIG9mIENQVQo+Pj4+Pj4gbnVtYmVycykuCj4+Pj4+Cj4+
Pj4+IFJpZ2h0LCBhIG1hc2sgd291bGQgYmUgYmV0dGVyLiBSaWdodCBub3cgYm90aCBuZWVkIHRv
IGJlIGNsZWFyZWQgKHRoZQo+Pj4+PiBMT0NLRUQgYW5kIHRoZSBDUFUgZmllbGRzKSBhcyB0aGVy
ZSdzIGNvZGUgdGhhdCByZWxpZXMgb24gIWxvY2stPmNudHMKPj4+Pj4gYXMgYSB3YXkgdG8gZGV0
ZXJtaW5lIHRoYXQgdGhlIGxvY2sgaXMgbm90IHJlYWQgb3Igd3JpdGUgbG9ja2VkLiBJZiB3ZQo+
Pj4+PiBsZWZ0IHRoZSBDUFUgbHlpbmcgYXJvdW5kIHRob3NlIGNoZWNrcyB3b3VsZCBuZWVkIHRv
IGJlIGFkanVzdGVkLgo+Pj4+Cj4+Pj4gSW4gY2FzZSB5b3UgbWFrZSBfUVJfU0hJRlQgMTYgaXQg
aXMgcG9zc2libGUgdG8ganVzdCB3cml0ZSBhIDItYnl0ZSB6ZXJvCj4+Pj4gdmFsdWUgZm9yIHdy
aXRlX3VubG9jaygpIChsaWtlIGl0cyBwb3NzaWJsZSB0byBkbyBzbyB0b2RheSB1c2luZyBhCj4+
Pj4gc2luZ2xlIGJ5dGUgd3JpdGUpLgo+Pj4KPj4+IFRoYXQgd291bGQgbGltaXQgdGhlIHJlYWRl
cnMgY291bnQgdG8gNjU1MzYsIHdoYXQgZG8geW91IHRoaW5rIEphbj8KPj4KPj4gSWYgdGhlIHJl
Y3Vyc2VfY3B1IGFwcHJvYWNoIGlzIGNvbnNpZGVyZWQgYmFkLCBJIHRoaW5rIHRoaXMgd291bGQK
Pj4gYmUgYWNjZXB0YWJsZS4gQnV0IG9mIGNvdXJzZSB5b3UnbGwgbmVlZCB0byBjb25zdWx0IHdp
dGggdGhlIEFybQo+PiBndXlzIHJlZ2FyZGluZyB0aGUgY29ycmVjdG5lc3Mgb2Ygc3VjaCBhICJo
YWxmIiBzdG9yZSBpbiB0aGVpcgo+PiBtZW1vcnkgbW9kZWw7IEkgd291bGQgaG9wZSB0aGlzIHRv
IGJlIHVuaXZlcnNhbGx5IG9rYXksIGJ1dCBJJ20KPj4gbm90IGVudGlyZWx5IGNlcnRhaW4uCj4g
Cj4gSSB3b3VsZCBsaWtlIHRvIGdldCBjb25maXJtYXRpb24gZnJvbSB0aGUgQXJtIGZvbGtzLCBi
dXQgSSBzZWUgQXJtIGhhcwo+IHdyaXRlX2F0b21pYyBhbmQgc3VwcG9ydHMgc3VjaCBvcGVyYXRp
b24gYWdhaW5zdCBhIHVpbnQxNl90LCBzbyBJCj4gZG9uJ3Qgc2VlIHdoeSBpdCB3b3VsZG4ndCB3
b3JrLgoKVGhlIG9wZXJhdGlvbnMgaW5kaXZpZHVhbGx5IGJlaW5nIGF2YWlsYWJsZSBkb2Vzbid0
IG1lYW4gdGhhdAphIGNvbWJpbmF0aW9uIG9mIDMyLWJpdCBsb2NrZWQgYWNjZXNzZXMgYW5kIGEg
MTYtYml0IHBsYWluCnN0b3JlIGFyZSBnb2luZyB0byBwcm9kdWNlIGEgY29uc2lzdGVudCByZXN1
bHQuIFBlcmhhcHMgSSdtCm92ZXItY2F1dGlvdXMgaGVyZSwgYnV0IEkndmUgYmVlbiBiaXR0ZW4g
YnkgYSB2YWd1ZWx5IHNpbWlsYXIKaXNzdWUgb24geDg2IGJhY2sgaW4gdGhlIHRpY2tldCBsb2Nr
IChpbiBMaW51eCkgZGF5cy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
