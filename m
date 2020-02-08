Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 701AE156430
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2020 13:23:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j0P5J-0005xA-Lg; Sat, 08 Feb 2020 12:19:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=liCr=34=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j0P5H-0005x5-Kj
 for xen-devel@lists.xen.org; Sat, 08 Feb 2020 12:19:39 +0000
X-Inumbo-ID: 45017942-4a6d-11ea-b2e6-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45017942-4a6d-11ea-b2e6-12813bfff9fa;
 Sat, 08 Feb 2020 12:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581164376;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=YtFwb/j07thpJviO9z8mdqvaO6zTBHMb0VmklnyN4zY=;
 b=BNFynCyXC//Nf3y9Xw4WtxX/n0AYZTnjgr69Sq8HPzK4Z8YKAtZt2FWl
 3WkTilb4Y8McDkBXjsYw734u3/u+K9hMGKkaC8LGLuy7qoVN78Awza4nt
 i2lsodjBfrUc0umpDc/yrVC0t/yw/Is7aVAvedutH4I8/wUa7EQZpf4C+ 8=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KL3S+quWAQmk9AMZzOlJu5vNnKpj88VTufqagLVMJNF08RpH8CVU2lJkmrU1BbJOq5WEGEsB/K
 TqfOjcTMSUqfKupWo4rMRa2J3+Ou0GtBRxH38nKk3e2bSuiH22WCMuU+zcSNvW25wfvJQ/PkBC
 nb03vKZTguBJa/cO3G18AOWvfAZmb8G3+JZLIYX+J4GvBaoyYePgvZBDHszaIhUKwRO3ylqZjX
 lIiNP7soULvQy7wGXh4bY8/oZD4GC5DwbtL5AeSVrZsBuBnTpIubM9tjDIKNhyPiYHilULbxas
 AvU=
X-SBRS: 2.7
X-MesageID: 12769412
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,417,1574139600"; d="scan'208";a="12769412"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
References: <6722f058-61eb-30c9-f97d-def690ccd7b8@citrix.com>
 <6a3aa771-927b-b3bd-dd05-1eea90b0a97f@suse.com>
 <6f3a1061-fd05-91e8-54ad-666ec3984ffb@citrix.com>
 <c5831cef-ff27-93e5-7536-2d6092ca1ad8@citrix.com>
 <38a28a9d-cc99-0776-1f8b-4103df3d3e9c@suse.com>
 <030eac1d-85b1-fa91-135e-00462eefeb92@suse.com>
 <f7814499-920b-6d7f-1a39-bb4bfb4d69c6@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <81ce9fab-e19e-9a36-b855-3a591f3653cb@citrix.com>
Date: Sat, 8 Feb 2020 12:19:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f7814499-920b-6d7f-1a39-bb4bfb4d69c6@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Live-Patch application failure in core-scheduling
 mode
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Dario
 Faggioli <dfaggioli@suse.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDIvMjAyMCAwODo0MiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPgo+PiBXaXRob3V0IGl0
