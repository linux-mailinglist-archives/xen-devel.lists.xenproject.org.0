Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 651A8CC048
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 18:10:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGQ8I-0007nP-Qp; Fri, 04 Oct 2019 16:08:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lQ+Z=X5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iGQ8H-0007nK-NU
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 16:08:41 +0000
X-Inumbo-ID: 3b14f086-e6c1-11e9-80e3-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b14f086-e6c1-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570205320;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Pa2MI4y4I1jAaIO1krgp3o7JVeeUCVTe132ry0u6Um8=;
 b=ImvCDu3ob5V3077Qn1ImpGGDNCVIQOSuWgdkiP7nzZaHGrLAYmxBrLVx
 uU5xqFIe0wd9W8iRm0sG4BT3cV4lz6kWiRfrm+r4YJZK5Upv/t/PnreM3
 rA3DO67ZzbMV07iBAp49J97zaIEtONGwuxo2fGtD/UaR/llmAhetaQ+HB k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ujnn70Wz4nI4gcFURlBJPeYZEYASRacKyCQpqBlgNeI6FaYRik8Td9Ml/5kVyGJb8ck8ce8/AO
 8Ggjvsxq6hm1XuI1/iagk6oL8G3n+aiICmkI7if3GgXDfgdrUEB7YWsqYeuaoRupKAd0qjdCQt
 iObR0TkLBfboE0HCT+Q3tzl+zpeC3K1L04QeTxJnE+pmdqEYUpzsst99iatI3sB8mBMKx5XQqh
 nmKFmUzaPr7rn9oyACuSLAyxVatWwvLeE1dP4Z5aZDuub5cK23djhlzdQm9SxEYFswz7qIfDFA
 USo=
X-SBRS: 2.7
X-MesageID: 6736455
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6736455"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23959.28279.134889.435865@mariner.uk.xensource.com>
Date: Fri, 4 Oct 2019 17:08:23 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191004153306.GL1163@perard.uk.xensource.com>
References: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
 <20191004151707.24844-2-ian.jackson@eu.citrix.com>
 <20191004153306.GL1163@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 1/6] libxl: Offer API versions
 0x040700 and 0x040800
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
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYRU4gUEFUQ0ggZm9yLTQuMTMgMS82XSBsaWJ4
bDogT2ZmZXIgQVBJIHZlcnNpb25zIDB4MDQwNzAwIGFuZCAweDA0MDgwMCIpOgo+IE9uIEZyaSwg
T2N0IDA0LCAyMDE5IGF0IDA0OjE3OjAyUE0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4g
SXQgaXMgc3VycHJpc2luZyB0aGF0IG5vLW9uZSBub3RpY2VkIHRoaXMuICBJIHdvbmRlciBpZiBh
bnlvbmUgaXMKPiA+IHVzaW5nIG91ciBMSUJYTF9BUElfVkVSU0lPTiBmYWNpbGl0eS4gIElmIG5v
dCBtYXliZSB3ZSBzaG91bGQgdGFrZSBhCj4gPiBkaWZmZXJlbnQgYXBwcm9hY2guCj4gCj4gTGli
dmlydCBkb2VzIHVzZSBpdC4gSSB0aGluayBpdCdzIGN1cnJlbnRseSBzZXQgdG8gNC41LgoKQWgu
ICBJIGhhdmUgYWRqdXN0ZWQgdGhlIGNvbW1pdCBtZXNzYWdlIHNvbWV3aGF0LgoKPiA+IEFueXdh
eSwgaW4gdGhlIG1lYW50aW1lLCB3ZSBzaG91bGQgZml4IHRoaXMuICBCYWNrcG9ydGluZyB0aGlz
IGlzCj4gPiBwcm9iYWJseSBhIGdvb2QgaWRlYTogaXQgd29uJ3QgY2hhbmdlIHRoZSBiZWhhdmlv
dXIgZm9yIGV4aXN0aW5nCj4gPiBjYWxsZXJzIGJ1dCBpdCB3aWxsIGF2b2lkIGVycm9ycyBmb3Ig
c29tZSBvbGRlciBjb3JyZWN0IHVzZXMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IAo+IEFja2VkLWJ5OiBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClRoYW5rcywKSWFuLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
