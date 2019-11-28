Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328FA10C820
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 12:42:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaI9U-0006oV-9c; Thu, 28 Nov 2019 11:40:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FMNu=ZU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iaI9S-0006jM-M1
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 11:40:02 +0000
X-Inumbo-ID: cfbb79ac-11d3-11ea-a3d2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cfbb79ac-11d3-11ea-a3d2-12813bfff9fa;
 Thu, 28 Nov 2019 11:40:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6F9DDB0BA;
 Thu, 28 Nov 2019 11:35:00 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <7f82e319-1891-ec36-dcf0-e94253ba04a5@suse.com>
 <d2e63383-c0bf-073b-9935-5debb43305de@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f7e34035-c3f9-3087-96e3-74bf74ff8548@suse.com>
Date: Thu, 28 Nov 2019 12:35:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <d2e63383-c0bf-073b-9935-5debb43305de@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMTkgMTI6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI4LjExLjIwMTkgMTI6
MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBBdCB0aGUgdGltZSB0aGUgcGVuZGluZyBFT0kgc3Rh
Y2sgd2FzIGludHJvZHVjZWQgdGhlcmUgd2VyZSBubwo+PiBpbnRlcm5hbGx5IHVzZWQgSVJRcyB3
aGljaCB3b3VsZCBoYXZlIHRoZSBMQVBJQyBFT0kgaXNzdWVkIGZyb20gdGhlCj4+IC0+ZW5kKCkg
aG9vay4gVGhpcyBoYWQgdGhlbiBjaGFuZ2VkIHdpdGggdGhlIGludHJvZHVjdGlvbiBvZiBJT01N
VXMsCj4+IGJ1dCB0aGUgaW50ZXJhY3Rpb24gaXNzdWUgd2FzIHByZXN1bWFibHkgbWFza2VkIGJ5
Cj4+IGlycV9ndWVzdF9lb2lfdGltZXJfZm4oKSBmcmVxdWVudGx5IEVPSS1pbmcgaW50ZXJydXB0
cyB3YXkgdG9vIGVhcmx5Cj4+ICh3aGljaCBnb3QgZml4ZWQgYnkgMzU5Y2Y2ZjhhMGVjIFsieDg2
L0lSUTogZG9uJ3Qga2VlcCBFT0kgdGltZXIKPj4gcnVubmluZyB3aXRob3V0IG5lZWQiXSkuCj4+
Cj4+IFRoZSBwcm9ibGVtIGlzIHRoYXQgd2l0aCB1cyByZS1lbmFibGluZyBpbnRlcnJ1cHRzIGFj
cm9zcyBoYW5kbGVyCj4+IGludm9jYXRpb24sIGEgaGlnaGVyIHByaW9yaXR5IChndWVzdCkgaW50
ZXJydXB0IG1heSB0cmlnZ2VyIHdoaWxlCj4+IGhhbmRsaW5nIGEgbG93ZXIgcHJpb3JpdHkgKGlu
dGVybmFsKSBvbmUuIFRoZSBFT0kgaXNzdWVkIGZyb20KPj4gLT5lbmQoKSAoZm9yIEFDS1RZUEVf
RU9JIGtpbmQgaW50ZXJydXB0cykgd291bGQgdGhlbiBtaXN0YWtlbmx5Cj4+IEVPSSB0aGUgaGln
aGVyIHByaW9yaXR5IChndWVzdCkgaW50ZXJydXB0LCBicmVha2luZyAoYW1vbmcgb3RoZXIKPj4g
dGhpbmdzKSBwZW5kaW5nIEVPSSBzdGFjayBsb2dpYydzIGFzc3VtcHRpb25zLgo+Pgo+PiBOb3Rl
czoKPj4KPj4gLSBJbiBwcmluY2lwbGUgd2UgY291bGQgZ2V0IGF3YXkgd2l0aG91dCB0aGUgY2hl
Y2tfZW9pX2RlZmVycmFsIGZsYWcuCj4+ICAgIEkndmUgaW50cm9kdWNlZCBpdCBqdXN0IHRvIG1h
a2Ugc3VyZSB0aGVyZSdzIGFzIGxpdHRsZSBjaGFuZ2UgYXMKPj4gICAgcG9zc2libGUgdG8gdW5h
ZmZlY3RlZCBwYXRocy4KPj4gLSBTaW1pbGFybHkgdGhlIGNwdV9oYXNfcGVuZGluZ19hcGljX2Vv
aSgpIGNoZWNrIGluIGRvX0lSUSgpIGlzbid0Cj4+ICAgIHN0cmljdGx5IG5lY2Vzc2FyeS4KPj4g
LSBUaGUgbmV3IGZ1bmN0aW9uJ3MgbmFtZSBpc24ndCB2ZXJ5IGhlbHBmdWwgd2l0aCBpdHMgdXNl
IGluCj4+ICAgIGVuZF9sZXZlbF9pb2FwaWNfaXJxX25ldygpLiBJIGRpZCBhbHNvIGNvbnNpZGVy
IGVvaV9BUElDX2lycSgpICh0bwo+PiAgICBwYXJhbGxlbCBhY2tfQVBJQ19pcnEoKSksIGJ1dCB0
aGVuIGxpa2VkIHRoaXMgZXZlbiBsZXNzLgo+PiAtIE90aGVyIHRoYW4gSSBmaXJzdCB0aG91Z2h0
IHNlcmlhbCBjb25zb2xlIElSUXMgc2hvdWxkbid0IGJlCj4+ICAgIGFmZmVjdGVkLCBhcyB3ZSBy
dW4gdGhlbSBvbiBzcGVjaWZpY2FsbHkgYWxsb2NhdGVkIGhpZ2ggcHJpb3JpdHkKPj4gICAgdmVj
dG9ycy4KPj4KPj4gUmVwb3J0ZWQtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBj
aXRyaXguY29tPgo+PiBEaWFnbm9zZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KPiAKPiBJbiBjYXNlIGl0J3Mgbm90IGV4cGxpY2l0IGVub3VnaCBmcm9tIHRoZSBkZXNj
cmlwdGlvbjogV2hpbGUgdGhlCj4gaXNzdWUgYXBwZWFycyB0byBiZSBsb25nIHN0YW5kaW5nLCBp
dCBsb29rcyB0byBoYXZlIGJlZW4gbWFza2VkCj4gYnkgb3RoZXIgc2hvcnRjb21pbmdzIHByaW9y
IHRvIDQuMTMuIFRoZXJlZm9yZSB0aGlzIHNob3VsZCBiZQo+IGNvbnNpZGVyZWQgYXQgbGVhc3Qg
YSBwZXJjZWl2ZWQgcmVncmVzc2lvbiwgZXZlbiBpZiBpdCBtYXkgbm90Cj4gc3RyaWN0bHkgYmUg
b25lLgoKQXNzdW1pbmcgYW4gQWNrOiBpbiBhIHRpbWVseSBtYW5uZXI6CgpSZWxlYXNlLWFja2Vk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
