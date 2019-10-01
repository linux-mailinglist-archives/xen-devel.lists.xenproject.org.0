Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF092C4156
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 21:54:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFOBe-0006oq-Fr; Tue, 01 Oct 2019 19:51:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JO9a=X2=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iFOBc-0006ok-RN
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 19:51:52 +0000
X-Inumbo-ID: e93fdd7c-e484-11e9-9707-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id e93fdd7c-e484-11e9-9707-12813bfff9fa;
 Tue, 01 Oct 2019 19:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569959511;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hQBfnEA5WE/KrcxJhJBRCjEA5gaNVaaQPCuKifFVKh8=;
 b=Lvwa6uegkLqd0B0fJE1SX8RR+JIC6J51uWL3gJrZHj1sCqICPx3pKSL+
 W7h4hgdTaLU+ovalNNFOB6NY9IHq7F0LNvWJLojmdim7r2Xg9NXDBzlsH
 Np0X3TAdvdK5OwyNYSmprYfsQhqzar0Ef3vSOVD2/OLhxHC6aXPhwVv5P g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FR0fLhdfiZ/s9velOtRwx4m4+Gyy+YX9RBKRJdaT9nSa9G5Xb5Q+gzNwh97u/GyzuU4HpCdpVP
 IpwtD1hssOQmpKosmsq7mtbUT/a0e5z4ni4yu15dHJ+ET249hzPhS//HxN5Y+hs+piI4vtyUBY
 6ailjgfpEjRv4j9UaTpKFib7i9OdncivyT1ZA6/7n7gsLRXkZaD2/QxpHsDKZxwGBOo4tGrSFI
 GrdtDJafVdtgbKRTSZeeB4x7BLnxYViyauNaQxKvbTNn0UDGPl0019jikf3JnC0plDdP2dtuCX
 htc=
X-SBRS: 2.7
X-MesageID: 6577681
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6577681"
To: Andrew Cooper <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
References: <1569957357-20803-1-git-send-email-igor.druzhinin@citrix.com>
 <63495f52-d696-e3bb-d82b-a5f3663ce3ba@citrix.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <86a72e5d-1785-6d00-0891-97634d79c9cf@citrix.com>
