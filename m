Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAD1BE2F1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 18:58:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDAZj-0002sa-E0; Wed, 25 Sep 2019 16:55:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xMb9=XU=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iDAZh-0002sS-Sk
 for xen-devel@lists.xen.org; Wed, 25 Sep 2019 16:55:33 +0000
X-Inumbo-ID: 495fbd5a-dfb5-11e9-97fb-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id 495fbd5a-dfb5-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 16:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569430532;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=/2IfjNmwrySO0n5yVvncCU7vcANJo1oYRn0iUVsQvzg=;
 b=e4EVfLVqKmixdGThPkwzpNJxQXgnh0ux+FSaZk0i8TrPr8Bnq7hqXCTv
 xs9FDAHIJ2Wu9x05FGGOUHqLUk1dI7DUxnHOxB4+v5j0y9vFtx4Bzl3WJ
 JBZD2uoYyVMrOBer/XD+0Fv7xA7S8ErOq43/mDsQFoJrRJw0c9ppO93ZO U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UcSgvFDxsfLxfr6KlBnbud/8zFXXuw4WR6CJXXBQmBThAvc5PGECoDNu8q7jPMcwrGvigqmWUn
 2pdyhHRNpLClQMC+L9wZeaZ7MnRDmrfMylOyCy+AF6Vtkkd7MZhHcnPdWyEBLrBNPnExz3eXkA
 CiW841Rs6KlVJ3oyUBH+yTgWstaWj5UCrLTZjI5lf+BnFhAroehsD/CW6KMD4O5JK/BSyEmVoi
 +C63QYS4whyHV/OMTNUK3Hm5dkEyFIkarlJn8Q9JjBapzrrKw5XOvYCmSiXK0LoId32uuzZZYH
 0o0=
X-SBRS: 2.7
X-MesageID: 6400049
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,548,1559534400"; 
   d="scan'208";a="6400049"
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-9-wipawel@amazon.de>
 <3f3a6877-5153-68f2-549a-5643c4cc73c3@citrix.com>
 <7FE7D7C8-CB4A-4108-8026-B17EA498F344@amazon.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <30aec0f8-19b1-2c5d-6040-41b5fb92476a@citrix.com>
Date: Wed, 25 Sep 2019 17:55:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7FE7D7C8-CB4A-4108-8026-B17EA498F344@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 08/12] livepatch: Add support for inline
 asm hotpatching expectations
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "Pohlack,
 Martin" <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8yMy8xOSA4OjAzIEFNLCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3JvdGU6Cj4gCj4gCj4+
