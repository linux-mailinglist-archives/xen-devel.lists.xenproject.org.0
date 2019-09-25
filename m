Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D8ABDF0F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 15:34:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD7OP-0002ip-U9; Wed, 25 Sep 2019 13:31:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iD7OO-0002ib-20
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 13:31:40 +0000
X-Inumbo-ID: cd3b0b60-df98-11e9-9630-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id cd3b0b60-df98-11e9-9630-12813bfff9fa;
 Wed, 25 Sep 2019 13:31:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5E75AB609;
 Wed, 25 Sep 2019 13:31:37 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-41-jgross@suse.com>
 <eddf7994-8c09-7d79-bbf9-f1518deec03f@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e9fb3d10-1689-c5b1-7121-70ac331a3328@suse.com>
Date: Wed, 25 Sep 2019 15:31:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <eddf7994-8c09-7d79-bbf9-f1518deec03f@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 40/47] xen/sched: prepare per-cpupool
 scheduling granularity
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMTkgMTU6MzQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMTA6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vY3B1cG9vbC5jCj4+
ICsrKyBiL3hlbi9jb21tb24vY3B1cG9vbC5jCj4+IEBAIC0xNzUsNiArMTc1LDggQEAgc3RhdGlj
IHN0cnVjdCBjcHVwb29sICpjcHVwb29sX2NyZWF0ZSgKPj4gICAgICAgICAgICAgICByZXR1cm4g
TlVMTDsKPj4gICAgICAgICAgIH0KPj4gICAgICAgfQo+PiArICAgIGMtPmdyYW51bGFyaXR5ID0g
c2NoZWRfZ3JhbnVsYXJpdHk7Cj4+ICsgICAgYy0+b3B0X2dyYW51bGFyaXR5ID0gb3B0X3NjaGVk
X2dyYW51bGFyaXR5Owo+PiAgIAo+PiAgICAgICAqcSA9IGM7Cj4+ICAgCj4+IGRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gaW5kZXgg
ZTViNzY3OGRjMC4uYjNjMWFhMDgyMSAxMDA2NDQKPj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVs
ZS5jCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+PiBAQCAtNTYsNyArNTYsOCBAQCBp
bnQgc2NoZWRfcmF0ZWxpbWl0X3VzID0gU0NIRURfREVGQVVMVF9SQVRFTElNSVRfVVM7Cj4+ICAg
aW50ZWdlcl9wYXJhbSgic2NoZWRfcmF0ZWxpbWl0X3VzIiwgc2NoZWRfcmF0ZWxpbWl0X3VzKTsK
Pj4gICAKPj4gICAvKiBOdW1iZXIgb2YgdmNwdXMgcGVyIHN0cnVjdCBzY2hlZF91bml0LiAqLwo+
PiAtc3RhdGljIHVuc2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IHNjaGVkX2dyYW51bGFyaXR5ID0g
MTsKPj4gK2VudW0gc2NoZWRfZ3JhbiBfX3JlYWRfbW9zdGx5IG9wdF9zY2hlZF9ncmFudWxhcml0
eSA9IFNDSEVEX0dSQU5fY3B1Owo+PiArdW5zaWduZWQgaW50IF9fcmVhZF9tb3N0bHkgc2NoZWRf
Z3JhbnVsYXJpdHkgPSAxOwo+IAo+IFNlZWluZyB0aGUgcmVwbGFjZW1lbnRzIHlvdSBkbyBmdXJ0
aGVyIGRvd24sIGFyZSB0aGVzZSB2YXJpYWJsZXMKPiBuZWVkZWQgYXQgYWxsIGFueW1vcmUgb3V0
c2lkZSBvZiBjcHVwb29sLmM/IElmIG5vdCwgdGhleSBzaG91bGQKPiBwcm9iYWJseSBtb3ZlIHRo
ZXJlLCBhbmQgcmVtYWluIC8gYmVjb21lIHN0YXRpYz8KCkhtbSwgZ29vZCBpZGVhLgoKPiAKPj4g
LS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVu
L3NjaGVkLWlmLmgKPj4gQEAgLTI1LDYgKzI1LDE1IEBAIGV4dGVybiBpbnQgc2NoZWRfcmF0ZWxp
bWl0X3VzOwo+PiAgIC8qIFNjaGVkdWxpbmcgcmVzb3VyY2UgbWFzay4gKi8KPj4gICBleHRlcm4g
Y29uc3QgY3B1bWFza190ICpzY2hlZF9yZXNfbWFzazsKPj4gICAKPj4gKy8qIE51bWJlciBvZiB2
Y3B1cyBwZXIgc3RydWN0IHNjaGVkX3VuaXQuICovCj4+ICtlbnVtIHNjaGVkX2dyYW4gewo+PiAr
ICAgIFNDSEVEX0dSQU5fY3B1LAo+PiArICAgIFNDSEVEX0dSQU5fY29yZSwKPj4gKyAgICBTQ0hF
RF9HUkFOX3NvY2tldAo+PiArfTsKPiAKPiBTZWVpbmcgdGhlIGFsbW9zdCBhYnN1cmQgYXJyYW5n
ZW1lbnQgb24gbXkgQU1EIEZhbTE3IHN5c3RlbSAoMTI4IENQVXMKPiBwZXIgQ3JlZGl0MiBydW5x
dWV1ZSwgZm9yIGEgdG90YWwgb2YgdHdvIHJ1bnF1ZXVlcykgSSByZWFsbHkgd29uZGVyCj4gd2hl
dGhlciB0aGVyZSBzaG91bGRuJ3QgYmUgYSBwbGFuIGZvciBhIGZ1cnRoZXIgaW50ZXJtZWRpYXRl
Cj4gZ3JhbnVsYXJpdHkgYmV0d2VlbiAiY29yZSIgYW5kICJzb2NrZXQiLiBUaGUgb3RoZXIgZGF5
IEkgZGlkIG5vdGljZQo+IExpbnV4IGhhcyBnYWluZWQgdGhlIGNvbmNlcHQgb2YgImRpZSIsIHdo
aWNoIHdvdWxkIGJyaW5nIHRoZQo+IGFycmFuZ2VtZW50IHRvIGEgbW9yZSByZWFzb25hYmxlIDgg
cnVucXVldWVzIG9mIDMyIENQVXMgZWFjaCBvbiB0aGlzCj4gc3lzdGVtLiAoSSdtIHRha2luZyBD
cmVkaXQyIGFzIGEgcmVmZXJlbmNlIGhlcmUgb25seS4pCgpPa2F5LCBhbm90aGVyIGl0ZW0gZm9y
ICJzY2hlZHVsZXIgY2xlYW51cCIgSSBndWVzcy4KCj4gCj4+IEBAIC01MzIsNiArNTQyLDggQEAg
c3RydWN0IGNwdXBvb2wKPj4gICAgICAgc3RydWN0IGNwdXBvb2wgICAqbmV4dDsKPj4gICAgICAg
c3RydWN0IHNjaGVkdWxlciAqc2NoZWQ7Cj4+ICAgICAgIGF0b21pY190ICAgICAgICAgcmVmY250
Owo+PiArICAgIHVuc2lnbmVkIGludCAgICAgZ3JhbnVsYXJpdHk7Cj4+ICsgICAgZW51bSBzY2hl
ZF9ncmFuICBvcHRfZ3JhbnVsYXJpdHk7Cj4gCj4gSSdkIGxpa2UgdG8gc3VnZ2VzdCB0byBhdm9p
ZCBpbnRyb2R1Y2luZyBvcHRfKiBpZGVudGlmaWVycyBub3QKPiBkaXJlY3RseSBkcml2ZW4gYnkg
Y29tbWFuZCBsaW5lIG9wdGlvbnMuIFRoYXQnbGwganVzdCBlbmQgdXAKPiBjb25mdXNpbmcgcGVv
cGxlLiBJIGhhdmUgdG8gYWRtaXQgSSdtIGhhdmluZyB0cm91YmxlIGNvbWluZyB1cCB3aXRoCj4g
Z29vZCBuYW1lcyBmb3IgYm90aCBmaWVsZHMsIHNvIEknZCBsaWtlIHRvIGFzayB3aGV0aGVyIHlv
dSByZWFsbHkKPiBuZWVkIGJvdGggLSBpc24ndCB3aGF0J3MgY2FsbGVkICJncmFudWxhcml0eSIg
YWJvdmUgYSBmdW5jdGlvbiBvZgo+ICJvcHRfZ3JhbnVsYXJpdHkiPwoKT25seSBpbmRpcmVjdGx5
LiBJIG5lZWQgb3B0X2dyYW51bGFyaXR5IGZvciBzZWxlY3RpbmcgdGhlIGNvcnJlY3QKY3B1bWFz
ayAoY3B1bWFza19vZigpLCBjcHVfc2libGluZ19tYXNrKCksIC4uLikuIGdyYW51bGFyaXR5IGlz
IHRoZQpudW1lcmljYWwgdmFsdWUgd2hpY2ggSSBkb24ndCB3YW50IHRvIGNhbGN1bGF0ZSBlYWNo
IHRpbWUgSSBuZWVkIGl0LgoKPiBPciBhbHRlcm5hdGl2ZWx5IGNvdWxkbid0IHdoYXQncyBuYW1l
ZAo+ICJncmFudWxhcml0eSIgbm93IGJlIGFsd2F5cyB0YWtlbiBmcm9tIHN0cnVjdCBzY2hlZF9y
ZXNvdXJjZT8gSQo+IHRha2UgaXQgdGhhdCB3aXRoaW4gYSBwb29sIGFsbCBzdHJ1Y3Qgc2NoZWRf
cmVzb3VyY2UgaW5zdGFuY2VzCj4gd291bGQgaGF2ZSB0aGUgc2FtZSBudW1lcmljIGdyYW51bGFy
aXR5IHZhbHVlLiBBbmQgSSBmdXJ0aGVyIHRha2UKPiBpdCB0aGF0IHN0cnVjdCBzY2hlZF9yZXNv
dXJjZSBpbnN0YW5jZXMgd29uJ3QgZnJlZWx5IG1vdmUgYmV0d2Vlbgo+IGNwdXBvb2xzIChhbmQg
aGVuY2UgY291bGQgZS5nLiBiZSBhc3NvY2lhdGVkIHdpdGggdGhlaXIgcG9vbCBvbgo+IGxpbmtl
ZCBsaXN0LCB0aGUgaGVhZCBvZiB3aGljaCBsaXZlcyBpbiBzdHJ1Y3QgY3B1cG9vbCkuCgpJIHRo
aW5rIEkgd291bGRuJ3QgbmVlZCBzdWNoIGEgbGlua2VkIGxpc3QuIEFsbCBjYXNlcyB3aGVyZSBJ
IG5lZWQKY3B1cG9vbC0+Z3JhbnVsYXJpdHkgYXJlIG5vdCBwZXJmb3JtYW5jZSBjcml0aWNhbCwg
c28gSSBjb3VsZCBlYXNpbHkKY2FsY3VsYXRlIGl0IGZyb20gY3B1cG9vbC0+b3B0X2dyYW51bGFy
aXR5IG9yIGJ5IHVzaW5nCmNwdXBvb2wtPnJlc192YWxpZCBmb3IgZmluZGluZyBhIHNjaGVkX3Jl
c291cmNlIG9mIHRoYXQgY3B1cG9vbC4KCkknbGwgcmVuYW1lIGNwdXBvb2wtPm9wdF9ncmFudWxh
cml0eSB0byBncmFuIGFuZCBkcm9wCmNwdXBvb2wtPmdyYW51bGFyaXR5LgoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
