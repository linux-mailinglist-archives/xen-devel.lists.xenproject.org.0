Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79046BDEC7
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 15:17:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD78N-0000Tp-Uz; Wed, 25 Sep 2019 13:15:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iD78M-0000Th-Dd
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 13:15:06 +0000
X-Inumbo-ID: 7d5a1746-df96-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 7d5a1746-df96-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 13:15:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D9C18AFCC;
 Wed, 25 Sep 2019 13:15:04 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-35-jgross@suse.com>
 <cb03241e-908b-e939-7585-855cadc00068@suse.com>
 <76b8ac21-a20e-069a-c7a3-36b46b60d692@suse.com>
 <d7887227-81e7-8750-9e9f-04a5e5a8abfc@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <25dffa7f-c1aa-9adf-db22-9a78a9b6daed@suse.com>
Date: Wed, 25 Sep 2019 15:15:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d7887227-81e7-8750-9e9f-04a5e5a8abfc@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMTkgMTU6MTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI1LjA5LjIwMTkgMTQ6
NTgsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDI0LjA5LjE5IDEyOjUzLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDE0LjA5LjIwMTkgMTA6NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gQEAgLTIwMTUsNyArMjA3OSw4IEBAIHN0YXRpYyB2b2lkIHNjaGVkX3NsYXZlKHZvaWQpCj4+
Pj4gICAgCj4+Pj4gICAgICAgIHBjcHVfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCBjcHUpOwo+
Pj4+ICAgIAo+Pj4+IC0gICAgc2NoZWRfY29udGV4dF9zd2l0Y2godnByZXYsIHNjaGVkX3VuaXQy
dmNwdV9jcHUobmV4dCwgY3B1KSwgbm93KTsKPj4+PiArICAgIHNjaGVkX2NvbnRleHRfc3dpdGNo
KHZwcmV2LCBzY2hlZF91bml0MnZjcHVfY3B1KG5leHQsIGNwdSksCj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICBpc19pZGxlX3VuaXQobmV4dCkgJiYgIWlzX2lkbGVfdW5pdChwcmV2KSwg
bm93KTsKPj4+PiAgICB9Cj4+Pj4gICAgCj4+Pj4gICAgLyoKPj4+PiBAQCAtMjA3NSw3ICsyMTQw
LDggQEAgc3RhdGljIHZvaWQgc2NoZWR1bGUodm9pZCkKPj4+PiAgICAgICAgcGNwdV9zY2hlZHVs
ZV91bmxvY2tfaXJxKGxvY2ssIGNwdSk7Cj4+Pj4gICAgCj4+Pj4gICAgICAgIHZuZXh0ID0gc2No
ZWRfdW5pdDJ2Y3B1X2NwdShuZXh0LCBjcHUpOwo+Pj4+IC0gICAgc2NoZWRfY29udGV4dF9zd2l0
Y2godnByZXYsIHZuZXh0LCBub3cpOwo+Pj4+ICsgICAgc2NoZWRfY29udGV4dF9zd2l0Y2godnBy
ZXYsIHZuZXh0LAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIWlzX2lkbGVfdW5pdChw
cmV2KSAmJiBpc19pZGxlX3VuaXQobmV4dCksIG5vdyk7Cj4+Pj4gICAgfQo+Pj4KPj4+IEFzIGEg
bWlub3IgcmVtYXJrLCBJIHRoaW5rIGJldHdlZW4gc3VjaCBjb25zdHJ1Y3RzIGl0IHdvdWxkIGJl
IGdvb2QKPj4+IGlmIHRoZXJlIHdhcyBubyBkaWZmZXJlbmNlLCB1bmxlc3MgdGhlcmUncyBhIHJl
YXNvbiB0byBoYXZlIG9uZS4gWWV0Cj4+PiBpZiB0aGVyZSB3YXMgYSByZWFzb24sIGl0IHN1cmVs
eSB3b3VsZCB3YW50IHRvIGJlIHNwZWxsZWQgb3V0Lgo+Pgo+PiBJIGd1ZXNzIHlvdSBtZWFuIGNo
YW5naW5nIHRoZSBwYXJhbWV0ZXJzIG9mIHNjaGVkX2NvbnRleHRfc3dpdGNoKCk/IEkKPj4gY2Fu
IGRvIHRoYXQuCj4gCj4gV2VsbCwgeWVzLCB0aGUgdHdvIHNpZGVzIG9mIHRoZSAmJiBpbiBvbmUg
b2YgdGhlbS4KCkFoLCBva2F5LgoKPiAKPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3Nt
cC5oCj4+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9zbXAuaAo+Pj4+IEBAIC03Niw2ICs3
Niw5IEBAIHZvaWQgc2V0X25yX3NvY2tldHModm9pZCk7Cj4+Pj4gICAgLyogUmVwcmVzZW50aW5n
IEhUIGFuZCBjb3JlIHNpYmxpbmdzIGluIGVhY2ggc29ja2V0LiAqLwo+Pj4+ICAgIGV4dGVybiBj
cHVtYXNrX3QgKipzb2NrZXRfY3B1bWFzazsKPj4+PiAgICAKPj4+PiArI2RlZmluZSBnZXRfY3B1
X2N1cnJlbnQoY3B1KSBcCj4+Pj4gKyAgICAoZ2V0X2NwdV9pbmZvX2Zyb21fc3RhY2soKHVuc2ln
bmVkIGxvbmcpc3RhY2tfYmFzZVtjcHVdKS0+Y3VycmVudF92Y3B1KQo+Pj4KPj4+IEkgZG9uJ3Qg
dGhpbmsgdGhpcyBjYW4gZ28gd2l0aG91dCBhIGNvbW1lbnQgY2xhcmlmeWluZyB1bmRlciB3aGF0
Cj4+PiAocHJldHR5IG5hcnJvdyBJIHRoaW5rKSBjb25kaXRpb25zIHRoaXMgaXMgbGVnaXRpbWF0
ZSB0byB1c2UuCj4+Cj4+IE9rYXkuIEknbGwgYWRkIGEgY29tbWVudCBsaWtlOiAidG8gYmUgdXNl
ZCBvbmx5IHdoaWxlIG5vIGNvbnRleHQgc3dpdGNoCj4+IGNhbiBvY2N1ciBvbiB0aGUgY3B1Ii4K
PiAKPiBUbyBiZSBjcnlzdGFsIGNsZWFyLCBJJ2QgYXBwZW5kICIsIGkuZS4gYnkgY2VydGFpbiBz
Y2hlZHVsaW5nIGNvZGUgb25seSIuCgpGaW5lIHdpdGggbWUuCgoKSnVlcmdlbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
