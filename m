Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DF5FE05C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 15:44:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVcnr-0007G1-1z; Fri, 15 Nov 2019 14:42:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVcnp-0007Ft-TN
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 14:42:25 +0000
X-Inumbo-ID: 2313fafc-07b6-11ea-a271-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2313fafc-07b6-11ea-a271-12813bfff9fa;
 Fri, 15 Nov 2019 14:42:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2E3FEAEAF;
 Fri, 15 Nov 2019 14:42:23 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <ec3be412-f0a1-6e04-ba62-5f27a06ab8ad@suse.com>
 <5751f0af-610b-a21d-9a6a-8c64e38140ac@citrix.com>
 <c1b1424f-382d-ffb3-6123-131312b2851c@suse.com>
 <607854b0-00a2-df11-d977-af6498050c40@citrix.com>
 <f9c4d160-1567-d622-e056-f61b7085198e@citrix.com>
 <b6bf2826-eb8f-4e3c-42ce-a9923d3af1c3@citrix.com>
 <380e865b-3092-6a85-0d77-dc99e33678e4@citrix.com>
 <0f27d518-e6c4-a728-e59d-237acc92d493@suse.com>
 <0ec711d3-90d4-5fa0-7f16-8bf1ac8dc0ca@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f6c3a7dc-e42f-36ab-7905-75e34c5158bf@suse.com>
