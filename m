Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE12E13B0F2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 18:30:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irPyl-0001PU-Jz; Tue, 14 Jan 2020 17:27:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irPyk-0001PK-Hm
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 17:27:46 +0000
X-Inumbo-ID: 2b2a1d86-36f3-11ea-8411-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b2a1d86-36f3-11ea-8411-12813bfff9fa;
 Tue, 14 Jan 2020 17:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579022862;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=rQSPu789Su8yaK3dstBERIIjBl1jLVP1MoP0bWFGMAg=;
 b=bl9cLHEGT1WHHyI0lnl2nARq9GB/9N+sjTci4v12zzvJpyJU+rxB5ZbZ
 8HGy6GO7T+rPghidCntZwlMxMx+3ON97re0LbQq4OnrADB9wNRrw0TvN5
 /gh36AzDeB7RPLJzty/5h30YJcl+O762f222sL+2TDzJX7E+vlpEMGkgX k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hmmk9hT7TeLUV2hmgK10aEMaC+YHcxwu817lcGOJqx7pZvhCozgDOqC51wFCmFBmcH8d/ZQkKV
 dZQtOi9eu1ulNlQ8flRUjFDQLS7/qiLl3mp38AyrA4OotPmLS7HsHq5DVjZbQjTHluzyBjY42L
 7ilBN5j8+F0yP4GDIR52TgrVihGbsaFoV/F4EgheL8DqcmvhaWNVQo8NzJ5d/8ICrIrc2qIE3j
 SPz1llzBSMqLZU+60+xT4okUoHATWm61zMSskdc4SeoiiIm41kxV6lqqswDSSyULcqKGGYgO4V
 6/E=
X-SBRS: 2.7
X-MesageID: 11333348
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,433,1574139600"; d="scan'208";a="11333348"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24093.64011.290962.219358@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 17:27:39 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200103130616.13724-3-andrew.cooper3@citrix.com>
References: <20200103130616.13724-1-andrew.cooper3@citrix.com>
 <20200103130616.13724-3-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 16/20] tools/libxl: Simplify callback
 handling in libxl-save-helper
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
Cc: Anthony
 Perard <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMTYvMjBdIHRvb2xzL2xpYnhsOiBTaW1wbGlm
eSBjYWxsYmFjayBoYW5kbGluZyBpbiBsaWJ4bC1zYXZlLWhlbHBlciIpOgo+IFRoZSB7c2F2ZSxy
ZXN0b3JlfV9jYWxsYmFjayBoZWxwZXJzIGNhbiBoYXZlIHRoZWlyIHNjb3BlIHJlZHVjZWQgdmFz
dGx5LAoKVGhpcyBwYXJ0IGlzIE9LIHdpdGggbWUgYWx0aG91Z2ggaXQgd291bGQgaGF2ZSBiZWVu
IG5pY2VyIHRvIHJldmlldyBpZgp0aGUgdGhlIG1vdmUgYW5kIHRoZSByZW5hbWUgd2VyZSBzZXBh
cmF0ZSBwYXRjaGVzLiAgSSBkb24ndCBrbm93IHdoeQppdCBpcyB2YWx1YWJsZS4KCj4gYW5kIGhl
bHBlcl9zZXRjYWxsYmFja3Nfe3NhdmUscmVzdG9yZX0oKSBkb2Vzbid0IG5lZWQgdG8gdXNlIGEK
PiB0ZXJuYXJ5IG9wZXJhdG9yIHRvIHdyaXRlIDAgKG1lYW5pbmcgTlVMTCkgaW50byBhbiBhbHJl
YWR5IHplcm9lZAo+IHN0cnVjdHVyZS4KCklzIHRoaXMgdW5yZWxhdGVkID8gIEkgdGhpbmsgc28u
Cgo+ICAgICAgICAgIG15ICRjX2NiID0gImNicy0+JG5hbWUiOwo+ICAgICAgICAgICRmX21vcmVf
c3ItPigiICAgIGlmICgkY19jYikgY2JmbGFncyB8PSAkY192O1xuIiwgJGVudW1jYWxsYmFja3Mp
Owo+IC0gICAgICAgICRmX21vcmVfc3ItPigiICAgICRjX2NiID0gKGNiZmxhZ3MgJiAkY192KSA/
ICR7ZW5jb2RlfV8ke25hbWV9IDogMDtcbiIsCj4gKyAgICAgICAgJGZfbW9yZV9zci0+KCIgICAg
aWYgKGNiZmxhZ3MgJiAkY192KSAkY19jYiA9ICR7ZW5jb2RlfV8ke25hbWV9O1xuIiwKPiAgICAg
ICAgICAgICAgICAgICAgICAgJHNldGNhbGxiYWNrcyk7CgpJdCBpcyBhIGxvbmcgdGltZSBzaW5j
ZSBJIGVkaXRlZCB0aGlzIGNvZGUgYnV0IEkgdGhpbmsgeW91ciByZWFzb25pbmcKaXMgImNicyBp
cyBhbHJlYWR5IHplcm8gb24gZW50cnkgYmVjYXVzZSBpdCBpcyBzdGF0aWM7IHRoZXJlZm9yZQpj
YnMtPiRuYW1lIG11c3QgYmUgbnVsbCwgc28gdGhlcmUgaXMgbm8gbmVlZCB0byB3cml0ZSAwIGlu
dG8gaXQgaW4gdGhlCmVsc2UgY2FzZSIuCgpIb3dldmVyLCB0aGUgbGluZSB5b3UgYXJlIHRvdWNo
aW5nIGlzIHByZWNlZGVkIGJ5ICJpZiAoJGNfY2IpIiB3aGljaApvbmx5IG1ha2VzIHNlbnNlIGlm
IHRoZSB2YXJpYWJsZSBtaWdodCBiZSBub24tbnVsbC4KClNvIHNvbWV0aGluZyBpcyBub3Qgcmln
aHQgaGVyZS4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
