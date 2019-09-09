Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE875ADA26
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 15:41:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Jro-0004Ki-KJ; Mon, 09 Sep 2019 13:38:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7Jrn-0004Kd-Dc
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 13:38:03 +0000
X-Inumbo-ID: 0b14f872-d307-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b14f872-d307-11e9-a337-bc764e2007e4;
 Mon, 09 Sep 2019 13:38:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 49861B622;
 Mon,  9 Sep 2019 13:38:01 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-21-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7b688998-123a-caec-9e01-eb3ac86f9dfc@suse.com>
Date: Mon, 9 Sep 2019 15:38:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-21-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 20/48] xen: let vcpu_create() select
 processor
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNjo1OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL3NjaGVkdWxlLmMKPiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBAQCAtMzY4LDE0
ICszNjgsNTIgQEAgc3RhdGljIHN0cnVjdCBzY2hlZF91bml0ICpzY2hlZF9hbGxvY191bml0KHN0
cnVjdCB2Y3B1ICp2KQo+ICAgICAgcmV0dXJuIE5VTEw7Cj4gIH0KPiAgCj4gLWludCBzY2hlZF9p
bml0X3ZjcHUoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludCBwcm9jZXNzb3IpCj4gK3N0YXRp
YyB1bnNpZ25lZCBpbnQgc2NoZWRfc2VsZWN0X2luaXRpYWxfY3B1KGNvbnN0IHN0cnVjdCB2Y3B1
ICp2KQoKR2l2ZW4gdGhlIHJlc3BvbnNlIG9uIGFuIGVhcmxpZXIgc2ltaWxhciBxdWVzdGlvbiwg
SSBkb24ndCBzdXBwb3NlCkkgY291bGQgdGFsayB5b3UgaW50byBkcm9wcGluZyB0aGUgc2NoZWRf
IHByZWZpeCBoZXJlPwoKPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAo+ICsrKyBi
L3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCj4gQEAgLTQ1Nyw3ICs0NTcsNyBAQCBzdHJ1Y3Qg
Y3B1cG9vbAo+ICAjZGVmaW5lIGNwdXBvb2xfb25saW5lX2NwdW1hc2soX3Bvb2wpIFwKPiAgICAg
ICgoKF9wb29sKSA9PSBOVUxMKSA/ICZjcHVfb25saW5lX21hcCA6IChfcG9vbCktPmNwdV92YWxp
ZCkKPiAgCj4gLXN0YXRpYyBpbmxpbmUgY3B1bWFza190KiBjcHVwb29sX2RvbWFpbl9jcHVtYXNr
KHN0cnVjdCBkb21haW4gKmQpCj4gK3N0YXRpYyBpbmxpbmUgY3B1bWFza190KiBjcHVwb29sX2Rv
bWFpbl9jcHVtYXNrKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCgpJdCB3b3VsZCBjZXJ0YWlubHkg
YmUgbmljZSB0byBjb3JyZWN0IHRoZSBtaXNwbGFjZSAqIGhlcmUgYXQgdGhlCnNhbWUgdGltZSAo
d2hpY2ggY2xlYXJseSBjb3VsZCBiZSBkb25lIHdoaWxlIGNvbW1pdHRpbmcsIGlmCmV2ZXJ5dGhp
bmcgdXAgdG8gaGVyZSB3YXMgcmVhZHkgdG8gZ28gaW4pLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
