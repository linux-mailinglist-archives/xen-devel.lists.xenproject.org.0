Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F3B11E2EE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 12:43:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifjJL-0004DF-EP; Fri, 13 Dec 2019 11:40:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kzvv=2D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ifjJJ-0004D6-IG
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 11:40:41 +0000
X-Inumbo-ID: 5e8a9378-1d9d-11ea-b6f1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e8a9378-1d9d-11ea-b6f1-bc764e2007e4;
 Fri, 13 Dec 2019 11:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576237232;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=5GZfgk3kx7h4DBva+4BbrBQlp4uJVTs20OMr/CpjgVA=;
 b=gvzYyF61L0+ySxr7UEahhm2sauPLpgmhV6i2sCR4Pm3O5LjxqbCiK2ms
 SEeM1fP2XnNBpwuJt5C8w3/Etrp3LT3feq8QGZLtNU2aDUtuwNcGxUKUj
 LdKa3HUWFFKEj8lotWGgMXe7BB0L6G326a+aP5GXfgTMHxDt+rbnkQoKk g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kRagLa1KekCs4fqGtXz48tUFQO1UWViExPUaag5A7dfdKz+2emGZWiB8F3FqqxevXRMpMUTTSm
 cLcH6lBGe7XHQrU6/NaJtDvhSGhVduG6XIVMh3OkoQLZpLVuubxAXr56CLp9rQ/1XxWjykrQbx
 /RtrE1tV1L/7leAhnKWG8bcPMxK6oj6euZH/B0z5iAtpj0OXEgBA9xOEObYjXjqckN2WORNTux
 rPVlfbF5chkyEX3oWkPvu6HJ1p+Fc2gue71hDiN7HXFPinlQBCGwM8DoA5o+rfcQAd/9G/s8aW
 GJ8=
X-SBRS: 2.7
X-MesageID: 10207231
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; d="scan'208";a="10207231"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24051.30893.31444.319978@mariner.uk.xensource.com>
Date: Fri, 13 Dec 2019 11:40:29 +0000
To: Julien Grall <julien@xen.org>
In-Reply-To: <6ea2af3c-b277-1118-7c83-ebcb0809d449@xen.org>
References: <osstest-144736-mainreport@xen.org>
 <e05a3bc4-2c1d-7e71-af42-d6362c4f6d07@suse.com>
 <6ea2af3c-b277-1118-7c83-ebcb0809d449@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.13-testing test] 144736: regressions - FAIL
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbeGVuLTQuMTMtdGVzdGluZyB0
ZXN0XSAxNDQ3MzY6IHJlZ3Jlc3Npb25zIC0gRkFJTCIpOgo+IEFNRCBTZWF0dGxlIGJvYXJkcyAo
bGF4dG9uKikgYXJlIGtub3duIHRvIGZhaWwgYm9vdGluZyB0aW1lIHRvIHRpbWUgCj4gYmVjYXVz
ZSBvZiBQQ0kgdHJhaW5pbmcgaXNzdWUuIFdlIGhhdmUgd29ya2Fyb3VuZCBmb3IgaXQgKGludm9s
dmluZyAKPiBsb25nZXIgcG93ZXIgY3ljbGUpIGJ1dCB0aGlzIGlzIG5vdCAxMDAlIHJlbGlhYmxl
LgoKVGhpcyB3YXNuJ3QgYSBwb3dlciBjeWNsZS4gIEl0IHdhcyBhIHNvZnR3YXJlLWluaXRpYXRl
ZCByZWJvb3QuICBJdApkb2VzIGFwcGVhciB0byBoYW5nIGluIHRoZSBmaXJtd2FyZSBzb21ld2hl
cmUuICBEbyB3ZSBleHBlY3QgdGhlIHBjaQp0cmFpbmluZyBpc3N1ZSB0byBvY2N1ciBpbiB0aGlz
IGNhc2UgPwoKPiA+PiDCoCB0ZXN0LWFybWhmLWFybWhmLXhsLXZoZMKgwqDCoMKgwqAgMTggbGVh
ay1jaGVjay9jaGVja8KgwqDCoMKgwqDCoMKgwqAgZmFpbCBSRUdSLiAKPiA+PiB2cy4gMTQ0Njcz
Cj4gPiAKPiA+IFRoYXQgb25lIGlzIHN0cmFuZ2UuIEEgcWVtdSBwcm9jZXNzIHNlZW1zIHRvIGhh
dmUgaGF2ZSBkaWVkIHByb2R1Y2luZwo+ID4gYSBjb3JlIGZpbGUsIGJ1dCBJIGNvdWxkbid0IGZp
bmQgYW55IGxvZyBjb250YWluaW5nIGFueSBvdGhlciBpbmRpY2F0aW9uCj4gPiBvZiBhIGNyYXNo
ZWQgcHJvZ3JhbS4KPiAKPiBJIGhhdmVuJ3QgZm91bmQgYW55dGhpbmcgaW50ZXJlc3RpbmcgaW4g
dGhlIGxvZy4gQElhbiBjb3VsZCB5b3Ugc2V0IHVwIAo+IGEgcmVwcm8gZm9yIHRoaXM/CgpUaGVy
ZSBpcyBzb21lIGhlaXNlbmJ1ZyB3aGVyZSBxZW11IGNyYXNoZXMgd2l0aCB2ZXJ5IGxvdyBwcm9i
YWJpbGl0eS4KKEkgZm9yZ2V0IHdoZXRoZXIgb25seSBvbiBhcm0gb3Igb24geDg2IHRvbykuICBU
aGlzIGhhcyBiZWVuIGFyb3VuZApmb3IgYSBsaXR0bGUgd2hpbGUuICBJIGRvdWJ0IHRoaXMgcGFy
dGljdWxhciBmYWlsdXJlIHdpbGwgYmUKcmVwcm9kdWNpYmxlLgoKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
