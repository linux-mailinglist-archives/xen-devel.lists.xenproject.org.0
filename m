Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 158BE12F9B1
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 16:26:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inOnF-0000sE-QV; Fri, 03 Jan 2020 15:23:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inOnE-0000s8-IV
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 15:23:16 +0000
X-Inumbo-ID: f6795bba-2e3c-11ea-a4c4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6795bba-2e3c-11ea-a4c4-12813bfff9fa;
 Fri, 03 Jan 2020 15:23:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3F472AC69;
 Fri,  3 Jan 2020 15:23:15 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191224132616.47441-1-roger.pau@citrix.com>
 <20191224132616.47441-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c3d2dd74-b1a3-9c92-d5b5-69807c97543b@suse.com>
Date: Fri, 3 Jan 2020 16:23:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191224132616.47441-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86/tlb: use Xen L0 assisted TLB flush
 when available
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTIuMjAxOSAxNDoyNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEBAIC0yMzUsNiAr
MjM2LDExIEBAIHZvaWQgZmx1c2hfYXJlYV9tYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgY29u
c3Qgdm9pZCAqdmEsIHVuc2lnbmVkIGludCBmbGFncykKPiAgICAgIHsKPiAgICAgICAgICBib29s
IGNwdXNfbG9ja2VkID0gZmFsc2U7Cj4gIAo+ICsgICAgICAgIGlmICggeGVuX2d1ZXN0ICYmCj4g
KyAgICAgICAgICAgICAhKGZsYWdzICYgfihGTFVTSF9UTEIgfCBGTFVTSF9UTEJfR0xPQkFMIHwg
RkxVU0hfVkFfVkFMSUQpKSAmJgo+ICsgICAgICAgICAgICAgIXhnX2ZsdXNoX3RsYnMoKSApCj4g
KyAgICAgICAgICAgIHJldHVybjsKCldpdGggdGhlIGFic3RyYWN0aW9uIGludHJvZHVjZWQgcmVj
ZW50bHkgYnkgV2VpIEkgdGhpbmsgdGhpcyB3YW50cwp0byBiZSBhIHBlci1oeXBlcnZpc29yIGhv
b2ssIHdoaWNoIHdvdWxkIGFsc28gZ2V0IHRoZSBsaW5lYXIgYWRkcmVzcwpwYXNzZWQsIGFuZCB3
aGljaCB3b3VsZCB0aGVuIChyYXRoZXIgdGhhbiBoZXJlKSBkZWNpZGUgd2hldGhlciBpdAp3YW50
cyB0byBhbHNvIGhhbmRsZSBhIHNpbmdsZSBwYWdlIGZsdXNoIGEgZGlmZmVyZW50IHdheS4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
