Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ACF17AB3B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 18:10:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9txj-0008UQ-Dq; Thu, 05 Mar 2020 17:07:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ek+B=4W=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j9txh-0008UG-Fs
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 17:07:05 +0000
X-Inumbo-ID: bc9ee3e0-5f03-11ea-a631-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc9ee3e0-5f03-11ea-a631-12813bfff9fa;
 Thu, 05 Mar 2020 17:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583428024;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=UGp+eD0HgtUg2MZa4Seqr9rPQKfA0VT+fKWG7/UCXbw=;
 b=GkIq0xOi3+OG1blkDlxUddsaPo3tDiF9cyW5LfiVp2HwvKQkT7Xq1uK5
 SoFURvQiDtslqCSOd1Oo+N3eLJMFhRsBMueoNM/YR5th3evqDlUSIuTOR
 CuT2qrYOqbwlJ8aAnKI2wHeU70Gx5RSefWO3iszsirWwUZ7FqkNDoZDY5 g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AD7+qybMogRTKKUqqln1+BzCkTo5hIedM8zQmdNyticlv8KgvzX3ivQkV6Ke1uvcbrzhI3JEW6
 5Q7N6iGOJ+aBcMR55sS5WpY9UWOh9BLHRAmBeOpNXRtBpp617uca4dOF69CPz7dczUzUcqG8As
 61H6SfgM2Pc2cc8auUbnyi7KSIgwjh7U6eYhOgbW7VYCOcC0TlW17+ryypmoXPnmshV7BY7IWU
 0gwXlNW25PdO6QMK9Vt/vN6Wve393aCwA6tpNG2ZMDXUWApSW9kbIxBapSMCvr4vobGtVXrtIs
 JO8=
