Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B44B9E4B01
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 14:27:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNye1-0006FL-Kr; Fri, 25 Oct 2019 12:24:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNye0-0006FG-92
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 12:24:40 +0000
X-Inumbo-ID: 69df9d32-f722-11e9-94c7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69df9d32-f722-11e9-94c7-12813bfff9fa;
 Fri, 25 Oct 2019 12:24:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7B5C8AB7F;
 Fri, 25 Oct 2019 12:24:38 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-8-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <62c638c2-641e-c1c0-a9c3-8c48388289b5@suse.com>
Date: Fri, 25 Oct 2019 14:24:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023135812.21348-8-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 7/7] x86/nospec: Optimise
 array_index_mask_nospec() for power-of-2 arrays
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMjAxOSAxNTo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGlzIG9wdGltaXNh
dGlvbiBpcyBub3Qgc2FmZSBvbiBBUk0sIGJlY2F1c2Ugc29tZSBDUFVzIGRvIGRhdGEgdmFsdWUK
PiBzcGVjdWxhdGlvbiwgd2hpY2ggaXMgd2h5IHRoZSBDU0RCIGJhcnJlciB3YXMgaW50cm9kdWNl
ZC4KClNvIGlmIGFuIHg4NiBDUFUgYXBwZWFyZWQgd2hpY2ggZGlkIHNvIHRvbywgaXQgd291bGQg
aW1tZWRpYXRlbHkgYmUKdW5zYWZlIGFzIHdlbGwgYWl1aS4gSS5lLiB3ZSdkIGhhdmUgdG8gYWdh
aW4gZ28gYW5kIGZpeCB0aGUgbG9naWMuCk5vdCB0byBiZSB0YWtlbiBhcyBhbiBvdXRyaWdodCBv
YmplY3Rpb24sIGJ1dCB0byBwZXJoYXBzIHByb21wdApmdXJ0aGVyIGNvbnNpZGVyYXRpb24uCgo+
IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbm9zcGVjLmgKPiArKysgYi94ZW4vaW5jbHVkZS9h
c20teDg2L25vc3BlYy5oCj4gQEAgLTcsMTMgKzcsMjAgQEAKPiAgI2luY2x1ZGUgPGFzbS9hbHRl
cm5hdGl2ZS5oPgo+ICAKPiAgLyoqCj4gLSAqIGFycmF5X2luZGV4X21hc2tfbm9zcGVjKCkgLSBn
ZW5lcmF0ZSBhIG1hc2sgdGhhdCBpcyB+MFVMIHdoZW4gdGhlCj4gLSAqICAgICAgYm91bmRzIGNo
ZWNrIHN1Y2NlZWRzIGFuZCAwIG90aGVyd2lzZQo+ICsgKiBhcnJheV9pbmRleF9tYXNrX25vc3Bl
YygpIC0gZ2VuZXJhdGUgYSBtYXNrIHRvIGJvdW5kIGFuIGFycmF5IGluZGV4Cj4gKyAqIHdoaWNo
IGlzIHNhZmUgZXZlbiB1bmRlciBhZHZlcnNlIHNwZWN1bGF0aW9uLgo+ICAgKiBAaW5kZXg6IGFy
cmF5IGVsZW1lbnQgaW5kZXgKPiAgICogQHNpemU6IG51bWJlciBvZiBlbGVtZW50cyBpbiBhcnJh
eQo+ICAgKgo+IC0gKiBSZXR1cm5zOgo+ICsgKiBJbiBnZW5lcmFsLCByZXR1cm5zOgo+ICAgKiAg
ICAgMCAtIChpbmRleCA8IHNpemUpCj4gKyAqCj4gKyAqIFRoaXMgeWVpbGQgfjBVTCBpbiB3aXRo
aW4tYm91bmRzIGNhc2UsIGFuZCAwIGluIHRoZSBvdXQtb2YtYm91bmRzCgpOaXQ6ICJ5aWVsZHMi
PwoKPiBAQCAtMjEsOSArMjgsMTUgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGFycmF5
X2luZGV4X21hc2tfbm9zcGVjKHVuc2lnbmVkIGxvbmcgaW5kZXgsCj4gIHsKPiAgICAgIHVuc2ln
bmVkIGxvbmcgbWFzazsKPiAgCj4gLSAgICBhc20gdm9sYXRpbGUgKCAiY21wICVbc2l6ZV0sICVb
aW5kZXhdOyBzYmIgJVttYXNrXSwgJVttYXNrXTsiCj4gLSAgICAgICAgICAgICAgICAgICA6IFtt
YXNrXSAiPXIiIChtYXNrKQo+IC0gICAgICAgICAgICAgICAgICAgOiBbc2l6ZV0gImciIChzaXpl
KSwgW2luZGV4XSAiciIgKGluZGV4KSApOwo+ICsgICAgaWYgKCBfX2J1aWx0aW5fY29uc3RhbnRf
cChzaXplKSAmJiBJU19QT1dFUl9PRl8yKHNpemUpICkKPiArICAgIHsKPiArICAgICAgICBtYXNr
ID0gc2l6ZSAtIDE7Cj4gKyAgICAgICAgT1BUSU1JWkVSX0hJREVfVkFSKG1hc2spOwoKSSBjYW4n
dCBzZWVtIHRvIGJlIGFibGUgdG8gZmlndXJlIHdoeSB5b3UgbmVlZCB0aGlzLgoKPiAtLS0gYS94
ZW4vaW5jbHVkZS94ZW4vY29uZmlnLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vY29uZmlnLmgK
PiBAQCAtNzUsNiArNzUsNyBAQAo+ICAjZGVmaW5lIEdCKF9nYikgICAgIChfQUMoX2diLCBVTEwp
IDw8IDMwKQo+ICAKPiAgI2RlZmluZSBJU19BTElHTkVEKHZhbCwgYWxpZ24pICgoKHZhbCkgJiAo
KGFsaWduKSAtIDEpKSA9PSAwKQo+ICsjZGVmaW5lIElTX1BPV0VSX09GXzIodmFsKSAoKHZhbCkg
JiYgSVNfQUxJR05FRCh2YWwsIHZhbCkpCgpXaGlsZSB0aGUgcmlzayBtYXkgc2VlbSBsb3cgZm9y
IHNvbWVvbmUgdG8gcGFzcyBhbiBleHByZXNzaW9uIHdpdGgKc2lkZSBlZmZlY3QgaGVyZSwgZXZh
bHVhdGluZyAidmFsIiB1cCB0byB0aHJlZSB0aW1lcyBoZXJlIGRvZXNuJ3QKbG9vayB2ZXJ5IGRl
c2lyYWJsZS4KCkFzIGEgbWlub3IgcmVtYXJrLCB3aXRob3V0IGNvbnNpZGVyaW5nIHJlcHJlc2Vu
dGF0aW9uIEknZCBleHBlY3QKYW4gZXhwcmVzc2lvbiBJU19BTElHTkVEKHZhbCwgdmFsKSB0byBj
b25zaXN0ZW50bHkgcHJvZHVjZSAidHJ1ZSIKZm9yIGFsbCBub24temVybyB2YWx1ZXMuIEUuZy4g
MyBpcyBjZXJ0YWlubHkgImFsaWduZWQiIG9uIGEKYm91bmRhcnkgb2YgMy4KCkZpbmFsbHkgdGhp
cyBtYXkgd2FudCBndWFyZGluZyBhZ2FpbnN0IHVzZSBvbiBzaWduZWQgdHlwZXMgLSBhdAp0aGUg
dmVyeSBsZWFzdCBpdCBsb29rcyB0byBwcm9kdWNlIHRoZSB3cm9uZyBhbnN3ZXIgZm9yIGUuZy4K
SU5UX01JTiBvciBMT05HX01JTi4gSS5lLiBwZXJoYXBzIHRoZSBleHByZXNzaW9uIHRvIHRoZSBs
ZWZ0IG9mCiYmIHdhbnRzIHRvIGJlICh2YWwpID4gMC4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
