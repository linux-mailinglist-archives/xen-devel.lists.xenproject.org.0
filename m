Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1024E15C3E5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 16:47:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2Gem-0005JQ-SZ; Thu, 13 Feb 2020 15:44:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j2Gem-0005JL-0s
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 15:44:00 +0000
X-Inumbo-ID: a6491fee-4e77-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6491fee-4e77-11ea-bc8e-bc764e2007e4;
 Thu, 13 Feb 2020 15:43:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 182B3AF77;
 Thu, 13 Feb 2020 15:43:58 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200212164949.56434-1-roger.pau@citrix.com>
 <20200212164949.56434-4-roger.pau@citrix.com>
 <9fc88888-a670-a68e-f1b6-c0d258ab7b6e@suse.com>
 <20200213151530.GZ4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6dea5029-5fb8-54e0-1544-ed5ccba2469a@suse.com>
Date: Thu, 13 Feb 2020 16:43:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200213151530.GZ4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] x86: add accessors for scratch cpu mask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDIuMjAyMCAxNjoxNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIEZl
YiAxMywgMjAyMCBhdCAxMToxMjoxMkFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTIuMDIuMjAyMCAxNzo0OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2Fy
Y2gveDg2L3NtcGJvb3QuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+Pj4gQEAg
LTU3LDYgKzU3LDMwIEBAIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKGNwdW1hc2tfdmFyX3Qs
IGNwdV9jb3JlX21hc2spOwo+Pj4gIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKGNwdW1hc2tf
dmFyX3QsIHNjcmF0Y2hfY3B1bWFzayk7Cj4+PiAgc3RhdGljIGNwdW1hc2tfdCBzY3JhdGNoX2Nw
dTBtYXNrOwo+Pj4gIAo+Pj4gKyNpZm5kZWYgTkRFQlVHCj4+PiArY3B1bWFza190ICpzY3JhdGNo
X2NwdW1hc2soY29uc3QgY2hhciAqZm4pCj4+Cj4+IFBsZWFzZSBkb24ndCBwYXNzIGFuIGFyZ3Vt
ZW50IHRoYXQgeW91IGNhbiBkZWR1Y2UsIGFuZCB0aGVuCj4+IHByb3ZpZGUgZXZlbiBtb3JlIG1l
YW5pbmdmdWwgZGF0YToKPj4KPj4+ICt7Cj4+PiArICAgIHN0YXRpYyBERUZJTkVfUEVSX0NQVShj
b25zdCBjaGFyICosIHNjcmF0Y2hfY3B1bWFza191c2UpOwo+Pj4gKwo+Pj4gKyAgICAvKgo+Pj4g
KyAgICAgKiBTY3JhdGNoIGNwdW1hc2sgY2Fubm90IGJlIHVzZWQgaW4gSVJRIGNvbnRleHQsIG9y
IGVsc2Ugd2Ugd291bGQgaGF2ZSB0bwo+Pj4gKyAgICAgKiBtYWtlIHN1cmUgYWxsIHVzZXJzIGhh
dmUgaW50ZXJydXB0cyBkaXNhYmxlZCB3aGlsZSB1c2luZyB0aGUgc2NyYXRjaAo+Pj4gKyAgICAg
KiBtYXNrLgo+Pj4gKyAgICAgKi8KPj4+ICsgICAgQlVHX09OKGluX2lycSgpKTsKPj4+ICsKPj4+
ICsgICAgaWYgKCBmbiAmJiB1bmxpa2VseSh0aGlzX2NwdShzY3JhdGNoX2NwdW1hc2tfdXNlKSkg
KQo+Pj4gKyAgICB7Cj4+PiArICAgICAgICBwcmludGsoIiVzOiBzY3JhdGNoIENQVSBtYXNrIGFs
cmVhZHkgaW4gdXNlIGJ5ICVzXG4iLAo+Pj4gKyAgICAgICAgICAgICAgZm4sIHRoaXNfY3B1KHNj
cmF0Y2hfY3B1bWFza191c2UpKTsKPj4KPj4gVXNlIF9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcygw
KSBoZXJlLCB3aGljaCB3aWxsIGFsbG93Cj4+IGlkZW50aWZ5aW5nIHdoaWNoIG9mIHBlcmhhcHMg
bXVsdGlwbGUgdXNlcyBpbiBhIGZ1bmN0aW9uIGlzCj4+IHRoZSBvZmZlbmRpbmcgb25lLgo+IAo+
IFdpbGwgY2hhbmdlLgo+IAo+Pgo+PiBBbHNvLCB3aHkgaW4gc21wYm9vdC5jIGluc3RlYWQgb2Yg
aW4gc21wLmM/IFRoaXMgaXNuJ3QgYQo+PiBib290IG9yIENQVS1ob3Qtb25saW5lIHJlbGF0ZWQg
ZnVuY3Rpb24gYWZhaWN0Lgo+IAo+IEkndmUgYWRkZWQgaXQgdG8gc21wYm9vdC5jIGJlY2F1c2Ug
dGhhdCdzIHdoZXJlIHNjcmF0Y2hfY3B1bWFzayBpcwo+IGRlZmluZWQuIEkgY291bGQgbW92ZSBp
dCB0byBzbXAuYywgYnV0IEkgd291bGQgcHJlZmVyIHRvIGtlZXAgdGhlCj4gYWNjZXNzb3IgYXMg
Y2xvc2UgYXMgcG9zc2libGUgdG8gdGhlIGRlY2xhcmF0aW9uLgoKTWF5IEkgc3VnZ2VzdCB0aGVu
IHRvIG1vdmUgdGhlIGRlZmluaXRpb24gb2YgdGhlIHN5bWJvbD8KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