Date: Fri, 15 Nov 2019 15:42:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <0ec711d3-90d4-5fa0-7f16-8bf1ac8dc0ca@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86: Add hack to disable "Fake HT" mode
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
Cc: Steven Haigh <netwiz@crc.id.au>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Andreas Kinzler <hfp@posteo.de>, IanJackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMjAxOSAxNToyOSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS8xNS8xOSAy
OjE4IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTUuMTEuMjAxOSAxNToxMCwgR2Vvcmdl
IER1bmxhcCB3cm90ZToKPj4+IE9uIDExLzE1LzE5IDI6MDYgUE0sIEFuZHJldyBDb29wZXIgd3Jv
dGU6Cj4+Pj4gT24gMTUvMTEvMjAxOSAxNDowNCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4+Pj4+
PiBJdCdzIG5vdCBlbnRpcmVseSB1bmNvbW1vbiB0byAoYWxzbykgY29uc2lkZXIgaG93IHRoZSBy
ZXN1bHRpbmcKPj4+Pj4+PiBkaWZmIHdvdWxkIGxvb2sgbGlrZSB3aGVuIHB1dHRpbmcgdG9nZXRo
ZXIgYSBjaGFuZ2UuIEFuZCBiZXNpZGVzCj4+Pj4+Pj4gdGhlIHJldmlldyBhc3BlY3QsIHRoZXJl
J3MgYWxzbyB0aGUgYXJjaGVvbG9neSBvbmUgLSAiZ2l0IGJsYW1lIgo+Pj4+Pj4+IHlpZWxkcyBt
dWNoIG1vcmUgaGVscGZ1bCByZXN1bHRzIHdoZW4gY29kZSBkb2Vzbid0IGdldCBtb3ZlZAo+Pj4+
Pj4+IGFyb3VuZCBtb3JlIHRoYW4gbmVjZXNzYXJ5LiBCdXQgeWVzLCB0aGVyZSdzIG5vIHZlcnkg
Y2xlYXIgInRoaXMKPj4+Pj4+PiBpcyB0aGUgYmV0dGVyIG9wdGlvbiIgaGVyZS4gSSd2ZSB0YWtl
biBhbm90aGVyIGxvb2sgYXQgdGhlIGNvZGUKPj4+Pj4+PiBiZWZvcmUgeW91ciBjaGFuZ2UgdGhv
dWdoIC0gZXZlcnl0aGluZyBpcyBhbHJlYWR5IG5pY2VseSBpbiBvbmUKPj4+Pj4+PiBwbGFjZSB3
aXRoIEFuZHJldydzIG1vc3QgcmVjZW50IGNvZGUgcmVvcmcuIFNvIEknbSBub3cgaGF2aW5nIGFu
Cj4+Pj4+Pj4gZXZlbiBoYXJkZXIgdGltZSBzZWVpbmcgd2h5IHlvdSB3YW50IHRvIG1vdmUgdGhp
bmdzIGFyb3VuZCBhZ2Fpbi4KPj4+Pj4+IFdlIGRvbid0LsKgIEkndmUgcmVjb21tZW5kIHR3aWNl
IG5vdyB0byBoYXZlIGEgc2luZ2xlICJlbHNlIGlmIiBodW5rCj4+Pj4+PiB3aGljaCBpcyBuZWFy
bHkgZW1wdHksIGFuZCBtdWNoIG1vcmUgb2J2aW91c2x5IGEgZ3Jvc3MgIm1ha2UgaXQgd29yayBm
b3IKPj4+Pj4+IDQuMTMiIGJvZGdlLgo+Pj4+PiBUaGUgcmVzdWx0cyBhcmUgYSB0aW55IGJpdCBi
ZXR0ZXIsIGJ1dCBub3QgbXVjaCByZWFsbHkgKHNlZSBhdHRhY2hlZCkuCj4+Pj4KPj4+PiBXaGF0
IEkgbWVhbnQgd2FzOgo+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19jcHVp
ZF94ODYuYyBiL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCj4+Pj4+IGluZGV4IDMxMmM0ODFm
MWUuLmJjMDg4ZTQ1ZjAgMTAwNjQ0Cj4+Pj4+IC0tLSBhL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4
Ni5jCj4+Pj4+ICsrKyBiL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCj4+Pj4+IEBAIC01Nzks
NTIgKzU3OSw3MSBAQCBpbnQgeGNfY3B1aWRfYXBwbHlfcG9saWN5KHhjX2ludGVyZmFjZSAqeGNo
LCB1aW50MzJfdCBkb21pZCwKPj4+Pj4gICAgICB9Cj4+Pj4KPj4+PiBlbHNlIGlmICggZ2V0ZW52
KCkgKQo+Pj4+IHsKPj4+PiDCoMKgwqAgLi4uCj4+Pj4gfQo+Pj4+Cj4+Pj4+ICAgICAgZWxzZQo+
Pj4+PiAgICAgIHsKPj4+Pgo+Pj4+IFdpdGggbm8gZGVsdGEgdG8gdGhpcyBibG9jayBhdCBhbGwu
Cj4+Pgo+Pj4gVGhlbiB3ZSBoYXZlIHRvIGR1cGxpY2F0ZSB0aGlzIGNvZGUgaW4gYm90aCBibG9j
a3M6Cj4+Pgo+Pj4gICAgICAgICAvKgo+Pj4gICAgICAgICAgKiBUaGVzZSBzZXR0aW5ncyBhcmUg
bmVjZXNzYXJ5IHRvIGNhdXNlIGVhcmxpZXIKPj4+IEhWTV9QQVJBTV9ORVNURURIVk0gLwo+Pj4g
ICAgICAgICAgKiBYRU5fRE9NQ1RMX2Rpc2FibGVfbWlncmF0ZSBzZXR0aW5ncyB0byBiZSByZWZs
ZWN0ZWQgY29ycmVjdGx5IGluCj4+PiAgICAgICAgICAqIENQVUlELiAgWGVuIHdpbGwgZGlzY2Fy
ZCB0aGVzZSBiaXRzIGlmIGNvbmZpZ3VyYXRpb24gaGFzbid0IGJlZW4KPj4+ICAgICAgICAgICog
c2V0IGZvciB0aGUgZG9tYWluLgo+Pj4gICAgICAgICAgKi8KPj4+ICAgICAgICAgcC0+ZXh0ZC5p
dHNjID0gdHJ1ZTsKPj4+ICAgICAgICAgcC0+YmFzaWMudm14ID0gdHJ1ZTsKPj4+ICAgICAgICAg
cC0+ZXh0ZC5zdm0gPSB0cnVlOwo+Pj4KPj4+IEkgd29uJ3Qgb2JqZWN0IGlmIHRoYXQncyB3aGF0
IHlvdSBndXlzIHJlYWxseSB3YW50Lgo+Pgo+PiBQZXJzb25hbGx5IEkgdGhpbmsgdGhlIGR1cGxp
Y2F0aW9uIGlzIGxlc3MgYmFkIHRoYW4gdGhlIGZhcgo+PiBoZWF2aWVyIG9yaWdpbmFsIGNvZGUg
Y2h1cm4sIGJ1dCB0byBiZSBob25lc3QsIGVzcGVjaWFsbHkgd2l0aAo+PiB0aGlzIGludGVuZGVk
IHRvIGdvIGF3YXkgYWdhaW4gc29vbiBhbnl3YXksIEknZCBub3QgYmUgb3Bwb3NlZAo+PiBhdCBh
bGwgdG8KPj4KPj4gICAgIC4uLgo+PiAgICAgZWxzZSBpZiAoIGdldGVudigpICkKPj4gICAgICAg
ICBnb3RvIG5vX2Zha2VfaHQ7Cj4gCj4gVGhpcyBpc24ndCBjb3JyZWN0LCBiZWNhdXNlIHlvdSBk
byBuZWVkIHRvIGNsZWFyIGh0dCBhbmQgY21wX2xlZ2FjeSwgYXMKPiB3ZWxsIGFzIHplcm9pbmcg
b3V0IGNvcmVzX3Blcl9wYWNrYWdlIGFuZCB0aHJlYWRzX3Blcl9jYWNoZSBvbiBJbnRlbC4KPiAo
QXQgbGVhc3QsIHRoYXQncyB3aGF0IFhlblNlcnZlcidzIHBhdGNoIGRvZXMsIGFuZCBpdCdzIHRo
ZSBiZXN0IHRlc3RlZC4pCj4gCj4+ICAgICBlbHNlCj4+ICAgICB7Cj4+ICAgICAuLi4KPj4gIG5v
X2Zha2VfaHQ6Cj4+ICAgICAgICAgLyoKPj4gICAgICAgICAgKiBUaGVzZSBzZXR0aW5ncyBhcmUg
bmVjZXNzYXJ5IHRvIGNhdXNlIGVhcmxpZXIgSFZNX1BBUkFNX05FU1RFREhWTSAvCj4+ICAgICAg
ICAgICogWEVOX0RPTUNUTF9kaXNhYmxlX21pZ3JhdGUgc2V0dGluZ3MgdG8gYmUgcmVmbGVjdGVk
IGNvcnJlY3RseSBpbgo+PiAgICAgICAgICAqIENQVUlELiAgWGVuIHdpbGwgZGlzY2FyZCB0aGVz
ZSBiaXRzIGlmIGNvbmZpZ3VyYXRpb24gaGFzbid0IGJlZW4KPj4gICAgICAgICAgKiBzZXQgZm9y
IHRoZSBkb21haW4uCj4+ICAgICAgICAgICovCj4+ICAgICAgICAgcC0+ZXh0ZC5pdHNjID0gdHJ1
ZTsKPj4gICAgICAgICBwLT5iYXNpYy52bXggPSB0cnVlOwo+PiAgICAgICAgIHAtPmV4dGQuc3Zt
ID0gdHJ1ZTsKPj4gICAgIH0KPj4KPj4gKGRlc3BpdGUgbXkgZ2VuZXJhbCBkaXNsaWtlIG9mIGdv
dG8pLgo+IAo+IFdlbGwgSSB0aGluayBnb3RvcyBpbnRvIG90aGVyIGJsb2NrcyBpcyBldmVuIHdv
cnNlLiA6LSkKPiAKPiBJIHRoaW5rIHRoZSByZXN1bHQgaXMgYSBsb3QgbmljZXIgdG8gcmV2aWV3
IGZvciBzdXJlLgoKVHJ5aW5nIHRvIGNvbW1lbnQgZGVzcGl0ZSB0aGlzIGhhdmluZyBiZWVuIGFu
IGF0dGFjaG1lbnQ6Cgo+LS0tIGEvdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMKPisrKyBiL3Rv
b2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCj5AQCAtNTc5LDYgKzU3OSwyNiBAQCBpbnQgeGNfY3B1
aWRfYXBwbHlfcG9saWN5KHhjX2ludGVyZmFjZSAqeGNoLCB1aW50MzJfdCBkb21pZCwKPiAgICAg
fQo+ICAgICBlbHNlCj4gICAgIHsKPisgICAgICAgIGlmICggZ2V0ZW52KCJYRU5fTElCWENfRElT
QUJMRV9GQUtFSFQiKSApIHsKClRoZSBicmFjZSB3YW50cyB0byBtb3ZlIG9udG8gaXRzIG93biBs
aW5lLgoKPisgICAgICAgICAgICBwLT5iYXNpYy5odHQgPSBmYWxzZTsKCkkgdGhpbmsgZXZlcnl0
aGluZyBiZWxvdyBoZXJlIGluZGVlZCBzaW1wbHkgdW5kb2VzIHdoYXQgc2FpZCBvbGQKY29tbWl0
IGRpZCwgYnV0IEkgY2FuJ3QgbWF0Y2ggdXAgdGhpcyBvbmUuIEFuZCB0b2dldGhlciB3aXRoIHRo
ZQpxdWVzdGlvbiBvZiB3aGV0aGVyIGluc3RlYWQgbGVhdmluZyBpdCBhbG9uZSwgY21wX2xlZ2Fj
eSB0aGVuCndvdWxkIGhhdmUgdGhlIHNhbWUgcXVlc3Rpb24gcmFpc2VkLgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
