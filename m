Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A13CB916
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 13:28:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGLi7-0005Bd-CL; Fri, 04 Oct 2019 11:25:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=obQ/=X5=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iGLi6-0005BY-7o
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 11:25:22 +0000
X-Inumbo-ID: a5da1a56-e699-11e9-974b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5da1a56-e699-11e9-974b-12813bfff9fa;
 Fri, 04 Oct 2019 11:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570188321;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=0g+pcHnXCfK+eIut/j0/l+XAKNa3h11EmHamAX41PNg=;
 b=WTwIr56Cwzd5Qx0nadLsUj3eDG7hTR87s9ifaUHH0awfZiMYbAW2pDJR
 uGyIh2NqjJx58wZPzXT1Ppnl7tow5seRxkCcmXB7zW1Tdvje8WHSPjFK+
 BLvlhQi9aDIAKg52qVi82lL5AaGu8aAm2qbspV41qemE5AzqFrXpdcjkv k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 43yXnoQ/pM6dMnodVzX2VDIOrxbAklOCKj6gyexv2N1J6XXBsFWdZVeyiRNO46YSUp2mqByVxA
 +yLsRvm3h8I6qMkStJ0SSrqKb8xXslnXwZ1Y5PuPdXe6BF3Vq6mNBpqtvzTE+JK7bepfTPDebY
 w2tSsoqxB5ye5F2Cixq8aPuajVkH2rXqfiImUO1ns0/ZfYFMCOh8V/M5hxsXOHq7MFMa5ndx6u
 IMOAHqRk2IlgqKRtOWS5b4bmGICGKCbNMfoXxCJwsLFdhtR5i2iuSy9rKGiBbmXxzniiQ72nqo
 rh8=
X-SBRS: 2.7
X-MesageID: 6470256
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6470256"
To: Jan Beulich <jbeulich@suse.com>
References: <1570110555-24287-1-git-send-email-igor.druzhinin@citrix.com>
 <1570110555-24287-2-git-send-email-igor.druzhinin@citrix.com>
 <dde9c6fd-8043-cbc5-ab06-d6e238ad0e38@suse.com>
 <a19291d4-1eb0-e479-f9a7-bd442a1649dc@citrix.com>
 <ebd2f8e6-42ed-d1b6-8a2d-e7f07848d5b1@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <d810a9eb-2736-787a-652d-b2417876eac9@citrix.com>
Date: Fri, 4 Oct 2019 12:25:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ebd2f8e6-42ed-d1b6-8a2d-e7f07848d5b1@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] efi/boot: fix set_color function
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMTAvMjAxOSAxMjoxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDQuMTAuMjAxOSAx
Mjo1NCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IE9uIDA0LzEwLzIwMTkgMTE6MzQsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4gT24gMDMuMTAuMjAxOSAxNTo0OSwgSWdvciBEcnV6aGluaW4gd3Jv
dGU6Cj4+Pj4gLSAwIGlzIGEgcG9zc2libGUgYW5kIGFsbG93ZWQgdmFsdWUgZm9yIGEgY29sb3Ig
bWFzayBhY2Nyb2RpbmcgdG8KPj4+PiAgIFVFRkkgU3BlYyAyLjYgKDExLjkpIGVzcGVjaWFsbHkg
Zm9yIHJlc2VydmVkIG1hc2sKPj4+Cj4+PiBIbW0sIGxvb2tpbmcgYXQgMi44ICh3aGVyZSBpdCdz
IHNlY3Rpb24gMTIuOSwgd2hpY2ggaW4gdHVybiBpcyB3aHkKPj4+IHNlY3Rpb24gdGl0bGVzIHdv
dWxkIGJlIG1vcmUgaGVscGZ1bCBpbiBzdWNoIHJlZmVyZW5jZXMpIEkgY2FuJ3QKPj4+IHNlZSB0
aGUgY2FzZSBiZWluZyBtZW50aW9uZWQgZXhwbGljaXRseS4gSSBjYW4gYWNjZXB0IHRoYXQKPj4+
IFJlc2VydmVkTWFzayBtaWdodCBiZSB6ZXJvLCBidXQgdGhlbiBJJ2QgcHJlZmVyIHRvIGhhbmRs
ZSB0aGF0Cj4+PiBjYXNlIGluIHRoZSBjYWxsZXIsIHJhdGhlciB0aGFuIGFsbG93aW5nIHplcm8g
YWxzbyBmb3IgdGhlIHRocmVlCj4+PiBjb2xvcnMuCj4+Cj4+ICJJZiBhIGJpdCBpcyBzZXQgaW4g
UmVkTWFzaywgR3JlZW5NYXNrLCBvciBCbHVlTWFzayB0aGVuIHRob3NlIGJpdHMgb2YKPj4gdGhl
IHBpeGVsIHJlcHJlc2VudCB0aGUgY29ycmVzcG9uZGluZyBjb2xvci4iIC0gIklmIGEgYml0IGlz
IHNldC4uLiIKPj4gaW1wbGllcyBpdCBtaWdodCBub3QgYmUgc2V0Lgo+IAo+IFRoaXMgdGFsa3Mg
YWJvdXQgdGhlIGZ1bmN0aW9uIG9mIGluZGl2aWR1YWwgYml0cy4gVGhlcmUncyBub3RoaW5nIHNh
aWQKPiBhYm91dCBub3QgYml0IGF0IGFsbCBiZWluZyBzZXQgZm9yIGEgcGFydGljdWxhciBjb2xv
ci4KPiAKCkkga25vdyBjZXJ0YWlubHkgdGhhdCBpdCdzIG5vdCBvbmx5IG1lIHdobyByZWFkcyB0
aGlzIHNlbnRlbmNlIHRoZSBzYW1lCndheSAtIGZpcm13YXJlIGRldmVsb3BlcnMgYXMgd2VsbC4g
QnV0IGlmIHlvdSBpbnNpc3QgSSB3aWxsIHJlc3RyaWN0CnRoaXMgY2hhbmdlIHRvIHJlc2VydmVk
IG1hc2sgb25seS4KCklnb3IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
