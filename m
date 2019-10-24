Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E868E2F58
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 12:48:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNacB-0004ox-HA; Thu, 24 Oct 2019 10:45:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zclB=YR=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iNac9-0004os-W5
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 10:45:10 +0000
X-Inumbo-ID: 5899ce80-f64b-11e9-949b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5899ce80-f64b-11e9-949b-12813bfff9fa;
 Thu, 24 Oct 2019 10:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571913909;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=oE4PSAHCaecul5I/Wi2+BUeRhdM5rzYTi9wlqjeYL3k=;
 b=MF6B10mtcWENGCnw7hC9RG2w+J3Nis0PsbI23d1r7JgVyEWJkeTMYMNL
 oPfetcO6ZxUPJIn4upE/irDcL1mXLsM9KnQSsnzjoaNKv2XOhLHX5Wnf7
 nGUNLEa/Z5QT0B2GXT+f8Kw2ZFBBYsAbUxe3wcErOOarTvZH5ZjBNY1Op E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kKCaleMXe9BOhsEpRi2R8PFnEWaUltFBL/G+ELCGaMmBiUqZmuYr5+zsAPwwmGVZSMJPQWHAdb
 snlXjOUQLg3iU0yUjsMreec7UNEW/jF9tBDMKm0/9aTbnuja9jfyT4X04AwggLdJo6NzspBkDh
 upVN7N4fmf1ijMSXrMFLVznNyI/kgDT3rTVbdOC0VduH5yJsZ0T3nDoYR/X6pvy27897aqG6rr
 Rmg7r19rD+yyL/2BdBxL40x2XUiOmUQYtbVQYl7g8KJ1rAa+5Kq//NUk6PRQF91OzqPcds8lT1
 U9M=
X-SBRS: 2.7
X-MesageID: 7366072
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,224,1569297600"; 
   d="scan'208";a="7366072"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23985.32940.80514.935491@mariner.uk.xensource.com>
Date: Thu, 24 Oct 2019 11:45:00 +0100
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
In-Reply-To: <20191024072847.GU17494@Air-de-Roger>
References: <osstest-143061-mainreport@xen.org>
 <45b32f7a-4dcd-c576-4d3f-387cec4d91e2@suse.com>
 <20191024072847.GU17494@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] italia1 Re: [xen-unstable test] 143061: regressions -
 trouble: broken/fail/pass
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
 osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm7DqSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW3hlbi11bnN0YWJsZSB0
ZXN0XSAxNDMwNjE6IHJlZ3Jlc3Npb25zIC0gdHJvdWJsZTogYnJva2VuL2ZhaWwvcGFzcyIpOgo+
IDIwMTktMTAtMjMgMjM6MTY6NTkgWiBwb3dlcjogZmFpbGVkIHRvIHJlYm9vdCAodXNpbmcgU1NI
KTogc3RhdHVzIDY1MjgwIGF0IE9zc3Rlc3QvVGVzdFN1cHBvcnQucG0gbGluZSA1NTAuCi4uLgo+
IHBvd2VyOiBhbGwgYXBwcm9hY2hlcyB0byByZWJvb3RpbmcgaXRhbGlhMSBmYWlsZWQhCj4gCj4g
SXQgc2VlbXMgbGlrZSBvc3N0ZXN0IGZhaWxlZCB0byByZWJvb3QgdGhlIGJveCwgYWRkaW5nIElh
biBmb3IgbW9yZQo+IGlucHV0LCBidXQgSSBndWVzcyB0aGUgYm94IGNhbiBiZSB1bmJsZXNzZWQg
dW50aWwgdGhpcyBpcyBzb3J0ZWQgb3V0LgoKaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVj
dC5vcmcvb3NzdGVzdC9yZXN1bHRzL2hvc3QvaXRhbGlhMS5odG1sCgpUaGUgYm94IHNlZW1zIGJh
c2ljYWxseSBmaW5lIGF0IHRoZSBtb21lbnQsIHNvIEkgaGF2ZSBsZWZ0IGl0IGJsZXNzZWQuCgpM
b29raW5nIGF0IHRoZSBsb2dzLCBpdCBhcHBlYXJzIHRoYXQgdGhlIHByZXZpb3VzIGZsaWdodCBs
ZWZ0IHRoZSBib3gKY3Jhc2hlZC4gIChUaGlzIGlzIG5vdCB3aG9sbHkgdW51c3VhbC4pICBvc3N0
ZXN0IHVzZWQgdGhlIFBEVSB0byB0dXJuCml0YWxpYTEgb2ZmIGZvciA1cyBhbmQgdGhlbiBvbiBh
Z2Fpbi4gIEJ1dCBpdCBkaWRuJ3Qgc2VlbSB0byBoYXZlIGFueQplZmZlY3QuCgpUaGVyZSBhcmUg
dHdvIHBvc3NpYmxlIGNhdXNlczoKCjEuIGl0YWxpYTEncyBQRFUgcmVsYXkgZ290IHN0dWNrLiAg
VGhpcyBpcyBub3Qgd2hvbGx5IGltcGxhdXNpYmxlLgpUaGUgZWFybGllciBsb2dzIGRvIHNob3cg
c29tZSBwaGFzZXMgb2YgcmVwZWF0ZWQgZmFpbHVyZXMgb2YKaG9zdC1pbnN0YWxsLgoKMi4gNXMg
aXMgdG9vIHNob3J0LgoKRm9yIG5vdywgSSBhbSBnb2luZyB0byBjaGFuZ2UgdGhlIGRlZmF1bHQu
CgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
