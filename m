Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F24B6257
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 13:39:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAYGO-00058a-TF; Wed, 18 Sep 2019 11:36:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=suks=XN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iAYGN-00058F-Lc
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 11:36:47 +0000
X-Inumbo-ID: 97b84704-da08-11e9-962f-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97b84704-da08-11e9-962f-12813bfff9fa;
 Wed, 18 Sep 2019 11:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568806606;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=PccY30/ZWyzANdDUFeK661qOZEl+6QM8lJIQKNgtUcc=;
 b=N5XNt3ulLDSCXuxxkK3fXcnSEZ3gUqjGIDWQ4bBjuHq7Cbdvo4xSVynS
 M15DU9nQJyrya1QhIwQS4E9dC2KVu0ek518bP4HGi03kkV8rmBWHRX72L
 VWCYHs8zinMXRyNrEomhr6lfCfgxqcPfCLDBv6yUQRoJp78p1R+9vUuHp M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /wutAcBcwfVNmCTDVhp8bmCd5LB8eMVHhTeXGuVrJGk/mtj4nm2tcJBlZaO79ObXPdClWmOMH7
 pxU/97Np15BHgzMOzpzLRijl/JQTAPG1YENgS95sF6/nA9qz7dW9GHd2Libpiz8j6wOCFP1yJc
 s0fWX8JjvxyZ35e0knUwgfWP7spFROQOVwm+ZfvohBHZ6TOwTt3Y96xynCzFWOSzZz1fmi1eEx
 bI/F8tU9MlBR2eia/Z8K5nO+xGdRzsB7Q/nup9tz6hTaZ6kKS0ULXYDOB/RTN8X7THASVex5fc
 2cg=
X-SBRS: 2.7
X-MesageID: 5719378
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="5719378"
To: Jan Beulich <jbeulich@suse.com>
References: <5a4d4a61-a543-c657-8458-cbc6b5a8a633@suse.com>
 <eca36271-656a-ba89-134d-937a9d0bb403@suse.com>
 <f15bb1a2-c657-6f59-2a88-1eafb7f891f3@citrix.com>
 <c2d448cc-10f8-7491-9128-a6fe670c5741@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <3e13b2cf-1ce8-11a8-0574-10b21235ea05@citrix.com>
