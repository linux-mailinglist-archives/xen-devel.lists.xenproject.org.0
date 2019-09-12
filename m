Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45881B0A2A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 10:23:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8KLo-0001So-KL; Thu, 12 Sep 2019 08:21:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pap2=XH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8KLn-0001Se-GC
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 08:21:11 +0000
X-Inumbo-ID: 469f6810-d536-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 469f6810-d536-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 08:21:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AEE6DB622;
 Thu, 12 Sep 2019 08:21:09 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-29-jgross@suse.com>
 <64d99c4bbcf29a8549a76a9d9131d27a4c6806ed.camel@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <5ee95074-c49e-ce7f-b715-8d3257a06b01@suse.com>
Date: Thu, 12 Sep 2019 10:21:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <64d99c4bbcf29a8549a76a9d9131d27a4c6806ed.camel@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 28/48] xen/sched: move struct task_slice
 into struct sched_unit
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMTkgMTA6MTMsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIEZyaSwgMjAxOS0w
OC0wOSBhdCAxNjo1OCArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gSW4gb3JkZXIgdG8g
cHJlcGFyZSBmb3IgbXVsdGlwbGUgdmNwdXMgcGVyIHNjaGVkdWxlIHVuaXQgbW92ZSBzdHJ1Y3QK
Pj4gdGFza19zbGljZSBpbiBzY2hlZHVsZSgpIGZyb20gdGhlIGxvY2FsIHN0YWNrIGludG8gc3Ry
dWN0IHNjaGVkX3VuaXQKPj4gb2YgdGhlIGN1cnJlbnRseSBydW5uaW5nIHVuaXQuIFRvIG1ha2Ug
YWNjZXNzIGVhc2llciBmb3IgdGhlIHNpbmdsZQo+PiBzY2hlZHVsZXJzIGFkZCB0aGUgcG9pbnRl
ciBvZiB0aGUgY3VycmVudGx5IHJ1bm5pbmcgdW5pdCBhcyBhCj4+IHBhcmFtZXRlcgo+PiBvZiBk
b19zY2hlZHVsZSgpLgo+Pgo+PiBXaGlsZSBhdCBpdCBzd2l0Y2ggdGhlIHRhc2tsZXRfd29ya19z
Y2hlZHVsZWQgcGFyYW1ldGVyIG9mCj4+IGRvX3NjaGVkdWxlKCkgZnJvbSBib29sX3QgdG8gYm9v
bC4KPj4KPj4gQXMgc3RydWN0IHRhc2tfc2xpY2UgaXMgb25seSBldmVyIG1vZGlmaWVkIHdpdGgg
dGhlIGxvY2FsIHNjaGVkdWxlCj4+IGxvY2sgaGVsZCBpdCBpcyBzYWZlIHRvIGRpcmVjdGx5IHNl
dCB0aGUgZGlmZmVyZW50IHVuaXRzIGluIHN0cnVjdAo+PiBzY2hlZF91bml0IGluc3RlYWQgb2Yg
dXNpbmcgYW4gb24tc3RhY2sgY29weSBmb3IgcmV0dXJuaW5nIHRoZSBkYXRhLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+IC0tLQo+Pgo+PiBk
aWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5j
Cj4+IGluZGV4IGU0ZDBkZDRiNjUuLmQyZmM4OWQ5ODMgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9jb21t
b24vc2NoZWR1bGUuYwo+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAgLTE3NTEs
OSArMTc0OSw3IEBAIHN0YXRpYyB2b2lkIHNjaGVkdWxlKHZvaWQpCj4+ICAgICAgICAgICBUUkFD
RV80RChUUkNfU0NIRURfU1dJVENIX0lORkNPTlQsCj4+ICAgICAgICAgICAgICAgICAgICBuZXh0
LT5kb21haW4tPmRvbWFpbl9pZCwgbmV4dC0+dW5pdF9pZCwKPj4gICAgICAgICAgICAgICAgICAg
IG5vdyAtIHByZXYtPnN0YXRlX2VudHJ5X3RpbWUsCj4+IC0gICAgICAgICAgICAgICAgIG5leHRf
c2xpY2UudGltZSk7Cj4+IC0gICAgICAgIHRyYWNlX2NvbnRpbnVlX3J1bm5pbmcobmV4dC0+dmNw
dV9saXN0KTsKPj4gLSAgICAgICAgcmV0dXJuIGNvbnRpbnVlX3J1bm5pbmcocHJldi0+dmNwdV9s
aXN0KTsKPj4gKyAgICAgICAgICAgICAgICAgcHJldi0+bmV4dF90aW1lKTsKPj4gICAgICAgfQo+
PiAgIAo+IE1tbS4uLiBJJ20gc29ycnksIGJ1dCBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHdo
YXQgaXMgZ29pbmcgb24gaGVyZS4KPiAKPiBEbyB5b3UgbWluZCBleHBsYWluaW5nIHdoeSB3ZSdy
ZSBub3QgY2FsbGluZyBjb250aW51ZV9ydW5uaW5nKCkgYW55Cj4gbG9uZ2VyIChhbmQgd2h5IHRo
aXMgaGFwcGVucyBpbiB0aGlzIHBhdGNoKT8KCkdvb2QgY2F0Y2guIFRoZSByZWxhdGVkIGNvZGlu
ZyBnZXRzIGFkZGVkIGluIHBhdGNoIDI5IGFnYWluLiBTZWVtcyBhcwppZiB0d28gcGF0Y2hlcyBn
b3QgbWl4ZWQgdXAuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
