Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3459916846D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 18:08:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5Bkr-0004pH-Vd; Fri, 21 Feb 2020 17:06:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j5Bkq-0004pB-3A
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 17:06:20 +0000
X-Inumbo-ID: 7a34f102-54cc-11ea-86b9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a34f102-54cc-11ea-86b9-12813bfff9fa;
 Fri, 21 Feb 2020 17:06:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 59079ACBD;
 Fri, 21 Feb 2020 17:06:18 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-8-dwmw2@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f7cce359-ed4a-7b86-af23-7400b8784acd@suse.com>
Date: Fri, 21 Feb 2020 18:06:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200201003303.2363081-8-dwmw2@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 8/8] x86/setup: lift dom0 creation out into
 create_dom0() function
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDIuMjAyMCAwMTozMywgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9zZXR1cC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKPiBAQCAtNjc4LDYg
KzY3OCw5MiBAQCBzdGF0aWMgdW5zaWduZWQgaW50IF9faW5pdCBjb3B5X2Jpb3NfZTgyMChzdHJ1
Y3QgZTgyMGVudHJ5ICptYXAsIHVuc2lnbmVkIGludCBsaQo+ICAgICAgcmV0dXJuIG47Cj4gIH0K
PiAgCj4gK3N0YXRpYyBzdHJ1Y3QgZG9tYWluICogX19pbml0IGNyZWF0ZV9kb20wKGNvbnN0IG1v
ZHVsZV90ICppbWFnZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgbG9uZyBoZWFkcm9vbSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbW9kdWxlX3QgKmluaXRyZCwgY2hhciAqa2V4dHJhLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjaGFyICpsb2FkZXIpCgpDYW4gYW55
IG9mIHRoZXNlIGxhc3QgdGhyZWUgYmUgcG9pbnRlci10by1jb25zdD8KCj4gK3sKPiArICAgIHN0
cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiBkb20wX2NmZyA9IHsKPiArICAgICAgICAuZmxh
Z3MgPSBJU19FTkFCTEVEKENPTkZJR19UQk9PVCkgPyBYRU5fRE9NQ1RMX0NERl9zM19pbnRlZ3Jp
dHkgOiAwLAo+ICsgICAgICAgIC5tYXhfZXZ0Y2huX3BvcnQgPSAtMSwKPiArICAgICAgICAubWF4
X2dyYW50X2ZyYW1lcyA9IC0xLAo+ICsgICAgICAgIC5tYXhfbWFwdHJhY2tfZnJhbWVzID0gLTEs
Cj4gKyAgICB9Owo+ICsgICAgc3RydWN0IGRvbWFpbiAqZDsKPiArICAgIGNoYXIgKmNtZGxpbmU7
Cj4gKwo+ICsgICAgaWYgKCBvcHRfZG9tMF9wdmggKQo+ICsgICAgewo+ICsgICAgICAgIGRvbTBf
Y2ZnLmZsYWdzIHw9IChYRU5fRE9NQ1RMX0NERl9odm0gfAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAoKGh2bV9oYXBfc3VwcG9ydGVkKCkgJiYgIW9wdF9kb20wX3NoYWRvdykgPwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgWEVOX0RPTUNUTF9DREZfaGFwIDogMCkpOwo+ICsK
PiArICAgICAgICBkb20wX2NmZy5hcmNoLmVtdWxhdGlvbl9mbGFncyB8PQo+ICsgICAgICAgICAg
ICBYRU5fWDg2X0VNVV9MQVBJQyB8IFhFTl9YODZfRU1VX0lPQVBJQyB8IFhFTl9YODZfRU1VX1ZQ
Q0k7Cj4gKyAgICB9Cj4gKyAgICBkb20wX2NmZy5tYXhfdmNwdXMgPSBkb20wX21heF92Y3B1cygp
OwoKQ2FuIHRoaXMgbm90IGJlIHBhcnQgb2YgdGhlIGluaXRpYWxpemVyIG5vdz8KCj4gKyAgICBp
ZiAoIGlvbW11X2VuYWJsZWQgKQo+ICsgICAgICAgIGRvbTBfY2ZnLmZsYWdzIHw9IFhFTl9ET01D
VExfQ0RGX2lvbW11Owo+ICsKPiArICAgIC8qIENyZWF0ZSBpbml0aWFsIGRvbWFpbiAwLiAqLwo+
ICsgICAgZCA9IGRvbWFpbl9jcmVhdGUoZ2V0X2luaXRpYWxfZG9tYWluX2lkKCksICZkb20wX2Nm
ZywgIXB2X3NoaW0pOwo+ICsgICAgaWYgKCBJU19FUlIoZCkgfHwgKGFsbG9jX2RvbTBfdmNwdTAo
ZCkgPT0gTlVMTCkgKQo+ICsgICAgICAgIHBhbmljKCJFcnJvciBjcmVhdGluZyBkb21haW4gMFxu
Iik7Cj4gKwo+ICsgICAgLyogR3JhYiB0aGUgRE9NMCBjb21tYW5kIGxpbmUuICovCj4gKyAgICBj
bWRsaW5lID0gKGNoYXIgKikoaW1hZ2UtPnN0cmluZyA/IF9fdmEoaW1hZ2UtPnN0cmluZykgOiBO
VUxMKTsKCklzIHRoaXMgY2FzdCBuZWVkZWQ/IChJIGtub3cgeW91J3JlIG9ubHkgbW92aW5nIHRo
ZSBjb2RlLCBidXQgc29tZQplYXN5IGNsZWFudXAgd291bGQgYmUgbmljZSBhbnl3YXkuKQoKPiAr
ICAgIGlmICggKGNtZGxpbmUgIT0gTlVMTCkgfHwgKGtleHRyYSAhPSBOVUxMKSApCgpTaW1pbGFy
bHkgaGVyZSB5b3UgbWF5IHdhbnQgdG8gY29uc2lkZXIgc2hvcnRlbmluZyB0bwoKICAgIGlmICgg
Y21kbGluZSB8fCBrZXh0cmEgKQoKQXQgbGVhc3Qgb25lIG1vcmUgc2ltaWxhciBjYXNlIGZ1cnRo
ZXIgZG93bi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
