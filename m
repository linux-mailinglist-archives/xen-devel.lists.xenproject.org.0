Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4DEBDEB0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 15:14:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD756-0000Ga-25; Wed, 25 Sep 2019 13:11:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD754-0000GS-65
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 13:11:42 +0000
X-Inumbo-ID: 038e7150-df96-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 038e7150-df96-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 13:11:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9EDCBB152;
 Wed, 25 Sep 2019 13:11:40 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-35-jgross@suse.com>
 <cb03241e-908b-e939-7585-855cadc00068@suse.com>
 <76b8ac21-a20e-069a-c7a3-36b46b60d692@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d7887227-81e7-8750-9e9f-04a5e5a8abfc@suse.com>
Date: Wed, 25 Sep 2019 15:11:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <76b8ac21-a20e-069a-c7a3-36b46b60d692@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 34/47] xen/sched: add fall back to idle
 vcpu when scheduling unit
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMjAxOSAxNDo1OCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyNC4wOS4xOSAx
Mjo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE0LjA5LjIwMTkgMTA6NTIsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBAQCAtMjAxNSw3ICsyMDc5LDggQEAgc3RhdGljIHZvaWQgc2NoZWRf
c2xhdmUodm9pZCkKPj4+ICAgCj4+PiAgICAgICBwY3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9j
aywgY3B1KTsKPj4+ICAgCj4+PiAtICAgIHNjaGVkX2NvbnRleHRfc3dpdGNoKHZwcmV2LCBzY2hl
ZF91bml0MnZjcHVfY3B1KG5leHQsIGNwdSksIG5vdyk7Cj4+PiArICAgIHNjaGVkX2NvbnRleHRf
c3dpdGNoKHZwcmV2LCBzY2hlZF91bml0MnZjcHVfY3B1KG5leHQsIGNwdSksCj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgIGlzX2lkbGVfdW5pdChuZXh0KSAmJiAhaXNfaWRsZV91bml0KHBy
ZXYpLCBub3cpOwo+Pj4gICB9Cj4+PiAgIAo+Pj4gICAvKgo+Pj4gQEAgLTIwNzUsNyArMjE0MCw4
IEBAIHN0YXRpYyB2b2lkIHNjaGVkdWxlKHZvaWQpCj4+PiAgICAgICBwY3B1X3NjaGVkdWxlX3Vu
bG9ja19pcnEobG9jaywgY3B1KTsKPj4+ICAgCj4+PiAgICAgICB2bmV4dCA9IHNjaGVkX3VuaXQy
dmNwdV9jcHUobmV4dCwgY3B1KTsKPj4+IC0gICAgc2NoZWRfY29udGV4dF9zd2l0Y2godnByZXYs
IHZuZXh0LCBub3cpOwo+Pj4gKyAgICBzY2hlZF9jb250ZXh0X3N3aXRjaCh2cHJldiwgdm5leHQs
Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICFpc19pZGxlX3VuaXQocHJldikgJiYgaXNf
aWRsZV91bml0KG5leHQpLCBub3cpOwo+Pj4gICB9Cj4+Cj4+IEFzIGEgbWlub3IgcmVtYXJrLCBJ
IHRoaW5rIGJldHdlZW4gc3VjaCBjb25zdHJ1Y3RzIGl0IHdvdWxkIGJlIGdvb2QKPj4gaWYgdGhl
cmUgd2FzIG5vIGRpZmZlcmVuY2UsIHVubGVzcyB0aGVyZSdzIGEgcmVhc29uIHRvIGhhdmUgb25l
LiBZZXQKPj4gaWYgdGhlcmUgd2FzIGEgcmVhc29uLCBpdCBzdXJlbHkgd291bGQgd2FudCB0byBi
ZSBzcGVsbGVkIG91dC4KPiAKPiBJIGd1ZXNzIHlvdSBtZWFuIGNoYW5naW5nIHRoZSBwYXJhbWV0
ZXJzIG9mIHNjaGVkX2NvbnRleHRfc3dpdGNoKCk/IEkKPiBjYW4gZG8gdGhhdC4KCldlbGwsIHll
cywgdGhlIHR3byBzaWRlcyBvZiB0aGUgJiYgaW4gb25lIG9mIHRoZW0uCgo+Pj4gLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9zbXAuaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9zbXAu
aAo+Pj4gQEAgLTc2LDYgKzc2LDkgQEAgdm9pZCBzZXRfbnJfc29ja2V0cyh2b2lkKTsKPj4+ICAg
LyogUmVwcmVzZW50aW5nIEhUIGFuZCBjb3JlIHNpYmxpbmdzIGluIGVhY2ggc29ja2V0LiAqLwo+
Pj4gICBleHRlcm4gY3B1bWFza190ICoqc29ja2V0X2NwdW1hc2s7Cj4+PiAgIAo+Pj4gKyNkZWZp
bmUgZ2V0X2NwdV9jdXJyZW50KGNwdSkgXAo+Pj4gKyAgICAoZ2V0X2NwdV9pbmZvX2Zyb21fc3Rh
Y2soKHVuc2lnbmVkIGxvbmcpc3RhY2tfYmFzZVtjcHVdKS0+Y3VycmVudF92Y3B1KQo+Pgo+PiBJ
IGRvbid0IHRoaW5rIHRoaXMgY2FuIGdvIHdpdGhvdXQgYSBjb21tZW50IGNsYXJpZnlpbmcgdW5k
ZXIgd2hhdAo+PiAocHJldHR5IG5hcnJvdyBJIHRoaW5rKSBjb25kaXRpb25zIHRoaXMgaXMgbGVn
aXRpbWF0ZSB0byB1c2UuCj4gCj4gT2theS4gSSdsbCBhZGQgYSBjb21tZW50IGxpa2U6ICJ0byBi
ZSB1c2VkIG9ubHkgd2hpbGUgbm8gY29udGV4dCBzd2l0Y2gKPiBjYW4gb2NjdXIgb24gdGhlIGNw
dSIuCgpUbyBiZSBjcnlzdGFsIGNsZWFyLCBJJ2QgYXBwZW5kICIsIGkuZS4gYnkgY2VydGFpbiBz
Y2hlZHVsaW5nIGNvZGUgb25seSIuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
