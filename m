Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C762A12E993
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 18:52:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in4bd-0000eb-JZ; Thu, 02 Jan 2020 17:49:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WNQ8=2X=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1in4bc-0000dz-9y
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 17:49:56 +0000
X-Inumbo-ID: 48d5e78a-2d88-11ea-a3a4-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48d5e78a-2d88-11ea-a3a4-12813bfff9fa;
 Thu, 02 Jan 2020 17:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577987395;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=q4gKztM3vlZfs4wq0vdx17JjubV+XsngYZMv56vkB44=;
 b=JjM8RLP2Bj4JtJ1DTD1V1TDCMsircUl9SsLZ8patf68emMouB8NJNLna
 E5QhoYGzI4ThTotc0+NK9xU1PXjChFiCpepov+7y9wGlO0+nhuPtCLQFG
 QJrSngIqnZqwd6nMKoTnioevvkAEKpv6q6U30gI2II3BNI57g/nGcdPu+ M=;
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
IronPort-SDR: n9gS2ahYTsiXg5+aI6+tSp/7CWx58jv2zdn4JhMNjhqkosGEKoMgerSnwMB9YOFX4nh+849R82
 jhl9yG/7ia45gXoog7XPO3lwCNpBw5TBPgyF34t+LEqzcsh/FywlVn/W9PiFi/qTYN5B2PsbRE
 Wx/g7fu2CUp0npzL8jvs2p6b9IOv28UwYthSygatXDE0+IIqKdTP0n5UdPjf8M15QgYm+KtDks
 Clhw5nildQyi1msObwvMfSfNrjcSaHHHj2C1snxBfiJmzV/0/3PWa+OO4dRjfH+Pcct0hSJTsn
 E/4=
X-SBRS: 2.7
X-MesageID: 10751529
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,387,1571716800"; d="scan'208";a="10751529"
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20191217201550.15864-1-andrew.cooper3@citrix.com>
 <20191217201550.15864-5-andrew.cooper3@citrix.com>
 <ccafa7fc-5cd2-2d3f-a62f-0185ff8ca5e1@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <4fbaff27-eb58-481e-77d0-c6d948004ab0@citrix.com>
Date: Thu, 2 Jan 2020 17:49:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ccafa7fc-5cd2-2d3f-a62f-0185ff8ca5e1@xen.org>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 4/4] tools/dombuilder: Don't allocate
 dom->p2m_host[] for translated domains
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Varad Gautam <vrd@amazon.de>, Stefano
 Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMvMTIvMjAxOSAxODoyMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+Cj4gT24gMTcv
MTIvMjAxOSAyMToxNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4geGNfZG9tX3AybSgpIGFuZCBk
b20tPnAybV9ob3N0W10gaW1wbGVtZW50IGEgbGluZWFyIHRyYW5zZm9ybSBmb3IKPj4gdHJhbnNs
YXRlZAo+PiBkb21haW5zLCBidXQgd2FzdGUgYSBzdWJzdGFudGlhbCBjaHVuayBvZiBSQU0gZG9p
bmcgc28uCj4+Cj4+IEFSTSBsaXRlcmFsbHkgbmV2ZXIgcmVhZHMgZG9tLT5wMm1faG9zdFtdIChi
ZWNhdXNlIG9mIHRoZQo+PiB4Y19kb21fdHJhbnNsYXRlZCgpCj4+IHNob3J0IGNpcmN1aXQgaW4g
eGNfZG9tX3AybSgpKS7CoCBEcm9wIGl0IGFsbC4KPj4KPj4geDg2IEhWTSBkb2VzIHVzZSBkb20t
PnAybV9ob3N0W10gZm9yCj4+IHhjX2RvbWFpbl9wb3B1bGF0ZV9waHlzbWFwX2V4YWN0KCkgY2Fs
bHMKPj4gd2hlbiBwb3B1bGF0aW5nIDRrIHBhZ2VzLsKgIFJldXNlIHRoZSBzYW1lIHRhY3RpYyBm
cm9tIDJNLzFHIHJhbmdlcwo+PiBhbmQgdXNlIGFuCj4+IG9uLXN0YWNrIGFycmF5IGluc3RlYWQu
wqAgRHJvcCB0aGUgbWVtb3J5IGFsbG9jYXRpb24uCj4+Cj4+IHg4NiBQViBndWVzdHMgZG8gdXNl
IGRvbS0+cDJtX2hvc3RbXSBhcyBhIG5vbi1pZGVudGl0eSB0cmFuc2Zvcm0uwqAKPj4gUmVuYW1l
IHRoZQo+PiBmaWVsZCB0byBwdl9wMm0gdG8gbWFrZSBpdCBjbGVhciBpdCBpcyBQVi1vbmx5Lgo+
Cj4gTmljZSBjbGVhbnVwISBUaGlzIHdpbGwgcHJvYmFibHkgbWFrZSBzbGlnaHRseSBmYXN0ZXIg
Z3Vlc3QgYm9vdCA6KS4KPgo+PiBAQCAtMzU5LDcgKzM1Niw2IEBAIHN0YXRpYyBpbnQgcG9wdWxh
dGVfZ3Vlc3RfbWVtb3J5KHN0cnVjdAo+PiB4Y19kb21faW1hZ2UgKmRvbSwKPj4gwqAgc3RhdGlj
IGludCBtZW1pbml0KHN0cnVjdCB4Y19kb21faW1hZ2UgKmRvbSkKPj4gwqAgewo+PiDCoMKgwqDC
oMKgIGludCBpLCByYzsKPj4gLcKgwqDCoCB4ZW5fcGZuX3QgcGZuOwo+PiDCoMKgwqDCoMKgIHVp
bnQ2NF90IG1vZGJhc2U7Cj4+IMKgIMKgwqDCoMKgwqAgdWludDY0X3QgcmFtc2l6ZSA9ICh1aW50
NjRfdClkb20tPnRvdGFsX3BhZ2VzIDw8IFhDX1BBR0VfU0hJRlQ7Cj4+IEBAIC00MjMsMTEgKzQx
OSw2IEBAIHN0YXRpYyBpbnQgbWVtaW5pdChzdHJ1Y3QgeGNfZG9tX2ltYWdlICpkb20pCj4+IMKg
wqDCoMKgwqAgYXNzZXJ0KHJhbXNpemUgPT0gMCk7IC8qIFRvbyBtdWNoIFJBTSBpcyByZWplY3Rl
ZCBhYm92ZSAqLwo+PiDCoCDCoMKgwqDCoMKgIGRvbS0+cDJtX3NpemUgPSBwMm1fc2l6ZTsKPgo+
IERvIHdlIG5lZWQgdG8ga2VlcCBwMm1fc2l6ZT8KClllcywgSSB0aGluayBzby4KClRoZXJlIGFy
ZSBzb21lIGNvbW1vbiBjaGVja3Mgd2hpY2ggd291bGQgZmFpbCBpZiBpdCBiZWNvbWVzIDAsIGFu
ZAppbXBvcnRhbnRseSwgaXQgaXMgdXNlZCB0byBsb2NhdGUgc2FmZSBnZm5zIGZvciB0ZW1wb3Jh
cnkgcGh5c21hcCBtYXBwaW5ncy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
