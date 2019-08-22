Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E99A329
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 00:43:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0vjz-0000SZ-R7; Thu, 22 Aug 2019 22:39:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6mJm=WS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i0vjy-0000ST-LX
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 22:39:34 +0000
X-Inumbo-ID: b606ef2a-c52d-11e9-8980-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b606ef2a-c52d-11e9-8980-bc764e2007e4;
 Thu, 22 Aug 2019 22:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566513573;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qzgtqHAZhBRgWteRhyE1FR562f5LuRdIy0qDzSeSdms=;
 b=hOFJ3/jfqs4Cw0HFZtN/hna1JbucOL5ygHLEqKyPB0nAIw7ZR5a9dkvQ
 0Iz374gFEEHM2JNeQmo5k67ttF+6El5zgMD+PFi0v+lC97hW9UGvG8cNW
 Y9ZtaO4/zufQ7Xq7KKPaefwLNtfIAPJHt2Qi0YWTBlRyDTsvJfNTlWjTm o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QhNDzAUATiXPF/FneaZJG3Yk4Zrh4EMCxkrPuYxvt1adniAkUM1ncU5CdDRPxZNP72D7OEkNmS
 IFMBo4VzgS7ooHtJxyUQlWCnqzUvu9SaKWWTY/bZOiCXD+r3dSWgJUVDN6W0LnnH3r+S1oY6oh
 UmqgQWHLdAYFTME+j1/JS9PZGss37N5o+5AXlNBYerltubiyGPpgBwkm7F4fR6c/mgVbmb7F8h
 dwGIe4z9iLQnV4C36awIoXFj1h0+ICo5lUg7V8RqHgo5KAhqOvlImtNPj4HFm4PQ3cY1ybpmg8
 vKU=
X-SBRS: 2.7
X-MesageID: 4657239
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,418,1559534400"; 
   d="scan'208";a="4657239"
To: Rich Persaud <persaur@gmail.com>
References: <15a4c482-1207-1d8a-fd2a-dc4f25956c27@cs.rochester.edu>
 <79c7b71f-0b61-2799-4a79-644536a9c891@citrix.com>
 <d55da430-0d73-8a92-73e7-99e1aa70680c@cs.rochester.edu>
 <5b190182-4938-52b4-eeb2-df77224711c3@citrix.com>
 <587225E8-C0DE-40BA-B39E-E30F9CE69B92@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <74cb4fb4-9983-0000-9dbb-8fc24921a372@citrix.com>
Date: Thu, 22 Aug 2019 23:39:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <587225E8-C0DE-40BA-B39E-E30F9CE69B92@gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] More questions about Xen memory layout/usage,
 access to guest memory
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Johnson,
 Ethan" <ejohns48@cs.rochester.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMDgvMjAxOSAyMTo1NywgUmljaCBQZXJzYXVkIHdyb3RlOgo+PiBPbiBBdWcgMjIsIDIw
MTksIGF0IDA5OjUxLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3
cm90ZToKPj4KPj4+IE9uIDIyLzA4LzIwMTkgMDM6MDYsIEpvaG5zb24sIEV0aGFuIHdyb3RlOgo+
Pj4KPj4+IEZvciBIVk0sIG9idmlvdXNseSBhbnl0aGluZyB0aGF0IGNhbid0IGJlIHZpcnR1YWxp
emVkIG5hdGl2ZWx5IGJ5IHRoZSAKPj4+IGhhcmR3YXJlIG5lZWRzIHRvIGJlIGVtdWxhdGVkIGJ5
IFhlbi9RRU1VIChzaW5jZSB0aGUgZ3Vlc3Qga2VybmVsIGlzbid0IAo+Pj4gZXhwZWN0ZWQgdG8g
YmUgY29vcGVyYXRpdmUgdG8gaXNzdWUgUFYgaHlwZXJjYWxscyBpbnN0ZWFkKTsgYnV0IEkgd291
bGQgCj4+PiBleHBlY3QgZW11bGF0aW9uIHRvIGJlIGxpbWl0ZWQgdG8gdGhlIHJlbGF0aXZlbHkg
c21hbGwgc3Vic2V0IG9mIHRoZSBJU0EgCj4+PiB0aGF0IFZNWC9TVk0gY2FuJ3QgbmF0aXZlbHkg
dmlydHVhbGl6ZS4gWWV0IEkgc2VlIHRoYXQgeDg2X2VtdWxhdGUuYyAKPj4+IHN1cHBvcnRzIGVt
dWxhdGluZyBqdXN0IGFib3V0IGV2ZXJ5dGhpbmcuIFVuZGVyIHdoYXQgY2lyY3Vtc3RhbmNlcyBk
b2VzIAo+Pj4gWGVuIGFjdHVhbGx5IG5lZWQgdG8gcHV0IGFsbCB0aGF0IGVtdWxhdGlvbiBjb2Rl
IHRvIHVzZT8KPj4gSW50cm9zcGVjdGlvbiwgYXMgSSBzYWlkIGVhcmxpZXIsIHdoaWNoIGlzIHBv
dGVudGlhbGx5IGFueSBpbnN0cnVjdGlvbi4KPiBDb3VsZCBpbnRyb3NwZWN0aW9uLXNwZWNpZmlj
IGVtdWxhdGlvbiBjb2RlIGJlIGRpc2FibGVkIHZpYSBLQ29uZmlnPwoKTm90IHJlYWxseS4KCkF0
IHRoZSBwb2ludCBzb21ldGhpbmcgaGFzIHRyYXBwZWQgZm9yIGVtdWxhdGlvbiwgd2UgbXVzdCBj
b21wbGV0ZSBpdCBpbgphIG1hbm5lciBjb25zaXN0ZW50IHdpdGggdGhlIHg4NiBhcmNoaXRlY3R1
cmUsIG9yIHRoZSBndWVzdCB3aWxsIGNyYXNoLgoKSWYgeW91IGRvbid0IHdhbnQgZW11bGF0aW9u
IGZyb20gaW50cm9zcGVjdGlvbiwgZG9uJ3Qgc3RhcnQKaW50cm9zcGVjdGluZyBpbiB0aGUgZmly
c3QgcGxhY2UsIGF0IHdoaWNoIHBvaW50IGd1ZXN0IGFjdGlvbnMgd29uJ3QKdHJhcCBpbiB0aGUg
Zmlyc3QgcGxhY2UuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
