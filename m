Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61285159028
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 14:42:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1VlW-00054r-9Q; Tue, 11 Feb 2020 13:39:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BEN5=37=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j1VlV-00054m-CC
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 13:39:49 +0000
X-Inumbo-ID: f80013e2-4cd3-11ea-b599-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f80013e2-4cd3-11ea-b599-12813bfff9fa;
 Tue, 11 Feb 2020 13:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581428387;
 h=to:cc:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=M+FdxBL+CVPscGrTks1jRNSY78BatXK467XWt56tTUg=;
 b=QZAlwcwVZLYtDYK1hRyb30EPSkMAQFN1I884tmJ6NCt47swNAtem4GGB
 KYyjCntBkQiaWmTNIkP6eQRq4UoruH2AZ+fum+U5SI8HRAUdO1Ky903/l
 IBnR0S8hUcdUQTN7sxmffJB/SVHZGhy7V62PQjp1YWQmnCC15HeFIr4Y+ 8=;
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
IronPort-SDR: 7N8zfJ3IQI/+stA9KqH+1dopIOP81a5IMSezjR6Zpz7RBHpo6QvACiB+XxhaA5b1uciEELl3H+
 jCNdqQA2crR6iU6MOaZr89VV6BU9ZpvmD2/MmUuasg0VDBKhDejyv8pJvLjs8LJ8Lku2Dxs2Th
 Tr0zGUUjoW48Rne4MrTERstkwFeZWLmqbd789omjotQzXFipt9KVIsIMtZF6DV1hIwptfb7V9S
 dzgUDWCW+epHZ1HbBHN4z6ngtfTTzJH2OsWRNnp1ZeKivc7wvGGkqsyHjRWvqp4vkGKvEBXfzZ
 fpk=
