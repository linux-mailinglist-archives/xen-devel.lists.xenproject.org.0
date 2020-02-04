Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2840F1517D9
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 10:29:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyuTn-0000D2-JF; Tue, 04 Feb 2020 09:26:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uGhi=3Y=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iyuTm-0000Cx-0R
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 09:26:46 +0000
X-Inumbo-ID: 753bc6b6-4730-11ea-8ef8-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 753bc6b6-4730-11ea-8ef8-12813bfff9fa;
 Tue, 04 Feb 2020 09:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580808404;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=23YdGHzcJz1PsIc24EXa2euU7KMPJbw0+N9s7scXx1A=;
 b=dD/YBTQkl4YLw3UsHU0XJelX0rGECaiIW2KwOoan80s6D91rv5CL0nb7
 K1RU5aQnCwVOIkt5lZyJmi019+lHYknkeCT3COOwf3V96zVpsYhFPXiHN
 wyFnFV0d8QML8ZVp5OlgE/KK9Cvzj3dbW/Sa2Ril+mV3zAVRGfu3Cc9fe I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +8RZtYW6ys2hi0QY3rrV8EWKn80e/bMga6DBrvfQVgn3zPy1F2FBrhKf8IwcSPMsImfpWqoTOM
 cPMyGN7+WjK54NFzMVBFZcqjMbruCeAf3S2p+CsiQg+CDXMPMWXmIWtOfK75ibM3DvQ5zjjQ5D
 k8fcVygFkrNXD8mLZmNKIpiv7qx0tLpdvNEcXhNe5OzH+/Vu/VaD5QDt53n4Ai+JhnB0/n9Bg5
 51ieUJOHywEeSd+JWUHbDq9ZEDMmZpcm8GI74B0TiB5i+b+1T4s/Lx7Pv4TpfkLatipMVJWUVq
 BrQ=
X-SBRS: 2.7
X-MesageID: 11899569
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,401,1574139600"; d="scan'208";a="11899569"
Date: Tue, 4 Feb 2020 10:26:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20200204092634.GF4679@Air-de-Roger>
References: <20200203121919.15748-1-roger.pau@citrix.com>
 <20200203121919.15748-3-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D765915@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D765915@SHSMSX104.ccr.corp.intel.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 2/4] x86/vvmx: fix
 VM_EXIT_ACK_INTR_ON_EXIT handling
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
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDE6Mzk6NDRBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4g
U2VudDogTW9uZGF5LCBGZWJydWFyeSAzLCAyMDIwIDg6MTkgUE0KPiA+IAo+ID4gV2hlbiBWTV9F
WElUX0FDS19JTlRSX09OX0VYSVQgaXMgc2V0IGluIHRoZSB2bWV4aXQgY29udHJvbCB2bWNzCj4g
Cj4gc2V0LT5jbGVhcmVkCj4gCj4gPiByZWdpc3RlciB0aGUgYml0IDMxIG9mIFZNX0VYSVRfSU5U
Ul9JTkZPIG11c3QgYmUgMCwgaW4gb3JkZXIgdG8gZGVub3RlCj4gPiB0aGF0IHRoZSBmaWVsZCBk
b2Vzbid0IGNvbnRhaW4gYW55IGludGVycnVwdCBpbmZvcm1hdGlvbi4gVGhpcyBpcyBub3QKPiA+
IGN1cnJlbnRseSBhY2tub3dsZWRnZWQgYXMgdGhlIGZpZWxkIGFsd2F5cyBnZXQgZmlsbGVkIHdp
dGggdmFsaWQKPiA+IGludGVycnVwdCBpbmZvcm1hdGlvbiwgcmVnYXJkbGVzcyBvZiB3aGV0aGVy
IFZNX0VYSVRfQUNLX0lOVFJfT05fRVhJVAo+ID4gaXMgc2V0Lgo+ID4gCj4gPiBGaXggdGhpcyBh
bmQgb25seSBmaWxsIFZNX0VYSVRfSU5UUl9JTkZPIHdoZW4gVk1fRVhJVF9BQ0tfSU5UUl9PTl9F
WElUCj4gPiBpcyBub3Qgc2V0LiBOb3RlIHRoYXQgdGhpcyByZXF1aXJlcyBvbmUgbWlub3IgY2hh
bmdlIGluCj4gCj4gbm90IHNldCAtPiBzZXQKPiAKPiA+IG52bXhfdXBkYXRlX2FwaWN2IGluIG9y
ZGVyIHRvIG9idGFpbiB0aGUgaW50ZXJydXB0IGluZm9ybWF0aW9uIGZyb20KPiA+IHRoZSBpbnRl
cm5hbCBzdGF0ZSByYXRoZXIgdGhhbiB0aGUgbmVzdGVkIHZtY3MgcmVnaXN0ZXIuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+
IAo+IHdpdGggYWJvdmUgZml4ZWQsIAoKT3VjaCB5ZXMsIEkndmUgaW52ZXJ0ZWQgdGhlIGNvbmRp
dGlvbnMuIFRoYW5rcyBmb3Igbm90aWNpbmcuCgo+IAo+IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFu
IDxrZXZpbi50aWFuQGludGVsLmNvbT4KClRvIHdob2V2ZXIgcGlja3MgdGhpcyBwYXRjaCBmb3Ig
Y29tbWl0dGluZzogbGV0IG1lIGtub3cgaWYgeW91IHdvdWxkCmxpa2UgbWUgdG8gcmVzZW5kIHdp
dGggdGhlIGNvbW1pdCBsb2cgZml4ZWQuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
