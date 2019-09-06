Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726A1ABB10
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 16:35:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6FHo-0001nC-3D; Fri, 06 Sep 2019 14:32:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtaX=XB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i6FHm-0001my-GU
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 14:32:26 +0000
X-Inumbo-ID: 2536d280-d0b3-11e9-abf6-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2536d280-d0b3-11e9-abf6-12813bfff9fa;
 Fri, 06 Sep 2019 14:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567780345;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tntiHrLqYtFPjHnchwO/m800xZPaCWCw5BgVB7aQAaw=;
 b=dOkH/di9CsU9mh+LH98KcuLUkrXg+A6M8Y4ff5skjC9SgG3tLJILgVof
 Z+XvfZIRw9NxG5rzKH4W7DgfhtCESCfbKlsOWz7vMB9YKf7t/ger8/pHo
 hOQOy5u7gx8uZ9Ep97sM9Ewg6F0dyGNFNGFxFqee5mnrgXdu+9lzlLCSf Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YKXz3jZWjs8Z/9OAZk7PENFB0bp4rF7rPs4JXXr3TWPGf9Zx/c5m6wPvSBepEclyvjuBzHwGaU
 9JLyww1tJzJJpVXORiOkLjLxQS4AUzchxbNSEruv8VcjA7EtbTm8g7dPmMSqyOLse7JU1go/k6
 oofDvr+f7Pe0mI0h13n+Stc+sOByUipAi/zq+uQlJWvt/JPlvqO13Ycqo02+k316NIeaK0dztF
 vs4UdctLqKOGYOsy3rHrU+93UMdXSnNlN47p5KcCyajGNh4AYxKhDoiUOf7m2YwmDGvkdaibf2
 vAc=
X-SBRS: 2.7
X-MesageID: 5516427
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,473,1559534400"; 
   d="scan'208";a="5516427"
Date: Fri, 6 Sep 2019 16:32:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190906143215.crdgegqwkgkxqkae@Air-de-Roger>
References: <ac7a20e8-9e5e-f664-1d7f-d59105f90223@suse.com>
 <20190906093707.wn5zn4nzqxrffwo3@Air-de-Roger>
 <b3ad1cbb-a45b-612c-28b1-e5c203b24676@suse.com>
 <20190906114531.sfkzr53souo36meq@Air-de-Roger>
 <ac4e4862-d12a-ab05-79cd-093dec1bdce5@suse.com>
 <20190906140859.ezkxnjqk2il4jppe@Air-de-Roger>
 <af40c189-e154-8788-01fa-174124341ed0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af40c189-e154-8788-01fa-174124341ed0@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDQ6MTk6NTBQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDYuMDkuMjAxOSAxNjowOCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBGcmksIFNlcCAwNiwgMjAxOSBhdCAwMjowODowOVBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAwNi4wOS4yMDE5IDEzOjQ1LCBSb2dlciBQYXUgTW9ubsOpICB3cm90ZToKPiA+
