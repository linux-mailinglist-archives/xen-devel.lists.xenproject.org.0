Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 132A318CFCA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 15:13:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFIMx-0006sU-OD; Fri, 20 Mar 2020 14:11:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WMS9=5F=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jFIMw-0006sP-BP
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 14:11:26 +0000
X-Inumbo-ID: aeada8a5-6ab4-11ea-bd7c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aeada8a5-6ab4-11ea-bd7c-12813bfff9fa;
 Fri, 20 Mar 2020 14:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584713485;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=LNNVR7FdEPEV5vSAwrC4AAGj8xWYhiltKmA4E0HPxaQ=;
 b=AXLOuAFX2WD3+8koDDP2C/VuTVc3syHyJSMdiBSQ2+HJMkV7Ad8lz7K0
 zSA+/e8IzZuPbWt4r7579H2za9M1FJ4RkAEklcouzIiNYFxcHNy8GOhrE
 LYB1b1V21I9ceSjB+u16s4mAmKr64xca/uLi/k9DyWGE8KyVFL+95Hnag 0=;
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
IronPort-SDR: to7z1nELMipnjZZRmMk7OGurecXKecr9KZcZtqOewlYYQgFvW0VyuUYvbFVfa8ZQOv4Snu1rJU
 U/cZOzDj1DujGjMmeAEAeEYAP9LKc88uVMsLQGNiusXTolhmjL3nUcuHNIrTIiDcoyBPEGU53p
 xPka6ONcd+R5WGsanCv8EaZjGRRdTZ2Mtp/5NJI06NHZEBMXbp5L+bb1QFcCdK/yd981QDsnFb
 +PqNg2DUoFdgpGpaXstzjHWfeJTzYGmQzQF3qOIHpHuq0I/2hkEly5wb2nyRSuCz/eS/h01PVR
 PqA=
X-SBRS: 2.7
X-MesageID: 14688759
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,284,1580792400"; d="scan'208";a="14688759"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24180.53001.370379.336253@mariner.uk.xensource.com>
Date: Fri, 20 Mar 2020 14:11:21 +0000
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <6ff2589e-3cb9-a8a3-ea22-0798b0574eb0@suse.com>
References: <20200319204025.2649661-1-dwmw2@infradead.org>
 <6ff2589e-3cb9-a8a3-ea22-0798b0574eb0@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 1/2] tools/xenstore: Do not abort
 xenstore-ls if a node disappears while iterating
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
 David Woodhouse <dwmw2@infradead.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SsO8cmdlbiBHcm/DnyB3cml0ZXMgKCJSZTogW1BBVENIIDEvMl0gdG9vbHMveGVuc3RvcmU6IERv
IG5vdCBhYm9ydCB4ZW5zdG9yZS1scyBpZiBhIG5vZGUgZGlzYXBwZWFycyB3aGlsZSBpdGVyYXRp
bmciKToKPiBPbiAxOS4wMy4yMCAyMTo0MCwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+ID4gRnJv
bTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KLi4uCj4gPiBGb3IgdGhlIHNw
ZWNpZmljIGNhc2Ugb2YgRU5PRU5UIGl0IHNlZW1zIHJlYXNvbmFibGUgdG8gZGVjbGFyZSB0aGF0
LAo+ID4gYnV0IGZvciB0aGUgdGltaW5nLCB3ZSBtaWdodCBhcyB3ZWxsIGp1c3Qgbm90IGhhdmUg
c2VlbiB0aGF0IG5vZGUgYXQKPiA+IGFsbCB3aGVuIGNhbGxpbmcgeHNfZGlyZWN0b3J5KCkgZm9y
IHRoZSBwYXJlbnQuIEJ5IGlnbm9yaW5nIHRoZSBlcnJvciwKPiA+IHdlIGdpdmUgYWNjZXB0YWJs
ZSBvdXRwdXQuCgpUaGFua3MuCgo+IEhhdmUgeW91IHRob3VnaHQgYWJvdXQgdGhlIHBvc3NpYmls
aXR5IHRvIGRvIHRoZSBjb21wbGV0ZSBoYW5kbGluZyBpbiBhCj4gc2luZ2xlIHRyYW5zYWN0aW9u
PyBUaGlzIHdvdWxkIGVuc3VyZSBhIGNvbXBsZXRlIGNvbnNpc3RlbnQgcGljdHVyZQo+IGZyb20g
dGhlIHRpbWUgdGhlIG9wZXJhdGlvbiBoYXMgc3RhcnRlZC4gQW55IGluY29uc2lzdGVuY3kgc2hv
dWxkIGJlCj4gcmVwb3J0ZWQgYXMgYW4gZXJyb3IgdGhlbi4KCkkgdGhpbmsgdGhpcyB3b3VsZCBi
ZSBhIGdvb2QgaWRlYSAobm90IGxlYXN0IGJlY2F1c2UgaXQgd291bGQgbWVhbgp0aGF0IGNhbGxl
cnMgb2YgeGVuc3RvcmUtbHMgd291bGRuJ3Qgc2VlIGluY29uc2lzdGVudCBkYXRhKSBidXQgSQp0
aGluayBpdCB3b3VsZCBiZSBhbiBlbmhhbmNlbWVudC4KCkZvciBub3csIGZvciBEYXZpZCdzIG9y
aWdpbmFsIHBhdGNoOgoKUmV2aWV3ZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgoKSWYgYW5kIHdoZW4gd2UgaW50cm9kdWNlIGEgdHJhbnNhY3Rpb24sIERhdmlk
J3MgMS8gc2hvdWxkIGJlIHJldmVydGVkCmFzIGluZGVlZCB0aGVuIGV2ZW4gRU5PRU5UIHdvdWxk
IGluZGljYXRlIHNvbWUga2luZCBvZiBzZXJpb3VzCnByb2JsZW0uCgpUaGFua3MsCklhbi4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
