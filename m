Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A302B0FBF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 15:24:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8P2Q-0005WF-55; Thu, 12 Sep 2019 13:21:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UPIc=XH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i8P2O-0005W7-Qd
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 13:21:28 +0000
X-Inumbo-ID: 39c145c6-d560-11e9-978d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39c145c6-d560-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 13:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568294488;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9FN93Ybgv+D8rocrUP4rsfu1zkbTMvkEhMTiaOi+UPo=;
 b=UE//Z5B94xW5JxuTeNdoz5zzj9gNjp9748DrhW+JqBB16qDS/pyjgQa2
 yPD3o4bupjw4/gRHyNS6kA87YinDiB8izMHDOba7ZXYEYn7PG4F0qd+Ra
 8yUg6YOzeKpBKp10b5b5XHZj+0qYJ6rwN5qe6w7KI3x9UA1//8j9IVk5z s=;
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
IronPort-SDR: w54gsC/tiOMj8N/0xjXCfg6xATp/2sWQpy2QIDQEqrsA3Ebi8IvdProca/wpLwWxICXXHoGkcJ
 ESSoxeCfuY5NZ5ZGHHRpAyNU+0LKhE96bJ9LC0qRqNd3io2+9vmIlazyjttSln9nJchskQ9YbU
 hA17THyfWR2H5tiJ9wDfzK2aa/Jblcs3e3BCpURGSBLl3YRUrla+Cf2gzvzSLToqpJy2a4U4NQ
 lXKt0NH+XoaTlTtv2+dUV7MDHZGybWEmxTGO0IUf89xtG+wLmfv7HAcncE9yqBZVLvbqkiWOZR
 ecM=
X-SBRS: 2.7
X-MesageID: 5484369
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,497,1559534400"; 
   d="scan'208";a="5484369"
To: Jan Beulich <jbeulich@suse.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
 <20190911200504.5693-6-andrew.cooper3@citrix.com>
 <523f8f8d-8517-be28-b3d9-8ae7cca6ddec@suse.com>
 <61bf9e3a-b331-7336-1a49-91d62f53dd63@citrix.com>
 <93fcd642-7d06-ad09-f13b-1f9f50a48184@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <567d5b12-ab99-559b-13da-f358e98e6022@citrix.com>
