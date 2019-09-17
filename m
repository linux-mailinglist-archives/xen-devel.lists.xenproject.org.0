Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B8BB4C47
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 12:52:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAB3F-0004S2-Sa; Tue, 17 Sep 2019 10:49:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VJ/=XM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAB3E-0004Rr-Hd
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 10:49:40 +0000
X-Inumbo-ID: c4e5592c-d938-11e9-9606-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4e5592c-d938-11e9-9606-12813bfff9fa;
 Tue, 17 Sep 2019 10:49:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 19747AF0D;
 Tue, 17 Sep 2019 10:49:05 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
 <1568272949-1086-16-git-send-email-chao.gao@intel.com>
 <f5d22eed-42c0-5d99-7adc-a46ac52a9639@suse.com>
 <20190917090128.GB10190@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b5cbb123-0093-138d-b898-6739c43668c9@suse.com>
Date: Tue, 17 Sep 2019 12:49:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190917090128.GB10190@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10 15/16] microcode: disable late loading
 if CPUs are affected by BDF90
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDkuMjAxOSAxMTowMSwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gRnJpLCBTZXAgMTMsIDIw
MTkgYXQgMTE6MjI6NTlBTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEyLjA5LjIw
MTkgMDk6MjIsIENoYW8gR2FvIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9t
aWNyb2NvZGUuaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9taWNyb2NvZGUuaAo+Pj4g
QEAgLTMwLDYgKzMwLDcgQEAgc3RydWN0IG1pY3JvY29kZV9vcHMgewo+Pj4gICAgICBib29sICgq
bWF0Y2hfY3B1KShjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCk7Cj4+PiAgICAg
IGVudW0gbWljcm9jb2RlX21hdGNoX3Jlc3VsdCAoKmNvbXBhcmVfcGF0Y2gpKAo+Pj4gICAgICAg
ICAgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqbmV3LCBjb25zdCBzdHJ1Y3QgbWljcm9j
b2RlX3BhdGNoICpvbGQpOwo+Pj4gKyAgICBib29sICgqaXNfYmxhY2tsaXN0ZWQpKHZvaWQpOwo+
Pgo+PiBXaHkgYSBob29rIHJhdGhlciB0aGFuIGEgYm9vbGVhbiBmbGFnLCB3aGljaCBjb3VsZCBi
ZSBzZXQgYnkKPj4gbWljcm9jb2RlX3VwZGF0ZV9vbmUoKSAoYXMgaW52b2tlZCBkdXJpbmcgQVAg
YnJpbmd1cCk/Cj4gCj4gSG93IGFib3V0IHNldCB0aGUgYm9vbGVhbiBmbGFnIGluIEludGVsX2Vy
cmF0YV93b3JrYXJvdW5kcz8KCldoZXJldmVyIGl0IGVuZHMgdXAgd29ya2luZyBiZXN0LiBNeSBz
dWdnZXN0aW9uIHdhcyBqdXN0IGEgd2lsZApndWVzcy4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
