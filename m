Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BA8ABA5F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 16:11:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6EvF-0007Na-66; Fri, 06 Sep 2019 14:09:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtaX=XB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i6EvD-0007NR-LQ
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 14:09:07 +0000
X-Inumbo-ID: e35c7962-d0af-11e9-abf6-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e35c7962-d0af-11e9-abf6-12813bfff9fa;
 Fri, 06 Sep 2019 14:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567778946;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=n7qQfAIpfdgjSTZV5mlT3H3TfToXrPwvsruK1DqkrH0=;
 b=euIBAxVAJ2gSENwVOqrzreuwEoexAVccPEPp4aQLL/h4yEklhvpm7fQg
 zvSQG1gBpDBHM3ZFAcyZ46it6hxsydlzHY2XpKuX+ITksf6A/4ursRsDR
 1LeARq67N+4LeELTAKQW39MXPiJApEH0pNrPwE+rQLNlRBhwNPuNz9AOP 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Q+3Sjv/a8BjmINGxdmGG7oN9bSs8oV7t4rw1RyTFb6TCJXLpaPKtSkEVNAh13IJ9eAPnPBz5Y6
 ZZVhXmO/d70BgvJFoIDtTJ8MqpfkDeULhLxBeZXa2v1rxQfoF6lxYbrG9iTMmQSI4UBWjq0u91
 9J8NIKaP/dvmu2/o1Wz5cOXHGAm+kP3MpEEPKecimdiJCOZKmgUMnHeWM4oHQisNsrUzfBtNBU
 SDhPCbPSvgOWC2EkeekFdHq+V8U4cqYWUZ6nJxxXEyaN2CIfiwEttRHjSyv+xPhFOUJLbRi2FS
 pQY=
X-SBRS: 2.7
X-MesageID: 5423821
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,473,1559534400"; 
   d="scan'208";a="5423821"
