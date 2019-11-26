Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFD110A038
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 15:26:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZblM-0000gK-DF; Tue, 26 Nov 2019 14:24:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=92JX=ZS=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iZblL-0000gF-4i
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 14:24:19 +0000
X-Inumbo-ID: 6e312b36-1058-11ea-83b8-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e312b36-1058-11ea-83b8-bc764e2007e4;
 Tue, 26 Nov 2019 14:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574778259;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=u85wec7jSAmmP+N0T6zrRSNYubFWY+kxONDulwVZHcU=;
 b=DgM6HHI7R6pIwyKRIov7pTwjuIpTnF3vpB+4K/DJdjnTWFrZjwdYgWB+
 OKvJkDRy/B3wdZjBl0Cy+KDXMtppV203rsZOOPeDmQ2U6f7TeemuwP1h2
 nxhRciy1ls14JTNo4/yKRJFrvXWwogMZWv6cXv+PQ/XTSTS/xGsS8Acuj 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EHC5pKonO+AVf1hbHhFqEvMLd4fB0DxjWkf4qCAhCF4puUMb4HazSb9/3jsMPgLR4zZBQQd3uo
 riiJRlJnnurr//jAOWoKcQsBgNv4VSBSsuNLXnCv0GO6Xs4/Pty/nMR+QsowL8zYWah2k266D6
 uo6YzGLtR0hwVX4njbOkhaZYeU/DbCy0P3LF2Ijghx7F6yUQwcaLNBDGSCJFA7/JTyxG88+IR4
 L2z3rlkXyBkxsZDaxDdczgNoDtBJBpkbvw4+HRrwk3xWbsz18uNHBBXPobZZn2xubkROM06QLr
 2Tc=
X-SBRS: 2.7
X-MesageID: 8845668
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="8845668"
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <1574715937-13565-1-git-send-email-igor.druzhinin@citrix.com>
 <abdc01eb-de2a-c7ff-3803-e7dfd6c022d4@suse.com>
 <77017c06-c383-e511-c0dc-9b49944ae967@citrix.com>
 <1cb5b4cb-b7a4-14a1-ea11-fbc4b5075f64@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <4991a843-1551-57d2-81ab-fa399d82df00@citrix.com>
Date: Tue, 26 Nov 2019 14:24:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1cb5b4cb-b7a4-14a1-ea11-fbc4b5075f64@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] AMD/IOMMU: honour IR setting while
 pre-filling DTEs
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

T24gMjYvMTEvMjAxOSAxNDoxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjYuMTEuMjAxOSAx
MzoyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjYvMTEvMjAxOSAwODo0MiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyNS4xMS4yMDE5IDIyOjA1LCBJZ29yIERydXpoaW5pbiB3cm90
ZToKPj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCj4+
Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwo+Pj4+IEBA
IC0xMjc5LDcgKzEyNzksNyBAQCBzdGF0aWMgaW50IF9faW5pdCBhbWRfaW9tbXVfc2V0dXBfZGV2
aWNlX3RhYmxlKAo+Pj4+ICAgICAgICAgIGZvciAoIGJkZiA9IDAsIHNpemUgLz0gc2l6ZW9mKCpk
dCk7IGJkZiA8IHNpemU7ICsrYmRmICkKPj4+PiAgICAgICAgICAgICAgZHRbYmRmXSA9IChzdHJ1
Y3QgYW1kX2lvbW11X2R0ZSl7Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgLnYgPSB0
cnVlLAo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIC5pdiA9IHRydWUsCj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgLml2ID0gaW9tbXVfaW50cmVtYXAsCj4+PiBUaGlzIHdh
cyB2ZXJ5IGludGVudGlvbmFsbHkgInRydWUiLCBhbmQgaWdub3JpbmcgImlvbW11X2ludHJlbWFw
IjoKPj4KPj4gRGVsaWJlcmF0ZSBvciBub3QsIGl0IGlzIGEgcmVncmVzc2lvbiBmcm9tIDQuMTIu
Cj4gCj4gSSBhY2NlcHQgaXQncyBhIHJlZ3Jlc3Npb24gKHdoaWNoIHdhbnRzIGZpeGluZyksIGJ1
dCBJIGRvbid0IHRoaW5rCj4gdGhpcyBpcyB0aGUgd2F5IHRvIGFkZHJlc3MgaXMuIEkgY291bGQg
YmUgY29udmluY2VkIGJ5IGdvb2QKPiBhcmd1bWVudHMsIHRob3VnaC4KCkRvIHlvdSBoYXZlIGFu
eSBzdWdnZXN0aW9ucyBob3cgdG8gYWRkcmVzcyB0aGF0PwoKPj4gQm9vdGluZyB3aXRoIGlvbW11
PW5vLWludHJlbWFwIGlzIGEgY29tbW9uIGRlYnVnZ2luZyB0ZWNobmlxdWUsIGFuZCB0aGF0Cj4+
IG1lYW5zIG5vIGludGVycnVwdCByZW1hcHBpbmcgYW55d2hlcmUgaW4gdGhlIHN5c3RlbSwgZXZl
biBmb3IKPj4gc3VwcG9zZWRseS11bnVzZWQgRFRFcy4KPiAKPiBXaGV0aGVyIElWPTEgb3IgSVY9
MCwgdGhlcmUncyBubyBpbnRlcnJ1cHQgX3JlbWFwcGluZ18gd2l0aCB0aGlzCj4gb3B0aW9uIHNw
ZWNpZmllZC4gVGhlcmUncyBzb21lIGludGVycnVwdCBfYmxvY2tpbmdfLCB5ZXMuIEl0J3MKPiBu
b3QgaW1tZWRpYXRlbHkgY2xlYXIgdG8gbWUgd2hldGhlciB0aGlzIGlzIGEgZ29vZCBvciBhIGJh
ZCB0aGluZy4KCkZyb20gdXNlciBwb2ludCBvZiB2aWV3LCBpZiBJIHN1cHBseSAiaW9tbXU9bm8t
aW50cmVtYXAiIEknbSBub3QKZXhwZWN0aW5nIGFueSBpbnRlcnJ1cHRzIGluIHRoZSBzeXN0ZW0g
dG8gYmUgYmxvY2tlZCBlaXRoZXIuIEFuZAphcyBBbmRyZXcgc2FpZCB3ZSBmcmVxdWVudGx5IHVz
ZSB0aGlzIG9wdGlvbiBmb3IgZGVidWdnaW5nIHdoaWNoCm1lYW5zIHdlIGV4cGVjdCB0aGlzIGZ1
bmN0aW9uYWxpdHkgdG8gYmUgb2ZmIGNvbXBsZXRlbHkuCgpJZ29yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
