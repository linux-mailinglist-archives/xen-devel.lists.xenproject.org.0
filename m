Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D106A12D064
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 14:41:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilvFS-00066Z-IU; Mon, 30 Dec 2019 13:38:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NUW5=2U=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ilvFR-00066U-DM
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 13:38:17 +0000
X-Inumbo-ID: a20b8b24-2b09-11ea-a032-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a20b8b24-2b09-11ea-a032-12813bfff9fa;
 Mon, 30 Dec 2019 13:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577713096;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=UadVBqaCRv8C+co1/WGdXx1ihAcqOP+fZ/gAAVBCMxE=;
 b=L+sFjhLyyHDEyJPIcBarFZgFNLYi84PqatlVwNjx4QXuUqghhyzoA6/S
 zrJxAfi0074dYWPW/aPndD/ath3O6zLvAqnndi5/nJ27mVGBPYv7/rLX9
 ag0kAVbr+goV44L58RHaHJJYWjy6hlrpXoK6KTxSx+aFnfgYDhpedYxxX c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /CDfecW8dVeYgH48I053xhaGHkKOSg5gZmxZsXRw8Sdg84eGRjnmXnOPm0s9QXhafiZXGcx1SS
 yyuR1kzRKs2zK8BiOfIam3NxNzpvRB5Im5IrtV0G+TVPOJq4+5M9C0ctOOWuatRZNDEM6B+jTi
 qJBf8bjeDKOXZeXjv1oN7mrMpdXPJZVXeq82QsYN3CrhKaR4EV2j7KdZ7q5wAgRPaT/sBnUYkq
 U0XLz7BxHXVjMEHPInsSTo4f8r3DYRU6KkR90vjNYYR/a37XqmsZg6T2ZltZZlPd6ZEK49/OTG
 ccw=
X-SBRS: 2.7
X-MesageID: 10644652
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,375,1571716800"; d="scan'208";a="10644652"
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20191227134516.15530-1-andrew.cooper3@citrix.com>
 <b190ca53-3541-438f-7a61-723a51e0d57d@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <967aad91-812f-3178-e8f5-1b787127ee8d@citrix.com>
Date: Mon, 30 Dec 2019 13:38:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b190ca53-3541-438f-7a61-723a51e0d57d@xen.org>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] tools/libxl: Reposition build_pre() logic
 between architectures
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
 Jan Beulich <JBeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMTIvMjAxOSAxMzoxNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJldywKPgo+
