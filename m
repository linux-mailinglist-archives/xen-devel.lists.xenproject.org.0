Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BADA18B1AB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 11:44:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEscm-0004M3-Ue; Thu, 19 Mar 2020 10:42:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kuhB=5E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jEscl-0004Lx-EJ
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 10:42:03 +0000
X-Inumbo-ID: 448d3b6a-69ce-11ea-bec1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 448d3b6a-69ce-11ea-bec1-bc764e2007e4;
 Thu, 19 Mar 2020 10:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584614522;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=OVa2+TjbuR8SxOAJGYGK7GVtXPFolZ/DvOIGOI01R1U=;
 b=gtd1tykXwLriAvLtdAltOvIjTFqJ1JCAc0TLzjtUTGmbTULp/cWX14lp
 s2bfMWlI9weHSfDnQjx18LJ4TiOvmVHR3B1AfB0tC3Prw9rtyTE9EvmpL
 Ws2QG+KVGECfe81uRoILX2aNttYfCOAgpC3KIUI+gLuBvZPnLaAJHkJKw A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5jwA6DGeHhGAvK8dLPVLvoj5dcybY2oI7Q2IQKLnS1zCrB+1pKAdMMUQ7P7Bid7BQjJUtpRCGQ
 LAMVcoRsSbexkyRRGqm7VSGncUTAPf9MxWuYiY2akCaWWE++T02WbzUBY8jZ6Uka1AloSYaVbR
 WIgBbHMF+rm5Rthd+PQU11H3sZSfE3/kh8PoiV1onvJ/HbLfMF3emRI76y9+HctV4093Wnf6zS
 JU7EQ4XT17YaXiPFDPICscELWjCZReLZ1kyZqThTQg2VyJwE/Nmyi3Z4p2Jv7qj7mPmGpl8fIo
 7fY=
X-SBRS: 2.7
X-MesageID: 14602054
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,571,1574139600"; d="scan'208";a="14602054"
To: Jan Beulich <jbeulich@suse.com>
References: <20200318210540.5602-1-andrew.cooper3@citrix.com>
 <02b265af-0b0d-0d8f-ed53-4e27c1d12beb@suse.com>
 <cefd1fb0-d6cf-0798-169f-56b49356d2ac@citrix.com>
 <c322646e-ada5-fb39-743e-c2d167da8e3b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0c961be0-fb48-b8e5-e584-4eaa390be308@citrix.com>
Date: Thu, 19 Mar 2020 10:41:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c322646e-ada5-fb39-743e-c2d167da8e3b@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen/x86: Move microcode into its own
 directory
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