Date: Fri, 6 Sep 2019 16:08:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190906140859.ezkxnjqk2il4jppe@Air-de-Roger>
References: <ac7a20e8-9e5e-f664-1d7f-d59105f90223@suse.com>
 <20190906093707.wn5zn4nzqxrffwo3@Air-de-Roger>
 <b3ad1cbb-a45b-612c-28b1-e5c203b24676@suse.com>
 <20190906114531.sfkzr53souo36meq@Air-de-Roger>
 <ac4e4862-d12a-ab05-79cd-093dec1bdce5@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac4e4862-d12a-ab05-79cd-093dec1bdce5@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3] IOMMU/x86: make page type checks
 consistent when mapping pages
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
Cc: GeorgeDunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDI6MDg6MDlQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDYuMDkuMjAxOSAxMzo0NSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBGcmksIFNlcCAwNiwgMjAxOSBhdCAxMjo1MjoxMVBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAwNi4wOS4yMDE5IDExOjM3LCBSb2dlciBQYXUgTW9ubsOpICB3cm90ZToKPiA+
Pj4gT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMTI6MTg6NDVQTSArMDAwMCwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4gPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiA+Pj4+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9tbS9wMm0uYwo+ID4+Pj4gQEAgLTgyOSwxMyArODI5LDEzIEBAIGd1ZXN0X3Bo
eXNtYXBfYWRkX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwKPiA+Pj4+ICAgICAgICAgICAgKgo+ID4+
Pj4gICAgICAgICAgICAqIFJldGFpbiB0aGlzIHByb3BlcnR5IGJ5IGdyYWJiaW5nIGEgd3JpdGFi
bGUgdHlwZSByZWYgYW5kIHRoZW4KPiA+Pj4+ICAgICAgICAgICAgKiBkcm9wcGluZyBpdCBpbW1l
ZGlhdGVseS4gIFRoZSByZXN1bHQgd2lsbCBiZSBwYWdlcyB0aGF0IGhhdmUgYQo+ID4+Pj4gLSAg
ICAgICAgICogd3JpdGFibGUgdHlwZSAoYW5kIGFuIElPTU1VIGVudHJ5KSwgYnV0IGEgY291bnQg
b2YgMCAoc3VjaCB0aGF0Cj4gPj4+PiAtICAgICAgICAgKiBhbnkgZ3Vlc3QtcmVxdWVzdGVkIHR5
cGUgY2hhbmdlcyBzdWNjZWVkIGFuZCByZW1vdmUgdGhlIElPTU1VCj4gPj4+PiAtICAgICAgICAg
KiBlbnRyeSkuCj4gPj4+PiArICAgICAgICAgKiB3cml0YWJsZSB0eXBlIChhbmQgYW4gSU9NTVUg
ZW50cnkgaWYgbmVjZXNzYXJ5KSwgYnV0IGEgY291bnQgb2YgMAo+ID4+Pj4gKyAgICAgICAgICog
KHN1Y2ggdGhhdCBhbnkgZ3Vlc3QtcmVxdWVzdGVkIHR5cGUgY2hhbmdlcyBzdWNjZWVkIGFuZCBy
ZW1vdmUgdGhlCj4gPj4+PiArICAgICAgICAgKiBJT01NVSBlbnRyeSkuCj4gPj4+PiAgICAgICAg
ICAgICovCj4gPj4+PiAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCAoMVVMIDw8IHBhZ2Vfb3Jk
ZXIpOyArK2ksICsrcGFnZSApCj4gPj4+PiAgICAgICAgICAgewo+ID4+Pj4gLSAgICAgICAgICAg
IGlmICggIW5lZWRfaW9tbXVfcHRfc3luYyhkKSApCj4gPj4+PiArICAgICAgICAgICAgaWYgKCAh
aW9tbXVfZW5hYmxlZCApCj4gPj4+Cj4gPj4+IFRoYXQncyBraW5kIG9mIGEgc3Ryb25nIGNoZWNr
IGZvciBhIGRvbWFpbiB0aGF0IG1pZ2h0IG5ldmVyIHVzZSB0aGUKPiA+Pj4gaW9tbXUgYXQgYWxs
LiBJc24ndCBpdCBmaW5lIHRvIGp1c3QgcmVseSBvbgo+ID4+PiBhcmNoX2lvbW11X3BvcHVsYXRl
X3BhZ2VfdGFibGUgZmluZGluZyBub24td3JpdGFibGUgcGFnZXMgYW5kIHRodXMgbm90Cj4gPj4+
IGFkZGluZyB0aGVtIHRvIHRoZSBpb21tdSBwYWdlLXRhYmxlcz8KPiA+Pgo+ID4+IE5vIC0gdGhl
IGNvZGUgY2hhbmdlIGhlcmUgaXMgdG8gdGFrZSBjYXJlIG9mIHBhZ2UgYWRkaXRpb25zIHRvCj4g
Pj4gdGhlIGRvbWFpbiBhZnRlciBpdCBoYXMgYm9vdGVkLgo+ID4gCj4gPiBQbGVhc2UgYmVhciB3
aXRoIG1lLCBidXQgQUZBSUNUIGFyY2hfaW9tbXVfcG9wdWxhdGVfcGFnZV90YWJsZSBjb3VsZAo+
ID4gYmUgdXNlZCBhZnRlciB0aGUgZG9tYWluIGhhcyBib290ZWQgaWYgYSBwY2kgZGV2aWNlIGlz
IGhvdCBwbHVnZ2VkLgo+ID4gCj4gPiBJZiB0aGlzIGlzIHRvIGRlYWwgd2l0aCBhZGRpdGlvbnMg
dG8gZG9tYWlucyBoYXZpbmcgYW4gaW9tbXUgYWxyZWFkeQo+ID4gZW5hYmxlZCwgaXNuJ3QgaXQg
ZW5vdWdoIHRvIHVzZSBuZWVkX2lvbW11X3B0X3N5bmM/Cj4gPiAKPiA+IFRoYXQncyBnb2luZyB0
byByZXR1cm4gdHJ1ZSBmb3IgYWxsIFBWIGRvbWFpbnMsIGV4Y2VwdCBmb3IgZG9tMCBub3QKPiA+
IHJ1bm5pbmcgaW4gc3RyaWN0IG1vZGUsIHdoaWNoIGlzIGV4cGVjdGVkIGJlY2F1c2UgaW4gdGhh
dCBjYXNlIGRvbTAKPiA+IGFscmVhZHkgaGFzIHRoZSB3aG9sZSBSQU0gbWFwcGVkIGludG8gdGhl
IGlvbW11IHBhZ2UtdGFibGVzPwo+IAo+IFdlbGwsIG15IHByZXZpb3VzIHJlcGx5IHdhc24ndCBw
cmVjaXNlIGVub3VnaCwgSSBndWVzcy4gVGhlIGNoYW5nZQo+IHJlYWxseSBpcyBhYm91dCBib3Ro
IGNhc2VzOiBJZiB0aGUgZG9tYWluIGlzIGFscmVhZHkgdXNpbmcgYW4gSU9NTVUsCj4gbmVlZF9p
b21tdV9wdF9zeW5jKCkgd291bGQgYmUgZW5vdWdoIGluZGVlZC4gSWYgSU9NTVUgdXNlIF9tYXlf
IGJlCj4gZW5hYmxlZCBsYXRlciBvbiwgd2UgbmVlZCB0byB0cmFuc2l0aW9uIHBhZ2VzIG91dCBv
ZiB0aGVpciBpbml0aWFsCj4gUEdUX25vbmUgc3RhdGUgcmlnaHQgYXdheS4gSWYgd2UgZGVmZXJy
ZWQgdGhpcyB1bnRpbCB0aGUgcG9pbnQKPiB3aGVyZSB0aGUgSU9NTVUgZ2V0cyBlbmFibGVkIGZv
ciB0aGUgZG9tYWluLCB3ZSdkIGhhdmUgdG8gd2F0Y2ggb3V0Cj4gZm9yIFBHVF9ub25lIHBhZ2Vz
IHRoZXJlLCB3aGljaCB3b3VsZCBiZSBleHRyYSBoYXNzbGUuCgpJIHN0aWxsIHRoaW5rIGEgcmVs
YXhlZCBQViBkb20wIHNob3VsZCBhdm9pZCB0aGUgb3ZlcmhlYWQgb2YKZ2V0X3BhZ2VfYW5kX3R5
cGUsIGFuZCB0aGUgaW9tbXUgZmx1c2ggZG9uZSBhZnRlcndhcmRzLCBhcyBpdCBhbHJlYWR5Cmhh
cyBhbGwgaG9zdCBSQU0gaW50byBpdCdzIGlvbW11IHBhZ2UtdGFibGVzLgoKSWU6IEkgdGhpbmsg
dGhlIGNoZWNrIHNob3VsZCBiZSBzb21ldGhpbmcgbGlrZToKCmlmICggIWlvbW11X2VuYWJsZWQg
fHwKICAgICAoaXNfaGFyZHdhcmVfZG9tYWluKGQpICYmICFuZWVkX2lvbW11X3B0X3N5bmMoZCkg
KQoKPiA+Pj4+ICsgICAgICAgICAgICAgICAgICAgIHsKPiA+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShwYWdlKTsKPiA+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICBmbHVzaF9mbGFncyB8PSBJT01NVUZfcmVhZGFibGUgfCBJT01NVUZfd3JpdGFibGU7
Cj4gPj4+PiArICAgICAgICAgICAgICAgICAgICB9Cj4gPj4+PiArICAgICAgICAgICAgICAgICAg
ICBlbHNlIGlmICggIXJjICkKPiA+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICByYyA9IC1F
QlVTWTsKPiA+Pj4KPiA+Pj4gSXMgaXQgZmluZSB0byByZXR1cm4gYW4gZXJyb3IgaGVyZT8gQUZB
SUNUIHlvdSBjb3VsZCBoYXZlIGEgUk8gcGFnZQo+ID4+PiBzaGFyZWQgd2l0aCBYZW4gd2l0aCBQ
R1Rfbm9uZSwgYW5kIG5vdCBoYXZpbmcgYW4gaW9tbXUgbWFwcGluZyBmb3IgaXQKPiA+Pj4gd291
bGQgYmUgZXhwZWN0ZWQsIGhlbmNlIHJldHVybmluZyBhbiBlcnJvciBzZWVtcyB3cm9uZz8KPiA+
Pgo+ID4+IE5vLCBwYWdlcyBzaGFyZWQgd2l0aCBYZW4gZG9uJ3QgbGl2ZSBvbiBkLT5wYWdlX2xp
c3QgKHdoaWNoIGlzIHdoYXQgdGhlCj4gPj4gbG9vcCBpdGVyYXRlcyBvdmVyKS4KPiA+IAo+ID4g
U28gdGhlbiB0aGVyZSBzaG91bGQgYmUgbm8gUEdUX25vbmUgcGFnZXMgaW4gZC0+cGFnZV9saXN0
Pwo+ID4gCj4gPiBUaGUgb25seSB1c2VyIEkgY2FuIGZpbmQgb2YgUEdUX25vbmUgaXMgc2hhcmVf
eGVuX3BhZ2Vfd2l0aF9ndWVzdC4KPiAKPiBQbHVzIHRoZSBpbXBsaWNpdCB1c2Ugd2hlbiBhIHBh
Z2UgZ2V0cyBmaXJzdCBhZGRlZCB0byBhIGRvbWFpbiAoYnkKPiBzZXR0aW5nIC0+dS5pbnVzZS50
eXBlX2luZm8gdG8gemVybykuCgpBY2ssIHRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uCgpS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
