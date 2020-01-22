Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E683E145E2A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 22:36:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuNbc-0004aS-9h; Wed, 22 Jan 2020 21:32:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zvfy=3L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iuNba-0004aN-Ph
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 21:32:06 +0000
X-Inumbo-ID: 9df1afac-3d5e-11ea-9fd7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9df1afac-3d5e-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 21:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579728718;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=en8YPcSChL5NcOjpobUqloFpPeU8MZ41NOgWgmrkWNM=;
 b=aKcDg6Ao7YRxcN2pHT8hcnA8zQR44LQZtDzcPm8GxtipA+qq4RrVfPvI
 Zcf59eq8cfaQD86ZOW+RxJgf9k3RAIro0kCdo17MHRur/XiD8eQp50zZG
 mA5RNeekKIcVRknm7+w9j+hCwr/ARKzA3WLNtXJag0QJudGIQGb0AzgfD 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vhSdhR8bFMSRuhQ+WpHuHzp9Igj10EFkZnki3yN7a1w2TLddqM9GqgWNlWHYVsDgcoteEiyZRU
 Rq2SSnj/KxqLKwGz/4EfXonZ780Iiy/b2LML+n8AyVIT8eXyo9ntCNZ43/UKBlInYya7Mo2JR2
 8aCUSyoAj0CFsgXnNRowWUZ79dyxFucPHKXyR3SQs1Mj/2W+3l6AKf7NLr/fNQIC2v7bfwKqoJ
 3vRiOsJkldIEfWNnljZ32/M4ifEKk6JNSHFehQQPMBPUX5eMbDupSJBrsqV1FjOdFQn5YzKy1a
 iGY=
