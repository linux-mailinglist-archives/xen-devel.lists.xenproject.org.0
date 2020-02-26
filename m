Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094C4170455
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 17:29:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6zVW-0000Hx-La; Wed, 26 Feb 2020 16:25:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XWk4=4O=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j6zVU-0000Hs-Rm
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 16:25:56 +0000
X-Inumbo-ID: a9efcb56-58b4-11ea-a490-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9efcb56-58b4-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 16:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582734356;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=RgFBn6giR+Do7Du+TlwZoJtUOaYgWpA4aER/ZEiYvak=;
 b=hmzyd++OafrOP8CqE1rARFtkdxm2Y0maY9x9kq+Kqco6M6cu93KBs2Ie
 c7no3KlcM62ha7QlPgIF5cdChEfg2rKdcxtZmN7hOp1vLTixa8QjcbDEK
 qLfzoPV0xdXGtlZy8DwVnUWddvliFJP3d/e0LKnfhyIOH7CRfTJ4u4DVN Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oe9ZiHLz3uwkJOXiEemUoWCcv4St0gtcu1fWpMLlOa6cYkzaD56wT4tOmryRZ8XlB1/t3eZyqN
 lAJOSNn06VO3srBNcnpbG57JnBViML5uW6EHBEignZgJ0vC6BO04dY8omI2vwZmXYlfUqOQPtI
 LOt/jCf+1YNzBiDQpFhxF3S6tDMY/VvGjreiTt3WNVVMWwndWDJpCugMLLZGMWSnA2FzxTREgE
 ZxOeGhw31GonQKoMD1SkSuk4HdPlfxemCs1vkvfINDOQMc5Rlli5F+JA9d8hSIoAVHPzEMdDSa
 O3o=
X-SBRS: 2.7
X-MesageID: 13058696
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,488,1574139600"; d="scan'208";a="13058696"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24150.39952.158514.284868@mariner.uk.xensource.com>
Date: Wed, 26 Feb 2020 16:25:52 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200226160848.1854-2-pdurrant@amazon.com>
References: <20200226160848.1854-1-pdurrant@amazon.com>
 <20200226160848.1854-2-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 1/3] libxl: create domain 'error' node in
 xenstore
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCAxLzNdIGxpYnhsOiBjcmVhdGUgZG9tYWluICdl
cnJvcicgbm9kZSBpbiB4ZW5zdG9yZSIpOgo+IFNldmVyYWwgUFYgZHJpdmVycyAoYm90aCBoaXN0
b3JpY2FsbHkgYW5kIGN1cnJlbnRseSBbMV0pIHJlcG9ydCBlcnJvcnMKPiBieSB3cml0aW5nIHRl
eHQgaW50byAvbG9jYWwvZG9tYWluLyRET01JRC9lcnJvci4gVGhpcyBwYXRjaCBjcmVhdGVzIHRo
ZQo+IG5vZGUgaW4gbGlieGwgYW5kIG1ha2VzIGl0IHdyaXRhYmxlIGJ5IHRoZSBkb21haW4sIGFu
ZCBhbHNvIGFkZHMgc29tZQo+IHRleHQgaW50byB4ZW5zdG9yZS1wYXRocy5wYW5kb2MgdG8gc3Rh
dGUgd2hhdCB0aGUgbm9kZSBpcyBmb3IuCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