X-SBRS: 2.7
X-MesageID: 12638540
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12638540"
To: xen-devel <xen-devel@lists.xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <2b7826d9-8822-97c8-0637-03bcb98d6418@citrix.com>
Date: Tue, 11 Feb 2020 13:39:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: [Xen-devel] PV Shim ballooning
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QmFsbG9vbmluZyBpbnNpZGUgUFYgc2hpbSBpcyBjdXJyZW50bHkgdmVyeSBicm9rZW4uCgpGcm9t
IGFuIGluc3RydW1lbnRlZCBYZW4gYW5kIDMyYml0IFBWIFhURiB0ZXN0OgoKKGQzKSAoZDMpIC0t
LSBYZW4gVGVzdCBGcmFtZXdvcmsgLS0tCihkMykgKGQzKSBCYWxsb29uaW5nOiBQViAzMmJpdCAo
UEFFIDMgbGV2ZWxzKQooZDMpIChkMykgbXIgeyAwMDEwYTk0MCwgMTAyNCwgMHg3ZmYwIH0KKGQz
KSAoZDMpIEFib3V0IHRvIGRlY3JlYXNlCihkMykgKFhFTikgKioqIEQgeyBmZmZmODIwMDgwMDAw
MDIwLCBuciAxMDIwLCBkb25lIDAgfQooZDMpIChYRU4pIGQzdjAgZmFpbGVkIHRvIHJlc2VydmUg
MjY3IGV4dGVudHMgb2Ygb3JkZXIgMCBmb3Igb2ZmbGluaW5nCihkMykgKFhFTikgKioqIEQgeyBm
ZmZmODIwMDdmZmZlMDQwLCBuciAxMDI0LCBkb25lIDEwMjAgfQooZDMpIChYRU4pIGQzdjAgZmFp
bGVkIHRvIHJlc2VydmUgMTAyNCBleHRlbnRzIG9mIG9yZGVyIDAgZm9yIG9mZmxpbmluZwooZDMp
IChkMykgPT4gZ290IDEwMjQKClRoaXMgdGVzdCB0YWtlcyAxMDI0IGZyYW1lcyBhbmQgY2FsbHMg
ZGVjcmVhc2UgcmVzZXJ2YXRpb24gb24gdGhlbSwKYmVmb3JlIHVubWFwcGluZy7CoCBpLmUuIHRo
ZSBkZWNyZWFzZSByZXNlcnZhdGlvbiBzaG91bGQgZmFpbC7CoCBTaGltCnN1Y2Nlc3NmdWxseSBv
ZmZsaW5lcyA3NTMgcGFnZXMgKG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgZnJhbWVzIHRoZSBndWVz
dApzZWxlY3RlZCksIGFuZCBmYWlscyB0byBvZmZsaW5lIDEyOTEsIGFuZCBkZXNwaXRlIHRoaXMs
IHJldHVybnMgc3VjY2Vzcy4KCkZpcnN0IG9mIGFsbCwgdGhlICJmYWlsZWQgdG8gcmVzZXJ2ZSIg
aXMgaW4gcHZfc2hpbV9vZmZsaW5lX21lbW9yeSgpCndoaWNoIGlzIGEgdm9pZCBmdW5jdGlvbiB0
aGF0IGhhcyBhIHNlbWFudGljYWxseSByZWxldmFudCBmYWlsdXJlIGNhc2UuwqAKVGhpcyBvYnZp
b3VzbHkgaXNuJ3Qgb2suCgpTZWNvbmQsIHRoZSB3YXkgdGhlIGNvbXBhdCBjb2RlIGxvb3BzIG92
ZXIgdGhlIHRyYW5zbGF0ZWQgZGF0YSBpcwppbmNvbXBhdGlibGUgd2l0aCBob3cgYXJncy5ucl9k
b25lIGlzIHVzZWQgZm9yIHRoZSBjYWxsIGludG8KcHZfc2hpbV9vZmZsaW5lX21lbW9yeSgpLgoK
V2h5IGlzIHB2X3NoaW1fb2ZmbGluZV9tZW1vcnkoKSBub3QgaW4gZGVjcmVhc2VfcmVzZXJ2YXRp
b24oKSB0byBiZWdpbiB3aXRoPwoKRnVydGhlcm1vcmUsIHRoZXJlIGlzIGEgZnVuZGFtZW50YWwg
ZGlmZmVyZW5jZSBpbiBiYWxsb29uaW5nIGJlaGF2aW91cgpiZXR3ZWVuIFBWIGFuZCBIVk0gZ3Vl
c3RzLCB3aGljaCBJIGRvbid0IHRoaW5rIHdlIGNhbiBjb21wZW5zYXRlIGZvci7CoApQViBndWVz
dHMgbmVlZCB0byBjYWxsIGRlY3JlYXNlIHJlc2VydmF0aW9uIG9uY2UgdG8gcmVsZWFzZSB0aGUg
ZnJhbWVzLAphbmQgdW5tYXAgdGhlIGZyYW1lcyAoaW4gYW55IG9yZGVyKS7CoCBIVk0gZ3Vlc3Rz
IGNhbGxpbmcgZGVjcmVhc2UKcmVzZXJ2YXRpb24gYXV0b21hdGljYWxseSBtYWtlIHRoZSBmcmFt
ZSB1bnVzYWJsZSBubyBtYXR0ZXIgaG93IG1hbnkKb3V0c3RhbmRpbmcgcmVmZXJlbmNlcyBleGlz
dC4KClNoaW0gY2FuJ3QgZGVjcmVhc2UgcmVzZXJ2YXRpb24gKEhWTSB3aXRoIEwwIFhlbikgb24g
YW55IGZyYW1lIHdobydzCnJlZmVyZW5jZSBjb3VudCBkaWRuJ3QgZHJvcCB0byAwIGZyb20gdGhl
IFBWIGd1ZXN0cycgY2FsbCwgYW5kIHRoZXJlIGlzCm5vdGhpbmcgcHJlc2VudGx5IHRvIGNoZWNr
IHRoaXMgY29uZGl0aW9uLgoKU2hvcnQgb2YgYSBQR0MgYml0IGFuZCBleHRyYSBzaGltIGxvZ2lj
IGluIGZyZWVfZG9taGVhcF9wYWdlKCksIEkgY2FuJ3QKc2VlIGFueSB3YXkgdG8gcmVjb25jaWxl
IHRoZSBiZWhhdmlvdXIsIGV4Y2VwdCB0byBjaGFuZ2UgdGhlIHNlbWFudGljcwpvZiBkZWNyZWFz
ZSByZXNlcnZhdGlvbiBmb3IgUFYgZ3Vlc3RzLsKgIEluIHByYWN0aWNlLCB0aGlzIHdvdWxkIGJl
IGZhcgptb3JlIHNlbnNpYmxlIGJlaGF2aW91ciwgYnV0IHdlIGhhdmUgbm8gaWRlYSBpZiBleGlz
dGluZyBQViBndWVzdHMgd291bGQKbWFuYWdlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
