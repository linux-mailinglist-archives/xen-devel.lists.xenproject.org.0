Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D832B66CF
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 17:11:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAbXa-00081e-G0; Wed, 18 Sep 2019 15:06:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TFR+=XN=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iAbXY-00081K-Ar
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 15:06:44 +0000
X-Inumbo-ID: ec614a36-da25-11e9-b76c-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec614a36-da25-11e9-b76c-bc764e2007e4;
 Wed, 18 Sep 2019 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568819204;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=FLn642o4u+ROJcoLs/HLfD/hFjIIOxy5Ej3ulM/KOVg=;
 b=gb7QveKDwpbmzpGMkTxnV2CAK1SedIFE0tIdI4oVsPEmnTA5eNl0PwLv
 +VKxovi1D+F5s2Bo9ppMOrY52XCWnc83zfZLXgl69FxOC5dV46/shZNpg
 34+fPcbnO4nMl1OfGpNlt3BNyyvU0FWl6ctMxBgDMfvl07kXFquf4JYNh 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KjCeHZtvXCeGJJo/OZtVwWkOLSn2znG7/uW8qDRgr1vXE/5UCpdkYprAbKT/qwUTt3/6D3DmZk
 zLPjKbbar/8w6oSayy8JLsT6ZeQ8F6pFtFOr/pKctdJpuPWKP5Z4R+qcanlNnwW5pPpcENn6YX
 zUCwI73k72vdRGwHIlw6fjvrPnzXQK+TCf8y+b/GbvYOYI74ridfSe4UG7HD5igWEZLh3gmfUw
 PonSzHteBUV7sjmjp6zpGzNtGLwm43nStrIYAiKnWfrL68zzhNICcgmFWtuf4vXkld3Bf1B0H/
 WZ4=
X-SBRS: 2.7
X-MesageID: 5792816
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="5792816"
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <20190918135256.7287-1-julien.grall@arm.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <3e4ee05d-d92e-ca86-9453-49405d8609b8@citrix.com>
Date: Wed, 18 Sep 2019 16:06:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190918135256.7287-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: livepatch: Prevent CPUs
 to fetch stale instructions after livepatching
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xOC8xOSAyOjUyIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gRHVyaW5nIGxpdmVwYXRj
aCwgYSBzaW5nbGUgQ1BVIHdpbGwgdGFrZSBjYXJlIG9mIGFwcGx5aW5nIHRoZSBwYXRjaCBhbmQK
PiBhbGwgdGhlIG90aGVycyB3aWxsIHdhaXQgZm9yIHRoZSBhY3Rpb24gdG8gY29tcGxldGUuIFRo
ZXkgd2lsbCB0aGVuIG9uY2UKPiBleGVjdXRlIGFyY2hfbGl2ZXBhdGNoX3Bvc3RfYWN0aW9uKCkg
dG8gZmx1c2ggdGhlIHBpcGVsaW5lLgo+IAo+IFBlciBCMi4yLjUgIkNvbmN1cnJlbnQgbW9kaWZp
Y2F0aW9uIGFuZCBleGVjdXRpb24gb2YgaW5zdHJ1Y3Rpb25zIiBpbgo+IERESSAwNDg3RS5hLCBm
bHVzaGluZyB0aGUgaW5zdHJ1Y3Rpb24gY2FjaGUgaXMgbm90IGVub3VnaCB0byBlbnN1cmUgbmV3
Cj4gaW5zdHJ1Y3Rpb25zIGFyZSBzZWVuLiBBbGwgdGhlIFBFcyBzaG91bGQgYWxzbyBkbyBhbiBp
c2IoKSB0bwo+IHN5bmNocm9uaXplIHRoZSBmZXRjaGVkIGluc3RydWN0aW9uIHN0cmVhbS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0t
LQo+ICAgeGVuL2FyY2gvYXJtL2xpdmVwYXRjaC5jIHwgMyArKy0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2xpdmVwYXRjaC5jIGIveGVuL2FyY2gvYXJtL2xpdmVwYXRjaC5jCj4gaW5kZXggMjc5
ZDUyY2M2Yy4uMDBjNWUyYmM0NSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vbGl2ZXBhdGNo
LmMKPiArKysgYi94ZW4vYXJjaC9hcm0vbGl2ZXBhdGNoLmMKPiBAQCAtODgsNyArODgsOCBAQCB2
b2lkIGFyY2hfbGl2ZXBhdGNoX3JldmVydChjb25zdCBzdHJ1Y3QgbGl2ZXBhdGNoX2Z1bmMgKmZ1
bmMpCj4gICAKPiAgIHZvaWQgYXJjaF9saXZlcGF0Y2hfcG9zdF9hY3Rpb24odm9pZCkKPiAgIHsK
PiAtICAgIC8qIGFyY2hfbGl2ZXBhdGNoX3Jldml2ZSBoYXMgbnVrZWQgdGhlIGluc3RydWN0aW9u
IGNhY2hlLiAqLwo+ICsgICAgLyogRGlzY2FyZCBhbnkgc3RhbGUgaW5zdHJ1Y3Rpb25zIHRoYXQg
bWF5IGhhdmUgYmVlbiBmZXRjaGVkLiAqLwo+ICsgICAgaXNiKCk7Cj4gICB9Cj4gICAKPiAgIHZv
aWQgYXJjaF9saXZlcGF0Y2hfbWFzayh2b2lkKQo+IApBY2tlZC1ieTogUm9zcyBMYWdlcndhbGwg
PHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