IE9uIDI3LzEyLzIwMTkgMTM6NDUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IFRoZSBjYWxsIHRv
IHhjX2RvbWFpbl9kaXNhYmxlX21pZ3JhdGUoKSBpcyBtYWRlIG9ubHkgZnJvbSB4ODYsIHdoaWxl
IGl0cwo+PiBoYW5kbGluZyBpbiBYZW4gaXMgY29tbW9uLsKgIE1vdmUgaXQgdG8gdGhlIGxpYnhs
X19idWlsZF9wcmUoKS4KPj4KPj4gaHZtX3NldF9jb25mX3BhcmFtcygpLCBodm1fc2V0X3Zpcmlk
aWFuX2ZlYXR1cmVzKCksCj4+IGh2bV9zZXRfbWNhX2NhcGFiaWxpdGllcygpLCBhbmQgdGhlIGFs
dHAybSBsb2dpYyBpcyBhbGwgaW4gY29tbW9uCj4+IGNvZGUgKHBhcnRzIGlmZGVmJ2QpIGJ1dCBk
ZXNwaXRlIHRoaXMsIGlzIGFsbCBhY3R1YWxseSB4ODYgc3BlY2lmaWMuCj4KPiBXaGlsZSBhbHRw
Mm0gaXMgb25seSBzdXBwb3J0ZWQgb24geDg2LCB0aGUgY29uY2VwdCBpcyBub3QKPiB4ODYtc3Bl
Y2lmaWMuIEkgYW0gYWN0dWFsbHkgYXdhcmUgb2YgcGVvcGxlIHVzaW5nIGFsdHAybSBvbiBBcm0s
Cj4gYWx0aG91Z2h0IHRoZSBzdXBwb3J0IGlzIG5vdCB1cHN0cmVhbSB5ZXQuCj4KPj4KPj4gTW92
ZSBpdCBpbnRvIHg4NiBzcGVjaWZpYyBjb2RlLCBhbmQgZm9sZCBhbGwgb2YgdGhlCj4+IHhjX2h2
bV9wYXJhbV9zZXQoKSBjYWxscwo+PiB0b2dldGhlciBpbnRvIGh2bV9zZXRfY29uZl9wYXJhbXMo
KSBpbiBhIGZhciBtb3JlIGNvaGVyZW50IHdheS4KPj4KPj4gRmluYWxseSAtIGVuc3VyZSB0aGF0
IGFsbCBoeXBlcmNhbGxzIGhhdmUgdGhlaXIgcmV0dXJuIHZhbHVlcyBjaGVja2VkLgo+Pgo+PiBO
byBwcmFjdGljYWwgY2hhbmdlIGluIGNvbnN0cnVjdGVkIGRvbWFpbnMuwqAgRmV3ZXIgdXNlbGVz
cyBoeXBlcmNhbGxzCj4+IG5vdyB0bwo+PiBjb25zdHJ1Y3QgYW4gQVJNIGd1ZXN0Lgo+Cj4gSSB0
aGluayBpdCB3b3VsZCBiZSBiZXN0IHRvIGtlZXAgYW55dGhpbmcgdGhhdCB3ZSBrbm93IGNhbiBi
ZSB1c2VkIG9uCj4gYXJtIChvciBuZXcgYXJjaGl0ZWN0dXJlKSBpbiBjb21tb24gY29kZS4gSSBh
bSB0aGlua2luZyBhYm91dAo+ICJuZXN0ZWRodm0iIGFuZCAiYWx0cDJtIi4KCk5laXRoZXIgb2Yg
dGhvc2Ugb3B0aW9ucyBhcmUgZ29pbmcgdG8gc3Vydml2ZSBpbiB0aGlzIGZvcm0uCgpBbHNvLCB0
aGUgY2hlY2tzIGNhbid0IHN0YXkgaW4gY29tbW9uIGNvZGUuwqAgQ3VycmVudGx5LCBYZW4gZG9l
c24ndApyZWplY3QgYmFkIHBhcmFtZXRlcnMsIGFuZCB0aGUgdG9vbHN0YWNrIGRvZXNuJ3QgY2hl
Y2sgcmV0dXJuIHZhbHVlcy7CoApGcmFua2x5LCBuZWl0aGVyIG9mIHRoZXNlIGJ1Z3Mgc2hvdWxk
IGV2ZXIgaGF2ZSBnb3QgdGhyb3VnaCBjb2RlIHJldmlldywKc2VlaW5nIGFzIHdlIHdlcmUgZG9p
bmcgcmF0aGVyIGJldHRlciBjb2RlIHJldmlldyBieSB0aGUgdGltZSB0aGUgQVJNCnBvcnQgY2Ft
ZSBhYm91dC4KCkkndmUgZml4ZWQgdGhlIGxpYnhsIGNvZGUgdG8gY2hlY2sgcmV0dXJuIHZhbHVl
cywgYnV0IHdoZW4gdGhlCmh5cGVydmlzb3IgaGFzIGl0cwoibm90LXF1aXRlLWFuLVhTQS1iZWNh
dXNlLXRoZS1ndWVzdC1pbmR1Y2VkLWRhbWFnZS1pcy1pbi11bnN1cHBvcnRlZC1zdWJzeXN0ZW1z
IgpidWdzIGZpeGVkLCB0aGVzZSBoeXBlcmNhbGxzIHdpbGwgc3RhcnQgZmFpbGluZy4KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
