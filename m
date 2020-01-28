Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3F014B7CC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 15:20:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwRgl-0001FL-31; Tue, 28 Jan 2020 14:17:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwRgk-0001F9-AK
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 14:17:58 +0000
X-Inumbo-ID: f851957e-41d8-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f851957e-41d8-11ea-b211-bc764e2007e4;
 Tue, 28 Jan 2020 14:17:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A2CF9B307;
 Tue, 28 Jan 2020 14:17:51 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200127202121.2961-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f7a3e838-39b9-378f-d730-dc32d18e8043@suse.com>
Date: Tue, 28 Jan 2020 14:59:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200127202121.2961-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86/amd: Avoid cpu_has_hypervisor
 evaluating true on native hardware
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Igor Druzhinin <igor.druzhinin@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDEuMjAyMCAyMToyMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBDdXJyZW50bHkgd2hl
biBib290aW5nIG5hdGl2ZSBvbiBBTUQgaGFyZHdhcmUsIGNwdWlkbWFza19kZWZhdWx0cy5fMWNk
IGdldHMKPiBjb25maWd1cmVkIHdpdGggdGhlIEhZUEVSVklTT1IgYml0IGJlZm9yZSBuYXRpdmUg
Q1BVSUQgaXMgc2Nhbm5lZCBmb3IgZmVhdHVyZQo+IGJpdHMuCj4gCj4gVGhpcyByZXN1bHRzIGlu
IGNwdV9oYXNfaHlwZXJ2aXNvciBiZWNvbWluZyBzZXQgYXMgcGFydCBvZiBpZGVudGlmeV9jcHUo
KSwgYW5kCj4gZW5kcyB1cCBhcHBlYXJpbmcgaW4gdGhlIHJhdyBhbmQgaG9zdCBDUFUgcG9saWNp
ZXMuICBOb3RoaW5nIGhhcyByZWFsbHkgY2FyZWQKPiBpbiB0aGUgcGFzdC4KPiAKPiBBbHRlciBh
bWRfaW5pdF9sZXZlbGxpbmcoKSB0byBleGNsdWRlIHRoZSBIWVBFUlZJU09SIGJpdCBmcm9tCj4g
Y3B1bWFza19kZWZhdWx0cywgYW5kIHVwZGF0ZSBkb21haW5fY3B1X3BvbGljeV9jaGFuZ2VkKCkg
dG8gYWxsb3cgaXQgdG8gYmUKPiBleHBsaWNpdGx5IGZvcndhcmRlZC4KPiAKPiBUaGlzIGluIHR1
cm4gaGlnaGxpZ2h0ZWQgdGhhdCBkb20wIGNvbnN0cnVjdGlvbiB3YXMgYXN5bWV0cmljIHdpdGgg
ZG9tVQo+IGNvbnN0cnVjdGlvbiwgYnkgbm90IGhhdmluZyBhbnkgY2FsbHMgdG8gZG9tYWluX2Nw
dV9wb2xpY3lfY2hhbmdlZCgpLiAgRXh0ZW5kCj4gYXJjaF9kb21haW5fY3JlYXRlKCkgdG8gYWx3
YXlzIGNhbGwgZG9tYWluX2NwdV9wb2xpY3lfY2hhbmdlZCgpLgo+IAo+IFJlcG9ydGVkLWJ5OiBJ
Z29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IENDOiBK
YW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Cj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IENDOiBJZ29y
IERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KPiAKPiBXaXRob3V0IHRoaXMg
Zml4LCB0aGVyZSBpcyBhcHBhcmVudGx5IGEgcHJvYmxlbSB3aXRoIFJvZ2VyJ3MgIltQQVRDSCB2
MyA3LzddCj4geDg2L3RsYjogdXNlIFhlbiBMMCBhc3Npc3RlZCBUTEIgZmx1c2ggd2hlbiBhdmFp
bGFibGUiIG9uIG5hdGl2ZSBBTUQgaGFyZHdhcmUuCj4gSSBoYXZlbid0IGludmVzdGdpYXRlZCB0
aGUgaXNzdWUgd2l0aCB0aGF0IHBhdGNoIHNwZWNpZmljYWxseSwgYmVjYXVzZQo+IGNwdV9oYXNf
aHlwZXJ2aXNvciBiZWluZyB3cm9uZyBpcyBvYnZpb3VzbHkgYSBidWcuCj4gCj4gVGhpcyBpcyBv
bmUgb2YgdHdvIHBvc3NpYmxlIGFwcHJvYWNoZXMsIGFuZCBib3RoIGhhdmUgdGhlaXIgZG93bnNp
ZGVzLiAgVGhpcwo+IG9uZSB0YWtlcyBhbiBleHRyYSBoaXQgb24gY29udGV4dCBzd2l0Y2hlcyBi
ZXR3ZWVuIFBWIHZjcHVzIGFuZCBpZGxlL2h2bSwgYXMKPiB0aGV5IHdpbGwgdXN1YWxseSBkaWZm
ZXIgaW4gSFlQRVJWSVNPUiBiaXQuCgpXaHkgd291bGQgdGhleSBkaWZmZXIgaW4gdGhlIEhZUEVS
VklTT1IgYml0PyBNYXliZSBmb3IgaWRsZSAoYWxiZWl0Cm9mZiB0aGUgdG9wIG9mIG15IGhlYWQg
SSBjYW4ndCByZWNhbGwgdXMgc3BlY2lhbCBjYXNpbmcgaWRsZSB3cnQKQ1BVSUQgaGFuZGxpbmcp
LCBidXQgd2h5IGZvciBQViB2cyBIVk0/IFRoZSBpZGxlIGNhc2UsIGlmIHRoZXJlIGlzCmFuIGlz
c3VlIHdpdGggdGhpcywgY291bGQgYmUgdGFrZW4gY2FyZSBvZiBieSBhY3R1YWxseSBzZXR0aW5n
IHRoZQpiaXQgdGhlcmUsIGFzIG5vLW9uZSBzaG91bGQgY2FyZSBhYm91dCB3aGF0IGl0J3Mgc2V0
IHRvPwoKPiBUaGUgb3RoZXIgYXBwcm9hY2ggaXMgdG8gb3JkZXIgdGhpbmdzIG1vcmUgY2FyZWZ1
bGx5IHNvIGxldmVsbGluZyBpcwo+IGNvbmZpZ3VyZWQgYWZ0ZXIgc2Nhbm5pbmcgZm9yIGNwdWlk
IGJpdHMsIGJ1dCB0aGF0IGhhcyB0aGUgZG93bnNpZGUgdGhhdCBpdCBpcwo+IHZlcnkgZWFzeSB0
byByZWdyZXNzLgo+IAo+IFRob3VnaHRzIG9uIHdoaWNoIGlzIHRoZSBsZWFzdC1iYWQgYXBwcm9h
Y2ggdG8gdGFrZT8gIEhhdmluZyB3cml0dGVuIHRoaXMKPiBwYXRjaCwgSSdtIG5vdyBlcnJpbmcg
b24gdGhlIHNpZGUgb2YgZG9pbmcgaXQgdGhlIG90aGVyIHdheS4KCkJlc2lkZXMgdGhlIG5lZWQg
Zm9yIG1lIHRvIHVuZGVyc3RhbmQgdGhlIGFzcGVjdCBhYm92ZSwgSSdtIGFmcmFpZAp0byBqdWRn
ZSBJJ2QgbmVlZCB0byBoYXZlIGF0IGxlYXN0IGEgc2tldGNoIG9mIHdoYXQgdGhlIGFsdGVybmF0
aXZlCndvdWxkIGxvb2sgbGlrZSwgaW4gcGFydGljdWxhciB0byBmaWd1cmUgaG93IGZyYWdpbGUg
aXQgcmVhbGx5IGlzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
