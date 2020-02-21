Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C94167FA9
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:08:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j58x2-00067j-PB; Fri, 21 Feb 2020 14:06:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j58x1-00067T-D2
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:06:43 +0000
X-Inumbo-ID: 62e36420-54b3-11ea-8679-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62e36420-54b3-11ea-8679-12813bfff9fa;
 Fri, 21 Feb 2020 14:06:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0635CAAF1;
 Fri, 21 Feb 2020 14:06:42 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <240c6e13-0b10-214f-cf8d-d1ab64eb441f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a4390e12-a258-ceb7-0dac-97f9a0d84405@suse.com>
Date: Fri, 21 Feb 2020 15:06:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <240c6e13-0b10-214f-cf8d-d1ab64eb441f@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAyMCAxNDo0NiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyMS4wMi4yMCAx
NDozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIxLjAyLjIwMjAgMTA6MTAsIFJvZ2VyIFBh
dSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBUaHUsIEZlYiAyMCwgMjAyMCBhdCAwNzoyMDowNlBNICsw
MDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gSGksCj4+Pj4KPj4+PiBPbiAyMC8wMi8yMDIw
IDE3OjMxLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+Pj4+IEFsbG93IGEgQ1BVIGFscmVhZHkg
aG9sZGluZyB0aGUgbG9jayBpbiB3cml0ZSBtb2RlIHRvIGFsc28gbG9jayBpdCBpbgo+Pj4+PiBy
ZWFkIG1vZGUuIFRoZXJlJ3Mgbm8gaGFybSBpbiBhbGxvd2luZyByZWFkIGxvY2tpbmcgYSByd2xv
Y2sgdGhhdCdzCj4+Pj4+IGFscmVhZHkgb3duZWQgYnkgdGhlIGNhbGxlciAoaWU6IENQVSkgaW4g
d3JpdGUgbW9kZS4gQWxsb3dpbmcgc3VjaAo+Pj4+PiBhY2Nlc3NlcyBpcyByZXF1aXJlZCBhdCBs
ZWFzdCBmb3IgdGhlIENQVSBtYXBzIHVzZS1jYXNlLgo+Pj4+Pgo+Pj4+PiBJbiBvcmRlciB0byBk
byB0aGlzIHJlc2VydmUgMTRiaXRzIG9mIHRoZSBsb2NrLCB0aGlzIGFsbG93cyB0byBzdXBwb3J0
Cj4+Pj4+IHVwIHRvIDE2Mzg0IENQVXMuIEFsc28gcmVkdWNlIHRoZSB3cml0ZSBsb2NrIG1hc2sg
dG8gMiBiaXRzOiBvbmUgdG8KPj4+Pj4gc2lnbmFsIHRoZXJlIGFyZSBwZW5kaW5nIHdyaXRlcnMg
d2FpdGluZyBvbiB0aGUgbG9jayBhbmQgdGhlIG90aGVyIHRvCj4+Pj4+IHNpZ25hbCB0aGUgbG9j
ayBpcyBvd25lZCBpbiB3cml0ZSBtb2RlLiBOb3RlIHRoZSB3cml0ZSByZWxhdGVkIGRhdGEKPj4+
Pj4gaXMgdXNpbmcgMTZiaXRzLCB0aGlzIGlzIGRvbmUgaW4gb3JkZXIgdG8gYmUgYWJsZSB0byBj
bGVhciBpdCAoYW5kCj4+Pj4+IHRodXMgcmVsZWFzZSB0aGUgbG9jaykgdXNpbmcgYSAxNmJpdCBh
dG9taWMgd3JpdGUuCj4+Pj4+Cj4+Pj4+IFRoaXMgcmVkdWNlcyB0aGUgbWF4aW11bSBudW1iZXIg
b2YgY29uY3VycmVudCByZWFkZXJzIGZyb20gMTY3NzcyMTYgdG8KPj4+Pj4gNjU1MzYsIEkgdGhp
bmsgdGhpcyBzaG91bGQgc3RpbGwgYmUgZW5vdWdoLCBvciBlbHNlIHRoZSBsb2NrIGZpZWxkCj4+
Pj4+IGNhbiBiZSBleHBhbmRlZCBmcm9tIDMyIHRvIDY0Yml0cyBpZiBhbGwgYXJjaGl0ZWN0dXJl
cyBzdXBwb3J0IGF0b21pYwo+Pj4+PiBvcGVyYXRpb25zIG9uIDY0Yml0IGludGVnZXJzLgo+Pj4+
Cj4+Pj4gRldJVywgYXJtMzIgaXMgYWJsZSB0byBzdXBwb3J0IGF0b21pYyBvcGVyYXRpb25zIG9u
IDY0LWJpdCBpbnRlZ2Vycy4KPj4+Pgo+Pj4+PiAgICBzdGF0aWMgaW5saW5lIHZvaWQgX3dyaXRl
X3VubG9jayhyd2xvY2tfdCAqbG9jaykKPj4+Pj4gICAgewo+Pj4+PiAtICAgIC8qCj4+Pj4+IC0g
ICAgICogSWYgdGhlIHdyaXRlciBmaWVsZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkIGRp
cmVjdGx5Lgo+Pj4+PiAtICAgICAqIE90aGVyd2lzZSwgYW4gYXRvbWljIHN1YnRyYWN0aW9uIHdp
bGwgYmUgdXNlZCB0byBjbGVhciBpdC4KPj4+Pj4gLSAgICAgKi8KPj4+Pj4gLSAgICBhdG9taWNf
c3ViKF9RV19MT0NLRUQsICZsb2NrLT5jbnRzKTsKPj4+Pj4gKyAgICAvKiBTaW5jZSB0aGUgd3Jp
dGVyIGZpZWxkIGlzIGF0b21pYywgaXQgY2FuIGJlIGNsZWFyZWQgZGlyZWN0bHkuICovCj4+Pj4+
ICsgICAgQVNTRVJUKF9pc193cml0ZV9sb2NrZWRfYnlfbWUoYXRvbWljX3JlYWQoJmxvY2stPmNu
dHMpKSk7Cj4+Pj4+ICsgICAgQlVJTERfQlVHX09OKF9RUl9TSElGVCAhPSAxNik7Cj4+Pj4+ICsg
ICAgd3JpdGVfYXRvbWljKCh1aW50MTZfdCAqKSZsb2NrLT5jbnRzLCAwKTsKPj4+Pgo+Pj4+IEkg
dGhpbmsgdGhpcyBpcyBhbiBhYnVzZSB0byBjYXN0IGFuIGF0b21pY190KCkgZGlyZWN0bHkgaW50
byBhIHVpbnQxNl90LiBZb3UKPj4+PiB3b3VsZCBhdCBsZWFzdCB3YW50IHRvIHVzZSAmbG9jay0+
Y250cy5jb3VudGVyIGhlcmUuCj4+Pgo+Pj4gU3VyZSwgSSB3YXMgd29uZGVyaW5nIGFib3V0IHRo
aXMgbXlzZWxmLgo+Pj4KPj4+IFdpbGwgd2FpdCBmb3IgbW9yZSBjb21tZW50cywgbm90IHN1cmUg
d2hldGhlciB0aGlzIGNhbiBiZSBmaXhlZCB1cG9uCj4+PiBjb21taXQgaWYgdGhlcmUgYXJlIG5v
IG90aGVyIGlzc3Vlcy4KPj4KPj4gSXQncyBtb3JlIHRoYW4ganVzdCBhZGRpbmcgYW5vdGhlciBm
aWVsZCBzcGVjaWZpZXIgaGVyZS4gQSBjYXN0IGxpa2UKPj4gdGhpcyBvbmUgaXMgZW5kaWFubmVz
cy11bnNhZmUsIGFuZCBoZW5jZSBhIHRyYXAgd2FpdGluZyBmb3IgYSBiaWcKPj4gZW5kaWFuIHBv
cnQgYXR0ZW1wdCB0byBmYWxsIGludG8uIEF0IHRoZSB2ZXJ5IGxlYXN0IHRoaXMgc2hvdWxkIGNh
dXNlCj4+IGEgYnVpbGQgZmFpbHVyZSBvbiBiaWcgZW5kaWFuIHN5c3RlbXMsIGV2ZW4gYmV0dGVy
IHdvdWxkIGJlIGlmIGl0IHdhcwo+PiBlbmRpYW5uZXNzLXNhZmUuCj4gCj4gV291bGRuJ3QgYSB1
bmlvbiBiZSB0aGUgYmV0dGVyIGNob2ljZT8KCldlbGwsIGEgdW5pb24gKHdpdGggdGhlIHNlY29u
ZCBoYWxmIGJlaW5nIGFuIGFycmF5IG9mIHVpbnQxNl90KSBjb3VsZApiZSB0aGUgbWVjaGFuaXNt
IHRvIGltcGxlbWVudCB0aGlzIGluIGFuIGVuZGlhbiBzYWZlIHdheSwgYnV0IHRoZQp1bmlvbiBh
bG9uZSB3b24ndCBoZWxwIC0geW91J2Qgc3RpbGwgaGF2ZSB0byBkZWNpZGUgd2hpY2ggb2YgdGhl
IGFycmF5CmVsZW1lbnRzIHlvdSBhY3R1YWxseSBuZWVkIHRvIHdyaXRlIHRvLiBBbmQgb2YgY291
cnNlIHlvdSdkIHRoZW4gYWxzbwptYWtlIGFzc3VtcHRpb25zIG9uIHNpemVvZihpbnQpIHdoaWNo
IGFyZSBtb3JlIHN0cmljdCB0aGFuIG91ciBjdXJyZW50Cm9uZXMgKHdoaWNoIEknZCBsaWtlIHRv
IGF2b2lkIGlmIHBvc3NpYmxlKS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
