Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F160D162A1C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 17:11:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j45PE-0003LO-Pz; Tue, 18 Feb 2020 16:07:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u3z7=4G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j45PE-0003LJ-23
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 16:07:28 +0000
X-Inumbo-ID: c12a0f91-5268-11ea-81bd-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c12a0f91-5268-11ea-81bd-12813bfff9fa;
 Tue, 18 Feb 2020 16:07:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D1E7BB303;
 Tue, 18 Feb 2020 16:07:25 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200217111740.7298-1-andrew.cooper3@citrix.com>
 <20200217111740.7298-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <16314a6e-b005-03bf-cffa-432d91701204@suse.com>
Date: Tue, 18 Feb 2020 17:07:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200217111740.7298-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] x86/nmi: Corrections and improvements
 to do_nmi_stats()
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

T24gMTcuMDIuMjAyMCAxMjoxNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYvbm1pLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbm1pLmMKPiBAQCAtNTg3LDI1ICs1ODcs
MjUgQEAgc3RhdGljIHZvaWQgZG9fbm1pX3RyaWdnZXIodW5zaWduZWQgY2hhciBrZXkpCj4gIAo+
ICBzdGF0aWMgdm9pZCBkb19ubWlfc3RhdHModW5zaWduZWQgY2hhciBrZXkpCj4gIHsKPiAtICAg
IGludCBpOwo+IC0gICAgc3RydWN0IGRvbWFpbiAqZDsKPiAtICAgIHN0cnVjdCB2Y3B1ICp2Owo+
ICsgICAgY29uc3Qgc3RydWN0IHZjcHUgKnY7Cj4gKyAgICB1bnNpZ25lZCBpbnQgY3B1Owo+ICsg
ICAgYm9vbCBwZW5kLCBtYXNrOwo+ICAKPiAgICAgIHByaW50aygiQ1BVXHROTUlcbiIpOwo+IC0g
ICAgZm9yX2VhY2hfb25saW5lX2NwdSAoIGkgKQo+IC0gICAgICAgIHByaW50aygiJTNkXHQlM2Rc
biIsIGksIG5taV9jb3VudChpKSk7Cj4gKyAgICBmb3JfZWFjaF9vbmxpbmVfY3B1ICggY3B1ICkK
PiArICAgICAgICBwcmludGsoIiUzZFx0JTNkXG4iLCBjcHUsIG5taV9jb3VudChjcHUpKTsKCiUz
dSB0d2ljZSB0aGVuIHBsZWFzZS4gV2l0aCB0aGlzClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CmJ1dCBJIGhhdmUgb25lIG1vcmUgcmVtYXJrOgoKPiAtICAgIGlm
ICggKChkID0gaGFyZHdhcmVfZG9tYWluKSA9PSBOVUxMKSB8fCAoZC0+dmNwdSA9PSBOVUxMKSB8
fAo+IC0gICAgICAgICAoKHYgPSBkLT52Y3B1WzBdKSA9PSBOVUxMKSApCj4gKyAgICBpZiAoICFo
YXJkd2FyZV9kb21haW4gfHwgIWhhcmR3YXJlX2RvbWFpbi0+dmNwdSB8fAo+ICsgICAgICAgICAh
KHYgPSBoYXJkd2FyZV9kb21haW4tPnZjcHVbMF0pICkKClBlcmhhcHMsIGp1c3QgZm9yIHJlYWRh
YmlsaXR5IGFuZCBjb25zaXN0ZW5jeSwgdXNlIGRvbWFpbl92Y3B1KCkKaGVyZT8KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
