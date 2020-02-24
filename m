Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F48B16AA88
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 16:55:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6G21-0008Ba-BS; Mon, 24 Feb 2020 15:52:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gH7p=4M=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j6G20-0008BR-GC
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 15:52:28 +0000
X-Inumbo-ID: a7ab8fee-571d-11ea-9212-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7ab8fee-571d-11ea-9212-12813bfff9fa;
 Mon, 24 Feb 2020 15:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582559547;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=TGfCk0MFhuNpFQC/dkHJ53j1f00lZq4e/BqtAXurSNk=;
 b=FpWYC2yFTevVm4UXfW9ya3PSJm+2ufDsrqeyTk8G80KjnCUIb3Kc+BL2
 hjT94ohd1OFb0xWsCcc9E4tC/+TevmOywSRsYpK2t3oGRFLuns3Knrp8R
 2/qeLsxfhLfsj/1aZq7P1Uanf51tc4v41E9Oa6noE4kyxeFTHnHwwSUTQ c=;
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
IronPort-SDR: gFzpRmfcs9A8YmsIXZPa1a13w+ad1OW5/vDriUMtA/EFgZM8BjuI+QNr5yOGGB9Poiawv5U2bu
 bTG5NtvfSIHIPoFE4/CVZ2NRQRaBbPOsAw0lflD4WmafnIpmJ5yhciD6OsRb4akW5pjpjnf1vR
 ZcG/6xzAeE12BwMbnyW3JRgdg6jpaRNf8l4tzMGbYNFSkKhwIH6s9BgrAXX0p1NFC+vxkwPlnD
 BM3uKLcA2huoR87xVD0VlGPjV0R9zeeLyBv00xpA8w1mXa0rJo751p6ZPhWTvUKRfKBrqTiziJ
 gnI=
X-SBRS: 2.7
X-MesageID: 13093636
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="13093636"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24147.61751.554515.526088@mariner.uk.xensource.com>
Date: Mon, 24 Feb 2020 15:52:23 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200221112049.3077-2-pdurrant@amazon.com>
References: <20200221112049.3077-1-pdurrant@amazon.com>
 <20200221112049.3077-2-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v7 1/6] libxl: add infrastructure to track
 and query 'recent' domids
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2NyAxLzZdIGxpYnhsOiBhZGQgaW5mcmFzdHJ1
Y3R1cmUgdG8gdHJhY2sgYW5kIHF1ZXJ5ICdyZWNlbnQnIGRvbWlkcyIpOgo+IEEgZG9taWQgaXMg
Y29uc2lkZXJlZCByZWNlbnQgaWYgdGhlIGRvbWFpbiBpdCByZXByZXNlbnRzIHdhcyBkZXN0cm95
ZWQKPiBsZXNzIHRoYW4gYSBzcGVjaWZpZWQgbnVtYmVyIG9mIHNlY29uZHMgYWdvLiBGb3IgZGVi
dWdnaW5nIGFuZC9vciB0ZXN0aW5nCj4gcHVycG9zZXMgdGhlIG51bWJlciBjYW4gYmUgc2V0IHVz
aW5nIHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZQo+IExJQlhMX0RPTUlEX1JFVVNFX1RJTUVPVVQu
IElmIHRoZSB2YXJpYWJsZSBkb2VzIG5vdCBleGlzdCB0aGVuIGEgZGVmYXVsdAo+IHZhbHVlIG9m
IDYwcyBpcyB1c2VkLgouLi4KPiB2NzoKPiAgLSBBZGRyZXNzZWQgZnVydGhlciBjb21tZW50cyBm
cm9tIElhbgo+ICAtIEludHJvZHVjZWQgJ3N0cnVjdCBsaWJ4bF9fZG9taWRfaGlzdG9yeScgdG8g
aG9sZCBjb250ZXh0CgpUaGFua3MuCgpSZXZpZXdlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+CgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
