Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AD815196E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 12:16:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyw9X-0002Ls-Av; Tue, 04 Feb 2020 11:13:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uGhi=3Y=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iyw9V-0002Lf-M7
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 11:13:57 +0000
X-Inumbo-ID: 6f37bc66-473f-11ea-ad98-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f37bc66-473f-11ea-ad98-bc764e2007e4;
 Tue, 04 Feb 2020 11:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580814836;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4Xs/PSz+VODOSKZComMpVo1BPTN7SLv/LkwORf8FvGc=;
 b=IC8GnmoFCe3T1Cvyjj+OHHdu57+4i73O2OR0FfA7nYeW1c8Hh8nFUdXE
 sH5earC6KXnK27H3Cr93CW00dMfTYaAENJdyOvmRojIJ6ojRsmhfQ4qNq
 nMFF+NaqOvLYjUX7jXbo46ARYaeno4dUBxBx5h3/6MNEAMlTpFoyKl7WO E=;
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
IronPort-SDR: mqLuhNGXcF9mljqlTsl2ey1kIC35ZqT5T21ef0moXX9iSd67xUxMho/A1Khhi/85vlvQ8QPbWg
 SwFCB2g26MDiWYJqHsKfPHNlZ4QL9wv9VOE0Fcz0ah6IXiR+kr3vA8cYLwia49mObVU13vqOzs
 +H6NBIN4K8OhJLsqlI27NW0S/Lh1XrPlPrQKvHpgcOYm6GbiGNtg5/mWe/2pRYCVgGeXMSvZgr
 uat2CIvGW+HvmcjlRsKSriO2Ue5x84zx/ybQwlF+OYBby9YlUoqw6hxIpeRoRovVkIDZyoebmz
 bhg=
X-SBRS: 2.7
X-MesageID: 12521578
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,401,1574139600"; d="scan'208";a="12521578"
Date: Tue, 4 Feb 2020 12:13:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200204111349.GI4679@Air-de-Roger>
References: <20200203173728.18135-1-roger.pau@citrix.com>
 <20200203173728.18135-2-roger.pau@citrix.com>
 <99dbde26-e11e-5bc5-b702-3c76a8370d91@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <99dbde26-e11e-5bc5-b702-3c76a8370d91@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 1/2] nvmx: implement support for MSR
 bitmaps
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMTA6MzI6NDdBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDMuMDIuMjAyMCAxODozNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gQEAg
LTE4Miw2ICsxOTIsMTEgQEAgdm9pZCBudm14X3ZjcHVfZGVzdHJveShzdHJ1Y3QgdmNwdSAqdikK
PiA+ICAgICAgICAgIGZyZWVfZG9taGVhcF9wYWdlKHYtPmFyY2guaHZtLnZteC52bXdyaXRlX2Jp
dG1hcCk7Cj4gPiAgICAgICAgICB2LT5hcmNoLmh2bS52bXgudm13cml0ZV9iaXRtYXAgPSBOVUxM
Owo+ID4gICAgICB9Cj4gPiArICAgIGlmICggbnZteC0+bXNyX21lcmdlZCApCj4gPiArICAgIHsK
PiA+ICsgICAgICAgIGZyZWVfZG9taGVhcF9wYWdlKG52bXgtPm1zcl9tZXJnZWQpOwo+ID4gKyAg
ICAgICAgbnZteC0+bXNyX21lcmdlZCA9IE5VTEw7Cj4gPiArICAgIH0KPiAKPiBDYW4gdGhpcyBu
b3QgYmUgZG9uZSAuLi4KPiAKPiA+ICB9Cj4gPiAgIAo+ID4gIHZvaWQgbnZteF9kb21haW5fcmVs
aW5xdWlzaF9yZXNvdXJjZXMoc3RydWN0IGRvbWFpbiAqZCkKPiAKPiAuLi4gaW4gdGhpcyBmdW5j
dGlvbiwgdGh1cyBoYXBwZW5pbmcgZWFybGllciB1cG9uIGRvbWFpbgo+IGNsZWFudXAsIGFuZCBs
ZWF2aW5nIGxlc3MgcmVzb3VyY2VzIGFsbG9jYXRlZCBpbiBjYXNlIGEgZG9tYWluCj4gZW5kcyB1
cCBhcyB6b21iaWUgKGR1ZSB0byBhbm90aGVyIGJ1ZyBlbHNld2hlcmUpPyBBY3R1YWxseSAtCj4g
YXJlbid0IHlvdSBleHRlbmRpbmcgYW4gZXhpc3RpbmcgYnVnIHRoaXMgd2F5PyBXaGVuCj4gbmVz
dGVkaHZtX3ZjcHVfaW5pdGlhbGlzZSgpIGZhaWxzLCBuZXN0ZWRodm1fdmNwdV9kZXN0cm95KCkK
PiB3b24ndCBiZSBjYWxsZWQgYWZhaWN0LgoKbmVzdGVkaHZtX3ZjcHVfZGVzdHJveSB3aWxsIGJl
IGNhbGxlZCBieSBodm1fdmNwdV9pbml0aWFsaXNlICh0aGUKY2FsbGVyIG9mIG5lc3RlZGh2bV92
Y3B1X2luaXRpYWxpc2UpIEFGQUlDVC4KCj4gSGVuY2UgbnZteF92Y3B1X2luaXRpYWxpc2UoKSBu
b3QKPiBjbGVhbmluZyB1cCBhZnRlciBpdHNlbGYgaW4gY2FzZSBvZiBmYWlsdXJlIGxvb2tzIHRv
IGJlIGEKPiBtZW1vcnkgbGVhay4gQXMgb2YgYjMzNDRiYjFjYWUwIGFueSBzdWNoIHdpbGwgYmUg
dGFrZW4gY2FyZQo+IG9mIGltcGxpY2l0bHkgYXMgbG9uZyBhcyB0aGUgZnJlZWluZyBoYXBwZW5z
IG9uIHRoZQo+IHJlbGlucXVpc2gtcmVzb3VyY2VzIHBhdGhzLgoKSSBjYW4gbW92ZSB0aGUgbmV3
IGFkZGl0aW9uIHRvIG52bXhfZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzLCBJJ3ZlCm9yaWdp
bmFsbHkgYWRkZWQgaXQgdG8gbnZteF92Y3B1X2Rlc3Ryb3kgYmVjYXVzZSB0aGF0J3Mgd2hlcmUg
b3RoZXIKcGFnZXMgYXJlIGFsc28gZnJlZWQuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
