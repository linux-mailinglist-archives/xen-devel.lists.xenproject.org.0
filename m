Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF97CA0512
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 16:34:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2yxq-0007tG-2y; Wed, 28 Aug 2019 14:30:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+/MF=WY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i2yxp-0007t6-14
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 14:30:21 +0000
X-Inumbo-ID: 5c96800a-c9a0-11e9-8980-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c96800a-c9a0-11e9-8980-bc764e2007e4;
 Wed, 28 Aug 2019 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567002621;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=JpqJ0mx8YF/n+Du1OBkt4ZNO+MN8cyWwUWJrsf5c/a4=;
 b=iQLsWDXRIG9aCHGnlFLPtQekVgw5aIauCxE6aYnEb+av6p13qdGbdiGI
 jTsOFErPqf/jHMzScmFht2s0bFZAxVWOkcLdKFQDB2fB45nF8bTRO2qX9
 qdc1BuZjHNLGg9rp36ttbqIu+eRJw91PyL3DB79a3oW3ZFw8pzZXC3Uqp M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Z4k307uWf+caQ/7FLQHZ4LK1Ck44X/PgtxLmPb6YUF3EKApfxU81/WgmUO1wp1Nl6wj3xf5OUR
 qRlPjkPm0zZR+66s4dMnVUHop73b8Dqvr4VdeYoW9hP/DiGqcTGH8zrqP+/hP+uY5aqLr8QmIy
 Q36g41auFGS4V77w6YDcQlB1pDYv+sFeJvQNYRhwtG8mV+6YwZzKTOa9TQP9CqEJ8wZgdz2mem
 8JIVtJ3IqBdXqqsVI+YH/t7YiPOWr61rrn6nCnP00tI1Qqw69EwUmmLNTw34n1SIwIKm+6vWMB
 C9o=
X-SBRS: 2.7
X-MesageID: 4838259
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,441,1559534400"; 
   d="scan'208";a="4838259"
To: Jan Beulich <jbeulich@suse.com>
References: <20190813105352.32412-1-andrew.cooper3@citrix.com>
 <20190813105352.32412-2-andrew.cooper3@citrix.com>
 <bfcac2fc-72e2-b3c4-64d1-33a16230b61f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f8ce1d45-dbd7-063a-5105-bb5e57558b8e@citrix.com>
Date: Wed, 28 Aug 2019 15:30:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bfcac2fc-72e2-b3c4-64d1-33a16230b61f@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/2] xen: Drop
 XEN_DOMCTL_suppress_spurious_page_faults
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
 <marmarek@invisiblethingslab.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDgvMjAxOSAxNjozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTMuMDguMjAxOSAx
