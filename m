Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB7495F1C
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 14:47:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i03Vg-0008L9-2R; Tue, 20 Aug 2019 12:45:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MO/K=WQ=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1i03Ve-0008It-Fe
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 12:45:10 +0000
X-Inumbo-ID: 57be28d4-c348-11e9-b90c-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57be28d4-c348-11e9-b90c-bc764e2007e4;
 Tue, 20 Aug 2019 12:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566305109;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=M3tjvjPUCx6Ufq8RdyWNzGIW2SUq6EExteZVSqsrhg0=;
 b=alvbJwTPu6/FTY+BUbxfp8uvXpXNkQQsS/KnQnwzw0haPNH5fYyElXH+
 tml8vIAxYj8Q9JKL1EueXppA3xzVjGrhyUg2WPqQ15ktQZRw+XTz1fqdA
 7lVkJ5W6sHJ3rVby6Jo50qSr/2UR/R9xzKa/RawZJO5nY4Tot87SLkXMu o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: C/Mi05+eT7iFUMaHaECSn/AoD5iRPXlgbmohUsVU8Z1btxzRwzrE8retNjs2xXC9uyfQYFFOD9
 HHC+G6kR21BXAnq3qIZKRhKw5rlC3K4rT01AsAJHJbc+me/YvhPjYTqnpiLFmJyU8LVowVSOzR
 UaqYXv8mMPN6IHtYb5eIoLaIBBvuEghnMYqTS90IEP7xoknWeX1gl3/lK2mE0WxKIC4Lcf1+qF
 fcTDz7tKi1Hoatp0uo4Y8/Giyx/uYj0ydgKF64W+Q1Kc1nSp4+rC/XX022m5NS/JrHVFZX7h58
 /bg=
X-SBRS: 2.7
X-MesageID: 4713204
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,408,1559534400"; 
   d="scan'208";a="4713204"
To: Christian Lindig <christian.lindig@citrix.com>
References: <1566240335-6614-1-git-send-email-igor.druzhinin@citrix.com>
 <7DFC36D5-7354-4D82-87A6-364FEDEAFAFC@citrix.com>
 <d61c8e5e-eb9b-755f-0917-b4d009c64d74@citrix.com>
 <9324516A-66F9-47FC-AD8F-BF44059D29B2@citrix.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <52ddaa4f-bc1a-43b2-a995-b9e7cae3044f@citrix.com>
