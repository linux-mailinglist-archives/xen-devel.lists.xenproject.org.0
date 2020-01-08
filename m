Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EB51343D4
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 14:29:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipBLz-0000DU-5C; Wed, 08 Jan 2020 13:26:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mkji=25=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ipBLw-0000DP-Qi
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 13:26:28 +0000
X-Inumbo-ID: 79956648-321a-11ea-b7f5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79956648-321a-11ea-b7f5-12813bfff9fa;
 Wed, 08 Jan 2020 13:26:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 57D95B191;
 Wed,  8 Jan 2020 13:26:27 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200108110148.18988-1-jgross@suse.com>
 <879882aa-9bd8-d56c-c567-fbd556361d97@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a309620d-bb2d-b456-94b1-69f3a0c84d76@suse.com>
Date: Wed, 8 Jan 2020 14:26:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <879882aa-9bd8-d56c-c567-fbd556361d97@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/x86: clear per cpu stub page
 information in cpu_smpboot_free()
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAgMTQ6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA4LjAxLjIwMjAgMTI6
MDEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMK
Pj4gKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+PiBAQCAtOTQ1LDYgKzk0NSw4IEBAIHN0
YXRpYyB2b2lkIGNwdV9zbXBib290X2ZyZWUodW5zaWduZWQgaW50IGNwdSwgYm9vbCByZW1vdmUp
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAocGVyX2NwdShzdHVicy5hZGRyLCBj
cHUpIHwgflBBR0VfTUFTSykgKyAxKTsKPj4gICAgICAgICAgIGlmICggaSA9PSBTVFVCU19QRVJf
UEFHRSApCj4+ICAgICAgICAgICAgICAgZnJlZV9kb21oZWFwX3BhZ2UobWZuX3RvX3BhZ2UobWZu
KSk7Cj4+ICsgICAgICAgIHBlcl9jcHUoc3R1YnMuYWRkciwgY3B1KSA9IDA7Cj4+ICsgICAgICAg
IHBlcl9jcHUoc3R1YnMubWZuLCBjcHUpID0gMDsKPj4gICAgICAgfQo+IAo+IEFmYWljdCB0aGlz
IHdhcyBhIHJlZ3Jlc3Npb24gZnJvbSB0aGUgaW50cm9kdWN0aW9uIG9mIENQVSBwYXJraW5nOgo+
IFByaW9yIHRvIHRoYXQsIHBlci1DUFUgZGF0YSB3b3VsZCBoYXZlIGJlZW4gemVyb2VkIGluIGFs
bCBjYXNlcwo+IGJlZm9yZSBhIG5ldyBDUFUgd2FzIHVubGVhc2hlZC4gSSB0aGluayBpdCB3b3Vs
ZCBiZSBoZWxwZnVsIGl0Cj4gdGhpcyB3YXMgbWVudGlvbmVkIGluIHRoZSBkZXNjcmlwdGlvbiAo
cG9zc2libHkgYnkgd2F5IG9mIGEgRml4ZXM6Cj4gdGFnKS4KCk9rYXksIHdpbGwgZG8uIEp1c3Qg
dG8gYmUgc3VyZSAtIHlvdSBhcmUgdGhpbmtpbmcgb2YgY29tbWl0IDJlNmM4ZjE4Mj8KCgpKdWVy
Z2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
