Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4865118062
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 07:25:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieYvc-0000x9-4g; Tue, 10 Dec 2019 06:23:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VH9u=2A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieYva-0000wc-9R
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 06:23:22 +0000
X-Inumbo-ID: 8ed10308-1b15-11ea-88f2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ed10308-1b15-11ea-88f2-12813bfff9fa;
 Tue, 10 Dec 2019 06:23:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CA63AAE3D;
 Tue, 10 Dec 2019 06:23:18 +0000 (UTC)
To: SeongJae Park <sjpark@amazon.com>
References: <20191209194305.20828-1-sjpark@amazon.com>
 <20191209194305.20828-2-sjpark@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4be85067-a1cc-224e-6629-06034df2b7e6@suse.com>
Date: Tue, 10 Dec 2019 07:23:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191209194305.20828-2-sjpark@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/2] xenbus/backend: Add memory pressure
 handler callback
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

T24gMDkuMTIuMTkgMjA6NDMsIFNlb25nSmFlIFBhcmsgd3JvdGU6Cj4gRnJvbTogU2VvbmdKYWUg
UGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KPiAKPiBHcmFudGluZyBwYWdlcyBjb25zdW1lcyBiYWNr
ZW5kIHN5c3RlbSBtZW1vcnkuICBJbiBzeXN0ZW1zIGNvbmZpZ3VyZWQKPiB3aXRoIGluc3VmZmlj
aWVudCBzcGFyZSBtZW1vcnkgZm9yIHRob3NlIHBhZ2VzLCBpdCBjYW4gY2F1c2UgYSBtZW1vcnkK
PiBwcmVzc3VyZSBzaXR1YXRpb24uICBIb3dldmVyLCBmaW5kaW5nIHRoZSBvcHRpbWFsIGFtb3Vu
dCBvZiB0aGUgc3BhcmUKPiBtZW1vcnkgaXMgY2hhbGxlbmdpbmcgZm9yIGxhcmdlIHN5c3RlbXMg
aGF2aW5nIGR5bmFtaWMgcmVzb3VyY2UKPiB1dGlsaXphdGlvbiBwYXR0ZXJucy4gIEFsc28sIHN1
Y2ggYSBzdGF0aWMgY29uZmlndXJhdGlvbiBtaWdodCBsYWNrcyBhCj4gZmxleGliaWxpdHkuCj4g
Cj4gVG8gbWl0aWdhdGUgc3VjaCBwcm9ibGVtcywgdGhpcyBjb21taXQgYWRkcyBhIG1lbW9yeSBy
ZWNsYWltIGNhbGxiYWNrIHRvCj4gJ3hlbmJ1c19kcml2ZXInLiAgVXNpbmcgdGhpcyBmYWNpbGl0
eSwgJ3hlbmJ1cycgd291bGQgYmUgYWJsZSB0byBtb25pdG9yCj4gYSBtZW1vcnkgcHJlc3N1cmUg
YW5kIHJlcXVlc3Qgc3BlY2lmaWMgZG9tYWlucyBvZiBzcGVjaWZpYyBiYWNrZW5kCj4gZHJpdmVy
cyB3aGljaCBjYXVzaW5nIHRoZSBnaXZlbiBwcmVzc3VyZSB0byB2b2x1bnRhcmlseSByZWxlYXNl
IGl0cwo+IG1lbW9yeS4KPiAKPiBUaGF0IHNhaWQsIHRoaXMgY29tbWl0IHNpbXBseSByZXF1ZXN0
cyBldmVyeSBjYWxsYmFjayByZWdpc3RlcmVkIGRyaXZlcgo+IHRvIHJlbGVhc2UgaXRzIG1lbW9y
eSBmb3IgZXZlcnkgZG9tYWluLCByYXRoZXIgdGhhbiBpc3N1ZWluZyB0aGUKPiByZXF1ZXN0cyB0
byB0aGUgZHJpdmVycyBhbmQgZG9tYWluIGluIGNoYXJnZS4gIFN1Y2ggdGhpbmdzIHdvdWxkIGJl
IGEKPiBmdXR1cmUgd29yay4gIEFsc28sIHRoaXMgY29tbWl0IGZvY3VzZXMgb24gbWVtb3J5IG9u
bHkuICBIb3dldmVyLCBpdAo+IHdvdWxkIGJlIGFibHQgdG8gYmUgZXh0ZW5kZWQgZm9yIGdlbmVy
YWwgcmVzb3VyY2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNlb25nSmFlIFBhcmsgPHNqcGFya0Bh
bWF6b24uZGU+Cj4gLS0tCj4gICBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tl
bmQuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrCj4gICBpbmNsdWRlL3hlbi94ZW5idXMu
aCAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMzIgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3By
b2JlX2JhY2tlbmQuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2VuZC5j
Cj4gaW5kZXggYjBiZWQ0ZmFmNDRjLi5jZDVmZDFjZDhkZTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMKPiArKysgYi9kcml2ZXJzL3hlbi94
ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYwo+IEBAIC0yNDgsNiArMjQ4LDM0IEBAIHN0YXRp
YyBpbnQgYmFja2VuZF9wcm9iZV9hbmRfd2F0Y2goc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpub3Rp
ZmllciwKPiAgIAlyZXR1cm4gTk9USUZZX0RPTkU7Cj4gICB9Cj4gICAKPiArc3RhdGljIGludCB4
ZW5idXNfYmFja2VuZF9yZWNsYWltKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSkKPiAr
ewo+ICsJc3RydWN0IHhlbmJ1c19kcml2ZXIgKmRydjsKPiArCWlmICghZGV2LT5kcml2ZXIpCj4g
KwkJcmV0dXJuIC1FTk9FTlQ7Cj4gKwlkcnYgPSB0b194ZW5idXNfZHJpdmVyKGRldi0+ZHJpdmVy
KTsKPiArCWlmIChkcnYgJiYgZHJ2LT5yZWNsYWltKQo+ICsJCWRydi0+cmVjbGFpbSh0b194ZW5i
dXNfZGV2aWNlKGRldiksIERPTUlEX0lOVkFMSUQpOwoKT2gsIHNvcnJ5IGZvciBmaXJzdCByZXF1
ZXN0aW5nIHlvdSB0byBhZGQgdGhlIGRvbWlkIGFzIGEgcGFyYW1ldGVyLApidXQgbm93IEkgcmVh
bGl6ZSB0aGlzIGNvdWxkIGJlIGhhbmRsZWQgaW4gdGhlIHhlbmJ1cyBkcml2ZXIsIGFzCnN0cnVj
dCB4ZW5idXNfZGV2aWNlIGFscmVhZHkgY29udGFpbnMgdGhlIG90aGVyZW5kX2lkLgoKV291bGQg
eW91IG1pbmQgZHJvcHBpbmcgdGhlIHBhcmFtZXRlciBhZ2FpbiwgcGxlYXNlPwoKCkp1ZXJnZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
