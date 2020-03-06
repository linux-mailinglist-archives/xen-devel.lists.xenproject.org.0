Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6737C17B98B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 10:46:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA9VX-0005sL-Hc; Fri, 06 Mar 2020 09:43:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jA9VV-0005sG-8V
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 09:43:01 +0000
X-Inumbo-ID: dde50882-5f8e-11ea-90c4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dde50882-5f8e-11ea-90c4-bc764e2007e4;
 Fri, 06 Mar 2020 09:43:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 770D4AFA0;
 Fri,  6 Mar 2020 09:42:59 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1583336008-10123-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6175e008-2b25-0232-8fe1-073fe4325b99@suse.com>
Date: Fri, 6 Mar 2020 10:43:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1583336008-10123-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86/cpu: Sync any remaining RCU
 callbacks before CPU up/down
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDMuMjAyMCAxNjozMywgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gLS0tIGEveGVuL2Fy
Y2gveDg2L2FjcGkvcG93ZXIuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMKPiBA
QCAtMzA1LDcgKzMwNSw2IEBAIHN0YXRpYyBpbnQgZW50ZXJfc3RhdGUodTMyIHN0YXRlKQo+ICAg
ICAgY3B1ZnJlcV9hZGRfY3B1KDApOwo+ICAKPiAgIGVuYWJsZV9jcHU6Cj4gLSAgICByY3VfYmFy
cmllcigpOwo+ICAgICAgbXRycl9hcHNfc3luY19iZWdpbigpOwo+ICAgICAgZW5hYmxlX25vbmJv
b3RfY3B1cygpOwo+ICAgICAgbXRycl9hcHNfc3luY19lbmQoKTsKCkkgdGFrZSBpdCB5b3UgcmVt
b3ZlIHRoZSBpbnZvY2F0aW9uIGhlcmUgYmVjYXVzZSBvZiBiZWluZyByZWR1bmRhbnQKd2l0aCB0
aGUgY3B1X3VwKCkgaW4gZW5hYmxlX25vbmJvb3RfY3B1cygpLiBJcyB0aGlzIHNhZmUgLyBjb3Jy
ZWN0CmluIGFsbCBjYXNlcz8gRm9yIG9uZSwgaXQncyBub3Qgb2J2aW91cyB0byBtZSB0aGF0Cm10
cnJfYXBzX3N5bmNfYmVnaW4oKSBjb3VsZG4ndCByZWx5IG9uIFJDVSBzeW5jaW5nIHRvIGhhdmUg
aGFwcGVuZWQuCkFuZCB0aGVuIGVuYWJsZV9ub25ib290X2NwdXMoKSBtYXkgbm90IGNhbGwgY3B1
X3VwKCkgYXQgYWxsLApiZWNhdXNlIG9mIHRoZSBwYXJrX29mZmxpbmVfY3B1cy1iYXNlZCBlYXJs
eSBsb29wIGNvbnRpbnVhdGlvbiBpbgp0aGUgZnVuY3Rpb24uCgo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9zeXNjdGwuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYwo+IEBAIC04NSwxMSArODUs
NyBAQCBsb25nIGNwdV91cF9oZWxwZXIodm9pZCAqZGF0YSkKPiAgICAgIGludCByZXQgPSBjcHVf
dXAoY3B1KTsKPiAgCj4gICAgICBpZiAoIHJldCA9PSAtRUJVU1kgKQo+IC0gICAgewo+IC0gICAg
ICAgIC8qIE9uIEVCVVNZLCBmbHVzaCBSQ1Ugd29yayBhbmQgaGF2ZSBvbmUgbW9yZSBnby4gKi8K
PiAtICAgICAgICByY3VfYmFycmllcigpOwo+ICAgICAgICAgIHJldCA9IGNwdV91cChjcHUpOwo+
IC0gICAgfQo+ICAKPiAgICAgIGlmICggIXJldCAmJiAhb3B0X3NtdCAmJgo+ICAgICAgICAgICBj
cHVfZGF0YVtjcHVdLmNvbXB1dGVfdW5pdF9pZCA9PSBJTlZBTElEX0NVSUQgJiYKPiBAQCAtMTEw
LDExICsxMDYsNyBAQCBsb25nIGNwdV9kb3duX2hlbHBlcih2b2lkICpkYXRhKQo+ICAgICAgaW50
IGNwdSA9ICh1bnNpZ25lZCBsb25nKWRhdGE7Cj4gICAgICBpbnQgcmV0ID0gY3B1X2Rvd24oY3B1
KTsKPiAgICAgIGlmICggcmV0ID09IC1FQlVTWSApCj4gLSAgICB7Cj4gLSAgICAgICAgLyogT24g
RUJVU1ksIGZsdXNoIFJDVSB3b3JrIGFuZCBoYXZlIG9uZSBtb3JlIGdvLiAqLwo+IC0gICAgICAg
IHJjdV9iYXJyaWVyKCk7Cj4gICAgICAgICAgcmV0ID0gY3B1X2Rvd24oY3B1KTsKPiAtICAgIH0K
CkluIGJvdGggY2FzZXMgSSB0aGluayB0aGUgY29tbWVudHMgd291bGQgYmV0dGVyIGJlIHJldGFp
bmVkIChpbgphbiBhZGp1c3RlZCBzaGFwZSkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
