Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B8016AA5E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 16:45:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6FsL-0006t6-AX; Mon, 24 Feb 2020 15:42:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6FsK-0006t1-59
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 15:42:28 +0000
X-Inumbo-ID: 41b3601e-571c-11ea-9210-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41b3601e-571c-11ea-9210-12813bfff9fa;
 Mon, 24 Feb 2020 15:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582558946;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9921ecbv6vAgwkHpBZ92yt+ltVrnmq8uEXOmXAaFJ9Y=;
 b=O1ORGgDxo57pgYx9BUVHdEXH1RmDfPlEAsyjO+taLP6liKWUNQ88g/KD
 /nZxlCRZLnx5vYkzCWVjxt5pMoAkrhzQCTQp3+EJn7E4vx3ph/K1mTW23
 eGf7bLiYdaGyP1v6fUiVpKoKsm9QAeJMprkGsItwnjFK6/UTjTz1kh87T 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OU6+pQ/yrwIGcfg2+Za6w7oSJMHgePjIv8n8E5Smld4Hb7WwdjTkixHSraKXQ/Ird+foIH6jOn
 o1Ru2xaFs7STdTMGVG6eizpbN1q455sJX/yVCYZtSXuF7tPmiHBYMyMQISckJpl2yh47k4D/6P
 YktA64Bc9r+WNM70G3+fwCDXhGCXm8EEToq60BIOs6IyaDOnI3PJ0fvuYLcZNJpZO70SJL4Et9
 UwdxaWemk/Nlvpa8bb3W1sbm6zm/7felqV37XUe1KauYJJqkgGQx/TyVfUaNXATRhLkZqxWRBK
 8cA=
