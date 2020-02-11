Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5AA159199
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 15:10:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1WBM-00086c-W7; Tue, 11 Feb 2020 14:06:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=46st=37=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j1WBL-00086X-0m
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 14:06:31 +0000
X-Inumbo-ID: b34b73e6-4cd7-11ea-8bf0-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b34b73e6-4cd7-11ea-8bf0-bc764e2007e4;
 Tue, 11 Feb 2020 14:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581429990;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Wl22tKKlUa3wpf6HbXTd2sxUL2sdiJmnYmLctkkZ6Z8=;
 b=UjYlGPkpEGBgbWKjZCp99tOw9x0FFYttKG6hhsfp/mtJOCt/I2566zF6
 rZCEkcjFKaGV9t9eA7pf+z5jCCiO5boZrreLQCPqYXiMv2otjMDFIMIIT
 afcmFBYtX8TUC43X3McDKa+D/LYU37aGuxQBDCzdE52e0CrWHz0mWB0AE 0=;
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
IronPort-SDR: YlpOviF7/Rx1jYHV/Km1ckXKA6CQogtOgjKE4C1Gr1QNcOYEgURDQmdTdfEfObFfD6KVqJowWw
 cEsO23D4VQC0epKvnLL55CJK0423XRyigMjSCpY3/UTKqbLBH4XqptGE2ti71aFVbDlgZSLDy2
 /UO373nVSjUHiS9fM1HDu76GO9zMGEdWGNUU+9RwB5kdk319HSbzZi+eYrO2ZgN4V0iZ8uOU2B
 Qkckpi3ZZfA0LeAmIUPv/4+ioB7n80re4HzNBRL3X4ADfBksQ6TgQCIsqXCGPCX0223PCF/JE/
 u28=
X-SBRS: 2.7
X-MesageID: 12445183
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12445183"
Date: Tue, 11 Feb 2020 15:06:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200211140621.GK4679@Air-de-Roger>
References: <20200210172829.43604-1-roger.pau@citrix.com>
 <20200210172829.43604-8-roger.pau@citrix.com>
 <20200211103424.vtokisnsg4hq6pzw@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211103424.vtokisnsg4hq6pzw@debian>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 7/7] x86/tlb: use Xen L0 assisted TLB
 flush when available
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTEsIDIwMjAgYXQgMTA6MzQ6MjRBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIEZlYiAxMCwgMjAyMCBhdCAwNjoyODoyOVBNICswMTAwLCBSb2dlciBQYXUgTW9u
bmUgd3JvdGU6Cj4gWy4uLl0KPiA+ICAKPiA+ICBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgewo+ID4g
QEAgLTMyLDYgKzM0LDggQEAgc3RydWN0IGh5cGVydmlzb3Jfb3BzIHsKPiA+ICAgICAgdm9pZCAo
KnJlc3VtZSkodm9pZCk7Cj4gPiAgICAgIC8qIEZpeCB1cCBlODIwIG1hcCAqLwo+ID4gICAgICB2
b2lkICgqZTgyMF9maXh1cCkoc3RydWN0IGU4MjBtYXAgKmU4MjApOwo+ID4gKyAgICAvKiBMMCBh
c3Npc3RlZCBUTEIgZmx1c2ggKi8KPiA+ICsgICAgaW50ICgqZmx1c2hfdGxiKShjb25zdCBjcHVt
YXNrX3QgKm1hc2ssIGNvbnN0IHZvaWQgKnZhLCB1bnNpZ25lZCBpbnQgb3JkZXIpOwo+ID4gIH07
Cj4gPiAgCj4gPiAgI2lmZGVmIENPTkZJR19HVUVTVAo+ID4gQEAgLTQxLDYgKzQ1LDE0IEBAIHZv
aWQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lkKTsKPiA+ICBpbnQgaHlwZXJ2aXNvcl9hcF9zZXR1cCh2
b2lkKTsKPiA+ICB2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpOwo+ID4gIHZvaWQgaHlwZXJ2
aXNvcl9lODIwX2ZpeHVwKHN0cnVjdCBlODIwbWFwICplODIwKTsKPiA+ICsvKgo+ID4gKyAqIEww
IGFzc2lzdGVkIFRMQiBmbHVzaC4KPiA+ICsgKiBtYXNrOiBjcHVtYXNrIG9mIHRoZSBkaXJ0eSB2
Q1BVcyB0aGF0IHNob3VsZCBiZSBmbHVzaGVkLgo+ID4gKyAqIHZhOiBsaW5lYXIgYWRkcmVzcyB0
byBmbHVzaCwgb3IgTlVMTCBmb3IgZ2xvYmFsIGZsdXNoZXMuCj4gCj4gSSB3YXMgaW4gdGhlIG1p
ZGRsZSBvZiB3cml0aW5nIG15IHBhdGNoIGFuZCBub3RpY2VkIHRoaXMuCj4gCj4gSSB0aGluayBO
VUxMIG1lYW5zICJmbHVzaGluZyB0aGUgZW50aXJlIGFkZHJlc3Mgc3BhY2UiIGhlcmU/CgpZZXMs
IHRoYXQncyByaWdodC4gSSBkaWRuJ3QgYWRkIGEgd2F5IHRvIGRpZmZlcmVudGlhdGUgYmV0d2Vl
biBnbG9iYWwKKGllOiBQR0UgbWFwcGluZ3MgaW5jbHVkZWQpIGZsdXNoZXMgYW5kIG5vbi1nbG9i
YWwgZmx1c2hlcywgc28gYWxsCmNhbGxzIGFyZSBhc3N1bWVkIHRvIGltcGx5IGZsdXNoZXMgb2Yg
Z2xvYmFsIG1hcHBpbmdzLgoKSXQgbWlnaHQgYmUgYmV0dGVyIGlmIHlvdSBhZGFwdCBpdCB5b3Vy
c2VsZiB0byB3aGF0ZXZlciBpcyBtb3JlIHN1aXRlZApmb3IgSHlwZXJWIHdoaWNoIGhhcyBtb3Jl
IHNlbGVjdGl2ZSBmbHVzaGVzIGF2YWlsYWJsZS4gWGVuIG9ubHkgaGFzIGFuCmh5cGVyY2FsbCB0
byByZXF1ZXN0IGEgZ2xvYmFsIGZsdXNoIG9uIGFsbCB2Q1BVcy4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
