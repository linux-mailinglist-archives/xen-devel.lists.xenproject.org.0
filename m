Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD20FB1AF
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 14:48:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUsy7-00020Y-T5; Wed, 13 Nov 2019 13:45:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZSCI=ZF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iUsy6-00020Q-BO
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 13:45:58 +0000
X-Inumbo-ID: eb6e8680-061b-11ea-b678-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb6e8680-061b-11ea-b678-bc764e2007e4;
 Wed, 13 Nov 2019 13:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573652757;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=5ri4Zz1YQsKA/sQBKvGmqBCX/ANwhavpG7XZHYa9Aek=;
 b=YMONh4f+yxdnRs7rnHGsAh7vxB9uZOySTVpmltJmizxTJLZAV4RguvvJ
 5nCPzYYQYy0Aa9Sng7Xbg/Kua74+i/2Oc9IL43uACAfLGusIl6TpVCzvm
 xfSw1WHsPJYsblhA+orElX5d33Z0o1gqbg42KI02CuQtnL7ETOLFqdOol M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OvReuhIVx76h1GtNQ2gTF4EItAjl7KI0/E+oAKhaEIRy8qF2OTKsNrZrflcm/mrZGLRS2bPLIz
 PsK22vPp5M/+6KP/lD6Y7Kue33yaH71ZHXlWzDdmb9WLol+jSvyP8PD3wn1lfVn8wJ5IvioX/c
 SjiX4j//VTYjApMkfyAxvU9DxBdSTVaACG0EF1ukmcAY1TKp/AnQ+Et+pH958cgt/y3jH/tomc
 zjRo5Kk82QzUuyncUMlHNE0knf7bkQBuhPdw352PAWtXf1pvlmD/BxYep6PdYuWJHFPA2tBw8c
 zVw=
X-SBRS: 2.7
X-MesageID: 8793018
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,300,1569297600"; 
   d="scan'208";a="8793018"
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20191113134136.16180-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <703d697b-b5ad-3d77-b784-0eca733d6fd9@citrix.com>
Date: Wed, 13 Nov 2019 13:45:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113134136.16180-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] AMD/IOMMU: Fix crash in 'V'
 debugkey
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
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMTEvMjAxOSAxMzo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBjL3MgYmIwMzhmMzEx
NjggIkFNRC9JT01NVTogcmVwbGFjZSBJTlRSRU1BUF9FTlRSSUVTIiBpbnRyb2R1Y2VzIGEgY2Fs
bCB0bwo+IGludHJlbWFwX3RhYmxlX2VudHJpZXMoKSBpbiBkdW1wX2ludHJlbWFwX3RhYmxlKCkg
YmVmb3JlIHRibC5wdHIgaXMgY2hlY2tlZAo+IGZvciBOVUxMLgo+Cj4gaW50cmVtYXBfdGFibGVf
ZW50cmllcygpIGludGVybmFsbHkgdXNlcyB2aXJ0X3RvX3BhZ2UoKSB3aGljaCBmYWxscyBvdmVy
Cj4KPiAgIEFTU0VSVCh2YSA+PSBYRU5fVklSVF9TVEFSVCk7Cj4KPiBpbiBfX3ZpcnRfdG9fcGFn
ZSgpLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KPiAtLS0KPiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+IEND
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4KPiBGb3IgNC4xMy4gIFJlZ3Jlc3Np
b24gdnMgNC4xMgoKT29wcyBzb3JyeS7CoCBTaG91bGQgaGF2ZSBoYWQgYSBSZXBvcnRlZC1ieTog
SWdvciBEcnV6aGluaW4KPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CgpGaXhlZCB1cCBsb2Nh
bGx5Cgp+QW5kcmV3Cgo+IC0tLQo+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVf
aW50ci5jIHwgNCArKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9t
bXVfaW50ci5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYwo+IGlu
ZGV4IDFlZWQ2MGYyNjUuLjVlOTJjMDIzZjggMTAwNjQ0Cj4gLS0tIGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FtZC9pb21tdV9pbnRyLmMKPiBAQCAtODQ3LDExICs4NDcsMTMgQEAgc3RhdGljIHZvaWQgZHVt
cF9pbnRyZW1hcF90YWJsZShjb25zdCBzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bmlvbiBpcnRlX2NwdHIgdGJsLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBpdnJzX21hcHBpbmdzICppdnJz
X21hcHBpbmcpCj4gIHsKPiAtICAgIHVuc2lnbmVkIGludCBjb3VudCwgbnIgPSBpbnRyZW1hcF90
YWJsZV9lbnRyaWVzKHRibC5wdHIsIGlvbW11KTsKPiArICAgIHVuc2lnbmVkIGludCBjb3VudCwg
bnI7Cj4gIAo+ICAgICAgaWYgKCAhdGJsLnB0ciApCj4gICAgICAgICAgcmV0dXJuOwo+ICAKPiAr
ICAgIG5yID0gaW50cmVtYXBfdGFibGVfZW50cmllcyh0YmwucHRyLCBpb21tdSk7Cj4gKwo+ICAg
ICAgZm9yICggY291bnQgPSAwOyBjb3VudCA8IG5yOyBjb3VudCsrICkKPiAgICAgIHsKPiAgICAg
ICAgICBpZiAoIGlvbW11LT5jdHJsLmdhX2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
