Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CA110FFD1
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 15:15:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic8te-0006Cw-A0; Tue, 03 Dec 2019 14:11:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nD+/=ZZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ic8tc-0006Cr-N4
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 14:11:20 +0000
X-Inumbo-ID: c7018890-15d6-11ea-a55d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7018890-15d6-11ea-a55d-bc764e2007e4;
 Tue, 03 Dec 2019 14:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575382279;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=DHLGdhKjBgZGRYVGDhT0qvJTo/lHI9UVlmYwmKGywPY=;
 b=a7s8q2OUoRZsZqr0PrgGmQBqkcb1XaxCaxIzmThC6DboEKi5eI0vkm44
 x7Eyc27nz1fRFtvdy2i+fxLgLEuhOlcPU7P15KtV6RbFA88bSK9XWPHR3
 Hc/Ln4nByewE7T9c8/VyMSqNYE03MUmLYzCgOjs7VHVTU2QGAKCqCS3YL c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OekjGh5fAua0JkM4Vz9g7Ju/i9tbQSvrQbjSlDX+U7Fk9jNRD1dQXRy9+WVF9VcRf7lh2Hpgj6
 nKH19Sb14Z/TOzw5kijmDj5OXLU1VV3BJ7rG4Dho7VwCrbrCvZIZ1jKY66LIQ3WjCY8bSuU6MS
 Y+JVxeMisawrGUAxaLoit8ayv+CN7PkS2U7E5maoLGgwvUrT68mQ2j/uZzvcV2T7CXoyNN72EB
 M7uzwS4bUNX7J6EyiuDrP9IClU1G6K7HG9aX8ORth1HSOcm3/Gz1IaLGEPY+FY65G/umlFwJtV
 P2E=
X-SBRS: 2.7
X-MesageID: 9671200
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,273,1571716800"; 
   d="scan'208";a="9671200"
To: Jan Beulich <jbeulich@suse.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1575057677-13839-1-git-send-email-igor.druzhinin@citrix.com>
 <47063d30-dd6a-2528-21f3-0bc7e7951b34@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <9fde1d45-d0fb-19f3-fa0c-609bf83e2347@citrix.com>
Date: Tue, 3 Dec 2019 14:11:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <47063d30-dd6a-2528-21f3-0bc7e7951b34@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/AMD: unbreak CPU hotplug on
 AMD systems without RstrFpErrPtrs
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMTIvMjAxOSAxMDowOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjkuMTEuMjAxOSAy
MTowMSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvY29t
bW9uLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYwo+PiBAQCAtNTQsNyArNTQs
NyBAQCBzdGF0aWMgdW5zaWduZWQgaW50IGZvcmNlZF9jYXBzW05DQVBJTlRTXTsKPj4gIAo+PiAg
REVGSU5FX1BFUl9DUFUoYm9vbCwgZnVsbF9nZHRfbG9hZGVkKTsKPj4gIAo+PiAtdm9pZCBfX2lu
aXQgc2V0dXBfY2xlYXJfY3B1X2NhcCh1bnNpZ25lZCBpbnQgY2FwKQo+PiArdm9pZCBzZXR1cF9j
bGVhcl9jcHVfY2FwKHVuc2lnbmVkIGludCBjYXApCj4+ICB7Cj4+ICAJY29uc3QgdWludDMyX3Qg
KmRmczsKPj4gIAl1bnNpZ25lZCBpbnQgaTsKPj4gQEAgLTgzLDcgKzgzLDcgQEAgdm9pZCBfX2lu
aXQgc2V0dXBfY2xlYXJfY3B1X2NhcCh1bnNpZ25lZCBpbnQgY2FwKQo+PiAgCX0KPj4gIH0KPj4g
IAo+PiAtdm9pZCBfX2luaXQgc2V0dXBfZm9yY2VfY3B1X2NhcCh1bnNpZ25lZCBpbnQgY2FwKQo+
PiArdm9pZCBzZXR1cF9mb3JjZV9jcHVfY2FwKHVuc2lnbmVkIGludCBjYXApCj4+ICB7Cj4+ICAJ
aWYgKF9fdGVzdF9hbmRfc2V0X2JpdChjYXAsIGZvcmNlZF9jYXBzKSkKPj4gIAkJcmV0dXJuOwo+
IFRoZSB0d28gZnVuY3Rpb25zIGFyZSBkZWxpYmVyYXRlbHkgX19pbml0LCBhcyBhbnkgY2FsbCB0
byB0aGVtCj4gcG9zdC1pbml0IGlzIG5vdCBnb2luZyB0byB0YWtlIHN5c3RlbS13aWRlIGVmZmVj
dC4KCkN1cnJlbnQgZXhhbXBsZSBkZW1vbnN0cmF0ZXMgdGhlIGNvbnRyYXJ5LsKgIFNldHRpbmcg
WDg2X0JVR19GUFVfUFRSUyBhdAphbnkgcG9pbnQgdGhyb3VnaCB0aGUgcnVudGltZSBvZiBYZW4g
d2lsbCBjYXVzZSB0aGUgc2FmZSBhY3Rpb24gdG8gc3RhcnQKaGFwcGVuaW5nLgoKRHJvcHBpbmcg
dGhpcyBjYWxsIG9uIHRoZSBub24tYm9vdCBDUFVzIGxlYWRzIHRvIGFuIGluc2VjdXJlCmNvbmZp
Z3VyYXRpb24gd2hpY2ggd2UncmUgcGVyZmVjdGx5IGNhcGFibGUgb2Ygd29ya2luZyBhcm91bmQs
IGFuZAp0aGVyZWZvcmUgaXNuJ3QgYW4gYWNjZXB0YWJsZSBzb2x1dGlvbi4KCn5BbmRyZXcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
