Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CF516FBE8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 11:21:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6tmS-0002Nc-K8; Wed, 26 Feb 2020 10:19:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxXS=4O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6tmQ-0002NX-Sw
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 10:19:02 +0000
X-Inumbo-ID: 68aa0ea0-5881-11ea-8fc3-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68aa0ea0-5881-11ea-8fc3-bc764e2007e4;
 Wed, 26 Feb 2020 10:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582712343;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TqHbrU64u8cOGc+BqlpBEYOJZPgaFahLpMOyZ+zpdFQ=;
 b=IXsXPIEMqhOfri0k8r9NqRD07gSUqmvkpV/pb5VP6Bbrni/eJ50lXhpX
 bYKedh7CKHVl54WPjOdgjj1FP2p+QU+Ol4AKIAw7yzDCLEhkkwLA5+Fzu
 w/qd4Yt/Z4q5VeoDBAVcZ+4fUmsl82lyvqZPWF2RH1Y5wk2Uq+8xFZDPM s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: s+K+iJKYXFsRK/JQWvzugSEa9eoqZIkkwOvIWQaeMB72rQk+0grrE8GoUrRFLF7unjZw9CgxBB
 RW5jVtFNK7V1Do/eGMjmH+UQ116jqHwFWuNWT0mH1H5Y3+SiJZsyDc4XeFIxbaBncs05GLUDva
 W4pcknDNOTgf6zlpf4RlffF4IMGcCjdOCJKgNPeuxXsBi3eyRT9cCkDCRk0zvPlU1tFRER7MfV
 kpVHkSx0sxHmawaeuJbi8x2jVN1Gk3cpWA1U727Ggx8s7o+keLDAmnaAtn5X88fch6Q9l4Xl0C
 kqU=
