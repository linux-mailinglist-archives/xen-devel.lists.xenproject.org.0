Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490FB159696
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 18:50:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Zd5-0003Qz-1e; Tue, 11 Feb 2020 17:47:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bPZQ=37=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j1Zd3-0003Qu-FB
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 17:47:21 +0000
X-Inumbo-ID: 8c8efd6c-4cf6-11ea-b5ff-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c8efd6c-4cf6-11ea-b5ff-12813bfff9fa;
 Tue, 11 Feb 2020 17:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581443241;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Pwg9EAxzLdXCikzGTbZXu6gF89oLXhIuon4v5CJfPY4=;
 b=EFXQLZwc2gUC8V4/wbx0B2XSZVTaQwjqFJZemAvj06KpJA/h4EFCYI9S
 4qPLQBB4ID5OpnmhVxXHbLN794e5uD6B0Et/dhXNWWfBghNaljJ+w+wjK
 8HvdxI+e4x+aEZ9WbZAP+9D3VjHEAB68Yn1E0d0jx+ad9jcC0K9Hp6Dc4 o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: m8LV5JXWQfD8WfCqiN902aZq/MVuJwF51znEHCwQnVD0Icq/hsO+fc0Q+fkZVqrc2+Rrk/vxFP
 8IUkVlzRAP8yxp5uM2iXYpHbQhwI5iTwSfGQcpIxM+GOVemEsPFgbv4jKVR4us+0ThWoZIYzYe
 /ZIRXdz7j612KuG3846ZhnMKmsxXKxe3PSf4TlMuGuP/TvbydW1Lf2mUv0PseKYOIsfDdehWOP
 eCIONGf8DDWABebvRrrl0ePU5pr9mK0r2W4nuD3kHBow2DwzXdPw5OSY+gDt0w2kMHIjR6e2sb
 kUI=
