Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 042C417338C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 10:13:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7bfd-0006od-0e; Fri, 28 Feb 2020 09:10:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7bfb-0006oW-UK
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 09:10:55 +0000
X-Inumbo-ID: 391075fd-5a0a-11ea-98d9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 391075fd-5a0a-11ea-98d9-12813bfff9fa;
 Fri, 28 Feb 2020 09:10:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2C64EB11F;
 Fri, 28 Feb 2020 09:10:54 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200214195510.22667-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <faec15bd-0138-e6d5-a3a4-7627c4d3aa54@suse.com>
Date: Fri, 28 Feb 2020 10:11:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200214195510.22667-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/msr: Virtualise MSR_PLATFORM_ID properly
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDIuMjAyMCAyMDo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYvbXNyLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbXNyLmMKPiBAQCAtMTQzLDYgKzE0Mywx
MyBAQCBpbnQgZ3Vlc3RfcmRtc3Ioc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IG1zciwgdWludDY0
X3QgKnZhbCkKPiAgICAgICAgICAvKiBOb3Qgb2ZmZXJlZCB0byBndWVzdHMuICovCj4gICAgICAg
ICAgZ290byBncF9mYXVsdDsKPiAgCj4gKyAgICBjYXNlIE1TUl9JQTMyX1BMQVRGT1JNX0lEOgo+
ICsgICAgICAgIGlmICggIShjcC0+eDg2X3ZlbmRvciAmIFg4Nl9WRU5ET1JfSU5URUwpIHx8Cj4g
KyAgICAgICAgICAgICAhKGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAmIFg4Nl9WRU5ET1JfSU5U
RUwpICkKClRoaXMgaGFzIHR1cm5lZCBvdXQgdG8gYmUgYW4gdW5mb3J0dW5hdGUgdHJhcCBmb3Ig
YmFja3BvcnRpbmcuCldoaWxlIEkgdW5kZXJzdGFuZCB1c2luZyAmIGhlcmUgaXMgdGhlIG1vcmUg
bW9kZXJuIGZvcm0sIGNvdWxkCndlIHBlcmhhcHMgc2V0dGxlIG9uIHVzaW5nID09IC8gIT0gd2hl
cmUgcG9zc2libGUgKGkuZS4ganVzdCBhCnNpbmdsZSB2ZW5kb3IgY2hlY2tlZCkgdW50aWwgNC4x
MiBoYXMgZ29uZSBvdXQgb2YgYXQgbGVhc3QKcmVndWxhciBzdXBwb3J0PyAoVGhlIHByZXZhaWxp
bmcgdXNlIHdpdGggbW9yZSB0aGFuIG9uZSB2ZW5kb3IKaXMgd2l0aCBBTUQgYW5kIEh5Z29uLCB3
aGljaCBkb2Vzbid0IGdvIHNpbGVudCBhcwpYODZfVkVORE9SX0hZR09OIGRvZXNuJ3QgZXhpc3Qg
eWV0IGluIDQuMTIuKQoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
