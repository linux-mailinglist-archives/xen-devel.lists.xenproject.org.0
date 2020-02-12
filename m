Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0060B15AE02
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 18:05:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1vNj-0000nN-I2; Wed, 12 Feb 2020 17:00:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zgzp=4A=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j1vNi-0000nI-A3
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 17:00:58 +0000
X-Inumbo-ID: 3cd1923a-4db9-11ea-b0fd-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cd1923a-4db9-11ea-b0fd-bc764e2007e4;
 Wed, 12 Feb 2020 17:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581526857;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=B1To0XMe3WoXxiFfPv8t3h35N58LhCwFvOu7GhUuQ/E=;
 b=ZtuJZXcSMWlQMjPC3EzrinEJYSJPb+AT0x5MMTFvkr3ljyxJTbOEFmLM
 aAQoJggzknFUTQq8453KGydRRxsjYRYDPdCOLDV1+pWa3p3zf+VaZEIZV
 +KHNlwT5gBfAkmjFf8hFBtQMF2NgcDqBXd2v287hU+xuL0AzW/Wh1o8jG I=;
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
IronPort-SDR: QpFRW44V+ZlrXs6RA2bkstgeckCx+qLYSj9WzWEn75g3S+J93p0Ewq6Oxzry2CNmEaTpinpp6V
 W/YZUQEZyaqGRilYKYE1XLvwVRoNty0yfVyRAXB3jNMV3m/72Lw+K6bJf2WW97QTtQOQ6hLq4U
 lBNVwIqWP6QIhV97bqeChGRC+RXr5i6JD3e1JrUUQcJY3WvUWJh77w2Rko8mmnopditXrBogvz
 +FXfRDw3GDJeKAA+Kj55JHf2ialpDiTXUjorzQvtVZwVv0+OzlYnNZqCm/46x8HdRiK7TyqPoS
 ZGA=
X-SBRS: 2.7
X-MesageID: 12781923
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,433,1574139600"; d="scan'208";a="12781923"
Date: Wed, 12 Feb 2020 18:00:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200212170047.GR4679@Air-de-Roger>
References: <20200212160918.18470-1-liuwe@microsoft.com>
 <20200212160918.18470-3-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212160918.18470-3-liuwe@microsoft.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/4] x86/hypervisor: pass flags to
 hypervisor_flush_tlb
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTIsIDIwMjAgYXQgMDQ6MDk6MTZQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBIeXBlci1WJ3MgTDAgYXNzaXN0ZWQgZmx1c2ggaGFzIGZpbmUtZ3JhaW5lZCBjb250cm9sIG92
ZXIgd2hhdCBnZXRzCj4gZmx1c2hlZC4gV2UgbmVlZCBhbGwgdGhlIGZsYWdzIGF2YWlsYWJsZSB0
byBtYWtlIHRoZSBiZXN0IGRlY2lzaW9ucwo+IHBvc3NpYmxlLgo+IAo+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlIGJlY2F1c2UgWGVuJ3MgaW1wbGVtZW50YXRpb24gZG9lc24ndCBjYXJlIGFib3V0Cj4g
d2hhdCBpcyBwYXNzZWQgdG8gaXQuCgpXaGlsZSBpdCdzIGNlcnRhaW5seSBmaW5lIHRvIHBhc3Mg
YSBmbGFncyBmaWVsZCB3aXRoIG1vcmUgaW5mb3JtYXRpb24sCnRoZSBmbHVzaCBmbGFncyBmb3Ig
WGVuIGNhbiBhbHNvIGNvbnRhaW4gRkxVU0hfQ0FDSEUsIEZMVVNIX1ZDUFVfU1RBVEUKb3IgRkxV
U0hfUk9PVF9QR1RCTCwgY2FuIHlvdSBhZGQgYW4gYXNzZXJ0IHRoYXQgdGhvc2UgbmV2ZXIgZ2V0
IHBhc3NlZAp0byB0aGUgZmx1c2ggaG9vaz8KCklNTyB3ZSBzaG91bGQgZGVmaW5lIGEgbWFzayB3
aXRoIEZMVVNIX1RMQiwgRkxVU0hfVExCX0dMT0JBTCwKRkxVU0hfVkFfVkFMSUQgYW5kIEZMVVNI
X09SREVSX01BU0sgYW5kIGFzc2VydCB0aGF0IHRob3NlIGFyZSB0aGUgb25seQp2YWxpZCBmbGFn
cyB0byBiZSB1c2VkIGZvciB0aGUgaHlwZXJ2aXNvciBhc3Npc3RlZCBmbHVzaCBob29rLgoKVGhh
bmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
