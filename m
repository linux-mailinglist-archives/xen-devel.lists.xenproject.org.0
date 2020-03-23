Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D196A18F794
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 15:51:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGONm-0007Sa-SY; Mon, 23 Mar 2020 14:48:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jqku=5I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jGONl-0007SV-3F
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 14:48:49 +0000
X-Inumbo-ID: 66ed2d06-6d15-11ea-bec1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66ed2d06-6d15-11ea-bec1-bc764e2007e4;
 Mon, 23 Mar 2020 14:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584974929;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GUWsQXF5Kde8EPq63JG80f2GuqxeTC2rFu2+6TAlEas=;
 b=ND6ReCqgpy6VYuaSwQajqSZ+/BBpD4yMQ3miR9LW4uj/hWfp7RpgtznK
 Y5x/44z1CtCIh38oQDwcvIvRH8ZCKFt4pchZtyE6fUTQ8ErYpAq45nf/N
 XU6XHCeHSi9X1jyGhV7+HAmEVypXVnFneFoPrb0LaiutdovT2goJ/PU0S g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6uoR5TVwjpJH7BV1zP80Eo1T4Tbky4v4i7ecjRQuiBSBsr3e2YNlFbKjgVB/E3U7kSzVRtn/E3
 BBHpgR7X7HcYHJaxJN2PGwkrrxyo24j9AV1D3YRKHdMVkjbP/h04fm6fHt3sS2QBDh1AN82U2/
 M2/5xS6dqvRwkzIh+KvXFboR89uBY3YlTYWpx8dqMrnRbRuCP+B1RdoJFmBQ7UKE2joktjxYhm
 qpfe7ugiRR88FjZs78gwKUrGwO8fskVV4CiGHR3RXwcLrawvaH/f1LOcJ0JJ+B+k6T/igGoJEc
 vBU=
X-SBRS: 2.7
X-MesageID: 14473133
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,296,1580792400"; d="scan'208";a="14473133"
Date: Mon, 23 Mar 2020 15:48:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200323144837.GB24458@Air-de-Roger.citrite.net>
References: <20200320190737.42110-1-roger.pau@citrix.com>
 <20200320190737.42110-2-roger.pau@citrix.com>
 <a1eacbaf-1fb0-94c9-d1e6-716fd1fd38ad@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a1eacbaf-1fb0-94c9-d1e6-716fd1fd38ad@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/3] Revert "x86/vvmx: fix virtual interrupt
 injection when Ack on exit control is used"
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXIgMjMsIDIwMjAgYXQgMDk6MDk6NTlBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjAuMDMuMjAyMCAyMDowNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gVGhp
cyByZXZlcnRzIGNvbW1pdCBmOTZlMTQ2OWFkMDZiNjE3OTZjNjAxOTNkYWFlYjlmOGE5NmQ3NDU4
Lgo+ID4gCj4gPiBUaGUgY29tbWl0IGlzIHdyb25nLCBhcyB0aGUgd2hvbGUgcG9pbnQgb2YgbnZt
eF91cGRhdGVfYXBpY3YgaXMgdG8KPiA+IHVwZGF0ZSB0aGUgZ3Vlc3QgaW50ZXJydXB0IHN0YXR1
cyBmaWVsZCB3aGVuIHRoZSBBY2sgb24gZXhpdCBWTUVYSVQKPiA+IGNvbnRyb2wgZmVhdHVyZSBp
cyBlbmFibGVkLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KPiAKPiBCZWZvcmUgYW55b25lIGdldHMgdG8gbG9vayBhdCB0aGUg
b3RoZXIgdHdvIHBhdGNoZXMsIHNob3VsZCB0aGlzCj4gYmUgdGhyb3duIGluIHJpZ2h0IGF3YXk/
CgpJIHdvdWxkIGxpa2UgaWYgcG9zc2libGUgZ2V0IGEgY29uZmlybWF0aW9uIGZyb20gS2V2aW4g
KG9yIGFueW9uZQplbHNlKSB0aGF0IG15IHVuZGVyc3RhbmRpbmcgaXMgY29ycmVjdC4gSSBmaW5k
IHRoZSBuZXN0ZWQgY29kZSB2ZXJ5CmNvbmZ1c2luZywgYW5kIEkndmUgYWxyZWFkeSBtYWRlIGEg
bWlzdGFrZSB3aGlsZSB0cnlpbmcgdG8gZml4IGl0LgpUaGF0IGJlaW5nIHNhaWQsIHRoaXMgd2Fz
IHNwb3R0ZWQgYnkgb3NzdGVzdCBhcyBpbnRyb2R1Y2luZyBhCnJlZ3Jlc3Npb24sIHNvIEkgZ3Vl
c3MgaXQncyBzYWZlIHRvIGp1c3QgdG9zcyBpdCBpbiBub3cuCgpGV0lXIHBhdGNoIDIvMyBhdHRl
bXB0cyB0byBwcm92aWRlIGEgZGVzY3JpcHRpb24gb2YgbXkgdW5kZXJzdGFuZGluZwpvZiBob3cg
bnZteF91cGRhdGVfYXBpY3Ygd29ya3MuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
