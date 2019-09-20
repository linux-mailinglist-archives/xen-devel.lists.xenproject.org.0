Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC67B94F4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 18:10:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBLSF-0006xP-LW; Fri, 20 Sep 2019 16:08:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBLSE-0006xK-Ki
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 16:08:18 +0000
X-Inumbo-ID: daff5ed0-dbc0-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id daff5ed0-dbc0-11e9-978d-bc764e2007e4;
 Fri, 20 Sep 2019 16:08:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1925AAB9B;
 Fri, 20 Sep 2019 16:08:16 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-29-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6e3467cf-4a96-032d-f568-b6dd2e3cfce1@suse.com>
Date: Fri, 20 Sep 2019 18:08:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914085251.18816-29-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 28/47] xen/sched: add code to sync
 scheduling of all vcpus of a sched unit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL3NjaGVkdWxlLmMKPiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBAQCAtNTUsNiAr
NTUsOSBAQCBib29sZWFuX3BhcmFtKCJzY2hlZF9zbXRfcG93ZXJfc2F2aW5ncyIsIHNjaGVkX3Nt
dF9wb3dlcl9zYXZpbmdzKTsKPiAgaW50IHNjaGVkX3JhdGVsaW1pdF91cyA9IFNDSEVEX0RFRkFV
TFRfUkFURUxJTUlUX1VTOwo+ICBpbnRlZ2VyX3BhcmFtKCJzY2hlZF9yYXRlbGltaXRfdXMiLCBz
Y2hlZF9yYXRlbGltaXRfdXMpOwo+ICAKPiArLyogTnVtYmVyIG9mIHZjcHVzIHBlciBzdHJ1Y3Qg
c2NoZWRfdW5pdC4gKi8KPiArc3RhdGljIHVuc2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IHNjaGVk
X2dyYW51bGFyaXR5ID0gMTsKCkRpZG4ndCB5b3UgaW5kaWNhdGUgZWFybGllciB0aGF0IHRoaXMg
d291bGQgYmUgYSBwZXItcG9vbCBwcm9wZXJ0eT8KT3Igd2FzIHRoYXQganVzdCBhIGxvbmdlciB0
ZXJtIHBsYW4/Cgo+ICsvKgo+ICsgKiBSZW5kZXp2b3VzIGJlZm9yZSB0YWtpbmcgYSBzY2hlZHVs
aW5nIGRlY2lzaW9uLgo+ICsgKiBDYWxsZWQgd2l0aCBzY2hlZHVsZSBsb2NrIGhlbGQsIHNvIGFs
bCBhY2Nlc3NlcyB0byB0aGUgcmVuZGV6dm91cyBjb3VudGVyCj4gKyAqIGNhbiBiZSBub3JtYWwg
b25lcyAobm8gYXRvbWljIGFjY2Vzc2VzIG5lZWRlZCkuCj4gKyAqIFRoZSBjb3VudGVyIGlzIGlu
aXRpYWxpemVkIHRvIHRoZSBudW1iZXIgb2YgY3B1cyB0byByZW5kZXp2b3VzIGluaXRpYWxseS4K
PiArICogRWFjaCBjcHUgZW50ZXJpbmcgd2lsbCBkZWNyZW1lbnQgdGhlIGNvdW50ZXIuIEluIGNh
c2UgdGhlIGNvdW50ZXIgYmVjb21lcwo+ICsgKiB6ZXJvIGRvX3NjaGVkdWxlKCkgaXMgY2FsbGVk
IGFuZCB0aGUgcmVuZGV6dm91cyBjb3VudGVyIGZvciBsZWF2aW5nCj4gKyAqIGNvbnRleHRfc3dp
dGNoKCkgaXMgc2V0LiBBbGwgb3RoZXIgbWVtYmVycyB3aWxsIHdhaXQgdW50aWwgdGhlIGNvdW50
ZXIgaXMKPiArICogYmVjb21pbmcgemVybywgZHJvcHBpbmcgdGhlIHNjaGVkdWxlIGxvY2sgaW4g
YmV0d2Vlbi4KPiArICovCgpUaGlzIHJlY3VycmluZyBsb2NrL3VubG9jayBpcyBsaWFibGUgdG8g
Y2F1c2UgYSBtYXNzaXZlIGNhY2hlIGxpbmUKcGluZy1wb25nLCBlc3BlY2lhbGx5IGZvciBzb2Nr
ZXQgb3Igbm9kZSBzY2hlZHVsaW5nLiBJbnN0ZWFkIG9mCmp1c3QgYSBjcHVfcmVsYXgoKSBiZXR3
ZWVuIHRoZSBtYWluIHVubG9jayBhbmQgcmUtbG9jaywgY291bGQgdGhlcmUKcGVyaGFwcyBiZSBs
b2NrLWxlc3MgY2hlY2tzIHRvIGRldGVybWluZSB3aGV0aGVyIHRoZXJlJ3MgYW55IHBvaW50CmF0
IGFsbCByZS1hY3F1aXJpbmcgdGhlIGxvY2s/Cgo+ICtzdGF0aWMgdm9pZCBzY2hlZHVsZSh2b2lk
KQo+ICt7Cj4gKyAgICBzdHJ1Y3QgdmNwdSAgICAgICAgICAqdm5leHQsICp2cHJldiA9IGN1cnJl
bnQ7Cj4gKyAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAgICAqcHJldiA9IHZwcmV2LT5zY2hlZF91bml0
LCAqbmV4dCA9IE5VTEw7Cj4gKyAgICBzX3RpbWVfdCAgICAgICAgICAgICAgbm93Owo+ICsgICAg
c3RydWN0IHNjaGVkX3Jlc291cmNlICpzZDsKPiArICAgIHNwaW5sb2NrX3QgICAgICAgICAgICps
b2NrOwo+ICsgICAgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKPiArCj4gKyAgICBBU1NF
UlRfTk9UX0lOX0FUT01JQygpOwo+ICsKPiArICAgIFNDSEVEX1NUQVRfQ1JBTksoc2NoZWRfcnVu
KTsKPiArCj4gKyAgICBzZCA9IGdldF9zY2hlZF9yZXMoY3B1KTsKPiArCj4gKyAgICBsb2NrID0g
cGNwdV9zY2hlZHVsZV9sb2NrX2lycShjcHUpOwo+ICsKPiArICAgIGlmICggcHJldi0+cmVuZGV6
dm91c19pbl9jbnQgKQo+ICsgICAgewo+ICsgICAgICAgIC8qCj4gKyAgICAgICAgICogV2UgaGF2
ZSBhIHJhY2U6IHNjaGVkX3NsYXZlKCkgc2hvdWxkIGJlIGNhbGxlZCwgc28gcmFpc2UgYSBzb2Z0
aXJxCj4gKyAgICAgICAgICogaW4gb3JkZXIgdG8gcmUtZW50ZXIgc2NoZWR1bGUoKSBsYXRlciBh
bmQgY2FsbCBzY2hlZF9zbGF2ZSgpIG5vdy4KPiArICAgICAgICAgKi8KPiArICAgICAgICBwY3B1
X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgY3B1KTsKPiArCj4gKyAgICAgICAgcmFpc2Vfc29m
dGlycShTQ0hFRFVMRV9TT0ZUSVJRKTsKPiArICAgICAgICByZXR1cm4gc2NoZWRfc2xhdmUoKTsK
PiArICAgIH0KPiArCj4gKyAgICBub3cgPSBOT1coKTsKPiArCj4gKyAgICBzdG9wX3RpbWVyKCZz
ZC0+c190aW1lcik7CgpJcyB0aGUgb3JkZXIgb2YgdGhlc2UgdHdvIHJlbGV2YW50PyBBIHdoaWxl
IGFnbyB0aGVyZSB3ZXJlIGEgY291cGxlCm9mIGNoYW5nZXMgbW92aW5nIHN1Y2ggTk9XKCkgaW52
b2NhdGlvbnMgcGFzdCBhbnl0aGluZyB0aGF0IG1heSB0YWtlCm5vbi1uZWdsaWdpYmxlIHRpbWUs
IHRvIG1ha2UgYWNjb3VudGluZyBhcyBhY2N1cmF0ZSBhcyBwb3NzaWJsZS4KCj4gLS0tIGEveGVu
L2luY2x1ZGUveGVuL3NvZnRpcnEuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zb2Z0aXJxLmgK
PiBAQCAtNCw2ICs0LDcgQEAKPiAgLyogTG93LWxhdGVuY3kgc29mdGlycXMgY29tZSBmaXJzdCBp
biB0aGUgZm9sbG93aW5nIGxpc3QuICovCj4gIGVudW0gewo+ICAgICAgVElNRVJfU09GVElSUSA9
IDAsCj4gKyAgICBTQ0hFRF9TTEFWRV9TT0ZUSVJRLAo+ICAgICAgU0NIRURVTEVfU09GVElSUSwK
PiAgICAgIE5FV19UTEJGTFVTSF9DTE9DS19QRVJJT0RfU09GVElSUSwKPiAgICAgIFJDVV9TT0ZU
SVJRLAoKU2VlaW5nIHRoZSBjb21tZW50LCBpcyB0aGUgaW5zZXJ0aW9uIHlvdSBkbyBhcyB3ZWxs
IGFzIHRoZSBwcmUtCmV4aXN0aW5nIHBsYWNlbWVudCBvZiBTQ0hFRFVMRV9TT0ZUSVJRIHN0aWxs
IGFwcHJvcHJpYXRlIHdpdGgKdGhlIHJlbmRlenZvdXMtaW5nIHlvdSBpbnRyb2R1Y2U/CgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
