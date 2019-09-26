Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3385EBF3F1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:19:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDTe1-0005uR-Jt; Thu, 26 Sep 2019 13:17:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=breC=XV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDTe0-0005uJ-Vv
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 13:17:17 +0000
X-Inumbo-ID: f56458c2-e05f-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id f56458c2-e05f-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 13:17:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 08D8AAB98;
 Thu, 26 Sep 2019 13:17:15 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-7-roger.pau@citrix.com>
 <d82bc404-c417-591d-d436-461b8100c44d@suse.com>
 <20190926111404.co5krpzvbf5k5oq3@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c261f5e-735a-cf05-5d1a-9f3b0b2c83ed@suse.com>
Date: Thu, 26 Sep 2019 15:17:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190926111404.co5krpzvbf5k5oq3@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 06/11] ioreq: allow dispatching ioreqs to
 internal servers
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMjAxOSAxMzoxNCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gRnJpLCBT
ZXAgMjAsIDIwMTkgYXQgMDE6MzU6MTNQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEhh
dmluZyBzYWlkIHRoaXMsIGFzIGEgcmVzdWx0IG9mIGhhdmluZyBsb29rZWQgYXQgc29tZSBvZiB0
aGUKPj4gaW52b2x2ZWQgY29kZSwgYW5kIHdpdGggdGhlIGNvdmVyIGxldHRlciBub3QgY2xhcmlm
eWluZyB0aGlzLAo+PiB3aGF0J3MgdGhlIHJlYXNvbiBmb3IgZ29pbmcgdGhpcyBzZWVtaW5nbHkg
bW9yZSBjb21wbGljYXRlZAo+PiByb3V0ZSwgcmF0aGVyIHRoYW4gcHV0dGluZyB2UENJIGJlaGlu
ZCB0aGUgaHZtX2lvX2ludGVyY2VwdCgpCj4+IG1hY2hpbmVyeSwganVzdCBsaWtlIGlzIHRoZSBj
YXNlIGZvciBvdGhlciBpbnRlcm5hbCBoYW5kbGluZz8KPiAKPiBJZiB2UENJIGlzIGhhbmRsZWQg
YXQgdGhlIGh2bV9pb19pbnRlcmNlcHQgbGV2ZWwgKGxpa2UgaXRzIGRvbmUgQVRNKQo+IHRoZW4g
aXQncyBub3QgcG9zc2libGUgdG8gaGF2ZSBib3RoIChleHRlcm5hbCkgaW9yZXEgc2VydmVycyBh
bmQgdlBDSQo+IGhhbmRsaW5nIGFjY2Vzc2VzIHRvIGRpZmZlcmVudCBkZXZpY2VzIGluIHRoZSBQ
Q0kgY29uZmlnIHNwYWNlLCBzaW5jZQo+IHZQQ0kgd291bGQgdHJhcCBhbGwgYWNjZXNzZXMgdG8g
dGhlIFBDSSBJTyBwb3J0cyBhbmQgdGhlIE1DRkcgcmVnaW9ucwo+IGFuZCB0aG9zZSB3b3VsZCBu
ZXZlciByZWFjaCB0aGUgaW9yZXEgcHJvY2Vzc2luZy4KCldoeSB3b3VsZCB2UENJICh3YW50IHRv
KSBkbyB0aGF0PyBUaGUgYWNjZXB0KCkgaGFuZGxlciBzaG91bGQKc3ViLWNsYXNzIHRoZSBDRjgt
Q0ZGIHBvcnQgcmFuZ2U7IHRoZXJlIHdvdWxkIGxpa2VseSB3YW50IHRvCmJlIGFub3RoZXIgc3Ry
dWN0IGh2bV9pb19vcHMgaW5zdGFuY2UgZGVhbGluZyB3aXRoIGNvbmZpZwpzcGFjZSBhY2Nlc3Nl
cyAoYW5kIHBlcmhhcHMgd2l0aCBvbmVzIHRocm91Z2ggcG9ydCBJL08gYW5kCnRocm91Z2ggTUNG
RyBhdCB0aGUgc2FtZSB0aW1lKS4gSW4gdGhlIGVuZCB0aGlzIHdvdWxkIGxpa2VseQptb3JlIHNp
bWlsYXIgdG8gaG93IGNoaXBzZXRzIGhhbmRsZSB0aGlzIG9uIHJlYWwgaGFyZHdhcmUKdGhhbiB5
b3VyICJpbnRlcm5hbCBzZXJ2ZXIiIHNvbHV0aW9uIChhbGJlaXQgSSBhZ3JlZSB0byBhCmRlZ3Jl
ZSBpdCdzIGluIGltcGxlbWVudGF0aW9uIGRldGFpbCBhbnl3YXkpLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
