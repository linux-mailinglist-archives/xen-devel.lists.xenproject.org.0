Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1C9C06C1
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 15:57:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDqi7-0001Cj-NS; Fri, 27 Sep 2019 13:55:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDqi6-0001CC-AX
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 13:55:02 +0000
X-Inumbo-ID: 657d08e2-e12e-11e9-9679-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 657d08e2-e12e-11e9-9679-12813bfff9fa;
 Fri, 27 Sep 2019 13:55:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3BF62ABE3;
 Fri, 27 Sep 2019 13:54:59 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1569506015-26938-1-git-send-email-chao.gao@intel.com>
 <1569506015-26938-7-git-send-email-chao.gao@intel.com>
 <c9b53200-3b90-7f93-21f8-dd715965546a@suse.com>
 <20190927135330.GA5570@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1cc3a02b-c73a-d2bd-e96a-3bfa28ddc925@suse.com>
Date: Fri, 27 Sep 2019 15:55:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190927135330.GA5570@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v11 6/7] microcode: rendezvous CPUs in NMI
 handler and load ucode
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMjAxOSAxNTo1MywgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gRnJpLCBTZXAgMjcsIDIw
MTkgYXQgMTI6MTk6MjJQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI2LjA5LjIw
MTkgMTU6NTMsIENoYW8gR2FvIHdyb3RlOgo+Pj4gQEAgLTQyMCwxNCArNDk4LDIzIEBAIHN0YXRp
YyBpbnQgY29udHJvbF90aHJlYWRfZm4oY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0
Y2gpCj4+PiAgICAgICAgICByZXR1cm4gcmV0Owo+Pj4gICAgICB9Cj4+PiAgCj4+PiAtICAgIC8q
IExldCBwcmltYXJ5IHRocmVhZHMgbG9hZCB0aGUgZ2l2ZW4gdWNvZGUgdXBkYXRlICovCj4+PiAt
ICAgIHNldF9zdGF0ZShMT0FESU5HX0VOVEVSKTsKPj4+IC0KPj4+ICsgICAgLyogQ29udHJvbCB0
aHJlYWQgbG9hZHMgdWNvZGUgZmlyc3Qgd2hpbGUgb3RoZXJzIGFyZSBpbiBOTUkgaGFuZGxlci4g
Ki8KPj4+ICAgICAgcmV0ID0gbWljcm9jb2RlX29wcy0+YXBwbHlfbWljcm9jb2RlKHBhdGNoKTsK
Pj4+ICAgICAgaWYgKCAhcmV0ICkKPj4+ICAgICAgICAgIGF0b21pY19pbmMoJmNwdV91cGRhdGVk
KTsKPj4+ICAgICAgYXRvbWljX2luYygmY3B1X291dCk7Cj4+PiAgCj4+PiArICAgIGlmICggcmV0
ID09IC1FSU8gKQo+Pj4gKyAgICB7Cj4+PiArICAgICAgICBwcmludGsoWEVOTE9HX0VSUgo+Pj4g
KyAgICAgICAgICAgICAgICJMYXRlIGxvYWRpbmcgYWJvcnRlZDogQ1BVJXUgZmFpbGVkIHRvIHVw
ZGF0ZSB1Y29kZVxuIiwgY3B1KTsKPj4+ICsgICAgICAgIHNldF9zdGF0ZShMT0FESU5HX0VYSVQp
Owo+Pj4gKyAgICAgICAgcmV0dXJuIHJldDsKPj4+ICsgICAgfQo+Pj4gKwo+Pj4gKyAgICAvKiBM
ZXQgcHJpbWFyeSB0aHJlYWRzIGxvYWQgdGhlIGdpdmVuIHVjb2RlIHVwZGF0ZSAqLwo+Pj4gKyAg
ICBzZXRfc3RhdGUoTE9BRElOR19FTlRFUik7Cj4+Cj4+IFdoaWxlIHRoZSBkZXNjcmlwdGlvbiBn
b2VzIHRvIHNvbWUgbGVuZ3RocyB0byBleHBsYWluIHRoaXMgb3JkZXJpbmcgb2YKPj4gdXBkYXRl
cywgSSBzdGlsbCBkb24ndCByZWFsbHkgc2VlIHRoZSBwb2ludDogSG93IGlzIGl0IGJldHRlciBm
b3IgdGhlCj4+IGNvbnRyb2wgQ1BVIHRvIGhhdmUgdXBkYXRlZCBpdHMgdWNvZGUgZWFybHkgYW5k
IHRoZW4gaGl0IGFuIE5NSSBiZWZvcmUKPj4gdGhlIG90aGVyIENQVXMgaGF2ZSBldmVuIHN0YXJ0
ZWQgdXBkYXRpbmcsIHRoYW4gdGhlIG90aGVyIHdheSBhcm91bmQKPj4gaW4gdGhlIG9wcG9zaXRl
IGNhc2U/Cj4gCj4gV2Ugd2FudCB0byBiZSBjb25zZXJ2YXRpdmUgaGVyZS4gSWYgYW4gdWNvZGUg
aXMgdG8gdXBkYXRlIHNvbWV0aGluZwo+IHNoYXJlZCBieSBhIHdob2xlIHNvY2tldCwgZm9yIHRo
ZSBsYXR0ZXIgY2FzZSwgY29udHJvbCB0aHJlYWQgbWF5Cj4gYmUgYWNjZXNzaW5nIHRoaW5ncyB0
aGF0IGFyZSBiZWluZyB1cGRhdGluZyBieSB0aGUgdWNvZGUgbG9hZGluZyBvbgo+IG90aGVyIGNv
cmVzLiBJdCBpcyBub3Qgc2FmZSwganVzdCBsaWtlIHNpYmxpbmcgdGhyZWFkIGlzbid0IGV4cGVj
dGVkCj4gdG8gYWNjZXNzIGZlYXR1cmVzIGV4cG9zZWQgYnkgdGhlIG9sZCB1Y29kZSB3aGVuIHBy
aW1hcnkgdGhyZWFkIGlzCj4gbG9hZGluZyB1Y29kZS4KCkFoIHllcywgY29uc2lkZXJpbmcgYSBz
b2NrZXQtd2lkZSBlZmZlY3QgZGlkbid0IG9jY3VyIHRvIG1lIChhbHRob3VnaAppdCBzaG91bGQg
aGF2ZSkuIFNvIGlmIHlvdSBtZW50aW9uIHRoaXMgYXNwZWN0IGluIHRoZSBkZXNjcmlwdGlvbiwg
SQp0aGluayBJJ20gZ29pbmcgdG8gYmUgZmluZSB3aXRoIHRoZSBjaGFuZ2UgaW4gdGhpcyByZWdh
cmQuIFlldCAoYXMgc28Kb2Z0ZW4pIHRoaXMgcmFpc2VzIGFub3RoZXIgcXVlc3Rpb246IFdoYXQg
YWJvdXQgInNlY29uZGFyeSIgc29ja2V0cz8KU2hvdWxkbid0IHdlIGVudGVydGFpbiBhIHNpbWls
YXIgdHdvLXN0ZXAgYXBwcm9hY2ggdGhlcmUgdGhlbj8KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
