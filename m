Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD9BE1F43
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 17:26:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNIUf-0006td-7Y; Wed, 23 Oct 2019 15:24:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l49O=YQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iNIUe-0006tY-CR
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 15:24:12 +0000
X-Inumbo-ID: 2819b88b-f5a9-11e9-9484-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2819b88b-f5a9-11e9-9484-12813bfff9fa;
 Wed, 23 Oct 2019 15:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571844249;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=wtqAYggugDeDubIdf6ao01MzK/G/NGnFzEnHwG7VELg=;
 b=SFjjWhe+USfwxDSgjLd38yiJUMVeCwGCqmA1J+dv+/BIbY3lFlKbjh7h
 OtVaIEHBEGjRW32rOc6GwPzLMzaG8TV0701WO0BTqoNbDLqLzqDBVYa7t
 7Bu5HE0E+bmfgDuFxjDJnCPBVQtSCyQ7VTAXVwWnBJg4hBtJ/7tF+QSW5 M=;
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
IronPort-SDR: BjVwCLsmSjLlIl9DIkTjRhyXjaE9xUglPRR8/Gr37bRZLNBYQjDsSH1FVJRd6N6EGBi3ZfZGZv
 ONP9e7mi+p+2brMHcaBMcQ03KpsjREQnUkFnQhHUos8WPDaKxAzt0XdKo0szJiVk3fYFjRYKk5
 UgwVGsKe1lWH5XxbPHiG72N+SwWExCFu7jBOAYBlf/lObZFn+T0j+LF+VH36DG0KEpnOqqXMbd
 bhtIREV9D2NmnWhjVaBumGiRgl8bvFENT6aQYn5Uex7np/LujO2qjcwlpL3XEQxlFygYscZHBO
 2Nk=
X-SBRS: 2.7
X-MesageID: 7326987
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7326987"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23984.28821.191685.250180@mariner.uk.xensource.com>
Date: Wed, 23 Oct 2019 16:24:05 +0100
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <986c12bb-a7f2-bb37-10f9-c2d59698bcf3@arm.com>
References: <20191023150103.31562-1-ian.jackson@eu.citrix.com>
 <20191023150103.31562-2-ian.jackson@eu.citrix.com>
 <986c12bb-a7f2-bb37-10f9-c2d59698bcf3@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [OSSTEST PATCH 2/2] make-flight: Drop arm64 with
 Linux before 4.10
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
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbT1NTVEVTVCBQQVRDSCAyLzJdIG1ha2UtZmxpZ2h0
OiBEcm9wIGFybTY0IHdpdGggTGludXggYmVmb3JlIDQuMTAiKToKPiBPbiAyMy8xMC8yMDE5IDE2
OjAxLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IFRoZSBkcml2ZXIgZm9yIHRoZSBsYXh0b25zJyBu
ZXR3b3JrIGNhcmRzIGlzIG5vdCBpbiA0LjQgKGFuZCB0aGF0J3MKPiA+IHF1aXRlIG9sZCkuICBP
dXIgVGh1bmRlclgncyBtYXkgZXZlbiByZXF1aXJlIHNvbWV0aGluZyBtb3JlIHJlY2VudCBidXQK
PiA+IHdlIHdpbGwgY3Jvc3MgdGhhdCBicmlkZ2Ugd2hlbiB3ZSBzZWUgaXQuCj4gPiAKPiA+IEVm
ZmVjdCBpcyB0byBkcm9wIHRoZSBmb2xsb3dpbmcgam9iczoKPiA+ICAgIGxpbnV4LTQuMSAgKmFy
bTY0Kgo+ID4gICAgbGludXgtNC40ICAqYXJtNjQqCj4gPiAgICBsaW51eC00LjkgICphcm02NCoK
PiA+IChDaGVja2VkIGJ5IGV5ZWJhbGxpbmcgc3RhbmRhbG9uZS1nZW5lcmF0ZS1kdW1wLWZsaWdo
dC1ydW52YXJzIGRpZmYuKQo+ID4gCj4gPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KPiA+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KPiAKPiBGV0lXOgo+IAo+IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgoKVGhhbmtzLiAgSSBhbSB3YWl0aW5nIGZvciBhIHB1c2ggdGhyb3VnaCBvbiBt
eSBwcmV2aW91cyBvc3N0ZXN0CmNvbW1pdHMgc28gSSB3aWxsIHByb2JhYmx5IHB1c2ggdGhpcyB0
byBwcmV0ZXN0IHRvbW9ycm93LgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
