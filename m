Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F43CE1883
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 13:08:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNESG-00041p-Sg; Wed, 23 Oct 2019 11:05:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JVcx=YQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iNESF-00041k-2i
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 11:05:27 +0000
X-Inumbo-ID: 0308192b-f585-11e9-947c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0308192b-f585-11e9-947c-12813bfff9fa;
 Wed, 23 Oct 2019 11:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571828725;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bxCpVevrK2UnWQXQaUJt1cGpv7No+VzPBruDRmg2zx8=;
 b=WyLCHXPWjAAeVMhNSIlNcNxcMFWhsUDoZ4STdGsrmJMIIdgI59KUsyXN
 j+ZsS9EFKMZNkrxnzvbxxi+a41iSFEEjlVJIZcL9521XcqjH4V59Ticou
 9SyELIOm/wN3fDogltaUmil0z2flBBSOkA9NtFOtd0jIX2//z/aQlAgEN A=;
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
IronPort-SDR: cLyn+hFVfIRi+0ReHS6ZbR7cgehoXWxNPIikP77ta3v0jdff9myd9u9eWrFIUIlLYyblF/MncN
 OuK00BM10myeIvUPdJXW4IUTmArcLcS4vuaTS5yI0ZNpsxIKdeod3TuOWTF41a0PxVBDTglHNr
 GpxeP8ZrCCC+UqsN1C0E80y6BzKDXVFB751HhFQFLefI3RE+Imls96tQ7tPqG95A7cwpCAkmBb
 zRQWywNHWjcZUu9mDrJlps3ryRwWu0rrDSH/KBBKJgADezNpI70sj5BjV+FkIjGkDiXIOxSxQh
 IP8=
X-SBRS: 2.7
X-MesageID: 7311837
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,220,1569297600"; 
   d="scan'208";a="7311837"
Date: Wed, 23 Oct 2019 13:05:14 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20191023110514.GQ17494@Air-de-Roger>
References: <20191023085739.43585-1-roger.pau@citrix.com>
 <20191023105513.5vli2q4khpbf3gdx@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023105513.5vli2q4khpbf3gdx@debian>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/tsc: update vcpu time info on
 guest TSC adjustments
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMTE6NTU6MTNBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIE9jdCAyMywgMjAxOSBhdCAxMDo1NzozOUFNICswMjAwLCBSb2dlciBQYXUgTW9u
bmUgd3JvdGU6Cj4gPiBJZiBhIEhWTS9QVkggZ3Vlc3Qgd3JpdGVzIHRvIE1TUl9JQTMyX1RTQ3tf
QURKVVNUfSBhbmQgdGh1cyBjaGFuZ2VzCj4gPiB0aGUgdmFsdWUgb2YgdGhlIHRpbWUgc3RhbXAg
Y291bnRlciB0aGUgdmNwdSB0aW1lIGluZm8gbXVzdCBhbHNvIGJlCj4gPiB1cGRhdGVkLCBvciB0
aGUgdGltZSBjYWxjdWxhdGVkIGJ5IHRoZSBndWVzdCB1c2luZyB0aGUgWGVuIFBWIGNsb2NrCj4g
PiBpbnRlcmZhY2Ugd2lsbCBiZSBza2V3ZWQuCj4gPiAKPiA+IFVwZGF0ZSB0aGUgdmNwdSB0aW1l
IGluZm8gd2hlbiB0aGUgZ3Vlc3Qgd3JpdGVzIHRvIGVpdGhlciBNU1JfSUEzMl9UU0MKPiA+IG9y
IE1TUl9JQTMyX1RTQ19BREpVU1QuIFRoaXMgZml4ZXMgbG9ja3VwcyBzZWVuIHdoZW4gcnVubmlu
ZyB0aGUKPiA+IHB2LXNoaW0gb24gQU1EIGhhcmR3YXJlLCBzaW5jZSB0aGUgc2hpbSB3aWxsIGFn
Z3Jlc3NpdmVseSB0cnkgdG8ga2VlcAo+ID4gVFNDcyBpbiBzeW5jIGJ5IHBlcmlvZGljYWxseSB3
cml0aW5nIHRvIE1TUl9JQTMyX1RTQyBpZiB0aGUgVFNDIGlzIG5vdAo+ID4gcmVsaWFibGUuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgo+ID4gLS0tCj4gPiBDYzogSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPgo+ID4g
LS0tCj4gPiAgeGVuL2FyY2gveDg2L2h2bS9odm0uYyB8IDQgKysrKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9o
dm0vaHZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gPiBpbmRleCA5YWNkMzU5Yzk5Li5l
NGMwNDI1MzMwIDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+ID4gKysr
IGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+ID4gQEAgLTQ0Miw2ICs0NDIsOCBAQCBzdGF0aWMg
dm9pZCBodm1fc2V0X2d1ZXN0X3RzY19tc3Ioc3RydWN0IHZjcHUgKnYsIHU2NCBndWVzdF90c2Mp
Cj4gPiAgCj4gPiAgICAgIGh2bV9zZXRfZ3Vlc3RfdHNjKHYsIGd1ZXN0X3RzYyk7Cj4gPiAgICAg
IHYtPmFyY2guaHZtLm1zcl90c2NfYWRqdXN0ICs9IHYtPmFyY2guaHZtLmNhY2hlX3RzY19vZmZz
ZXQgLSB0c2Nfb2Zmc2V0Owo+ID4gKyAgICBpZiAoIHYgPT0gY3VycmVudCApCj4gPiArICAgICAg
ICB1cGRhdGVfdmNwdV9zeXN0ZW1fdGltZSh2KTsKPiAKPiBXaHkgbm90IGdldCByaWQgb2YgdGhl
IHRlc3QgYW5kIGFsd2F5cyBjYWxsIHVwZGF0ZV92Y3B1X3N5c3RlbV90aW1lKHYpPwoKSWYgdGhl
IHZjcHUgaXMgbm90IHJ1bm5pbmcgdGhlIHVwZGF0ZSB3aWxsIGJlIGRvbmUgYnkgdGhlIHNjaGVk
dWxpbmcKY29kZSBpbiBzY2hlZHVsZV90YWlsLiBDYWxsaW5nIHVwZGF0ZV92Y3B1X3N5c3RlbV90
aW1lIHVuY29uZGl0aW9uYWxseQp3b3VsZCB3b3JrLCBJIHdhcyBqdXN0IHRyeWluZyB0byBhdm9p
ZCB0aGUgb3ZlcmhlYWQgaWYgaXQncyBub3QgcmVhbGx5Cm5lZWRlZC4KClRoYW5rcywgUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
