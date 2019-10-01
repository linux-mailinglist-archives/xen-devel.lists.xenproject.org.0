Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59214C4150
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 21:51:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFO8I-00065R-UC; Tue, 01 Oct 2019 19:48:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=78uS=X2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iFO8G-00065M-QI
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 19:48:24 +0000
X-Inumbo-ID: 6da15222-e484-11e9-8628-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 6da15222-e484-11e9-8628-bc764e2007e4;
 Tue, 01 Oct 2019 19:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569959304;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=xAgDkluzuyXP+L4xZi4Z064+7Y58bKwtNAANxvFpoUo=;
 b=HO1KF/dtEobvdyhZb8XqTqfUlB5vQuREXC5/ijoSp0USAVWM4hP8MdgW
 MWcCOOor+1gXO6jno5Uc7crUQCP+wW+oxyAoqZfFAwL/KBCsVOduaERzE
 G16+WBqTlhZ0plzaIyW6CsKTePtHxBM0AV4WDc3lo3n8NBhvvZQJa56Xs g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nfXAnNURnSzb48Y5rbxtRzwoMe637xa9UkkOCPcbShK/ZYgUQjRkJvhjMpWrpeex/qq00WOn1B
 vanEyEL2NvDFHeZ5ApW5LpAaLiftjh97VO8LAlQ6l8ev7gP//TDYQ91mCLed92uuQLF8c3wvvj
 7cIMvnVsecbzIRm6Q9VxEI/sT+/DH+pHOMAt5smfI7CZGBukpefRfDUyitqXLakGipVtGnA0SU
 oiraTEferE8VLjfy+69AqQlVhSRzH/gBwphusWVJxFvIAuLQbU3AOU5SyaYWwTwXTCvI9h7zQQ
 ULM=
X-SBRS: 2.7
X-MesageID: 6626849
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6626849"
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <1569957357-20803-1-git-send-email-igor.druzhinin@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <63495f52-d696-e3bb-d82b-a5f3663ce3ba@citrix.com>
Date: Tue, 1 Oct 2019 20:48:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569957357-20803-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

T24gMDEvMTAvMjAxOSAyMDoxNSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gVGhlcmUgaXMgYSBz
bWFsbCB3aW5kb3cgd2hlcmUgc2hvb3Rkb3duIE5NSSBtaWdodCBjb21lIHRvIGEgQ1BVCj4gKGUu
Zy4gaW4gc2VyaWFsIGludGVycnVwdCBoYW5kbGVyKSB3aGVyZSBjb25zb2xlIGxvY2sgaXMgdGFr
ZW4uIEluIG9yZGVyCj4gbm90IHRvIGxlYXZlIGZvbGxvd2luZyBjb25zb2xlIHByaW50cyB3YWl0
aW5nIGluZmluaXRlbHkgZm9yIHNob3QgZG93bgo+IENQVXMgdG8gZnJlZSB0aGUgbG9jayAtIGZv
cmNlIHVubG9jayB0aGUgY29uc29sZS4KPgo+IFRoZSByYWNlIGhhcyBiZWVuIGZyZXF1ZW50bHkg
b2JzZXJ2ZWQgd2hpbGUgY3Jhc2hpbmcgbmVzdGVkIFhlbiBpbgo+IGFuIEhWTSBkb21haW4uCj4K
PiBTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNv
bT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L2NyYXNoLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3Jhc2guYyBi
L3hlbi9hcmNoL3g4Ni9jcmFzaC5jCj4gaW5kZXggNmUxZDNkMy4uYTIwZWM4YSAxMDA2NDQKPiAt
LS0gYS94ZW4vYXJjaC94ODYvY3Jhc2guYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcmFzaC5jCj4g
QEAgLTI5LDYgKzI5LDcgQEAKPiAgI2luY2x1ZGUgPGFzbS9pb19hcGljLmg+Cj4gICNpbmNsdWRl
IDx4ZW4vaW9tbXUuaD4KPiAgI2luY2x1ZGUgPGFzbS9ocGV0Lmg+Cj4gKyNpbmNsdWRlIDx4ZW4v
Y29uc29sZS5oPgo+ICAKPiAgc3RhdGljIGNwdW1hc2tfdCB3YWl0aW5nX3RvX2NyYXNoOwo+ICBz
dGF0aWMgdW5zaWduZWQgaW50IGNyYXNoaW5nX2NwdTsKPiBAQCAtMTU1LDYgKzE1Niw3IEBAIHN0
YXRpYyB2b2lkIG5taV9zaG9vdGRvd25fY3B1cyh2b2lkKQo+ICAgICAgfQo+ICAKPiAgICAgIC8q
IExlYXZlIGEgaGludCBvZiBob3cgd2VsbCB3ZSBkaWQgdHJ5aW5nIHRvIHNob290IGRvd24gdGhl
IG90aGVyIGNwdXMgKi8KPiArICAgIGNvbnNvbGVfZm9yY2VfdW5sb2NrKCk7Cj4gICAgICBpZiAo
IGNwdW1hc2tfZW1wdHkoJndhaXRpbmdfdG9fY3Jhc2gpICkKPiAgICAgICAgICBwcmludGsoIlNo
b3QgZG93biBhbGwgQ1BVc1xuIik7Cj4gICAgICBlbHNlCgpUaGUgb3ZlcmFsbCBjaGFuZ2UsIFIt
YnkgbWUsIGJ1dCBJJ2QgcHJlZmVyIHNvbWV0aGluZyBhbG9uZyB0aGUgbGluZXMgb2Y6CgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2NyYXNoLmMgYi94ZW4vYXJjaC94ODYvY3Jhc2guYwppbmRl
eCA2ZTFkM2QzYTg0Li40MTY4NzQ2NWFjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY3Jhc2gu
YworKysgYi94ZW4vYXJjaC94ODYvY3Jhc2guYwpAQCAtMTU0LDYgKzE1NCwxMiBAQCBzdGF0aWMg
dm9pZCBubWlfc2hvb3Rkb3duX2NwdXModm9pZCkKwqDCoMKgwqDCoMKgwqDCoCBtc2Vjcy0tOwrC
oMKgwqDCoCB9CsKgCivCoMKgwqAgLyoKK8KgwqDCoMKgICogV2UgbWF5IGhhdmUgTk1JJ2QgYW5v
dGhlciBDUFUgd2hpbGUgaXQgd2FzIGhvbGRpbmcgdGhlIGNvbnNvbGUgbG9jay4KK8KgwqDCoMKg
ICogSXQgd29uJ3QgYmUgaW4gYSBwb3NpdGlvbiB0byByZWxlYXNlIHRoZSBsb2NrLi4uCivCoMKg
wqDCoCAqLworwqDCoMKgIGNvbnNvbGVfZm9yY2VfdW5sb2NrKCk7CisKwqDCoMKgwqAgLyogTGVh
dmUgYSBoaW50IG9mIGhvdyB3ZWxsIHdlIGRpZCB0cnlpbmcgdG8gc2hvb3QgZG93biB0aGUgb3Ro
ZXIKY3B1cyAqLwrCoMKgwqDCoCBpZiAoIGNwdW1hc2tfZW1wdHkoJndhaXRpbmdfdG9fY3Jhc2gp
ICkKwqDCoMKgwqDCoMKgwqDCoCBwcmludGsoIlNob3QgZG93biBhbGwgQ1BVc1xuIik7CgoKSWYg
eW91J3JlIGhhcHB5LCBJIGNhbiBmb2xkIHRoaXMgaW4gb24gY29tbWl0LgoKfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
