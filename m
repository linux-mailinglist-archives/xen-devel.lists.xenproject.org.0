Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA548AB6AD
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 13:09:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6C4c-00069y-6W; Fri, 06 Sep 2019 11:06:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtaX=XB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i6C4a-00069t-Fl
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 11:06:36 +0000
X-Inumbo-ID: 640830b6-d096-11e9-a337-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 640830b6-d096-11e9-a337-bc764e2007e4;
 Fri, 06 Sep 2019 11:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567767995;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3tvFc+sW/muKHjbd1ZvRsMVso3bM7XQztToBAeX/lMU=;
 b=PqiUWUR0FOkBrkZtzzR+UVQZ0duN5qzUSI/HxX1h9WlkF7fKjBbudN/w
 7ctzgf9lAV3j1MUfF894MUowPayXK0Lsyx7mK5f2HLX55inkoK7RSYWHQ
 RdQZhV7LbNH5r56EZwHIuyrnkODdhowcxwoiFqw9eRCdJpddyCKu0Cp0O s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GP3PK3B0pta8CmfSzLvvKVrT23Um9LqF7N9EC1p58ogofoO7bA5wT0AdZDxctFf+94h+ychKKy
 nDZC7n+I9xHffaCDEh69l/bQqGgRQzL3SfDLYu+Y2HwumTbF9rXY+P5WuD8B53IbJ7vUlHYSmv
 8+jhc0YsND3/Hq7muajt8X0C1bV2AAOhYYCbQw9ey4Xin4YMfFckegZIpjyQDt4MklV1sSO50r
 KnNn6k6Rf0RJh5tLfNXBmFY71uCfkBcdKXOJFbufM37wCKMl0Z0mo7aGh+zdxQahziOgQLXIzg
 Grg=
X-SBRS: 2.7
X-MesageID: 5459846
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,472,1559534400"; 
   d="scan'208";a="5459846"
Date: Fri, 6 Sep 2019 13:06:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190906110628.i43m4jccxjimu2sp@Air-de-Roger>
References: <20190905190418.15142-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190905190418.15142-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/boot: Don't explicitly map the VGA
 region as UC-
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMDg6MDQ6MThQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBBbGwgNjQtYml0IGNhcGFibGUgcHJvY2Vzc29ycyB1c2UgUEFULCBhbmQgd2l0aCBQ
QVQsIGl0IGlzIGV4cGxpY2l0bHkKPiBwZXJtaXR0ZWQgdG8gaGF2ZSBtYXBwaW5ncyB3aXRoIGEg
Y2FjaGVhYmlsaXR5IGRpZmZlcmVudCB0byBNVFJScy4KPiAKPiBPbiBhIG5hdGl2ZSBzeXN0ZW0g
d2l0aCBhIHJlYWwgbGVnYWN5IFZHQSByZWdpb24sIE1UUlJzIHdpbGwgY2F1c2UgdGhlIHJlZ2lv
bgo+IHRvIGJlIFVDLS4gIFdoZW4gYm9vdGluZyB2aXJ0dWFsaXNlZCwgdGhpcyByYW5nZSBtYXkg
YmUgUkFNIGFuZCBub3QgYSBsZWdhY3kKPiBWR0EgcmVnaW9uLCBhdCB3aGljaCBwb2ludCBpdCB3
YW50cyB0byBiZSBXQi4KPiAKPiBVc2UgV0IgbWFwcGluZyBpbiB0aGUgcGFnZXRhYmxlcywgc3Vj
aCB0aGF0IGluIHN5c3RlbXMgd2l0aG91dCBhIGxlZ2FjeSBWR0EKPiByZWdpb24sIHRoZSBSQU0g
YmV0d2VlbiAweGEwMDAwIGFuZCAweGMwMDAwIGRvZXNuJ3QgYmVjb21lIHVubmVjZXNzZXJpbHkg
VUMtLgo+IEhvd2V2ZXIsIHdlIHN0aWxsIG11c3QgdXNlIHNtYWxsIHBhZ2VzIHRvIGF2b2lkIHRo
ZSB1bmRlZmluZWQgYmVoYXZpb3VyIGNhdXNlZAo+IGJ5IHN1cGVycGFnZXMgY3Jvc3NpbmcgTVRS
UnMgb2YgZGlmZmVyZW50IGNhY2hlYWJpbGl0eS4KPiAKPiBXaGlsZSBhZGp1c3RpbmcgdGhlIHBh
Z2V0YWJsZSBjb25zdHJ1Y3Rpb24sIHN3aXRjaCBmcm9tIHBmbiB0byBpZHggZm9yCj4gY29uc2lz
dGVuY3kgd2l0aCBhbGwgdGhlIG90aGVyIGNvbnN0cnVjdGlvbiBsb2dpYy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3
ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKPiAtLS0KPiBD
QzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+IENDOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBB
cyBhIGZ1dHVyZSBvcHRpbWlzYXRpb24sIFhlbiBjb3VsZCByZXdyaXRlIGwyX2lkZW50bWFwIHdp
dGggYSBzdXBlcnBhZ2UgaWYgaXQKPiBmaW5kcyB0aGF0IE1UUlJzIGFyZSBkaXNhYmxlZC4gIEhv
d2V2ZXIsIHRoaXMgcHJvYmFibHkgbmVlZHMgdG8gd2FpdCB1bnRpbCBYZW4KPiBubyBsb25nZXIg
dW5jb25kaXRpb25hbGx5IGFzc3VtZXMgYSBsZWdhY3kgVkdBIHJlZ2lvbiB0byBiZSBwcmVzZW50
IGluIHRoZQo+IGU4MjAgaWYgaXQgZmluZHMgc29tZXRoaW5nIG90aGVyIHRoYW4gYSBob2xlCgpJ
cyB0aGF0IHN0aWxsIHRoZSBjYXNlPyBJIHJlbWVtYmVyIGRlYWxpbmcgd2l0aCBpdCB3aGVuIHdv
cmtpbmcgb24gdGhlCnNoaW0sIGFuZCBJIHRob3VnaHQgdGhlIGNvZGUgdG8gdW5jb25kaXRpb25h
bGx5IHNldCBhIGhvbGUgaW4KMHhhMDAwMC0weGMwMDAwIHdhcyByZW1vdmVkLgoKUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
