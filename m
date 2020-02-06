Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37861154671
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 15:50:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iziQf-00027I-Fe; Thu, 06 Feb 2020 14:46:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iziQd-00027D-6W
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 14:46:51 +0000
X-Inumbo-ID: 81a339a0-48ef-11ea-afc1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81a339a0-48ef-11ea-afc1-12813bfff9fa;
 Thu, 06 Feb 2020 14:46:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 42C00ACD6;
 Thu,  6 Feb 2020 14:46:49 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200127181115.82709-1-roger.pau@citrix.com>
 <20200127181115.82709-8-roger.pau@citrix.com>
 <20200206134935.x4eonkizd4ybln6r@debian> <20200206140914.GX4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <84925af7-d61f-df0a-10d9-263aae79d486@suse.com>
Date: Thu, 6 Feb 2020 15:46:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200206140914.GX4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 7/7] x86/tlb: use Xen L0 assisted TLB
 flush when available
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

T24gMDYuMDIuMjAyMCAxNTowOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIEZl
YiAwNiwgMjAyMCBhdCAwMTo0OTozNVBNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+PiBPbiBNb24s
IEphbiAyNywgMjAyMCBhdCAwNzoxMToxNVBNICswMTAwLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6
Cj4+PiBVc2UgWGVuJ3MgTDAgSFZNT1BfZmx1c2hfdGxicyBoeXBlcmNhbGwgaW4gb3JkZXIgdG8g
cGVyZm9ybSBmbHVzaGVzLgo+Pj4gVGhpcyBncmVhdGx5IGluY3JlYXNlcyB0aGUgcGVyZm9ybWFu
Y2Ugb2YgVExCIGZsdXNoZXMgd2hlbiBydW5uaW5nCj4+PiB3aXRoIGEgaGlnaCBhbW91bnQgb2Yg
dkNQVXMgYXMgYSBYZW4gZ3Vlc3QsIGFuZCBpcyBzcGVjaWFsbHkgaW1wb3J0YW50Cj4+PiB3aGVu
IHJ1bm5pbmcgaW4gc2hpbSBtb2RlLgo+Pj4KPj4+IFRoZSBmb2xsb3dpbmcgZmlndXJlcyBhcmUg
ZnJvbSBhIFBWIGd1ZXN0IHJ1bm5pbmcgYG1ha2UgLWozMiB4ZW5gIGluCj4+PiBzaGltIG1vZGUg
d2l0aCAzMiB2Q1BVcyBhbmQgSEFQLgo+Pj4KPj4+IFVzaW5nIHgyQVBJQyBhbmQgQUxMQlVUIHNo
b3J0aGFuZDoKPj4+IHJlYWwJNG0zNS45NzNzCj4+PiB1c2VyCTRtMzUuMTEwcwo+Pj4gc3lzCTM2
bTI0LjExN3MKPj4+Cj4+PiBVc2luZyBMMCBhc3Npc3RlZCBmbHVzaDoKPj4+IHJlYWwgICAgMW0y
LjU5NnMKPj4+IHVzZXIgICAgNG0zNC44MThzCj4+PiBzeXMgICAgIDVtMTYuMzc0cwo+Pj4KPj4+
IFRoZSBpbXBsZW1lbnRhdGlvbiBhZGRzIGEgbmV3IGhvb2sgdG8gaHlwZXJ2aXNvcl9vcHMgc28g
b3RoZXIKPj4+IGVubGlnaHRlbm1lbnRzIGNhbiBhbHNvIGltcGxlbWVudCBzdWNoIGFzc2lzdGVk
IGZsdXNoIGp1c3QgYnkgZmlsbGluZwo+Pj4gdGhlIGhvb2suIE5vdGUgdGhhdCB0aGUgWGVuIGlt
cGxlbWVudGF0aW9uIGNvbXBsZXRlbHkgaWdub3JlcyB0aGUKPj4+IGRpcnR5IENQVSBtYXNrIGFu
ZCB0aGUgbGluZWFyIGFkZHJlc3MgcGFzc2VkIGluLCBhbmQgYWx3YXlzIHBlcmZvcm1zIGEKPj4+
IGdsb2JhbCBUTEIgZmx1c2ggb24gYWxsIHZDUFVzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+Pj4gLS0tCj4+PiBDaGFuZ2Vz
IHNpbmNlIHYxOgo+Pj4gIC0gQWRkIGEgTDAgYXNzaXN0ZWQgaG9vayB0byBoeXBlcnZpc29yIG9w
cy4KPj4+IC0tLQo+Pj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgICAgICAgIHwg
MTAgKysrKysrKysrKwo+Pj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMgICAgICAgICAg
IHwgIDYgKysrKysrCj4+PiAgeGVuL2FyY2gveDg2L3NtcC5jICAgICAgICAgICAgICAgICAgICAg
fCAxMSArKysrKysrKysrKwo+Pj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNv
ci5oIHwgMTcgKysrKysrKysrKysrKysrKysKPj4+ICA0IGZpbGVzIGNoYW5nZWQsIDQ0IGluc2Vy
dGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlz
b3IuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKPj4+IGluZGV4IDRmMjdiOTg3
NDAuLjQwODViMTk3MzQgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
aXNvci5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCj4+PiBAQCAt
MTgsNiArMTgsNyBAQAo+Pj4gICAqCj4+PiAgICogQ29weXJpZ2h0IChjKSAyMDE5IE1pY3Jvc29m
dC4KPj4+ICAgKi8KPj4+ICsjaW5jbHVkZSA8eGVuL2NwdW1hc2suaD4KPj4+ICAjaW5jbHVkZSA8
eGVuL2luaXQuaD4KPj4+ICAjaW5jbHVkZSA8eGVuL3R5cGVzLmg+Cj4+PiAgCj4+PiBAQCAtNjQs
NiArNjUsMTUgQEAgdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lkKQo+Pj4gICAgICAgICAgb3Bz
LT5yZXN1bWUoKTsKPj4+ICB9Cj4+PiAgCj4+PiAraW50IGh5cGVydmlzb3JfZmx1c2hfdGxiKGNv
bnN0IGNwdW1hc2tfdCAqbWFzaywgY29uc3Qgdm9pZCAqdmEsCj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGludCBvcmRlcikKPj4+ICt7Cj4+PiArICAgIGlmICggb3BzICYm
IG9wcy0+Zmx1c2hfdGxiICkKPj4+ICsgICAgICAgIHJldHVybiBvcHMtPmZsdXNoX3RsYihtYXNr
LCB2YSwgb3JkZXIpOwo+Pj4gKwo+Pgo+PiBJcyB0aGVyZSBhIHdheSB0byBtYWtlIHRoaXMgYW4g
YWx0ZXJuYXRpdmUgY2FsbD8gSSBjb25zaWRlciB0bGIgZmx1c2ggYQo+PiBmcmVxdWVudCBvcGVy
YXRpb24gd2hpY2ggY2FuIHVzZSBzb21lIG9wdGltaXNhdGlvbi4KPj4KPj4gVGhpcyBjYW4gYmUg
ZG9uZSBhcyBhIGxhdGVyIGltcHJvdmVtZW50IGlmIGl0IGlzIHRvbyBkaWZmaWN1bHQgdGhvdWdo
Lgo+PiBUaGlzIHBhdGNoIGFscmVhZHkgaGFzIHNvbWUgc3Vic3RhbnRpYWwgaW1wcm92ZW1lbnQu
Cj4gCj4gSSBjYW4gbG9vayBpbnRvIG1ha2luZyB0aGlzIGFuIGFsdGVybmF0aXZlIGNhbGwsIGlm
IGl0IHR1cm4gb3V0IHRvIGJlCj4gdG9vIGNvbXBsZXggSSB3aWxsIGxlYXZlIGl0IG91dCBmb3Ig
YSBzZXBhcmF0ZSBwYXRjaC4KCkl0J2xsIGJlIHR3byBzdGVwcyAtIG1ha2UgYSBnbG9iYWwgc3Ry
dWN0IGh5cGVydmlzb3Jfb3BzIGluc3RhbmNlCndoaWNoIHRoZSBwZXItaHlwZXJ2aXNvciBpbnN0
YW5jZXMgZ2V0IF9jb3BpZWRfIGludG8gdXBvbiBib290CihhdCB0aGF0IHBvaW50IGFsbCBvZiB0
aG9zZSBjYW4gZ28gaW50byAuaW5pdC4qIHNlY3Rpb25zKSwgYW5kCnRoZW4gc3dpdGNoIHRoZSBj
YWxsKHMpIG9mIGludGVyZXN0LiBJLmUuIHdoaWxlIHRoZSAybmQgc3RlcCBjYW4Kb2YgY291cnNl
IGJlIGRvbmUgcmlnaHQgaGVyZSwgdGhlIGZpcnN0IHdpbGwgd2FudCB0byBiZSBpbiBhCnByZXJl
cSBwYXRjaC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
