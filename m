Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AD6CC1B2
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 19:26:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGRJV-0006ws-61; Fri, 04 Oct 2019 17:24:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UhcM=X5=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iGRJU-0006wk-7n
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 17:24:20 +0000
X-Inumbo-ID: cc28dce0-e6cb-11e9-975e-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc28dce0-e6cb-11e9-975e-12813bfff9fa;
 Fri, 04 Oct 2019 17:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570209860;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EJw/Rq2zR99HBxUwvbicoSbsHWpf6yq9Dbc9r/zRD5o=;
 b=Cu3tS6ly/xTHXuVLhuYmDH+gANnYDtr7bKVb9ObNV8orhetDCJj4MWUr
 kWeV7sMnkHSM2aB1N6wMF7/WvBUlPkVWILiANAG8RJTBTFUX3UM3Dfkdd
 7tBBIYZKU6O0IEU6DhgBg/8WofW7PR9+FBxABOt6PC5q18S9K9KsfZsdo Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YTuMUr++X32/18vQKEGWJPm9JLYiiu4zxLSYRMZAdWONYKprrIkcvvyGEjetgFKzlETfVq7jtF
 l6m+8PKg1dCO6iZ/ssEbW5YSv1/e6Ri7VbUF3siQ41cFBPqc0XFH35DG3xZJyDKjx736dCZYyd
 4NcDaAZXKgi1YaBhaWvN6ezkzZa2fyRY45UbPsnlYVg7uVWzDyjLnbv5cJrRbk6WvomFmvHdM5
 BjnihXgYFKEmJW696jjxfuqay3asXAHJhdU0XFJCGAC8A/O9eTSKL+6S9PgxMXZZKHHqWuj0qZ
 eO0=
X-SBRS: 2.7
X-MesageID: 6559033
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,257,1566878400"; 
   d="scan'208";a="6559033"
Date: Fri, 4 Oct 2019 18:24:16 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191004172416.GP1163@perard.uk.xensource.com>
References: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
 <20191004151707.24844-7-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191004151707.24844-7-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 6/6] libxl: Remove/deprecate
 libxl_get_required_*_memory from the API
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
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDQ6MTc6MDdQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gVGhlc2UgYXJlIG5vdyByZWR1bmRhbnQgYmVjYXVzZSBzaGFkb3dfbWVta2IgYW5kIGlv
bW11X21lbWtiIGFyZSBub3cKPiBkZWZhdWx0ZWQgYXV0b21hdGljYWxseSBieSBsaWJ4bF9kb21h
aW5fbmVlZF9tZW1vcnkgYW5kCj4gbGlieGxfZG9tYWluX2NyZWF0ZSBldGMuICBDYWxsZXJzIHNo
b3VsZCBub3Qgbm93IGNhbGwgdGhlc2U7IGluc3RlYWQsCj4gdGhleSBzaG91bGQganVzdCBsZXQg
bGlieGwgdGFrZSBjYXJlIG9mIGl0Lgo+IAo+IGxpYnhsX2dldF9yZXF1aXJlZF9zaGFkb3dfbWVt
b3J5IHdhcyBpbnRyb2R1Y2VkIGluIGY4OWY1NTU4MjdhNgo+ICAgInJlbW92ZSBsYXRlIChvbi1k
ZW1hbmQpIGNvbnN0cnVjdGlvbiBvZiBJT01NVSBwYWdlIHRhYmxlcyIKPiBXZSBjYW4gZnJlZWx5
IHJlbW92ZSBpdCBiZWNhdXNlIGl0IHdhcyBuZXZlciBpbiBhbnkgcmVsZWFzZS4KPiAKPiBsaWJ4
bF9nZXRfcmVxdWlyZWRfc2hhZG93X21lbW9yeSBoYXMgYmVlbiBpbiBsaWJ4bCBhcHByb3hpbWF0
ZWx5Cj4gZm9yZXZlci4gIEl0IHNob3VsZCBwcm9iYWJseSBub3QgaGF2ZSBzdXJ2aXZlZCB0aGUg
Y3JlYXRpb24gb2YKPiBsaWJ4bF9kb21haW5fY3JlYXRlLCBidXQgaXQgc2VlbXMgdGhlIEFQSSBh
d2t3YXJkbmVzc2VzIHdlIHNlZSBpbgo+IHJlY2VudCBjb21taXRzIHByZXZlbnRlZCB0aGlzLiAg
U28gd2UgaGF2ZSB0byBrZWVwIGl0LiAgSXQgcmVtYWlucwo+IGZ1bmN0aW9uYWwgYnV0IHdlIGNh
biBkZXByZWNhdGUgaXQuICBIb3BlZnVsbHkgd2UgY2FuIGdldCByaWQgb2YgaXQKPiBjb21wbGV0
ZWx5IGJlZm9yZSB3ZSBmaW5kIHRoZSBuZWVkIHRvIGNoYW5nZSB0aGUgY2FsY3VsYXRpb24gdG8g
dXNlCj4gYWRkaXRpb25hbCBpbmZvcm1hdGlvbiB3aGljaCBpdHMgYXJndW1lbnRzIGRvIG5vdCBj
dXJyZW50bHkgc3VwcGx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgoKQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBl
cmFyZEBjaXRyaXguY29tPgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
