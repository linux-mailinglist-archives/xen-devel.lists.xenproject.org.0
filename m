Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 910CC14DFDF
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 18:26:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixDX2-0004sJ-DK; Thu, 30 Jan 2020 17:23:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m3I1=3T=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ixDX0-0004sE-Gh
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 17:23:06 +0000
X-Inumbo-ID: 2cb0cbf2-4385-11ea-b211-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cb0cbf2-4385-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 17:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580404985;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ayWWsk88q4q4uQZqCscRnO1e9Nc28Z04Prj5F6AMiZ4=;
 b=GDsogQRU4nM6lbJExuXmOrqBccitSKguLCzmzFQLUeISIu8UQ0CJ/2hO
 OgQlnT94wuV68ZbfAFcoEuZb/qcGgs4qibqYo/d48EbigjfrzUhIgcrIR
 gn4WiRQI4FaFqgnzdoPMUwg6UZW6oX93wRJOQAjpFV8GNoAf1H/IixIY8 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mtuGBbAY3nHz+VG19KcioC9ysSaW+z+zIR3kwfwb2K26lWxoZexJUAlpY+D+UuD+0DoQCg3UCk
 4/rpfF8bnF2Hh4Rfr7c+yBHQG0uZWgjbHwD9NydPaJscJUSKCuK3YK0PbWBBAPeLZWn46eCVge
 y03QSJvw1cnmv1scZ4bCX/XvXnzN85lkljLn6f+2zK6litsVlvnrWLAXNFTyiBnr8IiBxCz479
 23jhfDYdgL59Stx7q9fSZOg6eISMrKZqd1TJCy2pj0mj2AqmE8A92/jAtX/haFq66UIg4sq978
 CG8=
