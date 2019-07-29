Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87454787D2
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 10:56:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs1P5-0007C6-KG; Mon, 29 Jul 2019 08:53:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vOtp=V2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hs1P4-0007C1-7J
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 08:53:10 +0000
X-Inumbo-ID: 47d49636-b1de-11e9-b025-6b9e3b890ee2
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47d49636-b1de-11e9-b025-6b9e3b890ee2;
 Mon, 29 Jul 2019 08:53:06 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aumOAvmYRes36jkKK1CC8ykitccC2A3GkMLMJf7bDGMEOr21mExoDIDxIcY93U3nUzy8QgECTD
 +ZNKk9YWUvBn691YgagD/zUa8Oskg9tAA4NvfG3+5ErTs+Jj8gymydzZtUh9flHVHwMMzcWsCL
 uTq/hKWClhiS/sxXZXbRt7h6IHpRrgLhsIFSk7eWjU2zROBQKzxzaQyCsQ3BIDSay/ltsT2Kco
 RnEAGB4qkS9onyxOdn+ls302rmkIeUXCQVtA4UUAswoPWfL3nFO6WmVfxX9z+myKtY4wl5+FcI
 erg=
X-SBRS: 2.7
X-MesageID: 3557378
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,322,1559534400"; 
   d="scan'208";a="3557378"
