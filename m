Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD98B116AC0
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 11:18:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieG4e-0007NQ-JP; Mon, 09 Dec 2019 10:15:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HzjL=Z7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieG4d-0007NL-6N
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 10:15:27 +0000
X-Inumbo-ID: d1273dca-1a6c-11ea-87b9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1273dca-1a6c-11ea-87b9-12813bfff9fa;
 Mon, 09 Dec 2019 10:15:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 67BABB3E2;
 Mon,  9 Dec 2019 10:15:24 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>, "Park, Seongjae"
 <sjpark@amazon.com>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
References: <20191209085839.21215-1-sjpark@amazon.com>
 <954f7beb-9d40-253e-260b-4750809bf808@suse.com>
 <026ba79524da43648371e5bca437a5e4@EX13D32EUC003.ant.amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e913c44e-c898-9504-1e2a-927563563208@suse.com>
Date: Mon, 9 Dec 2019 11:15:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <026ba79524da43648371e5bca437a5e4@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 0/1] xen/blkback: Squeeze page pools if a
 memory pressure
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
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "sj38.park@gmail.com" <sj38.park@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMTkgMTA6NDYsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4+IEZyb206IErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNlLmNvbT4KPj4g
U2VudDogMDkgRGVjZW1iZXIgMjAxOSAwOTozOQo+PiBUbzogUGFyaywgU2VvbmdqYWUgPHNqcGFy
a0BhbWF6b24uY29tPjsgYXhib2VAa2VybmVsLmRrOwo+PiBrb25yYWQud2lsa0BvcmFjbGUuY29t
OyByb2dlci5wYXVAY2l0cml4LmNvbQo+PiBDYzogbGludXgtYmxvY2tAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBEdXJyYW50LAo+PiBQYXVsIDxwZHVycmFu
dEBhbWF6b24uY29tPjsgc2ozOC5wYXJrQGdtYWlsLmNvbTsgeGVuLQo+PiBkZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDAvMV0geGVuL2Jsa2JhY2s6
IFNxdWVlemUgcGFnZSBwb29scyBpZiBhIG1lbW9yeQo+PiBwcmVzc3VyZQo+Pgo+PiBPbiAwOS4x
Mi4xOSAwOTo1OCwgU2VvbmdKYWUgUGFyayB3cm90ZToKPj4+IEVhY2ggYGJsa2lmYCBoYXMgYSBm
cmVlIHBhZ2VzIHBvb2wgZm9yIHRoZSBncmFudCBtYXBwaW5nLiAgVGhlIHNpemUgb2YKPj4+IHRo
ZSBwb29sIHN0YXJ0cyBmcm9tIHplcm8gYW5kIGJlIGluY3JlYXNlZCBvbiBkZW1hbmQgd2hpbGUg
cHJvY2Vzc2luZwo+Pj4gdGhlIEkvTyByZXF1ZXN0cy4gIElmIGN1cnJlbnQgSS9PIHJlcXVlc3Rz
IGhhbmRsaW5nIGlzIGZpbmlzaGVkIG9yIDEwMAo+Pj4gbWlsbGlzZWNvbmRzIGhhcyBwYXNzZWQg
c2luY2UgbGFzdCBJL08gcmVxdWVzdHMgaGFuZGxpbmcsIGl0IGNoZWNrcyBhbmQKPj4+IHNocmlu
a3MgdGhlIHBvb2wgdG8gbm90IGV4Y2VlZCB0aGUgc2l6ZSBsaW1pdCwgYG1heF9idWZmZXJfcGFn
ZXNgLgo+Pj4KPj4+IFRoZXJlZm9yZSwgYGJsa2Zyb250YCBydW5uaW5nIGd1ZXN0cyBjYW4gY2F1
c2UgYSBtZW1vcnkgcHJlc3N1cmUgaW4gdGhlCj4+PiBgYmxrYmFja2AgcnVubmluZyBndWVzdCBi
eSBhdHRhY2hpbmcgYSBsYXJnZSBudW1iZXIgb2YgYmxvY2sgZGV2aWNlcyBhbmQKPj4+IGluZHVj
aW5nIEkvTy4KPj4KPj4gSSdtIGhhdmluZyBwcm9ibGVtcyB0byB1bmRlcnN0YW5kIGhvdyBhIGd1
ZXN0IGNhbiBhdHRhY2ggYSBsYXJnZSBudW1iZXIKPj4gb2YgYmxvY2sgZGV2aWNlcyB3aXRob3V0
IHRob3NlIGhhdmluZyBiZWVuIGNvbmZpZ3VyZWQgYnkgdGhlIGhvc3QgYWRtaW4KPj4gYmVmb3Jl
Lgo+Pgo+PiBJZiB0aG9zZSBkZXZpY2VzIGhhdmUgYmVlbiBjb25maWd1cmVkLCBkb20wIHNob3Vs
ZCBiZSByZWFkeSBmb3IgdGhhdAo+PiBudW1iZXIgb2YgZGV2aWNlcywgZS5nLiBieSBoYXZpbmcg
ZW5vdWdoIHNwYXJlIG1lbW9yeSBhcmVhIGZvciBiYWxsb29uZWQKPj4gcGFnZXMuCj4+Cj4+IFNv
IGVpdGhlciBJJ20gbWlzc2luZyBzb21ldGhpbmcgaGVyZSBvciB5b3VyIHJlYXNvbmluZyBmb3Ig
dGhlIG5lZWQgb2YKPj4gdGhlIHBhdGNoIGlzIHdyb25nLgo+Pgo+IAo+IEkgdGhpbmsgdGhlIHVu
ZGVybHlpbmcgaXNzdWUgaXMgdGhhdCBwZXJzaXN0ZW50IGdyYW50IHN1cHBvcnQgaXMgaG9nZ2lu
ZyBtZW1vcnkgaW4gdGhlIGJhY2tlbmRzLCB0aGVyZWJ5IGNvbXByb21pc2luZyBzY2FsYWJpbGl0
eS4gSUlVQyB0aGlzIHBhdGNoIGlzIGVzc2VudGlhbGx5IGEgYmFuZC1haWQgdG8gZ2V0IGJhY2sg
dG8gdGhlIHNjYWxhYmlsaXR5IHRoYXQgd2FzIHBvc3NpYmxlIGJlZm9yZSBwZXJzaXN0ZW50IGdy
YW50IHN1cHBvcnQgd2FzIGFkZGVkLiBVbHRpbWF0ZWx5IHRoZSByaWdodCBhbnN3ZXIgc2hvdWxk
IGJlIHRvIGdldCByaWQgb2YgcGVyc2lzdGVudCBncmFudHMgc3VwcG9ydCBhbmQgdXNlIGdyYW50
IGNvcHksIGJ1dCBzdWNoIGEgY2hhbmdlIGlzIGNsZWFybHkgbW9yZSBpbnZhc2l2ZSBhbmQgd291
bGQgbmVlZCBmYXIgbW9yZSB0ZXN0aW5nLgoKUGVyc2lzdGVudCBncmFudHMgYXJlIGhvZ2dpbmcg
YmFsbG9vbmVkIHBhZ2VzLCB3aGljaCBpcyBlcXVpdmFsZW50IHRvCm1lbW9yeSBvbmx5IGluIGNh
c2Ugb2YgdGhlIGJhY2tlbmQncyBkb21haW4gbWVtb3J5IGJlaW5nIGVxdWFsIG9yCnJhdGhlciBu
ZWFyIHRvIGl0cyBtYXggbWVtb3J5IHNpemUuCgpTbyBjb25maWd1cmluZyB0aGUgYmFja2VuZCBk
b21haW4gd2l0aCBlbm91Z2ggc3BhcmUgYXJlYSBmb3IgYmFsbG9vbmVkCnBhZ2VzIHNob3VsZCBt
YWtlIHRoaXMgcHJvYmxlbSBtdWNoIGxlc3Mgc2VyaW91cy4KCkFub3RoZXIgcHJvYmxlbSBpbiB0
aGlzIGFyZWEgaXMgdGhlIGFtb3VudCBvZiBtYXB0cmFjayBmcmFtZXMgY29uZmlndXJlZApmb3Ig
YSBkcml2ZXIgZG9tYWluLCB3aGljaCB3aWxsIGxpbWl0IHRoZSBudW1iZXIgb2YgY29uY3VycmVu
dCBmb3JlaWduCm1hcHBpbmdzIG9mIHRoYXQgZG9tYWluLgoKU28gaW5zdGVhZCBvZiBoYXZpbmcg
YSBibGtiYWNrIHNwZWNpZmljIHNvbHV0aW9uIEknZCByYXRoZXIgaGF2ZSBhCmNvbW1vbiBjYWxs
YmFjayBmb3IgYmFja2VuZHMgdG8gcmVsZWFzZSBmb3JlaWduIG1hcHBpbmdzIGluIG9yZGVyIHRv
CmVuYWJsZSBhIGdsb2JhbCByZXNvdXJjZSBtYW5hZ2VtZW50LgoKCkp1ZXJnZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
