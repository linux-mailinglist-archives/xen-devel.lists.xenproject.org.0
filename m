Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EF410B319
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 17:22:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia03a-0006SZ-K8; Wed, 27 Nov 2019 16:20:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ia03Z-0006SU-4L
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 16:20:45 +0000
X-Inumbo-ID: dc8112a2-1131-11ea-9db0-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc8112a2-1131-11ea-9db0-bc764e2007e4;
 Wed, 27 Nov 2019 16:20:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3A2E3B1BE;
 Wed, 27 Nov 2019 16:20:43 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>
References: <20191127143711.4377-1-pdurrant@amazon.com>
 <31090dd0-a8e5-7716-40a6-0e72de7f7934@suse.com>
 <a644007e77374b90b5abf11a76b2331d@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d581a826-0959-1e8e-f78f-65a0f10b4b65@suse.com>
Date: Wed, 27 Nov 2019 17:20:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a644007e77374b90b5abf11a76b2331d@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] Rationalize max_grant_frames and
 max_maptrack_frames handling
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMjAxOSAxNzoxNCwgIER1cnJhbnQsIFBhdWwgIHdyb3RlOgo+PiBGcm9tOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IFNlbnQ6IDI3IE5vdmVtYmVyIDIwMTkgMTU6
NTYKPj4KPj4gT24gMjcuMTEuMjAxOSAxNTozNywgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4gLS0t
IGEveGVuL2FyY2gvYXJtL3NldHVwLmMKPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4+
PiBAQCAtNzg5LDcgKzc4OSw3IEBAIHZvaWQgX19pbml0IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25n
Cj4+IGJvb3RfcGh5c19vZmZzZXQsCj4+PiAgICAgICAgICAuZmxhZ3MgPSBYRU5fRE9NQ1RMX0NE
Rl9odm0gfCBYRU5fRE9NQ1RMX0NERl9oYXAsCj4+PiAgICAgICAgICAubWF4X2V2dGNobl9wb3J0
ID0gLTEsCj4+PiAgICAgICAgICAubWF4X2dyYW50X2ZyYW1lcyA9IGdudHRhYl9kb20wX2ZyYW1l
cygpLAo+Pj4gLSAgICAgICAgLm1heF9tYXB0cmFja19mcmFtZXMgPSBvcHRfbWF4X21hcHRyYWNr
X2ZyYW1lcywKPj4+ICsgICAgICAgIC5tYXhfbWFwdHJhY2tfZnJhbWVzID0gLTEsCj4+PiAgICAg
IH07Cj4+PiAgICAgIGludCByYzsKPj4+Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYwo+
Pj4gKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKPj4+IEBAIC02OTcsOCArNjk3LDggQEAgdm9p
ZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZwo+PiBtYmlfcCkKPj4+
ICAgICAgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIGRvbTBfY2ZnID0gewo+Pj4gICAg
ICAgICAgLmZsYWdzID0gSVNfRU5BQkxFRChDT05GSUdfVEJPT1QpID8gWEVOX0RPTUNUTF9DREZf
czNfaW50ZWdyaXR5Cj4+IDogMCwKPj4+ICAgICAgICAgIC5tYXhfZXZ0Y2huX3BvcnQgPSAtMSwK
Pj4+IC0gICAgICAgIC5tYXhfZ3JhbnRfZnJhbWVzID0gb3B0X21heF9ncmFudF9mcmFtZXMsCj4+
PiAtICAgICAgICAubWF4X21hcHRyYWNrX2ZyYW1lcyA9IG9wdF9tYXhfbWFwdHJhY2tfZnJhbWVz
LAo+Pj4gKyAgICAgICAgLm1heF9ncmFudF9mcmFtZXMgPSAtMSwKPj4+ICsgICAgICAgIC5tYXhf
bWFwdHJhY2tfZnJhbWVzID0gLTEsCj4+PiAgICAgIH07Cj4+Cj4+IFdpdGggdGhlc2UgdGhlcmUn
cyBubyBuZWVkIGFueW1vcmUgZm9yIG9wdF9tYXhfbWFwdHJhY2tfZnJhbWVzIHRvCj4+IGJlIG5v
bi1zdGF0aWMuIFNhZGx5IEFybSBzdGlsbCB3YW50cyBvcHRfbWF4X2dyYW50X2ZyYW1lcwo+PiBh
Y2Nlc3NpYmxlIGluIGdudHRhYl9kb20wX2ZyYW1lcygpLgo+IAo+IFllcywgSSB3YXMgYWJvdXQg
dG8gbWFrZSB0aGVtIHN0YXRpYyB1bnRpbCBJIHNhdyB3aGF0IHRoZSBBUk0gY29kZSBkaWQuCgpC
dXQgdGhlIG9uZSB0aGF0IEFybSBkb2Vzbid0IG5lZWQgc2hvdWxkIGJlY29tZSBzdGF0aWMgbm93
LgoKPj4+IC0tLSBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+Pj4gKysrIGIveGVuL2NvbW1v
bi9ncmFudF90YWJsZS5jCj4+PiBAQCAtMTgzNywxMiArMTgzNywxOCBAQCBhY3RpdmVfYWxsb2Nf
ZmFpbGVkOgo+Pj4gICAgICByZXR1cm4gLUVOT01FTTsKPj4+ICB9Cj4+Pgo+Pj4gLWludCBncmFu
dF90YWJsZV9pbml0KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBtYXhfZ3JhbnRfZnJh
bWVzLAo+Pj4gLSAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBtYXhfbWFwdHJhY2tf
ZnJhbWVzKQo+Pj4gK2ludCBncmFudF90YWJsZV9pbml0KHN0cnVjdCBkb21haW4gKmQsIGludCBt
YXhfZ3JhbnRfZnJhbWVzLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGludCBtYXhfbWFwdHJh
Y2tfZnJhbWVzKQo+Pj4gIHsKPj4+ICAgICAgc3RydWN0IGdyYW50X3RhYmxlICpndDsKPj4+ICAg
ICAgaW50IHJldCA9IC1FTk9NRU07Cj4+Pgo+Pj4gKyAgICAvKiBEZWZhdWx0IHRvIG1heGltdW0g
dmFsdWUgaWYgbm8gdmFsdWUgd2FzIHNwZWNpZmllZCAqLwo+Pj4gKyAgICBpZiAoIG1heF9ncmFu
dF9mcmFtZXMgPCAwICkKPj4+ICsgICAgICAgIG1heF9ncmFudF9mcmFtZXMgPSBvcHRfbWF4X2dy
YW50X2ZyYW1lczsKPj4+ICsgICAgaWYgKCBtYXhfbWFwdHJhY2tfZnJhbWVzIDwgMCApCj4+PiAr
ICAgICAgICBtYXhfbWFwdHJhY2tfZnJhbWVzID0gb3B0X21heF9tYXB0cmFja19mcmFtZXM7Cj4+
PiArCj4+PiAgICAgIGlmICggbWF4X2dyYW50X2ZyYW1lcyA8IElOSVRJQUxfTlJfR1JBTlRfRlJB
TUVTIHx8Cj4+Cj4+IEkgdGFrZSBpdCB3ZSBkb24ndCBleHBlY3QgcGVvcGxlIHRvIHNwZWNpZnkg
Ml5eMzEgb3IgbW9yZQo+PiBmcmFtZXMgZm9yIGVpdGhlciBvcHRpb24uIEl0IGxvb2tzIGxpa2Ug
YWxtb3N0IGV2ZXJ5dGhpbmcKPj4gaGVyZSB3b3VsZCBjb3BlLCBleGNlcHQgZm9yIHRoaXMgdmVy
eSBjb21wYXJpc29uLiBOZXZlcnRoZWxlc3MKPj4gSSB3b25kZXIgd2hldGhlciB5b3Ugd291bGRu
J3QgYmV0dGVyIGNvbmZpbmUgYm90aCB2YWx1ZXMgdG8KPj4gWzAsIElOVF9NQVhdIG5vdywgaW5j
bHVkaW5nIHdoZW4gYWRqdXN0ZWQgYXQgcnVudGltZS4KPiAKPiBJIGNhbiBjZXJ0YWlubHkgcmVt
b3ZlIHRoZSAnVScgZnJvbSB0aGUgZGVmaW5pdGlvbiBvZgo+IElOSVRJQUxfTlJfR1JBTlRfRlJB
TUVTLAoKT2gsIEkgZGlkbid0IHBheSBhdHRlbnRpb24gdGhhdCBpcyBoYXMgYSBVIG9uIGl0IC0g
aW4gdGhpcyBjYXNlCnRoZSBjb21wYXJpc29uIGFib3ZlIGlzIGZpbmUuCgo+IGJ1dCBkbyB5b3Ug
d2FudCBtZSB0byBtYWtlIG9wdF9tYXhfZ3JhbnRfZnJhbWVzIGFuZAo+IG9wdF9tYXhfbWFwdHJh
Y2tfZnJhbWVzIGludG8gc2lnbmVkIGludHMgYW5kIGFkZCBzaWduZWQgcGFyc2VyCj4gY29kZSB0
b28/CgpEZWZpbml0ZWx5IG5vdC4gVGhleSBzaG91bGQgcmVtYWluIHVuc2lnbmVkIHF1YW50aXRp
ZXMsIGJ1dCB0aGVpcgp2YWx1ZXMgbWF5IG5lZWQgc2FuaXR5IGNoZWNraW5nIG5vdy4KCj4gSSBh
bHNvIGRvbid0IHVuZGVyc3RhbmQgdGhlICdhZGp1c3RlZCBhdCBydW50aW1lJyBwYXJ0LgoKV2Vs
bCwgZm9yIGEgY29tbWFuZCBsaW5lIGRyaXZlIHZhbHVlIHlvdSBjb3VsZCBhZGp1c3QgYW4gb3V0
IG9mCmJvdW5kcyB2YWx1ZSBpbiBzb21lIF9faW5pdCBmdW5jdGlvbi4gQnV0IGZvciBydW50aW1l
IG1vZGlmaWFibGUKc2V0dGluZ3MgeW91IHdvbid0IGdldCBhd2F5IHRoaXMgZWFzaWx5LgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
