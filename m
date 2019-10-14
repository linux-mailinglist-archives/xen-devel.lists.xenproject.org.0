Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C149DD6322
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 14:56:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJzrQ-00005K-Vy; Mon, 14 Oct 2019 12:54:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R0Yg=YH=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iJzrP-00005F-Kr
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 12:54:03 +0000
X-Inumbo-ID: b1eb788e-ee81-11e9-8aca-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1eb788e-ee81-11e9-8aca-bc764e2007e4;
 Mon, 14 Oct 2019 12:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571057642;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jci2IvI/NW7JPxYD9kKh/zUzVy6BVwOWKD5x3GiTLSc=;
 b=O7PhE5Ak+Qa7LMcRNv5X92JjC5R0bfByLHplSW0n/sTBtkKK/06e0cak
 tAZMxz3LlioDc/FL9vDMwF0L73IuFKJgEdoihwiUE3885HFwG2CQOai+p
 ilKhNIOZ4ytTQO6wh/PsgwnW/0gzKZjzFyeyWxfCzesTNET0STc3IoO3U A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 33MXqJANIyjGEn3LOTuY1x4A+EWQkAWeUe5cajUTOnTMYKqgEfN7rfbGgFvYVnzd3APYN968pM
 oq4nukZH2mSEpk5yBHVG4I1recpDz5jSELwl5gDWCKtXzuV3CIb3vYe5c8iV/Ir/XGXIfYe/3g
 l71wGs5UW2qb9ZJCzt0J9QpkPkE9myZrr0o2r38lQZIM6Q3NpivJUydbWaGqxRNErZCU3Yyiux
 9JJXOvUIkiFt/g8y2wXmWIDFWrn/vHl7QfMMx3hMnSmKjgmX7Sp6pt/sdva1o5MspM0ksnXy3U
 yOQ=
X-SBRS: 2.7
X-MesageID: 6841855
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,295,1566878400"; 
   d="scan'208";a="6841855"
Date: Mon, 14 Oct 2019 13:53:58 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191014125358.GB5743@perard.uk.xensource.com>
References: <20191011165549.21639-1-ian.jackson@eu.citrix.com>
 <20191011165549.21639-6-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011165549.21639-6-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v3 09/10] libxl: Move
 domain_create_info_setdefault earlier
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <pdurrant@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDU6NTU6NDhQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2UgbmVlZCB0aGlzIGJlZm9yZSB3ZSBzdGFydCB0byBmaWd1cmUgb3V0IHRoZSBwYXNz
dGhyb3VnaCBtb2RlLgo+IAo+IEkgaGF2ZSBjaGVja2VkIHRoYXQgbm90aGluZyBpbiBsaWJ4bF9f
ZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQKPiBub3IgdGhlIHR3byBpbXBsZW1lbnRhdGlv
bnMgb2YgLi4uX2FyY2hfLi4uIGFjY2Vzc2VzIGFueXRoaW5nIGVsc2UsCj4gb3RoZXIgdGhhbiAo
aSkgdGhlIGRvbWFpbiB0eXBlICh3aGljaCB0aGlzIGZ1bmN0aW9uIGlzIHJlc3BvbnNpYmxlIGZv
cgo+IHNldHRpbmcgYW5kIG5vdGhpbmcgYmVmb3JlIGl0IGxvb2tzIGF0KSAoaWkpIGNfaW5mby0+
c3NpZHJlZiAod2hpY2ggaXMKPiBkZWZhdWx0ZWQgYnkgZmxhc2sgY29kZSBuZWFyIHRoZSB0b3Ag
b2YKPiBsaWJ4bF9fZG9tYWluX2NvbmZpZ19zZXRkZWZhdWx0IGFuZCBub3QgYWNjZXNzZWQgYWZ0
ZXJ3YXJkcykuCj4gCj4gU28gbm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpBY2tlZC1ieTogQW50
aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgotLSAKQW50aG9ueSBQRVJB
UkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