Date: Tue, 20 Aug 2019 13:45:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9324516A-66F9-47FC-AD8F-BF44059D29B2@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] tools/oxenstored: port XS_INTRODUCE evtchn
 rebind function from cxenstored
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, "wl@xen.org" <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMDgvMjAxOSAxMzoxMSwgQ2hyaXN0aWFuIExpbmRpZyB3cm90ZToKPiAKPiAKPj4gT24g
MjAgQXVnIDIwMTksIGF0IDExOjQ1LCBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0
cml4LmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIDIwLzA4LzIwMTkgMDk6MjEsIENocmlzdGlhbiBMaW5k
aWcgd3JvdGU6Cj4+Pj4gKwkJCWlmIChEb21haW4uZ2V0X21mbiBlZG9tKSA9IG1mbiAmJiAoQ29u
bmVjdGlvbnMuZmluZF9kb21haW4gY29ucyBkb21pZCkgIT0gY29uIHRoZW4gYmVnaW4KPj4+Cj4+
PiBUaGlzIHNob3VsZCB1c2UgPD4gaW5zdGVhZCBvZiAhPSBiZWNhdXNlICE9IGlzIHBvaW50ZXIg
aW5lcXVhbGl0eSBpbiBPQ2FtbC4gVGhlIHBhcmVudGhlc2VzIGFyZSBub3Qgc3RyaWN0bHkgbmVj
ZXNzYXJ5IGJlY2F1c2UgZnVuY3Rpb24gYXBwbGljYXRpb24gaGFzIHByZWNlZGVuY2UuIFNvOgo+
Pj4KPj4+IAlpZiBEb21haW4uZ2V0X21mbiBlZG9tID0gbWZuICYmIENvbm5lY3Rpb25zLmZpbmRf
ZG9tYWluIGNvbnMgZG9taWQgPD4gY29uIHRoZW4gYmVnaW4KPj4+Cj4+Cj4+IEJ1dCBJIGFjdHVh
bGx5IHdhbnQgdG8gY29tcGFyZSBwb2ludGVycyBoZXJlIC0gdGhlIGlkZWEgaXMgdGhhdCB0aGUK
Pj4gY29ubmVjdGlvbiBvYmplY3QgaW4gdGhlIGhhc2h0YWJsZSBpbmRleGVkIGJ5IGRvbWlkIGlz
IG5vdCB0aGUgc2FtZSBhcwo+PiBjb25uZWN0aW9uIHRoYXQgd2UgZ290IFhTX0lOVFJPRFVDRSBt
ZXNzYWdlIGZyb20uIChzZWUKPj4gdG9vbHMveGVuc3RvcmUveGVuc3Ryb3JlZF9kb21haW4uYykK
PiAKPiBJbiB5b3VyIGNvZGUsIGEgIT0gYiBpcyB0cnVlLCBpZiBhIGFuZCBiIGhhdmUgaWRlbnRp
Y2FsIHN0cnVjdHVyZSBidXQgZGlmZmVyZW50IGFkZHJlc3Nlcy4gSSBzdHJvbmdseSBzdXNwZWN0
IHRoYXQgdHdvIGNvbm5lY3Rpb24gdmFsdWVzIHNob3VsZCBoYXZlIGRpZmZlcmVudCBzdHJ1Y3R1
cmUgdG8gYmUgY29uc2lkZXJlZCBkaWZmZXJlbnQsIG5vdCBqdXN0IGRpZmZlcmVudCBhZGRyZXNz
ZXMuIFdoZW4gYSA8PiBiIGlzIHRydWUsIGl0IGltcGxpZXMgYSAhPSBiLiBTbyB1c2luZyBhIDw+
IGIgaXMgc2FmZShyKS4gQnkgdXNpbmcgIT0geW91IHdvdWxkIHJlbHkgb24gYW4gaW52YXJpYW50
IHRoYXQgZXZlcnkgY29ubmVjdGlvbiAoY29uKSBleGlzdHMgb25seSBvbmNlIGFuZCBpcyBuZXZl
ciBjb3BpZWQuCj4gCgpDb25uZWN0aW9uIGlzIGEgY29tcGxleCBvYmplY3QgKGhhcyB2YXJpb3Vz
IGNvdW50ZXJzIGFuZCBpbnRlcm5hbApzdHJ1Y3R1cmVzKSBhbmQgSSBkb24ndCB0aGluayBzaW1w
bGUgZmllbGQgYnkgZmllbGQgY29tcGFyaXNvbiAoaXMgPD4KanVzdCB0aGF0IGluIE9jYW1sPykg
aXMgYXBwcm9wcmlhdGUgaGVyZS4KCmNvbiBpcyBwYXNzZWQgaW50byB0aGF0IGZ1bmN0aW9uIGZy
b20geGVuc3RvcmVkLm1sIHdoZXJlIGl0J3MgZXh0cmFjdGVkCmZyb20gdGhlIHNhbWUgaGFzaHRh
YmxlIChDb25uZWN0aW9ucykgc28gaXQncyBhY3R1YWxseSB0aGUgZXhhY3RseSBzYW1lCm9iamVj
dC4gVGhlcmUgYXJlIG90aGVyIGV4YW1wbGVzIGluIGNvbm5lY3Rpb25zLm1sIHdoZXJlIHBvaW50
ZXIKY29tcGFyaXNvbiBpcyB1c2VkIHRvIGNvbXBhcmUgY29ubmVjdGlvbnMuCgpJZ29yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
