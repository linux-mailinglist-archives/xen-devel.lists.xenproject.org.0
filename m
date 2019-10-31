Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47303EB073
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 13:41:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQ9ib-00023S-Pn; Thu, 31 Oct 2019 12:38:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I6hz=YY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iQ9iZ-00023D-Uz
 for xen-devel@lists.xen.org; Thu, 31 Oct 2019 12:38:23 +0000
X-Inumbo-ID: 53087c06-fbdb-11e9-a531-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53087c06-fbdb-11e9-a531-bc764e2007e4;
 Thu, 31 Oct 2019 12:38:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6920FB12F;
 Thu, 31 Oct 2019 12:38:21 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20191031105609.21819-1-sergey.dyasli@citrix.com>
 <932471f8-fbe3-de7b-f005-d7e036f2c936@suse.com>
 <8ef28fe6-70dc-8233-9671-5e9cd60b7306@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7bcab930-a81d-07fd-45ff-f68d6c951aa2@suse.com>
Date: Thu, 31 Oct 2019 13:38:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8ef28fe6-70dc-8233-9671-5e9cd60b7306@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 for 4.13] x86/e820: fix 640k - 1M region
 reservation logic
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMTAuMjAxOSAxMjo0NSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBPbiAzMS8xMC8yMDE5
IDExOjA3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMzEuMTAuMjAxOSAxMTo1NiwgU2VyZ2V5
IER5YXNsaSB3cm90ZToKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4+PiArKysgYi94ZW4v
YXJjaC94ODYvbW0uYwo+Pj4gQEAgLTU5NDMsNyArNTk0Myw3IEBAIGNvbnN0IHN0cnVjdCBwbGF0
Zm9ybV9iYWRfcGFnZSAqX19pbml0IGdldF9wbGF0Zm9ybV9iYWRwYWdlcyh1bnNpZ25lZCBpbnQg
KmFycmF5Cj4+PiAgICAgIGNhc2UgMHgwMDA4MDZlMDogLyogZXJyYXR1bSBLQkw/Pz8gKi8KPj4+
ICAgICAgY2FzZSAweDAwMDkwNmUwOiAvKiBlcnJhdGEgS0JMPz8/IC8gS0JXMTE0IC8gQ0ZXMTAz
ICovCj4+PiAgICAgICAgICAqYXJyYXlfc2l6ZSA9IChjcHVpZF9lYXgoMCkgPj0gNyAmJgo+Pj4g
LSAgICAgICAgICAgICAgICAgICAgICAgIShjcHVpZF9lY3goMSkgJiBjcHVmZWF0X21hc2soWDg2
X0ZFQVRVUkVfSFlQRVJWSVNPUikpICYmCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAhZWFy
bHlfY3B1X2hhc19oeXBlcnZpc29yKCkgJiYKPj4KPj4gU3RyaWN0bHkgc3BlYWtpbmcgdGhpcyBt
YWtlcyBjbGVhciB0aGF0IGluIGVhcmx5X2NwdV9oYXNfaHlwZXJ2aXNvcigpCj4+IHlvdSBzaG91
bGQgYWxzbyBjaGVjayBjcHVpZF9lYXgoMCkgPj0gMS4gV2UgZG9uJ3QgY3VycmVudGx5IHNlZW0g
dG8KPj4gb2JqZWN0IHRvIHJ1bm5pbmcgb24gYSBzeXN0ZW0gd2l0aCBvbmx5IGJhc2ljIGxlYWYg
MCBhdmFpbGFibGUgKHdlCj4+IGRvIG9iamVjdCB0byB0aGVyZSBub3QgYmVpbmcgZXh0ZW5kZWQg
bGVhZiAxKS4gQW5kcmV3LCBkbyB5b3UgaGF2ZQo+PiBhbnkgY2xlYXIgb3BpbmlvbiBvbmUgd2F5
IG9yIHRoZSBvdGhlcj8KPiAKPiBXaGF0IGdhdmUgeW91IHRoYXQgaW1wcmVzc2lvbj8gZWFybHlf
Y3B1X2luaXQoKSBhbmQgZ2VuZXJpY19pZGVudGlmeSgpCj4gZG8gY3B1aWQoMHgxKSB1bmNvbmRp
dGlvbmFsbHkuCgoiZG8gY3B1aWQoMHgxKSB1bmNvbmRpdGlvbmFsbHkiICE9ICJvYmplY3QgdG8g
cnVubmluZyBvbiBhIHN5c3RlbQp3aXRoIG9ubHkgYmFzaWMgbGVhZiAwIGF2YWlsYWJsZSIsIGku
ZS4gdGhhdCBjb2RlIGlzIHNpbXBseSBidWdneSBhcwpsb25nIGFzIHdlIGRvbid0IGVsc2V3aGVy
ZSBwYW5pYygpIGlmIHRoZXJlJ3Mgb25seSBsZWFmIDAgYXZhaWxhYmxlLgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
