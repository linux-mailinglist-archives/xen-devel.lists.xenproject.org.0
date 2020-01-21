Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDB8143B5B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 11:47:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itr0t-0007hI-1x; Tue, 21 Jan 2020 10:44:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PT5E=3K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itr0r-0007hD-Dk
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 10:44:01 +0000
X-Inumbo-ID: ea2a5c04-3c3a-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea2a5c04-3c3a-11ea-b833-bc764e2007e4;
 Tue, 21 Jan 2020 10:43:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AEC0FACEF;
 Tue, 21 Jan 2020 10:43:51 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200117110811.43321-1-roger.pau@citrix.com>
 <538864f7-f537-be0d-e37b-8f29baf82ee0@suse.com>
 <20200120171840.GF11756@Air-de-Roger>
 <96edb88c-5ae3-22a1-913d-83f76c925270@suse.com>
 <20200121102941.GH11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <624c69b6-9a9d-7719-fdec-1c6e939a9f65@suse.com>
Date: Tue, 21 Jan 2020 11:43:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200121102941.GH11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/hvmloader: round up memory BAR size
 to 4K
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
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAyMCAxMToyOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBTbyBJJ20gbm90
IHN1cmUgaG93IHRvIHByb2dyZXNzIHdpdGggdGhpcyBwYXRjaCwgYXJlIHdlIGZpbmUgd2l0aAo+
IHRob3NlIGxpbWl0YXRpb25zPwoKSSdtIGFmcmFpZCB0aGlzIGRlcGVuZHMgb24gLi4uCgo+IEFz
IEkgc2FpZCwgWGVuIGhhc24ndCBnb3QgZW5vdWdoIGtub3dsZWRnZSB0byBjb3JyZWN0bHkgaXNv
bGF0ZSB0aGUKPiBCQVJzLCBhbmQgaGVuY2Ugd2UgaGF2ZSB0byByZWx5IG9uIGRvbTAgRFRSVC4g
V2UgY291bGQgYWRkIGNoZWNrcyBpbgo+IFhlbiB0byBtYWtlIHN1cmUgbm8gQkFScyBzaGFyZSBh
IHBhZ2UsIGJ1dCBpdCdzIGEgbm9uLXRyaXZpYWwgYW1vdW50Cj4gb2Ygc2Nhbm5pbmcgYW5kIHNp
emluZyBlYWNoIHBvc3NpYmxlIEJBUiBvbiB0aGUgc3lzdGVtLgoKLi4uIHdoZXRoZXIgRG9tMCBh
Y3R1YWxseSAiRFRSVCIsIHdoaWNoIGluIHR1cm4gaXMgY29tcGxpY2F0ZWQgYnkgdGhlcmUKbm90
IGJlaW5nIGEgc3BlY2lmaWMgRG9tMCBrZXJuZWwgaW5jYXJuYXRpb24gdG8gY2hlY2sgYWdhaW5z
dC4gUGVyaGFwcwpyYXRoZXIgdGhhbiBoYXZpbmcgWGVuIGNoZWNrIF9hbGxfIEJBUnMsIFhlbiBv
ciB0aGUgdG9vbCBzdGFjayBjb3VsZApjaGVjayBCQVJzIG9mIGRldmljZXMgYWJvdXQgdG8gYmUg
aGFuZGVkIHRvIGEgZ3Vlc3Q/IFBlcmhhcHMgd2UgbmVlZCB0bwpwYXNzIGF1eGlsaWFyeSBpbmZv
cm1hdGlvbiB0byBodm1sb2FkZXIgdG8gYmUgYWJsZSB0byBqdWRnZSB3aGV0aGVyIGEKQkFSIHNo
YXJlcyBhIHBhZ2Ugd2l0aCBhbm90aGVyIG9uZT8gUGVyaGFwcyB0aGVyZSBhbHNvIG5lZWRzIHRv
IGJlIGEKd2F5IGZvciBodm1sb2FkZXIgdG8ga25vdyB3aGF0IG9mZnNldCBpbnRvIGEgcGFnZSBo
YXMgdG8gYmUgbWFpbnRhaW5lZApmb3IgYW55IHBhcnRpY3VsYXIgQkFSLCBhcyBmb2xsb3dzIGZy
b20gSmFzb24ncyByZWNlbnQgcmVwbHk/Cgo+IElNTyB0aGlzIHBhdGNoIGlzIGFuIGltcHJvdmVt
ZW50IG92ZXIgdGhlIGN1cnJlbnQgc3RhdGUsIGFuZCB3ZSBjYW4KPiBhbHdheXMgZG8gZnVydGhl
ciBpbXByb3ZlbWVudHMgYWZ0ZXJ3YXJkcy4KCkFzIHNhaWQsIHRvIG1lIGl0IGxvb2tzIGFzIGlm
IGl0IHdhcyBicmVha2luZyBvbmUgY2FzZSBpbiBvcmRlciB0byBmaXgKYW5vdGhlci4gSWYgSSdt
IG5vdCB3cm9uZyB3aXRoIHRoaXMsIEkgZG9uJ3Qgc2VlIGhvdyB0aGUgcGF0Y2ggaXMgYW4KaW1w
cm92ZW1lbnQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