Date: Thu, 12 Sep 2019 14:21:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <93fcd642-7d06-ad09-f13b-1f9f50a48184@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 5/8] tools/libxc: Rework xc_cpuid_set() to
 use {get, set}_cpu_policy()
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDkvMjAxOSAxMDoxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTIuMDkuMjAxOSAx
MDozNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTIvMDkvMjAxOSAwOToxOSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAxMS4wOS4yMDE5IDIyOjA1LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IFRoZSBwdXJwb3NlIG9mIHRoaXMgY2hhbmdlIGlzIHRvIHN0b3AgdXNpbmcgeGNfY3B1
aWRfZG9fZG9tY3RsKCksIGFuZCB0byBzdG9wCj4+Pj4gYmFzaW5nIGRlY2lzaW9ucyBvbiBhIGxv
Y2FsIENQVUlEIGluc3RydWN0aW9uLiAgVGhpcyBpcyBub3QgYW4gYXBwcm9wcmlhdGUgd2F5Cj4+
Pj4gdG8gY29uc3RydWN0IHBvbGljeSBpbmZvcm1hdGlvbiBmb3Igb3RoZXIgZG9tYWlucy4KPj4+
Pgo+Pj4+IE9idGFpbiB0aGUgaG9zdCBhbmQgZG9tYWluLW1heCBwb2xpY2llcyBmcm9tIFhlbiwg
YW5kIG1peCB0aGUgcmVzdWx0cyBhcwo+Pj4+IGJlZm9yZS4gIFByb3ZpZGUgcmF0aGVyIG1vcmUg
ZXJyb3IgbG9nZ2luZyB0aGFuIGJlZm9yZS4KPj4+IEFuZCB0aGlzIHBhc3NpbmcgdGhyb3VnaCBv
ZiBob3N0IHZhbHVlcyBpcyBtZWFudCB0byBzdGF5IGxvbmcKPj4+IHRlcm0/IFNob3VsZG4ndCB0
aGlzIHJhdGhlciBiZSBwYXNzaW5nIHRocm91Z2ggb2YgbWF4LXBvbGljeQo+Pj4gdmFsdWVzLCB3
aXRoIG1heC1wb2xpY3kgbG9uZyB0ZXJtIHdpZGVyIHRoYW4gZGVmYXVsdC1wb2xpY3k/IFRoZQo+
Pj4gY2hhbmdlIGl0c2VsZiBsb29rcyBnb29kIHRvIG1lLCBidXQgYmVmb3JlIGdpdmluZyBteSBS
LWIgSSdkCj4+PiBsaWtlIHRvIHVuZGVyc3RhbmQgdGhpcyBhc3BlY3QuCj4+IFRoZXJlIGlzIGEg
dmVyeSBsYXJnZSBhbW91bnQgd3Jvbmcgd2l0aCB4Y19jcHVpZF9zZXQoKS4KPj4KPj4gRm9yIG9u
ZSwgaXRzIGJlaGF2aW91ciBpcyBvbmx5IHVzZWZ1bCBmb3IgZmVhdHVyZSBsZWF2ZXMsIGJ1dCBp
dCB3aWxsCj4+IG9wZXJhdGUgb24gYW55IGxlYXZlcyB0aGUgdXNlciByZXF1ZXN0cywgYW5kIHdo
aWxlIGl0IGlzIGNhcGFibGUgb2YKPj4gcmV0dXJuaW5nIGVycm9ycywgbGlieGwgZG9lc24ndCBj
aGVjayB0aGUgcmV0dXJuIHZhbHVlIGFuZCBjb250aW51ZXMKPj4gYmxpbmRseSBmb3J3YXJkcy4K
Pj4KPj4gQWxzbyBmcm9tIHRoZSBMMVRGIGVtYmFyZ28gZGF5cyBpcyBhIHNlcmllcyBvZiB3b3Jr
IChvciBhdCBsZWFzdCwgdGhlCj4+IHN0YXJ0IG9mKSB3aGljaCBpcyBhIHRvdGFsIG92ZXJoYXVs
IG9mIGhvdyBsaWJ4bCBhbmQgbGlieGMgaW50ZXJhY3Qgd2hlbgo+PiBpdCBjb21lcyBDUFVJRCBh
bmQgTVNSIHNldHRpbmdzLsKgIE5laXRoZXIgeGNfY3B1aWRfc2V0KCkgbm9yCj4+IHhjX2NwdWlk
X2FwcGx5X3BvbGljeSgpIHdpbGwgc3Vydml2ZSB0byB0aGUgZW5kLgo+Pgo+PiBGb3Igbm93LCBJ
J3ZlIG9wdGVkIHdpdGggbm90IGNoYW5naW5nIHRoZSBzZW1hbnRpY3Mgb2YgdGhlIGNhbGxzIHdo
aWxlCj4+IGFsdGVyaW5nIHRoZSBkYXRhLXRyYW5zZmVyIG1lY2hhbmlzbSwgdG8gYXZvaWQgY29u
ZmxhdGluZyB0aGUgdHdvIGFyZWFzCj4+IG9mIHdvcmsuCj4gQW5kIHdpdGggdGhpcyB0aGVuLCBh
cyBwcm9taXNlZCwKPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKVGhhbmtzLgoKSSdsbCBleHBhbmQgdGhlIGNvbW1pdCBtZXNzYWdlIHdpdGggYSBub3RlIGFi
b3V0IHRoaXMuwqAgSXQgd2lsbCBsaWtlbHkKYmUgaGVscGZ1bCBmb3IgZnV0dXJlIHBlb3BsZSBk
b2luZyBjb2RlIGFyY2hhZW9sb2d5LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
