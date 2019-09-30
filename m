Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CB9C2ACA
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 01:24:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF4zQ-0000JB-8k; Mon, 30 Sep 2019 23:22:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pKq3=XZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iF4zO-0000J0-HL
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 23:21:58 +0000
X-Inumbo-ID: 1885367e-e3d9-11e9-bf31-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 1885367e-e3d9-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 23:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569885717;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=LbjrM61ME+s9Ls1zJ80gPQoOYKMJemDRZN/JVJnedbc=;
 b=NDWdnAtWB8H/QPyw8ZPsx8TCHVngiv2DN6lJ6UQ+VU6fCqmvnDYlbICR
 X8Aj6+kOtHHe5CywnJNAVAe3+IImr5IfPaOdrSMIZpYaEXGapzF8SQpOa
 ciYHfabztRQ+TzDS/EGzWcfq8ULM/HInUgVO52YfT3ibTwKztC5KBlUmk s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fnVKJ5v0+0+a2xhGH2K1cR1NtFYL2gnpHDyW/3WIrQeZ2O7pSkfGAPqOMJ6FBwffflAyeRu1RZ
 +iX9d/t+ANz+wdq8AECwVCzgVP9J5Ny8WBVNk6OiOKl6d1oHlja1Vjd8hTYw8P3F4g1v3ZOj/O
 NlbUMJLcrZ4Uzy8J2pMJOKSeBr0Jt4ENe8W7lSaT+aeRHahkZK/+FCKFHKWtkpmo+woDoEdfEX
 cVcGydhTCAD0l6zNF779GciXcj06zLRm5t5cepMzAUt3J7y+aX+Hhj+prwszK3aWdexQuSk58U
 Xps=
X-SBRS: 2.7
X-MesageID: 6569541
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,568,1559534400"; 
   d="scan'208";a="6569541"
To: Julien Grall <julien.grall@arm.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
References: <20190930182437.25478-1-andrew.cooper3@citrix.com>
 <20190930182437.25478-3-andrew.cooper3@citrix.com>
 <6121ff6c-f7fb-f766-ffb0-7a5f52ddf997@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <9211e84c-fbf8-5a35-e898-23a58e3bd4cb@citrix.com>
Date: Tue, 1 Oct 2019 00:21:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6121ff6c-f7fb-f766-ffb0-7a5f52ddf997@arm.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_BRANCH_HARDEN and disable it
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
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>,
 Norbert Manthey <nmanthey@amazon.de>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDkvMjAxOSAyMToxNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+Cj4gT24gOS8z