X-SBRS: 2.7
X-MesageID: 13540484
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="13540484"
Date: Mon, 24 Feb 2020 16:42:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20200224154218.GU4679@Air-de-Roger>
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <818edf7f9407e377bba6564d58b9c65bce5e6493.1582310142.git.tamas.lengyel@intel.com>
 <20200224151250.GR4679@Air-de-Roger>
 <CABfawhmxwVbNH3o2wpn+SpH=cpVkYS2FsxPccFQt=XqQr=KMwA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABfawhmxwVbNH3o2wpn+SpH=cpVkYS2FsxPccFQt=XqQr=KMwA@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v9 4/5] x86/mem_sharing: reset a fork
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDg6MzU6MDlBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IE9uIE1vbiwgRmViIDI0LCAyMDIwIGF0IDg6MTMgQU0gUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgRmViIDIxLCAy
MDIwIGF0IDEwOjQ5OjIyQU0gLTA4MDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4gSW1w
bGVtZW50IGh5cGVyY2FsbCB0aGF0IGFsbG93cyBhIGZvcmsgdG8gc2hlZCBhbGwgbWVtb3J5IHRo
YXQgZ290IGFsbG9jYXRlZAo+ID4gPiBmb3IgaXQgZHVyaW5nIGl0cyBleGVjdXRpb24gYW5kIHJl
LWxvYWQgaXRzIHZDUFUgY29udGV4dCBmcm9tIHRoZSBwYXJlbnQgVk0uCj4gPiA+IFRoaXMgYWxs
b3dzIHRoZSBmb3JrZWQgVk0gdG8gcmVzZXQgaW50byB0aGUgc2FtZSBzdGF0ZSB0aGUgcGFyZW50
IFZNIGlzIGluIGEKPiA+ID4gZmFzdGVyIHdheSB0aGVuIGNyZWF0aW5nIGEgbmV3IGZvcmsgd291
bGQgYmUuIE1lYXN1cmVtZW50cyBzaG93IGFib3V0IGEgMngKPiA+ID4gc3BlZWR1cCBkdXJpbmcg
bm9ybWFsIGZ1enppbmcgb3BlcmF0aW9ucy4gUGVyZm9ybWFuY2UgbWF5IHZhcnkgZGVwZW5kaW5n
IGhvdwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBeIG9uCj4gPiA+IG11Y2ggbWVtb3J5IGdvdCBhbGxv
Y2F0ZWQgZm9yIHRoZSBmb3JrZWQgVk0uIElmIGl0IGhhcyBiZWVuIGNvbXBsZXRlbHkKPiA+ID4g
ZGVkdXBsaWNhdGVkIGZyb20gdGhlIHBhcmVudCBWTSB0aGVuIGNyZWF0aW5nIGEgbmV3IGZvcmsg
d291bGQgbGlrZWx5IGJlIG1vcmUKPiA+ID4gcGVyZm9ybWFudC4KPiA+ID4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4KPiA+ID4g
LS0tCj4gPiA+ICB4ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYyB8IDc2ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICB4ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5
LmggICB8ICAxICsKPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKQo+ID4g
Pgo+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgYi94ZW4v
YXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwo+ID4gPiBpbmRleCBhZDVkYjlkOGQ1Li5mYjY4OTJh
YWE2IDEwMDY0NAo+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwo+ID4g
PiArKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwo+ID4gPiBAQCAtMTYzNiw2ICsx
NjM2LDU5IEBAIHN0YXRpYyBpbnQgbWVtX3NoYXJpbmdfZm9yayhzdHJ1Y3QgZG9tYWluICpkLCBz
dHJ1Y3QgZG9tYWluICpjZCkKPiA+ID4gICAgICByZXR1cm4gcmM7Cj4gPiA+ICB9Cj4gPiA+Cj4g
PiA+ICsvKgo+ID4gPiArICogVGhlIGZvcmsgcmVzZXQgb3BlcmF0aW9uIGlzIGludGVuZGVkIHRv
IGJlIHVzZWQgb24gc2hvcnQtbGl2ZWQgZm9ya3Mgb25seS4KPiA+ID4gKyAqIFRoZXJlIGlzIG5v
IGh5cGVyY2FsbCBjb250aW51YXRpb24gb3BlcmF0aW9uIGltcGxlbWVudGVkIGZvciB0aGlzIHJl
YXNvbi4KPiA+ID4gKyAqIEZvciBmb3JrcyB0aGF0IG9idGFpbiBhIGxhcmdlciBtZW1vcnkgZm9v
dHByaW50IGl0IGlzIGxpa2VseSBnb2luZyB0byBiZQo+ID4gPiArICogbW9yZSBwZXJmb3JtYW50
IHRvIGNyZWF0ZSBhIG5ldyBmb3JrIGluc3RlYWQgb2YgcmVzZXR0aW5nIGFuIGV4aXN0aW5nIG9u
ZS4KPiA+ID4gKyAqCj4gPiA+ICsgKiBUT0RPOiBJbiBjYXNlIHRoaXMgaHlwZXJjYWxsIHdvdWxk
IGJlY29tZSB1c2VmdWwgb24gZm9ya3Mgd2l0aCBsYXJnZXIgbWVtb3J5Cj4gPiA+ICsgKiBmb290
cHJpbnRzIHRoZSBoeXBlcmNhbGwgY29udGludWF0aW9uIHNob3VsZCBiZSBpbXBsZW1lbnRlZC4K
PiA+Cj4gPiBJJ20gYWZyYWlkIHRoaXMgaXMgbm90IHNhZmUsIGFzIHVzZXJzIGRvbid0IGhhdmUg
YW4gZWFzeSB3YXkgdG8ga25vdwo+ID4gd2hldGhlciBhIGZvcmsgd2lsbCBoYXZlIGEgbGFyZ2Ug
bWVtb3J5IGZvb3RwcmludCBvciBub3QuCj4gCj4gVGhleSBkbywgZ2V0ZG9tYWluaW5mbyB0ZWxs
cyBhIHVzZXIgZXhhY3RseSBob3cgbXVjaCBtZW1vcnkgaGFzIGJlZW4KPiBhbGxvY2F0ZWQgZm9y
IGEgZG9tYWluLgo+IAo+ID4KPiA+IElNTyB5b3UgZWl0aGVyIG5lZWQgc29tZSBraW5kIG9mIGNo
ZWNrIHRoYXQgcHJldmVudHMgdGhpcyBmdW5jdGlvbgo+ID4gZnJvbSBiZWluZyBleGVjdXRlZCB3
aGVuIHRoZSBkb21haW4gYXMgdG9vIG11Y2ggbWVtb3J5IGFzc2lnbmVkLCBvcgo+ID4geW91IG5l
ZWQgdG8gaW1wbGVtZW50IGNvbnRpbnVhdGlvbnMuCj4gCj4gSSByZWFsbHkgZG9uJ3QgdGhpbmsg
d2UgbmVlZCBjb250aW51YXRpb24gaGVyZSB3aXRoIHRoZSB1c2VjYXNlIHdlCj4gaGF2ZSBmb3Ig
dGhpcyBmdW5jdGlvbiBidXQgSSdtIGFsc28gdGlyZWQgb2YgYXJndWluZyBhYm91dCBpdCwgc28g
SSdsbAo+IGp1c3QgYWRkIGl0IGV2ZW4gaWYgaXRzIGdvaW5nIHRvIGJlIGRlYWQgY29kZS4KPiAK
PiA+Cj4gPiBPciBlbHNlIHRoaXMgaXMgdmVyeSBsaWtlbHkgdG8gdHJpcCBvdmVyIHRoZSB3YXRj
aGRvZy4KPiAKPiBUaGUgd2F0Y2hkb2c/CgpZZXMsIFhlbiBoYXMgYSB3YXRjaGRvZyBhbmQgdGhp
cyBsb29wIGlzIGxpa2VseSB0byB0cmlnZ2VyIGl0IGlmIGl0CnRha2VzID4gNXMgdG8gY29tcGxl
dGUuIFRoZSB3YXRjaGRvZyB0cmlnZ2VyaW5nIGlzIGEgZmF0YWwgZXZlbnQgYW5kCmxlYWRzIHRv
IGhvc3QgY3Jhc2guCgpOb3RlIHRoYXQgd2F0Y2hkb2cgaXMgbm90IGVuYWJsZWQgYnkgZGVmYXVs
dCwgeW91IG5lZWQgdG8gZW5hYmxlIGl0IG9uCnRoZSBYZW4gY29tbWFuZCBsaW5lLgoKPiA+ID4g
KyAgICB7Cj4gPiA+ICsgICAgICAgIHAybV90eXBlX3QgcDJtdDsKPiA+ID4gKyAgICAgICAgcDJt
X2FjY2Vzc190IHAybWE7Cj4gPiA+ICsgICAgICAgIGdmbl90IGdmbjsKPiA+ID4gKyAgICAgICAg
bWZuX3QgbWZuID0gcGFnZV90b19tZm4ocGFnZSk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgaWYg
KCAhbWZuX3ZhbGlkKG1mbikgKQo+ID4gPiArICAgICAgICAgICAgY29udGludWU7Cj4gPiA+ICsK
PiA+ID4gKyAgICAgICAgZ2ZuID0gbWZuX3RvX2dmbihjZCwgbWZuKTsKPiA+ID4gKyAgICAgICAg
bWZuID0gX19nZXRfZ2ZuX3R5cGVfYWNjZXNzKHAybSwgZ2ZuX3goZ2ZuKSwgJnAybXQsICZwMm1h
LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMCwgTlVMTCwgZmFs
c2UpOwo+ID4gPiArCj4gPiA+ICsgICAgICAgIGlmICggIXAybV9pc19yYW0ocDJtdCkgfHwgcDJt
X2lzX3NoYXJlZChwMm10KSApCj4gPiA+ICsgICAgICAgICAgICBjb250aW51ZTsKPiA+ID4gKwo+
ID4gPiArICAgICAgICAvKiB0YWtlIGFuIGV4dHJhIHJlZmVyZW5jZSAqLwo+ID4gPiArICAgICAg
ICBpZiAoICFnZXRfcGFnZShwYWdlLCBjZCkgKQo+ID4gPiArICAgICAgICAgICAgY29udGludWU7
Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgcmMgPSBwMm0tPnNldF9lbnRyeShwMm0sIGdmbiwgSU5W
QUxJRF9NRk4sIFBBR0VfT1JERVJfNEssCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcDJtX2ludmFsaWQsIHAybV9hY2Nlc3Nfcnd4LCAtMSk7Cj4gPiA+ICsgICAgICAgIEFTU0VS
VCghcmMpOwo+ID4KPiA+IENhbiB5b3UgaGFuZGxlIHRoaXMgZ3JhY2VmdWxseT8KPiAKPiBOb3Bl
LiBUaGlzIHNob3VsZCBuZXZlciBoYXBwZW4sIHNvIGlmIGl0IGRvZXMsIHNvbWV0aGluZyBpcyB2
ZXJ5IHdyb25nCj4gaW4gc29tZSBvdGhlciBwYXJ0IG9mIFhlbi4KCk9LLCBwbGVhc2Ugc3dpdGNo
IGl0IHRvIEJVR19PTiB0aGVuIGluc3RlYWQgb2YgQVNTRVJULiBJdCdzIGJldHRlciB0bwpjcmFz
aCBoZXJlIHRoYW4gdG8gbWlzYmVoYXZlIGxhdGVyLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
