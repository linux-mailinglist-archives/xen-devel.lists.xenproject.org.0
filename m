Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D68B10CA4F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 15:22:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaKe3-0005Oa-Fb; Thu, 28 Nov 2019 14:19:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaKe2-0005OV-1P
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 14:19:46 +0000
X-Inumbo-ID: 1fbffad4-11ea-11ea-a3d2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fbffad4-11ea-11ea-a3d2-12813bfff9fa;
 Thu, 28 Nov 2019 14:19:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 85B1CB15F;
 Thu, 28 Nov 2019 14:19:43 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7f82e319-1891-ec36-dcf0-e94253ba04a5@suse.com>
 <20191128113904.GU980@Air-de-Roger>
 <ca1d09ba-9cf3-346a-2b26-ae08d20f9133@suse.com>
 <20191128141328.GV980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c949cacc-5ba7-d93f-7e08-f49c528431b0@suse.com>
Date: Thu, 28 Nov 2019 15:19:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191128141328.GV980@Air-de-Roger>
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
Cc: Juergen Gross <jgross@suse.com>, AndrewCooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAxNToxMywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVGh1LCBO
b3YgMjgsIDIwMTkgYXQgMDI6MzM6MDhQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDI4LjExLjIwMTkgMTI6MzksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBUaHUsIE5v
diAyOCwgMjAxOSBhdCAxMjowMzo0N1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBB
dCB0aGUgdGltZSB0aGUgcGVuZGluZyBFT0kgc3RhY2sgd2FzIGludHJvZHVjZWQgdGhlcmUgd2Vy
ZSBubwo+Pj4+IGludGVybmFsbHkgdXNlZCBJUlFzIHdoaWNoIHdvdWxkIGhhdmUgdGhlIExBUElD
IEVPSSBpc3N1ZWQgZnJvbSB0aGUKPj4+PiAtPmVuZCgpIGhvb2suIFRoaXMgaGFkIHRoZW4gY2hh
bmdlZCB3aXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2YgSU9NTVVzLAo+Pj4+IGJ1dCB0aGUgaW50ZXJh
Y3Rpb24gaXNzdWUgd2FzIHByZXN1bWFibHkgbWFza2VkIGJ5Cj4+Pj4gaXJxX2d1ZXN0X2VvaV90
aW1lcl9mbigpIGZyZXF1ZW50bHkgRU9JLWluZyBpbnRlcnJ1cHRzIHdheSB0b28gZWFybHkKPj4+
PiAod2hpY2ggZ290IGZpeGVkIGJ5IDM1OWNmNmY4YTBlYyBbIng4Ni9JUlE6IGRvbid0IGtlZXAg
RU9JIHRpbWVyCj4+Pj4gcnVubmluZyB3aXRob3V0IG5lZWQiXSkuCj4+Pj4KPj4+PiBUaGUgcHJv
YmxlbSBpcyB0aGF0IHdpdGggdXMgcmUtZW5hYmxpbmcgaW50ZXJydXB0cyBhY3Jvc3MgaGFuZGxl
cgo+Pj4+IGludm9jYXRpb24sIGEgaGlnaGVyIHByaW9yaXR5IChndWVzdCkgaW50ZXJydXB0IG1h
eSB0cmlnZ2VyIHdoaWxlCj4+Pj4gaGFuZGxpbmcgYSBsb3dlciBwcmlvcml0eSAoaW50ZXJuYWwp
IG9uZS4gVGhlIEVPSSBpc3N1ZWQgZnJvbQo+Pj4+IC0+ZW5kKCkgKGZvciBBQ0tUWVBFX0VPSSBr
aW5kIGludGVycnVwdHMpIHdvdWxkIHRoZW4gbWlzdGFrZW5seQo+Pj4+IEVPSSB0aGUgaGlnaGVy
IHByaW9yaXR5IChndWVzdCkgaW50ZXJydXB0LCBicmVha2luZyAoYW1vbmcgb3RoZXIKPj4+PiB0
aGluZ3MpIHBlbmRpbmcgRU9JIHN0YWNrIGxvZ2ljJ3MgYXNzdW1wdGlvbnMuCj4+Pgo+Pj4gTWF5
YmUgdGhlcmUncyBzb21ldGhpbmcgdGhhdCBJJ20gbWlzc2luZywgYnV0IHNob3VsZG4ndCBoeXBl
cnZpc29yCj4+PiB2ZWN0b3JzIGFsd2F5cyBiZSBoaWdoZXIgcHJpb3JpdHkgdGhhbiBndWVzdCBv
bmVzPwo+Pgo+PiBEZXBlbmRzIC0gSU9NTVUgb25lcyBpbW8gYXJlbid0IHNvbWV0aGluZyB0aGF0
IG5lZWRzIHVyZ2VudGx5Cj4+IGRlYWxpbmcgd2l0aCwgc28gYSBsaXR0bGUgYml0IG9mIGRlbGF5
IHdvbid0IGh1cnQuIFRoZXJlIHdvdWxkCj4+IG9ubHkgYmUgYSBwcm9ibGVtIGlmIHN1Y2ggaW50
ZXJydXB0cyBjb3VsZCBiZSBkZWZlcnJlZAo+PiBpbmRlZmluaXRlbHkuCj4+Cj4+PiBJIHNlZSB0
aGVyZSdzIGFscmVhZHkgYSByYW5nZSByZXNlcnZlZCBmb3IgaGlnaCBwcmlvcml0eSB2ZWN0b3Jz
Cj4+PiAoe0ZJUlNUL0xBU1R9X0hJUFJJT1JJVFlfVkVDVE9SKSwgd2hhdCdzIHRoZSByZWFzb24g
Zm9yIGh5cGVydmlzb3IKPj4+IGludGVycnVwdHMgbm90IHVzaW5nIHRoaXMgcmFuZ2U/Cj4+Cj4+
IFdlJ2QgcXVpY2tseSBydW4gb3V0IG9mIGhpZ2ggcHJpb3JpdHkgdmVjdG9ycyBvbiBzeXN0ZW1z
IHdpdGgKPj4gbXVsdGlwbGUgKGFuZCBwZXJoYXBzIGluZGVlZCBtYW55KSBJT01NVXMuCj4gCj4g
V2VsbCwgdGhlcmUncyBubyBsaW1pdCBvbiB0aGUgbnVtYmVyIG9mIGhpZ2ggcHJpb3JpdHkgdmVj
dG9ycywgc2luY2UKPiB0aGlzIGlzIGFsbCBhIHNvZnR3YXJlIGFic3RyYWN0aW9uLiBJdCBvbmx5
IG1hdHRlcnMgdGhhdCBzdWNoIHZlY3RvcnMKPiBhcmUgaGlnaGVyIHRoYW4gZ3Vlc3Qgb3duZWQg
b25lcy4KPiAKPiBJIGhhdmUgdG8gdGFrZSBhIGxvb2ssIGJ1dCBJIHdvdWxkIHRoaW5rIHRoYXQg
WGVuIHVzZWQgdmVjdG9ycyBhcmUgdGhlCj4gZmlyc3Qgb25lcyB0byBiZSBhbGxvY2F0ZWQsIGFu
ZCBoZW5jZSBjb3VsZCBzdGFydCBmcm9tCj4gRklSU1RfSElQUklPUklUWV9WRUNUT1IgLSAxIGFu
ZCBnbyBkb3duIGZyb20gdGhlcmUuCgpJZiB0aGlzIHdhcyB0aGUgY2FzZSwgdGhlbiB3ZSB3b3Vs
ZG4ndCBoYXZlIG9ic2VydmVkIHRoZSBpc3N1ZSAoZGVzcGl0ZQppdCBiZWluZyB0aGVyZSkgdGhp
cyBwYXRjaCB0cmllcyB0byBhZGRyZXNzLiBUaGUgSU9NTVVzIGZvciBib3RoIEFuZHJldwphbmQg
bWUgZW5kZWQgdXAgdXNpbmcgdmVjdG9yIDB4MjgsIGJlbG93IGV2ZXJ5dGhpbmcgdGhhdCBlLmcu
IHRoZQpJTy1BUElDIFJURSBnb3QgYXNzaWduZWQuIEFsc28gZG9uJ3QgZm9yZ2V0IHRoYXQgd2Ug
ZG9uJ3QgYWxsb2NhdGUKdmVjdG9ycyBjb250aW51b3VzbHksIGJ1dCBzdWNoIHRoYXQgdGhleSdk
IGdldCBzcHJlYWQgYWNyb3NzIHRoZQpkaWZmZXJlbnQgcHJpb3JpdHkgbGV2ZWxzLiAoV2hldGhl
ciB0aGF0J3MgYW4gYXdmdWxseSBnb29kIGlkZWEgaXMgYQpzZXBhcmF0ZSBxdWVzdGlvbi4pCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
