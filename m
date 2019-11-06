Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CA8F1CDB
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 18:53:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSPSF-0001Vn-0R; Wed, 06 Nov 2019 17:50:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CiWB=Y6=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iSPSD-0001Vi-Fy
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 17:50:49 +0000
X-Inumbo-ID: f718ed9e-00bd-11ea-adbe-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f718ed9e-00bd-11ea-adbe-bc764e2007e4;
 Wed, 06 Nov 2019 17:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573062649;
 h=to:cc:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=bPp5UeqsbJa+mSfzgrFlpUUqjp7ldp1RtT+W4GsVTts=;
 b=UBSLNJWqwUEJR2X7HdMCbwyz1SNOK3iO0OneLWlHb77QSH3LA7DB10R0
 ynlvIgGXOkrgan3q3SgMLa1CwdEBsfxn3ZN2eooW6dGKnW3d5R9XNW6SU
 bVYKDP9BFq/b5dmqtmiStS5SUjlZDU4FWWPX1x6Pu6bvgB3iAzoPss8Z6 Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WYMRThTbmuk23XNtjopCxyVcBHxgqTzfxHfO1fQ0/sVMjDA/g5EPzg/9+6J1YQtHN8iCbAezcK
 s3Y/dWIqlcCI03c1o6FwLzYyxJRtMCXFninI+i9F0F8Hru6QcB7P5WTOSzbXfRqjkXPK0ept43
 Qr2boEdPPSkc/1aswcJnYMjfC5GcxG9w/b8aDxN6A+0ztIbslD1URk3+7mqq7Cym4gj+WIsM8j
 p+KL7B54Ef8/kc2s3a3cdspxrav4STur6YgwYtWkD8r1qeyvjbutDs1j8SXVVS/oGaB+Q7kebB
 1JE=
X-SBRS: 2.7
X-MesageID: 7952032
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,275,1569297600"; 
   d="scan'208";a="7952032"
To: xen-devel <xen-devel@lists.xenproject.org>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <68abde10-8bdb-f193-92ff-afb31a357cce@citrix.com>
Date: Wed, 6 Nov 2019 17:50:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Ryzen 3xxx plans for 4.13
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
Cc: Juergen Gross <jgross@suse.com>, Steven Haigh <netwiz@crc.id.au>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Andreas Kinzler <hfp@posteo.de>, Paul
 Durrant <Paul.Durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VHJ5aW5nIHRvIHBpY2sgdGhpcyB0aHJlYWQgdXAgZnJvbSB0aGUgZGlzY3Vzc2lvbiAiRGVidWdn
