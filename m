Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343ECE7083
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 12:37:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP3HO-0005xL-Sx; Mon, 28 Oct 2019 11:33:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qotU=YV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iP3HN-0005xF-AH
 for xen-devel@lists.xen.org; Mon, 28 Oct 2019 11:33:45 +0000
X-Inumbo-ID: cc3a587c-f976-11e9-94f4-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc3a587c-f976-11e9-94f4-12813bfff9fa;
 Mon, 28 Oct 2019 11:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572262424;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=EGCcCWcXuI4N9K/ZcZR1MC7gWx5isVcHEqDK4vR6h2M=;
 b=E/yvymOUvw2xAu+yMzdieaOkXbggrcnUa/ecUuSK9GmfiQupggvUaD3Y
 Zu7FvO7zE8WTk8zRB9/SZ19saPZyP9vTFZIzQSsTqUwUpGYr9RLUlfU3R
 Dar5T+4UwR0B34BlJIGsPDLkhqgofY19CQUCo6Na75QbKwG/mH55m7+70 Y=;
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
IronPort-SDR: 0LGUXC8EcaZB5wnl6/hOfACqUQks5LTHDbWBON235MgL+b7lyDghtMxVVFv6bFWasH14yPe0c9
 bGupwQopaxXoPRITzfBqYde/c5hetYzdPVqq7PWB4XbVbisVZEAc1utRZVJjlmSo3dlxFQ4IKw
 lOCANV5NRMcJNbdtESH6ZK2n3IMZkiLhpNFyVXQcytNJNAzq0FtiKZxwfupVonbaNVkxcr250j
 tOwz041wZR2eM/uMJG7D1wSWQwVarcZN+PPoIM3jYRqpsdcJ4W9F25e6KJ6Dyxg7MOUVPEeGMy
 d8g=
X-SBRS: 2.7
X-MesageID: 7812732
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,239,1569297600"; 
   d="scan'208";a="7812732"
To: Jan Beulich <jbeulich@suse.com>
References: <20191028085603.32037-1-sergey.dyasli@citrix.com>
 <e55613e7-179d-ee5c-34a4-bc3e41997869@suse.com>
 <19a597f0-1694-02fb-2c01-3446407b35a9@citrix.com>
 <28c68c6f-2812-eb48-5cac-c7a5b05dd3bd@suse.com>
 <7a4dc34f-a817-e2ee-5ded-407ffc86db22@citrix.com>
 <d901c775-4122-6c37-c3c8-2ace1a6251ad@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <1d35b969-c1c4-d58c-abc7-ae6865c9577a@citrix.com>
Date: Mon, 28 Oct 2019 11:33:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d901c775-4122-6c37-c3c8-2ace1a6251ad@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for 4.13] x86/shim: don't reserve 640k - 1M
 region in E820
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei
 Liu <wl@xen.org>, xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMTAvMjAxOSAxMTozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjguMTAuMjAxOSAx
MjoxNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjgvMTAvMjAxOSAxMToxMSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyOC4xMC4yMDE5IDEyOjA4LCBTZXJnZXkgRHlhc2xpIHdyb3Rl
Ogo+Pj4+IE9uIDI4LzEwLzIwMTkgMDk6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAy
OC4xMC4yMDE5IDA5OjU2LCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+Pj4+Pj4gQ29udmVydGluZyBh
IGd1ZXN0IGZyb20gUFYgdG8gUFYtaW4tUFZIIG1ha2VzIHRoZSBndWVzdCB0byBoYXZlIDM4NGsK
Pj4+Pj4+IGxlc3MgbWVtb3J5LCB3aGljaCBtYXkgY29uZnVzZSBndWVzdCdzIGJhbGxvb24gZHJp
dmVyLiBUaGlzIGhhcHBlbnMKPj4+Pj4+IGJlY2F1c2UgWGVuIHVuY29uZGl0aW9uYWxseSByZXNl
cnZlcyA2NDBrIC0gMU0gcmVnaW9uIGluIEU4MjAgZGVzcGl0ZQo+Pj4+Pj4gdGhlIGZhY3QgdGhh
dCBpdCdzIHJlYWxseSBhIHVzYWJsZSBSQU0gaW4gUFZIIGJvb3QgbW9kZS4KPj4+Pj4gVGhpcyBp
cyBhIFBWSCBwcm9wZXJ0eSBhY2NvcmRpbmcgdG8geW91ciBkZXNjcmlwdGlvbiBhbmQgYWNjb3Jk
aW5nCj4+Pj4+IHRvIG15IHVuZGVyc3RhbmRpbmcuIFdoeSB3b3VsZCB5b3UgdGhlbiAuLi4KPj4+
Pj4KPj4+Pj4+IEZpeCB0aGlzIGJ5IHNraXBwaW5nIHRoZSByZWdpb24gdHlwZSBjaGFuZ2UgZm9y
IHB2LXNoaW0gbW9kZS4KPj4+Pj4gLi4uIGFsdGVyIGJlaGF2aW9yIGZvciBzaGltIG1vZGUgb25s
eSwgcmF0aGVyIHRoYW4gd2hlbiBib290ZWQgaW4KPj4+Pj4gUFZIIG1vZGUgaW4gZ2VuZXJhbD8K
Pj4+PiBUaGlzIGlzIGp1c3QgbWUgYmVpbmcgY2F1dGlvdXMuCj4+Pj4KPj4+PiBNeSBvcmlnaW5h
bCBlbWFpbCBkb2VzIGhhdmUgdGhpcyB0ZXh0IGFmdGVyIC0tLQo+Pj4+ICJUaGUgY29uZGl0aW9u
IGNhbiBiZSByZWxheGVkIHRvIGJlIGp1c3QgIXB2aF9ib290IGlmIHRoZXJlIGFyZSBubwo+Pj4+
IHBsYW5zIHRvIHN1cHBvcnQgVkdBIE1NSU8gLyBST01zIGZvciBQVkggZ3Vlc3RzLiIKPj4+IEkg
ZG91YnQgZW11bGF0ZWQgb25lcyBhcmUgaW50ZW5kZWQgdG8gYmUgc3VwcG9ydGVkLCBidXQgb2YK
Pj4+IGNvdXJzZSBhIGdyYXBoaWNzIGNhcmQgY291bGQgYmUgcGFzc2VkIHRocm91Z2guIElpcmMg
cGFzc3Rocm91Z2gKPj4+IGlzIGEgcGVuZGluZyB3b3JrIGl0ZW0gc3RpbGwgYW55d2F5IGZvciBQ
VkgsIHNvIGRlYWxpbmcgd2l0aCB0aGUKPj4+IGNhc2UgcmlnaHQgbm93IG1heSBub3QgZXZlbiBi
ZSBuZWNlc3NhcnkuCj4+IFRoZSBidWcgaXMgWGVuIGJsaW5kbHkgcHJlc3VtaW5nIHRoYXQgYSBt
aXNzaW5nIGhvbGUgIm11c3QgYmUgYSBmaXJtd2FyZQo+PiBidWciLgo+Pgo+PiBJIGNhbiBiZWxp
ZXZlIHRoYXQgdGhlcmUgbWF5IGhhdmUgYmVlbiBzeXN0ZW1zIGRlY2FkZXMgYWdvIHdoaWNoIGdv
dAo+PiB0aGlzIHdyb25nLCBidXQgdGJoIEkgZG91YnQgaXQgYXBwbGllcyB0byA2NGJpdC1jYXBh
YmxlIHN5c3RlbXMsCj4+IGNvbnNpZGVyaW5nIGhvdyBzdGFuZGFyZGlzZWQgdGhpbmdzIHdlcmUg
YnkgdGhlbi4KPj4KPj4gSSdkIGp1c3QgZGVsZXRlIHRoaXMgd2hvbGUgcGllY2Ugb2YgbG9naWMg
YW5kIGNhbGwgaXQgZG9uZS4KPiBXZWxsLCBJIGNvdWxkIHNlZSB1c2UgYmVpbmcgbGVzcyBhZ2dy
ZXNzaXZlIGhlcmUsIGJ1dCBmaXJtd2FyZSAoaWYKPiB0aGVyZSBpcyBmaXJtd2FyZSwgaS5lLiBl
dmVyeXRoaW5nIGV4Y2VwdCBQVkgpIGNsYWltaW5nIHRoZXJlIHRvCj4gYmUgUkFNIGltbWVkaWF0
ZWx5IGJlbG93IHRoZSAxTSBib3VuZGFyeSBpcyBhIHByZXR0eSBnb29kIHNpZ24gb2YKPiBzb21l
dGhpbmcgYmVpbmcgd3JvbmcuIFRoZXJlIF9vdWdodF8gdG8gYmUgUk9NIGF0IHRoYXQgYWRkcmVz
cy4KPiBPdG9oIHRoZXJlIHdlcmUgZXZlbiB3YXlzIGluIG9sZGVyIGNoaXBzZXRzIHRvIG1ha2Ug
UkFNIGFwcGVhciBhdAo+IGFkZHJlc3MgcmFuZ2VzIG5vdCB1c2VkIGJ5IG9wdGlvbiBST01zLCBz
byB0aGUgbG9naWMgd2UgY3VycmVudGx5Cj4gaGF2ZSBnb2VzIHRvbyBmYXIgcG90ZW50aWFsbHkg
ZXZlbiBvbiBiYXJlIG1ldGFsLgo+Cj4gU28gd2hpbGUgSSdtIGFsbCBmb3IgcmVsYXhpbmcsIEkg
ZG9uJ3QgdGhpbmsgSSBjYW4gc3VwcG9ydAo+IG91dHJpZ2h0IGRlbGV0aW9uLgoKRm9yIG5vdywg
aG93IGFib3V0IGNwdV9oYXNfaHlwZXJ2aXNvciA/CgpXaGF0ZXZlciB0aGUgdmlydHVhbCBlbnZp
cm9ubWVudCwgd2Ugc2hvdWxkIHRydXN0IHRoZSBwcm92aWRlZCBtZW1vcnkgbWFwLgoKfkFuZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
