Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9775EAFA6C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 12:33:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7ztP-0008PK-EN; Wed, 11 Sep 2019 10:30:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7ztN-0008PE-Nx
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 10:30:29 +0000
X-Inumbo-ID: 2c39b834-d47f-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c39b834-d47f-11e9-978d-bc764e2007e4;
 Wed, 11 Sep 2019 10:30:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 50AC0AF70;
 Wed, 11 Sep 2019 10:30:27 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-31-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a637c5a4-d1f6-bf43-6eb2-c9702a79ca48@suse.com>
Date: Wed, 11 Sep 2019 12:30:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-31-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 30/48] xen/sched: introduce
 unit_runnable_state()
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNjo1OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL3NjaGVkdWxlLmMKPiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBAQCAtMjY2LDcg
KzI2Niw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzY2hlZF91bml0X3J1bnN0YXRlX2NoYW5nZShz
dHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCwKPiAgICAgIHN0cnVjdCB2Y3B1ICp2ID0gdW5pdC0+dmNw
dV9saXN0Owo+ICAKPiAgICAgIGlmICggcnVubmluZyApCj4gLSAgICAgICAgdmNwdV9ydW5zdGF0
ZV9jaGFuZ2UodiwgUlVOU1RBVEVfcnVubmluZywgbmV3X2VudHJ5X3RpbWUpOwo+ICsgICAgICAg
IHZjcHVfcnVuc3RhdGVfY2hhbmdlKHYsIHYtPm5ld19zdGF0ZSwgbmV3X2VudHJ5X3RpbWUpOwoK
U3RyaWN0bHkgc3BlYWtpbmcgdGhpcyBpcyB3cm9uZyB3aGVuIHRoZXJlJ3Mgbm8gYWN0dWFsIHN0
YXRlCmNoYW5nZSwgYXMgdGhlIHN0YXRlIGVudHJ5IHRpbWUgdGhlbiBzaG91bGRuJ3QgY2hhbmdl
LiBRdWl0ZQpwb3NzaWJseSB0aGlzIHdvdWxkIGJlIG1lcmVseSBhIGNvc21ldGljIGlzc3VlIHRo
b3VnaC4KCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKPiArKysgYi94ZW4vaW5j
bHVkZS94ZW4vc2NoZWQtaWYuaAo+IEBAIC03NSw2ICs3NSwyMCBAQCBzdGF0aWMgaW5saW5lIGJv
b2wgdW5pdF9ydW5uYWJsZShjb25zdCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKPiAgICAgIHJl
dHVybiB2Y3B1X3J1bm5hYmxlKHVuaXQtPnZjcHVfbGlzdCk7Cj4gIH0KPiAgCj4gK3N0YXRpYyBp
bmxpbmUgYm9vbCB1bml0X3J1bm5hYmxlX3N0YXRlKGNvbnN0IHN0cnVjdCBzY2hlZF91bml0ICp1
bml0KQo+ICt7Cj4gKyAgICBzdHJ1Y3QgdmNwdSAqdjsKPiArICAgIGJvb2wgcnVubmFibGU7Cj4g
Kwo+ICsgICAgdiA9IHVuaXQtPnZjcHVfbGlzdDsKPiArICAgIHJ1bm5hYmxlID0gdmNwdV9ydW5u
YWJsZSh2KTsKPiArCj4gKyAgICB2LT5uZXdfc3RhdGUgPSBydW5uYWJsZSA/IFJVTlNUQVRFX3J1
bm5pbmcKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogKHYtPnBhdXNlX2ZsYWdzICYg
VlBGX2Jsb2NrZWQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID8gUlVOU1RBVEVf
YmxvY2tlZCA6IFJVTlNUQVRFX29mZmxpbmU7Cj4gKyAgICByZXR1cm4gcnVubmFibGU7Cj4gK30K
CkVzcGVjaWFsbHkgZm9yIHVuZGVyc3RhbmRpbmcgdGhlIChjb3JyZWN0bmVzcyBvZiB0aGUpIGNy
ZWRpdDEKY2hhbmdlcyBpdCB3b3VsZCBiZSByYXRoZXIgaGVscGZ1bCBpZiBvbmNlIGFnYWluIHRo
aXMgZnVuY3Rpb24KYWN0dWFsbHkgaXRlcmF0ZWQgb3ZlciBhbGwgdkNQVS1zIHJpZ2h0IGF3YXkg
KGV2ZW4gaWYgdGhlcmUncwpvbmx5IG9uZSBwZXIgdW5pdCByaWdodCBub3cpLCB0byBzZWUgaG93
IHRoZWlyIHZhcnlpbmcgc3RhdGVzCmdldCBjb21iaW5lZC4KCj4gLS0tIGEveGVuL2luY2x1ZGUv
eGVuL3NjaGVkLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+IEBAIC0xNzQsNiAr
MTc0LDcgQEAgc3RydWN0IHZjcHUKPiAgICAgICAgICBYRU5fR1VFU1RfSEFORExFKHZjcHVfcnVu
c3RhdGVfaW5mb19jb21wYXRfdCkgY29tcGF0Owo+ICAgICAgfSBydW5zdGF0ZV9ndWVzdDsgLyog
Z3Vlc3QgYWRkcmVzcyAqLwo+ICAjZW5kaWYKPiArICAgIGludCAgICAgICAgICAgICAgbmV3X3N0
YXRlOwoKSSByZWFsaXplIGl0cyBjb3VudGVycGFydCAod3JvbmdseSkgaXMgcGxhaW4gaW50IGlu
IHRoZSBwdWJsaWMKaW50ZXJmYWNlIC0gSSB0aGluayBpdCBzaG91bGQgYmUgdW5zaWduZWQgaW50
IGhlcmUgYW5kIHVpbnQzMl90CnRoZXJlLiBJJ20gcG9uZGVyaW5nIHdoZXRoZXIgdG8gZG8gYSBz
d2lwZSBhY3Jvc3MgYWxsIHB1YmxpYwpoZWFkZXJzIHRvIHJlcGxhY2UgYWxsIHVzZXMgb2YgcGxh
aW4gaW50IChhbmQgYWxpa2UpIHdpdGgKZml4ZWQgd2lkdGggdHlwZXMuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
