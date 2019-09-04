Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA6FA7D13
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 09:53:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Q2n-0000ts-U7; Wed, 04 Sep 2019 07:49:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mPyZ=W7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5Q2n-0000tj-6x
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 07:49:33 +0000
X-Inumbo-ID: 870403ec-cee8-11e9-abad-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 870403ec-cee8-11e9-abad-12813bfff9fa;
 Wed, 04 Sep 2019 07:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567583371;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5raqPB933ZZfkIZIpH9WFzSdTKxUqsXCVb8bLdZBGOw=;
 b=Xc9eBJuVKpz32noV7snqorXQG51YS454xY9jR/LqVVIitFje75OrV9ii
 zzlpvozFirPH/I0cIqBlRyBKw+WKIZw/ayz6WSifiRNjvjbLSX+BXs69R
 xFF+Wgc179CN3OAHQwhpvFnprykZ5w5no3ZgvyrB+FAu/FW/F3YTjgcZ9 A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AkVHQj+9hLCfE7O469hcG9aibxBJekMvu9RVg/daVnNpoX78W0pG+5f6JXg0VGOKPmktxHn6OC
 ZqaM01AABHbALu0dCOY317sJZznG8ySzE4MizoeCtBqzyvhpUey55ZdM/i/3mQq+uVIpFLZDxB
 aa1uT6V3laM9BlQd+qOkMP0cAc/ATF8iGNBHN3Q11fslRfc4ClLhDXIo9VoRDmiMA7zyTFo9O6
 e3vKWwzMudlN/nKj0PISjRhx9ATGzXgjz/lMzCZNZ00Y+tXRONHg2IlshrQv/T4/zMTjsmRpgf
 qoI=
X-SBRS: 2.7
X-MesageID: 5150886
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,465,1559534400"; 
   d="scan'208";a="5150886"
Date: Wed, 4 Sep 2019 09:49:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190904074923.ji76uhn2kr7rff4b@Air-de-Roger>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-3-roger.pau@citrix.com>
 <c626a063-f657-d614-eea5-dcfca3df46f0@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c626a063-f657-d614-eea5-dcfca3df46f0@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 02/11] ioreq: terminate cf8 handling at
 hypervisor level
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDY6MTM6NTlQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwMy8wOS8yMDE5IDE3OjE0LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jIGIveGVuL2FyY2gveDg2L2h2bS9p
b3JlcS5jCj4gPiBpbmRleCA2OTJiNzEwYjAyLi42OTY1MmUxMDgwIDEwMDY0NAo+ID4gLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2lvcmVx
LmMKPiA+IEBAIC0xMDE1LDYgKzEwMTUsMTIgQEAgaW50IGh2bV9tYXBfaW9fcmFuZ2VfdG9faW9y
ZXFfc2VydmVyKHN0cnVjdCBkb21haW4gKmQsIGlvc2VydmlkX3QgaWQsCj4gPiAgICAgIHN3aXRj
aCAoIHR5cGUgKQo+ID4gICAgICB7Cj4gPiAgICAgIGNhc2UgWEVOX0RNT1BfSU9fUkFOR0VfUE9S
VDoKPiA+ICsgICAgICAgIHJjID0gLUVJTlZBTDsKPiA+ICsgICAgICAgIC8qIFBDSSBjb25maWcg
c3BhY2UgYWNjZXNzZXMgYXJlIGhhbmRsZWQgaW50ZXJuYWxseS4gKi8KPiA+ICsgICAgICAgIGlm
ICggc3RhcnQgPD0gMHhjZjggKyA4ICYmIDB4Y2Y4IDw9IGVuZCApCj4gPiArICAgICAgICAgICAg
Z290byBvdXQ7Cj4gPiArICAgICAgICBlbHNlCj4gPiArICAgICAgICAgICAgLyogZmFsbHRocm91
Z2guICovCj4gCj4gWW91IG5lZWQgdG8gZHJvcCB0aGUgZWxzZSwgb3IgaXQgbWF5IHN0aWxsIHRy
aWdnZXIgd2FybmluZ3MuCgpZZXMsIG15IG1pc3Rha2UuIFRoZSBlbHNlIGJyYW5jaCBpcyBub3Qg
bmVlZGVkLgoKPiBGdXJ0aGVybW9yZSwgcWVtdSByZWdpc3RlcnMgY2Y4LWNmZiBzbyBJIHRoaW5r
IHlvdSBuZWVkIHNvbWUgZml4LXVwcwo+IHRoZXJlIGZpcnN0IGJlZm9yZSB0aHJvd2luZyBlcnJv
cnMgYmFjayBoZXJlLgoKVGhlIHZlcnNpb24gb2YgUUVNVSBJIGhhdmUgZG9lc24ndCBzZWVtIHRv
IHJlZ2lzdGVyIDB4Y2Y4IG9yIDB4Y2ZjLAp0aGVyZSBhcmUgbm8gZXJyb3JzIG9uIHRoZSBsb2cg
YW5kIFFFTVUgc2VlbXMgdG8gd29yayBqdXN0IGZpbmUuCgpJIGFsd2F5cyBhc3N1bWVkIFFFTVUg
d2FzIGdldHRpbmcgYWNjZXNzZXMgdG8gY2Y4L2NmYyBmb3J3YXJkZWQKYmVjYXVzZSBpdCB3YXMg
dGhlIGRlZmF1bHQgZGV2aWNlIG1vZGVsLCBhbmQgZXZlcnl0aGluZyBub3QgdHJhcHBlZCBieQpY
ZW4gd291bGQgYmUgZm9yd2FyZGVkIHRvIGl0LiBUaGlzIGRlZmF1bHQgZGV2aWNlIG1vZGVsIGJl
aGF2aW91ciB3YXMKcmVtb3ZlZCBieSBQYXVsIHNvbWUgdGltZSBhZ28sIGFuZCBub3cgUUVNVSBy
ZWdpc3RlcnMgZXhwbGljaXRseSB3aGljaApJTyBhY2Nlc3NlcyBpdCB3YW50cyB0byB0cmFwLgoK
PiBGaW5hbGx5LCB0aGlzIHByb2hpYml0cyByZWdpc3RlcmluZyBjZjkgd2hpY2ggbWF5IGxlZ2l0
aW1hdGVseSBub3QgYmUKPiB0ZXJtaW5hdGVkIGluIFhlbi4KClllcywgdGhhdCBzaG91bGQgYmUg
Y2Y4IC0gNyBub3QgOCwgdGhhbmtzIGZvciBjYXRjaGluZyBpdCEgV2lsbCB1cGRhdGUKb24gdGhl
IG5leHQgdmVyc2lvbi4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
