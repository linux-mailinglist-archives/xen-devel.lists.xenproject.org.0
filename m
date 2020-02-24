Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8038A16AA8C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 16:56:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6G3h-0008K4-Om; Mon, 24 Feb 2020 15:54:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gH7p=4M=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j6G3g-0008JX-2R
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 15:54:12 +0000
X-Inumbo-ID: e5dfa8e0-571d-11ea-aba8-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5dfa8e0-571d-11ea-aba8-bc764e2007e4;
 Mon, 24 Feb 2020 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582559652;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=8jUd1nNYfrX1cojqRb7BB2c3LWMr4JwFw+EQNvkClME=;
 b=cTwXgfUF9VFzW9/CJD3k7gMHIoXsuFSlhO4D041srUV8wFj/yAE0fAvt
 UBI4rBAdyReZVIRQciTN7L2SBRSdE0yFuVFIqejQn5qQg+GcnlAketFQ6
 LKt13Nkkx74zF3LqpLp3SKV+O8p4jaKiz3nn0pzeyNQAo+ndwg7MKaCd8 Q=;
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
IronPort-SDR: MbrZO+7SQ0vituYrYgrkJKrHoD+to9uIrA5qH6WvTnOf2FwifLGIcLfNmGv9GvrjhjWx/3PWyF
 AbjqSxpUjR2JFcHMpm7wvp7U0057l9R5A8Wv7ucjZDlpmXIMR1anoBi5dOrXsGM3HnlhQXipcP
 mbPDFp7UgDSS82s8lLmxYmUKz4lFhz5uud5llLu8qjRthq7KH9oxvSBA54mulIsShQe6Ve+x1G
 o/fQ3ocBDC44RkCwPCjalIE2brZcFmBTnlMoxDZjuLxkQFJ8jAwN3Yv2cEL7JVNgXTkehc98m1
 Njo=
X-SBRS: 2.7
X-MesageID: 12897350
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="12897350"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24147.61855.619335.745427@mariner.uk.xensource.com>
Date: Mon, 24 Feb 2020 15:54:07 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200221112049.3077-1-pdurrant@amazon.com>
References: <20200221112049.3077-1-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v7 0/6] xl/libxl: domid
 allocation/preservation changes
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
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2NyAwLzZdIHhsL2xpYnhsOiBkb21pZCBhbGxv
Y2F0aW9uL3ByZXNlcnZhdGlvbiBjaGFuZ2VzIik6Cj4gUGF1bCBEdXJyYW50ICg2KToKPiAgIGxp
YnhsOiBhZGQgaW5mcmFzdHJ1Y3R1cmUgdG8gdHJhY2sgYW5kIHF1ZXJ5ICdyZWNlbnQnIGRvbWlk
cwo+ICAgbGlieGw6IG1vZGlmeSBsaWJ4bF9fbG9ndigpIHRvIG9ubHkgbG9nIHZhbGlkIGRvbWlk
IHZhbHVlcwo+ICAgcHVibGljL3hlbi5oOiBhZGQgYSBkZWZpbml0aW9uIGZvciBhICd2YWxpZCBk
b21pZCcgbWFzawo+ICAgbGlieGw6IGFsbG93IGNyZWF0aW9uIG9mIGRvbWFpbnMgd2l0aCBhIHNw
ZWNpZmllZCBvciByYW5kb20gZG9taWQKPiAgIHhsLmNvbmY6IGludHJvZHVjZSAnZG9taWRfcG9s
aWN5Jwo+ICAgeGw6IGFsbG93IGRvbWlkIHRvIGJlIHByZXNlcnZlZCBvbiBzYXZlL3Jlc3RvcmUg
b3IgbWlncmF0ZQoKVGhhbmtzIGZvciB0aGlzLiAgSSB0aGluayB0aGlzIGhhcyBlbm91Z2ggYWNr
cyB0byBnbyBpbiBub3cuICBXb3VsZAp5b3UgY2FyZSB0byBmb2xkIHRoZSBhY2tzL3Jldmlld3Mg
YW5kIHBhc3MgbWUgYSBnaXQgYnJhbmNoID8gIElmIGl0J3MKZWFzeSBmb3IgeW91LCB0aGF0IHdv
dWxkIGJlIG1vcmUgY29udmVuaWVudCBhbmQgcmVsaWFibGUgdGhhbiByZWx5aW5nCm9uIGdpdC1h
bS4gIEZlZWwgZnJlZSB0byBuZWdvdGlhdGUgYWJvdXQgZGV0YWlscyBvbiBpcmMuLi4KClRoYW5r
cywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
