Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C525DB96D1
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 19:54:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBN3M-0002rK-D2; Fri, 20 Sep 2019 17:50:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EUeC=XP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iBN3L-0002rB-Di
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 17:50:43 +0000
X-Inumbo-ID: 29a4998e-dbcf-11e9-959d-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29a4998e-dbcf-11e9-959d-12813bfff9fa;
 Fri, 20 Sep 2019 17:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569001842;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=iiXqxkjROyX+xADlUTdAps8L/BLUFZEjruqK7ZJrj2I=;
 b=ABcbx101hThWVL5r1qxTtk6D6utNiWM6w7704zlBkM70rx8zpO7cr7ml
 9VuxFwTeLNneJwszRG+fpb5UH0CD6O950eEByoUKWu+hloMZEwnjsEKhX
 HSKIFIWgHrl4nP5glPPEri94+gMMnV8nN4WdYUWuvURHQGBnd26fOty59 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Mx9yagYIHUfkHCOHrz6wRWzH2n8cA1ZclaRvtdNBLbPNk8QOrDO4UuMP/WXQtPyBPDDoV5FdK4
 OkWuZGCRFnV1k036eUDgs0T3aF3egeapcFuQjOOIVTfhUrJwlnPK/tLMX9t+coYriv8r6vuiNC
 Pt4pry5Y8AB/18ylwDzX+2sgMXep1E0rAhNWn93lD8xjCQ94RSP9mKqyfjg7ovAh5b9HZ3vKEP
 KZx0ek0j4XCpM9De1FdjWayTfTp6+fq4g5gCNt3FS5pEJb7eBn+m8qb5h1YUbip0xI4DFqBOE2
 1Q4=
X-SBRS: 2.7
X-MesageID: 5861560
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,529,1559534400"; 
   d="scan'208";a="5861560"
To: Anthony PERARD <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20190920161902.1353598-1-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <134409f8-1342-9e87-6521-927c895a313e@citrix.com>
Date: Fri, 20 Sep 2019 18:50:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920161902.1353598-1-anthony.perard@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] tools/ocaml: Build fix following libxl API
 changes
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMDkvMjAxOSAxNzoxOSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gVGhlIGZvbGxvd2lu
ZyBsaWJ4bCBBUEkgYmVjYW1lIGFzeW5jaHJvbm91cyBhbmQgZ2FpbmVkIGFuIGFkZGl0aW9uYWwK
PiBgYW9faG93JyBwYXJhbWV0ZXI6Cj4gICAgIGxpYnhsX2RvbWFpbl9wYXVzZSgpCj4gICAgIGxp
YnhsX2RvbWFpbl91bnBhdXNlKCkKPiAgICAgbGlieGxfc2VuZF90cmlnZ2VyKCkKPgo+IEFkYXB0
IHRoZSBvY2FtbCBiaW5kaW5nLgo+Cj4gQnVpbGQgdGVzdGVkIG9ubHkuCj4KPiBGaXhlczogZWRh
YTYzMWRkY2VlNjY1Y2RmYWUxY2Y2YmM3NDkyYzc5MWUwMWVmNAo+IEZpeGVzOiA5NTYyN2I4N2Mz
MTU5OTI4NDU4ZWU1ODZlOGM1YzU5M2JkZDI0OGQ4Cj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpUaGlzIGxpYnJhcnkgaXMgZW50aXJl
bHkgdW51c2VkLCBmdWxsIG9mIG1lbW9yeSBsZWFrcywgYW5kIGhhcyBhIG51bWJlcgpvZiBhcmVh
cyBuZWVkaW5nIGV4dHJlbWVseSBjYXJlZnVsIGRlc2lnbiBkdWUgdG8gdGhlIGRpZmZlcmluZwpi
ZWhhdmlvdXJzIG9mIHRoZSBsaWJ4bCBhbmQgb2NhbWwgcnVudGltZXMuCgpBbm90aGVyIG9wdGlv
biB3b3VsZCBiZSB0byBkcm9wIHRoZSBiaW5kaW5ncyBlbnRpcmVseS4KCj4gLS0tCj4KPiBOb3Rl
czoKPiAgICAgQ3VycmVudGx5LCBhbGwgbGlieGwgQVBJIHRoYXQgdGFrZXMgYW4gYGFvX2hvd2Ag
aGF2ZSBgP2FzeW5jOidhIC0+IHVuaXRgCj4gICAgIGluIHRoZSBvY2FtbCBkZWZpbml0aW9uIChh
bmQgYW4gZXh0cmEgdW51c2VkIHZhbHVlIHVuaXQgaW4gdGhlIGMgc3R1Ygo+ICAgICBmaWxlKSwg
aXMgdGhhdCBgdW5pdGAgbmVlZGVkID8KPiAgICAgCj4gICAgIEkgdHJpZWQgdG8gYWRkIGl0LCBi
dXQgdGhlbiBmb3Igc3R1Yl94bF9zZW5kX3RyaWdnZXIoKSBJIGhhZCB0byB1c2UKPiAgICAgQ0FN
THBhcmFtNiwgYW5kIHRoYXQgZG9lc24ndCBleGlzdC4KCkluIHRoZSBPY2FtbCBGRkksIHdpdGgg
bW9yZSB0aGFuIDUgcGFyYW1ldGVycywgdGhlIGVudGlyZSBzZXQgb2YKcGFyYW1ldGVycyBpcyBz
cGlsbGVkIHRvIG1lbW9yeSBhcyBhbiBhcnJheSwgc28gdGhlIEMgc2lkZSBvZiB0aGUKZnVuY3Rp
b24gZW5kcyB3aXRoIGEgQ0FNTHBhcmFtMiAobGlzdCBwb2ludGVyIGFuZCBudW1iZXIgb2YgZW50
cmllcyksCmFuZCBoYXMgZXh0cmEgbWFyc2hhbGxpbmcgdG8gZG8uCgp+QW5kcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
