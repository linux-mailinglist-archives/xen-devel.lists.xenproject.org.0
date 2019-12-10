Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A36118D5C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 17:15:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iei5g-0007wM-4H; Tue, 10 Dec 2019 16:10:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iei5e-0007wH-Jf
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 16:10:22 +0000
X-Inumbo-ID: 90bb5194-1b67-11ea-89a0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90bb5194-1b67-11ea-89a0-12813bfff9fa;
 Tue, 10 Dec 2019 16:10:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 96AA8AF11;
 Tue, 10 Dec 2019 16:10:20 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191025091618.10153-1-liuwe@microsoft.com>
 <20191025091618.10153-4-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0f422a11-b923-c610-0cb0-60278799d85f@suse.com>
Date: Tue, 10 Dec 2019 17:10:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191025091618.10153-4-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next 3/7] x86/hyperv: extract more
 information from Hyper-V
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTAuMjAxOSAxMToxNiwgV2VpIExpdSB3cm90ZToKPiAtLS0gYS94ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9o
eXBlcnYuYwo+IEBAIC0yMSw2ICsyMSw5IEBACj4gICNpbmNsdWRlIDx4ZW4vaW5pdC5oPgo+ICAK
PiAgI2luY2x1ZGUgPGFzbS9ndWVzdC5oPgo+ICsjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVydi10
bGZzLmg+Cj4gKwo+ICtzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gbXNfaHlwZXJ2Owo+ICAKPiAgYm9v
bCBfX2luaXQgaHlwZXJ2X3Byb2JlKHZvaWQpCj4gIHsKPiBAQCAtMzYsNiArMzksMTcgQEAgYm9v
bCBfX2luaXQgaHlwZXJ2X3Byb2JlKHZvaWQpCj4gICAgICBpZiAoIGVheCAhPSAweDMxMjM3NjQ4
ICkgICAgLyogSHYjMSAqLwo+ICAgICAgICAgIHJldHVybiBmYWxzZTsKPiAgCj4gKyAgICAvKiBF
eHRyYWN0IG1vcmUgaW5mb3JtYXRpb24gZnJvbSBIeXBlci1WICovCj4gKyAgICBtc19oeXBlcnYu
ZmVhdHVyZXMgPSBjcHVpZF9lYXgoSFlQRVJWX0NQVUlEX0ZFQVRVUkVTKTsKPiArICAgIG1zX2h5
cGVydi5taXNjX2ZlYXR1cmVzID0gY3B1aWRfZWR4KEhZUEVSVl9DUFVJRF9GRUFUVVJFUyk7CgpJ
dCdzIF9faW5pdCBjb2RlLCBzbyBpdCBkb2Vzbid0IG1hdHRlciBhbGwgdGhhdCBtdWNoLCBidXQg
cGVyaGFwcwpvYnRhaW4gdGhlc2UgdHdvIGFuZCAuLi4KCj4gKyAgICBtc19oeXBlcnYuaGludHMg
PSBjcHVpZF9lYXgoSFlQRVJWX0NQVUlEX0VOTElHSFRNRU5UX0lORk8pOwo+ICsKPiArICAgIGlm
ICggbXNfaHlwZXJ2LmhpbnRzICYgSFZfWDY0X0VOTElHSFRFTkVEX1ZNQ1NfUkVDT01NRU5ERUQg
KQo+ICsgICAgICAgIG1zX2h5cGVydi5uZXN0ZWRfZmVhdHVyZXMgPSBjcHVpZF9lYXgoSFlQRVJW
X0NQVUlEX05FU1RFRF9GRUFUVVJFUyk7Cj4gKwo+ICsgICAgbXNfaHlwZXJ2Lm1heF92cF9pbmRl
eCA9IGNwdWlkX2VheChIWVBFUlZfQ1BVSURfSU1QTEVNRU5UX0xJTUlUUyk7Cj4gKyAgICBtc19o
eXBlcnYubWF4X2xwX2luZGV4ID0gY3B1aWRfZWJ4KEhZUEVSVl9DUFVJRF9JTVBMRU1FTlRfTElN
SVRTKTsKCi4uLiB0aGVzZSB0d28gd2l0aCBqdXN0IG9uZSBDUFVJRCBpbnZvY2F0aW9uIGVhY2g/
IFByZWZlcmFibHkKd2l0aCB0aGlzIGFkanVzdG1lbnQKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