Pj4gT24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMTI6NTI6MTFQTSArMDIwMCwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4gPj4+PiBPbiAwNi4wOS4yMDE5IDExOjM3LCBSb2dlciBQYXUgTW9ubsOpICB3cm90
ZToKPiA+Pj4+PiBPbiBXZWQsIEp1bCAwMywgMjAxOSBhdCAxMjoxODo0NVBNICswMDAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+Pj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4gPj4+
Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+ID4+Pj4+PiBAQCAtODI5LDEzICs4Mjks
MTMgQEAgZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZShzdHJ1Y3QgZG9tYWluICpkLAo+ID4+Pj4+PiAg
ICAgICAgICAgICoKPiA+Pj4+Pj4gICAgICAgICAgICAqIFJldGFpbiB0aGlzIHByb3BlcnR5IGJ5
IGdyYWJiaW5nIGEgd3JpdGFibGUgdHlwZSByZWYgYW5kIHRoZW4KPiA+Pj4+Pj4gICAgICAgICAg
ICAqIGRyb3BwaW5nIGl0IGltbWVkaWF0ZWx5LiAgVGhlIHJlc3VsdCB3aWxsIGJlIHBhZ2VzIHRo
YXQgaGF2ZSBhCj4gPj4+Pj4+IC0gICAgICAgICAqIHdyaXRhYmxlIHR5cGUgKGFuZCBhbiBJT01N
VSBlbnRyeSksIGJ1dCBhIGNvdW50IG9mIDAgKHN1Y2ggdGhhdAo+ID4+Pj4+PiAtICAgICAgICAg
KiBhbnkgZ3Vlc3QtcmVxdWVzdGVkIHR5cGUgY2hhbmdlcyBzdWNjZWVkIGFuZCByZW1vdmUgdGhl
IElPTU1VCj4gPj4+Pj4+IC0gICAgICAgICAqIGVudHJ5KS4KPiA+Pj4+Pj4gKyAgICAgICAgICog
d3JpdGFibGUgdHlwZSAoYW5kIGFuIElPTU1VIGVudHJ5IGlmIG5lY2Vzc2FyeSksIGJ1dCBhIGNv
dW50IG9mIDAKPiA+Pj4+Pj4gKyAgICAgICAgICogKHN1Y2ggdGhhdCBhbnkgZ3Vlc3QtcmVxdWVz
dGVkIHR5cGUgY2hhbmdlcyBzdWNjZWVkIGFuZCByZW1vdmUgdGhlCj4gPj4+Pj4+ICsgICAgICAg
ICAqIElPTU1VIGVudHJ5KS4KPiA+Pj4+Pj4gICAgICAgICAgICAqLwo+ID4+Pj4+PiAgICAgICAg
ICAgZm9yICggaSA9IDA7IGkgPCAoMVVMIDw8IHBhZ2Vfb3JkZXIpOyArK2ksICsrcGFnZSApCj4g
Pj4+Pj4+ICAgICAgICAgICB7Cj4gPj4+Pj4+IC0gICAgICAgICAgICBpZiAoICFuZWVkX2lvbW11
X3B0X3N5bmMoZCkgKQo+ID4+Pj4+PiArICAgICAgICAgICAgaWYgKCAhaW9tbXVfZW5hYmxlZCAp
Cj4gPj4+Pj4KPiA+Pj4+PiBUaGF0J3Mga2luZCBvZiBhIHN0cm9uZyBjaGVjayBmb3IgYSBkb21h
aW4gdGhhdCBtaWdodCBuZXZlciB1c2UgdGhlCj4gPj4+Pj4gaW9tbXUgYXQgYWxsLiBJc24ndCBp
dCBmaW5lIHRvIGp1c3QgcmVseSBvbgo+ID4+Pj4+IGFyY2hfaW9tbXVfcG9wdWxhdGVfcGFnZV90
YWJsZSBmaW5kaW5nIG5vbi13cml0YWJsZSBwYWdlcyBhbmQgdGh1cyBub3QKPiA+Pj4+PiBhZGRp
bmcgdGhlbSB0byB0aGUgaW9tbXUgcGFnZS10YWJsZXM/Cj4gPj4+Pgo+ID4+Pj4gTm8gLSB0aGUg
Y29kZSBjaGFuZ2UgaGVyZSBpcyB0byB0YWtlIGNhcmUgb2YgcGFnZSBhZGRpdGlvbnMgdG8KPiA+
Pj4+IHRoZSBkb21haW4gYWZ0ZXIgaXQgaGFzIGJvb3RlZC4KPiA+Pj4KPiA+Pj4gUGxlYXNlIGJl
YXIgd2l0aCBtZSwgYnV0IEFGQUlDVCBhcmNoX2lvbW11X3BvcHVsYXRlX3BhZ2VfdGFibGUgY291
bGQKPiA+Pj4gYmUgdXNlZCBhZnRlciB0aGUgZG9tYWluIGhhcyBib290ZWQgaWYgYSBwY2kgZGV2
aWNlIGlzIGhvdCBwbHVnZ2VkLgo+ID4+Pgo+ID4+PiBJZiB0aGlzIGlzIHRvIGRlYWwgd2l0aCBh
ZGRpdGlvbnMgdG8gZG9tYWlucyBoYXZpbmcgYW4gaW9tbXUgYWxyZWFkeQo+ID4+PiBlbmFibGVk
LCBpc24ndCBpdCBlbm91Z2ggdG8gdXNlIG5lZWRfaW9tbXVfcHRfc3luYz8KPiA+Pj4KPiA+Pj4g
VGhhdCdzIGdvaW5nIHRvIHJldHVybiB0cnVlIGZvciBhbGwgUFYgZG9tYWlucywgZXhjZXB0IGZv
ciBkb20wIG5vdAo+ID4+PiBydW5uaW5nIGluIHN0cmljdCBtb2RlLCB3aGljaCBpcyBleHBlY3Rl
ZCBiZWNhdXNlIGluIHRoYXQgY2FzZSBkb20wCj4gPj4+IGFscmVhZHkgaGFzIHRoZSB3aG9sZSBS
QU0gbWFwcGVkIGludG8gdGhlIGlvbW11IHBhZ2UtdGFibGVzPwo+ID4+Cj4gPj4gV2VsbCwgbXkg
cHJldmlvdXMgcmVwbHkgd2Fzbid0IHByZWNpc2UgZW5vdWdoLCBJIGd1ZXNzLiBUaGUgY2hhbmdl
Cj4gPj4gcmVhbGx5IGlzIGFib3V0IGJvdGggY2FzZXM6IElmIHRoZSBkb21haW4gaXMgYWxyZWFk
eSB1c2luZyBhbiBJT01NVSwKPiA+PiBuZWVkX2lvbW11X3B0X3N5bmMoKSB3b3VsZCBiZSBlbm91
Z2ggaW5kZWVkLiBJZiBJT01NVSB1c2UgX21heV8gYmUKPiA+PiBlbmFibGVkIGxhdGVyIG9uLCB3
ZSBuZWVkIHRvIHRyYW5zaXRpb24gcGFnZXMgb3V0IG9mIHRoZWlyIGluaXRpYWwKPiA+PiBQR1Rf
bm9uZSBzdGF0ZSByaWdodCBhd2F5LiBJZiB3ZSBkZWZlcnJlZCB0aGlzIHVudGlsIHRoZSBwb2lu
dAo+ID4+IHdoZXJlIHRoZSBJT01NVSBnZXRzIGVuYWJsZWQgZm9yIHRoZSBkb21haW4sIHdlJ2Qg
aGF2ZSB0byB3YXRjaCBvdXQKPiA+PiBmb3IgUEdUX25vbmUgcGFnZXMgdGhlcmUsIHdoaWNoIHdv
dWxkIGJlIGV4dHJhIGhhc3NsZS4KPiA+IAo+ID4gSSBzdGlsbCB0aGluayBhIHJlbGF4ZWQgUFYg
ZG9tMCBzaG91bGQgYXZvaWQgdGhlIG92ZXJoZWFkIG9mCj4gPiBnZXRfcGFnZV9hbmRfdHlwZSwg
YW5kIHRoZSBpb21tdSBmbHVzaCBkb25lIGFmdGVyd2FyZHMsIGFzIGl0IGFscmVhZHkKPiA+IGhh
cyBhbGwgaG9zdCBSQU0gaW50byBpdCdzIGlvbW11IHBhZ2UtdGFibGVzLgo+ID4gCj4gPiBJZTog
SSB0aGluayB0aGUgY2hlY2sgc2hvdWxkIGJlIHNvbWV0aGluZyBsaWtlOgo+ID4gCj4gPiBpZiAo
ICFpb21tdV9lbmFibGVkIHx8Cj4gPiAgICAgIChpc19oYXJkd2FyZV9kb21haW4oZCkgJiYgIW5l
ZWRfaW9tbXVfcHRfc3luYyhkKSApCj4gCj4gQWgsIHllcywgSSBjYW4gY2VydGFpbmx5IGRvIHRo
aXMgKGlmIHRoZSBwYXRjaCBkb2Vzbid0IGJlY29tZQo+IHVubmVjZXNzYXJ5IGFueXdheSkuCgpX
aXRoIHRoYXQgcGxlYXNlIGFkZCBteSBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqQo8cm9n
ZXIucGF1QGNpdHJpeC5jb20+LCBhbGJlaXQgYXMgeW91IHNheSBJJ20gbm90IHN1cmUgd2hldGhl
ciB0aGlzIGlzCnJlYWxseSBuZWVkZWQgaW4gbGlnaHQgb2YgdGhlIHVwY29taW5nIGlvbW11IGNo
YW5nZXMuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
