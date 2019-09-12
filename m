Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D17BB09F4
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 10:11:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8K8w-0007s4-Eb; Thu, 12 Sep 2019 08:07:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UPIc=XH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i8K8u-0007rJ-MD
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 08:07:52 +0000
X-Inumbo-ID: 6aa6ed5c-d534-11e9-978d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6aa6ed5c-d534-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 08:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568275672;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zVPws00A2JyMwCOCtAqXnwe6udsJirErc5AxNUBePK0=;
 b=SomdF7Abn/noxRep+igg7N3he49iMco/hq3KUR5LceJkVMdiDf7P1N+E
 R7xfeTLbP88MbcCMS7WdPL9imko3nGfUb0XqqTO9bEqKCOGaTbm+3DtkT
 ZUkTOpvSdudxHBKl3pK8cl3Be3sZQK9Dl9B2p7pPCrV5j35PQgU+OxjfS w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7usLkKu7tob8ApdTHPbuJYHO4/XgoyPGcQiiFQZi9tuoyf5Ds+VSFNqctSP1XmyLXkPtFXF6BE
 qEI43BDqJM7YGch2D7RE9eGcH/lI+oUmmwS4l26+ZMv+tU7YyQ52wQYX6Sir1hJgYDZAX5XV2N
 0hXb0h9yaM8JJYvyXnbOykXM4x3xkEdNnDFU+ZtZ+mOzQoS/MyJp3b9uGFsWENqpLVqDLDzWRB
 ZPA68pETFWV3hfRvZwY0XgZv9z/WQzN4jAAdvou4IKQeu/yaFZv0gewMMuYMy7gWvuAUzZ5ZnB
 +sw=
X-SBRS: 2.7
X-MesageID: 5761010
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,495,1559534400"; 
   d="scan'208";a="5761010"
To: Jan Beulich <jbeulich@suse.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
 <20190911200504.5693-3-andrew.cooper3@citrix.com>
 <a30eb09e-191a-723e-f696-6248f09b3804@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <3da04612-c174-067c-524f-15326c7f690e@citrix.com>
Date: Thu, 12 Sep 2019 09:07:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a30eb09e-191a-723e-f696-6248f09b3804@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/8] x86/cpuid: Split
 update_domain_cpuid_info() in half
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDkvMjAxOSAwODo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTEuMDkuMjAxOSAy
MjowNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gdXBkYXRlX2RvbWFpbl9jcHVpZF9pbmZvKCkg
Y3VycmVudGx5IHNlcnZlcyB0d28gcHVycG9zZXMuICBGaXJzdCB0byBtZXJnZSBuZXcKPj4gQ1BV
SUQgZGF0YSBmcm9tIHRoZSB0b29sc3RhY2ssIGFuZCBzZWNvbmQsIHRvIHBlcmZvcm0gYW55IG5l
Y2Vzc2FyeSB1cGRhdGluZwo+PiBvZiBkZXJpdmVkIGRvbWFpbi92Y3B1IHNldHRpbmdzLgo+Pgo+
PiBUaGUgZmlyc3QgcGFydCBvZiB0aGlzIGlzIGdvaW5nIHRvIGJlIHN1cGVyc2VkZWQgYnkgYSBu
ZXcgYW5kIHN1YnN0YW50aWFsbHkKPj4gbW9yZSBlZmZpY2llbnQgaHlwZXJjYWxsLgo+Pgo+PiBD
YXJ2ZSB0aGUgc2Vjb25kIHBhcnQgb3V0IGludG8gYSBuZXcgZG9tYWluX2NwdV9wb2xpY3lfY2hh
bmdlZCgpIGhlbHBlciwgYW5kCj4+IGNhbGwgdGhpcyBmcm9tIHRoZSByZW1haW5zIG9mIHVwZGF0
ZV9kb21haW5fY3B1aWRfaW5mbygpLgo+Pgo+PiBUaGlzIGRvZXMgZHJvcCB0aGUgY2FsbF9wb2xp
Y3lfY2hhbmdlZCwgYnV0IHdpdGggdGhlIG5ldyBoeXBlcmNhbGwgaHlwZXJjYWxsCj4gZHVwbGlj
YXRlICJoeXBlcmNhbGwiCj4KPj4gaW4gcGxhY2UsIHRoZSBjb21tb24gY2FzZSB3aWxsIGJlIGEg
c2luZ2xlIGNhbGwgcGVyIGRvbWFpbi4gIERyb3BwaW5nIHRoZQo+PiBvcHRpbWlzYXRpb24gaGVy
ZSBhbGxvd3MgZm9yIGEgY2xlYW5lciBzZXQgb2YgZm9sbG93aW5nIGNoYW5nZXMuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4g
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRoYW5rcy4KCj4g
d2l0aCBvbmUgcHVyZWx5IGNvc21ldGljIHJlbWFyazoKPgo+PiBAQCAtMzE3LDI3ICsxOTMsMTA0
IEBAIHN0YXRpYyBpbnQgdXBkYXRlX2RvbWFpbl9jcHVpZF9pbmZvKHN0cnVjdCBkb21haW4gKmQs
Cj4+ICAKPj4gICAgICAgICAgICAgIGQtPmFyY2gucHYuY3B1aWRtYXNrcy0+ZTFjZCA9IG1hc2s7
Cj4+ICAgICAgICAgIH0KPj4gKyAgICB9Cj4+ICsKPj4gKyAgICBmb3JfZWFjaF92Y3B1KCBkLCB2
ICkKPiBWYWxpZCBzcGVsbGluZyBpcyAiZm9yX2VhY2hfdmNwdSAoIGQsIHYgKSIgKGFzIGl0IHdh
cyBpbiB0aGUgb3JpZ2luYWwKPiBjb2RlKQoKVGhlIG9yaWdpbmFsIGNvZGUgaGFkIHR3byBzdWNo
IGxvb3BzOgoKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3JfZWFjaF92Y3B1ICggZCwgdiApCsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2cG11X2Rlc3Ryb3kodik7CgphbmQKCsKgwqDC
oMKgwqDCoMKgIGZvcl9lYWNoX3ZjcHUoIGQsIHYgKQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNw
dWlkX3BvbGljeV91cGRhdGVkKHYpOwoKR3Vlc3Mgd2hpY2ggb25lIEkgZGlkbid0IGRlbGV0ZSB3
aGlsZSByZWZhY3RvcmluZyAoYW5kIG9idmlvdXNseSB3YXNuJ3QKcGF5aW5nIGVub3VnaCBhdHRl
bnRpb24gdG8pLgoKSSdsbCBmaXggdGhlIHN0eWxlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
