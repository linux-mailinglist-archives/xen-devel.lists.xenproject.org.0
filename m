Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFDF12F8FA
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 14:55:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inNNF-0000b4-Ea; Fri, 03 Jan 2020 13:52:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inNNE-0000az-I5
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 13:52:20 +0000
X-Inumbo-ID: 3d944ab2-2e30-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d944ab2-2e30-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 13:52:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 94071AD1A;
 Fri,  3 Jan 2020 13:52:10 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200102145953.6503-1-andrew.cooper3@citrix.com>
 <d8abd43b-ac91-9eef-3c34-394ed9842342@suse.com>
 <d6e7c26b-2233-b1da-d866-d470a5c110e4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5f6fff0a-d677-11e5-07ad-7e0250d29477@suse.com>
Date: Fri, 3 Jan 2020 14:52:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d6e7c26b-2233-b1da-d866-d470a5c110e4@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/boot: Clean up the trampoline
 transition into Long mode
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

T24gMDMuMDEuMjAyMCAxNDo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMy8wMS8yMDIw
IDEzOjM2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDIuMDEuMjAyMCAxNTo1OSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IEBAIC0xMTEsMjYgKzEwOSw2IEBAIHRyYW1wb2xpbmVfcHJvdG1v
ZGVfZW50cnk6Cj4+PiAgc3RhcnQ2NDoKPj4+ICAgICAgICAgIC8qIEp1bXAgdG8gaGlnaCBtYXBw
aW5ncy4gKi8KPj4+ICAgICAgICAgIG1vdmFicyAgJF9faGlnaF9zdGFydCwgJXJkaQo+Pj4gLQo+
Pj4gLSNpZmRlZiBDT05GSUdfSU5ESVJFQ1RfVEhVTksKPj4+IC0gICAgICAgIC8qCj4+PiAtICAg
ICAgICAgKiBJZiBib290aW5nIHZpcnR1YWxpc2VkLCBvciBob3Qtb25saW5pbmcgYSBDUFUsIHNp
YmxpbmcgdGhyZWFkcyBjYW4KPj4+IC0gICAgICAgICAqIGF0dGVtcHQgQnJhbmNoIFRhcmdldCBJ
bmplY3Rpb24gYWdhaW5zdCB0aGlzIGptcC4KPj4+IC0gICAgICAgICAqCj4+PiAtICAgICAgICAg
KiBXZSd2ZSBnb3Qgbm8gdXNhYmxlIHN0YWNrIHNvIGNhbid0IHVzZSBhIFJFVFBPTElORSB0aHVu
aywgYW5kIGFyZQo+Pj4gLSAgICAgICAgICogZnVydGhlciB0aGFuIGRpc3AzMiBmcm9tIHRoZSBo
aWdoIG1hcHBpbmdzIHNvIGNvdWxkbid0IHVzZQo+Pj4gLSAgICAgICAgICogSlVNUF9USFVOSyBl
dmVuIGlmIGl0IHdhcyBhIG5vbi1SRVRQT0xJTkUgdGh1bmsuICBGdXJ0aGVybW9yZSwgYW4KPj4+
IC0gICAgICAgICAqIExGRU5DRSBpc24ndCBuZWNlc3NhcmlseSBzYWZlIHRvIHVzZSBhdCB0aGlz
IHBvaW50Lgo+Pj4gLSAgICAgICAgICoKPj4+IC0gICAgICAgICAqIEFzIHRoaXMgaXNuJ3QgYSBo
b3RwYXRoLCB1c2UgYSBmdWxseSBzZXJpYWxpc2luZyBldmVudCB0byByZWR1Y2UKPj4+IC0gICAg
ICAgICAqIHRoZSBzcGVjdWxhdGlvbiB3aW5kb3cgYXMgbXVjaCBhcyBwb3NzaWJsZS4gICVlYngg
bmVlZHMgcHJlc2VydmluZwo+Pj4gLSAgICAgICAgICogZm9yIF9faGlnaF9zdGFydC4KPj4+IC0g
ICAgICAgICAqLwo+Pj4gLSAgICAgICAgbW92ICAgICAlZWJ4LCAlZXNpCj4+PiAtICAgICAgICBj
cHVpZAo+Pj4gLSAgICAgICAgbW92ICAgICAlZXNpLCAlZWJ4Cj4+PiAtI2VuZGlmCj4+PiAtCj4+
PiAgICAgICAgICBqbXBxICAgIColcmRpCj4+IEkgY2FuIHNlZSB0aGlzIGJlaW5nIHVubmVlZGVk
IHdoZW4gcnVubmluZyB2aXJ0dWFsaXplZCwgYXMgeW91IHNhaWQKPj4gaW4gcmVwbHkgdG8gV2Vp
LiBIb3dldmVyLCBmb3IgaG90LW9ubGluaW5nICh3aGVuIG90aGVyIENQVXMgbWF5IHJ1bgo+PiBy
YW5kb20gdkNQVS1zKSBJIGRvbid0IHNlZSBob3cgdGhpcyBjYW4gc2FmZWx5IGJlIGRyb3BwZWQu
IFRoZXJlJ3MKPj4gbm8gc2ltaWxhciBjb25jZXJuIGZvciBTMyByZXN1bWUsIGFzIHRoYXdfZG9t
YWlucygpIGhhcHBlbnMgb25seQo+PiBhZnRlciBlbmFibGVfbm9uYm9vdF9jcHVzKCkuCj4gCj4g
SSBjb3ZlcmVkIHRoYXQgaW4gdGhlIHNhbWUgcmVwbHkuwqAgQW55IGd1ZXN0IHdoaWNoIGNhbiB1
c2UgYnJhbmNoIHRhcmdldAo+IGluamVjdGlvbiBhZ2FpbnN0IHRoaXMgam1wIGNhbiBhbHNvIHBv
aXNvbiB0aGUgcmVndWxhciBicmFuY2ggcHJlZGljdG9yCj4gYW5kIGdldCBhdCBkYXRhIHRoYXQg
d2F5LgoKQXJlbid0IHlvdSBpbXBseWluZyB0aGVuIHRoYXQgcmV0cG9saW5lcyBjb3VsZCBhbHNv
IGJlIGRyb3BwZWQ/Cgo+IE9uY2UgYWdhaW4sIHdlIGdldCB0byBDUFUgSG90cGx1ZyBiZWluZyBh
biB1bnVzZWQgZmVhdHVyZSBpbiBwcmFjdGljZSwKPiB3aGljaCBpcyBjb21wbGV0ZWx5IGV2aWRl
bnQgbm93IHdpdGggSW50ZWwgTUNFIGJlaGF2aW91ci4KCldoYXQgZG9lcyBJbnRlbCdzIE1DRSBi
ZWhhdmlvciBoYXZlIHRvIGRvIHdpdGggd2hldGhlciBDUFUgaG90cGx1Zwoob3IgaG90LW9ubGlu
aW5nKSBpcyAodW4pdXNlZCBpbiBwcmFjdGljZT8KCj4gQSBndWVzdCBjYW4ndCBjb250cm9sL2d1
ZXNzIHdoZW4gYSBob3RwbHVnIGV2ZW4gbWlnaHQgb2NjdXIsIG9yIHdoZXJlCj4gZXhhY3RseSB0
aGlzIGJyYW5jaCBpcyBpbiBtZW1vcnkgKGFmdGVyIGFsbCAtIGl0IGlzIHZhcmlhYmxlIGJhc2Vk
IG9uCj4gdGhlIHBvc2l0aW9uIG9mIHRoZSB0cmFtcG9saW5lKSwgYW5kIGNvcmUgc2NoZWR1bGlu
ZyBtaXRpZ2F0ZXMgdGhlIHJpc2sKPiBlbnRpcmVseS4KCiIuLi4gd2lsbCBtaXRpZ2F0ZSAuLi4i
IC0gaXQncyBleHBlcmltZW50YWwgdXAgdG8gbm93LCBpc24ndCBpdD8KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
