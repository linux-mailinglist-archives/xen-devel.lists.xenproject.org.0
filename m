Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6B41714FE
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 11:31:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7GQ9-0003lf-IX; Thu, 27 Feb 2020 10:29:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iNYA=4P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j7GQ8-0003lY-7l
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 10:29:32 +0000
X-Inumbo-ID: 09ba4cc3-594c-11ea-9636-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09ba4cc3-594c-11ea-9636-12813bfff9fa;
 Thu, 27 Feb 2020 10:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582799371;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dxtdgSNby8AJuKlRKpLY06kM9T43dxPrdZCIr0MRcK0=;
 b=SiOOmicUkqqZAPrcPKx43Y78P1Q0a2pfNj1l5oDmpeFP1PPXQ6SjbpQu
 yMQacIQJHO7lw5eTCEM3N/QP36RMmoPZjXE5TE4WRhAOLL204BE4IfEgK
 EAv+ZTjpFgNgI9f5piDgS5St1Ho4SRsGiMDUNJqetn9D/10WgfUKQLI1H w=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: k4GIsqMvHDl8C1d5eghtJC2ldI2m5MJ+X4ddRBRqg2McELQ544auWHA9eKaVNGPkrWzdLMZRS8
 HS2NSrH7ktreRm3AmwRRIgoHKJ8tAUKno7dASwDhQgy8kszBMneX1PU1gDvu9bsrfPQi/jEqvV
 XKQH0EaTPAfrc9lLIQnkZcGuICehvYPG5zW8+isvTik7gzCB/N1Fu85BKyCV7uquW5M1Hxp66X
 YAKNsIdUVEvhdaF3W/2nrZ66tH86ydF2zmkPjyCdnpG8rEdDm6W3Wz+OxZhMU4/VfUHjlSgAZk
 Dio=
X-SBRS: 2.7
X-MesageID: 13524479
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,491,1574139600"; d="scan'208";a="13524479"
To: Jan Beulich <jbeulich@suse.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
 <20200226202221.6555-5-andrew.cooper3@citrix.com>
 <ba5f767b-6f17-adf4-083f-d6b6048fa2fb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2e0267e6-d2e3-324e-1e4d-512e172967cd@citrix.com>
Date: Thu, 27 Feb 2020 10:29:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ba5f767b-6f17-adf4-083f-d6b6048fa2fb@suse.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 04/10] x86/gen-cpuid: Create max and default
 variations of INIT_*_FEATURES
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

T24gMjcvMDIvMjAyMCAwODowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjYuMDIuMjAyMCAy
MToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gRm9yIG5vdywgd3JpdGUgdGhlIHNhbWUgY29u
dGVudCBmb3IgYm90aC4gIFVwZGF0ZSB0aGUgdXNlcnMgb2YgdGhlCj4+IGluaXRpYWxpc2VycyB0
byB1c2UgdGhlIG5ldyBuYW1lLCBhbmQgZXh0ZW5kIHhlbi1jcHVpZCB0byBkdW1wIGJvdGggZGVm
YXVsdAo+PiBhbmQgbWF4IGZlYXR1cmVzZXRzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IEh5cGVydmlzb3IgYW5kIGxpYnhj
IHBhcnRzCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCldo
aWNoIG90aGVyIGJpdCBhcmUgeW91IGNvbmNlcm5lZCB3aXRoP8KgIHhlbi1jcHVpZC5jIGlzIGV4
cGxpY2l0bHkgdW5kZXIKeDg2IG1haW50YWluZXJzaGlwLgoKPgo+PiAtLS0gYS90b29scy9taXNj
L3hlbi1jcHVpZC5jCj4+ICsrKyBiL3Rvb2xzL21pc2MveGVuLWNwdWlkLmMKPj4gQEAgLTI4Mywx
MiArMjgzLDE4IEBAIHN0YXRpYyB2b2lkIGR1bXBfaW5mbyh4Y19pbnRlcmZhY2UgKnhjaCwgYm9v
bCBkZXRhaWwpCj4+ICAgICAgICAgICAgICAgICAgICAgICAgbnJfZmVhdHVyZXMsICJLbm93biIs
IGRldGFpbCk7Cj4+ICAgICAgZGVjb2RlX2ZlYXR1cmVzZXQoeGNfZ2V0X3N0YXRpY19jcHVfZmVh
dHVyZW1hc2soWENfRkVBVFVSRU1BU0tfU1BFQ0lBTCksCj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgbnJfZmVhdHVyZXMsICJTcGVjaWFsIiwgZGV0YWlsKTsKPj4gLSAgICBkZWNvZGVfZmVhdHVy
ZXNldCh4Y19nZXRfc3RhdGljX2NwdV9mZWF0dXJlbWFzayhYQ19GRUFUVVJFTUFTS19QViksCj4+
IC0gICAgICAgICAgICAgICAgICAgICAgbnJfZmVhdHVyZXMsICJQViBNYXNrIiwgZGV0YWlsKTsK
Pj4gLSAgICBkZWNvZGVfZmVhdHVyZXNldCh4Y19nZXRfc3RhdGljX2NwdV9mZWF0dXJlbWFzayhY
Q19GRUFUVVJFTUFTS19IVk1fU0hBRE9XKSwKPj4gLSAgICAgICAgICAgICAgICAgICAgICBucl9m
ZWF0dXJlcywgIkhWTSBTaGFkb3cgTWFzayIsIGRldGFpbCk7Cj4+IC0gICAgZGVjb2RlX2ZlYXR1
cmVzZXQoeGNfZ2V0X3N0YXRpY19jcHVfZmVhdHVyZW1hc2soWENfRkVBVFVSRU1BU0tfSFZNX0hB
UCksCj4+IC0gICAgICAgICAgICAgICAgICAgICAgbnJfZmVhdHVyZXMsICJIVk0gSGFwIE1hc2si
LCBkZXRhaWwpOwo+PiArICAgIGRlY29kZV9mZWF0dXJlc2V0KHhjX2dldF9zdGF0aWNfY3B1X2Zl
YXR1cmVtYXNrKFhDX0ZFQVRVUkVNQVNLX1BWX01BWCksCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgbnJfZmVhdHVyZXMsICJQViBNYXgiLCBkZXRhaWwpOwo+PiArICAgIGRlY29kZV9mZWF0dXJl
c2V0KHhjX2dldF9zdGF0aWNfY3B1X2ZlYXR1cmVtYXNrKFhDX0ZFQVRVUkVNQVNLX1BWX0RFRiks
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgbnJfZmVhdHVyZXMsICJQViBEZWZhdWx0IiwgZGV0
YWlsKTsKPj4gKyAgICBkZWNvZGVfZmVhdHVyZXNldCh4Y19nZXRfc3RhdGljX2NwdV9mZWF0dXJl
bWFzayhYQ19GRUFUVVJFTUFTS19IVk1fU0hBRE9XX01BWCksCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgbnJfZmVhdHVyZXMsICJIVk0gU2hhZG93IE1heCIsIGRldGFpbCk7Cj4+ICsgICAgZGVj
b2RlX2ZlYXR1cmVzZXQoeGNfZ2V0X3N0YXRpY19jcHVfZmVhdHVyZW1hc2soWENfRkVBVFVSRU1B
U0tfSFZNX1NIQURPV19ERUYpLAo+PiArICAgICAgICAgICAgICAgICAgICAgIG5yX2ZlYXR1cmVz
LCAiSFZNIFNoYWRvdyBEZWZhdWx0IiwgZGV0YWlsKTsKPj4gKyAgICBkZWNvZGVfZmVhdHVyZXNl
dCh4Y19nZXRfc3RhdGljX2NwdV9mZWF0dXJlbWFzayhYQ19GRUFUVVJFTUFTS19IVk1fSEFQX01B
WCksCj4+ICsgICAgICAgICAgICAgICAgICAgICAgbnJfZmVhdHVyZXMsICJIVk0gSGFwIE1heCIs
IGRldGFpbCk7Cj4+ICsgICAgZGVjb2RlX2ZlYXR1cmVzZXQoeGNfZ2V0X3N0YXRpY19jcHVfZmVh
dHVyZW1hc2soWENfRkVBVFVSRU1BU0tfSFZNX0hBUF9ERUYpLAo+PiArICAgICAgICAgICAgICAg
ICAgICAgIG5yX2ZlYXR1cmVzLCAiSFZNIEhhcCBEZWZhdWx0IiwgZGV0YWlsKTsKPiBTcG90dGlu
ZyBkaWZmZXJlbmNlcyBiZXR3ZWVuIG1heCBhbmQgZGVmYXVsdCB0aGlzIHdheSBpcywgSSBhc3N1
bWUsCj4gZ29pbmcgdG8gYmUgcXVpdGUgZGlmZmljdWx0IC8gZXJyb3IgcHJvbmUuCgpOb3QgYW55
IG1vcmUgb3IgbGVzcyB0aGFuIGJldHdlZW4gb3RoZXIgc2ltaWxhciBzZXRzIChtb3N0IG9idmlv
dXNseSwKaGFwIGFuZCBzaGFkb3csIGJ1dCByYXcgYW5kIGhvc3QgYWxzbyB0ZW5kIHRvIGZhaXJs
eSBzaW1pbGFyKS4KCj4gV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvCj4gcHJvZHVjZSB0aGUgZGVm
YXVsdCBzZXQgaW4gZnVsbCwgYW5kIHRoZW4gbGlzdCBqdXN0IHRoZSBleHRyYSBpdGVtcwo+IGlu
IG1heD8KCkkgZG9uJ3Qgc2VlIGhvdyB0aGF0IHdvdWxkIHdvcmsuwqAgVGhlIHNldHMgYXJlIGVp
dGhlciByZW5kZXJlZCBhcyBhIGhleApiaXRtYXAgKHNvIHNwb3R0aW5nIGEgZGlmZmVyZW50IGlz
IGZhaXJseSBlYXN5KSwgb3IgdGFidWxhdGVkIHdpdGgKZmVhdHVyZSBuYW1lcyBzdWJkaXZpZGVk
IGJ5IHdvcmQuCgo+IEFpdWkgbWF4IGlzIGFsd2F5cyBnb2luZyB0byBiZSBhIHN1cGVyc2V0IG9m
IGRlZi4KCkl0IGlzLsKgIEkgZGlkIGNvbnNpZGVyIGRpc3Rpbmd1aXNoaW5nIHVzaW5nIGxvd2Vy
IGFuZCB1cHBlciBjYXNlLCB3aGljaAppcyBhYm91dCB0aGUgb25seSB3YXkgSSBjYW4gdGhpbmsg
b2Ygc2Vuc2libHkgbWVyZ2luZyB0aGUgdHdvIHNldHMgdG9nZXRoZXIuCgpIb3dldmVyLCB0aGlz
IGlzIGEgcGFpbiB0byBkbyBpbiBDLCBhbmQgaXQgd291bGQgcmVzdWx0IGluIHRoZSBzZXQgYmVp
bmcKcmVuZGVyZWQgZGlmZmVyZW50bHkgZGVwZW5kaW5nIG9uIHdoZXRoZXIgaXQgd2FzIGEgc3Rh
dGljIHNldCwgb3IgYQp1c2VyLXByb3ZpZGVkIG9uZS7CoCBJdCB3b3VsZCBhbHNvIHJlc3VsdCBp
biB0aGUgY2FzZSBiZWluZyBpbnZlcnRlZApjb21wYXJlZCB0byB0aGUgYW5ub3RhdGlvbiBjaGFy
YWN0ZXIuCgpGb3Igbm93LCBJJ20gaG9uZXN0bHkgbm90IHN1cmUgdGhhdCBpdCBtYXR0ZXJzIHRv
byBtdWNoLsKgIEknbSBwcm9iYWJseQpnb2luZyB0byBnaXZlIHhlbi1jcHVpZCBhbiBvdmVyaGF1
bCBhbnl3YXkgKHBlcmhhcHMgaW50byBweXRob24pIHRvIGJlIGEKbW9yZSB1c2VmdWwgY2FsY3Vs
YXRvciBmb3IgcG9saWN5IHNldHRpbmdzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
