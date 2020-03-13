Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA54185228
	for <lists+xen-devel@lfdr.de>; Sat, 14 Mar 2020 00:17:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCtVn-00036A-38; Fri, 13 Mar 2020 23:14:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+q9i=46=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jCtVm-000365-DB
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 23:14:38 +0000
X-Inumbo-ID: 6868c8ee-6580-11ea-b3de-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6868c8ee-6580-11ea-b3de-12813bfff9fa;
 Fri, 13 Mar 2020 23:14:37 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3AE24206B7;
 Fri, 13 Mar 2020 23:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584141276;
 bh=K2hIUJeiwS+pXyiqmolTymWFhdIXJjABPjLzo5tDPLo=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=skDr3po3XMOxkyquiUr2sS7l6bxQQuIXX9Mglz7Fa+ufL62t8vVk79kDc29yeZylL
 DT3Y1YTDxBgLeL+/SWKpIvtDE04mIDCYi8lVMIAsC+FlM7AEThalc+4urBW4e2Ypr1
 NZjyjVyCuaY/QM+dYZ7JZBUP344cI6yCdN17eidk=
Date: Fri, 13 Mar 2020 16:14:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <alpine.DEB.2.21.2003131605490.1269@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2003131614160.1269@sstabellini-ThinkPad-T480s>
References: <20200309174505.594607-1-anthony.perard@citrix.com>
 <20200309174505.594607-3-anthony.perard@citrix.com>
 <alpine.DEB.2.21.2003131605490.1269@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [XEN PATCH v3 2/2] xen/arm: Configure early printk
 via Kconfig
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
Cc: Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxMyBNYXIgMjAyMCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIE1vbiwg
OSBNYXIgMjAyMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBBdCB0aGUgbW9tZW50LCBlYXJs
eSBwcmludGsgY2FuIG9ubHkgYmUgY29uZmlndXJlZCBvbiB0aGUgbWFrZSBjb21tYW5kCj4gPiBs
aW5lLiBJdCBpcyBub3QgdmVyeSBoYW5keSBiZWNhdXNlIGEgdXNlciBoYXMgdG8gcmVtb3ZlIHRo
ZSBvcHRpb24KPiA+IGV2ZXJ5dGltZSBpdCBpcyB1c2luZyBhbm90aGVyIGNvbW1hbmQgb3RoZXIg
dGhhbiBjb21waWxpbmcgdGhlCj4gPiBoeXBlcnZpc29yLgo+ID4gCj4gPiBGdXJ0aGVybW9yZSwg
ZWFybHkgcHJpbnRrIGlzIG9uZSBvZiB0aGUgZmV3IG9kZHMgb25lIHRoYXQgYXJlIG5vdAo+ID4g
dXNpbmcgS2NvbmZpZy4KPiA+IAo+ID4gU28gdGhpcyBpcyBhYm91dCB0aW1lIHRvIG1vdmUgaXQg
dG8gS2NvbmZpZy4KPiA+IAo+ID4gVGhlIG5ldyBrY29uZmlncyBvcHRpb25zIGFsbG93IGEgdXNl
ciB0byBlYXRoZXIgc2VsZWN0IGEgVUFSVCBkcml2ZXIKPiA+IHRvIHVzZSBhdCBib290IHRpbWUs
IGFuZCBzZXQgdGhlIHBhcmFtZXRlcnMsIG9yIGl0IGlzIHN0aWxsIHBvc3NpYmxlCj4gPiB0byBz
ZWxlY3QgYSBwbGF0Zm9ybSB3aGljaCB3aWxsIHNldCB0aGUgcGFyYW1ldGVycy4KPiA+IAo+ID4g
SWYgQ09ORklHX0VBUkxZX1BSSU5USyBpcyBwcmVzZW50IGluIHRoZSBlbnZpcm9ubWVudCBvciBv
biB0aGUgbWFrZQo+ID4gY29tbWFuZCBsaW5lLCBtYWtlIHdpbGwgcmV0dXJuIGFuIGVycm9yLgo+
ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
Pgo+ID4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+Cj4gPiAKPiA+IC0tLQo+ID4gCj4gPiBPcmlnaW5hbCBwYXRjaDoKPiA+ICAgICBbUEFU
Q0ggZm9yLTQuMTNdIHhlbi9hcm06IEFkZCBTa2VsZXRvbiBmb3IgdXNpbmcgY29uZmlndXJpbmcg
ZWFybHkgcHJpbnRrIHVzaW5nIEtjb25maWcKPiA+ICAgICA8MjAxOTA5MTMxMDM5NTMuODE4Mi0x
LWp1bGllbi5ncmFsbEBhcm0uY29tPgo+ID4gLS0tCj4gPiAKPiA+IE5vdGVzOgo+ID4gICAgIHYz
Ogo+ID4gICAgIC0gcmVuYW1lIEVBUkxZX1BSSU5LIHRvIENPTkZJR19FQVJMWV9QUklOVEsgaW4g
bWFrZWZpbGUgaGVyZSAod2hpY2gKPiA+ICAgICAgIHNlbGVjdCB3aGljaCBvYmplY3QgdG8gYnVp
bGQpLgo+ID4gICAgIC0gcmVuYW1lIEVBUkxZX1VBUlRfQkFVRF9SQVRFIHRvIEVBUkxZX1VBUlRf
UEwwMTFfQkFVRF9SQVRFCj4gPiAgICAgLSB0eXBvcwo+ID4gICAgIC0gZHJvcCB0aGUgbGlzdCBv
ZiBhbGlhc2VzIGluIGVhcmx5LXByaW50ay50eHQuIEtjb25maWcgY2hvaWNlIG1lbnUKPiA+ICAg
ICAgIHNob3VsZCBiZSBlbm91Z2guCj4gPiAgICAgLSByZXdvcmQgZWFybHktcHJpbnRrLnR4dC4K
PiA+ICAgICAtIHJld29yayBob3cgRUFSTFlfUFJJTlRLIGlzIHNldCB0byBZCj4gPiAgICAgICBh
bmQgdXNlIHRoYXQgaW5zdGVhZCBvZiBhIGxpc3Qgb2YgYWxsIEVBUkxZX1VBUlRfKgo+ID4gICAg
IC0gQWRkIGEgY2hlY2sgdG8gYXNrIHVzZXIgdG8gdXNlIEtjb25maWcgdG8gc2V0IGVhcmx5IHBy
aW50ay4KPiA+ICAgICAtIHJld29yayB0aGUgcG9zc2libGUgY2hvaWNlIHRvIGhhdmUgYWxsIHVh
cnQgZHJpdmVyIGFuZCBwbGF0Zm9ybQo+ID4gICAgICAgc3BlY2lmaWMgb3B0aW9uIHRvZ2V0aGVy
Lgo+ID4gICAgIC0gaGF2ZSBhZGRlZCBvciByZXdvcmQgcHJvbXB0IGFuZCBoZWxwIG1lc3NhZ2Vz
IG9mIHRoZSBkaWZmZXJlbnQKPiA+ICAgICAgIG9wdGlvbnMuIFRoZSBwbGF0Zm9ybSBzcGVjaWZp
YyBvcHRpb24gZG9uJ3QgaGF2ZSBleHRlbmRlZCBoZWxwLCB0aGUKPiA+ICAgICAgIHByb21wdCBp
cyBwcm9iYWJseSBlbm91Z2guCj4gPiAgICAgICAoVGhlIG5vbi1wbGF0Zm9ybSBzcGVjaWZpYyBv
cHRpb25zIGhhdmUgdGhlIGhlbHAgbWVzc2FnZSB0aGF0IEp1bGllbgo+ID4gICAgICAgaGF2ZSB3
cml0dGVuIGluIHRoZSBmaXJzdCB2ZXJzaW9uLikKPiA+ICAgICAtIGhhdmUgbWFkZSBFQVJMWV9V
QVJUX0lOSVQgZGVwZW5kZW50IG9uIHRoZSB2YWx1ZSBvZgo+ID4gICAgICAgRUFSTFlfVUFSVF9Q
TDAxMV9CQVVEX1JBVEUgc28gdGhhdCB0aGVyZSBpcyBubyBuZWVkIHRvIGV4cG9zZSBfSU5JVCB0
bwo+ID4gICAgICAgdXNlcnMuCj4gPiAKPiAKPiBUaGUgcGF0Y2ggaXMgZmluZSBieSBtZS4gSSBv
bmx5IGhhdmUgb25lIHZlcnkgbWlub3IgY29tbWVudCBiZWxvdy4KCkkgZm9yZ290IHRvIGFkZAoK
VGVzdGVkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
