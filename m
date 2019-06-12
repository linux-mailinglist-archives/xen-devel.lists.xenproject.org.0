Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3244A41EA8
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 10:09:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hayGE-0005bl-7f; Wed, 12 Jun 2019 08:05:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T8NI=UL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hayGC-0005bg-IS
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 08:05:32 +0000
X-Inumbo-ID: d7b7a240-8ce8-11e9-b375-1ffb58ee4059
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7b7a240-8ce8-11e9-b375-1ffb58ee4059;
 Wed, 12 Jun 2019 08:05:29 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gqUjvhJxtIg1CuknlAhU+q2UNjqqJVG9HNU5b6qdeHEsAN1jppWuict9MPOnRKwbSEeZPG9PrH
 QxGje1kNqLPL/0oLRaAusB7m4QAuJb9O+DZEI0Q5kSTZDzL12+qil+i1QOuQvOsH0XYyTgoqSs
 9TYzWWSTIbeF53u0uuUbGbnYEHOM3aQC8CokVKkpVyOWwwny0Wak/DNosIEiVWaBgdc1BIyy2A
 +kr6LZSF5X3u1j2w+3TlwxUsq2+DUbsZrWQhf6UKuE5xHmYdH32g/L6NM6dW/TJfLmA+yPZF5D
 ugQ=
X-SBRS: 2.7
X-MesageID: 1635424
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,363,1557201600"; 
   d="scan'208";a="1635424"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-4-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <afe9fd8d-36b5-e946-2084-36bf8f7dcaba@citrix.com>
Date: Wed, 12 Jun 2019 09:05:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190528103313.1343-4-jgross@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 03/60] xen/sched: let sched_switch_sched()
 return new lock address
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
 George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian
 Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDUvMjAxOSAxMTozMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBAQCAtMTg3MCw4ICsx
ODcxLDE5IEBAIGludCBzY2hlZHVsZV9jcHVfc3dpdGNoKHVuc2lnbmVkIGludCBjcHUsIHN0cnVj
dCBjcHVwb29sICpjKQo+ICAgICAgb2xkX2xvY2sgPSBwY3B1X3NjaGVkdWxlX2xvY2tfaXJxKGNw
dSk7Cj4gIAo+ICAgICAgdnByaXZfb2xkID0gaWRsZS0+c2NoZWRfcHJpdjsKPiAtICAgIHBwcml2
X29sZCA9IHBlcl9jcHUoc2NoZWR1bGVfZGF0YSwgY3B1KS5zY2hlZF9wcml2Owo+IC0gICAgc2No
ZWRfc3dpdGNoX3NjaGVkKG5ld19vcHMsIGNwdSwgcHByaXYsIHZwcml2KTsKPiArICAgIHBwcml2
X29sZCA9IHNkLT5zY2hlZF9wcml2Owo+ICsgICAgbmV3X2xvY2sgPSBzY2hlZF9zd2l0Y2hfc2No
ZWQobmV3X29wcywgY3B1LCBwcHJpdiwgdnByaXYpOwo+ICsKPiArICAgIHBlcl9jcHUoc2NoZWR1
bGVyLCBjcHUpID0gbmV3X29wczsKPiArICAgIHNkLT5zY2hlZF9wcml2ID0gcHByaXY7Cj4gKwo+
ICsgICAgLyoKPiArICAgICAqIChSZT8pcm91dGUgdGhlIGxvY2sgdG8gdGhlIHBlciBwQ1BVIGxv
Y2sgYXMgL2xhc3QvIHRoaW5nLiBJbiBmYWN0LAo+ICsgICAgICogaWYgaXQgaXMgZnJlZSAoYW5k
IGl0IGNhbiBiZSkgd2Ugd2FudCB0aGF0IGFueW9uZSB0aGF0IG1hbmFnZXMKPiArICAgICAqIHRh
a2luZyBpdCwgZmluZHMgYWxsIHRoZSBpbml0aWFsaXphdGlvbnMgd2UndmUgZG9uZSBhYm92ZSBp
biBwbGFjZS4KPiArICAgICAqLwo+ICsgICAgc21wX21iKCk7CgpJIHJlYWxpc2UgeW91J3JlIGp1
c3QgbW92aW5nIGV4aXN0aW5nIGNvZGUsIGJ1dCB0aGlzIGJhcnJpZXIgc3RpY2tzIG91dApsaWtl
IGEgc29yZSB0aHVtYi4KCkEgZnVsbCBtZW1vcnkgYmFycmllciBpcyBhIG1hc3NpdmUgb3Zlcmhl
YWQgZm9yIHdoYXQgc2hvdWxkIGJlCnNtcF93bWIoKS7CoCBUaGUgbWF0Y2hpbmcgYmFycmllciBp
cyBhY3R1YWxseSBoaWRkZW4gaW4gdGhlIGltcGxpY2l0CnNlbWFudGljcyBvZiBtYW5hZ2luZyB0
byBsb2NrIHNkLT5zY2hlZHVsZV9sb2NrICh3aGljaCBpcyB0cmlhbCBhbiBlcnJvcgphbnl3YXkp
LCBidXQgdGhlIG9ubHkgdGhpbmcgdGhhdCBtYXR0ZXJzIGhlcmUgaXMgdGhhdCBhbGwgb3RoZXIg
d3JpdHRlbgpkYXRhIGlzIGluIHBsYWNlIGZpcnN0LgoKQmV5b25kIHRoYXQsIGxvY2FsIGNhdXNh
bGl0eSB3aWxsIGNhdXNlIGFsbCByZWFkcyB0byBiZSBpbiBvcmRlciAobm90CnRoYXQgdGhlIGFy
ZSBpbXBvcnRhbnQpIGR1ZSB0byBsb2dpYyBkZXBlbmRlbmNpZXMuwqAgQW55IHRoYXQgbWlzcyBv
dXQgb24KdGhpcyBhcmUgYSBvcHRpbWlzYXRpb24td2FpdGluZy10by1oYXBwZW4gYXMgdGhlIGNv
bXBpbGVyIGNvdWxkIGVsaWRlCnRoZW0gZnVsbHkuCgp+QW5kcmV3Cgo+ICsgICAgc2QtPnNjaGVk
dWxlX2xvY2sgPSBuZXdfbG9jazsKPiAgCj4gICAgICAvKiBfTm90XyBwY3B1X3NjaGVkdWxlX3Vu
bG9jaygpOiBzY2hlZHVsZV9sb2NrIG1heSBoYXZlIGNoYW5nZWQhICovCj4gICAgICBzcGluX3Vu
bG9ja19pcnEob2xkX2xvY2spOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
