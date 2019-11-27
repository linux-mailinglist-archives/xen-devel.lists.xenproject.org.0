Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E756710AC7F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 10:16:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZtNz-0006Xp-Si; Wed, 27 Nov 2019 09:13:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eB6N=ZT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZtNy-0006Xk-Lo
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 09:13:22 +0000
X-Inumbo-ID: 2856377a-10f6-11ea-a3af-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2856377a-10f6-11ea-a3af-12813bfff9fa;
 Wed, 27 Nov 2019 09:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574846001;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9uuURIb8lrZNL/OMu7igvzdkxlazHa9ULxcdZfdQEJk=;
 b=aoLZyI/h1VYsEqD2xeyuQOJRIDlot1fUlO4166SxmKFymjmmHNJg8Z8Y
 RXh/GsGU6/BRqjp3oFFlrl1Yu0NjWLN51UjugUU005070ohZ0Q9lU1M7R
 mS0unB3Wmsbc3Zioe4kPhkEwnbKzHPYSafsELCOZNSjwNqJYDS3j8k+pe I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3w5d59L52Mn1fIy3qlLg2l1iAGFHhwnFM+YxEHAiihny2aU1k/iXW9X2fzLiyzswN46YEeyy82
 MLt3NJLzRsx9IenYw0lON3SkfoO7Rl4dtAjrcoReZBPDbYWosP5elBiuth7JAsxXx7N1hOogoa
 jpZQ/nVMnSfxXiMEF9T2J1hEjRrA6zjwKijqesLels9WAo+D9IGxa6G5jMou7W8ZJ2Tmm9cv6h
 zHQFdo2MGJoFlqg0Mts+7CAI6B4pOEvFe6V8OzDi2yz9tcCcDnh9TGgZadpIwwi6p2q1fap1vA
 d8o=
X-SBRS: 2.7
X-MesageID: 9306850
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,248,1571716800"; 
   d="scan'208";a="9306850"