X-SBRS: 2.7
X-MesageID: 14104875
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,518,1574139600"; d="scan'208";a="14104875"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24161.12725.227699.578499@mariner.uk.xensource.com>
Date: Thu, 5 Mar 2020 17:07:01 +0000
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <6b8d1199-cd89-ca6c-719b-bb898842d542@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-11-andrew.cooper3@citrix.com>
 <24148.2649.756710.728091@mariner.uk.xensource.com>
 <6b8d1199-cd89-ca6c-719b-bb898842d542@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 10/17] tools/libxl: Plumb a restore
 boolean down into libxl__build_pre()
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1BBVENIIHYyIDEwLzE3XSB0b29scy9saWJ4bDog
UGx1bWIgYSByZXN0b3JlIGJvb2xlYW4gZG93biBpbnRvIGxpYnhsX19idWlsZF9wcmUoKSIpOgo+
IE9uIDI0LzAyLzIwMjAgMTc6MzksIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gTWF5YmUgaXQgd291
bGQgYmUgYmV0dGVyIHRvIHBhc3MgdGhpcyB2aWEgbGlieGxfX2RvbWFpbl9idWlsZF9zdGF0ZQo+
ID4gcmF0aGVyIHRoYW4gYXMgYW4gYWRkaXRpb25hbCBwYXJhbWV0ZXIgPwo+IAo+IFdlbGwgLSBJ
IHRyaWVkIGEgc2ltaWxhciBhcHByb2FjaCB0aGUgZmlyc3QgdGltZSBhcm91bmQsIGFuZCBpdCBi
cm9rZQo+IHN0dWJkb21zIHNvIGJhZGx5IGl0IG5lZWRlZCByZXZlcnRpbmcuCj4gCj4gKFVudHJp
bSB0aGUgY29tbWl0IGRldGFpbHMpCj4gCj4gPiB2MjoKPiA+ICAqIE5ldy4gIFRoaXMgaXMgYy9z
IGFhY2MxNDMwMDY0ICJ0b29scy9saWJ4bDogUGx1bWIgZG9tYWluX2NyZWF0ZV9zdGF0ZSBkb3du
Cj4gPiAgICBpbnRvIGxpYnhsX19idWlsZF9wcmUoKSIgdGFrZS0yLCB3aXRob3V0IGFueSBjb2xs
YXRlcmFsIGRhbWFnZSB0byBzdHViZG9tcy4KPiAKPiBUaGUgYWN0dWFsIGluZm9ybWF0aW9uIHdl
IHdhbnQgaXMgaW4gbGlieGxfX2RvbWFpbl9jcmVhdGVfc3RhdGUKPiAoc3BlY2lmaWNhbGx5LCBy
ZXN0b3JlX2ZkID49IC0xKS7CoCBJIGZpcnN0IHRyaWVkIHBsdW1iaW5nIGRjcyBkb3duLCB0bwo+
IGF2b2lkIHN0YXNoaW5nIHRoZSBzYW1lIGluZm9ybWF0aW9uIGluIHR3byBkaWZmZXJlbnQgc3Ry
dWN0dXJlcyBhdAo+IGRpZmZlcmVudCB0aW1lcy4KPiAKPiBTYWRseSwgcGx1bWJpbmcgZGNzIGRp
ZG4ndCB3b3JrIGJlY2F1c2UgaXQgaXMgY29tbW9uIGJldHdlZW4gdGhlIHJlYWwKPiBkb21haW4g
YW5kIHRoZSBzdHViZG9tIChhbmQgdGhpcyBsZWFkIHRvIHRoZSBzdHViZG9tIGdldHRpbmcgbm8g
c2V0dGluZ3MKPiBhdCBhbGwpLsKgIFdoYXQgd2Ugd2FudCB0byBkbyBpcyBvbmx5IGluZmx1ZW5j
ZSB0aGUgQ1BVSUQgY29uc3RydWN0aW9uIG9mCj4gdGhlIG1haW4gZG9tYWluICh3aGljaCBtYXkg
YmUgbWlncmF0aW5nIGluKSwgd2hlcmVhcyB0aGUgc3R1YmRvbSBhbHdheXMKPiB3YW50cyBmcmVz
aCBzZXR0aW5ncy4KClJpZ2h0LiAgVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24sIHdoaWNoIG1h
a2Ugc2Vuc2UgdG8gbWUuCgo+IEkgY291bGQgZHVwbGljYXRlIGl0IGludG8gZGJzLCBhbmQgYXQg
YSBndWVzcyB0aGF0IHdvdWxkIHByb2JhYmx5IHdvcmssCj4gYnV0IGlzbid0IGl0IHRha2luZyBh
IGJhZCBwcm9ibGVtIGFuZCBtYWtpbmcgaXQgd29yc2U/CgpJIHRoaW5rIHRoYXQgaXMgZmluZS4K
CkNvbmNlcHR1YWxseSBJIHRoaW5rIGl0J3MgbGlrZSB0aGlzOgoKVGhlc2Ugc3RydWN0cyB0YWtl
IHBsYWNlIG9mIGh1Z2UgbGlzdHMgb2YgcGFyYW1ldGVycy4gIFdoZW4gd2UgY3JlYXRlCmEgc2Vy
dmljZSBkb21haW4sIHdlIG5lZWQgdG8gcGFzcyBhIG5ldyBsaXN0IG9mIHBhcmFtZXRlcnMKKF9i
dWlsZF9zdGF0ZSksIHdlIGFsc28gcGFzcyBzb21lIG9mIHRoZSBvcmlnaW5hbCBvbmVzCihfY3Jl
YXRlX3N0YXRlKS4gIElmIHdlIGFyZSB0YWxraW5nIGFib3V0IHBhcmFtZXRlcnMgdGhhdCBuZWVk
IHRvIGJlCmRpZmZlcmVudCBmb3IgYSBzZXJ2aWNlIGRvbWFpbiwgdGhleSBzaG91bGQgYmUgaW4g
X2J1aWxkX3N0YXRlOyBldmVuCmlmIHRoZSBtYWluIGRvbWFpbidzIHZlcnNpb24gaXMgZWZmZWN0
aXZlbHkgYSBjb3B5IG9mIHNvbWV0aGluZyBpbgpfY3JlYXRlX3N0YXRlLgoKU28gSSB0aGluayBh
ZGRpbmcgYSAicmVzdG9yaW5nIiBvciAicmVzdG9yZSIgYm9vbGVhbiB0byBkYnMgaXMKcHJvYmFi
bHkgcmlnaHQuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
