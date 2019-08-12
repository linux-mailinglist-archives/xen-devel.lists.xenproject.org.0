Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9369589F64
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 15:15:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxA6k-0000pn-GU; Mon, 12 Aug 2019 13:11:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gta3=WI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxA6j-0000pi-14
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 13:11:29 +0000
X-Inumbo-ID: b1a279e0-bd02-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b1a279e0-bd02-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 13:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565615487;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=45J+IuH6vbqDi46G7x+4VT+lt3HEzIdPxfy22o8Zy1Q=;
 b=Zn9Afpa6KF7SAIjGdnNA0lJvIiT4zxVAeJucQgkgoFOwUcCAgMxVjPk4
 sqi32K7sVHrpAfHk2guMYSnMYrHnVTvdtYQQK6w537U15s1dl3t1nvfDM
 C/l5KZ5OFj2ydtfLmh6ei8UPEFsRBgK1hrm6Fn8x2k/CReaNw+56SO6uD Q=;
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
IronPort-SDR: iFPqi6BYdyC6ZBx/tUuRdEVhFW29Jb0vb83NX/V6K/NAkeIvB8uPJNqlKTNDjHS8SyvX6/Gq2Y
 OExgKK3POJJG3fwKZKaK7OoQl4Q5GUoSFP/fKWB2nauF2pKi7QVhbiYfxVau5b5Q/4Hga7Hz9E
 4PohOZtLDm0LLgN69LbVWlRY4oWAKQTHrXF3xQGR6M/1bgPnnt662L5tiBkaAzVe/RXLkf3qAJ
 /BgzejSuEVdTBdzIQAbCxjZDHf4v16IuSQDq1Ml1fqq+s4r43vesSV30Jlgq2wuWMDLMQRKM1p
 EwA=
X-SBRS: 2.7
X-MesageID: 4323697
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4323697"
To: Jan Beulich <jbeulich@suse.com>
References: <d5224750-6d1e-2d62-f89d-5cb0a6c9f740@suse.com>
 <99f7c7d6-5ea3-ac60-a1f9-b82cb7be87f2@citrix.com>
 <13dc761b-79e8-198f-094b-886c90b13bea@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <611ed1a4-6bb8-64a5-f205-2c039863462c@citrix.com>
Date: Mon, 12 Aug 2019 14:11:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <13dc761b-79e8-198f-094b-886c90b13bea@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v5] x86/xpti: Don't leak TSS-adjacent percpu
 data via Meltdown
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDgvMjAxOSAxMjowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTIuMDguMjAxOSAx
MjoyOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTIvMDgvMjAxOSAwODoyMywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBAQCAtNzQ3LDE2ICs3NDcsMTAgQEAgdm9pZCBsb2FkX3N5c3RlbV90
YWJsZXModm9pZCkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAuYml0bWFwID0gSU9CTVBfSU5WQUxJ
RF9PRkZTRVQsCj4+PiDCoMKgwqDCoMKgIH07Cj4+PiDCoCAtwqDCoMKgIF9zZXRfdHNzbGR0X2Rl
c2MoCj4+PiAtwqDCoMKgwqDCoMKgwqAgZ2R0ICsgVFNTX0VOVFJZLAo+Pj4gLcKgwqDCoMKgwqDC
oMKgICh1bnNpZ25lZCBsb25nKXRzcywKPj4+IC3CoMKgwqDCoMKgwqDCoCBvZmZzZXRvZihzdHJ1
Y3QgdHNzX3N0cnVjdCwgX19jYWNoZWxpbmVfZmlsbGVyKSAtIDEsCj4+PiAtwqDCoMKgwqDCoMKg
wqAgU1lTX0RFU0NfdHNzX2F2YWlsKTsKPj4+IC3CoMKgwqAgX3NldF90c3NsZHRfZGVzYygKPj4+
IC3CoMKgwqDCoMKgwqDCoCBjb21wYXRfZ2R0ICsgVFNTX0VOVFJZLAo+Pj4gLcKgwqDCoMKgwqDC
oMKgICh1bnNpZ25lZCBsb25nKXRzcywKPj4+IC3CoMKgwqDCoMKgwqDCoCBvZmZzZXRvZihzdHJ1
Y3QgdHNzX3N0cnVjdCwgX19jYWNoZWxpbmVfZmlsbGVyKSAtIDEsCj4+PiAtwqDCoMKgwqDCoMKg
wqAgU1lTX0RFU0NfdHNzX2J1c3kpOwo+Pj4gK8KgwqDCoCBfc2V0X3Rzc2xkdF9kZXNjKGdkdCAr
IFRTU19FTlRSWSwgKHVuc2lnbmVkIGxvbmcpdHNzLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzaXplb2YoKnRzcykgLSAxLCBTWVNfREVTQ190c3NfYXZhaWwpOwo+Pj4gK8KgwqDCoCBf
c2V0X3Rzc2xkdF9kZXNjKGNvbXBhdF9nZHQgKyBUU1NfRU5UUlksICh1bnNpZ25lZCBsb25nKXRz
cywKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZW9mKCp0c3MpIC0gMSwgU1lTX0RF
U0NfdHNzX2J1c3kpOwo+Pgo+PiBEbyB5b3UgdGhpbmsgaXQgaXMgd29ydGggaGF2aW5nIGEgQlVJ
TERfQlVHX09OKHNpemVvZigqdHNzKSA8IDB4NjcpLAo+PiBqdXN0IHRvIGNvbmZpcm0gdGhhdCB0
aGUgbG9hZCB3b250IGZhdWx0Pwo+Cj4gTm90IHN1cmUgLSBpdCBmZWVscyBsaWtlIGdvaW5nIGEg
bGl0dGxlIG92ZXJib2FyZCB3aXRoIGNoZWNrcy4gRmVlbAo+IGZyZWUgdG8gYWRkIG9uZSB0aG91
Z2ggaWYgeW91J3JlIHJlYWxseSBjb252aW5jZWQgaXQgaGVscHMsIGJ1dAo+IHRoZW4gcGxlYXNl
IHdpdGggMHg2OCBpbiBwbGFjZSBvZiAweDY3LiAoSSdtIGFib3V0IHRvIGxlYXZlIG5vdywKPiBz
byBpZiB5b3Ugd2FudCBtZSB0byBhZGQgYW55dGhpbmcgYW5kL29yIGNvbW1pdCBpdCwgaXQgd291
bGQgaGF2ZQo+IHRvIHdhaXQgdHdvIHdlZWtzLikKCkkgc3BvdHRlZCB0aGUgb2ZmLWJ5LW9uZSBq
dXN0IGFmdGVyIEkgc2VudCB0aGUgZW1haWwsIGJ1dCBJJ3ZlIGdvbmUgd2l0aAo8PSAweDY3IHJh
dGhlciB0aGFuIDwgMHg2OCBiZWNhdXNlIDB4NjcgaXMgdGhlIHdheSBib3RoIG1hbnVhbHMgcmVm
ZXIgdG8KdGhlIHJlc3RyaWN0aW9uLgoKSSd2ZSBhbHNvIHJlZm9ybWF0dGVkIHRoZSBjb21taXQg
bWVzc2FnZSBzbyBpdCBkb2Vzbid0IHJlYWQgYXMgYQpjaGFuZ2Vsb2csIGJ1dCBhbSBnb2luZyB0
byB0aHJvdyBpdCBpbiBub3cgdGhhdCB3ZSdyZSBib3RoIGhhcHB5IHdpdGgKdGhlIHJlc3VsdC4K
Cn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
