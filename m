Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB8A82DE7
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 10:37:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huuvj-0001IJ-MH; Tue, 06 Aug 2019 08:34:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LM3v=WC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1huuvh-0001ID-Uo
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 08:34:49 +0000
X-Inumbo-ID: 0b1c28f6-b825-11e9-abf4-d7be29771088
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b1c28f6-b825-11e9-abf4-d7be29771088;
 Tue, 06 Aug 2019 08:34:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9A43BAC97;
 Tue,  6 Aug 2019 08:34:44 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190806070000.13718-1-jgross@suse.com>
 <e3ff98ba-efed-e953-8de7-4f032a73b101@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <534db70b-f920-41ed-84e2-f9aa95a759fe@suse.com>
Date: Tue, 6 Aug 2019 10:34:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e3ff98ba-efed-e953-8de7-4f032a73b101@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] xen/x86: lock cacheline for add_sized()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDguMTkgMTA6MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA2LjA4LjIwMTkgMDk6
MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IGFkZF9zaXplZCgpIHNob3VsZCB1c2UgYW4gYXRv
bWljIHVwZGF0ZSBvZiB0aGUgbWVtb3J5IHdvcmQsIGFzIGl0IGlzCj4+IHVzZWQgYnkgc3Bpbl91
bmxvY2soKS4KPj4KPj4gV2l0aCB0aWNrZXQgbG9ja3MgdW5sb2NraW5nIG5lZWRzIHRvIGJlIGF0
b21pYyBpbiBvcmRlciB0byBhdm9pZCB2ZXJ5Cj4+IHJhcmUgcmFjZXMgd2hlbiBzb21lb25lIHRy
aWVzIHRvIGdldCB0aGUgbG9jayB3aGlsZSB0aGUgbG9jayBob2xkZXIKPj4gaXMganVzdCByZWxl
YXNpbmcgaXQuCj4gCj4gQ29uc2lkZXJpbmcgdGhlIGNvbW1pdCBpbnRyb2R1Y2luZyB0aGUgZnVu
Y3Rpb24gKDNjNjk0YWVjMDgpCj4gZXhwbGljaXRseSBzYXlpbmcgIlRoZSBhZGQgaXMgL25vdC8g
YXRvbWljIiB0aGlzIG5lZWRzIG1vcmUgZGV0YWlsLgo+IFRoZSBpZGVhIGJlaGluZCBub3QgdXNp
bmcgYSBMT0NLZWQgYWNjZXNzIGhlcmUgd2FzLCBpaXJjLCB0aGF0Cj4gbm8tb25lIGVsc2UgY291
bGQgZXZlciB1cGRhdGUgdGhlIGhlYWQgcG9pbnRlcjsgc29tZW9uZSB0cnlpbmcgdG8KPiBhY3F1
aXJlIHRoZSBsb2NrIHdvdWxkIG9ubHkgd3JpdGUgdG8gdGhlIHRhaWwgcG9ydGlvbi4gQnV0IHll
cywgSQo+IHRoaW5rIEkgY2FuIHNlZSBob3cgdGhpcyB3YXMgd3Jvbmc6IFRoZSBhcmNoX2ZldGNo
X2FuZF9hZGQoKSBhY3RzCj4gb24gaGVhZF90YWlsIGFmdGVyIGFsbCwgbm90IGp1c3QgdGFpbC4K
CkknbGwgdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZS4KCj4gCj4+IC0tLSBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvYXRvbWljLmgKPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9hdG9taWMuaAo+
PiBAQCAtMjEsNyArMjEsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbmFtZSh2b2xhdGlsZSB0eXBl
ICphZGRyLCB0eXBlIHZhbCkgXAo+PiAgICAjZGVmaW5lIGJ1aWxkX2FkZF9zaXplZChuYW1lLCBz
aXplLCB0eXBlLCByZWcpIFwKPj4gICAgICAgIHN0YXRpYyBpbmxpbmUgdm9pZCBuYW1lKHZvbGF0
aWxlIHR5cGUgKmFkZHIsIHR5cGUgdmFsKSAgICAgICAgICAgICAgXAo+PiAgICAgICAgeyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4+IC0gICAgICAgIGFzbSB2b2xhdGlsZSgiYWRkIiBzaXplICIgJTEsJTAiICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICsgICAgICAgIGFzbSB2b2xhdGlsZSgibG9j
azsgYWRkIiBzaXplICIgJTEsJTAiICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gCj4gSSBy
ZWFsaXplIHByZS1leGlzdGluZyBjb2RlIGluIG91ciB0cmVlIHVzZXMgdGhpcyBub3QgZnVsbHkg
Y29ycmVjdAo+IGZvcm0gb2Ygc3BlY2lmeWluZyBwcmVmaXhlcyAodGhlcmUgc2hvdWxkbid0IHJl
YWxseSBiZSBhIGxpbmUKPiBzZXBhcmF0b3IgYmV0d2VlbiBwcmVmaXggYW5kIG1haW4gbW5lbW9u
aWMsIHVubGVzcyBnYXMgd291bGQgcmVmdXNlCj4gYXNzZW1ibGluZyB0aGUgcmVzdWx0IGJlY2F1
c2Ugb2YgaXQgd3JvbmdseSB0aGlua2luZyB0aGUgcHJlZml4IHdhcwo+IGluYXBwbGljYWJsZSB0
byB0aGUgaW5zbiwgbGlrZSBpcyBlLmcuIHRoZSBjYXNlIGhlcmUgYW5kIHRoZXJlIGZvcgo+IHRo
ZSBSRVAgcHJlZml4ZXMpLCBidXQgSSB0aGluayB3ZSBzaG91bGQgdHJ5IHRvIGF2b2lkIHdpZGVu
aW5nIHRoZQo+IGlzc3VlLiBTZWUgZS5nLiBnbnR0YWJfY2xlYXJfZmxhZ3MoKSB3aGVyZSB3ZSBh
bHJlYWR5IGhhdmUgbm8KPiBzZW1pY29sb24sIGFuZCB0aGlzIGhhcyBnb25lIGZpbmUgc2luY2Ug
YXJvdW5kIDQuMi4gSSBzZWVtIHRvIHZhZ3VlbHkKPiByZWNhbGwgdGhhdCBMaW51eCBoYXMgYmVl
biB1c2luZyB0aGlzIGNvbnN0cnVjdCB0byBhdm9pZCBidWlsZCBpc3N1ZXMKPiB3aXRoIHNvbWUg
c3BlY2lmaWMgKFN1bj8pIGFzc2VtYmxlci4KCk9rYXksIEknbGwgcmVtb3ZlIHRoZSBzZW1pY29s
b24uCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