X-SBRS: 2.7
X-MesageID: 11468509
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,350,1574139600"; d="scan'208";a="11468509"
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-3-liuwe@microsoft.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <2bea187c-7c4d-721b-9229-a28066c7fc5a@citrix.com>
Date: Wed, 22 Jan 2020 21:31:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200122202343.5703-3-liuwe@microsoft.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 2/7] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMDEvMjAyMCAyMDoyMywgV2VpIExpdSB3cm90ZToKPiBVc2UgdGhlIHRvcC1tb3N0IGFk
ZHJlc3NhYmxlIHBhZ2UgZm9yIHRoYXQgcHVycG9zZS4gQWRqdXN0IGU4MjAgY29kZQo+IGFjY29y
ZGluZ2x5Lgo+Cj4gV2UgYWxzbyBuZWVkIHRvIHJlZ2lzdGVyIFhlbidzIGd1ZXN0IE9TIElEIHRv
IEh5cGVyLVYuIFVzZSAweDMwMCBhcyB0aGUKPiBPUyB0eXBlLgo+Cj4gU2lnbmVkLW9mZi1ieTog
V2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KPiAtLS0KPiBYWFggdGhlIGRlY2lzaW9uIG9u
IFhlbidzIHZlbmRvciBJRCBpcyBwZW5kaW5nLgoKUHJlc3VtYWJseSB0aGlzIGlzIHBlbmRpbmcg
YSBwdWJsaXNoZWQgdXBkYXRlIHRvIHRoZSBUTEZTP8KgIChBbmQgSQpwcmVzdW1lIHVzaW5nIDB4
ODA4OCBpcyBvdXQgb2YgdGhlIHF1ZXN0aW9uP8KgIFRoYXQgaXMgYW4gWCBpbiB0aGUgYm90dG9t
CmJ5dGUsIG5vdCBhIHJlZmVyZW5jZSB0byBhbiA4IGJpdCBtaWNyb3Byb2Nlc3Nvci4pCgo+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZTgyMC5jIGIveGVuL2FyY2gveDg2L2U4MjAuYwo+IGlu
ZGV4IDA4MmY5OTI4YTEuLjVhNGVmMjdhMGIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2U4
MjAuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9lODIwLmMKPiBAQCAtMzYsNiArMzYsMjIgQEAgYm9v
bGVhbl9wYXJhbSgiZTgyMC12ZXJib3NlIiwgZTgyMF92ZXJib3NlKTsKPiBAQCAtMzU3LDYgKzM3
MywyMSBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBfX2luaXQgZmluZF9tYXhfcGZuKHZvaWQpCj4g
ICAgICAgICAgICAgIG1heF9wZm4gPSBlbmQ7Cj4gICAgICB9Cj4gIAo+ICsjaWZkZWYgQ09ORklH
X0hZUEVSVl9HVUVTVAo+ICsgICAgewo+ICsJLyoKPiArCSAqIFdlIHJlc2VydmUgdGhlIHRvcC1t
b3N0IHBhZ2UgZm9yIGh5cGVyY2FsbCBwYWdlLiBBZGp1c3QKPiArCSAqIG1heF9wZm4gaWYgbmVj
ZXNzYXJ5LgoKSXQgbWlnaHQgYmUgd29ydGggbGVhdmluZyBhICJUT0RPOiBCZXR0ZXIgYWxnb3Jp
dGhtL2d1ZXNzPyIgaGVyZS4KCj4gKwkgKi8KPiArICAgICAgICB1bnNpZ25lZCBpbnQgcGh5c19i
aXRzID0gZmluZF9waHlzX2FkZHJfYml0cygpOwo+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgaGNh
bGxfcGZuID0KPiArICAgICAgICAgICgoMXVsbCA8PCBwaHlzX2JpdHMpIC0gMSkgPj4gUEFHRV9T
SElGVDsKCigxdWxsIDw8IChwaHlzX2JpdHMgLSBQQUdFX1NISUZUKSkgLSAxIGlzIGVxdWl2YWxl
bnQsIGFuZCBkb2Vzbid0CnJlcXVpcmUgYSByaWdodCBzaGlmdC7CoCBJIGRvbid0IGtub3cgaWYg
dGhlIGNvbXBpbGVyIGlzIHNtYXJ0IGVub3VnaCB0bwptYWtlIHRoaXMgb3B0aW1pc2F0aW9uIGF1
dG9tYXRpY2FsbHkuCgo+ICsKPiArICAgICAgICBpZiAoIG1heF9wZm4gPj0gaGNhbGxfcGZuICkK
PiArICAgICAgICAgIG1heF9wZm4gPSBoY2FsbF9wZm4gLSAxOwoKSW5kZW50YXRpb24gbG9va3Mg
d2VpcmQuCgo+IEBAIC00NDYsMTMgKzQ3Nyw3IEBAIHN0YXRpYyB1aW50NjRfdCBfX2luaXQgbXRy
cl90b3Bfb2ZfcmFtKHZvaWQpCj4gICAgICAgICAgIHJldHVybiAwOwo+ICAKPiAgICAgIC8qIEZp
bmQgdGhlIHBoeXNpY2FsIGFkZHJlc3Mgc2l6ZSBmb3IgdGhpcyBDUFUuICovCj4gLSAgICBlYXgg
PSBjcHVpZF9lYXgoMHg4MDAwMDAwMCk7Cj4gLSAgICBpZiAoIChlYXggPj4gMTYpID09IDB4ODAw
MCAmJiBlYXggPj0gMHg4MDAwMDAwOCApCj4gLSAgICB7Cj4gLSAgICAgICAgcGh5c19iaXRzID0g
KHVpbnQ4X3QpY3B1aWRfZWF4KDB4ODAwMDAwMDgpOwo+IC0gICAgICAgIGlmICggcGh5c19iaXRz
ID4gUEFERFJfQklUUyApCj4gLSAgICAgICAgICAgIHBoeXNfYml0cyA9IFBBRERSX0JJVFM7Cj4g
LSAgICB9Cj4gKyAgICBwaHlzX2JpdHMgPSBmaW5kX3BoeXNfYWRkcl9iaXRzKCk7Cj4gICAgICBh
ZGRyX21hc2sgPSAoKDF1bGwgPDwgcGh5c19iaXRzKSAtIDEpICYgfigoMXVsbCA8PCAxMikgLSAx
KTsKCk5vdGUgZm9yIHdob21ldmVyIGlzIG5leHQgZG9pbmcgY2xlYW51cCBpbiB0aGlzIGFyZWEu
wqAgVGhpcyB3YW50cyB0byBiZQomIFBBR0VfTUFTSy4KCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5
cGVydi5jCj4gaW5kZXggOGQzODMxM2Q3YS4uZjk4NmMxYTgwNSAxMDA2NDQKPiAtLS0gYS94ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0
L2h5cGVydi9oeXBlcnYuYwo+IEBAIC03Miw2ICs4Miw0MyBAQCBjb25zdCBzdHJ1Y3QgaHlwZXJ2
aXNvcl9vcHMgKl9faW5pdCBoeXBlcnZfcHJvYmUodm9pZCkKPiAgICAgIHJldHVybiAmb3BzOwo+
ICB9Cj4gIAo+ICtzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfaHlwZXJjYWxsX3BhZ2Uodm9pZCkK
PiArewo+ICsgICAgdW5pb24gaHZfeDY0X21zcl9oeXBlcmNhbGxfY29udGVudHMgaHlwZXJjYWxs
X21zcjsKPiArICAgIHVuaW9uIGh2X2d1ZXN0X29zX2lkIGd1ZXN0X2lkOwo+ICsgICAgdW5zaWdu
ZWQgbG9uZyBtZm47Cj4gKwo+ICsgICAgcmRtc3JsKEhWX1g2NF9NU1JfR1VFU1RfT1NfSUQsIGd1
ZXN0X2lkLnJhdyk7Cj4gKyAgICBpZiAoICFndWVzdF9pZC5yYXcgKQo+ICsgICAgewo+ICsgICAg
ICAgIGd1ZXN0X2lkLnJhdyA9IGdlbmVyYXRlX2d1ZXN0X2lkKCk7Cj4gKyAgICAgICAgd3Jtc3Js
KEhWX1g2NF9NU1JfR1VFU1RfT1NfSUQsIGd1ZXN0X2lkLnJhdyk7Cj4gKyAgICB9Cj4gKwo+ICsg
ICAgcmRtc3JsKEhWX1g2NF9NU1JfSFlQRVJDQUxMLCBoeXBlcmNhbGxfbXNyLmFzX3VpbnQ2NCk7
Cj4gKyAgICBpZiAoICFoeXBlcmNhbGxfbXNyLmVuYWJsZSApCj4gKyAgICB7Cj4gKyAgICAgICAg
bWZuID0gKCgxdWxsIDw8IHBhZGRyX2JpdHMpIC0gMSkgPj4gSFZfSFlQX1BBR0VfU0hJRlQ7Cj4g
KyAgICAgICAgaHlwZXJjYWxsX21zci5lbmFibGUgPSAxOwo+ICsgICAgICAgIGh5cGVyY2FsbF9t
c3IuZ3Vlc3RfcGh5c2ljYWxfYWRkcmVzcyA9IG1mbjsKPiArICAgICAgICB3cm1zcmwoSFZfWDY0
X01TUl9IWVBFUkNBTEwsIGh5cGVyY2FsbF9tc3IuYXNfdWludDY0KTsKCklzIGl0IHdvcnRoIHJl
YWRpbmcgYmFjaywgYW5kIEJVRygpIGlmIGl0IGlzIGRpZmZlcmVudD/CoCBJdCB3aWxsIGJlIGEK
bW9yZSBvYnZpb3VzIGZhaWx1cmUgdGhhbiBoeXBlcmNhbGxzIGRpc2FwcGVhcmluZyBteXN0ZXJp
b3VzbHkuCgo+ICsgICAgfSBlbHNlIHsKPiArICAgICAgICBtZm4gPSBoeXBlcmNhbGxfbXNyLmd1
ZXN0X3BoeXNpY2FsX2FkZHJlc3M7Cj4gKyAgICB9CgpTdHlsZS4KCk90aGVyd2lzZSwgTEdUTS4K
Cn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