IE9uIDE5LiBTZXAgMjAxOSwgYXQgMTg6MDYsIFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2Fs
bEBjaXRyaXguY29tPiB3cm90ZToKPj4KPj4gT24gOS8xNi8xOSAxMTo1OSBBTSwgUGF3ZWwgV2ll
Y3pvcmtpZXdpY3ogd3JvdGU6Cj4+PiBUaGlzIGlzIHRoZSBpbml0aWFsIGltcGxlbWVudGF0aW9u
IG9mIHRoZSBleHBlY3RhdGlvbnMgZW5oYW5jZW1lbnQKPj4+IHRvIGltcHJvdmUgaW5saW5lIGFz
bSBob3RwYXRjaGluZy4KPj4+IEV4cGVjdGF0aW9ucyBhcmUgZGVzaWduZWQgYXMgb3B0aW9uYWwg
ZmVhdHVyZSwgc2luY2UgdGhlIG1haW4gdXNlIG9mCj4+PiB0aGVtIGlzIHBsYW5uZWQgZm9yIGlu
bGluZSBhc20gaG90cGF0Y2hpbmcuIFRoZSBmbGFnIGVuYWJsZWQgYWxsb3dzCj4+PiB0byBjb250
cm9sIHRoZSBleHBlY3RhdGlvbiBzdGF0ZS4KPj4+IEVhY2ggZXhwZWN0YXRpb24gaGFzIGRhdGEg
YW5kIGxlbiBmaWVsZHMgdGhhdCBkZXNjcmliZSB0aGUgZGF0YQo+Pj4gdGhhdCBpcyBleHBlY3Rl
ZCB0byBiZSBmb3VuZCBhdCBhIGdpdmVuIHBhdGNoaW5nIChvbGRfYWRkcikgbG9jYXRpb24uCj4+
PiBUaGUgbGVuIG11c3Qgbm90IGV4Y2VlZCB0aGUgZGF0YSBhcnJheSBzaXplLiBUaGUgZGF0YSBh
cnJheSBzaXplCj4+PiBmb2xsb3dzIHRoZSBzaXplIG9mIHRoZSBvcGFxdWUgYXJyYXksIHNpbmNl
IHRoZSBvcGFxdWUgYXJyYXkgaG9sZHMKPj4+IHRoZSBvcmlnaW5hbCBkYXRhIGFuZCB0aGVyZWZv
cmUgbXVzdCBtYXRjaCB3aGF0IGlzIHNwZWNpZmllZCBpbiB0aGUKPj4+IGV4cGVjdGF0aW9uIChp
ZiBlbmFibGVkKS4KPj4+IFRoZSBwYXlsb2FkIHN0cnVjdHVyZSBpcyBtb2RpZmllZCBhcyBlYWNo
IGV4cGVjdGF0aW9uIHN0cnVjdHVyZSBpcwo+Pj4gcGFydCBvZiB0aGUgbGl2ZXBhdGNoX2Z1bmMg
c3RydWN0dXJlIGFuZCBoZW5jZSBleHRlbmRzIHRoZSBwYXlsb2FkLgo+Pj4gRWFjaCBleHBlY3Rh
dGlvbiBpcyBjaGVja2VkIHByaW9yIHRvIHRoZSBhcHBseSBhY3Rpb24gKGkuZS4gYXMgbGF0ZQo+
Pj4gYXMgcG9zc2libGUgdG8gY2hlY2sgYWdhaW5zdCB0aGUgbW9zdCBjdXJyZW50IHN0YXRlIG9m
IHRoZSBjb2RlKS4KPj4+IEZvciB0aGUgcmVwbGFjZSBhY3Rpb24gYSBuZXcgcGF5bG9hZCdzIGV4
cGVjdGF0aW9ucyBhcmUgY2hlY2tlZCBBRlRFUgo+Pj4gYWxsIGFwcGxpZWQgcGF5bG9hZHMgYXJl
IHN1Y2Nlc3NmdWxseSByZXZlcnRlZCwgYnV0IEJFRk9SRSBuZXcgcGF5bG9hZAo+Pj4gaXMgYXBw
bGllZC4gVGhhdCBicmVha3MgdGhlIHJlcGxhY2UgYWN0aW9uJ3MgYXRvbWljaXR5IGFuZCBpbiBj
YXNlIG9mCj4+PiBhbiBleHBlY3RhdGlvbiBjaGVjayBmYWlsdXJlIHdvdWxkIGxlYXZlIGEgc3lz
dGVtIHdpdGggYWxsIHBheWxvYWRzCj4+PiByZXZlcnRlZC4gVGhhdCBpcyBvYnZpb3VzbHkgaW5z
ZWN1cmUuIFVzZSBpdCB3aXRoIGNhdXRpb24gYW5kIGFjdAo+Pj4gdXBvbiByZXBsYWNlIGVycm9y
cyEKPj4gc25pcAo+Pj4gICAgKiBMb29rdXAgc3BlY2lmaWVkIHNlY3Rpb24gYW5kIHdoZW4gZXhp
c3RzIGFzc2lnbiBpdHMgYWRkcmVzcyB0byBhIHNwZWNpZmllZCBob29rLgo+Pj4gICAgKiBQZXJm
b3JtIHNlY3Rpb24gcG9pbnRlciBhbmQgc2l6ZSB2YWxpZGF0aW9uOiBzaW5nbGUgaG9vayBzZWN0
aW9ucyBtdXN0IGNvbnRhaW4gYQo+Pj4gQEAgLTEzNDUsNiArMTQwMCwyMCBAQCBzdGF0aWMgdm9p
ZCBsaXZlcGF0Y2hfZG9fYWN0aW9uKHZvaWQpCj4+PiAgICAgICAgICAgICBpZiAoIHJjID09IDAg
KQo+Pj4gICAgICAgICAgIHsKPj4+ICsgICAgICAgICAgICAvKgo+Pj4gKyAgICAgICAgICAgICAq
IE1ha2Ugc3VyZSBhbGwgZXhwZWN0YXRpb24gcmVxdWlyZW1lbnRzIGFyZSBtZXQuCj4+PiArICAg
ICAgICAgICAgICogQmV3YXJlIGFsbCB0aGUgcGF5bG9hZHMgYXJlIHJldmVydGVkIGF0IHRoaXMg
cG9pbnQuCj4+PiArICAgICAgICAgICAgICogSWYgZXhwZWN0YXRpb25zIGFyZSBub3QgbWV0IHRo
ZSBzeXN0ZW0gaXMgbGVmdCBpbiBhCj4+PiArICAgICAgICAgICAgICogY29tcGxldGVseSBVTlBB
VENIRUQgc3RhdGUhCj4+PiArICAgICAgICAgICAgICovCj4+PiArICAgICAgICAgICAgcmMgPSBs
aXZlcGF0Y2hfY2hlY2tfZXhwZWN0YXRpb25zKGRhdGEpOwo+Pj4gKyAgICAgICAgICAgIGlmICgg
cmMgKQo+Pj4gKyAgICAgICAgICAgIHsKPj4+ICsgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxP
R19FUlIgTElWRVBBVENIICIlczogU1lTVEVNIE1JR0hUIEJFIElOU0VDVVJFOiAiCj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAiUmVwbGFjZSBhY3Rpb24gaGFzIGJlZW4gYWJvcnRlZCBhZnRl
ciByZXZlcnRpbmcgQUxMIHBheWxvYWRzIVxuIiwgZGF0YS0+bmFtZSk7Cj4+PiArICAgICAgICAg
ICAgICAgIGJyZWFrOwo+Pj4gKyAgICAgICAgICAgIH0KPj4+ICsKPj4+ICAgICAgICAgICAgICAg
aWYgKCBpc19ob29rX2VuYWJsZWQoZGF0YS0+aG9va3MuYXBwbHkuYWN0aW9uKSApCj4+PiAgICAg
ICAgICAgICAgIHsKPj4+ICAgICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyBMSVZF
UEFUQ0ggIiVzOiBDYWxsaW5nIGFwcGx5IGFjdGlvbiBob29rIGZ1bmN0aW9uXG4iLCBkYXRhLT5u
YW1lKTsKPj4+IEBAIC0xNzk4LDYgKzE4NjcsMTEgQEAgc3RhdGljIGludCBsaXZlcGF0Y2hfYWN0
aW9uKHN0cnVjdCB4ZW5fc3lzY3RsX2xpdmVwYXRjaF9hY3Rpb24gKmFjdGlvbikKPj4+ICAgICAg
ICAgICAgICAgICAgICAgICBicmVhazsKPj4+ICAgICAgICAgICAgICAgfQo+Pj4gICArICAgICAg
ICAgICAgLyogTWFrZSBzdXJlIGFsbCBleHBlY3RhdGlvbiByZXF1aXJlbWVudHMgYXJlIG1ldC4g
Ki8KPj4+ICsgICAgICAgICAgICByYyA9IGxpdmVwYXRjaF9jaGVja19leHBlY3RhdGlvbnMoZGF0
YSk7Cj4+PiArICAgICAgICAgICAgaWYgKCByYyApCj4+PiArICAgICAgICAgICAgICAgIGJyZWFr
Owo+Pj4gKwo+Pj4gICAgICAgICAgICAgICBpZiAoIGlzX2hvb2tfZW5hYmxlZChkYXRhLT5ob29r
cy5hcHBseS5wcmUpICkKPj4+ICAgICAgICAgICAgICAgewo+Pj4gICAgICAgICAgICAgICAgICAg
cHJpbnRrKFhFTkxPR19JTkZPIExJVkVQQVRDSCAiJXM6IENhbGxpbmcgcHJlLWFwcGx5IGhvb2sg
ZnVuY3Rpb25cbiIsIGRhdGEtPm5hbWUpOwo+Pgo+PiBJIHdvbmRlciBpZiB0aGlzIHNob3VsZCBi
ZSBkb25lIGluIHRoZSBjcml0aWNhbCByZWdpb24gZm9yIGNvbnNpc3RlbmN5IHdpdGggdGhlIHJl
cGxhY2UgY29kZSBhbmQgdG8gbWluaW1pemUgdGhlIGNoYW5jZSBvZiBzb21ldGhpbmcgZ29pbmcg
d3JvbmcgYmV0d2VlbiBjYWxsaW5nIHRoZSBzeXNjdGwgYW5kIHRoZSBwYXRjaGluZyBhY3R1YWxs
eSBoYXBwZW5pbmcuIFRob3VnaHRzPwo+Pgo+IAo+IEkgd291bGQgbm90IGRvIGl0LiBBdCBsZWFz
dCBub3QgYXQgdGhlIG1vbWVudC4KPiBUaGUgaW50ZW50aW9uIGJlaGluZCB0aGUgZXhwZWN0YXRp
b24gZmVhdHVyZSBpcyB0byBwcmV2ZW50IGFuIGF0dGVtcHQgdG8gbG9hZCBhIGxpdmVwYXRjaCBt
b2R1bGUgd2l0aCBzb21lIGlubGluZSBhc20gcGF0Y2hpbmcgb24gYSBtYWNoaW5lLAo+IHdob3Nl
IG1lbW9yeSBjb250ZW50IG9mIHBhcnRpY3VsYXIgLnRleHQqIHNlY3Rpb24gZG9lcyBub3QgbWF0
Y2guCj4gCj4gSSB3YW50ZWQgdG8gZG8gaXQgYXMgZWFybHkgYXMgcG9zc2libGUsIGJlZm9yZSBh
bnkgbXV0YXRpbmcgYWN0aW9uIG9mIGEgcHJlIGFwcGx5IGhvb2sgKGFuIGZvciBpbmxpbmUgYXNt
IHBhdGNoaW5nIHByZWFwcGx5IGhvb2sgY2FuIGJlIChhYil1c2VkIG9mdGVuKSBraWNrcyBpbi4K
PiBBbHNvLCBpdCB3b3VsZCBiZSBnb29kIHRvIGhhdmUgdGhlIGV4cGVjdGF0aW9uIGNoZWNrIGFs
d2F5cyB0aGVyZSwgZXZlbiB3aXRoIHJlcGxhY2VkIGRlZmF1bHQgYXBwbHkvcmV2ZXJ0IGFjdGlv
biBob29rcy4KPiAKPiBFeGNlcHQgZnJvbSB0aGUgcmVwbGFjZSBhY3Rpb24gc2l0dWF0aW9uLCB0
aGUgbWVtb3J5IGNvbnRlbnQgb2YgdGhlIGFmZmVjdGVkIC50ZXh0KiBzZWN0aW9uIGlzIHVubGlr
ZWx5IHRvIGNoYW5nZSwgc28gaXQgc2hvdWxkIGJlIGdvb2QgZW5vdWdoIGZvciB0aGUgZ2VuZXJh
bCBjYXNlLgo+IFdoZW4gaXQgY29tZXMgdG8gdGhlIHJlcGxhY2UgYWN0aW9uLCB3ZSBzaG91bGQg
ZGlzY3VzcyBpdCBmdXJ0aGVyIEkgdGhpbmssIGFuZCBtYXliZSBkZXZpc2UgYSBzb2x1dGlvbiBv
biB0b3Agb2YgdGhlIGN1cnJlbnQgb25lLgo+IAoKT0ssIHRoYXQgbWFrZXMgc2Vuc2UuCgpSZXZp
ZXdlZC1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