T24gMTkvMDMvMjAyMCAwOTo1OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTkuMDMuMjAyMCAx
MDo1MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTkvMDMvMjAyMCAwOToyMSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAxOC4wMy4yMDIwIDIyOjA1LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IFNwbGl0IHRoZSBleGlzdGluZyBhc20vbWljcm9jb2RlLmggaW4gaGFsZiwga2VlcGlu
ZyB0aGUgcGVyLWNwdSBjcHVfc2lnCj4+Pj4gYXZhaWxhYmxlIHRvIGV4dGVybmFsIHVzZXJzLCBh
bmQgbW92aW5nIGV2ZXJ5dGhpbmcgZWxzZSBpbnRvIHByaXZhdGUuaAo+Pj4+Cj4+Pj4gVGFrZSB0
aGUgb3Bwb3J0dW5pdHkgdG8gdHJpbSBhbmQgY2xlYW4gdXAgdGhlIGluY2x1ZGUgbGlzdHMgZm9y
IGFsbCAzIHNvdXJjZQo+Pj4+IGZpbGVzLCBhbGwgb2Ygd2hpY2ggaW5jbHVkZSByYXRoZXIgbW9y
ZSB0aGFuIG5lY2Vzc2FyeS4KPj4+Pgo+Pj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+Pj4+Cj4+
Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KPj4+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiBhbGJl
aXQgcHJlZmVyYWJseSB3aXRoIC4uLgo+Pj4KPj4+PiAtLS0KPj4+PiAgeGVuL2FyY2gveDg2L01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0KPj4+PiAgeGVuL2Fy
Y2gveDg2L21pY3JvY29kZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgMyArKwo+Pj4+
ICB4ZW4vYXJjaC94ODYve21pY3JvY29kZV9hbWQuYyA9PiBtaWNyb2NvZGUvYW1kLmN9ICB8IDEy
ICsrKystLS0tCj4+Pj4gIHhlbi9hcmNoL3g4Ni97bWljcm9jb2RlLmMgPT4gbWljcm9jb2RlL2Nv
cmUuY30gICAgIHwgMTUgKysrLS0tLS0tLQo+Pj4+ICAuLi4veDg2L3ttaWNyb2NvZGVfaW50ZWwu
YyA9PiBtaWNyb2NvZGUvaW50ZWwuY30gICB8ICA5ICsrLS0tLQo+Pj4+ICAuLi4vbWljcm9jb2Rl
LmggPT4gYXJjaC94ODYvbWljcm9jb2RlL3ByaXZhdGUuaH0gICB8IDE5ICsrKystLS0tLS0tLS0K
Pj4+IC4uLiB0aGVzZSBnb2luZyBpbnRvIHhlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlLy4gVGhv
dWdodHM/Cj4+IFRCSCwgSSd2ZSBhbHdheXMgZm91bmQgdGhlIGNwdS8gZGlyZWN0b3J5IHJlZHVu
ZGFudC7CoCBFdmVyeXRoaW5nIGluCj4+IGFyY2gveDg2IGlzIHBhcnQgb2YgdGhlIENQVSwgYW5k
IHRoZXNlIGRheXMsIGV2ZW4gZHJpdmVycy9wYXNzdGhyb3VnaCBpcwo+PiBwYXJ0IG9mIHRoZSBD
UFUuCj4gSSdtIHN1cnByaXNlZCBvZiB5b3Ugc2F5aW5nIHNvIC0gY2VydGFpbmx5IGUuZy4gbWVt
b3J5IG1hbmFnZW1lbnQKPiBzdHVmZiBhbHNvIGludGVyZmFjZXMgd2l0aCB0aGUgQ1BVLCBidXQg
aXMgaW1vIHN0aWxsIGhlbHBmdWwgdG8gYmUKPiBzZXBhcmF0ZWQuCgpJIGNhbiBzZWUgYW4gYXJn
dW1lbnQgZm9yIHRoaW5ncyBsaWtlIGRvbWFpbi5jIG5vdCBsaXZpbmcgaW4gY3B1LywgYnV0Cndo
ZXJlIGRvIHdlIGRyYXcgdGhlIGxpbmU/CgpTaG91bGQgdHJhcHMuYyBiZSBjb25zaWRlcmVkIGNw
dS8gb3Igbm90P8KgIFdoYXQgYWJvdXQgRlBVIGhhbmRsaW5nPwoKPiBMaWtld2lzZSB3aGlsZSBJ
T01NVSBzdHVmZiBtYXkgdG9kYXkgYmUgcGFydCBvZiB0aGUKPiBDUFUgcGFja2FnZSwgaXQncyBz
dGlsbCBub3QgY29yZSBDUFUgZnVuY3Rpb25hbGl0eSBpbW8uCgpTdXJlLCBmb3Igc21hbGwgc3lz
dGVtcywgYnV0IGNvbnNpZGVyaW5nIGl0IGlzIGVmZmVjdGl2ZWx5IG1hbmRhdG9yeSBmb3IKYSA+
MjU1IGNwdSBzeXN0ZW0sIEknZCBubyBsb25nZXIgYWdyZWUuCgpBZnRlciBhbGwsIHdlIGtub3cg
aXRzIG5vdCBzYWZlIHJ1bm5pbmcgYW4gSW50ZWwgc3lzdGVtIHVudGlsIHlvdSd2ZQp0dXJuZWQg
b24gZXZlcnkgdGhyZWFkJ3MgQ1I0Lk1DRSwgZXZlbiBpZiB5b3UgZG9uJ3QgYWN0dWFsbHkgd2Fu
dCB0byB1c2UKdGhlIHRocmVhZC4KCj4KPj4gSSdtIGhhcHB5IHRvIHB1dCBpdCB3aGVyZXZlciBt
YWtlcyBzZW5zZSwgc28gbG9uZyBhcyB0aGVyZSBpcyBhIGNsZWFyCj4+IHVuZGVyc3RhbmRpbmcg
b2Ygd2h5Lgo+IFRoZSBib3VuZGFyaWVzIGFyZSBhbHdheXMgZ29pbmcgdG8gYmUgZnV6enksIEkg
dGhpbmsuIEFzIHNhaWQsIEknZAo+IHByZWZlciB0aGUgYWx0ZXJuYXRpdmUgcGxhY2UsIGJ1dCBJ
J20gbm90IGdvaW5nIHRvIGluc2lzdC4KCkFsbCBJJ20gbG9va2luZyBmb3IgaXMgc29tZSBraW5k
IG9mIGNsYXJpdHkgb24gd2hhdCB0aGlzIGJvdW5kYXJ5IG1pZ2h0IGJlLgoKfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
