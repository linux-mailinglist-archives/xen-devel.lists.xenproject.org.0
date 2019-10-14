Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A309CD67C8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 18:55:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK3b6-0006yW-J7; Mon, 14 Oct 2019 16:53:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fu8Z=YH=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iK3b5-0006yO-3T
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 16:53:27 +0000
X-Inumbo-ID: 238d635a-eea3-11e9-9383-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 238d635a-eea3-11e9-9383-12813bfff9fa;
 Mon, 14 Oct 2019 16:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571072006;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=nnTJJI8bi98jHRt1oFymWCQ36euViPZdyd4Y8dW7vJE=;
 b=c6klXc1UlqZhAAYQEd3G/CtfxCKKVUaJSBqGWRYY4Z4eMavJ95LN4d25
 AJ+Nl2+qMRfa9h8zaPSCKOeUz+csT3MCUx7Sgn+Nc9rfLD2M4GPJOwlKz
 fm0H8RVLKOdyDJ2W7QIXLYwlZqKGRp0CKZON+S6tgzqF9NXV98KRla0gc I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: U+smEhWLL9V5FzCCyuAMYUNuT4DUJpsn7mjL3BeJRu4o/xxBsOHkPj17nH0WIR+24t6y5GlsEO
 Hgv7SzXdayJRPBC0/ltijsuD/tQDci1oC/Bn/yW+gmimAbys49g6CmK7k20905KooAodvacZQz
 Gn5g28xTLGk+8ixCGbWd40EvkSadsHFBQdzp76mkoxZTwZmYiZeC828v2QEvwg0mHAj66CeaAf
 5uvKWD0k7QNuKug69ATJXJjKnrvphc+aa9KOd1tAWe9XKsxGNymPtI1FmCLflJgm/2VgD+Enem
 CUg=
X-SBRS: 2.7
X-MesageID: 7133320
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,296,1566878400"; 
   d="scan'208";a="7133320"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23972.43010.584126.549757@mariner.uk.xensource.com>
Date: Mon, 14 Oct 2019 17:53:22 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191014165026.GC5743@perard.uk.xensource.com>
References: <20191011165549.21639-1-ian.jackson@eu.citrix.com>
 <20191011165549.21639-2-ian.jackson@eu.citrix.com>
 <20191014165026.GC5743@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v3 05/10] libxl: Move
 shadow_memkb and iommu_memkb defaulting into libxl
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <pdurrant@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtYRU4gUEFUQ0ggZm9yLTQu
MTMgdjMgMDUvMTBdIGxpYnhsOiBNb3ZlIHNoYWRvd19tZW1rYiBhbmQgaW9tbXVfbWVta2IgZGVm
YXVsdGluZyBpbnRvIGxpYnhsIik6Cj4gVGhlcmUncyBwcm9iYWJseSBzb21ldGhpbmcgZWxzZSB0
aGF0IGlzIG5lZWRlZCB0byBiZSBkb25lIGZvciB1c2VyIG9mCj4gdGhlIHByZS00LjEzIEFQSS4g
SWYgdGhleSBjYWxsIGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeV8weDA0MTIwMCwgdGhlcmUKPiBp
cyBub3RoaW5nIHRoYXQgc2V0IGlvbW11X21lbWtiLCBzbyB0aGUgZGVmYXVsdCB2YWx1ZSBzdGF5
cyBhdCAtMSBhbmQKPiBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnlfMHgwNDEyMDAgcmV0dXJucyBh
IHZhbHVlIHRoYXQgaXMgbG93ZXIgdGhhdAo+ICJ0YXJnZXRfbWVta2IgKyBzaGFkb3dfbWVta2Ii
LiBUaGVuLCB3aGVuIGxpYnhsIGNyZWF0ZSB0aGUgZG9tYWluLCBpdAo+IHN0aWxsIGtlZXAgaW9t
bXVfbWVta2I9PS0xLCBiZWNhdXNlIHRoZSBvbGQgQVBJIGFzIGJlZW4gdXNlZC4KPiAKPiBJIHRy
aWVkIHRvIGhhdmUgeGwgY2FsbCB0aGUgNC4xMiBBUEkgYW5kIGNyZWF0ZSBhIGd1ZXN0IHdpdGhv
dXQKPiBwYXNzdGhyb3VnaCwgYW5kIFFFTVUgY3Jhc2hlZCAoYXNzZXJ0KCkgZmFpbHVyZSkuCj4g
Cj4gU28gbWF5YmUgbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQoKSBzaG91bGQg
YWxzbyBzZXQgYSB2YWx1ZQo+IHRvIGlvbW11X21lbWtiIGFzIGl0IGRvZXMgZm9yIHNoYWRvd19t
ZW1rYj8gQXQgbGVhc3QsIHNldCBpb21tdV9tZW1rYj0wCj4gaWYgc3RpbGwgdGhlIGRlZmF1bHQu
CgpJIHRoaW5rIHlvdSBhcmUgcmlnaHQuICBOb3Qgc3VyZSBob3cgSSBtaXNzZWQgdGhhdC4KCklh
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