X-SBRS: 2.7
X-MesageID: 12462951
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12462951"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24130.59555.850210.126017@mariner.uk.xensource.com>
Date: Tue, 11 Feb 2020 17:47:15 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200205165056.11734-6-andrew.cooper3@citrix.com>
References: <20200205165056.11734-1-andrew.cooper3@citrix.com>
 <20200205165056.11734-6-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 5/6] tools/libx[cl]: Don't use
 HVM_PARAM_PAE_ENABLED as a function parameter
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

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggNS82XSB0b29scy9saWJ4W2NsXTogRG9uJ3Qg
dXNlIEhWTV9QQVJBTV9QQUVfRU5BQkxFRCBhcyBhIGZ1bmN0aW9uIHBhcmFtZXRlciIpOgo+IFRo
ZSBzb2xlIHVzZSBvZiBIVk1fUEFSQU1fUEFFX0VOQUJMRUQgaXMgYXMgYSBub24tc3RhbmRhcmQg
Y2FsbGluZyBjb252ZW50aW9uCj4gZm9yIHhjX2NwdWlkX2FwcGx5X3BvbGljeSgpLiAgUGFzcyBQ
QUUgYXMgYSByZWd1bGFyIHBhcmFtZXRlciBpbnN0ZWFkLgo+IAo+IExlYXZlIGEgcmF0aGVyIGJl
dHRlciBleHBsYWluYXRpb24gb2Ygd2h5IG9ubHkgSFZNIGd1ZXN0cyBoYXZlIGEgY2hvaWNlIGlu
IFBBRQo+IHNldHRpbmcuCgpJIGFtIGluY2xpbmVkIGJlbGlldmUgeW91IHRoYXQgdGhpcyBpcyBy
aWdodCAoc2luY2UgeW91IGFyZSBldmlkZW50bHkKZmFtaWxpYXIgd2l0aCB0aGlzIHdob2xlIGFy
ZWEgYW5kIEknbSBub3QpLCBidXQgdGhlIGV4cGxhbmF0aW9ucyBsZWF2ZQptZSBjb25mdXNlZC4K
Cj4gIGludCB4Y19jcHVpZF9hcHBseV9wb2xpY3koeGNfaW50ZXJmYWNlICp4Y2gsIHVpbnQzMl90
IGRvbWlkLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHVpbnQzMl90ICpmZWF0
dXJlc2V0LCB1bnNpZ25lZCBpbnQgbnJfZmVhdHVyZXMpCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3QgdWludDMyX3QgKmZlYXR1cmVzZXQsIHVuc2lnbmVkIGludCBucl9mZWF0dXJl
cywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHBhZSkKPiAgewo+ICAgICAgaW50
IHJjOwo+ICAgICAgeGNfZG9taW5mb190IGRpOwo+IEBAIC01NzksOCArNTgwLDYgQEAgaW50IHhj
X2NwdWlkX2FwcGx5X3BvbGljeSh4Y19pbnRlcmZhY2UgKnhjaCwgdWludDMyX3QgZG9taWQsCj4g
ICAgICB9Cj4gICAgICBlbHNlCj4gICAgICB7Cj4gLSAgICAgICAgdWludDY0X3QgdmFsOwo+IC0K
PiAgICAgICAgICAvKgo+ICAgICAgICAgICAqIFRvcG9sb2d5IGZvciBIVk0gZ3Vlc3RzIGlzIGVu
dGlyZWx5IGNvbnRyb2xsZWQgYnkgWGVuLiAgRm9yIG5vdywgd2UKPiAgICAgICAgICAgKiBoYXJk
Y29kZSBBUElDX0lEID0gdmNwdV9pZCAqIDIgdG8gZ2l2ZSB0aGUgaWxsdXNpb24gb2Ygbm8gU01U
Lgo+IEBAIC02MzUsMTQgKzYzNCwxMCBAQCBpbnQgeGNfY3B1aWRfYXBwbHlfcG9saWN5KHhjX2lu
dGVyZmFjZSAqeGNoLCB1aW50MzJfdCBkb21pZCwKPiAgICAgICAgICB9Cj4gIAo+ICAgICAgICAg
IC8qCj4gLSAgICAgICAgICogSFZNX1BBUkFNX1BBRV9FTkFCTEVEIGlzIGEgcGFyYW1ldGVyIHRv
IHRoaXMgZnVuY3Rpb24sIHN0YXNoZWQgaW4KPiAtICAgICAgICAgKiBYZW4uICBOb3RoaW5nIGVs
c2UgaGFzIGV2ZXIgdGFrZW4gbm90aWNlIG9mIHRoZSB2YWx1ZS4KPiArICAgICAgICAgKiBQQUUg
dXNlZCB0byBiZSBhIHBhcmFtZXRlciBwYXNzZWQgdG8gdGhpcyBmdW5jdGlvbiBieQo+ICsgICAg
ICAgICAqIEhWTV9QQVJBTV9QQUVfRU5BQkxFRC4gIEl0IGlzIG5vdyBwYXNzZWQgbm9ybWFsbHku
CgpJbiBwYXJ0aWN1bGFyLCBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCB0aGVzZSBjb21tZW50cyBt
ZWFuIGJ5CiJIVk1fUEFSQU1fUEFFX0VOQUJMRUQgaXMgYSBwYXJhbWV0ZXIgdG8gdGhpcyBmdW5j
dGlvbiIgYW5kICJQQUUgdXNlZAp0byBiZSBhIHBhcmFtZXRlciBwYXNzZWQgdG8gdGhpcyBmdW5j
dGlvbiBieSBIVk1fUEFSQU1fUEFFX0VOQUJMRUQiLgoKTWF5YmUgdGhpcyBpcyBzb21lIGxvb3Nl
IHVzZSBvZiB0aGUgdGVybSAicGFyYW1ldGVyIiA/CgpJZiB5b3UgY291bGQgZXhwbGFpbiBtb3Jl
IGNsZWFybHkgKGlkZWFsbHksIGV4cGxhaW4gdGhlIG1lYW5pbmcgb2YgdGhlCm9sZCBjb21tZW50
IGluIHRoZSBjb21taXQgbWVzc2FnZSwgYW5kIG1ha2UgdGhlIG5ldyBjb21tZW50CnVuYW1iaWd1
b3VzKSB0aGVuIHRoYXQgd291bGQgYmUgZ3JlYXQuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