Date: Mon, 29 Jul 2019 10:52:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190729085233.x3lees5rcycj7xko@Air-de-Roger>
References: <20190726203222.4833-1-andrew.cooper3@citrix.com>
 <20190726203222.4833-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726203222.4833-2-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen/link: Introduce
 .bss.percpu.page_aligned
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDk6MzI6MjFQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBGdXR1cmUgY2hhbmdlcyBhcmUgZ29pbmcgdG8gbmVlZCB0byBwYWdlIGFsaWduIHNv
bWUgcGVyY3B1IGRhdGEuCj4gCj4gVGhpcyBtZWFucyB0aGF0IHRoZSBwZXJjcHUgYXJlYSBuZWVk
cyBzdWl0YWJseSBhbGlnbmluZyBpbiB0aGUgQlNTIHNvIENQVTAgaGFzCj4gY29ycmVjdGx5IGFs
aWduZWQgZGF0YS4gIFNodWZmbGUgdGhlIGV4YWN0IGxpbmsgb3JkZXIgb2YgaXRlbXMgd2l0aGlu
IHRoZSBCU1MKPiB0byBnaXZlIC5ic3MucGVyY3B1LnBhZ2VfYWxpZ25lZCBhcHByb3ByaWF0ZSBh
bGlnbm1lbnQuCj4gCj4gSW4gYWRkaXRpb24sIHdlIG5lZWQgdG8gYmUgYWJsZSB0byBzcGVjaWZ5
IGFuIGFsaWdubWVudCBhdHRyaWJ1dGUgdG8KPiBfX0RFRklORV9QRVJfQ1BVKCkuICBSZXdvcmsg
aXQgc28gdGhlIGNhbGxlciBwYXNzZXMgaW4gYWxsIGF0dHJpYnV0ZXMsIGFuZAo+IGFkanVzdCBE
RUZJTkVfUEVSX0NQVXssX1JFQURfTU9TVExZfSgpIHRvIG1hdGNoLiAgVGhpcyBoYXMgdGhlIGFk
ZGVkIGJvbnVzCj4gdGhhdCBpdCBpcyBub3cgcG9zc2libGUgdG8gZ3JlcCBmb3IgLmJzcy5wZXJj
cHUgYW5kIGZpbmQgYWxsIHRoZSB1c2Vycy4KPiAKPiBGaW5hbGx5LCBpbnRyb2R1Y2UgREVGSU5F
X1BFUl9DUFVfUEFHRV9BTElHTkVEKCkgd2hpY2ggdXNlcyBib3RoIHNlY3Rpb24gYW5kCj4gYWxp
Z25tZW50IGF0dHJpYnV0ZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
cGVyY3B1LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3BlcmNwdS5oCj4gaW5kZXggZmYzNGRjNzg5
Ny4uNWI2Y2VmMDRjNCAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3BlcmNwdS5o
Cj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wZXJjcHUuaAo+IEBAIC03LDEwICs3LDggQEAg
ZXh0ZXJuIHVuc2lnbmVkIGxvbmcgX19wZXJfY3B1X29mZnNldFtOUl9DUFVTXTsKPiAgdm9pZCBw
ZXJjcHVfaW5pdF9hcmVhcyh2b2lkKTsKPiAgI2VuZGlmCj4gIAo+IC0vKiBTZXBhcmF0ZSBvdXQg
dGhlIHR5cGUsIHNvIChpbnRbM10sIGZvbykgd29ya3MuICovCj4gLSNkZWZpbmUgX19ERUZJTkVf
UEVSX0NQVSh0eXBlLCBuYW1lLCBzdWZmaXgpICAgICAgICAgICAgICAgICAgICBcCj4gLSAgICBf
X3NlY3Rpb24oIi5ic3MucGVyY3B1IiAjc3VmZml4KSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gLSAgICBfX3R5cGVvZl9fKHR5cGUpIHBlcl9jcHVfIyNuYW1lCj4gKyNkZWZpbmUgX19E
RUZJTkVfUEVSX0NQVShhdHRyLCB0eXBlLCBuYW1lKSBcCj4gKyAgICBhdHRyIF9fdHlwZW9mX18o
dHlwZSkgcGVyX2NwdV8gIyMgbmFtZQo+ICAKPiAgLyogdmFyIGlzIGluIGRpc2NhcmRlZCByZWdp
b246IG9mZnNldCB0byBwYXJ0aWN1bGFyIGNvcHkgd2Ugd2FudCAqLwo+ICAjZGVmaW5lIHBlcl9j
cHUodmFyLCBjcHUpICBcCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9wZXJjcHUuaCBi
L3hlbi9pbmNsdWRlL3hlbi9wZXJjcHUuaAo+IGluZGV4IGFlZWM1YzE5ZDYuLjcxYTMxY2MzNjEg
MTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3BlcmNwdS5oCj4gKysrIGIveGVuL2luY2x1
ZGUveGVuL3BlcmNwdS5oCj4gQEAgLTksOSArOSwxNSBAQAo+ICAgKiBUaGUgXyMjbmFtZSBjb25j
YXRlbmF0aW9uIGlzIGJlaW5nIHVzZWQgaGVyZSB0byBwcmV2ZW50ICduYW1lJyBmcm9tIGdldHRp
bmcKPiAgICogbWFjcm8gZXhwYW5kZWQsIHdoaWxlIHN0aWxsIGFsbG93aW5nIGEgcGVyLWFyY2hp
dGVjdHVyZSBzeW1ib2wgbmFtZSBwcmVmaXguCj4gICAqLwo+IC0jZGVmaW5lIERFRklORV9QRVJf
Q1BVKHR5cGUsIG5hbWUpIF9fREVGSU5FX1BFUl9DUFUodHlwZSwgXyMjbmFtZSwgKQo+ICsjZGVm
aW5lIERFRklORV9QRVJfQ1BVKHR5cGUsIG5hbWUpIFwKPiArICAgIF9fREVGSU5FX1BFUl9DUFUo
X19zZWN0aW9uKCIuYnNzLnBlcmNwdSIpLCB0eXBlLCBfICMjIG5hbWUpCj4gKwo+ICsjZGVmaW5l
IERFRklORV9QRVJfQ1BVX1BBR0VfQUxJR05FRCh0eXBlLCBuYW1lKSBcCj4gKyAgICBfX0RFRklO
RV9QRVJfQ1BVKF9fc2VjdGlvbigiLmJzcy5wZXJjcHUucGFnZV9hbGlnbmVkIikgXAo+ICsgICAg
ICAgICAgICAgICAgICAgICBfX2FsaWduZWQoUEFHRV9TSVpFKSwgdHlwZSwgXyAjIyBuYW1lKQo+
ICsKPiAgI2RlZmluZSBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh0eXBlLCBuYW1lKSBcCj4g
LQlfX0RFRklORV9QRVJfQ1BVKHR5cGUsIF8jI25hbWUsIC5yZWFkX21vc3RseSkKPiArICAgIF9f
REVGSU5FX1BFUl9DUFUoX19zZWN0aW9uKCIuYnNzLnBlcmNwdS5yZWFkX21vc3RseSIpLCB0eXBl
LCBfICMjIG5hbWUpCgpBRkFJQ1QgYWxzbyBhZGRpbmcgYSAnXycgaGVyZSB3aWxsIHJlc3VsdCBp
biB2YXJpYWJsZSBuYW1lcyB3aXRoCnBlcl9jcHVfX2Zvbywgd2hpY2ggaXMgaW5saW5lIHdpdGgg
dGhlIHByZXZpb3VzIGJlaGF2aW91ciwgYnV0IEknbSBub3QKc3VyZSBvZiB0aGUgcG9pbnQgb2Yg
dGhlIGRvdWJsZSB1bmRlcnNjb3JlLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
