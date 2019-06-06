Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE973775F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 17:04:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYtuZ-0001ab-8K; Thu, 06 Jun 2019 15:02:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p1/W=UF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYtuY-0001aU-9a
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 15:02:38 +0000
X-Inumbo-ID: 1e878c0c-886c-11e9-9c37-a7e90529880c
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e878c0c-886c-11e9-9c37-a7e90529880c;
 Thu, 06 Jun 2019 15:02:36 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 06 Jun 2019 09:02:35 -0600
Message-Id: <5CF92B090200007800235FE5@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 06 Jun 2019 09:02:33 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Roger Pau Monne" <roger.pau@citrix.com>
References: <1559831189-26103-1-git-send-email-andrew.cooper3@citrix.com>
 <20190606143102.hozjnlcmod3ktjhv@Air-de-Roger>
In-Reply-To: <20190606143102.hozjnlcmod3ktjhv@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/irq: Fix undefined behaviour in
 irq_move_cleanup_interrupt()
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA2LjE5IGF0IDE2OjMxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgSnVuIDA2LCAyMDE5IGF0IDAzOjI2OjI5UE0gKzAxMDAsIEFuZHJldyBDb29wZXIg
d3JvdGU6Cj4+IFVCU0FOIHJlcG9ydHM6Cj4+IAo+PiAgIChYRU4pIAo+ID09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Cj4gPT09Cj4+ICAgKFhFTikgVUJTQU46IFVuZGVmaW5lZCBiZWhhdmlvdXIgaW4gaXJx
LmM6NjgyOjIyCj4+ICAgKFhFTikgbGVmdCBzaGlmdCBvZiAxIGJ5IDMxIHBsYWNlcyBjYW5ub3Qg
YmUgcmVwcmVzZW50ZWQgaW4gdHlwZSAnaW50Jwo+PiAgIChYRU4pIC0tLS1bIFhlbi00LjEzLXVu
c3RhYmxlICB4ODZfNjQgIGRlYnVnPXkgICBOb3QgdGFpbnRlZCBdLS0tLQo+PiAgIChYRU4pIENQ
VTogICAgMTYKPj4gICAoWEVOKSBSSVA6ICAgIGUwMDg6WzxmZmZmODJkMDgwMmE1NGNlPl0gdWJz
YW4uYyN1YnNhbl9lcGlsb2d1ZSsweGEvMHhjMgo+PiAgIDxzbmlwPgo+PiAgIChYRU4pIFhlbiBj
YWxsIHRyYWNlOgo+PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDJhNTRjZT5dIHVic2FuLmMjdWJz
YW5fZXBpbG9ndWUrMHhhLzB4YzIKPj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAyYTYwMDk+XSBf
X3Vic2FuX2hhbmRsZV9zaGlmdF9vdXRfb2ZfYm91bmRzKzB4MTVkLzB4MTZjCj4+ICAgKFhFTikg
ICAgWzxmZmZmODJkMDgwMzFhZTc3Pl0gaXJxX21vdmVfY2xlYW51cF9pbnRlcnJ1cHQrMHgyNWMv
MHg0YTAKPj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAzMWI1ODU+XSBkb19JUlErMHgxOWQvMHgx
MDRjCj4+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwNTBjOGJhPl0gY29tbW9uX2ludGVycnVwdCsw
eDEwYS8weDEyMAo+PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDNiMTNhNj5dIGNwdV9pZGxlLmMj
YWNwaV9pZGxlX2RvX2VudHJ5KzB4MWRlLzB4MjRiCj4+ICAgKFhFTikgICAgWzxmZmZmODJkMDgw
M2IxZDgzPl0gY3B1X2lkbGUuYyNhY3BpX3Byb2Nlc3Nvcl9pZGxlKzB4NWM4LzB4OTRlCj4+ICAg
KFhFTikgICAgWzxmZmZmODJkMDgwMmZhOGQ2Pl0gZG9tYWluLmMjaWRsZV9sb29wKzB4ZWUvMHgx
MDEKPj4gICAoWEVOKQo+PiAgIChYRU4pIAo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPT09Cj4+
IAo+PiBTd2l0Y2ggdG8gYW4gdW5zaWduZWQgc2hpZnQsIGFuZCBjb3JyZWN0IHRoZSBzdXJyb3Vu
ZGluZyBzdHlsZS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
