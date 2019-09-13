Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3403CB22C1
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 16:59:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8n10-0006c1-Cm; Fri, 13 Sep 2019 14:57:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mE8E=XI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8n0y-0006bq-RS
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 14:57:36 +0000
X-Inumbo-ID: d1f48e12-d636-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1f48e12-d636-11e9-978d-bc764e2007e4;
 Fri, 13 Sep 2019 14:57:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7390AB8DC;
 Fri, 13 Sep 2019 14:57:34 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190913121400.23263-1-jgross@suse.com>
 <5136c292-9d18-e760-cf98-c24278e9ba06@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <8f0ae56b-b65e-d3c2-785d-29c2cdaf967f@suse.com>
Date: Fri, 13 Sep 2019 16:57:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5136c292-9d18-e760-cf98-c24278e9ba06@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] xen/sched: rework and rename
 vcpu_force_reschedule()
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMTkgMTY6NDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEzLjA5LjIwMTkgMTQ6
MTQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLQo+PiAtIENhcnZlZCBvdXQgZnJvbSBteSBj
b3JlIHNjaGVkdWxpbmcgc2VyaWVzCj4+IC0gUmV3b3JrZWQgdG8gYXZvaWQgZGVhZGxvY2sgd2hl
biAyIHZjcHVzIGFyZSB0cnlpbmcgdG8gbW9kaWZ5IGVhY2gKPj4gICAgb3RoZXJzIHBlcmlvZGlj
IHRpbWVycywgbGVhZGluZyB0byBhZGRyZXNzIGFsbCBjb21tZW50cyBieSBKYW4KPj4gICAgQmV1
bGljaC4KPiAKPiBPaCwgaW5kZWVkIC0gYSBtdXR1YWwgdmNwdV9wYXVzZSgpIGNhbid0IGVuZCAg
d2VsbC4KPiAKPj4gQEAgLTcyNCwyNCArNzI1LDYgQEAgc3RhdGljIHZvaWQgdmNwdV9taWdyYXRl
X2ZpbmlzaChzdHJ1Y3QgdmNwdSAqdikKPj4gICAgICAgdmNwdV93YWtlKHYpOwo+PiAgIH0KPj4g
ICAKPj4gLS8qCj4+IC0gKiBGb3JjZSBhIFZDUFUgdGhyb3VnaCBhIGRlc2NoZWR1bGUvcmVzY2hl
ZHVsZSBwYXRoLgo+PiAtICogRm9yIGV4YW1wbGUsIHVzaW5nIHRoaXMgd2hlbiBzZXR0aW5nIHRo
ZSBwZXJpb2RpYyB0aW1lciBwZXJpb2QgbWVhbnMgdGhhdAo+PiAtICogbW9zdCBwZXJpb2RpYy10
aW1lciBzdGF0ZSBuZWVkIG9ubHkgYmUgdG91Y2hlZCBmcm9tIHdpdGhpbiB0aGUgc2NoZWR1bGVy
Cj4+IC0gKiB3aGljaCBjYW4gdGh1cyBiZSBkb25lIHdpdGhvdXQgbmVlZCBmb3Igc3luY2hyb25p
c2F0aW9uLgo+PiAtICovCj4+IC12b2lkIHZjcHVfZm9yY2VfcmVzY2hlZHVsZShzdHJ1Y3QgdmNw
dSAqdikKPj4gLXsKPj4gLSAgICBzcGlubG9ja190ICpsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2Nr
X2lycSh2KTsKPj4gLQo+PiAtICAgIGlmICggdi0+aXNfcnVubmluZyApCj4+IC0gICAgICAgIHZj
cHVfbWlncmF0ZV9zdGFydCh2KTsKPj4gLQo+PiAtICAgIHZjcHVfc2NoZWR1bGVfdW5sb2NrX2ly
cShsb2NrLCB2KTsKPj4gLQo+PiAtICAgIHZjcHVfbWlncmF0ZV9maW5pc2godik7Cj4+IC19Cj4g
Cj4gU28gdGhlIGNvbW1lbnQgc3BlY2lmaWNhbGx5IHNhaWQgdGhpcyBhcHByb2FjaCB3YXMgY2hv
c2VuIHRvCj4gYXZvaWQgdGhlIG5lZWQgZm9yIHN5bmNocm9uaXphdGlvbi4gWW91IG5vdyBpbnRy
b2R1Y2UKPiBzeW5jaHJvbml6YXRpb24uIEknbSBub3Qgc2V2ZXJlbHkgb3Bwb3NlZCwgYnV0IEkg
dGhpbmsgdGhlcmUKPiB3YW50cyB0byBiZSBqdXN0aWZpY2F0aW9uIHdoeSB0aGUgYWRkZWQgc3lu
Y2hyb25pemF0aW9uIGlzIG5vdAo+IGEgcHJvYmxlbSAoYW5kIHdvdWxkIHBlcmhhcHMgbmV2ZXIg
aGF2ZSBiZWVuKS4KClRoZSBjb21tZW50IGRvZXNuJ3Qgc2F5IEknbSBhdm9pZGluZyBzeW5jaHJv
bml6YXRpb24sIGJ1dApzY2hlZHVsaW5nLgoKVGhlIChub3cgbmVlZGVkKSBzeW5jaHJvbml6YXRp
b24gaXMgdmVyeSB1bmxpa2VseSB0byBjYXVzZSAoc2hvcnQpCmJsb2NraW5nLgoKPiAKPj4gQEAg
LTE0NTgsMTQgKzE0NDEsMTEgQEAgbG9uZyBzY2hlZF9hZGp1c3RfZ2xvYmFsKHN0cnVjdCB4ZW5f
c3lzY3RsX3NjaGVkdWxlcl9vcCAqb3ApCj4+ICAgICAgIHJldHVybiByYzsKPj4gICB9Cj4+ICAg
Cj4+IC1zdGF0aWMgdm9pZCB2Y3B1X3BlcmlvZGljX3RpbWVyX3dvcmsoc3RydWN0IHZjcHUgKnYp
Cj4+ICtzdGF0aWMgdm9pZCB2Y3B1X3BlcmlvZGljX3RpbWVyX3dvcmtfbG9ja2VkKHN0cnVjdCB2
Y3B1ICp2KQo+PiAgIHsKPj4gICAgICAgc190aW1lX3Qgbm93Owo+PiAgICAgICBzX3RpbWVfdCBw
ZXJpb2RpY19uZXh0X2V2ZW50Owo+PiAgIAo+PiAtICAgIGlmICggdi0+cGVyaW9kaWNfcGVyaW9k
ID09IDAgKQo+PiAtICAgICAgICByZXR1cm47Cj4gCj4gSSdtIGFmcmFpZCB5b3UgY2FuJ3QgcHVs
bCB0aGlzIG91dCBvZiBoZXJlLCBvciAuLi4KPiAKPj4gQEAgLTE0NzYsMTAgKzE0NTYsMzYgQEAg
c3RhdGljIHZvaWQgdmNwdV9wZXJpb2RpY190aW1lcl93b3JrKHN0cnVjdCB2Y3B1ICp2KQo+PiAg
ICAgICAgICAgcGVyaW9kaWNfbmV4dF9ldmVudCA9IG5vdyArIHYtPnBlcmlvZGljX3BlcmlvZDsK
Pj4gICAgICAgfQo+PiAgIAo+PiAtICAgIG1pZ3JhdGVfdGltZXIoJnYtPnBlcmlvZGljX3RpbWVy
LCBzbXBfcHJvY2Vzc29yX2lkKCkpOwo+PiArICAgIG1pZ3JhdGVfdGltZXIoJnYtPnBlcmlvZGlj
X3RpbWVyLCB2LT5wcm9jZXNzb3IpOwo+PiAgICAgICBzZXRfdGltZXIoJnYtPnBlcmlvZGljX3Rp
bWVyLCBwZXJpb2RpY19uZXh0X2V2ZW50KTsKPj4gICB9Cj4+ICAgCj4+ICtzdGF0aWMgdm9pZCB2
Y3B1X3BlcmlvZGljX3RpbWVyX3dvcmsoc3RydWN0IHZjcHUgKnYpCj4+ICt7Cj4+ICsgICAgaWYg
KCB2LT5wZXJpb2RpY19wZXJpb2QgPT0gMCApCj4+ICsgICAgICAgIHJldHVybjsKPj4gKwo+PiAr
ICAgIHNwaW5fbG9jaygmdi0+cGVyaW9kaWNfdGltZXJfbG9jayk7Cj4gCj4gLi4uIHRoZSBjb25k
aXRpb25hbCBoZXJlIG5lZWRzIHRvIG1vdmUgaW50byB0aGUgbG9ja2VkIHJlZ2lvbi4KPiBPdGhl
cndpc2UsIGRlc3BpdGUgaGF2aW5nIGZvdW5kIG5vbi16ZXJvIGFib3ZlLCBieSB0aGUgdGltZSB0
aGUKPiBsb2NrIHdhcyBhY3F1aXJlZCB0aGUgdmFsdWUgbWF5IGhhdmUgY2hhbmdlZCB0byB6ZXJv
LgoKWWVzLCBpbmRlZWQuIEkgdGhpbmsgSSdsbCBsZXQgdGhlIGluaXRpYWwgdGVzdCBpbiBwbGFj
ZSBpbiBvcmRlcgp0byBhdm9pZCB0YWtpbmcgdGhlIGxvY2sgaW4gdGhlIChjb21tb24pIGNhc2Ug
d2hlcmUgdGhlIHBlcmlvZGljCnRpbWVyIGlzIGRpc2FibGVkLiBKdXN0IGFkZGluZyBhbm90aGVy
IHRlc3QgYWZ0ZXIgdGFraW5nIHRoZSBsb2NrCmlzIG5lZWRlZCwgdGhvdWdoLgoKPiAKPiBBcyB0
byB0aGUgbWlncmF0ZV90aW1lcigpIGNoYW5nZTogT3RoZXIgdGhhbiBJIGZlYXJlZCwgdXNpbmcK
PiB2LT5wcm9jZXNzb3Igb2YgYSBub24tcnVubmluZyB2Q1BVIGRvZXMgbm90IGxvb2sgdG8gaGF2
ZSBhbnkKPiBjaGFuY2Ugb2YgYWN0aW5nIG9uIGFuIG9mZmxpbmUgQ1BVLCB0aGFua3MgdG8KPiBj
cHVfZGlzYWJsZV9zY2hlZHVsZXIoKSBkZWFsaW5nIHdpdGggYWxsIHZDUFUtcyAoYW5kIG5vdCBq
dXN0Cj4gcnVubmluZyBvbmVzKSwgYW5kIHRoYW5rcyB0byBDUFUgb2ZmbGluaW5nIGhhcHBlbmlu
ZyBpbgo+IHN0b3AtbWFjaGluZSBjb250ZXh0LgoKQ29ycmVjdC4gV2l0aG91dCB0aGF0IHRoZSBz
Y2hlZHVsZSBsb2NrIHdvdWxkbid0IHdvcmsgYXQgYWxsLCBhcwppdCBpcyB1c2luZyB2LT5wcm9j
ZXNzb3IgdG8gZmluZCB0aGUgY29ycmVjdCBsb2NrLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
