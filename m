Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F9214D835
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 10:21:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix5yY-0004mq-VM; Thu, 30 Jan 2020 09:19:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=avZM=3T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ix5yX-0004m6-Cn
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 09:19:01 +0000
X-Inumbo-ID: 8c8acb16-4341-11ea-8a22-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c8acb16-4341-11ea-8a22-12813bfff9fa;
 Thu, 30 Jan 2020 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580375940;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OI17yzslU7fDT8D8q1McrMKlKn1Xh8xTh/S9iigpbGY=;
 b=INldLD6RV5+Au3pvnN7tMMaR5UK/dPBp8Hg7E3x+9FOzPWkigHKM77+6
 2k74BUnmOOFmHBPfk1BzozgbHpLerEwqiczS2AVJiDzevl8Pfs2CCmcwr
 SG2pglqj0fL32tsydCvVZic+rWJclElmqmHn3NEt95pm309J4VZsvEasr k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EbLuXuhjFcaw1murCQBpELYILxJABFR/hzLKCY+dSgceUOWcnIOXqEXDXKsIqRt0IxsFPw9uuV
 5bYQhWjFhoz7KQgMH/i2tOD+M/7YFJYNQTJY9qcVCzKVuJlZTUyZXXB7BxquTr3JUltm4jBiHG
 im4Ozb4+k5OIwySMa5CiyIVjToD4Bjti7m0Hn2kRphj8b6KZFYjPSDkTio2IpggRDpAudfildk
 wplo1M1KyDDlC1vfZd7JB01nbBYeOodtgkKO1dbMldNf4FVBhGxkd0sgOGze630o4+GZFSNaLR
 rVM=
X-SBRS: 2.7
X-MesageID: 11681643
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,381,1574139600"; d="scan'208";a="11681643"
Date: Thu, 30 Jan 2020 10:18:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200130091853.GC4679@Air-de-Roger>
References: <osstest-146578-mainreport@xen.org>
 <d89fdcee-8e9e-c804-5b00-2b0551eb03ef@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d89fdcee-8e9e-c804-5b00-2b0551eb03ef@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [xen-unstable test] 146578: regressions - FAIL
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
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTA6MTI6MzlBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMzAuMDEuMjAyMCAwNDo1Niwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+
ID4gZmxpZ2h0IDE0NjU3OCB4ZW4tdW5zdGFibGUgcmVhbCBbcmVhbF0KPiA+IGh0dHA6Ly9sb2dz
LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDY1NzgvCj4gPiAKPiA+IFJl
Z3Jlc3Npb25zIDotKAo+ID4gCj4gPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFy
ZSBibG9ja2luZywKPiA+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+
ID4gIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtd2luNy1hbWQ2NCAgNyB4ZW4tYm9vdCAgICAg
ICAgIGZhaWwgUkVHUi4gdnMuIDE0NjU2Mwo+IAo+IEFmYWljdCBpdCBpcyBub3QgInhlbi1ib290
IiB3aGljaCBmYWlsZWQgaGVyZSwgYnV0IHRoZSBnb2luZwo+IGRvd24gb2YgdGhlIHByaW9yIG5h
dGl2ZSBrZXJuZWwgd2hpY2ggd2FzIHVzZWQgdG8gZG8gdGhlCj4gaW5zdGFsbDoKPiAKPiBKYW4g
MjkgMjM6MTk6MzQuMzcwNjYzIFsgIDE4Mi40NzIwNzNdIGUxMDAwZTogZXRoMCBOSUMgTGluayBp
cyBEb3duCj4gSmFuIDI5IDIzOjE5OjM2LjQ3MDU4NyBbICAxODIuNDc2NzI4XSBrdm06IGV4aXRp
bmcgaGFyZHdhcmUgdmlydHVhbGl6YXRpb24KPiBKYW4gMjkgMjM6MTk6MzYuNDcwNjYwIFsgIDE4
Mi40ODE1NzRdIHNkIDM6MDowOjA6IFtzZGJdIFN5bmNocm9uaXppbmcgU0NTSSBjYWNoZQo+IEph
biAyOSAyMzoxOTozNi40ODI2MTcgWyAgMTgyLjQ4Njg3NF0gc2QgMjowOjA6MDogW3NkYV0gU3lu
Y2hyb25pemluZyBTQ1NJIGNhY2hlCj4gSmFuIDI5IDIzOjE5OjM2LjQ4MjY4MyBbICAxODIuNTI4
MjYzXSBlMTAwMGU6IEVFRSBUWCBMUEkgVElNRVI6IDAwMDAwMDAwCj4gSmFuIDI5IDIzOjE5OjM2
LjUzMDUxNiBbICAxODIuNTM3MDM2XSBlMTAwMGU6IEVFRSBUWCBMUEkgVElNRVI6IDAwMDAwMDAw
Cj4gSmFuIDI5IDIzOjE5OjM2LjUzMDU4MiBbICAxODIuNTQ0NTA0XSB1c2IgNi0yOiBVU0IgZGlz
Y29ubmVjdCwgZGV2aWNlIG51bWJlciAyCj4gSmFuIDI5IDIzOjE5OjM2LjU0MjU3OSBbICAxODIu
NjI0MTI1XSByZWJvb3Q6IFJlc3RhcnRpbmcgc3lzdGVtCj4gSmFuIDI5IDIzOjE5OjM2LjYxNDU1
NCBbICAxODIuNjI1NTI3XSBBTUQtVmk6IEV2ZW50IGxvZ2dlZCBbCj4gSmFuIDI5IDIzOjE5OjM2
LjYyNjY3MSBbICAxODIuNjI1NTI3XSBJT19QQUdFX0ZBVUxUIGRldmljZT0wMDoxMy4xIGRvbWFp
bj0weDAwMDYgYWRkcmVzcz0weDAwMDAwMDAwMDAwMDAwODAgZmxhZ3M9MHgwMDIwXQo+IAo+IFRo
ZXNlIGxhc3QgdHdvIGxpbmVzIHRoZW4gbG9vayB0byByZXBlYXQgaW5kZWZpbml0ZWx5LiBJcwo+
IHRoZXJlIGEgbmV3IGtlcm5lbCB2ZXJzaW9uIGluIHVzZSB3aGljaCBoYXMgcmVncmVzc2VkIG9u
IHRoaXMKPiBwYXJ0aWN1bGFyIGhhcmR3YXJlPwoKb3NzdGVzdCB3YXMgcmVjZW50bHkgdXBncmFk
ZWQgdG8gdXNlIExpbnV4IDQuMTksIGJ1dCB0aGF0IHNlZW1zIHRvIGJlCmEgc3BvcmFkaWMgZmFp
bHVyZSwgb3RoZXIgdGVzdHMgZnJvbSB0aGUgeGVuLXVuc3RhYmxlIGJyYW5jaCBzZWVtIHRvCndv
cmsgZmluZToKCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvcmVz
dWx0cy9ob3N0L3Bpbm90MC5odG1sCgpNYXliZSB3ZSBjb3VsZCBkaXNhYmxlIHRoZSBpb21tdSBv
biB0aGUgTGludXggY29tbWFuZCBsaW5lIHRvCndvcmthcm91dW5kIHRoaXM/CgpSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