MC8xOSA3OjI0IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBUaGUgY29kZSBnZW5lcmF0aW9u
IGZvciBiYXJyaWVyX25vc3BlY190cnVlKCkgaXMgbm90IGNvcnJlY3QuwqAgV2UgYXJlCj4+IHRh
a2luZyBhCj4+IHBlcmYgaXQgZnJvbSB0aGUgYWRkZWQgZmVuY2VzLCBidXQgbm90IGdhaW5pbmcg
YW55IHNwZWN1bGF0aXZlIHNhZmV0eS4KPgo+IHMvaXQvaGl0Lz8KClllcy4KCj4KPj4KPj4gVGhp
cyBpcyBjYXVzZWQgYnkgaW5saW5lIGFzc2VtYmx5IHRyeWluZyB0byBmaWdodCB0aGUgY29tcGls
ZXIKPj4gb3B0aW1pc2VyLCBhbmQKPj4gdGhlIG9wdGltaXNlciB3aW5uaW5nLsKgIFRoZXJlIGlz
IG5vIGNsZWFyIHdheSB0byBhY2hpZXZlIHNhZmV0eSwgc28KPj4gdHVybiB0aGUKPj4gcGVyZiBo
aXQgb2ZmIGZvciBub3cuCj4+Cj4+IFRoaXMgYWxzbyBsYXJnZWx5IHJldmVydHMgMzg2MGQ1NTM0
ZGY0LsKgIFRoZSBuYW1lICdsMXRmLWJhcnJpZXInLCBhbmQKPj4gbWFraW5nCj4+IGJhcnJpZXJf
bm9zcGVjX3RydWUoKSBkZXBlbmQgb24gQ09ORklHX0hWTSB3YXMgY29uc3RyYWluZWQgYnkgd2hh
dAo+PiBjb3VsZCBiZQo+PiBkaXNjdXNzZWQgcHVibGljbHkgYXQgdGhlIHRpbWUuwqAgTm93IHRo
YXQgTURTIGlzIHB1YmxpYywgbmVpdGhlcgo+PiBhc3BlY3RzIGFyZQo+PiBjb3JyZWN0Lgo+Pgo+
PiBBcyBsMXRmLWJhcnJpZXIgaGFzbid0IGJlZW4gaW4gYSByZWxlYXNlIG9mIFhlbiwgYW5kCj4+
IENPTkZJR19TUEVDVUxBVElWRV9CUkFOQ0hfSEFSREVOIGlzIGRpc2FibGVkIHVudGlsIHdlIGNh
biBmaW5kIGEgc2FmZQo+PiB3YXkgb2YKPj4gaW1wbGVtZW50aW5nIHRoZSBmdW5jdGlvbmFsaXR5
LCByZW1vdmUgdGhlIGwxdGYtYmFycmllciBjb21tYW5kIGxpbmUKPj4gb3B0aW9uLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+
PiAtLS0KPj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPj4gQ0M6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+Cj4+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KPj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4gQ0M6IE5vcmJl
cnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgo+PiAtLS0KPj4gwqAgZG9jcy9taXNjL3hl
bi1jb21tYW5kLWxpbmUucGFuZG9jIHzCoCA4ICstLS0tLS0tCj4+IMKgIHhlbi9hcmNoL3g4Ni9z
cGVjX2N0cmwuY8KgwqDCoMKgwqDCoMKgwqDCoCB8IDE3ICsrLS0tLS0tLS0tLS0tLS0tCj4+IMKg
IHhlbi9jb21tb24vS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE3ICsr
KysrKysrKysrKysrKysrCj4KPiBJIHRoaW5rIHRoaXMgd2FudGVkIHRvIGhhdmUgIlRIRSBSRVNU
IiBDQ2VkLgo+Cj4+IMKgIHhlbi9pbmNsdWRlL2FzbS14ODYvY3B1ZmVhdHVyZXMuaCB8wqAgMiAr
LQo+PiDCoCB4ZW4vaW5jbHVkZS9hc20teDg2L25vc3BlYy5owqDCoMKgwqDCoCB8wqAgNCArKy0t
Cj4+IMKgIHhlbi9pbmNsdWRlL2FzbS14ODYvc3BlY19jdHJsLmjCoMKgIHzCoCAxIC0KPj4gwqAg
NiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKPgo+IFsu
Li5dCj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vS2NvbmZpZyBiL3hlbi9jb21tb24vS2Nv
bmZpZwo+PiBpbmRleCA5NjQ0Y2M5OTExLi5kODUxZTYzMDgzIDEwMDY0NAo+PiAtLS0gYS94ZW4v
Y29tbW9uL0tjb25maWcKPj4gKysrIGIveGVuL2NvbW1vbi9LY29uZmlnCj4+IEBAIC05Niw2ICs5
NiwyMyBAQCBjb25maWcgU1BFQ1VMQVRJVkVfQVJSQVlfSEFSREVOCj4+IMKgIMKgwqDCoMKgwqDC
oMKgIElmIHVuc3VyZSwgc2F5IFkuCj4+IMKgICtjb25maWcgU1BFQ1VMQVRJVkVfQlJBTkNIX0hB
UkRFTgo+PiArwqDCoMKgIGJvb2wgIlNwZWN1bGF0aXZlIEJyYW5jaCBIYXJkZW5pbmciCj4+ICvC
oMKgwqAgZGVwZW5kcyBvbiBCUk9LRU4KPj4gK8KgwqDCoMKgwqDCoMKgIC0tLWhlbHAtLS0KPj4g
K8KgwqDCoMKgwqAgQ29udGVtcG9yYXJ5IHByb2Nlc3NvcnMgbWF5IHVzZSBzcGVjdWxhdGl2ZSBl
eGVjdXRpb24gYXMgYQo+PiArwqDCoMKgwqDCoCBwZXJmb3JtYW5jZSBvcHRpbWlzYXRpb24sIGJ1
dCB0aGlzIGNhbiBwb3RlbnRpYWxseSBiZSBhYnVzZWQKPj4gYnkgYW4KPj4gK8KgwqDCoMKgwqAg
YXR0YWNrZXIgdG8gbGVhayBkYXRhIHZpYSBzcGVjdWxhdGl2ZSBzaWRlY2hhbm5lbHMuCj4+ICsK
Pj4gK8KgwqDCoMKgwqAgT25lIHNvdXJjZSBvZiBtaXNiZWhhdmlvdXIgaXMgYnkgZXhlY3V0aW5n
IHRoZSB3cm9uZyBiYXNpYyBibG9jawo+PiArwqDCoMKgwqDCoCBmb2xsb3dpbmcgYSBjb25kaXRp
b25hbCBqdW1wLgo+PiArCj4+ICvCoMKgwqDCoMKgIFdoZW4gZW5hYmxlZCwgc3BlY2lmaWMgY29u
ZGl0aW9ucyB3aGljaCBoYXZlIGJlZW4gZGVlbWVkCj4+IGxpYWJsZSB0bwo+PiArwqDCoMKgwqDC
oCBiZSBzcGVjdWxhdGl2ZWx5IGFidXNlZCB3aWxsIGJlIGhhcmRlbmVkIHRvIGF2b2lkIGVudGVy
aW5nIHRoZQo+PiB3cm9uZwo+PiArwqDCoMKgwqDCoCBiYXNpYyBibG9jay4KPj4gKwo+PiArwqDC
oMKgwqDCoCAhISEgV0FSTklORyAtIFRoaXMgaXMgYnJva2VuIGFuZCBkb2Vzbid0IGdlbmVyYXRl
IHNhZmUgY29kZSAhISEKPgo+IEFueSByZWFzb24gdG8gYWRkIHRoYXQgaW4gY29tbW9uIGNvZGUg
d2hlbiB0aGlzIGlzIHg4NiBvbmx5PwoKSW4gcHJpbmNpcGxlLCBpdHMgbm90IHg4NiBzcGVjaWZp
Yy4KCj4gTXkgd29ycnkgaXMgdGhpcyBnYXRlIGNvbmZpZyBnYXRlIG5vdGhpbmcgb24gQXJtIHNv
IHRoZSB1c2VyIG1heSBoYXZlCj4gYSBmYWxzZSBzZW5zZSB0aGF0IGl0IGNhbiBiZSB1c2VkIChl
dmVuIHRob3VnaCBpdCBpcyBjbGVhcmx5IEJST0tFTikuCj4KPiBBbHNvIHRoZSBuYW1lIGlzIHF1
aXRlIGNsb3NlIHRvIHRoZSBDT05GSUdfSEFSREVOX1BSRURJQ1RPUiBvbiBBcm0gYW5kCj4gbWF5
IGNvbmZ1c2UgdXNlci4gQWx0aG91Z2gsIEkgZG9uJ3QgaGF2ZSBhIGJldHRlciBuYW1lIHNvIGZh
ciA6LwoKVGhlICJkZXBlbmRzIG9uIEJST0tFTiIgbWVhbnMgaXQgd2lsbCBuZXZlciBzaG93IHVw
IHRvIGEgdXNlciBpbgptZW51Y29uZmlnLCB3aGljaCBpcyB3aHkgaXQgd2FzIG9ubHkgQ0MgdG8g
eDg2LCBhbmQgbm90IHRvIHJlc3QuCgpBcyBmb3IgbmFtaW5nLCBJJ20gb3BlbiB0byBzdWdnZXN0
aW9ucywgYnV0IHRoaXMgd2FzIHRoZSBiZXN0IEkgY291bGQKY29tZSB1cCB3aXRoLgoKfkFuZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
