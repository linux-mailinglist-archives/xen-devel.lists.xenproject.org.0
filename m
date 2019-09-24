Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE966BC8FC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 15:36:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCkxa-00022M-QP; Tue, 24 Sep 2019 13:34:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCkxZ-00022D-BB
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 13:34:29 +0000
X-Inumbo-ID: 07c56416-ded0-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 07c56416-ded0-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 13:34:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 32934ACD9;
 Tue, 24 Sep 2019 13:34:27 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-41-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eddf7994-8c09-7d79-bbf9-f1518deec03f@suse.com>
Date: Tue, 24 Sep 2019 15:34:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914085251.18816-41-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 40/47] xen/sched: prepare per-cpupool
 scheduling granularity
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL2NwdXBvb2wuYwo+ICsrKyBiL3hlbi9jb21tb24vY3B1cG9vbC5jCj4gQEAgLTE3NSw2ICsx
NzUsOCBAQCBzdGF0aWMgc3RydWN0IGNwdXBvb2wgKmNwdXBvb2xfY3JlYXRlKAo+ICAgICAgICAg
ICAgICByZXR1cm4gTlVMTDsKPiAgICAgICAgICB9Cj4gICAgICB9Cj4gKyAgICBjLT5ncmFudWxh
cml0eSA9IHNjaGVkX2dyYW51bGFyaXR5Owo+ICsgICAgYy0+b3B0X2dyYW51bGFyaXR5ID0gb3B0
X3NjaGVkX2dyYW51bGFyaXR5Owo+ICAKPiAgICAgICpxID0gYzsKPiAgCj4gZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vc2NoZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+IGluZGV4IGU1
Yjc2NzhkYzAuLmIzYzFhYTA4MjEgMTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5j
Cj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4gQEAgLTU2LDcgKzU2LDggQEAgaW50IHNj
aGVkX3JhdGVsaW1pdF91cyA9IFNDSEVEX0RFRkFVTFRfUkFURUxJTUlUX1VTOwo+ICBpbnRlZ2Vy
X3BhcmFtKCJzY2hlZF9yYXRlbGltaXRfdXMiLCBzY2hlZF9yYXRlbGltaXRfdXMpOwo+ICAKPiAg
LyogTnVtYmVyIG9mIHZjcHVzIHBlciBzdHJ1Y3Qgc2NoZWRfdW5pdC4gKi8KPiAtc3RhdGljIHVu
c2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IHNjaGVkX2dyYW51bGFyaXR5ID0gMTsKPiArZW51bSBz
Y2hlZF9ncmFuIF9fcmVhZF9tb3N0bHkgb3B0X3NjaGVkX2dyYW51bGFyaXR5ID0gU0NIRURfR1JB
Tl9jcHU7Cj4gK3Vuc2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IHNjaGVkX2dyYW51bGFyaXR5ID0g
MTsKClNlZWluZyB0aGUgcmVwbGFjZW1lbnRzIHlvdSBkbyBmdXJ0aGVyIGRvd24sIGFyZSB0aGVz
ZSB2YXJpYWJsZXMKbmVlZGVkIGF0IGFsbCBhbnltb3JlIG91dHNpZGUgb2YgY3B1cG9vbC5jPyBJ
ZiBub3QsIHRoZXkgc2hvdWxkCnByb2JhYmx5IG1vdmUgdGhlcmUsIGFuZCByZW1haW4gLyBiZWNv
bWUgc3RhdGljPwoKPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAo+ICsrKyBiL3hl
bi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCj4gQEAgLTI1LDYgKzI1LDE1IEBAIGV4dGVybiBpbnQg
c2NoZWRfcmF0ZWxpbWl0X3VzOwo+ICAvKiBTY2hlZHVsaW5nIHJlc291cmNlIG1hc2suICovCj4g
IGV4dGVybiBjb25zdCBjcHVtYXNrX3QgKnNjaGVkX3Jlc19tYXNrOwo+ICAKPiArLyogTnVtYmVy
IG9mIHZjcHVzIHBlciBzdHJ1Y3Qgc2NoZWRfdW5pdC4gKi8KPiArZW51bSBzY2hlZF9ncmFuIHsK
PiArICAgIFNDSEVEX0dSQU5fY3B1LAo+ICsgICAgU0NIRURfR1JBTl9jb3JlLAo+ICsgICAgU0NI
RURfR1JBTl9zb2NrZXQKPiArfTsKClNlZWluZyB0aGUgYWxtb3N0IGFic3VyZCBhcnJhbmdlbWVu
dCBvbiBteSBBTUQgRmFtMTcgc3lzdGVtICgxMjggQ1BVcwpwZXIgQ3JlZGl0MiBydW5xdWV1ZSwg
Zm9yIGEgdG90YWwgb2YgdHdvIHJ1bnF1ZXVlcykgSSByZWFsbHkgd29uZGVyCndoZXRoZXIgdGhl
cmUgc2hvdWxkbid0IGJlIGEgcGxhbiBmb3IgYSBmdXJ0aGVyIGludGVybWVkaWF0ZQpncmFudWxh
cml0eSBiZXR3ZWVuICJjb3JlIiBhbmQgInNvY2tldCIuIFRoZSBvdGhlciBkYXkgSSBkaWQgbm90
aWNlCkxpbnV4IGhhcyBnYWluZWQgdGhlIGNvbmNlcHQgb2YgImRpZSIsIHdoaWNoIHdvdWxkIGJy
aW5nIHRoZQphcnJhbmdlbWVudCB0byBhIG1vcmUgcmVhc29uYWJsZSA4IHJ1bnF1ZXVlcyBvZiAz
MiBDUFVzIGVhY2ggb24gdGhpcwpzeXN0ZW0uIChJJ20gdGFraW5nIENyZWRpdDIgYXMgYSByZWZl
cmVuY2UgaGVyZSBvbmx5LikKCj4gQEAgLTUzMiw2ICs1NDIsOCBAQCBzdHJ1Y3QgY3B1cG9vbAo+
ICAgICAgc3RydWN0IGNwdXBvb2wgICAqbmV4dDsKPiAgICAgIHN0cnVjdCBzY2hlZHVsZXIgKnNj
aGVkOwo+ICAgICAgYXRvbWljX3QgICAgICAgICByZWZjbnQ7Cj4gKyAgICB1bnNpZ25lZCBpbnQg
ICAgIGdyYW51bGFyaXR5Owo+ICsgICAgZW51bSBzY2hlZF9ncmFuICBvcHRfZ3JhbnVsYXJpdHk7
CgpJJ2QgbGlrZSB0byBzdWdnZXN0IHRvIGF2b2lkIGludHJvZHVjaW5nIG9wdF8qIGlkZW50aWZp
ZXJzIG5vdApkaXJlY3RseSBkcml2ZW4gYnkgY29tbWFuZCBsaW5lIG9wdGlvbnMuIFRoYXQnbGwg
anVzdCBlbmQgdXAKY29uZnVzaW5nIHBlb3BsZS4gSSBoYXZlIHRvIGFkbWl0IEknbSBoYXZpbmcg
dHJvdWJsZSBjb21pbmcgdXAgd2l0aApnb29kIG5hbWVzIGZvciBib3RoIGZpZWxkcywgc28gSSdk
IGxpa2UgdG8gYXNrIHdoZXRoZXIgeW91IHJlYWxseQpuZWVkIGJvdGggLSBpc24ndCB3aGF0J3Mg
Y2FsbGVkICJncmFudWxhcml0eSIgYWJvdmUgYSBmdW5jdGlvbiBvZgoib3B0X2dyYW51bGFyaXR5
Ij8gT3IgYWx0ZXJuYXRpdmVseSBjb3VsZG4ndCB3aGF0J3MgbmFtZWQKImdyYW51bGFyaXR5IiBu
b3cgYmUgYWx3YXlzIHRha2VuIGZyb20gc3RydWN0IHNjaGVkX3Jlc291cmNlPyBJCnRha2UgaXQg
dGhhdCB3aXRoaW4gYSBwb29sIGFsbCBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgaW5zdGFuY2VzCndv
dWxkIGhhdmUgdGhlIHNhbWUgbnVtZXJpYyBncmFudWxhcml0eSB2YWx1ZS4gQW5kIEkgZnVydGhl
ciB0YWtlCml0IHRoYXQgc3RydWN0IHNjaGVkX3Jlc291cmNlIGluc3RhbmNlcyB3b24ndCBmcmVl
bHkgbW92ZSBiZXR3ZWVuCmNwdXBvb2xzIChhbmQgaGVuY2UgY291bGQgZS5nLiBiZSBhc3NvY2lh
dGVkIHdpdGggdGhlaXIgcG9vbCBvbgpsaW5rZWQgbGlzdCwgdGhlIGhlYWQgb2Ygd2hpY2ggbGl2
ZXMgaW4gc3RydWN0IGNwdXBvb2wpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