Mjo1MywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gVGhpcyBmdW5jdGlvbmFsaXR5IGlzIG9ic29s
ZXRlLsKgIEl0IHdhcyBpbnRyb2R1Y2VkIGJ5IGMvcyAzOTQwN2JlZDljMAo+PiBpbnRvCj4+IFhl
bmQsIGJ1dCBuZXZlciBleHBvc2VkIGluIGxpYnhsLgo+Cj4gVGhpcyBpcyBnb29kIGVub3VnaCBh
IHJlYXNvbiBJIHRoaW5rIChob3BlKSwgd2hpbGUgLi4uCj4KPj4gV2hpbGUgbm90IGV4cGxpY2l0
bHkgbGltaXRlZCB0byBQViBndWVzdHMsIHRoaXMgaXMgUFYtb25seSBieSB2aXJ0dWUKPj4gb2Yg
aXRzCj4+IHBvc2l0aW9uIGluIHRoZSBwYWdlZmF1bHQgaGFuZGxlci4KPj4KPj4gTG9va2luZyB0
aG91Z2ggdGhlIFhlblNlcnZlciB0ZW1wbGF0ZXMsIHRoaXMgd2FzIHVzZWQgdG8gd29yayBhcm91
bmQKPj4gYnVncyBpbgo+PiB0aGUgMzJiaXQgUkhFTC9DZW50T1MgNC57NS4uN30ga2VybmVscyAo
Zml4ZWQgaW4gNC44KS7CoCBSSEVMIDQgYXMgYQo+PiBtYWpvcgo+PiB2ZXJzaW9uIHdoZW4gb3V0
IGlmIHN1cHBvcnQgaW4gMjAxNy4KPgo+IC4uLiBJIHdvdWxkbid0IGFjY2VwdCB0aGlzIGFzIGp1
c3RpZmljYXRpb24sCgpJJ2QgYmUgYXBwcm9hY2hpbmcgdGhpcyBkaWZmZXJlbnRseSBpZiBzdXBw
b3J0IHdlcmUgaW4gbGlieGwsIGJ1dC4uLgoKPiBzaW5jZSBwZW9wbGUgYXJlCj4gZnJlZSB0byB1
c2Ugb3V0LW9mLXN1cHBvcnQgc29mdHdhcmUgZm9yIGFzIGxvbmcgYXMgdGhleSB3aXNoLgoKLi4u
IHRoZXJlIGFyZSBhIGxvdCBvZiB2ZXJ5IGdvb2QgcmVhc29ucyBub3QgdG8ga2VlcCBvbiB1c2lu
ZwpvdXQtb2Ytc3VwcG9ydCBzb2Z0d2FyZS7CoCBBIHJlY2VudCBleGFtcGxlIGlzIHRoZSBXYW5u
YUNyeSBvdXRicmVhawp3aGljaCBzcHJlYWQgaW4gcGFydCBkdWUgdG8gdGhlIHN0aWxsLXByb2xp
ZmljIHVzZSBvZiBXaW5kb3dzIFhQLgoKRnVydGhlcm1vcmUsIHBlb3BsZSBydW5uaW5nIGtlcm5l
bHMgd2hpY2ggYXJlIHRoYXQgb2Jzb2xldGUgd2lsbCBhbHNvIGJlCnJ1bm5pbmcgc2ltaWxhcmx5
LW9ic29sZXRlIHZlcnNpb25zIG9mIFhlbiwgc28gdGhpcyBjaGFuZ2UgaXNuJ3QgZ29pbmcKdG8g
YWZmZWN0IHRoZW0uCgo+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+Cj4KPiBIeXBlcnZpc29yIHBhcnRzCj4gUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRoYW5rcywKCj4gd2l0aCBvbmUgZnVydGhl
ciBzdWdnZXN0aW9uOgo+Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni90cmFwcy5jCj4+ICsrKyBiL3hl
bi9hcmNoL3g4Ni90cmFwcy5jCj4+IEBAIC0xNDUyLDIwICsxNDUyLDYgQEAgdm9pZCBkb19wYWdl
X2ZhdWx0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZXJyb3JfY29kZSwgX3AoYWRkcikpOwo+PiDCoMKgwqDCoMKgIH0KPj4gwqAg
LcKgwqDCoCBpZiAoCj4+IHVubGlrZWx5KGN1cnJlbnQtPmRvbWFpbi0+YXJjaC5zdXBwcmVzc19z
cHVyaW91c19wYWdlX2ZhdWx0cykgKQo+PiAtwqDCoMKgIHsKPj4gLcKgwqDCoMKgwqDCoMKgIHBm
X3R5cGUgPSBzcHVyaW91c19wYWdlX2ZhdWx0KGFkZHIsIHJlZ3MpOwo+PiAtwqDCoMKgwqDCoMKg
wqAgaWYgKCAocGZfdHlwZSA9PSBzbWVwX2ZhdWx0KSB8fCAocGZfdHlwZSA9PSBzbWFwX2ZhdWx0
KSkKPj4gLcKgwqDCoMKgwqDCoMKgIHsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJpbnRr
KFhFTkxPR19HX0VSUiAiJXB2IGZhdGFsIFNNJWNQIHZpb2xhdGlvblxuIiwKPj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjdXJyZW50LCAocGZfdHlwZSA9PSBzbWVwX2Zh
dWx0KSA/ICdFJyA6ICdBJyk7Cj4+IC0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9tYWlu
X2NyYXNoKGN1cnJlbnQtPmRvbWFpbik7Cj4+IC3CoMKgwqDCoMKgwqDCoCB9Cj4+IC3CoMKgwqDC
oMKgwqDCoCBpZiAoIHBmX3R5cGUgIT0gcmVhbF9mYXVsdCApCj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybjsKPj4gLcKgwqDCoCB9Cj4KPiBZb3UgbWF5IHdhbnQgdG8gY29uc2lkZXIg
cmVkdWNpbmcgcGZfdHlwZSdzIHNjb3BlIGF0IHRoZSBzYW1lCj4gdGltZS4KClRoaXMgaXNuJ3Qg
dG9vIG11Y2ggb2YgYSBjaGFuZ2UsIHNvIEkndmUgaW5jbHVkZWQgaXQuCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