IGJlaW5nIGVudGlyZWx5IGNsZWFyIHRoYXQgdGhlcmUncyBubyBhbHRlcm5hdGl2ZSB0bwo+PiBp
dCwgSSBkb24ndCB0aGluayBJJ2QgYmUgZmluZSB3aXRoIHJlLWludHJvZHVjdGlvbiBvZgo+PiBj
b250aW51ZV9oeXBlcmNhbGxfb25fY3B1KDAsIC4uLikgaW50byB1Y29kZSBsb2FkaW5nLgo+Cj4g
SSBkb24ndCBzZWUgYSB2aWFibGUgYWx0ZXJuYXRpdmUuIAoKU29ycnkgdG8gaW50ZXJqZWN0IGlu
IHRoZSBtaWRkbGUgb2YgYSBjb252ZXJzYXRpb24sIGJ1dCBJJ2QgbGlrZSB0byBtYWtlCnNvbWV0
aGluZyB2ZXJ5IGNsZWFyLgoKY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgwLCAuLi4pIGlzLCBh
bmQgaGFzIGFsd2F5cyBiZWVuIGZ1bmRhbWVudGFsbHkKYnJva2VuIGZvciBtaWNyb2NvZGUgdXBk
YXRlcy7CoCBJdCBjYXVzZXMgcmVhbCBjcmFzaGVzIG9uIHJlYWwgc3lzdGVtcywKYW5kIHRoYXQg
aXMgd2h5IHRoZSBtZWNoYW5pc20gd2FzIHJlcGxhY2VkLgoKQ2hhbmdpbmcgYmFjayB0byBpdCBp
cyBnb2luZyB0byBicmVhayBjdXN0b21lciBzeXN0ZW1zLgoKSXQgaXMgbmVjZXNzYXJ5IHRvIGhh
dmUgdGhlIGZ1bGwgc3lzdGVtIHF1aWVzY2VkIGluIHByYWN0aWNlLCBiZWNhdXNlCmZvciBhIGdp
dmVuIHBpZWNlIG9mIG1pY3JvY29kZSwgd2UgZG9uJ3Qga25vdyB3aGV0aGVyIGl0cyBhIGNyb3Nz
LXRocmVhZApsb2FkICh0aGUgY29tbW9uIGNhc2Ugd2hpY2ggbW9zdCBwZW9wbGUgYXJlIGZhbWls
aWFyIHdpdGgpLCB3aGV0aGVyIGl0CmlzIGEgY3Jvc3MtY29yZSBsb2FkICh5ZXMgLSBpdCB0dXJu
cyBvdXQgdGhpcyBkb2VzIGV4aXN0IC0gaXQKaGlnaGxpZ2h0ZWQgYSBidWcgaW4gdGVzdGluZyks
IGFuZCB3aGV0aGVyIHRoZXJlIGFuIHVuY29yZS9wY29kZS9ldGMKdXBkYXRlIGluY2x1ZGVkIGFz
IHdlbGwuCgpJIGhhdmVuJ3QgY29tZSBhY3Jvc3MgYSBjcm9zcy1zb2NrZXQgbG9hZCB5ZXQgKGFu
ZCBpdCBsaWtlbHkgZG9lc24ndApleGlzdHMsIGdpdmVuIHNvbWUgYXNwZWN0cyBvZiBsb2FkaW5n
IHdoaWNoIEkgdGhpbmsgd291bGQgYmUgcHJvaGliaXRpdmUKaW4gdGhpcyBjYXNlKSwgYnV0IHRo
ZXJlIHJlYWxseSBhcmUgc3lzdGVtcyB3aGVyZSBsb2FkaW5nIG1pY3JvY29kZSBvbgpjb3JlIDAg
d2lsbCBmbHVzaCBhbmQgcmVsb2FkIHRoZSBNU1JPTXMgb24gYWxsIG90aGVyIGNvcmVzIGluIHRo
ZQpwYWNrYWdlLCB1bmRlciB0aGUgZmVldCBvZiB3aGF0ZXZlciBlbHNlIGlzIGdvaW5nIG9uIHRo
ZXJlLsKgIFRoaXMKaW5jbHVkZXMgbWFraW5nIHRoaW5ncyBsaWtlIE1TUl9TUEVDX0NUUkwgZGlz
YXBwZWFyIHRyYW5zaWVudGx5LgoKV2UgZG9uJ3QgbmVjZXNzYXJpbHkgbmVlZCB0byB1c2Ugc3Rv
cF9tYWNoaW5lKCksIG9yIHVzZSBpdCBleGFjdGx5IGxpa2UKd2UgY3VycmVudGx5IGRvLCBidXQg
d2UgZG8gbmVlZCBhIGdsb2JhbCByZW5kZXp2b3VzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
