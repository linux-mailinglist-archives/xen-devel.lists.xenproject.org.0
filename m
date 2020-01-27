Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC89214A745
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 16:36:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw6P5-0000y8-Qr; Mon, 27 Jan 2020 15:34:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ksAf=3Q=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iw6P4-0000y3-SH
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 15:34:18 +0000
X-Inumbo-ID: 7ae60a85-411a-11ea-8569-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ae60a85-411a-11ea-8569-12813bfff9fa;
 Mon, 27 Jan 2020 15:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580139257;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Dd/fgs1siLuoZqoZQsQQQCkIirYtG74Lc7oYUoCaaAE=;
 b=bQUUgQRHEssd4S29C9ZDV2izF07dgvYG9O6gUIntpnXiqUdP0gD78igu
 bj9a/q4/sRrwkGKHj1BvDT1jhCFfgBqjSPdrFJoG9jf/WtwdbXRv7yWjx
 o1wIaWVH9fRwupjbx8fQiBi7B1XhzJjFmM/7/bSBoeBwRMIcWcn2K0JPt 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0KL08FW+ql1AMyMb04QEYjBVuRqw54CQbVtfvBj7WGcV8nRvmu5Rm5FVmOaF5im+8pfqoSQOgY
 R/LoJ/O7e/jgtXvnyTrvVSU4CW86hhtTiCPs0DCc8h+EViVh7IKtV4+ZYLyMF4xi81AlPi1n79
 obRI8tDEeSsXSFU4R47WyuY1/Cn8t0O/uKoqmctL34wA2tx3yKvhAEyAzis+WBhix5NpsWG9SW
 M6wHVmzkJ766k1oP93gdoWQg+t0ffS4kDSG2JX47L+RZEZ1ChlmqKx0XaQ6Rqi8ppDibMfVg/e
 GE0=
X-SBRS: 2.7
X-MesageID: 11930356
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11930356"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24111.734.509410.455377@mariner.uk.xensource.com>
Date: Mon, 27 Jan 2020 15:33:50 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200127151907.2877-1-pdurrant@amazon.com>
References: <20200127151907.2877-1-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] docs: retrospectively add XS_DIRECTORY_PART
 to the xenstore protocol...
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSF0gZG9jczogcmV0cm9zcGVjdGl2ZWx5IGFkZCBY
U19ESVJFQ1RPUllfUEFSVCB0byB0aGUgeGVuc3RvcmUgcHJvdG9jb2wuLi4iKToKPiAuLi4gc3Bl
Y2lmaWNhdGlvbi4KPiAKPiBUaGlzIHdhcyBhZGRlZCBieSBjb21taXQgMGNhNjRlZDggInhlbnN0
b3JlOiBhZGQgc3VwcG9ydCBmb3IgcmVhZGluZwo+IGRpcmVjdG9yeSB3aXRoIG1hbnkgY2hpbGRy
ZW4iIGJ1dCBub3QgYWRkZWQgdG8gdGhlIHNwZWNpZmljYXRpb24gYXQgdGhhdAo+IHBvaW50LiBB
IHZlcnNpb24gb2YgeGVuc3RvcmVkIHN1cHBvcnRpbmcgdGhlIGNvbW1hbmQgd2FzIGZpcnN0IHJl
bGVhc2VkCj4gaW4gWGVuIDQuOS4KClRoYW5rcyBmb3IgZG9jdW1lbnRpbmcgdGhpcy4gIEEgZG9j
cyBmaXggbGlrZSB0aGlzIHNob3VsZCBiZQpiYWNrcG9ydGVkIGlmIGl0IGFwcGxpZXMsIElNTy4K
CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQmFja3Bv
cnQ6IDQuOSsKCkkgd2lsbCBjb21taXQgaXQgdG8gc3RhZ2luZyBtb21lbnRhcmlseS4KCj4gK0RJ
UkVDVE9SWV9QQVJUCQk8cGF0aD58PGluZGV4fD4JCTxjaGlsZC1sZWFmLW5hbWU+fCoKPiArCVBl
cmZvcm1zIHRoZSBzYW1lIGZ1bmN0aW9uIGFzIERJUkVDVE9SWSwgYnV0IHJldHVybnMgYQo+ICsJ
c3ViLWxpc3Qgb2YgY2hpbGRyZW4gc3RhcnRpbmcgYXQgPGluZGV4PiBpbiB0aGUgb3ZlcmFsbAo+
ICsJY2hpbGQgbGlzdCBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRvIFhFTlNUT1JFX1BBWUxPQURf
TUFYCj4gKwlvY3RldHMgaW4gbGVuZ3RoLiBJZiA8aW5kZXg+IGlzIGJleW9uZCB0aGUgZW5kIG9m
IHRoZQo+ICsJb3ZlcmFsbCBjaGlsZCBsaXN0IHRoZW4gdGhlIHJldHVybmVkIHN1Yi1saXN0IHdp
bGwgYmUKPiArCWVtcHR5LgoKSSB3b25kZXIgaWYgaXQgc2hvdWxkIGJlIHNvbWVob3cgbWFkZSBt
b3JlIGV4cGxpY2l0IHRoYXQgYGluZGV4JyBpcyBhCmNvdW50IG9mIGRpcmVjdG9yeSBlbnRyaWVz
LCBub3QgYnl0ZXMuICBNYXliZSB0aGlzIGlzIG9idmlvdXMuCgpJYW4uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
