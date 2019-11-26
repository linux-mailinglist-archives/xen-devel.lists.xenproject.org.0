Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7EB10A3D1
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 19:05:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZfAi-00078Q-3F; Tue, 26 Nov 2019 18:02:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=up47=ZS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZfAg-00078L-78
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 18:02:42 +0000
X-Inumbo-ID: f01d629a-1076-11ea-b155-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f01d629a-1076-11ea-b155-bc764e2007e4;
 Tue, 26 Nov 2019 18:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574791361;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+ccKh8TpAjyolHzP/90wGqmYthz+PgRG7O8PdfZKsLM=;
 b=GJYqiFg9zjjHQpNdMgXValrwCPs8MJw0Trb3T5bP3AhrinbO32zBB9Jx
 W6Q7Xf9dP1Z5BkB0ihwFcVe/h7+mlP4nt3yw3Rl6v92tJ9aPQ18VofbD4
 rQm9IUVKwbYX55rAW+B1jJvP1tXzuAn1V2+XpMtzDx/x1p0WgAreA7K4S s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ediLKdM0r2+zBUmR9Psf+94s7+2Jbry5x25kUGSqytN3egjiEKQiok9kNrEIwrKB8+w09WbCja
 ktNR9dYY6nx2riiNd21lwikQv6HFGsrmY3FKweErlDVAOyubQSusxBnPBHUeN+PPePbu1+2ySQ
 QxFCMM33YQpHWYsx2JcoKN/vUw2cu+WQYVI7HNHOAjFnNvzyV5uDT2qmo5SZ8Gb5wjIo5Wax01
 Ru2qKCA86QEjtmC06vOCNB2f7zpcTP+t0KCf5nLFr4HLu4l9Bd2FO8SuSBEc7weCbCWCGlkpFf
 j04=
X-SBRS: 2.7
X-MesageID: 9277577
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="9277577"
Date: Tue, 26 Nov 2019 19:02:25 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191126180225.GI980@Air-de-Roger>
References: <20191126132648.6917-1-roger.pau@citrix.com>
 <20191126132648.6917-3-roger.pau@citrix.com>
 <a6193850-7f1c-64c9-46b9-2319701e914b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a6193850-7f1c-64c9-46b9-2319701e914b@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 v3 2/2] x86/vmx: always sync PIR to
 IRR before vmentry
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
Cc: Juergen Gross <jgross@suse.com>, Kevin
 Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDU6NTA6MzJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjYuMTEuMjAxOSAxNDoyNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L2h2bS9pcnEuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9pcnEu