X-SBRS: 2.7
X-MesageID: 13207928
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13207928"
Date: Wed, 26 Feb 2020 11:18:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200226101852.GB24458@Air-de-Roger.citrite.net>
References: <20200224104645.96381-1-roger.pau@citrix.com>
 <20200224104645.96381-5-roger.pau@citrix.com>
 <cae27b7b-1690-7273-635e-95584a474fa5@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cae27b7b-1690-7273-635e-95584a474fa5@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 4/5] x86/smp: use a dedicated scratch
 cpumask in send_IPI_mask
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
Cc: xen-devel@lists.xenproject.org, Sander Eikelenboom <linux@eikelenboom.it>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMTE6MDc6NDRBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjQuMDIuMjAyMCAxMTo0NiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gVXNp
bmcgc2NyYXRjaF9jcHVtYXNrIGluIHNlbmRfSVBJX21hc2sgaXMgbm90IHNhZmUgYmVjYXVzZSBp
dCBjYW4gYmUKPiA+IGNhbGxlZCBmcm9tIGludGVycnVwdCBjb250ZXh0LCBhbmQgaGVuY2UgWGVu
IHdvdWxkIGhhdmUgdG8gbWFrZSBzdXJlCj4gPiBhbGwgdGhlIHVzZXJzIG9mIHRoZSBzY3JhdGNo
IGNwdW1hc2sgZGlzYWJsZSBpbnRlcnJ1cHRzIHdoaWxlIHVzaW5nCj4gPiBpdC4KPiA+IAo+ID4g
SW5zdGVhZCBpbnRyb2R1Y2UgYSBuZXcgY3B1bWFzayB0byBiZSB1c2VkIGJ5IHNlbmRfSVBJX21h
c2ssIGFuZAo+ID4gZGlzYWJsZSBpbnRlcnJ1cHRzIHdoaWxlIHVzaW5nIGl0Lgo+IAo+IFRoZSBh
bHRlcm5hdGl2ZSBvZiBhbHNvIGFkZGluZyAuLi4KPiAKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9z
bXAuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L3NtcC5jCj4gPiBAQCAtNTksNiArNTksNyBAQCBz
dGF0aWMgdm9pZCBzZW5kX0lQSV9zaG9ydGN1dCh1bnNpZ25lZCBpbnQgc2hvcnRjdXQsIGludCB2
ZWN0b3IsCj4gPiAgICAgIGFwaWNfd3JpdGUoQVBJQ19JQ1IsIGNmZyk7Cj4gPiAgfQo+ID4gIAo+
ID4gK0RFQ0xBUkVfUEVSX0NQVShjcHVtYXNrX3Zhcl90LCBzZW5kX2lwaV9jcHVtYXNrKTsKPiA+
ICAvKgo+ID4gICAqIHNlbmRfSVBJX21hc2soY3B1bWFzaywgdmVjdG9yKTogc2VuZHMgQHZlY3Rv
ciBJUEkgdG8gQ1BVcyBpbiBAY3B1bWFzaywKPiA+ICAgKiBleGNsdWRpbmcgdGhlIGxvY2FsIENQ
VS4gQGNwdW1hc2sgbWF5IGJlIGVtcHR5Lgo+ID4gQEAgLTY3LDcgKzY4LDIxIEBAIHN0YXRpYyB2
b2lkIHNlbmRfSVBJX3Nob3J0Y3V0KHVuc2lnbmVkIGludCBzaG9ydGN1dCwgaW50IHZlY3RvciwK
PiA+ICB2b2lkIHNlbmRfSVBJX21hc2soY29uc3QgY3B1bWFza190ICptYXNrLCBpbnQgdmVjdG9y
KQo+ID4gIHsKPiA+ICAgICAgYm9vbCBjcHVzX2xvY2tlZCA9IGZhbHNlOwo+ID4gLSAgICBjcHVt
YXNrX3QgKnNjcmF0Y2ggPSB0aGlzX2NwdShzY3JhdGNoX2NwdW1hc2spOwo+ID4gKyAgICBjcHVt
YXNrX3QgKnNjcmF0Y2ggPSB0aGlzX2NwdShzZW5kX2lwaV9jcHVtYXNrKTsKPiA+ICsgICAgdW5z
aWduZWQgbG9uZyBmbGFnczsKPiA+ICsKPiA+ICsgICAgaWYgKCBpbl9tYygpIHx8IGluX25taSgp
ICkKPiAKPiAuLi4gaW5faXJxKCkgaGVyZSB3YXMgY29uc2lkZXJlZCwgYW5kIGRpc2NhcmRlZCBi
ZWNhdXNlIG9mPyBXaXRoCj4gdGhpcyB5b3UnZCBub3QgbmVlZCB0aGUgc2Vjb25kIENQVSBtYXNr
IGFuZCB5b3UnZCBhbHNvIGJlIGFibGUKPiB0byBhdm9pZCBkaXNhYmxpbmcgYW4gcmUtZW5hYmxp
bmcgSVJRcy4KCkkgYWltZWQgdG8gdXNlIHRoZSBzaG9ydGhhbmQgYXMgbXVjaCBhcyBwb3NzaWJs
ZSwgYnV0IEkgd291bGQgYWxzbyBiZQpmaW5lIHdpdGggbm90IHVzaW5nIGl0IGluIGlycSBjb250
ZXh0LiBJIGFzc3VtZSB0aGVyZSBhcmVuJ3QgdGhhdCBtYW55CmZsdXNoZXMgaW4gaXJxIGNvbnRl
eHQsIGFuZCB0aGVuIHRoZSBJUElzIHNlbnQgYXJlIHByb2JhYmx5IG5vdApicm9hZGNhc3Qgb25l
cy4KCj4gCj4gSW4gb3JkZXIgdG8gbm90IGRpc3R1cmIgdGhlIHBhcnRpYWwgc2VudGVuY2UsIGEg
c21hbGwgcmVxdWVzdCBvbgo+IHRoZSBwcmV2aW91cyBodW5rIGFzIHdlbGw6IENvdWxkIHlvdSBh
ZGQgYSBibGFuayBsaW5lIGFmdGVyIHRoZQo+IG5ldyBkZWZpbml0aW9uLCBwbGVhc2U/Cj4gCj4g
PiArICAgIHsKPiA+ICsgICAgICAgIC8qCj4gPiArICAgICAgICAgKiBXaGVuIGluICNOTUkgb3Ig
I01DIGNvbnRleHQgZmFsbGJhY2sgdG8gdGhlIG9sZCAoYW5kIHNpbXBsZXIpIElQSQo+IAo+IE5v
dGUgdGhhdCBjb252ZW50aW9uYWwgbm90YXRpb24gaW5kZWVkIGlzICNNQyBidXQganVzdCBOTUkg
KGFwcGxpZXMKPiBoZXJlLCBpbiB0aGUgZGVzY3JpcHRpb24sIGFuZCBhbHNvIGVsc2V3aGVyZSBp
biB0aGUgc2VyaWVzKS4KPiAKPiA+IEBAIC04MSw3ICs5NiwxNSBAQCB2b2lkIHNlbmRfSVBJX21h
c2soY29uc3QgY3B1bWFza190ICptYXNrLCBpbnQgdmVjdG9yKQo+ID4gICAgICAgICAgIGxvY2Fs
X2lycV9pc19lbmFibGVkKCkgJiYgKGNwdXNfbG9ja2VkID0gZ2V0X2NwdV9tYXBzKCkpICYmCj4g
PiAgICAgICAgICAgKHBhcmtfb2ZmbGluZV9jcHVzIHx8Cj4gPiAgICAgICAgICAgIGNwdW1hc2tf
ZXF1YWwoJmNwdV9vbmxpbmVfbWFwLCAmY3B1X3ByZXNlbnRfbWFwKSkgKQo+ID4gKyAgICB7Cj4g
PiArICAgICAgICAvKgo+ID4gKyAgICAgICAgICogc2VuZF9JUElfbWFzayBjYW4gYmUgY2FsbGVk
IGZyb20gaW50ZXJydXB0IGNvbnRleHQsIGFuZCBoZW5jZSB3ZQo+ID4gKyAgICAgICAgICogbmVl
ZCB0byBkaXNhYmxlIGludGVycnVwdHMgaW4gb3JkZXIgdG8gcHJvdGVjdCB0aGUgcGVyLWNwdQo+
ID4gKyAgICAgICAgICogc2VuZF9pcGlfY3B1bWFzayB3aGlsZSBiZWluZyB1c2VkLgo+ID4gKyAg
ICAgICAgICovCj4gPiArICAgICAgICBsb2NhbF9pcnFfc2F2ZShmbGFncyk7Cj4gPiAgICAgICAg
ICBjcHVtYXNrX29yKHNjcmF0Y2gsIG1hc2ssIGNwdW1hc2tfb2Yoc21wX3Byb2Nlc3Nvcl9pZCgp
KSk7Cj4gPiArICAgIH0KPiA+ICAgICAgZWxzZQo+ID4gICAgICB7Cj4gPiAgICAgICAgICBpZiAo
IGNwdXNfbG9ja2VkICkKPiA+IEBAIC04OSw2ICsxMTIsNyBAQCB2b2lkIHNlbmRfSVBJX21hc2so
Y29uc3QgY3B1bWFza190ICptYXNrLCBpbnQgdmVjdG9yKQo+ID4gICAgICAgICAgICAgIHB1dF9j
cHVfbWFwcygpOwo+ID4gICAgICAgICAgICAgIGNwdXNfbG9ja2VkID0gZmFsc2U7Cj4gPiAgICAg
ICAgICB9Cj4gPiArICAgICAgICBsb2NhbF9pcnFfc2F2ZShmbGFncyk7Cj4gPiAgICAgICAgICBj
cHVtYXNrX2NsZWFyKHNjcmF0Y2gpOwo+ID4gICAgICB9Cj4gPiAgCj4gPiBAQCAtOTcsNiArMTIx
LDcgQEAgdm9pZCBzZW5kX0lQSV9tYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgaW50IHZlY3Rv
cikKPiA+ICAgICAgZWxzZQo+ID4gICAgICAgICAgYWx0ZXJuYXRpdmVfdmNhbGwoZ2VuYXBpYy5z
ZW5kX0lQSV9tYXNrLCBtYXNrLCB2ZWN0b3IpOwo+ID4gIAo+ID4gKyAgICBsb2NhbF9pcnFfcmVz
dG9yZShmbGFncyk7Cj4gCj4gV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIHJlLWVuYWJsZSBpbnRl
cnJ1cHRzIGluIHRoZSAiZWxzZSIgYnJhbmNoCj4gdmlzaWJsZSBpbiBjb250ZXh0IGFoZWFkIG9m
IHRoZSBjYWxsPwoKSSB0aGluayBJIHdpbGwgZ28gd2l0aCB5b3VyIHN1Z2dlc3Rpb24gYW5kIGRv
bid0IHVzZSB0aGUgc2hvcnRoYW5kIGluCmlycSBjb250ZW54dCwgYW5kIGhlbmNlIHdlIHdvbid0
IG5lZWQgdG8gZGlzYWJsZSBpbnRlcnJ1cHRzIHRoZW4uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
