Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2862A92595
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 15:55:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzi57-0004Qn-0O; Mon, 19 Aug 2019 13:52:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ecZk=WP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hzi55-0004Qf-PY
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 13:52:19 +0000
X-Inumbo-ID: 8f22abe4-c288-11e9-b90c-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f22abe4-c288-11e9-b90c-bc764e2007e4;
 Mon, 19 Aug 2019 13:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566222738;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=lH7ByM0GvlXZD6MwlbhmoylPKY8NAK09ALr+sls3fKo=;
 b=Ir6q3dPYUMFN5xoma97RjBVTjCeVKBEkgTZYkZ5Nh16CI0qrdamMnsKn
 gd3sm2HsTU13Q/ZqvTAFCv9/K8T2RIAaGqG/JIQLSnbP7akjTiKDkoHll
 Bu8JcSa+LO+a/8AW5A5E3364bZQMi3gVKSFqisrkRmcO83b5vLR4MDVL7 U=;
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
IronPort-SDR: 8/PolnvORtOsY0rh7mRUMMvYgVqXZDNjGICdzSTRGu5MgVC9v+YEzs1+KVSdj/Ksio17jIQF00
 9IUYrRvQBcK/nKMt5aTiZdFmZhYb/JJuqt6ym/huYVHDZuvIsQFft+dcQpPYWSqN/LXLHKxQyO
 cF5AgM+Ap7wxqKZ2Xe9JI5hFW3Bio0ak6e/r1whXvp8YBRBIf4DxCga9SuVNDkqRvEi56kQg1j
 ZJr9gePEW08wtuoTgF8Fs74/g5g3pDoLWvFeIy1TeK4FQX9Th2baxGUXq7VEdtNYkcF8b4IOwx
 4ps=
X-SBRS: 2.7
X-MesageID: 4630658
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,405,1559534400"; 
   d="scan'208";a="4630658"
To: =?UTF-8?Q?Micha=c5=82_Kowalczyk?= <mkow@invisiblethingslab.com>,
 <xen-devel@lists.xenproject.org>
References: <1c917278029b206317a2155fb78e63ed14b621e5.1566176127.git.mkow@invisiblethingslab.com>
 <93632bab-f393-0c9c-94a8-dc18a06d873e@citrix.com>
 <9cb4d3b4-baab-0fe0-8876-51a7633313d7@invisiblethingslab.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <9d722a06-2585-82b8-9b04-18240526eaf6@citrix.com>
Date: Mon, 19 Aug 2019 14:52:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9cb4d3b4-baab-0fe0-8876-51a7633313d7@invisiblethingslab.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v1] x86: Restore IA32_MISC_ENABLE on wakeup
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
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDgvMjAxOSAxNDo1MCwgTWljaGHFgiBLb3dhbGN6eWsgd3JvdGU6Cj4gT24gOC8xOS8x
OSAxMTowNCBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTkvMDgvMjAxOSAwMzoyMywg
TWljaGHFgiBLb3dhbGN6eWsgd3JvdGU6Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Jv
b3QvdHJhbXBvbGluZS5TIGIveGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TCj4+PiBpbmRl
eCA3YzZhMjMyOGQyLi5mY2FhM2VlYWYxIDEwMDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2Jv
b3QvdHJhbXBvbGluZS5TCj4+PiArKysgYi94ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMK
Pj4+IEBAIC04NSw3ICs4NSw3IEBAIHRyYW1wb2xpbmVfZ2R0Ogo+Pj4gICAgICAgICAgLmxvbmcg
ICB0cmFtcG9saW5lX2dkdCArIEJPT1RfUFNFVURPUk1fRFMgKyAyIC0gLgo+Pj4gICAgICAgICAg
LnBvcHNlY3Rpb24KPj4+ICAKPj4+IC1HTE9CQUwodHJhbXBvbGluZV9taXNjX2VuYWJsZV9vZmYp
Cj4+PiArR0xPQkFMKG1pc2NfZW5hYmxlX29mZikKPj4gVGhlIG92ZXJhbGwgY2hhbmdlIGlzIGZp
bmUsIGJ1dCB3aHkgaGF2ZSB5b3UgcmVuYW1lZCB0aGlzIHZhcmlhYmxlPwo+IFRoZSBvbGQgbmFt
ZSBoYWQgInRyYW1wb2xpbmVfIiBwcmVmaXggYmVjYXVzZSB0aGUgb25seSBwbGFjZSB3aGVyZSBp
dAo+IHdhcyB1c2VkIHdhcyB0cmFtcG9saW5lX3Byb3Rtb2RlX2VudHJ5IGluIGFyY2gveDg2L2Jv
b3QvdHJhbXBvbGluZS5TLgo+IE5vdyBpdCdzIGFsc28gdXNlZCBpbiB0aGUgd2FrZXVwIGNvZGUs
IHNvIEkgcmVtb3ZlZCB0aGUgcHJlZml4IHdoaWNoCj4gY291bGQgYmUgKElNTykgbWlzbGVhZGlu
Zy4KPj4gV2l0aG91dCB0aGUgcmVuYW1lLCB0aGUgcGF0Y2ggd291bGQgYmUganVzdCB0aGUgc2lu
Z2xlIGh1bmsgaW4gd2FrZXVwLlMKPj4gYW5kIHRoZXJlZm9yZSBlYXNpZXIgdG8gYmFja3BvcnQu
Cj4gVHJ1ZS4gQW55d2F5LCB0aGUgZGVjaXNpb24gaXMgb24geW91ciBzaWRlLCBJIGNhbiBsZWF2
ZSB0aGUgb2xkIG5hbWUgaWYKPiB5b3UgcHJlZmVyLgoKVGhlIHRyYW1wb2xpbmVfIHByZWZpeCBp
bmRpY2F0ZXMgd2hlcmUgdGhlIGRhdGEgbGl2ZXMsIHdoaWNoIGlzIGluIHRoZQoxNiBiaXQgdHJh
bXBvbGluZSB3aGljaCBjb250YWlucyBib3RoIHRoZSBBUCBib290IHBhdGgsIGFuZCB3YWtldXAg
cGF0aC4KCklmIHlvdSdyZSBoYXBweSB3aXRoIHRoaXMsIEkgY2FuIGFkanVzdCBvbiBjb21taXQg
dG8gYXZvaWQgeW91IHNlbmRpbmcgYQpzZWNvbmQgdGltZS4KCn5BbmRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
