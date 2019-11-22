Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6651072A7
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 14:01:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY8WT-0003IM-Qe; Fri, 22 Nov 2019 12:58:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cGBV=ZO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iY8WS-0003IB-CC
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 12:58:52 +0000
X-Inumbo-ID: d3d20cbe-0d27-11ea-a350-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3d20cbe-0d27-11ea-a350-12813bfff9fa;
 Fri, 22 Nov 2019 12:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574427530;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9lXFWftzoSy9L3vGpJKtAoMOIFj7qyezb6ufE7GX3Ew=;
 b=FSHD0KdcHn3dI+3xGQRiWMWFwrs0kWbiym6nu5Nxy/7EXGtIWkmmjtZq
 48fYuhkjhuCCZCwwQdmXFWVGv38yDYfGl8h2JLCV/8GosSsdsQ61YV5nl
 /F5rCG/b9n+Wprw9cR536p6QMx8ch3FK9/cyp8Ja3svs8VBAYZ6TUeo21 Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0rQzcE5TBZF8m+RV0Ytgqxj/Ckn5dOtDJzxx8qpPVfXFncoJaOxyfDV05nQPIOOtFieui/tKaF
 +3jBZG93DO9c7y5b0+Fq3SgSrWeFmlQfyQlHrU6es95FqLgKhhcD8JmGOzDvnbHkeYEbZLLXv+
 cG43LSQyD2iM8titvw7rl7Ly/txieEfdCBFiz6Yb3zFMB/TARuYqiPGJdcOil03ZE2qMIsa0lj
 mIvg4+tGtVO2jH4jHatcpJ7HLdo5Wt+Co6OPpMCH10FEP1bk+Pl+LmexzEIHgq4UfsU/iNKdJe
 C6g=
X-SBRS: 2.7
X-MesageID: 9120217
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,229,1571716800"; 
   d="scan'208";a="9120217"
To: Jan Beulich <jbeulich@suse.com>
References: <fba2992c-e306-dfb2-8edb-20fe5d18ca98@suse.com>
 <ad0a9bc4-dbd6-d59c-d33b-8bed744376ae@citrix.com>
 <ccebdbf3-7cd9-b1e9-b3c5-976ee5b5380b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7d2259af-188b-031f-6853-44a0151b7ee3@citrix.com>
Date: Fri, 22 Nov 2019 12:58:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ccebdbf3-7cd9-b1e9-b3c5-976ee5b5380b@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86: avoid HPET use on certain Intel
 platforms
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMTEvMjAxOSAxMjo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjIuMTEuMjAxOSAx
Mzo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjIvMTEvMjAxOSAxMjo0NiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBMaW51eCBjb21taXQgZmM1ZGI1ODUzOWI0OTM1MWU3NmYxOTgxN2Vk
MTEwMmJmN2M3MTJkMCBzYXlzCj4+Pgo+Pj4gIlNvbWUgQ29mZmVlIExha2UgcGxhdGZvcm1zIGhh
dmUgYSBza2V3ZWQgSFBFVCB0aW1lciBvbmNlIHRoZSBTb0NzIGVudGVyZWQKPj4+ICBQQzEwLCB3
aGljaCBpbiBjb25zZXF1ZW5jZSBtYXJrcyBUU0MgYXMgdW5zdGFibGUgYmVjYXVzZSBIUEVUIGlz
IHVzZWQgYXMKPj4+ICB3YXRjaGRvZyBjbG9ja3NvdXJjZSBmb3IgVFNDLiIKPj4+Cj4+PiBGb2xs
b3cgdGhpcyBmb3IgWGVuIGFzIHdlbGwuIExvb2tpbmcgYXQgaXRzIHBhdGNoIGNvbnRleHQgbWFk
ZSBtZSBub3RpY2UKPj4+IHRoZXkgaGF2ZSBhIHByZS1leGlzdGluZyBxdWlyayBmb3IgQmF5IFRy
YWlsIGFzIHdlbGwuIFRoZSBjb21tZW50IHRoZXJlLAo+Pj4gaG93ZXZlciwgcG9pbnRzIGF0IGEg
Q2hlcnJ5IFRyYWlsIGRvY3VtZW50LiBMb29raW5nIGF0IHRoZSBkYXRhc2hlZXRzIG9mCj4+PiBi
b3RoLCB0aGVyZSBhcHBlYXIgdG8gYmUgc2ltaWxhciBpc3N1ZXMsIHNvIGdvIGJleW9uZCBMaW51
eCdlcyBjb3ZlcmFnZQo+Pj4gYW5kIGV4Y2x1ZGUgYm90aC4gQWxzbyBrZXkgdGhlIGRpc2FibGUg
b24gdGhlIFBDSSBJRHMgb2YgdGhlIGFjdHVhbAo+Pj4gYWZmZWN0ZWQgZGV2aWNlcywgcmF0aGVy
IHRoYW4gdGhvc2Ugb2YgMDA6MDAuMC4KPj4+Cj4+PiBBcHBseSB0aGUgd29ya2Fyb3VuZHMgb25s
eSB3aGVuIHRoZSB1c2Ugb2YgSFBFVCB3YXMgbm90IGV4cGxpY2l0bHkKPj4+IHJlcXVlc3RlZCBv
biB0aGUgY29tbWFuZCBsaW5lIGFuZCB3aGVuIHVzZSBvZiAoZGVlcCkgQy1zdGF0ZXMgd2FzIG5v
dAo+Pj4gZGlzYWJsZWQuCj4+Pgo+Pj4gQWRqdXN0IGEgZmV3IHR5cGVzIGluIHRvdWNoZWQgb3Ig
bmVhcmJ5IGNvZGUgYXQgdGhlIHNhbWUgdGltZS4KPj4gUmVwb3J0ZWQtYnkgPwo+IFRoZSBMaW51
eCBjb21taXQgaGFzIGEgU3VnZ2VzdGVkLWJ5LCBidXQgbm8gUmVwb3J0ZWQtYnkuIERvIHlvdQo+
IHdhbnQgbWUgdG8gY29weSB0aGF0IG9uZT8gT3IgZWxzZSBkbyB5b3UgaGF2ZSBhbnkgc3VnZ2Vz
dGlvbiBhcwo+IHRvIHdobyB0aGUgcmVwb3J0ZXIgd2FzPwoKV2VsbCAtIHRoaXMgcGF0Y2ggd2Fz
IGlkZW50aWZpZWQgYnkgc29tZW9uZSBvbiB4ZW4tZGV2ZWwsIHdoaWNoIEkKcHJlc3VtZSB3YXMg
eW91ciBiYXNpcyBmb3IgbG9va2luZyBpbnRvIGl0LgoKfkFuZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
