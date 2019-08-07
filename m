Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6CF848B1
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 11:37:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvIKN-00088w-9k; Wed, 07 Aug 2019 09:33:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTKn=WD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvIKM-00088r-DL
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 09:33:50 +0000
X-Inumbo-ID: 74b352fe-b8f6-11e9-b219-5f6b9cc9ec58
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74b352fe-b8f6-11e9-b219-5f6b9cc9ec58;
 Wed, 07 Aug 2019 09:33:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A63E8B0B6;
 Wed,  7 Aug 2019 09:33:46 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190807073216.3239-1-jgross@suse.com>
 <e856a5a3-4363-0540-8b17-8089180da339@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <a9f9a38d-e4e7-4e33-e66b-8b67471613c6@suse.com>
Date: Wed, 7 Aug 2019 11:33:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e856a5a3-4363-0540-8b17-8089180da339@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/x86: lock cacheline for add_sized()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMTkgMTE6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA3LjA4LjIwMTkgMDk6
MzIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IGFkZF9zaXplZCgpIHNob3VsZCB1c2UgYW4gYXRv
bWljIHVwZGF0ZSBvZiB0aGUgbWVtb3J5IHdvcmQsIGFzIGl0IGlzCj4+IHVzZWQgYnkgc3Bpbl91
bmxvY2soKS4KPj4KPj4gVGlja2V0IGxvY2tzIGFyZSB1c2luZyBhIHJlYWQtbW9kaWZ5LXdyaXRl
IG9wZXJhdGlvbiBvbiBwYXJ0cyBvZiB0aGUKPj4gbG9ja3dvcmQgZm9yIHVubG9ja2luZywgd2hp
bGUgdHJ5aW5nIHRvIGxvY2sgaXMgZG9uZSBieSBhbiBhdG9taWMKPj4gdXBkYXRlIG9mIHRoZSBj
b21wbGV0ZSBsb2Nrd29yZC4gVGhpcyByZXF1aXJlcyB0aGUgdW5sb2NrIG9wZXJhdGlvbiB0bwo+
PiBiZSBhdG9taWMsIHRvbywgYXMgb3RoZXJ3aXNlIHRoZSB1bmxvY2sgbWlnaHQgbm90IHdyaXRl
IGJhY2sgdGhlCj4+IGNvcnJlY3QgZGF0YS4KPiAKPiBJIGhhdmUgdG8gdGFrZSBiYWNrIG15IHJl
cGx5IHRvIHYxLCBhbmQgaGVuY2UgSSdtIGFmcmFpZCB0aGF0Cj4gaWYgdGhlIGNoYW5nZSBpcyBy
ZWFsbHkgbmVlZGVkIHRoZSBkZXNjcmlwdGlvbiBpcyBzdGlsbAo+IGluc3VmZmljaWVudC4gTGV0
J3MgbG9vayBhdCBib3RoIHNpZGVzOiBBY3F1aXJlIGlzIGEgTE9DS2VkCj4gcmVhZC1tb2RpZnkt
d3JpdGUgb2YgdGhlIGZ1bGwgd29yZCwgd2l0aCB0aGUgYWRkaXRpb25hbAo+IHByb3BlcnR5IHRo
YXQgdGhlIHZhbHVlIHdyaXR0ZW4gYmFjayB0byB0aGUgbG93IGhhbGYgaXMKPiB1bmNoYW5nZWQg
ZnJvbSB0aGUgdmFsdWUgcmVhZC4gUmVsZWFzZSBpcwo+IAo+ICDCoMKgwqDCoHJlYWQgbG93IGhh
bGYKPiAgwqDCoMKgwqBpbmNyZW1lbnQgbG93IGhhbGYKPiAgwqDCoMKgwqB3cml0ZSBsb3cgaGFs
Zgo+IAo+IFNpbmNlIHRoZSBsb3cgaGFsZiBkb2Vzbid0IGNoYW5nZSBkdXJpbmcgYW55IGFjcXVp
cmUgKGluY2x1ZGluZwo+IGF0dGVtcHRzLCBpLmUuIHRyeS1sb2NrKSwgaXQgZG9lc24ndCBtYXR0
ZXIgaWYgaXQgcmFjZXMgd2l0aAo+IHRoZSBhYm92ZSBzZXF1ZW5jZS4gSXQgY2FuIGZyZWVseSBo
YXBwZW4gYmV0d2VlbiBhbnkgdHdvIG9mIHRoZQo+IHRocmVlIHN0ZXBzLgoKSG1tLCBzb3VuZHMg
c2Vuc2libGUuCgo+IFRoZXJlZm9yZSB3aGF0IEknbSByZWFsbHkgYWZ0ZXIgaXMgKGEpIGNsYXJp
ZmljYXRpb24gd2hldGhlcgo+IHRoZSBpc3N1ZSB5b3UgbWVhbiB0byBmaXggd2FzIG9ic2VydmVk
IGluIHByYWN0aWNlIGFuZCAoYikgYQo+IGNvbmNyZXRlIHNjZW5hcmlvIHdoZXJlIHRoaW5ncyB3
b3VsZCBnbyB3cm9uZy4KCkkgaGF2ZSBzZWVuIGEgY3Jhc2ggZHVlIHRvIG5taSB3YXRjaGRvZyB3
aXRoIG15IGNvcmUgc2NoZWR1bGluZyBzZXJpZXMuCkl0IHJlYWxseSBsb29rZWQgbGlrZSBubyBv
bmUgd2FzIGhvbGRpbmcgdGhlIGxvY2ssIGJ1dCB0d28gY3B1cyB3ZXJlCndhaXRpbmcgZm9yIGl0
LiBJIGNvdWxkbid0IGZpbmQgYW5vdGhlciBleHBsYW5hdGlvbiBmb3IgdGhhdCBiZWhhdmlvciwK
YnV0IHRoZXJlIG1pZ2h0IGJlIGFub3RoZXIgcmVhc29uIGZvciBpdC4KClRoZSBwcm9ibGVtIG9j
Y3VycmVkIGEgc2hvcnQgdGltZSBhZnRlciBvbmxpbmluZyBhIGNwdSB3aGVuIGFsbCBjcHVzCnRy
aWVkIHRvIGdhdGhlciBmb3IgdGltZSBjYWxpYnJhdGlvbiBhbmQgdHdvIG9mIHRoZSBjcHVzIHdl
cmUgbm90CmpvaW5pbmcsIGFzIHRoZXkgd2VyZSB3YWl0aW5nIGZvciB0aGUgbG9jayB3aXRoIElS
UXMgZGlzYWJsZWQuCgpJIGhhdmUgc2VlbiB0aGlzIHNjZW5hcmlvIG9ubHkgb25jZSwgYnV0IHRo
ZXJlIGFyZSBvdGhlciBzdHJhbmdlIGhhbmdzCmluIHRoZSBzYW1lIHNpdHVhdGlvbiwgc28gaXQg
bWlnaHQgYmUgdGhhdCB0aGUgYnVnIEknbSBzdGlsbCBsb29raW5nIGZvcgppcyB0aGUgcmVhc29u
IGZvciB0aGUgcHJvYmxlbSBJJ20gdHJ5aW5nIHRvIHNvbHZlIHdpdGggdGhpcyBwYXRjaC4KCgpK
dWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