Date: Wed, 27 Nov 2019 10:13:14 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: SeongJae Park <sjpark@amazon.com>
Message-ID: <20191127091314.GK980@Air-de-Roger>
References: <20191126153605.27564-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126153605.27564-1-sjpark@amazon.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen/blkback: Avoid unmapping unmapped grant
 pages
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
Cc: axboe@kernel.dk, konrad.wilk@oracle.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDQ6MzY6MDVQTSArMDEwMCwgU2VvbmdKYWUgUGFyayB3
cm90ZToKPiBGcm9tOiBTZW9uZ0phZSBQYXJrIDxzanBhcmtAYW1hem9uLmRlPgo+IAo+IEZvciBl
YWNoIEkvTyByZXF1ZXN0LCBibGtiYWNrIGZpcnN0IG1hcHMgdGhlIGZvcmVpZ24gcGFnZXMgZm9y
IHRoZQo+IHJlcXVlc3QgdG8gaXRzIGxvY2FsIHBhZ2VzLiAgSWYgYW4gYWxsb2NhdGlvbiBvZiBh
IGxvY2FsIHBhZ2UgZm9yIHRoZQo+IG1hcHBpbmcgZmFpbHMsIGl0IHNob3VsZCB1bm1hcCBldmVy
eSBtYXBwaW5nIGFscmVhZHkgbWFkZSBmb3IgdGhlCj4gcmVxdWVzdC4KPiAKPiBIb3dldmVyLCBi
bGtiYWNrJ3MgaGFuZGxpbmcgbWVjaGFuaXNtIGZvciB0aGUgYWxsb2NhdGlvbiBmYWlsdXJlIGRv
ZXMKPiBub3QgbWFyayB0aGUgcmVtYWluaW5nIGZvcmVpZ24gcGFnZXMgYXMgdW5tYXBwZWQuICBU
aGVyZWZvcmUsIHRoZSB1bm1hcAo+IGZ1bmN0aW9uIG1lcmVseSB0cmllcyB0byB1bm1hcCBldmVy
eSB2YWxpZCBncmFudCBwYWdlIGZvciB0aGUgcmVxdWVzdCwKPiBpbmNsdWRpbmcgdGhlIHBhZ2Vz
IG5vdCBtYXBwZWQgZHVlIHRvIHRoZSBhbGxvY2F0aW9uIGZhaWx1cmUuICBPbiBhCj4gc3lzdGVt
IHRoYXQgZmFpbHMgdGhlIGFsbG9jYXRpb24gZnJlcXVlbnRseSwgdGhpcyBwcm9ibGVtIGxlYWRz
IHRvCj4gZm9sbG93aW5nIGtlcm5lbCBjcmFzaC4KPiAKPiAgIFsgIDM3Mi4wMTI1MzhdIEJVRzog
dW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IDAwMDAw
MDAwMDAwMDAwMDEKPiAgIFsgIDM3Mi4wMTI1NDZdIElQOiBbPGZmZmZmZmZmODE0MDcxYWM+XSBn
bnR0YWJfdW5tYXBfcmVmcy5wYXJ0LjcrMHgxYy8weDQwCj4gICBbICAzNzIuMDEyNTU3XSBQR0Qg
MTZmM2U5MDY3IFBVRCAxNjQyNmUwNjcgUE1EIDAKPiAgIFsgIDM3Mi4wMTI1NjJdIE9vcHM6IDAw
MDIgWyMxXSBTTVAKPiAgIFsgIDM3Mi4wMTI1NjZdIE1vZHVsZXMgbGlua2VkIGluOiBhY3RfcG9s
aWNlIHNjaF9pbmdyZXNzIGNsc191MzIKPiAgIC4uLgo+ICAgWyAgMzcyLjAxMjc0Nl0gQ2FsbCBU
cmFjZToKPiAgIFsgIDM3Mi4wMTI3NTJdICBbPGZmZmZmZmZmODE0MDcyMDQ+XSBnbnR0YWJfdW5t
YXBfcmVmcysweDM0LzB4NDAKPiAgIFsgIDM3Mi4wMTI3NTldICBbPGZmZmZmZmZmYTAzMzVhZTM+
XSB4ZW5fYmxrYmtfdW5tYXArMHg4My8weDE1MCBbeGVuX2Jsa2JhY2tdCj4gICAuLi4KPiAgIFsg
IDM3Mi4wMTI4MDJdICBbPGZmZmZmZmZmYTAzMzZjNTA+XSBkaXNwYXRjaF9yd19ibG9ja19pbysw
eDk3MC8weDk4MCBbeGVuX2Jsa2JhY2tdCj4gICAuLi4KPiAgIERlY29tcHJlc3NpbmcgTGludXgu
Li4gUGFyc2luZyBFTEYuLi4gZG9uZS4KPiAgIEJvb3RpbmcgdGhlIGtlcm5lbC4KPiAgIFsgICAg
MC4wMDAwMDBdIEluaXRpYWxpemluZyBjZ3JvdXAgc3Vic3lzIGNwdXNldAo+IAo+IFRoaXMgY29t
bWl0IGZpeGVzIHRoaXMgcHJvYmxlbSBieSBtYXJraW5nIHRoZSBncmFudCBwYWdlcyBvZiB0aGUg
Z2l2ZW4KPiByZXF1ZXN0IHRoYXQgZGlkbid0IG1hcHBlZCBkdWUgdG8gdGhlIGFsbG9jYXRpb24g
ZmFpbHVyZSBhcyBpbnZhbGlkLgo+IAo+IEZpeGVzOiBjNmNjMTQyZGFjNTIgKCJ4ZW4tYmxrYmFj
azogdXNlIGJhbGxvb24gcGFnZXMgZm9yIGFsbCBtYXBwaW5ncyIpCj4gCj4gU2lnbmVkLW9mZi1i
eTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogRGF2aWQg
V29vZGhvdXNlIDxkd213QGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogTWF4aW1pbGlhbiBIZXlu
ZSA8bWhleW5lQGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFu
dEBhbWF6b24uY28udWs+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