Date: Tue, 1 Oct 2019 20:51:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <63495f52-d696-e3bb-d82b-a5f3663ce3ba@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/crash: force unlock console
 before printing on kexec crash
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
Cc: wl@xen.org, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMTAvMjAxOSAyMDo0OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMS8xMC8yMDE5
IDIwOjE1LCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4gVGhlcmUgaXMgYSBzbWFsbCB3aW5kb3cg
d2hlcmUgc2hvb3Rkb3duIE5NSSBtaWdodCBjb21lIHRvIGEgQ1BVCj4+IChlLmcuIGluIHNlcmlh
bCBpbnRlcnJ1cHQgaGFuZGxlcikgd2hlcmUgY29uc29sZSBsb2NrIGlzIHRha2VuLiBJbiBvcmRl
cgo+PiBub3QgdG8gbGVhdmUgZm9sbG93aW5nIGNvbnNvbGUgcHJpbnRzIHdhaXRpbmcgaW5maW5p
dGVseSBmb3Igc2hvdCBkb3duCj4+IENQVXMgdG8gZnJlZSB0aGUgbG9jayAtIGZvcmNlIHVubG9j
ayB0aGUgY29uc29sZS4KPj4KPj4gVGhlIHJhY2UgaGFzIGJlZW4gZnJlcXVlbnRseSBvYnNlcnZl
ZCB3aGlsZSBjcmFzaGluZyBuZXN0ZWQgWGVuIGluCj4+IGFuIEhWTSBkb21haW4uCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgo+
PiAtLS0KPj4gIHhlbi9hcmNoL3g4Ni9jcmFzaC5jIHwgMiArKwo+PiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NyYXNoLmMg
Yi94ZW4vYXJjaC94ODYvY3Jhc2guYwo+PiBpbmRleCA2ZTFkM2QzLi5hMjBlYzhhIDEwMDY0NAo+
PiAtLS0gYS94ZW4vYXJjaC94ODYvY3Jhc2guYwo+PiArKysgYi94ZW4vYXJjaC94ODYvY3Jhc2gu
Ywo+PiBAQCAtMjksNiArMjksNyBAQAo+PiAgI2luY2x1ZGUgPGFzbS9pb19hcGljLmg+Cj4+ICAj
aW5jbHVkZSA8eGVuL2lvbW11Lmg+Cj4+ICAjaW5jbHVkZSA8YXNtL2hwZXQuaD4KPj4gKyNpbmNs
dWRlIDx4ZW4vY29uc29sZS5oPgo+PiAgCj4+ICBzdGF0aWMgY3B1bWFza190IHdhaXRpbmdfdG9f
Y3Jhc2g7Cj4+ICBzdGF0aWMgdW5zaWduZWQgaW50IGNyYXNoaW5nX2NwdTsKPj4gQEAgLTE1NSw2
ICsxNTYsNyBAQCBzdGF0aWMgdm9pZCBubWlfc2hvb3Rkb3duX2NwdXModm9pZCkKPj4gICAgICB9
Cj4+ICAKPj4gICAgICAvKiBMZWF2ZSBhIGhpbnQgb2YgaG93IHdlbGwgd2UgZGlkIHRyeWluZyB0
byBzaG9vdCBkb3duIHRoZSBvdGhlciBjcHVzICovCj4+ICsgICAgY29uc29sZV9mb3JjZV91bmxv
Y2soKTsKPj4gICAgICBpZiAoIGNwdW1hc2tfZW1wdHkoJndhaXRpbmdfdG9fY3Jhc2gpICkKPj4g
ICAgICAgICAgcHJpbnRrKCJTaG90IGRvd24gYWxsIENQVXNcbiIpOwo+PiAgICAgIGVsc2UKPiAK
PiBUaGUgb3ZlcmFsbCBjaGFuZ2UsIFItYnkgbWUsIGJ1dCBJJ2QgcHJlZmVyIHNvbWV0aGluZyBh
bG9uZyB0aGUgbGluZXMgb2Y6Cj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcmFzaC5j
IGIveGVuL2FyY2gveDg2L2NyYXNoLmMKPiBpbmRleCA2ZTFkM2QzYTg0Li40MTY4NzQ2NWFjIDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcmFzaC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2Ny
YXNoLmMKPiBAQCAtMTU0LDYgKzE1NCwxMiBAQCBzdGF0aWMgdm9pZCBubWlfc2hvb3Rkb3duX2Nw
dXModm9pZCkKPiDCoMKgwqDCoMKgwqDCoMKgIG1zZWNzLS07Cj4gwqDCoMKgwqAgfQo+IMKgCj4g
K8KgwqDCoCAvKgo+ICvCoMKgwqDCoCAqIFdlIG1heSBoYXZlIE5NSSdkIGFub3RoZXIgQ1BVIHdo
aWxlIGl0IHdhcyBob2xkaW5nIHRoZSBjb25zb2xlIGxvY2suCj4gK8KgwqDCoMKgICogSXQgd29u
J3QgYmUgaW4gYSBwb3NpdGlvbiB0byByZWxlYXNlIHRoZSBsb2NrLi4uCj4gK8KgwqDCoMKgICov
Cj4gK8KgwqDCoCBjb25zb2xlX2ZvcmNlX3VubG9jaygpOwo+ICsKPiDCoMKgwqDCoCAvKiBMZWF2
ZSBhIGhpbnQgb2YgaG93IHdlbGwgd2UgZGlkIHRyeWluZyB0byBzaG9vdCBkb3duIHRoZSBvdGhl
cgo+IGNwdXMgKi8KPiDCoMKgwqDCoCBpZiAoIGNwdW1hc2tfZW1wdHkoJndhaXRpbmdfdG9fY3Jh
c2gpICkKPiDCoMKgwqDCoMKgwqDCoMKgIHByaW50aygiU2hvdCBkb3duIGFsbCBDUFVzXG4iKTsK
PiAKPiAKPiBJZiB5b3UncmUgaGFwcHksIEkgY2FuIGZvbGQgdGhpcyBpbiBvbiBjb21taXQuCgpI
YXZlIG5vIG9iamVjdGlvbnMgYnV0IHRoZXJlIGFyZSBvdGhlciBwbGFjZXMgd2UgY2FsbApjb25z
b2xlX2ZvcmNlX3VubG9jaygpIGZvciBzaW1pbGFyIHB1cnBvc2VzIGFuZCB0aG9zZSBkb24ndCBo
YXZlCmV4cGxhbmF0b3J5IGNvbW1lbnRzIGxpa2UgdGhhdC4gRnJvbSBteSBwb2ludCBvZiB2aWV3
IHRoZSByZWFzb24gaGVyZSBpcwpraW5kIG9mIG9idmlvdXMgYnV0IGlmIHlvdSBwcmVmZXIuLi4K
Cklnb3IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
