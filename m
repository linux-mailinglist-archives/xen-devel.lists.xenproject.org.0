Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FED13B04E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 18:05:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irPaD-0007Wo-3H; Tue, 14 Jan 2020 17:02:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irPaB-0007Wj-DS
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 17:02:23 +0000
X-Inumbo-ID: 9ca39d2e-36ef-11ea-b89f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ca39d2e-36ef-11ea-b89f-bc764e2007e4;
 Tue, 14 Jan 2020 17:02:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 987BAAEC4;
 Tue, 14 Jan 2020 17:02:13 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200113175020.32730-1-andrew.cooper3@citrix.com>
 <20200113175020.32730-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c8b1dd46-5873-aec8-de72-402aa74727f2@suse.com>
Date: Tue, 14 Jan 2020 18:02:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200113175020.32730-6-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] x86/boot: Size the boot/directmap
 mappings dynamically
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDEuMjAyMCAxODo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYvYm9vdC9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKPiBAQCAt
Njg3LDE0ICs2ODcsMTkgQEAgdHJhbXBvbGluZV9zZXR1cDoKPiAgICAgICAgICAgKiBoYW5kbGlu
Zy93YWxraW5nKSwgYW5kIGlkZW50aXR5IG1hcCBYZW4gaW50byBib290bWFwIChuZWVkZWQgZm9y
Cj4gICAgICAgICAgICogdGhlIHRyYW5zaXRpb24gaW50byBsb25nIG1vZGUpLCB1c2luZyAyTSBz
dXBlcnBhZ2VzLgo+ICAgICAgICAgICAqLwo+IC0gICAgICAgIGxlYSAgICAgc3ltX2VzaShzdGFy
dCksJWVieAo+IC0gICAgICAgIGxlYSAgICAgKDE8PEwyX1BBR0VUQUJMRV9TSElGVCkqNysoUEFH
RV9IWVBFUlZJU09SX1JXWHxfUEFHRV9QU0UpKCVlYngpLCVlYXgKPiAtICAgICAgICBzaHIgICAg
ICQoTDJfUEFHRVRBQkxFX1NISUZULTMpLCVlYngKPiAtICAgICAgICBtb3YgICAgICQ4LCVlY3gK
PiAtMTogICAgICBtb3YgICAgICVlYXgsc3ltX2ZzKGwyX2Jvb3RtYXApLTgoJWVieCwlZWN4LDgp
Cj4gLSAgICAgICAgbW92ICAgICAlZWF4LHN5bV9mcyhsMl9kaXJlY3RtYXApLTgoJWVieCwlZWN4
LDgpCj4gLSAgICAgICAgc3ViICAgICAkKDE8PEwyX1BBR0VUQUJMRV9TSElGVCksJWVheAo+IC0g
ICAgICAgIGxvb3AgICAgMWIKPiArICAgICAgICBsZWEgICAgIHN5bV9lc2koX3N0YXJ0KSwgJWVj
eAo+ICsgICAgICAgIGxlYSAgICAgLTEgKyBzeW1fZXNpKF9lbmQpLCAlZWR4CgpUaGlzIGxvb2tz
IHByZXR0eSBvZGQgLSBkb2VzCgogICAgICAgIGxlYSAgICAgc3ltX2VzaShfZW5kKSAtIDEsICVl
ZHgKCm5vdCB3b3JrPwoKPiArICAgICAgICBsZWEgICAgIF9QQUdFX1BTRSArIFBBR0VfSFlQRVJW
SVNPUl9SV1goJWVjeCksICVlYXggLyogUFRFIHRvIHdyaXRlLiAqLwo+ICsgICAgICAgIHNociAg
ICAgJEwyX1BBR0VUQUJMRV9TSElGVCwgJWVjeCAgICAgICAgICAgICAgICAgICAvKiBGaXJzdCBz
bG90IHRvIHdyaXRlLiAqLwo+ICsgICAgICAgIHNociAgICAgJEwyX1BBR0VUQUJMRV9TSElGVCwg
JWVkeCAgICAgICAgICAgICAgICAgICAvKiBGaW5hbCBzbG90IHRvIHdyaXRlLiAqLwo+ICsKPiAr
MTogICAgICBtb3YgICAgICVlYXgsIHN5bV9vZmZzKGwyX2Jvb3RtYXApICAoJWVzaSwgJWVjeCwg
OCkKPiArICAgICAgICBtb3YgICAgICVlYXgsIHN5bV9vZmZzKGwyX2RpcmVjdG1hcCkoJWVzaSwg
JWVjeCwgOCkKCkkgZ3Vlc3MgSSBjb3VsZCBoYXZlIG5vdGljZWQgdGhpcyBvbiB0aGUgcHJldmlv
dXMgcGF0Y2ggYWxyZWFkeToKVGhpcyB3b3VsZCBsb29rIGJldHRlciBhcwoKMTogICAgICBtb3Yg
ICAgICVlYXgsIHN5bV9lc2kobDJfYm9vdG1hcCwgICAlZWN4LCA4KQogICAgICAgIG1vdiAgICAg
JWVheCwgc3ltX2VzaShsMl9kaXJlY3RtYXAsICVlY3gsIDgpCgpDYW4gc3ltX2VzaSgpIHBlcmhh
cHMgYmUgbWFkZQoKI2RlZmluZSBzeW1fZXNpKHN5bSwgZXh0cmEuLi4pICAgICAgc3ltX29mZnMo
c3ltKSglZXNpLCAjIyBleHRyYSkKCj8KCj4gLS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+
ICsrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKPiBAQCAtMzg0LDYgKzM4NCwzIEBAIEFTU0VS
VCgodHJhbXBvbGluZV9lbmQgLSB0cmFtcG9saW5lX3N0YXJ0KSA8IFRSQU1QT0xJTkVfU1BBQ0Ug
LSBNQklfU1BBQ0VfTUlOLAo+ICAgICAgIm5vdCBlbm91Z2ggcm9vbSBmb3IgdHJhbXBvbGluZSBh
bmQgbWJpIGRhdGEiKQo+ICBBU1NFUlQoKHdha2V1cF9zdGFjayAtIHdha2V1cF9zdGFja19zdGFy
dCkgPj0gV0FLRVVQX1NUQUNLX01JTiwKPiAgICAgICJ3YWtldXAgc3RhY2sgdG9vIHNtYWxsIikK
PiAtCj4gLS8qIFBsZW50eSBvZiBib290IGNvZGUgYXNzdW1lcyB0aGF0IFhlbiBpc24ndCBsYXJn
ZXIgdGhhbiAxNk0uICovCj4gLUFTU0VSVChfZW5kIC0gX3N0YXJ0IDw9IE1CKDE2KSwgIlhlbiB0
b28gbGFyZ2UgZm9yIGVhcmx5LWJvb3QgYXNzdW1wdGlvbnMiKQoKRm9sbG93aW5nIHlvdXIgcmVw
bHkgdG8gdGhlIGNvdmVyIGxldHRlciwgdGhpcyBjYW4ndCBiZSBkcm9wcGVkIGp1c3QgeWV0LgpF
dmVuIHdoZW4gdGhhdCByZW1haW5pbmcgaXNzdWUgZ290IGFkZHJlc3NlZCwgSSB0aGluayBpdCB3
b3VsZCBiZSBiZXR0ZXIKdG8ga2VlcCBpdCwgYWx0ZXJpbmcgdGhlIGJvdW5kIHRvIEdCKDEpLgoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
