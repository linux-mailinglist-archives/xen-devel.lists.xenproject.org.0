Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C4CA7FB9
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 11:49:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Rrb-0005Qf-3M; Wed, 04 Sep 2019 09:46:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zWnQ=W7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i5RrZ-0005Qa-TC
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 09:46:05 +0000
X-Inumbo-ID: cf7e49d8-cef8-11e9-978d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf7e49d8-cef8-11e9-978d-bc764e2007e4;
 Wed, 04 Sep 2019 09:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567590365;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ITGFuka8zwQJNluxvD1iiXCFcdjUfFcC4d6bcSfIqQM=;
 b=MecpxONEG5wR0TGmhb5zEq2hQGgqLQIDJuEojxELic3sVkZxGZQX/J6J
 D58iOsjOcYMl1elJz0FRMkbLrFnVb/8PMYC5Ukcf8B2gJ+nKFeJLcm7Nr
 M2A3QqAAg/8HNhkSoTkXfgDMja8cdjz2GTn1gshzwG/PgfOrmEGNg29De A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1jILiYXq403z4itaJ3i8rbhfJKl/ZDYYsWE3tbsJpL8gaccNaQUJdgEZAax/nfKcHRzemuO6Rk
 +qNx1DczkW2C6e/431a++US0y4NSwV/fkRTif/yJHm4BcprblEpQxE1Qx38vMviAAkwFqIJ/Ya
 tAY+14sZzhWSyMG1KmnrapN4DFBVkZ3PmXsfsu14e7sku37SW7XejuKB5Y7Kg3Y7GpF7TWioqq
 VaVzH7pZb130bEej3g2sximV5Y45A/AZwp1wNfO+GFrnxTV345CSrH3sMQVjbYd4xZYFDJmA5M
 Jns=
X-SBRS: 2.7
X-MesageID: 5158541
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,465,1559534400"; 
   d="scan'208";a="5158541"
To: Jan Beulich <jbeulich@suse.com>
References: <347e51f2-e80c-992c-6d0b-3b2bfdb75cce@suse.com>
 <1fc41c75-7e6d-5a34-c500-8f769e4374bb@suse.com>
 <c0e34ad1-746b-6520-2d6a-f069e3107755@citrix.com>
 <435d5ee1-23a8-576a-22dd-0ed822430c79@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <84359d04-ee0c-4448-6529-a3d9abc22957@citrix.com>
Date: Wed, 4 Sep 2019 10:46:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <435d5ee1-23a8-576a-22dd-0ed822430c79@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 7/8] x86emul: support RDPRU
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
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDkvMjAxOSAxMDoyNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDMuMDkuMjAxOSAx
NDozNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHVpZC5j
Cj4+PiArKysgYi94ZW4vYXJjaC94ODYvY3B1aWQuYwo+Pj4gQEAgLTU0NSw2ICs1NDUsMTEgQEAg
dm9pZCByZWNhbGN1bGF0ZV9jcHVpZF9wb2xpY3koc3RydWN0IGRvbQo+Pj4gIAo+Pj4gICAgICBw
LT5leHRkLm1heGxpbmFkZHIgPSBwLT5leHRkLmxtID8gNDggOiAzMjsKPj4+ICAKPj4+ICsgICAg
aWYgKCBwLT5leHRkLnJkcHJ1ICkKPj4+ICsgICAgICAgIHAtPmV4dGQucmRwcnVfbWF4ID0gbWlu
KHAtPmV4dGQucmRwcnVfbWF4LCBtYXgtPmV4dGQucmRwcnVfbWF4KTsKPj4+ICsgICAgZWxzZQo+
Pj4gKyAgICAgICAgcC0+ZXh0ZC5yZHBydV9tYXggPSAwOwo+Pj4gKwo+Pj4gICAgICByZWNhbGN1
bGF0ZV94c3RhdGUocCk7Cj4+PiAgICAgIHJlY2FsY3VsYXRlX21pc2MocCk7Cj4+IFRoZSBDUFVJ
RCBsb2dpYyBuZWVkcyBxdWl0ZSBhIGJpdCBtb3JlIHRoYW4gdGhpcywgYW5kIHRvIGJlIHNhZmUg
b24KPj4gbWlncmF0ZS4gIEZvciBvbmUsIHJlY2FsY3VsYXRlX3hzdGF0ZSgpIHVuaWxhdGVyYWxs
eSBjbG9iYmVycyB0aGlzIHRvIDAuCj4gSSd2ZSBsb29rZWQgYWdhaW4gLSByZWNhbGN1bGF0ZV9t
aXNjKCkgY2xvYmJlcnMgLmEsIC5iLCBhbmQgLmMsCj4gYnV0IG5vdCAuZCBhZmFpY3MuCgpJdCBp
cyBjbG9iYmVyZWQgaW4gdGhlIGNvbW1vbiBzZWN0aW9uIGF0IHRoZSB0b3AuCgouLi4KwqDCoMKg
IC8qIE1vc3Qgb2YgUG93ZXIvUkFTIGhpZGRlbiBmcm9tIGd1ZXN0cy4gKi8KwqDCoMKgIHAtPmV4
dGQucmF3WzB4N10uYSA9IHAtPmV4dGQucmF3WzB4N10uYiA9IHAtPmV4dGQucmF3WzB4N10uYyA9
IDA7CgrCoMKgwqAgcC0+ZXh0ZC5yYXdbMHg4XS5kID0gMDsKCsKgwqDCoCBzd2l0Y2ggKCBwLT54
ODZfdmVuZG9yICkKwqDCoMKgIHsKLi4uCgo+IEFueXdheSwganVzdCBhcyBhIG5vdGUsIGFzIHlv
dSd2ZSBzYWlkIHlvdSdkCj4gdGFrZSBjYXJlIG9mIHRoaXMgYW55d2F5LCBhbmQgSSdsbCByZS1i
YXNlIGFmdGVyd2FyZHMuCgpJIGxvb2tlZCBhdCB0aGlzIGEgYml0IHllc3RlcmRheSwgYW5kIGl0
IHZlcnkgdWdseSBvcGVuY29kaW5nIGJpdHMgb2YKdGhlIHBvbGljeSB3b3JrIHdpdGhvdXQgdGhh
dCB3b3JrLgoKSSd2ZSBnb3QgYW4gaWRlYSBmb3IganVzdCBlbm91Z2ggc2tlbGV0b24gcG9saWN5
IHdvcmsgdG8gYXZvaWQgdGhlCmR1cGxpY2F0ZWQgZWZmb3J0LCB3aGljaCBJIHRoaW5rIHdpbGwg
YmUgYSBtb3JlIHNlbnNpYmxlIHdheSBvZiBtYWtpbmcKcHJvZ3Jlc3MuwqAgSXQgd2lsbCBjZXJ0
YWlubHkgcmVkdWNlIHRoZSBsYXRlbmN5IG9uIGJlaW5nIGFibGUgdG8gc3RhcnQKTVNSX1NQRUNf
Q1RSTCB3b3JrLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
