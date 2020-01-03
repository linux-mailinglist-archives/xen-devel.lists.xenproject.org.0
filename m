Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBFC12F8DA
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 14:38:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inN7d-0007JS-Jn; Fri, 03 Jan 2020 13:36:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inN7c-0007JN-0k
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 13:36:12 +0000
X-Inumbo-ID: 00a416a2-2e2e-11ea-a48e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00a416a2-2e2e-11ea-a48e-12813bfff9fa;
 Fri, 03 Jan 2020 13:36:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D14F1AD20;
 Fri,  3 Jan 2020 13:36:09 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200102145953.6503-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d8abd43b-ac91-9eef-3c34-394ed9842342@suse.com>
Date: Fri, 3 Jan 2020 14:36:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200102145953.6503-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/boot: Clean up the trampoline
 transition into Long mode
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

T24gMDIuMDEuMjAyMCAxNTo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBAQCAtMTExLDI2ICsx
MDksNiBAQCB0cmFtcG9saW5lX3Byb3Rtb2RlX2VudHJ5Ogo+ICBzdGFydDY0Ogo+ICAgICAgICAg
IC8qIEp1bXAgdG8gaGlnaCBtYXBwaW5ncy4gKi8KPiAgICAgICAgICBtb3ZhYnMgICRfX2hpZ2hf
c3RhcnQsICVyZGkKPiAtCj4gLSNpZmRlZiBDT05GSUdfSU5ESVJFQ1RfVEhVTksKPiAtICAgICAg
ICAvKgo+IC0gICAgICAgICAqIElmIGJvb3RpbmcgdmlydHVhbGlzZWQsIG9yIGhvdC1vbmxpbmlu
ZyBhIENQVSwgc2libGluZyB0aHJlYWRzIGNhbgo+IC0gICAgICAgICAqIGF0dGVtcHQgQnJhbmNo
IFRhcmdldCBJbmplY3Rpb24gYWdhaW5zdCB0aGlzIGptcC4KPiAtICAgICAgICAgKgo+IC0gICAg
ICAgICAqIFdlJ3ZlIGdvdCBubyB1c2FibGUgc3RhY2sgc28gY2FuJ3QgdXNlIGEgUkVUUE9MSU5F
IHRodW5rLCBhbmQgYXJlCj4gLSAgICAgICAgICogZnVydGhlciB0aGFuIGRpc3AzMiBmcm9tIHRo
ZSBoaWdoIG1hcHBpbmdzIHNvIGNvdWxkbid0IHVzZQo+IC0gICAgICAgICAqIEpVTVBfVEhVTksg
ZXZlbiBpZiBpdCB3YXMgYSBub24tUkVUUE9MSU5FIHRodW5rLiAgRnVydGhlcm1vcmUsIGFuCj4g
LSAgICAgICAgICogTEZFTkNFIGlzbid0IG5lY2Vzc2FyaWx5IHNhZmUgdG8gdXNlIGF0IHRoaXMg
cG9pbnQuCj4gLSAgICAgICAgICoKPiAtICAgICAgICAgKiBBcyB0aGlzIGlzbid0IGEgaG90cGF0
aCwgdXNlIGEgZnVsbHkgc2VyaWFsaXNpbmcgZXZlbnQgdG8gcmVkdWNlCj4gLSAgICAgICAgICog
dGhlIHNwZWN1bGF0aW9uIHdpbmRvdyBhcyBtdWNoIGFzIHBvc3NpYmxlLiAgJWVieCBuZWVkcyBw
cmVzZXJ2aW5nCj4gLSAgICAgICAgICogZm9yIF9faGlnaF9zdGFydC4KPiAtICAgICAgICAgKi8K
PiAtICAgICAgICBtb3YgICAgICVlYngsICVlc2kKPiAtICAgICAgICBjcHVpZAo+IC0gICAgICAg
IG1vdiAgICAgJWVzaSwgJWVieAo+IC0jZW5kaWYKPiAtCj4gICAgICAgICAgam1wcSAgICAqJXJk
aQoKSSBjYW4gc2VlIHRoaXMgYmVpbmcgdW5uZWVkZWQgd2hlbiBydW5uaW5nIHZpcnR1YWxpemVk
LCBhcyB5b3Ugc2FpZAppbiByZXBseSB0byBXZWkuIEhvd2V2ZXIsIGZvciBob3Qtb25saW5pbmcg
KHdoZW4gb3RoZXIgQ1BVcyBtYXkgcnVuCnJhbmRvbSB2Q1BVLXMpIEkgZG9uJ3Qgc2VlIGhvdyB0
aGlzIGNhbiBzYWZlbHkgYmUgZHJvcHBlZC4gVGhlcmUncwpubyBzaW1pbGFyIGNvbmNlcm4gZm9y
IFMzIHJlc3VtZSwgYXMgdGhhd19kb21haW5zKCkgaGFwcGVucyBvbmx5CmFmdGVyIGVuYWJsZV9u
b25ib290X2NwdXMoKS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