Ywo+ID4gQEAgLTUxNSw3ICs1MTUsMTEgQEAgdm9pZCBodm1fc2V0X2NhbGxiYWNrX3ZpYShzdHJ1
Y3QgZG9tYWluICpkLCB1aW50NjRfdCB2aWEpCj4gPiAgc3RydWN0IGh2bV9pbnRhY2sgaHZtX3Zj
cHVfaGFzX3BlbmRpbmdfaXJxKHN0cnVjdCB2Y3B1ICp2KQo+ID4gIHsKPiA+ICAgICAgc3RydWN0
IGh2bV9kb21haW4gKnBsYXQgPSAmdi0+ZG9tYWluLT5hcmNoLmh2bTsKPiA+IC0gICAgaW50IHZl
Y3RvcjsKPiA+ICsgICAgLyoKPiA+ICsgICAgICogQWx3YXlzIGNhbGwgdmxhcGljX2hhc19wZW5k
aW5nX2lycSBzbyB0aGF0IFBJUiBpcyBzeW5jZWQgaW50byBJUlIgd2hlbgo+ID4gKyAgICAgKiB1
c2luZyBwb3N0ZWQgaW50ZXJydXB0cy4KPiA+ICsgICAgICovCj4gPiArICAgIGludCB2ZWN0b3Ig
PSB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxKHYpOwo+IAo+IERpZCB5b3UgY29uc2lkZXIgZG9pbmcg
dGhpcyBjb25kaXRpb25hbGx5IGVpdGhlciBoZXJlIC4uLgo+IAo+ID4gQEAgLTUzMCw3ICs1MzQs
NiBAQCBzdHJ1Y3QgaHZtX2ludGFjayBodm1fdmNwdV9oYXNfcGVuZGluZ19pcnEoc3RydWN0IHZj
cHUgKnYpCj4gPiAgICAgIGlmICggdmxhcGljX2FjY2VwdF9waWNfaW50cih2KSAmJiBwbGF0LT52
cGljWzBdLmludF9vdXRwdXQgKQo+ID4gICAgICAgICAgcmV0dXJuIGh2bV9pbnRhY2tfcGljKDAp
Owo+ID4gIAo+ID4gLSAgICB2ZWN0b3IgPSB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxKHYpOwo+ID4g
ICAgICBpZiAoIHZlY3RvciAhPSAtMSApCj4gPiAgICAgICAgICByZXR1cm4gaHZtX2ludGFja19s
YXBpYyh2ZWN0b3IpOwo+IAo+IC4uLiBvciBoZXJlPyBJIGFzayBub3Qgb25seSBiZWNhdXNlIHRo
ZSBmdW5jdGlvbiBpc24ndCBleGFjdGx5Cj4gY2hlYXAgdG8gY2FsbCAoYXMgaWlyYyB5b3UgZGlk
IGFsc28gbWVudGlvbiBkdXJpbmcgdGhlIHYyCj4gZGlzY3Vzc2lvbiksIGJ1dCBhbHNvIGJlY2F1
c2Ugb2YgaXRzIGludGVyYWN0aW9uIHdpdGggVmlyaWRpYW4KPiBhbmQgbmVzdGVkIG1vZGUuIElu
IGNhc2Ugb2YgcHJvYmxlbXMgdGhlcmUsIGF2b2lkaW5nIHRoZSB1c2UKPiBvZiBpbnRlcnJ1cHQg
cG9zdGluZyB3b3VsZCBiZSBhIHdvcmthcm91bmQgaW4gc3VjaCBjYXNlcyB0aGVuLgoKVEJIIG15
IHByZWZlcmVuY2Ugd2FzIHRvIGRvIHRoZSBQSVIgdG8gSVJSIHN5bmMgaW4gdm14X2ludHJfYXNz
aXN0IGJ5CmRpcmVjdGx5IGNhbGxpbmcgdm14X3N5bmNfcGlyX3RvX2lyciBiZWNhdXNlIGl0IHdh
cyBJTU8gbGVzcyBpbnRydXNpdmUKYW5kIGNvbmZpbmVkIHRvIFZNWCBjb2RlLiBJIHRoaW5rIHRo
aXMgYXBwcm9hY2ggaXMgbW9yZSByaXNreSBhcwp2bGFwaWNfaGFzX3BlbmRpbmdfaXJxIGRvZXMg
d2F5IG1vcmUgdGhhbiBzaW1wbHkgc3luY2luZyBQSVIgdG8gSVJSLgoKPiA+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vdm14L3ZteC5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXgu
Ywo+ID4gQEAgLTE5NDUsNTcgKzE5NDUsMzEgQEAgc3RhdGljIHZvaWQgdm14X3Byb2Nlc3NfaXNy
KGludCBpc3IsIHN0cnVjdCB2Y3B1ICp2KQo+ID4gIAo+ID4gIHN0YXRpYyB2b2lkIF9fdm14X2Rl
bGl2ZXJfcG9zdGVkX2ludGVycnVwdChzdHJ1Y3QgdmNwdSAqdikKPiA+ICB7Cj4gPiAtICAgIGJv
b2xfdCBydW5uaW5nID0gdi0+aXNfcnVubmluZzsKPiA+IC0KPiA+ICAgICAgdmNwdV91bmJsb2Nr
KHYpOwo+ID4gLSAgICAvKgo+ID4gLSAgICAgKiBKdXN0IGxpa2UgdmNwdV9raWNrKCksIG5vdGhp
bmcgaXMgbmVlZGVkIGZvciB0aGUgZm9sbG93aW5nIHR3byBjYXNlczoKPiA+IC0gICAgICogMS4g
VGhlIHRhcmdldCB2Q1BVIGlzIG5vdCBydW5uaW5nLCBtZWFuaW5nIGl0IGlzIGJsb2NrZWQgb3Ig
cnVubmFibGUuCj4gPiAtICAgICAqIDIuIFRoZSB0YXJnZXQgdkNQVSBpcyB0aGUgY3VycmVudCB2
Q1BVIGFuZCB3ZSdyZSBpbiBub24taW50ZXJydXB0Cj4gPiAtICAgICAqIGNvbnRleHQuCj4gPiAt
ICAgICAqLwo+ID4gLSAgICBpZiAoIHJ1bm5pbmcgJiYgKGluX2lycSgpIHx8ICh2ICE9IGN1cnJl
bnQpKSApCj4gPiAtICAgIHsKPiA+ICsgICAgaWYgKCB2LT5pc19ydW5uaW5nICYmIHYgIT0gY3Vy
cmVudCApCj4gCj4gSSBjb250aW51ZSB0byBiZSBjb25jZXJuZWQgYnkgdGhpcyBldmFsdWF0aW9u
IG9mIC0+aXNfcnVubmluZwo+IF9hZnRlcl8gdmNwdV91bmJsb2NrKCksIHdoZW4gcHJldmlvdXNs
eSAoanVzdCBsaWtlIHZjcHVfa2ljaygpCj4gZG9lcykgaXQgd2FzIGludGVudGlvbmFsbHkgZG9u
ZSBiZWZvcmUuCgpJZiB0aGUgdW5ibG9jayBzZXRzIHYtPmlzX3J1bm5pbmcgdG8gdHJ1ZSB0aGF0
J3MgZmluZSwgWGVuIHdpbGwgc2VuZCBhCnBvc3RlZCBpbnRlcnJ1cHQgSVBJIGFuZCB0aGUgZGVz
dGluYXRpb24gcENQVSB3aWxsIGVpdGhlciBiZSBpbiByb290Cm1vZGUgYW5kIHRodXMgcmFpc2Ug
YSBzb2Z0aXJxIG9yIGluIG5vbi1yb290IG1vZGUgYW5kIHBlcmZvcm0gdGhlIFBJUgp0byBJUlIg
c3luYyBhbmQgcG9zc2libGUgaW50ZXJydXB0IGluamVjdGlvbi4KCkkgc2VlIHRoYXQgY2FjaGlu
ZyB0aGUgdmFsdWUgb2YgaXNfcnVubmluZyBtaWdodCBiZSBoZWxwZnVsIGluIG9yZGVyCnRvIHBy
ZXZlbnQgcG9pbnRsZXNzIElQSSdpbmcuIElmIHRoZSB2Q1BVIHdhc24ndCBydW5uaW5nIGJlZm9y
ZSB0aGUKdW5ibG9jayB0aGVyZSdzIG5vIHJlYXNvbiB0byBzZW5kIGFuIElQSSB0byBpdCwgYmVj
YXVzZSB0aGUgc3luYyBvZgpQSVIgdG8gSVJSIHdpbGwgaGFwcGVuIGF0IHZtZW50cnkgYW55d2F5
LgoKPiBJIHdvbmRlciBhbnl3YXkKPiB3aGV0aGVyIHRoaXMgYW5kIHRoZSBjaGFuZ2UgdG8gaXJx
LmMgc2hvdWxkIHJlYWxseSBiZSBpbiBhCj4gc2luZ2xlIHBhdGNoLCB0aGUgbW9yZSB0aGF0IHlv
dSBzdGFydCB0aGUgcmVzcGVjdGl2ZSBwYXJ0IG9mCj4gdGhlIGRlc2NyaXB0aW9uIHdpdGggIldo
aWxlIHRoZXJlIGFsc28gc2ltcGxpZnkgLi4uIi4gQnV0IGluCj4gdGhlIGVuZCBpdCBpcyB1cCB0
byBLZXZpbidzIG9yIEp1bidzIGp1ZGdlbWVudCBhbnl3YXkuCgpZZXMsIHRoYXQgbWFrZXMgc2Vu
c2UuIFdpbGwgd2FpdCBmb3IgZmVlZGJhY2sgZnJvbSBLZXZpbiBvciBKdW4gYmVmb3JlCnNlbmRp
bmcgYSBuZXcgdmVyc2lvbiBhbnl3YXkuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
