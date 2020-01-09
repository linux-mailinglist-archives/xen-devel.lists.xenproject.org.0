Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C88135768
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 11:52:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipVNE-00039C-3b; Thu, 09 Jan 2020 10:49:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yNyl=26=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ipVNC-000397-PC
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 10:49:06 +0000
X-Inumbo-ID: a3321f88-32cd-11ea-b89f-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3321f88-32cd-11ea-b89f-bc764e2007e4;
 Thu, 09 Jan 2020 10:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578566938;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=r8v4YRjMrHVJ3bXWspsAFJY50i750Lueju0itrbzygo=;
 b=URE5h1p3UR1fapIdP7Lw1v/Ut6+aBTTMu9B7q+AQPTCBlxhr88hYc6vI
 EXlqdTQBj48Ds5ScF+t50pSHPqadG4Zac9Mu407LHg6rYq5OzL5UpPHe5
 EdO2zehrLA8ZxQaKAkoWtbgQHMwjRgOth9tvZgUthIDZrz5awuH1+d7Py w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LYkC9kHOqtEjde9Z+P54sqRLd2v89EHpK5TfnhhRcPxmQauegwcmmuQeV4V3S0csWCLKEMHZby
 zByWTfpJtKRNvmtUia6ZIDCovgPOfC9ee5QKHISd+d52gFY90Ky/OurtRKXSWIVjAVZEGLjqMF
 nvGptB3IMUodAsdQQ0xHo98/irKyzK/bymZx87S4jfL30oZwQl1h/ha7rMVnhoRVBopsKrP/xJ
 Is3+cnYk2FlJ/TrWdg5PSLxfOO3G0S6XjHqm3zeywMyRVbpku1ph66xeauDY613s3++K0nh/nW
 uag=
