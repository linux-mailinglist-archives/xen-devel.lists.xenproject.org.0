Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2A7143967
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 10:22:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itpfx-0007tC-V9; Tue, 21 Jan 2020 09:18:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PT5E=3K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itpfw-0007t7-Sv
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 09:18:20 +0000
X-Inumbo-ID: f1bf76e0-3c2e-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1bf76e0-3c2e-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 09:18:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 678DBBB17;
 Tue, 21 Jan 2020 09:18:10 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200117110811.43321-1-roger.pau@citrix.com>
 <538864f7-f537-be0d-e37b-8f29baf82ee0@suse.com>
 <20200120171840.GF11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <96edb88c-5ae3-22a1-913d-83f76c925270@suse.com>
Date: Tue, 21 Jan 2020 10:18:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200120171840.GF11756@Air-de-Roger>
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

T24gMjAuMDEuMjAyMCAxODoxOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIEph
biAyMCwgMjAyMCBhdCAwNToxMDozM1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTcuMDEuMjAyMCAxMjowOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gV2hlbiBwbGFjaW5n
IG1lbW9yeSBCQVJzIHdpdGggc2l6ZXMgc21hbGxlciB0aGFuIDRLIG11bHRpcGxlIG1lbW9yeQo+
Pj4gQkFScyBjYW4gZW5kIHVwIG1hcHBlZCB0byB0aGUgc2FtZSBndWVzdCBwaHlzaWNhbCBhZGRy
ZXNzLCBhbmQgdGh1cwo+Pj4gd29uJ3Qgd29yayBjb3JyZWN0bHkuCj4+Cj4+IFRoaW5raW5nIGFi
b3V0IGl0IGFnYWluLCBhcmVuJ3QgeW91IGZpeGluZyBvbmUgcG9zc2libGUgY2FzZSBieQo+PiBi
cmVha2luZyB0aGUgb3Bwb3NpdGUgb25lOiBXaGF0IHlvdSBmaXggaXMgd2hlbiB0aGUgdHdvIGRp
c3RpbmN0Cj4+IEJBUnMgKG9mIHRoZSBzYW1lIG9yIGRpZmZlcmVudCBkZXZpY2VzKSBtYXAgdG8g
ZGlzdGluY3QgTUZOcwo+PiAod2hpY2ggd291bGQgaGF2ZSByZXF1aXJlZCBhIHNpbmdsZSBHRk4g
dG8gbWFwIHRvIGJvdGggb2YgdGhlc2UKPj4gTUZOcykuIEJ1dCBkb24ndCB5b3UsIGF0IHRoZSBz
YW1lIHRpbWUsIGJyZWFrIHRoZSBjYXNlIG9mIHR3bwo+PiBCQVJzIChwZXJoYXBzLCBidXQgbm90
IG5lY2Vzc2FyaWx5LCBvZiB0aGUgc2FtZSBwaHlzaWNhbCBkZXZpY2UpCj4+IG1hcHBpbmcgYm90
aCB0byB0aGUgc2FtZSBNRk4sIGkuZS4gcmVxdWlyaW5nIHRvIGhhdmUgdHdvIGRpc3RpbmN0Cj4+
IEdGTnMgbWFwIHRvIG9uZSBNRk4/IChBdCBsZWFzdCBmb3IgdGhlIG1vbWVudCBJIGNhbid0IHNl
ZSBhIHdheQo+PiBmb3IgaHZtbG9hZGVyIHRvIGRpc3Rpbmd1aXNoIHRoZSB0d28gY2FzZXMuKQo+
IAo+IElNTyB3ZSBzaG91bGQgZm9yY2UgYWxsIEJBUnMgdG8gYmUgcGFnZS1pc29sYXRlZCBieSBk
b20wIChzaW5jZSBYZW4KPiBkb2Vzbid0IGhhdmUgdGhlIGtub3dsZWRnZSBvZiBkb2luZyBzbyks
IGJ1dCBJIGRvbid0IHNlZSB0aGUgaXNzdWUKPiB3aXRoIGhhdmluZyBkaWZmZXJlbnQgZ2ZucyBw
b2ludGluZyB0byB0aGUgc2FtZSBtZm4uIElzIHRoYXQgYQo+IGxpbWl0YXRpb24gb2YgcGFnaW5n
PwoKSXQncyBhIGxpbWl0YXRpb24gb2YgdGhlIChnbG9iYWwpIE0yUCB0YWJsZS4KCj4gSSB0aGlu
ayB5b3UgY2FuIG1hcCBhIGdyYW50IG11bHRpcGxlIHRpbWVzIGludG8KPiBkaWZmZXJlbnQgZ2Zu
cywgd2hpY2ggYWNoaWV2ZXMgdGhlIHNhbWUgQUZBSUNULgoKT25lIG1pZ2h0IHRoaW5rIHRoaXMg
d291bGQgYmUgcG9zc2libGUsIGJ1dCBhZmFpY3QKZ3Vlc3RfcGh5c21hcF9hZGRfe3BhZ2UsZW50
cnl9KCkgd2lsbCBkZXN0cm95IHRoZSBwcmlvciBhc3NvY2lhdGlvbgp3aGVuL2JlZm9yZSBpbnNl
cnRpbmcgdGhlIG5ldyBvbmUuIEkuZS4gaWYgc3Vic2VxdWVudGx5IGFueSBvcGVyYXRpb24Kd2Fz
IHVzZWQgd2hpY2ggbmVlZHMgdG8gY29uc3VsdCB0aGUgTTJQLCBvbmx5IHRoZSBtb3N0IHJlY2Vu
dGx5CnJlY29yZGVkIEdGTiB3b3VsZCBiZSByZXR1cm5lZCBhbmQgaGVuY2Ugb3BlcmF0ZWQgb24u
IFdoZXRoZXIgdGhhdCdzCmEgcHJvYmxlbSBpbiBwcmFjdGljZSAoaS5lLiB3aGV0aGVyIGFueSBz
dWNoIE0yUCBsb29rdXAgbWlnaHQKc2Vuc2libHkgaGFwcGVuKSBpcyBwcmV0dHkgaGFyZCB0byB0
ZWxsIHdpdGhvdXQgZ29pbmcgdGhyb3VnaCBhIGxvdApvZiBjb2RlLCBJIGd1ZXNzLgoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