Date: Wed, 18 Sep 2019 12:36:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c2d448cc-10f8-7491-9128-a6fe670c5741@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 06/10] AMD/IOMMU: don't blindly allocate
 interrupt remapping tables
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
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDkvMjAxOSAwOTo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTcuMDkuMjAxOSAx
NToxMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDYvMDgvMjAxOSAxNDowOSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBBQ1BJIHRhYmxlcyBhcmUgZnJlZSB0byBsaXN0IGZhciBtb3JlIGRl
dmljZSBjb29yZGluYXRlcyB0aGFuIHRoZXJlIGFyZQo+Pj4gYWN0dWFsIGRldmljZXMuIEJ5IGRl
bGF5aW5nIHRoZSB0YWJsZSBhbGxvY2F0aW9ucyBmb3IgbW9zdCBjYXNlcywgYW5kCj4+PiBkb2lu
ZyB0aGVtIG9ubHkgd2hlbiBhbiBhY3R1YWwgZGV2aWNlIGlzIGtub3duIHRvIGJlIHByZXNlbnQg
YXQgYSBnaXZlbgo+Pj4gcG9zaXRpb24sIG92ZXJhbGwgbWVtb3J5IHVzZWQgZm9yIHRoZSB0YWJs
ZXMgZ29lcyBkb3duIGZyb20gb3ZlciA1MDBrCj4+PiBwYWdlcyB0byBqdXN0IG92ZXIgMWsgb25l
cy4KPj4gVGhpcyBpcyBzbGlnaHRseSBhd2t3YXJkIGdyYW1tYXIuwqAgV2hpbGUgSSBkb24ndCB0
aGluayBpdCBpcyBzdHJpY3RseQo+PiBzcGVha2luZyBpbmNvcnJlY3QsIGl0IHdvdWxkIGJlIG1v
cmUgbm9ybWFsIHRvIHBocmFzZSBhcyAianVzdCBvdmVyIDFrCj4+IHBhZ2VzIi4KPiBDaGFuZ2Vk
LCBhbGJlaXQgdG8gbWUgdGhlIGRvdWJsZSAicGFnZXMiIHNvdW5kcyBvZGQgYXMgd2VsbC4gV291
bGQKPiAib2YgdGhlbSIgYmUgYW55IGJldHRlciB0aGFuICJvbmVzIj8KCllvdSBhcmUgZHJhd2lu
ZyBhIGNvbXBhcmlzb24gYmV0d2VlbiA1MDBrIHBhZ2VzLCBhbmQgMWsgcGFnZXMuCgpDaGFuZ2lu
ZyB0aGUgJ3BhZ2VzJyBxdWFsaWZpZXIgaW50cm9kdWNlZCBhbWJpZ3VpdHkgLSBjb25zaWRlciB0
aGUgY2FzZQp3aGVyZSAib25lcyIgaXMgc3Vic3RpdHV0ZWQgZm9yICJieXRlcyIsIHdoaWNoIHdv
dWxkIGJlIGEgbGVnaXRpbWF0ZSB3YXkKdG8gZGVzY3JpYmUgdGhlIG1lbW9yeSByZWR1Y3Rpb24s
IGJ1dCBpcyBtaXNsZWFkaW5nIGR1ZSB0byB0aGUKZGlmZmVyZW5jZSBpbiB1bml0cy4KCkFsdGVy
bmF0aXZlbHksIHRoZSB0cmFpbGluZyBxdWFsaWZpZXIgY2FuIGJlIGRyb3BwZWQsIGFuZCB0aGUg
c2VudGVuY2UKZW5kIGF0ICIxay4iLCBhcyB0aGUgInBhZ2VzIiBpcyBpbXBsaWVkLgoKPgo+Pj4g
LS0tCj4+PiBUQkQ6IFRoaXMgcmV0YWlucyBwcmlvciAoYnV0IHN1c3BpY2lvdXMpIGJlaGF2aW9y
IG9mIG5vdCBjYWxsaW5nCj4+PiDCoMKgwqDCoCBhbWRfaW9tbXVfc2V0X2ludHJlbWFwX3RhYmxl
KCkgZm9yICJpbnZhbGlkIiBJVlJTIG1hcHBpbmcgZW50cmllcy4KPj4+IMKgwqDCoMKgIFNpbmNl
IERURS5JVj0wIG1lYW5zIHVuLXJlbWFwcGVkIGludGVycnVwdHMsIEkgd29uZGVyIGlmIHRoaXMg
bmVlZHMKPj4+IMKgwqDCoMKgIGNoYW5naW5nLgo+PiBIb3cgd291bGQgYW4gaW52YWxpZCBlbnRy
eSBnZXQgRFRFLlYgc2V0IGluIHRoZSBmaXJzdCBwbGFjZT8KPiBEVEUuViBnZXRzIHNldCBieSBh
bWRfaW9tbXVfc2V0X3Jvb3RfcGFnZV90YWJsZSgpLCB3aGljaCBpbiB0dXJuIGdldHMKPiBjYWxs
ZWQgZnJvbSBhbWRfaW9tbXVfc2V0dXBfZG9tYWluX2RldmljZSgpIGFsb25lLiBJdCdzIG9ubHkg
dGhlCj4gbGF0dGVyIGZ1bmN0aW9uJ3MgY2FsbGVycyB3aGljaCBvYnRhaW4gKGFuZCBwb3NzaWJs
eSBjaGVjaykgdGhlCj4gY29ycmVzcG9uZGluZyBJVlJTIG1hcHBpbmdzIGVudHJ5LiBIZW5jZSB0
byBtZSB0aGVyZSdzIGEgc3VmZmljaWVudAo+IGRpc2Nvbm5lY3QgYmV0d2VlbiBzZXR0aW5nIG9m
IERURS5WIGFuZCBEVEUuSVYuCj4KPiBQbHVzLCBsb29raW5nIGF0IGUuZy4gYW1kX2lvbW11X2Fk
ZF9kZXZpY2UoKSwgdGhlcmUncyBhbXBsZSByb29tIGZvcgo+IG5vdCBldmVuIG1ha2luZyBpdCB0
byBhbWRfaW9tbXVfc2V0X2ludHJlbWFwX3RhYmxlKCksIGR1ZSB0byBlYXJsaWVyCj4gZXJyb3Jz
Lgo+Cj4+IFdoYXRldmVyIHRoZSBvbGQgYmVoYXZpb3VyIG1heSBoYXZlIGJlZW4sIHdlIHNob3Vs
ZG4ndCBoYXZlIGNvZGUgd2hpY2gKPj4gY29tZXMgd2l0aCBhIGNoYW5jZSBvZiBoYXZpbmcgbm9u
LXJlbWFwcGVkIGludGVycnVwdHMgYnkgYWNjaWRlbnQuCj4gV2UgY2FuJ3QgbWFrZSBhbWRfaW9t
bXVfc2V0X3Jvb3RfcGFnZV90YWJsZSgpIHNldCBkdGUtPml2IHRvIDEsIGFzCj4gaXQgZ2V0cyBj
YWxsZWQgb25seSBhZnRlciBhbWRfaW9tbXVfc2V0X2ludHJlbWFwX3RhYmxlKCkgaW4KPiBhbWRf
aW9tbXVfYWRkX2RldmljZSgpLiBCdXQgd2UgY291bGQgb2YgY291cnNlIG1ha2UgaXQgZG8gc28g
d2hlbgo+IGl0IGZpbmRzIGR0ZS0+aXRfcm9vdCBiZSB6ZXJvLiBZZXQgSSB3b25kZXIgaWYgaXQg
d2Fzbid0IG1vcmUgc2FmZQo+IHRvIGhhdmUgRFRFcyBzdGFydCBvdXQgd2l0aCB0aGUgZmllbGQg
c2V0IHRoaXMgd2F5Lgo+Cj4gQWxvbmcgdGhlc2UgbGluZXMgSSdtIGFsc28gbm90IGNvbnZpbmNl
ZCBpdCBpcyBhIGdvb2QgaWRlYSBmb3IKPiBhbWRfaW9tbXVfc2V0X2ludHJlbWFwX3RhYmxlKCkg
dG8gaGF2ZSBhICJ2YWxpZCIgcGFyYW1ldGVyIGluIHRoZQo+IGZpcnN0IHBsYWNlOiBJdCdzIG9r
YXkgYXMgbG9uZyBhcyBhbGwgY2FsbGVycyBwYXNzIGlvbW11X2ludHJlbWFwLAo+IGJ1dCBpdCB3
b3VsZCBzZWVtIHRvIG1lIHRoYXQgLSBhcyBhbHJlYWR5IHNhaWQgLSB3ZSdkIHdhbnQgRFRFcyBi
ZQo+IHNldCB0aGlzIHdheSByaWdodCB3aGVuIGEgRFQgZ2V0cyBhbGxvY2F0ZWQuIElmIHlvdSBh
Z3JlZSwgSSdsbAo+IGhhcHBpbHkgYWRkIGEgcGF0Y2ggZG9pbmcgc28gdG8gdGhlIGVuZCBvZiB0
aGlzIHNlcmllcyAodGhlcmUncwo+IG1lYW53aGlsZSBhIHBhdGNoIHJlLWFycmFuZ2luZyBEVCBh
bGxvY2F0aW9uIGFueXdheSkuCgpJJ3ZlIGJlZW4gbG9va2luZyB0aHJvdWdoIHRoZSBzcGVjLCBh
bmQgdGhpcyBpcyByYXRoZXIgY29tcGxpY2F0ZWQuwqAgV2UKbmVlZCB0byBzZXQgViBhbmQgVFYg
dG8gaW5oaWJpdCBETUEsIGFuZCBJViBhbmQgSW50Q3RsIHRvIGluaGliaXQKaW50ZXJydXB0cy4K
CldoeSBub3QgaW5pdGlhbGlzZSBldmVyeSBlbnRyeSBpbiB0aGUgZGV2aWNlIHRhYmxlIHdoZW4g
d2UgY3JlYXRlIGl0IHRvCmEgc2FmZSwgYmxvY2tlZCBzdGF0ZS7CoCBUaGF0IHdheSwgdGhlIG9u
bHkgd2F5IGEgZGV2aWNlIHN0YXJ0cwpmdW5jdGlvbmluZyBhcHByb3ByaWF0ZWx5IGlzIHZpYSBh
IHN1Y2Nlc3NmdWwgY2FsbCB0b8KgCmFtZF9pb21tdV9zZXRfcm9vdF9wYWdlX3RhYmxlKCkgYW5k
IGFtZF9pb21tdV9zZXRfaW50cmVtYXBfdGFibGUoKSwKd2hpY2ggc2VlbXMgdG8gYmUgZmFyIHNh
ZmVyIGJlaGF2aW91ciBvdmVyYWxsLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
