Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C1CE8AC7
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 15:30:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPSSr-0007os-6C; Tue, 29 Oct 2019 14:27:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BagA=YW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iPSSp-0007on-T0
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 14:27:15 +0000
X-Inumbo-ID: 33c78ef7-fa58-11e9-9514-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33c78ef7-fa58-11e9-9514-12813bfff9fa;
 Tue, 29 Oct 2019 14:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572359235;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=XsOr31hXNwCIWj+thNqbClIvUapV0Ho1dHjM0801Zrg=;
 b=eHjzJLh9g+fNKm0AtvXheHYkSVE1720HqpsZzMqsFgC6r0wkHP86Drg2
 k+/RMgqZWHFgtv9Zim5g3W/w/CNbTS/j58RCE06OLAQVQyo/ZI2tS+SDi
 JEuoW9VsZcl9F0/D2Uak28XLslI6rd/OIXNPDHOqTi2lA335IXit2Qw6B 4=;
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
IronPort-SDR: cvuDdKv5GGyLp6qdoVohckpcIH1TfTmjZ0BG96Ff/RGgF7ce1yrE3PeBwJnkOplw/w4EjUxexx
 Sj6vgDfGAARJ4g/4C29CzOI2No34igvoXFMusJjvazWSnPdR6RBvuUHCpbfbo4gRReP/4hBTzH
 ESIURyM8nU2U3h0AJfo9aJYrJRLzlEI+MnHseAXxfIQRWC7Yojt7Wh9Pzjy6oLYcEIJbN3+051
 B18O77iOCMU6gz4mrQchjGITY/F3takqoWimKK4iOWz84SGaImjx33+AvjVXro3CQMY6ylcXlz
 Lb8=
X-SBRS: 2.7
X-MesageID: 7562133
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,244,1569297600"; 
   d="scan'208";a="7562133"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23992.19519.800498.669215@mariner.uk.xensource.com>
Date: Tue, 29 Oct 2019 14:27:11 +0000
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <66044a22-2551-dbab-4c74-cc29f89606c9@arm.com>
References: <23985.51097.655432.655379@mariner.uk.xensource.com>
 <66044a22-2551-dbab-4c74-cc29f89606c9@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] rochester and Debian buster
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiByb2NoZXN0ZXIgYW5kIERlYmlhbiBidXN0ZXIiKToK
PiBJIGhhdmUganVzdCByZW1lbWJlcmVkIHRoYXQgd2UgYXJlIG5vdCB1c2luZyB0aGUgb24tYm9h
cmQgbmV0d29yayBjYXJkIGJ1dCAKPiBpbnN0ZWFkIGEgVVNCIGRvbmdsZS4KClllcy4KCj4gQnV0
IEkgYW0gbm90IHN1cmUgd2hpY2ggZXRoIGludGVyZmFjZSBpcyBsaW5rZWQgdG8gYW5kIGhvdyB5
b3UgZm91bmQKPiBvdXQgdGhlIG5ldHdvcmsgaXMgZG93bi4KCkkgZGlkbid0IGhhdmUgY2xlYXIg
bm90ZXMgYWJvdXQgdGhpcyBzbyBJIGRlY2lkZWQgdG8gcmVwcm8gdGhlCnByb2JsZW0uICBJIHJl
cmFuIG15IHNldHVwLCBhbmQgaXQgKnBhc3NlZCosIGluc3RhbGxpbmcgYnVzdGVyCnN1Y2Nlc3Nm
dWxseSBvbiByb2NoZXN0ZXIxLiAgVGhpcyBpcyB2ZXJ5IG9kZCBhbmQgSSBjYW4ndCBleHBsYWlu
IGl0LgoKVGhlIHR3byBqb2JzJyAoMTQzMDk4IHZzIDE0MzI4NykgcnVudmFycyBhcmUgaWRlbnRp
Y2FsIGFwYXJ0IGZyb20gdGhlCnN5c2xvZyBzZXJ2ZXIgcG9ydCAod2hpY2ggaXMgZXhwZWN0ZWQg
dG8gdmFyeSkgYW5kIHRoZQpgaG9zdF9wb3dlcl9pbnN0YWxsJyB3aGljaCBpcyBvbmx5IHNldCBh
ZnRlciBhIHN1Y2Nlc3NmdWwgYm9vdCBpbnRvCnRoZSBpbnN0YWxsZXIuICBUaGUgZGF0YWJhc2Ug
cmVjb3JkcyB0aGUgcHJldmlvdXMgb25lIGFzIGBicm9rZW4nIGFuZAp0aGUgbmV3IG9uZSBhcyBg
cGFzcycuICBUaGUgb3NzdGVzdCByZXZpc2lvbiB3YXMgaWRlbnRpY2FsLiAgTXkKcHJldmlvdXMg
dGVzdCBydW4sIHRoYXQgZmFpbGVkLCB3YXMgYSByZWFsbHkgcXVpdGUgZm9ybWFsCm1nLXJlcHJv
LXNldHVwIHJ1biwgc28gSSBkb24ndCB0aGluayBpdCBoYWQgYW55IGtpbmQgb2Ygd2VpcmRuZXNz
IHRoYXQKd291bGQgZXhwbGFpbiB0aGUgc3ltcHRvbXMuCgpNeSByZWNvbGxlY3Rpb24gaXMgdGhh
dCBib3RoIGBpcCBsaW5rIHNob3cnIGFuZCBrZXJuZWwgbG9nIG1lc3NhZ2VzCmFncmVlZCB0aGF0
IHRoZXJlIHdhcyBubyBOSUMgd2l0aCBhIHdvcmtpbmcgbmV0d29yayBsaW5rLiAgSSBkb24ndApy
ZWNhbGwgaG93IG1hbnkgd2VyZSBkZXRlY3RlZCBidXQgSSB0aGluayBJIGxvb2tlZCBhdCB0aGUg
TUFDIGFkZHJlc3MKZnJvbSB0aGUgb3NzdGVzdCBjb25maWd1cmF0aW9uIGFuZCBzYXcgaXQgaW4g
dGhlIGxpc3QgZnJvbSB0aGUKbWFjaGluZS4KCj4gSSBhbSBub3QgZW50aXJlbHkgc3VyZSB3aGV0
aGVyIHRoaXMgd291bGQgaGVscCBiZWNhdXNlIEkgaGF2ZSBoYWQKPiByZXBvcnQgdGhhdCBEZWJp
YW4gQnVzdGVyIGhhcyBiZWVuIGluc3RhbGxlZCBzdWNjZXNzZnVsbHkgb24KPiBUaHVuZGVyLVgu
CgpXZWxsLCBub3cgeW91IGhhdmUgYSBzZWNvbmQuCgpJIGhhdmUgbm90IGRvbmUgZW5vdWdoIG9m
IHRoZXNlIGluc3RhbGwgYXR0ZW1wdHMgdG8ga25vdyBpZiB0aGVyZSBpcwpzb21lIGtpbmQgb2Yg
aGVpc2VuYnVnIGhlcmUuICBUaGUgc2l0dWF0aW9uIHNlZW1zIGNvbmNlcm5pbmcuICBJIGd1ZXNz
CmZvciBub3cgSSB3aWxsIGNhcnJ5IG9uIGFuZCBzZWUgaWYgaXQgZG9lcyBpdCBhZ2Fpbi4uLgoK
SWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
