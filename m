Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B929AB1AEB
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 11:36:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8hxL-0001CM-H1; Fri, 13 Sep 2019 09:33:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mE8E=XI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8hxK-0001CD-Mm
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 09:33:30 +0000
X-Inumbo-ID: 8b6f4d92-d609-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b6f4d92-d609-11e9-a337-bc764e2007e4;
 Fri, 13 Sep 2019 09:33:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 098B3AF21;
 Fri, 13 Sep 2019 09:33:29 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-27-jgross@suse.com>
 <53f10944-0c99-f5f1-1eff-f1f240dceee4@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <bd2874b1-e10e-2066-8a3f-5788c796479f@suse.com>
Date: Fri, 13 Sep 2019 11:33:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <53f10944-0c99-f5f1-1eff-f1f240dceee4@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 26/48] xen/sched: rework and rename
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDkuMTkgMTY6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IHZjcHVfZm9yY2VfcmVzY2hlZHVsZSgpIGlzIG9u
bHkgdXNlZCBmb3IgbW9kaWZ5aW5nIHRoZSBwZXJpb2RpYyB0aW1lcgo+PiBvZiBhIHZjcHUuCj4g
Cj4gSSBkb24ndCB0aGluayB0aGlzIGlzIHRydWUgcHJpb3IgdG8gdGhpcyBwYXRjaCwgb3IgZWxz
ZSAuLi4KPiAKPj4gQEAgLTQxOSw4ICs0MTksNiBAQCBpbnQgcHZfc2hpbV9zaHV0ZG93bih1aW50
OF90IHJlYXNvbikKPj4gICAKPj4gICAgICAgICAgIGlmICggdiAhPSBjdXJyZW50ICkKPj4gICAg
ICAgICAgICAgICB2Y3B1X3VucGF1c2VfYnlfc3lzdGVtY29udHJvbGxlcih2KTsKPj4gLSAgICAg
ICAgZWxzZQo+PiAtICAgICAgICAgICAgdmNwdV9mb3JjZV9yZXNjaGVkdWxlKHYpOwo+IAo+IC4u
LiB0aGVyZSB3b3VsZG4ndCBiZSB0aGlzIGRlbGV0aW9uIG9mIGNvZGUuIFdpdGhvdXQgZnVydGhl
cgo+IGV4cGxhbmF0aW9uIGl0J3MgdW5jbGVhciB0byBtZSB3aGV0aGVyIHRoZSByZS1zY2hlZHVs
ZSBoZXJlCj4gaXNuJ3QgYWxzbyBuZWVkZWQgZm9yIG90aGVyIHRoYW4gcHJvY2Vzc2luZyB0aGUg
cmVzZXQgb2YgdGhlCj4gcGVyaW9kaWMgdGltZXIgcGVyaW9kLgoKVGhpcyBkZWxldGlvbiBpcyBy
ZWxhdGVkIHRvIHJlcGxhY2luZyB0aGUgZGlyZWN0IHdyaXRlIG9mCnYtPnBlcmlvZGljX3Blcmlv
ZCBieSB2Y3B1X3NldF9wZXJpb2RpY190aW1lcigpLgoKSSBjYW4ndCBzZWUgYW55IG90aGVyIHJl
YXNvbiBmb3IgdGhlIHJlLXNjaGVkdWxlLgoKPiAKPj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVs
ZS5jCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+PiBAQCAtODc3LDIxICs4NzcsMjUg
QEAgc3RhdGljIHZvaWQgdmNwdV9taWdyYXRlX2ZpbmlzaChzdHJ1Y3QgdmNwdSAqdikKPj4gICB9
Cj4+ICAgCj4+ICAgLyoKPj4gLSAqIEZvcmNlIGEgVkNQVSB0aHJvdWdoIGEgZGVzY2hlZHVsZS9y
ZXNjaGVkdWxlIHBhdGguCj4+IC0gKiBGb3IgZXhhbXBsZSwgdXNpbmcgdGhpcyB3aGVuIHNldHRp
bmcgdGhlIHBlcmlvZGljIHRpbWVyIHBlcmlvZCBtZWFucyB0aGF0Cj4+IC0gKiBtb3N0IHBlcmlv
ZGljLXRpbWVyIHN0YXRlIG5lZWQgb25seSBiZSB0b3VjaGVkIGZyb20gd2l0aGluIHRoZSBzY2hl
ZHVsZXIKPj4gLSAqIHdoaWNoIGNhbiB0aHVzIGJlIGRvbmUgd2l0aG91dCBuZWVkIGZvciBzeW5j
aHJvbmlzYXRpb24uCj4+ICsgKiBTZXQgdGhlIHBlcmlvZGljIHRpbWVyIG9mIGEgdmNwdS4KPj4g
ICAgKi8KPj4gLXZvaWQgdmNwdV9mb3JjZV9yZXNjaGVkdWxlKHN0cnVjdCB2Y3B1ICp2KQo+PiAr
dm9pZCB2Y3B1X3NldF9wZXJpb2RpY190aW1lcihzdHJ1Y3QgdmNwdSAqdiwgc190aW1lX3QgdmFs
dWUpCj4+ICAgewo+PiAtICAgIHNwaW5sb2NrX3QgKmxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2tf
aXJxKHYtPnNjaGVkX3VuaXQpOwo+PiArICAgIHNfdGltZV90IG5vdzsKPj4gICAKPj4gLSAgICBp
ZiAoIHYtPnNjaGVkX3VuaXQtPmlzX3J1bm5pbmcgKQo+PiAtICAgICAgICB2Y3B1X21pZ3JhdGVf
c3RhcnQodik7Cj4+ICsgICAgaWYgKCB2ICE9IGN1cnJlbnQgKQo+PiArICAgICAgICB2Y3B1X3Bh
dXNlKHYpOwo+PiArICAgIGVsc2UKPj4gKyAgICAgICAgc3RvcF90aW1lcigmdi0+cGVyaW9kaWNf
dGltZXIpOwo+PiAgIAo+PiAtICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCB2LT5z
Y2hlZF91bml0KTsKPj4gKyAgICBub3cgPSBOT1coKTsKPj4gKyAgICB2LT5wZXJpb2RpY19wZXJp
b2QgPSB2YWx1ZTsKPj4gKyAgICB2LT5wZXJpb2RpY19sYXN0X2V2ZW50ID0gbm93Owo+IAo+IEkn
bSBhZnJhaWQgdGhpcyBhbHRlcnMgYW4gaW1wbGljaXQgcHJvcGVydHkgb2YgdGhlIHByZXZpb3Vz
Cj4gaW1wbGVtZW50YXRpb246IHBlcmlvZGljX2xhc3RfZXZlbnQgd291bGQgZ2V0IHJlLXNldCBv
bmx5IHdoZW4KPiB0aGUgbmV3bHkgY2FsY3VsYXRlZCBuZXh0IGV2ZW50IHdvdWxkbid0IGJlIGlu
IHRoZSBmdXR1cmUuIFRoZQo+IGdvYWwgb2YgdGhpcyAoYWl1aSkgaXMgdG8gbm90IGRpc3R1cmIg
YSBwZXJpb2RpYyB0aW1lciB3aGljaAo+IGdldHMgKHJlZHVuZGFudGx5KSBzZXQgYWdhaW4gdG8g
dGhlIHNhbWUgcGVyaW9kLgoKQWgsIHJpZ2h0LiBXaWxsIGNoYW5nZSB0aGF0LgoKPiAKPj4gLSAg
ICB2Y3B1X21pZ3JhdGVfZmluaXNoKHYpOwo+PiArICAgIGlmICggdiAhPSBjdXJyZW50ICkKPj4g
KyAgICAgICAgdmNwdV91bnBhdXNlKHYpOwo+PiArICAgIGVsc2UgaWYgKCB2YWx1ZSAhPSAwICkK
Pj4gKyAgICAgICAgc2V0X3RpbWVyKCZ2LT5wZXJpb2RpY190aW1lciwgbm93ICsgdmFsdWUpOwo+
PiAgIH0KPiAKPiBXaGlsZSBwZXJoYXBzIG5vdCBvdmVybHkgaW1wb3J0YW50LCBhbm90aGVyIGRp
ZmZlcmVuY2UgdG8KPiB2Y3B1X3BlcmlvZGljX3RpbWVyX3dvcmsoKSBpcyB0aGUgbGFjayBvZiBt
aWdyYXRlX3RpbWVyKCkgaGVyZS4KPiBUaGVyZSB3b3VsZCBpbmRlZWQgYmUgbm8gbWlncmF0aW9u
IG5lZWRlZCBpZiBhIHBlcmlvZGljIHRpbWVyCj4gd2FzIGFjdGl2ZSBhbHJlYWR5IChhbmQgaWYg
diA9PSBjdXJyZW50KSwgYmVjYXVzZSBpdCB3b3VsZAo+IGhhdmUgYmVlbiBtaWdyYXRlZCBkdXJp
bmcgdGhlIG1vc3QgcmVjZW50IHNjaGVkdWxpbmcgY3ljbGUuIEJ1dAo+IGluIGNhc2UgdGhpcyBp
cyBhbiBvZmYtPm9uIHRyYW5zaXRpb24sIG5vIHN1Y2ggbWlncmF0aW9uIG1heQo+IGhhdmUgb2Nj
dXJyZWQgYmVmb3JlLgoKVHJ1ZS4gV2lsbCBjaGFuZ2UgdGhhdC4KCj4gRmluYWxseSBhIHJlbWFy
ayB0b3dhcmRzIG9yZGVyaW5nIGluIHRoZSBzZXJpZXM6IFRoaXMgbG9va3MgdG8KPiBiZSB0ZXh0
dWFsbHkgYnV0IG5vdCBmdW5jdGlvbmFsbHkgZGVwZW5kZW50IHVwb24gZWFybGllcgo+IHBhdGNo
ZXMgaW4gdGhlIHNlcmllcy4gU3VjaCBwYXRjaGVzLCB3aGVuIHBsYWNlZCBlYXJseSBpbiBhCj4g
c2VyaWVzLCBoYXZlIGEgZmFpciBjaGFuY2Ugb2YgZ29pbmcgaW4gYWhlYWQgb2YgdGhlIGJ1bGsg
b2YKPiBzdWNoIHNlcmllcy4KCkknbGwgbW92ZSBpdCB0byB0aGUgZnJvbnQgYW5kIHBvc3QgaXQg
b24gaXRzIG93bi4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
