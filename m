Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31869C02A8
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 11:48:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDmq6-0002l8-R6; Fri, 27 Sep 2019 09:47:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDmq5-0002l0-1L
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 09:47:01 +0000
X-Inumbo-ID: c05ef914-e10b-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id c05ef914-e10b-11e9-8628-bc764e2007e4;
 Fri, 27 Sep 2019 09:47:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AFCE8ABE3;
 Fri, 27 Sep 2019 09:46:59 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-25-jgross@suse.com>
 <d5dbedb2c62b2bec4cfd67c2a447a66fa3c7a279.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9a27008a-f8a1-5929-28dc-e100dff9553c@suse.com>
Date: Fri, 27 Sep 2019 11:46:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d5dbedb2c62b2bec4cfd67c2a447a66fa3c7a279.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 24/46] xen: switch from for_each_vcpu()
 to for_each_sched_unit()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMTkgMTE6MzIsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIEZyaSwgMjAxOS0w
OS0yNyBhdCAwOTowMCArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gV2hlcmUgYXBwcm9w
cmlhdGUgc3dpdGNoIGZyb20gZm9yX2VhY2hfdmNwdSgpIHRvCj4+IGZvcl9lYWNoX3NjaGVkX3Vu
aXQoKQo+PiBpbiBvcmRlciB0byBwcmVwYXJlIGNvcmUgc2NoZWR1bGluZy4KPj4KPj4gQXMgaXQg
aXMgYmVuZWZpY2lhbCBvbmNlIGhlcmUgYW5kIGZvciBzdXJlIGluIGZ1dHVyZSBhZGQgYQo+PiB1
bml0X3NjaGVkdWxlcigpIGhlbHBlciBhbmQgbGV0IHZjcHVfc2NoZWR1bGVyKCkgdXNlIGl0Lgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Cj4g
UmV2aWV3ZWQtYnk6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4gCj4gT25l
IHRoaW5nIEkgc3BvdHRlZCBpcyB0aGF0LCBoZXJlLi4uCj4gCj4+IC0tLSBhL3hlbi9jb21tb24v
c2NoZWR1bGUuYwo+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAgLTE1NywyNiAr
MTU3LDMyIEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IHNjaGVkdWxlcgo+PiAqZG9tX3NjaGVkdWxl
cihjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQo+PiAgICAgICByZXR1cm4gJm9wczsKPj4gICB9Cj4+
ICAgCj4+IC1zdGF0aWMgaW5saW5lIHN0cnVjdCBzY2hlZHVsZXIgKnZjcHVfc2NoZWR1bGVyKGNv
bnN0IHN0cnVjdCB2Y3B1ICp2KQo+PiArc3RhdGljIGlubGluZSBzdHJ1Y3Qgc2NoZWR1bGVyICp1
bml0X3NjaGVkdWxlcihjb25zdCBzdHJ1Y3QKPj4gc2NoZWRfdW5pdCAqdW5pdCkKPj4gICB7Cj4+
IC0gICAgc3RydWN0IGRvbWFpbiAqZCA9IHYtPmRvbWFpbjsKPj4gKyAgICBzdHJ1Y3QgZG9tYWlu
ICpkID0gdW5pdC0+ZG9tYWluOwo+PiAgIAo+PiAgICAgICBpZiAoIGxpa2VseShkLT5jcHVwb29s
ICE9IE5VTEwpICkKPj4gICAgICAgICAgIHJldHVybiBkLT5jcHVwb29sLT5zY2hlZDsKPj4gICAK
Pj4gICAgICAgLyoKPj4gLSAgICAgKiBJZiBkLT5jcHVwb29sIGlzIE5VTEwsIHRoaXMgaXMgYSB2
Q1BVIG9mIHRoZSBpZGxlIGRvbWFpbi4gQW5kCj4+IHRoaXMKPj4gKyAgICAgKiBJZiBkLT5jcHVw
b29sIGlzIE5VTEwsIHRoaXMgaXMgYSB1bml0IG9mIHRoZSBpZGxlIGRvbWFpbi4gQW5kCj4+IHRo
aXMKPj4gICAgICAgICogY2FzZSBpcyBzcGVjaWFsIGJlY2F1c2UgdGhlIGlkbGUgZG9tYWluIGRv
ZXMgbm90IHJlYWxseQo+PiBiZWxvbmcgdG8KPj4gICAgICAgICogYSBjcHVwb29sIGFuZCwgaGVu
Y2UsIGRvZXNuJ3QgcmVhbGx5IGhhdmUgYSBzY2hlZHVsZXIpLiBJbgo+PiBmYWN0LCBpdHMKPj4g
LSAgICAgKiB2Q1BVcyAobWF5KSBydW4gb24gcENQVXMgd2hpY2ggYXJlIGluIGRpZmZlcmVudCBw
b29scywgd2l0aAo+PiBkaWZmZXJlbnQKPj4gKyAgICAgKiB1bml0cyAobWF5KSBydW4gb24gcENQ
VXMgd2hpY2ggYXJlIGluIGRpZmZlcmVudCBwb29scywgd2l0aAo+PiBkaWZmZXJlbnQKPj4gICAg
ICAgICogc2NoZWR1bGVycy4KPj4gICAgICAgICoKPj4gICAgICAgICogV2hhdCB3ZSB3YW50LCBp
biB0aGlzIGNhc2UsIGlzIHRoZSBzY2hlZHVsZXIgb2YgdGhlIHBDUFUKPj4gd2hlcmUgdGhpcwo+
PiAtICAgICAqIHBhcnRpY3VsYXIgaWRsZSB2Q1BVIGlzIHJ1bm5pbmcuIEFuZCwgc2luY2Ugdi0+
cHJvY2Vzc29yCj4+IG5ldmVyIGNoYW5nZXMKPj4gLSAgICAgKiBmb3IgaWRsZSB2Q1BVcywgaXQg
aXMgc2FmZSB0byB1c2UgaXQsIHdpdGggbm8gbG9ja3MsIHRvCj4+IGZpZ3VyZSB0aGF0IG91dC4K
Pj4gKyAgICAgKiBwYXJ0aWN1bGFyIGlkbGUgdW5pdCBpcyBydW5uaW5nLiBBbmQsIHNpbmNlIHVu
aXQtPnJlcyBuZXZlcgo+PiBjaGFuZ2VzCj4+ICsgICAgICogZm9yIGlkbGUgdW5pdHMsIGl0IGlz
IHNhZmUgdG8gdXNlIGl0LCB3aXRoIG5vIGxvY2tzLCB0bwo+PiBmaWd1cmUgdGhhdCBvdXQuCj4+
ICAgICAgICAqLwo+PiArCj4+ICAgICAgIEFTU0VSVChpc19pZGxlX2RvbWFpbihkKSk7Cj4+IC0g
ICAgcmV0dXJuIHBlcl9jcHUoc2NoZWR1bGVyLCB2LT5wcm9jZXNzb3IpOwo+PiArICAgIHJldHVy
biBwZXJfY3B1KHNjaGVkdWxlciwgdW5pdC0+cmVzLT5tYXN0ZXJfY3B1KTsKPj4KPiAuLi4gSSB0
aGluayB3ZSBoYXZlIGFuIGhlbHBlciBmb3IgYHVuaXQtPnJlcy0+bWFzdGVyX2NwdWAKPiAoc2No
ZWRfdW5pdF9tYXN0ZXIoKSk/Cj4gCj4gQnV0IEkgZG9uJ3QgdGhpbmsgdGhlIHBhdGNoL3Nlcmll
cyBpcyB3b3J0aCBhIHJlc3BpbiBmb3IgdGhpcy4gTWF5YmUsCj4gYWRkIGl0IHRvIHRoZSBjbGVh
bnVwIHNlcmllcz8KCkkgZG9uJ3QgdGhpbmsgc28uIFBhdGNoIDM2IHJlbW92ZXMgdGhlIG9wZW4g
Y29kaW5nIG9mCnNjaGVkX3VuaXRfbWFzdGVyKCkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