aW5nIFdpbmRvd3MgSFZNCmNyYXNoZXMgb24gUnl6ZW4gM3h4eCBzZXJpZXMgQ1BVcy4iICBJJ20g
dHJ5aW5nIHRvIHN1bW1hcml6ZSB3aGF0IEkgc2VlCmNsYWltZWQsIGFuZCBteSB1bmRlcnN0YW5k
aW5nIG9mIHRoaW5ncywgYW5kIGFtIG5vdCBuZWNlc3NhcmlseSBzcGVha2luZwphcyBhbiBhdXRo
b3JpdHksIHNvIHBsZWFzZSBjb3JyZWN0IG1lIHdoZXJlIEknbSB3cm9uZy4KCk1vZGVybiBXaW5k
b3dzIGd1ZXN0cyAoYXQgbGVhc3QgV2luZG93cyAxMCBhbmQgV2luZG93cyBTZXJ2ZXIgMjAxNikK
Y3Jhc2ggd2hlbiBydW5uaW5nIHVuZGVyIFhlbiBvbiBBTUQgUnl6ZW4gM3h4eCBkZXNrdG9wLWNs
YXNzIGNwdXMgKGJ1dApub3QgdGhlIGNvcnJlc3BvbmRpbmcgc2VydmVyIGNwdXMpLiAgVGhpcyBp
cyB0cnVlIGZvciBhbGwgdXBzdHJlYW0KcmVsZWFzZXMgb2YgWGVuIChpLmUuLCBoYXMgbm90aGlu
ZyB0byBkbyB3aXRoIFhlbiA0LjEzIGluIHBhcnRpY3VsYXIpLgoKTGludXggc3lzdGVtcyBzZWVt
IHRvIHdvcmsganVzdCBmaW5lLgoKSXQgc2VlbXMgdGhhdCByZXZlcnRpbmcgcGF0Y2ggY2EyZWVl
OTJkZjQ0IChmcm9tIFhlbiAzLjQhKSBmaXhlcyB0aGUKaXNzdWUgZm9yIFN0ZXZlbi4gIFRoaXMg
d291bGQgc2VlbSB0byBpbmRpY2F0ZSB0aGF0IFdpbmRvd3MgcnVubmluZyBvbgpzdWNoIHN5c3Rl
bXMgaXMgY29uZnVzZWQgYnkgdGhlIHRvcG9sb2d5IGluZm9ybWF0aW9uIHByZXNlbnRlZCB0byBY
ZW4uCgpBICJwcm9wZXIgZml4IiBmb3IgdGhpcyB3b3VsZCBpbnZvbHZlIHByZXNlbnRpbmcgYSBj
b2hlcmVudCwgcmF0aW9uYWwKdG9wb2xvZ3kgdG8gZ3Vlc3RzLCB3aGljaCBpbiB0dXJuIHJlbGll
cyBvbiB0aGUgbG9uZy1hd2FpdGVkIENQVUlECmluZnJhc3RydWN0dXJlLCBhbGwgb2Ygd2hpY2gg
aXMgd2F5IG91dCBvZiBzY29wZSBmb3IgYmVpbmcgZml4ZWQgYnkgdGhlCjQuMTMgcmVsZWFzZS4K
ClRoZSByZXZlcnQgaW4gcXVlc3Rpb24gKm9ubHkqIHRvdWNoZXMgY29kZSBpbiBsaWJ4Yzsgbm8g
WGVuLXNpZGUgY2hhbmdlcwphcmUgcmVxdWlyZWQuCgpPbmUgaXNzdWUgdGhhdCB3YXMgcmFpc2Vk
IHdhcyB0byBkbyB3aXRoIG1pZ3JhdGlvbi4gIEJ1dCBhcyB1cHN0cmVhbSBYZW4KZG9lc24ndCBo
YXZlIGNwdSBsZXZlbGluZyAoPyksIGl0J3MgYWxyZWFkeSBub3QgcG9zc2libGUgdG8gbWlncmF0
ZSAqdG8qCnN1Y2ggYSBzeXN0ZW0gZnJvbSBhbnkgb3RoZXIgc3lzdGVtcy4gIFRoZSBtYWluIHdv
cnJ5IHRoZW4gd291bGQgYmUKbWFraW5nIHN1cmUgdGhhdCB3ZSBkZWFsIHByb3Blcmx5IHdpdGgg
bWlncmF0aW5nICphd2F5KiBmcm9tIHN1Y2ggYQpzeXN0ZW0gdG8gZnV0dXJlIHN5c3RlbXMgaW4g
ZnV0dXJlIHZlcnNpb25zLiAgQnV0IGl0J3MgYWJzb2x1dGVseSBjbGVhcgp0aGF0IHdlIGNhbid0
IHNpbXBseSBhcHBseSB0aGUgY2hhbmdlIGFjcm9zcyB0aGUgYm9hcmQ7IGl0IG11c3Qgb25seSBi
ZQpkb25lIG9uIFJ5emVuIDN4eHggc3lzdGVtcy4KCkdpdmVuIHRoYXQsIHdlIGhhdmUgYSBjb3Vw
bGUgb2YgYXBwcm9hY2hlcyB3ZSBjb3VsZCB0YWtlOgoKMS4gRG9jdW1lbnQgdGhhdCBYZW4gNC4x
MyBkb2Vzbid0IHdvcmsgd2l0aCBSeXplbiwgYW5kIHB1bnQgdGhlIGlzc3VlIHRvCjQuMTQuCgoy
LiBUcnkgdG8gZmlndXJlIG91dCBleGFjdGx5IHdoaWNoIGNoYW5nZXMgYWxsb3cgV2luZG93cyB0
byB3b3JrLCBhbmQKZG9jdW1lbnQgdGhhdCB1c2VycyBzaG91bGQgYWRkIHRob3NlICh0ZW1wb3Jh
cmlseSkgdG8geGwuY2ZnIGZpbGVzLiAgKElmCnNldHRpbmcgdGhlc2UgdmFsdWVzIGlzIGJyb2tl
biwgdGhpcyBjYW4gYmUgZml4ZWQuKQoKMy4gSGF2ZSBhIGxpYnhsIC8geGwgZmxhZyBpbmRpY2F0
aW5nIHRvIGFwcGx5IHRoZSBjaGFuZ2VzIGhlcmUgYXMtaXMgKG9yCndpdGggdGhlIG1pbmltYWwg
Y2hhbmdlcyBuZWNlc3NhcnkpCgo0LiBIYXZlIGFuIGVudmlyb25tZW50IHZhcmlhYmxlIHRoZSB1
c2VyIGNhbiBzZXQgd2hpY2ggd2lsbCBjYXVzZSB0aGUKdG9vbHN0YWNrIHRvIGRvIHRoZSBhYm92
ZSBvbiB2ZXJzaW9ucyB0aGF0IGRvbid0IGhhdmUgYSAicHJvcGVyIgoKNS4gSWYgd2UgY2FuIG1h
a2Ugb3V0Z29pbmcgbWlncmF0aW9ucyBmb3J3YXJkLWNvbXBhdGlibGUsIHRoZW4gd2UgY291bGQK
dGhpbmsgYWJvdXQgYXV0b21hdGljYWxseSBhcHBseWluZyB0aGlzIGZlYXR1cmUgb25seSBvbiB0
aGUgYWZmZWN0ZWQgY3B1cy4KClRob3VnaHRzPwoKSSB0aGluayB0aGUgZmlyc3Qgc3RlcCBzaG91
bGQgYmUgdG8gaWRlbnRpZnkgdGhlIG1pbmltdW0gc2V0IG9mIGNoYW5nZXMKdGhhdCBhbGxvdyBX
aW5kb3dzIHRvIGJvb3QsIGFuZCB0aGVuIHNlZSBpZiB3ZSBjYW4ndCBhdXRvbWF0aWNhbGx5IGFw
cGx5CnRoZSBjaGFuZ2VzIGluIGEgZm9yd2FyZC1jb21wYXRpYmxlIG1hbm5lciAoIzUpLiAgSWYg
d2UgY2FuJ3QsIHRoZW4KdHJ5aW5nIHRvIGdldCBleGlzdGluZyBjb25maWd1cmF0aW9ucyBzbyB0
aGF0IHlvdSBjYW4gc3BlY2lmeSB0aGUgcmlnaHQKYml0cyBpcyB0aGUgbmV4dCBiZXN0IG9wdGlv
biAoIzIpOyBhbmQgaGF2aW5nIGFuIGVudmlyb25tZW50IHZhcmlhYmxlCndvdWxkIGJlIHRoZSBm
aW5hbCBmYWwtYmFjay4KCkl0IHNob3VsZG4ndCBiZSB0ZXJyaWJseSBkaWZmaWN1bHQsIGdpdmVu
IHRoZSBwYXRjaCwgdG8gImJpc2VjdCIgdGhlCm1pbmltdW0gY2hhbmdlcyByZXF1aXJlZCB0byBl
bmFibGUgV2luZG93cyBndWVzdHMgdG8gYm9vdC4gIFdobyB3YW50cyB0bwpwaWNrIHRoYXQgdXA/
CgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