X-SBRS: 2.7
X-MesageID: 11708668
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,382,1574139600"; d="scan'208";a="11708668"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24115.4341.774214.319574@mariner.uk.xensource.com>
Date: Thu, 30 Jan 2020 17:23:01 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200122144446.919-5-pdurrant@amazon.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-5-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v4 4/7] libxl: add infrastructure to track
 and query 'recent' domids
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2NCA0LzddIGxpYnhsOiBhZGQgaW5mcmFzdHJ1
Y3R1cmUgdG8gdHJhY2sgYW5kIHF1ZXJ5ICdyZWNlbnQnIGRvbWlkcyIpOgo+IEEgZG9taWQgaXMg
Y29uc2lkZXJlZCByZWNlbnQgaWYgdGhlIGRvbWFpbiBpdCByZXByZXNlbnRzIHdhcyBkZXN0cm95
ZWQKPiBsZXNzIHRoYW4gYSBzcGVjaWZpZWQgbnVtYmVyIG9mIHNlY29uZHMgYWdvLiBUaGUgbnVt
YmVyIGNhbiBiZSBzZXQgdXNpbmcKPiB0aGUgZW52aXJvbm1lbnQgdmFyaWFibGUgTElCWExfRE9N
SURfUkVVU0VfVElNRU9VVC4gSWYgdGhlIHZhcmlhYmxlIGRvZXMKPiBub3QgZXhpc3QgdGhlbiBh
IGRlZmF1bHQgdmFsdWUgb2YgNjBzIGlzIHVzZWQuCj4gCj4gV2hlbmV2ZXIgYSBkb21haW4gaXMg
ZGVzdHJveWVkLCBhIHRpbWUtc3RhbXBlZCByZWNvcmQgd2lsbCBiZSB3cml0dGVuIGludG8KPiBh
IGhpc3RvcnkgZmlsZSAoL3Zhci9ydW4veGVuL2RvbWlkLWhpc3RvcnkpLiBUbyBhdm9pZCB0aGUg
aGlzdG9yeSBmaWxlCj4gZ3Jvd2luZyB0b28gbGFyZ2UsIGFueSByZWNvcmRzIHdpdGggdGltZS1z
dGFtcHMgdGhhdCBpbmRpY2F0ZSB0aGF0IHRoZQo+IGFnZSBvZiBhIGRvbWlkIGhhcyBleGNlZWRl
ZCB0aGUgcmUtdXNlIHRpbWVvdXQgd2lsbCBhbHNvIGJlIHB1cmdlZC4KPiAKPiBBIG5ldyB1dGls
aXR5IGZ1bmN0aW9uLCBsaWJ4bF9faXNfcmVjZW50X2RvbWlkKCksIGhhcyBiZWVuIGFkZGVkLiBU
aGlzCj4gZnVuY3Rpb24gcmVhZHMgdGhlIHNhbWUgaGlzdG9yeSBmaWxlIGNoZWNraW5nIHdoZXRo
ZXIgYSBzcGVjaWZpZWQgZG9taWQKPiBoYXMgYSByZWNvcmQgdGhhdCBkb2VzIG5vdCBleGNlZWQg
dGhlIHJlLXVzZSB0aW1lb3V0LiBTaW5jZSB0aGlzIHV0aWxpdHkKPiBmdW5jdGlvbiBkb2VzIG5v
dCB3cml0ZSB0byB0aGUgZmlsZSwgbm8gcmVjb3JkcyBhcmUgYWN0dWFsbHkgcHVyZ2VkIGJ5IGl0
Lgo+IAo+IE5PVEU6IFRoZSBoaXN0b3J5IGZpbGUgaXMgcHVyZ2VkIG9uIGJvb3QgdG8gaXQgaXMg
c2FmZSB0byB1c2UKPiAgICAgICBDTE9DS19NT05PVE9OSUMgYXMgYSB0aW1lIHNvdXJjZS4KClRo
YW5rcy4KCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2hlbHBlcnMveGVuLWluaXQtZG9tMC5jIGIvdG9v
bHMvaGVscGVycy94ZW4taW5pdC1kb20wLmMKPiBpbmRleCBhMWU1NzI5NDU4Li41NmY2OWFiNjZm
IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2hlbHBlcnMveGVuLWluaXQtZG9tMC5jCj4gKysrIGIvdG9v
bHMvaGVscGVycy94ZW4taW5pdC1kb20wLmMKClRoYW5rcy4gIFRoaXMgcGFydCBpcyBnb29kLgoK
PiArc3RhdGljIHZvaWQgbGlieGxfX21hcmtfZG9taWRfcmVjZW50KGxpYnhsX19nYyAqZ2MsIHVp
bnQzMl90IGRvbWlkKQo+ICt7Ci4uLgo+ICsgICAgY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9O
SUMsICZ0cyk7Cj4gKwo+ICsgICAgd2hpbGUgKG9mICYmIGZnZXRzKGxpbmUsIHNpemVvZihsaW5l
KSwgb2YpKSB7Cj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBzZWM7Cj4gKyAgICAgICAgdW5zaWdu
ZWQgaW50IGlnbm9yZWQ7Cj4gKwo+ICsgICAgICAgIGlmIChzc2NhbmYobGluZSwgIiVsdSAldSIs
ICZzZWMsICZpZ25vcmVkKSAhPSAyKSB7Cj4gKyAgICAgICAgICAgIExPR0VEKEVSUk9SLCBkb21p
ZCwgImlnbm9yaW5nIG1hbGZvcm1lZCBsaW5lOiAlcyIsIGxpbmUpOwo+ICsgICAgICAgICAgICBj
b250aW51ZTsKPiArICAgICAgICB9Cj4gKwo+ICsgICAgICAgIGlmICh0cy50dl9zZWMgLSBzZWMg
PiB0aW1lb3V0KQo+ICsgICAgICAgICAgICBjb250aW51ZTsgLyogSWdub3JlIGV4cGlyZWQgZW50
cmllcyAqLwoKSSBmaW5kIHRoaXMgY29kZSBxdWl0ZSBzaW1pbGFyIHRvIHRoaXMgY29kZQoKPiAr
Ym9vbCBsaWJ4bF9faXNfZG9taWRfcmVjZW50KGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlk
KQouLi4KPiArICAgIHdoaWxlICghZmVvZihmKSkgewo+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcg
c2VjOwo+ICsgICAgICAgIHVuc2lnbmVkIGludCBjaGVjazsKPiArCj4gKyAgICAgICAgaWYgKGZz
Y2FuZihmLCAiJWx1ICV1IiwgJnNlYywgJmNoZWNrKSAhPSAyKQo+ICsgICAgICAgICAgICBjb250
aW51ZTsKPiArCj4gKyAgICAgICAgaWYgKGNoZWNrID09IGRvbWlkICYmIHRzLnR2X3NlYyAtIHNl
YyA8PSB0aW1lb3V0KSB7Cj4gKyAgICAgICAgICAgIHJlY2VudCA9IHRydWU7Cj4gKyAgICAgICAg
ICAgIGJyZWFrOwo+ICsgICAgICAgIH0KClRoaXMgbWFrZXMgbWUgdW5jb21mb3J0YWJsZS4gIEZv
ciBvbmUgdGhpbmcsIGl0IGR1cGxpY2F0ZXMgYW55IGJ1Z3MKKGFuZCB0aGVyZSBpcyBhdCBsZWFz
dCBvbmUgZXJyb3IgaGFuZGxpbmcgYW5vbWFseSBoZXJlKSBhbmQgZHVwbGljYXRlcwpteSByZXZp
ZXcgZWZmb3J0IGxvb2tpbmcgZm9yIHRob3NlIGJ1Z3MgOi0pLgoKRG8geW91IHRoaW5rIHRoaXMg
Y2FuIGJlIGNvbWJpbmVkIHNvbWVob3cgPyAgUG9zc2liaWxpdGllcyBzZWVtIHRvCmluY2x1ZGU6
IGV4cGxpY2l0IHJlYWRfcmVjZW50X3tpbml0LGVudHJ5LGZpbmlzaH0gZnVuY3Rpb25zOyBhIHNp
bmdsZQpmdW5jdGlvbiB3aXRoIGEgInBlci1lbnRyeSIgY2FsbGJhY2s7IHNhbWUgYnV0IHdpdGgg
YSBtYWNyby4gIElmIHlvdQpkbyB0aGF0IHlvdSBjYW4gYWxzbyBoYXZlIGl0IGhhdmUgaGFuZGxl
IHRoZSAiZmlsZSBkb2VzIG5vdCBleGlzdCIKc3BlY2lhbCBjYXNlLgoKQWxzbywgdGhlIHN0ZGlv
IGVycm9yIGhhbmRsaW5nIGRvZXNuJ3Qgc2VlbSBxdWl0ZSByaWdodC4gIFdoYXQgaWYKZmdldHMg
Z2V0cyBhIHJlYWQgZXJyb3IgPwoKV2hpbGUgSSdtIGxvb2tpbmcgYXQgdGhpcywgSSBmb3VuZAoK
PiArICAgIHdoaWxlIChvZiAmJiBmZ2V0cyhsaW5lLCBzaXplb2YobGluZSksIG9mKSkgewoKdGhh
dCBjb25mdXNpbmcuICBvZiE9MCBpcyBhbiBlbnRyeSBjb25kaXRpb24sIG5vdCBhIHRlcm1pbmF0
aW9uCmNvbmRpdGlvbi4gIFdoZW4gSSBmaXJzdCByZWFkIHRoaXMgSSBsb29rZWQgZm9yIG1vZGlm
aWNhdGlvbnMgdG8gb2YgaW4KdGhlIGxvb3AgYnV0IG9mIGNvdXJzZSB0aGVyZSBhcmVuJ3QgYW55
LgoKSWYgeW91IHJlYWxseSB3YW50IHRvIGtlZXAgaXQgbGlrZSB0aGlzIEkgZ3Vlc3MgSSB3aWxs
IHRvbGVyYXRlIGl0IHRvCmF2b2lkIHRoZSBhcmd1bWVudC4uLgoKPiArICAgIGZmbHVzaChuZik7
CgpNaXNzaW5nIGVycm9yIGNoZWNrLiAgQWxzbyB5b3Ugc2hvdWxkIGZjbG9zZSBoZXJlLCBub3Qg
anVzdCBmZmx1c2guCldoZW4geW91IGRvIHRoYXQsIHNldCBuZiB0byAwIHNvIHRoZSBvdXQgYmxv
Y2sgZG9lc24ndCByZS1jbG9zZSBpdC4KCj4gK2Jvb2wgbGlieGxfX2lzX2RvbWlkX3JlY2VudChs
aWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCkKPiArewouLi4KPiArICAgIG5hbWUgPSBHQ1NQ
UklOVEYoIiVzL2RvbWlkLWhpc3RvcnkiLCBsaWJ4bF9fcnVuX2Rpcl9wYXRoKCkpOwo+ICsgICAg
ZiA9IGZvcGVuKG5hbWUsICJyIik7Cj4gKyAgICBpZiAoIWYpIHsKPiArICAgICAgICBpZiAoZXJy
bm8gIT0gRU5PRU5UKSBMT0dFRChXQVJOLCBkb21pZCwgImZhaWxlZCB0byBvcGVuICVzIiwgbmFt
ZSk7CgpJIHRoaW5rIHRoaXMgKGFuZCBvdGhlciB1bmV4cGVjdGVkIG1hbmlwdWxhdGlvbiBmYWls
dXJlcykgc2hvdWxkIGJlCmZhdGFsLCByYXRoZXIgdGhhbiBtZXJlbHkgYSB3YXJuaW5nLiAgVGhh
dCBtZWFucyB5b3VyIGZ1bmN0aW9uIHNob3VsZApyZXR1cm4gcmMuICBTb3JyeS4gIFNhbWUgZ29l
cyBmb3IgbGlieGxfX21hcmtfZG9taWRfcmVjZW50LgoKVGhhbmtzLApJYW4uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