X-SBRS: 2.7
X-MesageID: 10660599
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,413,1571716800"; d="scan'208";a="10660599"
Date: Thu, 9 Jan 2020 11:48:50 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200109104850.GZ11756@Air-de-Roger>
References: <20191224101810.45915-1-roger.pau@citrix.com>
 <8264d39f-4f5e-e7c0-f0e0-6be23feba3c3@citrix.com>
 <20191224124258.GC11756@Air-de-Roger>
 <950e6538-40f4-c698-75d9-f532bccfae52@citrix.com>
 <20191224181752.GE11756@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191224181752.GE11756@Air-de-Roger>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/hvm: always expose x2APIC feature in
 max HVM cpuid policy
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMjQsIDIwMTkgYXQgMDc6MTc6NTJQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIERlYyAyNCwgMjAxOSBhdCAwNDowMDoyN1BNICswMDAwLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOgo+ID4gT24gMjQvMTIvMjAxOSAxMjo0MiwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiA+ID4gT24gVHVlLCBEZWMgMjQsIDIwMTkgYXQgMTI6MjM6MTJQTSArMDAwMCwg
QW5kcmV3IENvb3BlciB3cm90ZToKPiA+ID4+IE9uIDI0LzEyLzIwMTkgMTA6MTgsIFJvZ2VyIFBh
dSBNb25uZSB3cm90ZToKPiA+ID4+PiBPbiBoYXJkd2FyZSB3aXRob3V0IHgyQVBJQyBzdXBwb3J0
IFhlbiBlbXVsYXRlZCBsb2NhbCBBUElDIHdpbGwKPiA+ID4+PiBwcm92aWRlIHN1Y2ggbW9kZSwg
YW5kIGhlbmNlIHRoZSBmZWF0dXJlIHNob3VsZCBiZSBzZXQgaW4gdGhlIG1heGltdW0KPiA+ID4+
PiBIVk0gY3B1aWQgcG9saWN5Lgo+ID4gPj4+Cj4gPiA+Pj4gTm90IGV4cG9zaW5nIGl0IGluIHRo
ZSBtYXhpbXVtIHBvbGljeSByZXN1bHRzIGluIEhWTSBkb21haW5zIG5vdAo+ID4gPj4+IGdldHRp
bmcgc3VjaCBmZWF0dXJlIGV4cG9zZWQgdW5sZXNzIGl0J3MgYWxzbyBzdXBwb3J0ZWQgYnkgdGhl
Cj4gPiA+Pj4gdW5kZXJseWluZyBoYXJkd2FyZS4KPiA+ID4+Pgo+ID4gPj4+IFNpZ25lZC1vZmYt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4gPj4geDJhcGlj
IGhhcyBuZXZlciBiZWVuIGV4cG9zZWQgdmlhIHRoaXMgbWVjaGFuaXNtLCBkdWUgdG8gaXRzIGVm
ZmVjdHMgb24KPiA+ID4+IHRvcG9sb2d5IGNhbGN1bGF0aW9ucy4KPiA+ID4gV2VsbCwgaXQncyBl
eHBvc2VkIGluIGh2bV9tYXhfY3B1aWRfcG9saWN5IGlmIGl0J3MgcHJlc2VudCBpbiB0aGUKPiA+
ID4gaGFyZHdhcmUuIElNTyBpdCdzIGtpbmQgb2Ygd2VpcmQgdGhhdCB0aGUgcHJlc2VuY2Ugb2Yg
dGhlIHgyQVBJQyBmZWF0dXJlCj4gPiA+IG9uIHRoZSBtYXggcG9saWN5IGRlcGVuZHMgb24gdGhl
IHVuZGVybHlpbmcgaGFyZHdhcmUsIHdoZW4gaXQncyBhbHdheXMKPiA+ID4gc3VwcG9ydGVkIGJ5
IHRoZSBlbXVsYXRlZCB2bGFwaWMuCj4gPiA+Cj4gPiA+IEkgdGhpbmsgeDJBUElDIG11c3QgZWl0
aGVyIGFsd2F5cyBiZSBwYXJ0IG9mIHRoZSBtYXggcG9saWN5LCBvciBuZXZlciwKPiA+ID4gb3Ig
ZWxzZSBpdCdzIHZlcnkgZWFzeSB0byBjYXVzZSByZWdyZXNzaW9ucyBiZWNhdXNlIGl0J3Mgbm90
IHNvIGVhc3kKPiA+ID4gdG8gZmluZCBhIGJveCB3aXRob3V0IHgyQVBJQy4KPiA+IAo+ID4gSG1t
IC0gdGhpcyBkb2VzIGhpZ2hsaWdodCB0aGUgaW5jb25zaXN0ZW5jeSBpbiB0aGUgZXhpc3Rpbmcg
bG9naWMuwqAgSSdtCj4gPiBub3Qgb3Zlcmx5IHN1cnByaXNlZCAtIHRoaXMgaXMgYSByZW1uYW50
IG9mIHRoZSBvbGQgbW9kZWwgd2hpY2ggaGFzbid0Cj4gPiBiZWVuIHJld3JpdHRlbiB5ZXQuCj4g
Cj4gSSBjb3VsZCBkbyBzb21ldGhpbmcgbGlrZToKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
eGMveGNfY3B1aWRfeDg2LmMgYi90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwo+IGluZGV4IDUx
OWQ2ZDhiZDAuLmE3YWRjNDE4NTQgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGMveGNfY3B1aWRf
eDg2LmMKPiArKysgYi90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwo+IEBAIC02NDEsNiArNjQx
LDcgQEAgaW50IHhjX2NwdWlkX2FwcGx5X3BvbGljeSh4Y19pbnRlcmZhY2UgKnhjaCwgdWludDMy
X3QgZG9taWQsCj4gICAgICAgICAgcC0+ZXh0ZC5pdHNjID0gdHJ1ZTsKPiAgICAgICAgICBwLT5i
YXNpYy52bXggPSB0cnVlOwo+ICAgICAgICAgIHAtPmV4dGQuc3ZtID0gdHJ1ZTsKPiArICAgICAg
ICBwLT5iYXNpYy54MmFwaWMgPSB0cnVlOwo+ICAgICAgfQo+ICAKPiAgICAgIHJjID0geDg2X2Nw
dWlkX2NvcHlfdG9fYnVmZmVyKHAsIGxlYXZlcywgJm5yX2xlYXZlcyk7Cj4gCj4gQnV0IGl0IHNl
ZW1zIGtpbmQgb2YgYm9ndXMgdG8gbWUgdGhhdCBzdWNoIGZlYXR1cmUgaXMgbm90IHBhcnQgb2Yg
dGhlCj4gaHZtX21heF9jcHVpZF9wb2xpY3ksIGF0IHRoZSBlbmQgb2YgZGF5IHRoZSB0b29sc3Rh
Y2sgaGFzIG5vIGtub3dsZWRnZQo+IG9mIHdoZXRoZXIgdGhlIGh5cGVydmlzb3IgcHJvdmlkZXMg
YSB4MkFQSUMgaW50ZXJmYWNlIG9yIG5vdCAoYXBhcnQKPiBmcm9tIHVzIGhhcmRjb2RpbmcgaXQg
aW4gdGhlIHRvb2xzIGxpa2UgdGhlIGFib3ZlIHBhdGNoKS4KClBpbmc/CgpJIGRvbid0IHRoaW5r
IHdlIHJlYWNoZWQgYSBjb25jbHVzaW9uIGFzIHRvIHdoZXRoZXIgeDJBUElDIHNob3VsZCBiZQpm
b3JjZWQgZnJvbSB0aGUgdG9vbHN0YWNrIHNpZGUgb3IgcGFydCBvZiB0aGUgSFZNIG1heCBwb2xp
Y3kuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
