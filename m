Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1107910C7D7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 12:21:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaHpV-0004gY-QE; Thu, 28 Nov 2019 11:19:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaHpV-0004gT-3P
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 11:19:25 +0000
X-Inumbo-ID: ee555444-11d0-11ea-a3d1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee555444-11d0-11ea-a3d1-12813bfff9fa;
 Thu, 28 Nov 2019 11:19:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7FDD8B021;
 Thu, 28 Nov 2019 11:19:23 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>
References: <7f82e319-1891-ec36-dcf0-e94253ba04a5@suse.com>
Message-ID: <d2e63383-c0bf-073b-9935-5debb43305de@suse.com>
Date: Thu, 28 Nov 2019 12:19:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7f82e319-1891-ec36-dcf0-e94253ba04a5@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/IRQ: make internally used IRQs also
 honor the pending EOI stack
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
 Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAxMjowMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQXQgdGhlIHRpbWUgdGhl
IHBlbmRpbmcgRU9JIHN0YWNrIHdhcyBpbnRyb2R1Y2VkIHRoZXJlIHdlcmUgbm8KPiBpbnRlcm5h
bGx5IHVzZWQgSVJRcyB3aGljaCB3b3VsZCBoYXZlIHRoZSBMQVBJQyBFT0kgaXNzdWVkIGZyb20g
dGhlCj4gLT5lbmQoKSBob29rLiBUaGlzIGhhZCB0aGVuIGNoYW5nZWQgd2l0aCB0aGUgaW50cm9k
dWN0aW9uIG9mIElPTU1VcywKPiBidXQgdGhlIGludGVyYWN0aW9uIGlzc3VlIHdhcyBwcmVzdW1h
Ymx5IG1hc2tlZCBieQo+IGlycV9ndWVzdF9lb2lfdGltZXJfZm4oKSBmcmVxdWVudGx5IEVPSS1p
bmcgaW50ZXJydXB0cyB3YXkgdG9vIGVhcmx5Cj4gKHdoaWNoIGdvdCBmaXhlZCBieSAzNTljZjZm
OGEwZWMgWyJ4ODYvSVJROiBkb24ndCBrZWVwIEVPSSB0aW1lcgo+IHJ1bm5pbmcgd2l0aG91dCBu
ZWVkIl0pLgo+IAo+IFRoZSBwcm9ibGVtIGlzIHRoYXQgd2l0aCB1cyByZS1lbmFibGluZyBpbnRl
cnJ1cHRzIGFjcm9zcyBoYW5kbGVyCj4gaW52b2NhdGlvbiwgYSBoaWdoZXIgcHJpb3JpdHkgKGd1
ZXN0KSBpbnRlcnJ1cHQgbWF5IHRyaWdnZXIgd2hpbGUKPiBoYW5kbGluZyBhIGxvd2VyIHByaW9y
aXR5IChpbnRlcm5hbCkgb25lLiBUaGUgRU9JIGlzc3VlZCBmcm9tCj4gLT5lbmQoKSAoZm9yIEFD
S1RZUEVfRU9JIGtpbmQgaW50ZXJydXB0cykgd291bGQgdGhlbiBtaXN0YWtlbmx5Cj4gRU9JIHRo
ZSBoaWdoZXIgcHJpb3JpdHkgKGd1ZXN0KSBpbnRlcnJ1cHQsIGJyZWFraW5nIChhbW9uZyBvdGhl
cgo+IHRoaW5ncykgcGVuZGluZyBFT0kgc3RhY2sgbG9naWMncyBhc3N1bXB0aW9ucy4KPiAKPiBO
b3RlczoKPiAKPiAtIEluIHByaW5jaXBsZSB3ZSBjb3VsZCBnZXQgYXdheSB3aXRob3V0IHRoZSBj
aGVja19lb2lfZGVmZXJyYWwgZmxhZy4KPiAgIEkndmUgaW50cm9kdWNlZCBpdCBqdXN0IHRvIG1h
a2Ugc3VyZSB0aGVyZSdzIGFzIGxpdHRsZSBjaGFuZ2UgYXMKPiAgIHBvc3NpYmxlIHRvIHVuYWZm
ZWN0ZWQgcGF0aHMuCj4gLSBTaW1pbGFybHkgdGhlIGNwdV9oYXNfcGVuZGluZ19hcGljX2VvaSgp
IGNoZWNrIGluIGRvX0lSUSgpIGlzbid0Cj4gICBzdHJpY3RseSBuZWNlc3NhcnkuCj4gLSBUaGUg
bmV3IGZ1bmN0aW9uJ3MgbmFtZSBpc24ndCB2ZXJ5IGhlbHBmdWwgd2l0aCBpdHMgdXNlIGluCj4g
ICBlbmRfbGV2ZWxfaW9hcGljX2lycV9uZXcoKS4gSSBkaWQgYWxzbyBjb25zaWRlciBlb2lfQVBJ
Q19pcnEoKSAodG8KPiAgIHBhcmFsbGVsIGFja19BUElDX2lycSgpKSwgYnV0IHRoZW4gbGlrZWQg
dGhpcyBldmVuIGxlc3MuCj4gLSBPdGhlciB0aGFuIEkgZmlyc3QgdGhvdWdodCBzZXJpYWwgY29u
c29sZSBJUlFzIHNob3VsZG4ndCBiZQo+ICAgYWZmZWN0ZWQsIGFzIHdlIHJ1biB0aGVtIG9uIHNw
ZWNpZmljYWxseSBhbGxvY2F0ZWQgaGlnaCBwcmlvcml0eQo+ICAgdmVjdG9ycy4KPiAKPiBSZXBv
cnRlZC1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4gRGlh
Z25vc2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkluIGNhc2UgaXQn
cyBub3QgZXhwbGljaXQgZW5vdWdoIGZyb20gdGhlIGRlc2NyaXB0aW9uOiBXaGlsZSB0aGUKaXNz
dWUgYXBwZWFycyB0byBiZSBsb25nIHN0YW5kaW5nLCBpdCBsb29rcyB0byBoYXZlIGJlZW4gbWFz
a2VkCmJ5IG90aGVyIHNob3J0Y29taW5ncyBwcmlvciB0byA0LjEzLiBUaGVyZWZvcmUgdGhpcyBz
aG91bGQgYmUKY29uc2lkZXJlZCBhdCBsZWFzdCBhIHBlcmNlaXZlZCByZWdyZXNzaW9uLCBldmVu
IGlmIGl0IG1heSBub3QKc3RyaWN0bHkgYmUgb25lLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
