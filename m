Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F3AE8A97
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 15:18:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPSGz-0006eH-0V; Tue, 29 Oct 2019 14:15:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BagA=YW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iPSGx-0006eC-CO
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 14:14:59 +0000
X-Inumbo-ID: 76d80e66-fa56-11e9-9513-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76d80e66-fa56-11e9-9513-12813bfff9fa;
 Tue, 29 Oct 2019 14:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572358488;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=zElM9HOsif16a18BmEQ+jn2mhLKwJ0+W/powFmYUz6k=;
 b=b5BZmQb28Ijr0Q8kqI2tt9caDVJMJ5fGIDQ4A/qxBfVoD5xtClTzYYuB
 iw6rd1jiC2Tb7WYnjC+SKhUgWO7RLQy/q1oDJrbr0xH0+PXIMNO9apTKS
 Suh7VslI3Pz8eWhDvyZAtrerWYGIc/4exPciFMaIEblVT9IRVpJuVMYxK M=;
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
IronPort-SDR: YQNUg6P761D3HMAi0r9RQrLKRWmk4syZSRJLNv5JPF8GLJgsRgwLKWvNe7xyvvan4c1mX8OCCA
 wjCnhZJTDG7SxHVMtuok10SWgfPm8tgnOF70VDW3L0T8rb6DfRNPI4zny1/x49KIUKeNR44sg2
 iHdGkqOjdWxYrEggUInzpyiS5ZsnQHxaGaHLlItQYnRslDzgMMY4xju9oBkQLOL/sP8twgbKqH
 HLKmHpdyX5mCShMMi06+TLzM03cMCkqlhzA9EaE8VAaIjZF7xKUNvh5olzpkD8sB5V91NzMiDV
 ncg=
X-SBRS: 2.7
X-MesageID: 7926565
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,244,1569297600"; 
   d="scan'208";a="7926565"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23992.18773.35055.679680@mariner.uk.xensource.com>
Date: Tue, 29 Oct 2019 14:14:45 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191028162700.GB1162@perard.uk.xensource.com>
References: <20191025170505.2834957-1-anthony.perard@citrix.com>
 <23990.53286.572469.441064@mariner.uk.xensource.com>
 <20191028162700.GB1162@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [RFC XEN PATCH for-4.13 0/4] Fix: libxl workaround,
 multiple connection to single QMP socket
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
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtSRkMgWEVOIFBBVENIIGZvci00LjEzIDAvNF0g
Rml4OiBsaWJ4bCB3b3JrYXJvdW5kLCBtdWx0aXBsZSBjb25uZWN0aW9uIHRvIHNpbmdsZSBRTVAg
c29ja2V0Iik6Cj4gVGhvc2Ugc3VnZ2VzdGlvbnMgYXJlIGludGVyZXN0aW5nIGlkZWEsIGJ1dCBJ
IHdvdWxkIHByZWZlciB0byBoYXZlIGxpYnhsCj4gYmVlbiBhYmxlIHRvIGRlYWwgd2l0aCBhbnkg
dmVyc2lvbiBvZiBRRU1VLCBzbyB3aXRob3V0IGhhdmluZyB0byBwYXRjaAo+IFFFTVUuIEJlc2lk
ZSBzZXJpYWxpc2luZyBRTVAgYWNjZXNzIGluIHRoZSBjb2RlLCBmb3JrL2xvY2sgc3RyYXRlZ3kK
PiBtaWdodCBiZSB0aGUgb25seSBvdGhlciB3YXkuIChXZWxsIHRoZXJlIGlzIGFsc28gZm9yay9j
b25uZWN0IHdpdGggYQo+IGJsb2NraW5nIGZkLCBidXQgd2UgYWxyZWFkeSBoYXZlIGNvZGUgZm9y
IGZvcmsvbG9jay4pCj4gCj4gU28gSSdsbCBrZWVwIHdvcmtpbmcgb24gdGhlIGZvcmsvbG9jayBz
dHJhdGVneS4KCk9LLiAgVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgcmVwbHksIHdoaWNoIG1ha2Vz
IHNlbnNlIHRvIG1lLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
