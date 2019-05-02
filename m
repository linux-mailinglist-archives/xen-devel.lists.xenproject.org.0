Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DAF11356
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 08:25:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM55k-0006CQ-4f; Thu, 02 May 2019 06:21:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L2Tp=TC=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hM55i-0006CL-Rc
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 06:21:10 +0000
X-Inumbo-ID: 71418a00-6ca2-11e9-aa22-abdbc0eb60f8
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71418a00-6ca2-11e9-aa22-abdbc0eb60f8;
 Thu, 02 May 2019 06:20:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 E0181301AB36; Thu,  2 May 2019 09:20:54 +0300 (EEST)
Received: from [192.168.228.119] (unknown [86.120.176.202])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id D3A7D306E4AC;
 Thu,  2 May 2019 09:20:53 +0300 (EEST)
To: Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <20190501235203.1179-1-tamas@tklengyel.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <01d02c64-a044-5c6f-d411-ec50abb83408@bitdefender.com>
Date: Thu, 2 May 2019 09:20:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501235203.1179-1-tamas@tklengyel.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH v2] x86/vmx: correctly gather gs_shadow
 value for current vCPU
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8yLzE5IDI6NTIgQU0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiBDdXJyZW50bHkgdGhl
IGdzX3NoYWRvdyB2YWx1ZSBpcyBvbmx5IGNhY2hlZCB3aGVuIHRoZSB2Q1BVIGlzIGJlaW5nIHNj
aGVkdWxlZAo+IG91dCBieSBYZW4uIFJlcG9ydGluZyB0aGlzICh1c3VhbGx5KSBzdGFsZSB2YWx1
ZSB0aHJvdWdoIHZtX2V2ZW50IGlzIGluY29ycmVjdCwKPiBzaW5jZSBpdCBkb2Vzbid0IHJlcHJl
c2VudCB0aGUgYWN0dWFsIHN0YXRlIG9mIHRoZSB2Q1BVIGF0IHRoZSB0aW1lIHRoZSBldmVudAo+
IHdhcyByZWNvcmRlZC4gVGhpcyBwcmV2ZW50cyB2bV9ldmVudCBzdWJzY3JpYmVycyBmcm9tIGNv
cnJlY3RseSBmaW5kaW5nIGtlcm5lbAo+IHN0cnVjdHVyZXMgaW4gdGhlIGd1ZXN0IHdoZW4gaXQg
aXMgdHJhcHBlZCB3aGlsZSBpbiByaW5nMy4KPiAKPiBSZWZyZXNoIHNoYWRvd19ncyB2YWx1ZSB3
aGVuIHRoZSBjb250ZXh0IGJlaW5nIHNhdmVkIGlzIGZvciB0aGUgY3VycmVudCB2Q1BVLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KPiBD
YzogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+IENjOiBKdW4g
TmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+Cj4gQ2M6IEtldmluIFRpYW4gPGtldmlu
LnRpYW5AaW50ZWwuY29tPgo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4g
Q2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQ2M6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gQ2M6IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Cj4gLS0tCj4gdjI6IG1vdmUgZml4IHRvIGh2bSBzbyB2bV9ldmVudCBkb2Vz
bid0IGhhdmUgdG8ga25vdyBzcGVjaWZpY3MKPiAtLS0KPiAgeGVuL2FyY2gveDg2L2h2bS92bXgv
dm14LmMgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZt
L3ZteC92bXguYwo+IGluZGV4IDI4M2ViN2IzNGQuLjUxNTRlY2MyYTggMTAwNjQ0Cj4gLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92
bXguYwo+IEBAIC03NzksMTIgKzc3OSwxNyBAQCBzdGF0aWMgdm9pZCB2bXhfbG9hZF9jcHVfc3Rh
dGUoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCBodm1faHdfY3B1ICpkYXRhKQo+ICAKPiAgc3RhdGlj
IHZvaWQgdm14X3NhdmVfdm1jc19jdHh0KHN0cnVjdCB2Y3B1ICp2LCBzdHJ1Y3QgaHZtX2h3X2Nw
dSAqY3R4dCkKPiAgewo+ICsgICAgaWYgKCB2ID09IGN1cnJlbnQgKQo+ICsgICAgICAgIHZteF9z
YXZlX2d1ZXN0X21zcnModik7Cgp2bXhfc2F2ZV9ndWVzdF9tc3JzKCkgaXMgc2ltcGxlIGVub3Vn
aCB0aGF0IHRoZSBpZiBpcyBwcm9iYWJseSBub3QKbmVjZXNzYXJ5IGhlcmUgKHdlIGNhbiBqdXN0
IGNhbGwgdGhlIGZ1bmN0aW9uIGRpcmVjdGx5LCByZWdhcmRsZXNzIG9mCndoYXQgdiBob2xkcyku
CgpCdXQgdGhhdCdzIG5vdCB0ZWNobmljYWxseSBhbiBpc3N1ZSwgc28gaWYgbm9ib2R5IGVsc2Ug
bWluZHM6CgpBY2tlZC1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIu
Y29tPgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
