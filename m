Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0716114CBA2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 14:45:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwnck-0000HT-KB; Wed, 29 Jan 2020 13:43:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwncj-0000HO-2p
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 13:43:17 +0000
X-Inumbo-ID: 4ceef666-429d-11ea-88c2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ceef666-429d-11ea-88c2-12813bfff9fa;
 Wed, 29 Jan 2020 13:43:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 14A5DAC63;
 Wed, 29 Jan 2020 13:43:15 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200127202121.2961-1-andrew.cooper3@citrix.com>
 <f7a3e838-39b9-378f-d730-dc32d18e8043@suse.com>
 <28f047db-0609-de96-a80e-46b5646e947f@citrix.com>
 <a386538a-bbf0-5c08-7844-70ca3130470e@suse.com>
 <0f09ab0b-a9b2-a193-ba9a-25dd320553db@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <abb31386-e15f-49c5-a90a-f80490b4c010@suse.com>
Date: Wed, 29 Jan 2020 14:43:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <0f09ab0b-a9b2-a193-ba9a-25dd320553db@citrix.com>
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

T24gMjkuMDEuMjAyMCAxNDowOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOS8wMS8yMDIw
IDA4OjE3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjguMDEuMjAyMCAxODoxNCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDI4LzAxLzIwMjAgMTM6NTksIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDI3LjAxLjIwMjAgMjE6MjEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IFdp
dGhvdXQgdGhpcyBmaXgsIHRoZXJlIGlzIGFwcGFyZW50bHkgYSBwcm9ibGVtIHdpdGggUm9nZXIn
cyAiW1BBVENIIHYzIDcvN10KPj4+Pj4geDg2L3RsYjogdXNlIFhlbiBMMCBhc3Npc3RlZCBUTEIg
Zmx1c2ggd2hlbiBhdmFpbGFibGUiIG9uIG5hdGl2ZSBBTUQgaGFyZHdhcmUuCj4+Pj4+IEkgaGF2
ZW4ndCBpbnZlc3RnaWF0ZWQgdGhlIGlzc3VlIHdpdGggdGhhdCBwYXRjaCBzcGVjaWZpY2FsbHks
IGJlY2F1c2UKPj4+Pj4gY3B1X2hhc19oeXBlcnZpc29yIGJlaW5nIHdyb25nIGlzIG9idmlvdXNs
eSBhIGJ1Zy4KPj4+Pj4KPj4+Pj4gVGhpcyBpcyBvbmUgb2YgdHdvIHBvc3NpYmxlIGFwcHJvYWNo
ZXMsIGFuZCBib3RoIGhhdmUgdGhlaXIgZG93bnNpZGVzLiAgVGhpcwo+Pj4+PiBvbmUgdGFrZXMg
YW4gZXh0cmEgaGl0IG9uIGNvbnRleHQgc3dpdGNoZXMgYmV0d2VlbiBQViB2Y3B1cyBhbmQgaWRs
ZS9odm0sIGFzCj4+Pj4+IHRoZXkgd2lsbCB1c3VhbGx5IGRpZmZlciBpbiBIWVBFUlZJU09SIGJp
dC4KPj4+PiBXaHkgd291bGQgdGhleSBkaWZmZXIgaW4gdGhlIEhZUEVSVklTT1IgYml0PyBNYXli
ZSBmb3IgaWRsZSAoYWxiZWl0Cj4+Pj4gb2ZmIHRoZSB0b3Agb2YgbXkgaGVhZCBJIGNhbid0IHJl
Y2FsbCB1cyBzcGVjaWFsIGNhc2luZyBpZGxlIHdydAo+Pj4+IENQVUlEIGhhbmRsaW5nKSwgYnV0
IHdoeSBmb3IgUFYgdnMgSFZNPyBUaGUgaWRsZSBjYXNlLCBpZiB0aGVyZSBpcwo+Pj4+IGFuIGlz
c3VlIHdpdGggdGhpcywgY291bGQgYmUgdGFrZW4gY2FyZSBvZiBieSBhY3R1YWxseSBzZXR0aW5n
IHRoZQo+Pj4+IGJpdCB0aGVyZSwgYXMgbm8tb25lIHNob3VsZCBjYXJlIGFib3V0IHdoYXQgaXQn
cyBzZXQgdG8/Cj4+PiBkLT5hcmNoLnB2LmNwdWlkbWFza3MgaXMgb25seSBhbGxvY2F0ZWQgZm9y
IFBWIGRvbWFpbnMgKGFuZCBzdGFydHMgYnkKPj4+IGR1cCgpaW5nIHRoZSBkZWZhdWx0KS4KPj4g
QWgsIHRoYXQncyB0aGUgcGllY2UgSSB3YXMgbWlzc2luZy4gTXkgbmV4dCBxdWVzdGlvbiB0aGVu
IGlzOiBXaHkKPj4gZG8gd2UgZG8gKl9pbml0X2xldmVsbGluZygpIGZyb20gZWFybHlfaW5pdF8q
KCkgaW4gdGhlIGZpcnN0IHBsYWNlPwo+PiBJdCBsb29rcyBjb25jZXB0dWFsbHkgd3JvbmcgdG8g
bWUgdG8gc2V0IHVwIGxldmVsaW5nIGJlZm9yZSBoYXZpbmcKPj4gb2J0YWluZWQgQ1BVSUQgZGF0
YS4gV291bGRuJ3QgdGhlcmUgYmV0dGVyIGJlIGEgc2VwYXJhdGUgaG9vayBpbgo+PiBzdHJ1Y3Qg
Y3B1X2RldiwgdG8gYmUgaW52b2tlZCBlLmcuIGZyb20gaWRlbnRpZnlfY3B1KCkgYWZ0ZXIKPj4g
Z2VuZXJpY19pZGVudGlmeSgpPwo+IAo+IGNwdWlkX21hc2tfY3B1PSBsaXRlcmFsbHkgbWVhbnMg
InByZXRlbmQgeW91J3JlIHRoaXMgb2xkZXIgQ1BVIGluc3RlYWQiLAo+IGFuZCB3YXMgaW1wbGVt
ZW50ZWQgaW4gYSB3YXkgd2hpY2ggYWZmZWN0ZWQgWGVuLsKgIFRoaXMgaXMgd2h5IGxldmVsbGlu
Zwo+IGlzIGNvbmZpZ3VyZWQgdGhhdCBlYXJseS4KCkl0J3MgaW5kZWVkIHdyaXR0ZW4gbGlrZSB0
aGlzIGluIHRoZSBjbWRsaW5lIGRvYywgYnV0IEkgdmFndWVseQpyZWNhbGwgcXVlc3Rpb25pbmcg
dGhpcyBiZWhhdmlvciBhdCBsZWFzdCBvbmNlIGJlZm9yZS4KCj4gTm93IHRoYXQgdGhpcyBpc24n
dCB0aGUgb25seSB3YXkgdG8gbWFrZSBoZXRlcm9nZW5lb3VzIG1pZ3JhdGlvbiBzYWZlLAo+IHBl
cmhhcHMgd2UgZG9uJ3QgY2FyZSBzbyBtdWNoLCBidXQgaXQgd291bGQgc3RpbGwgYmUgYSBiZWhh
dmlvdXJhbAo+IGNoYW5nZSB0byB0aGUgY3B1aWRfbWFza18qIHBhcmFtZXRlcnMuCgpBbmQgaW5k
ZWVkIHdlIGhhdmUgY3B1aWQ9IG5vdyB0byBjb250cm9sIHRoZSBmZWF0dXJlcyBYZW4gaXMKdG8g
dXNlLiBJIGRvbid0IGZhbmN5IGxvb2tpbmcgYXQgYnVnIHJlcG9ydHMgd2hlcmUgSSBmaXJzdCBu
ZWVkCnRvIHNvcnQgb3V0IHRoZSBpbnRlcmFjdGlvbiBiZXR3ZWVuIHRoZXNlIHR3byBjbWRsaW5l
IG9wdGlvbnMuCgo+Pj4gV2hlbiBjb250ZXh0IHN3aXRjaGluZyBsZXZlbGxpbmcgTVNScywgYW55
IG5vbi1QViBndWVzdCB1c2VzCj4+PiBjcHVtYXNrX2RlZmF1bHQuwqAgVGhpcyBjYXB0dXJlcyBp
ZGxlIGFuZCBIVk0gdmNwdXMuCj4+Pgo+Pj4gVGhpcyBpcyBuZWNlc3NhcnkgYmVjYXVzZSwgYXQg
bGVhc3QgYXQgdGhlIHRpbWUgaXQgd2FzIGludHJvZHVjZWQsCj4+PiB7cHYsaHZtfV9jcHVpZCgp
IGlzc3VlZCBuYXRpdmUgQ1BVSUQgaW5zdHJ1Y3Rpb25zIHRvIHRoZW4gZmVlZCBkYXRhIGJhY2sK
Pj4+IGludG8gZ3Vlc3QgY29udGV4dC7CoCBJdHMgcHJvYmFibHkgbGVzcyByZWxldmFudCBub3cg
dGhhdCBndWVzdF9jcHVpZCgpCj4+PiBkb2Vzbid0IGlzc3VlIG5hdGl2ZSBpbnN0cnVjdGlvbnMg
aW4gdGhlIGdlbmVyYWwgY2FzZS4KPj4+Cj4+PiBFaXRoZXIgd2F5LCBIVk0gZ2FpbmVkIHRoZSBk
ZWZhdWx0IGxpa2UgaWRsZSwgdG8gY2F1c2UgdGhlIGxhenkKPj4+IHN3aXRjaGluZyBsb2dpYyB0
byBzd2l0Y2ggbGVzcyBvZnRlbi4KPj4+Cj4+PiBUaGUgcHJvYmxlbSB3ZSBoYXZlIGFmdGVyIHRo
aXMgcGF0Y2ggaXMgdGhhdCBkZWZhdWx0IGRpZmZlcnMgZnJvbSBQViBpbgo+Pj4gdGhlIEhZUEVS
VklTT1IgYml0LCB3aGljaCBiYXNpY2FsbHkgZ3VhcmFudGVlcyB0aGF0IHdlIHJld3JpdGUgdGhl
IGxlYWYKPj4+IDEgbGV2ZWxsaW5nIG9uIGVhY2ggY29udGV4dCBzd2l0Y2guCj4+Pgo+Pj4gSG93
ZXZlciwgaGF2aW5nIGxvb2tlZCBhdCB0aGUgb3RoZXIgZmVhdHVyZXMgYml0cyB3aGljaCBkaWZm
ZXIgZm9yIFBWLAo+Pj4gVk1FIGFuZCBQU0UzNiBiZWluZyBoaWRkZW4gbWVhbnMgd2UncmUgYWx3
YXlzIHN3aXRjaGluZyBsZWFmIDEgYW55d2F5LAo+Pj4gc28gdGhpcyBjaGFuZ2UgZm9yIEhZUEVS
VklTT1IgZG9lc24ndCBtYWtlIHRoZSBzaXR1YXRpb24gYW55IHdvcnNlLgo+Pj4KPj4+Pj4gVGhl
IG90aGVyIGFwcHJvYWNoIGlzIHRvIG9yZGVyIHRoaW5ncyBtb3JlIGNhcmVmdWxseSBzbyBsZXZl
bGxpbmcgaXMKPj4+Pj4gY29uZmlndXJlZCBhZnRlciBzY2FubmluZyBmb3IgY3B1aWQgYml0cywg
YnV0IHRoYXQgaGFzIHRoZSBkb3duc2lkZSB0aGF0IGl0IGlzCj4+Pj4+IHZlcnkgZWFzeSB0byBy
ZWdyZXNzLgo+Pj4+Pgo+Pj4+PiBUaG91Z2h0cyBvbiB3aGljaCBpcyB0aGUgbGVhc3QtYmFkIGFw
cHJvYWNoIHRvIHRha2U/ICBIYXZpbmcgd3JpdHRlbiB0aGlzCj4+Pj4+IHBhdGNoLCBJJ20gbm93
IGVycmluZyBvbiB0aGUgc2lkZSBvZiBkb2luZyBpdCB0aGUgb3RoZXIgd2F5Lgo+Pj4+IEJlc2lk
ZXMgdGhlIG5lZWQgZm9yIG1lIHRvIHVuZGVyc3RhbmQgdGhlIGFzcGVjdCBhYm92ZSwgSSdtIGFm
cmFpZAo+Pj4+IHRvIGp1ZGdlIEknZCBuZWVkIHRvIGhhdmUgYXQgbGVhc3QgYSBza2V0Y2ggb2Yg
d2hhdCB0aGUgYWx0ZXJuYXRpdmUKPj4+PiB3b3VsZCBsb29rIGxpa2UsIGluIHBhcnRpY3VsYXIg
dG8gZmlndXJlIGhvdyBmcmFnaWxlIGl0IHJlYWxseSBpcy4KPj4+IEl0IHdvdWxkIGJlIGEgc21h
bGwgYml0IG9mIGNhcmVmdWwgcmVvcmRlcmluZyBpbiBjcHUvYW1kLmMKPj4+Cj4+PiBUaGUgdGlw
cGluZyBmYWN0b3IgaXMgdGhhdCwgZXZlbiBpZiB3ZSBhcnJhbmdlIGZvciBpZGxlIGNvbnRleHQg
bm90IHRvCj4+PiBoYXZlIEhZUEVSVklTT1Igc2V0IChhbmQgdGhlcmVmb3JlIGNwdV9oYXNfaHlw
ZXJ2aXNvciBlbmRpbmcgdXAgY2xlYXIKPj4+IHdoZW4gc2Nhbm5lZCksIGEgcmVndWxhciBDUFVJ
RCBpbnN0cnVjdGlvbiBpbiBQViBjb250ZXh0IHdvdWxkIHNlZQo+Pj4gSFlQRVJWSVNPUiBhcyBh
IHByb3BlcnR5IG9mIHZpcnR1YWxpc2luZyB0aGluZ3Mgc2Vuc2libHkgZm9yIGd1ZXN0cy4KPj4+
Cj4+PiBBcyB3ZSBuZWVkIHRvIGNvcGUgd2l0aCBIWVBFUlZJU09SIGJlaW5nIHZpc2libGUgaW4g
c29tZSBjb250ZXh0cywgaXRzCj4+PiBiZXR0ZXIgdG8gY29uc2lkZXIgaXQgdW5pZm9ybWx5IHZp
c2libGUgYW5kIGJyZWFrIGFueSBraW5kIG9mIG5vdGlvbmFsCj4+PiBsaW5rIGJldHdlZW4gY3B1
X2hhc19oeXBlcnZpc29yIG1hdGNoaW5nIHdoYXQgQ1BVSUQgd291bGQgc2VlIGFzIHRoZSBiaXQu
Cj4+IEFmdGVyIGhhdmluZyBzZXQgdXAgbGV2ZWxpbmcgSSB0aGluayB3ZSBzaG91bGRuJ3QgdXNl
IENQVUlEIGFueW1vcmUKPj4gZm9yIGxlYXZlcyB3aGljaCBtYXkgYmUgbGV2ZWxlZC4gQXMgYSBy
ZXN1bHQgY3B1X2hhc18qIC8gY3B1X2hhcygpCj4+IHdvdWxkIHRoZW4gYmUgdGhlIG9ubHkgaW5m
b3JtYXRpb24gc291cmNlIGluIHRoaXMgcmVnYXJkLgo+Pgo+PiBTdWNoIGEgZ2VuZXJhbCByZS1h
cnJhbmdlbWVudCB3b3VsZCB0aGVuIGFsc28gYXBwZWFyIHRvIGFkZHJlc3MgeW91cgo+PiAiZWFz
eSB0byByZWdyZXNzIiBjb25jZXJuLgo+IAo+IEkndmUganVzdCBoYWQgYW5vdGhlciB0aG91Z2h0
LCBhbmQgaXQgcnVsZXMgb3V0IG90aGVyIGFwcHJvYWNoZXMuCj4gCj4gV2UgdXNlIGN0eHRfc3dp
dGNoX2xldmVsbGluZyhOVUxMKSBvbiB0aGUgY3Jhc2ggcGF0aCB0byByZXNldCB0aGluZ3MgZm9y
Cj4gbmV4dCBrZXJuZWwsIGFuZCB0aGF0IG5lZWRzIHRvIGhpZGUgdGhlIEhZUEVSVklTT1IgYml0
IG9uIEFNRC4KPiAKPiBUaGVyZWZvcmUsIHRoZSBhcHByb2FjaCBpbiB0aGlzIHBhdGNoIGlzIHRo
ZSBvbmx5IHNlbnNpYmxlIGFjdGlvbiAoYW5kCj4gSSdtIG5vdyBub3QgY29uY2VybmVkIGFib3V0
IHRoZSBwZXJmb3JtYW5jZSBoaXQsIGFzIGl0IHdvbid0IGFjdHVhbGx5Cj4gaW5jcmVhc2UgdGhl
IG51bWJlciBvZiBNU1Igd3JpdGVzIHdlIG1ha2UpLgoKSSdtIG5vdCBmdWxseSBjb252aW5jZWQ6
IFdoeSBpcyBzZXR0aW5nIHRoZSBNU1JzIGJhY2sgdG8KY3B1aWRtYXNrX2RlZmF1bHRzIHRoZSBj
b3JyZWN0IHRoaW5nIHRvIGRvIGluIHRoZSBmaXJzdCBwbGFjZT8KU2hvdWxkbid0IHdlIHJlc2V0
IHRoZW0gdG8gd2hhdCB3ZSBmb3VuZCBvbiBib290PwoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
