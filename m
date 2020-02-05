Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D991534F3
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 17:06:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izN9Y-0004GK-D7; Wed, 05 Feb 2020 16:03:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l5F9=3Z=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1izN9W-0004GF-AP
 for xen-devel@lists.xen.org; Wed, 05 Feb 2020 16:03:46 +0000
X-Inumbo-ID: 15c20978-4831-11ea-9149-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15c20978-4831-11ea-9149-12813bfff9fa;
 Wed, 05 Feb 2020 16:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580918625;
 h=to:cc:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=82XwzRK4t6q8XQs5KxRFCrQinV4G8GQGi3XKReu7gdM=;
 b=bp6G2ubrauNSFHexrk0fHB974Vsb2Tc/PhiAkBCTJ57+HN3zxiyd+VNB
 CXNhu//Tr9tGPhhx9UJYaWvYScOGSPK9rEY0eM1BvFSB1k2HdfuMaQoLG
 NHaBULUqoIQS0b8qkGWztx0jJw1Hc92PTwT8ur0tSq2St1xg6MgzdManN c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 28T1dFlKhjQU36kE41TWRsh2wF7Hz0PRAGM8eHzAVdcFma22uKc3ehFZN6xzhCupTs4akg/a+B
 7KN7NsNbph8S4iD38tFjHCIn4EJ4vBbX+sTLx5C+QddvJUeals6YMt5roXIHMv0kEdnTbFxkIQ
 C9go/F+8O2vgapxqRMOlUofgaerxcZGg6ge2ZF2VhxSKVdWOgDb0kPHVRxwYGNC5Rv58oauDAq
 SduaH5QXoFA9/SBVtgM0GJay+TagPthIidfQ14xgyBGPWssOcrr4Vh6pOWh0hgHZ4Et3mA63gR
 CIY=
X-SBRS: 2.7
X-MesageID: 12608356
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,406,1574139600"; d="scan'208";a="12608356"
To: Xen-devel <xen-devel@lists.xen.org>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <6722f058-61eb-30c9-f97d-def690ccd7b8@citrix.com>
Date: Wed, 5 Feb 2020 16:03:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Live-Patch application failure in core-scheduling mode
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
Cc: Juergen Gross <jgross@suse.com>,
 "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpJJ20gY3VycmVudGx5IGludmVzdGlnYXRpbmcgYSBMaXZlLVBhdGNoIGFwcGxpY2F0
aW9uIGZhaWx1cmUgaW4gY29yZS0Kc2NoZWR1bGluZyBtb2RlIGFuZCB0aGlzIGlzIGFuIGV4YW1w
bGUgb2Ygd2hhdCBJIHVzdWFsbHkgZ2V0OgooaXQncyBlYXNpbHkgcmVwcm9kdWNpYmxlKQoKICAg
IChYRU4pIFsgIDM0Mi41MjgzMDVdIGxpdmVwYXRjaDogbHA6IENQVTggLSBJUElpbmcgdGhlIG90
aGVyIDE1IENQVXMKICAgIChYRU4pIFsgIDM0Mi41NTgzNDBdIGxpdmVwYXRjaDogbHA6IFRpbWVk
IG91dCBvbiBzZW1hcGhvcmUgaW4gQ1BVIHF1aWVzY2UgcGhhc2UgMTMvMTUKICAgIChYRU4pIFsg
IDM0Mi41NTgzNDNdIGJhZCBjcHVzOiA2IDkKCiAgICAoWEVOKSBbICAzNDIuNTU5MjkzXSBDUFU6
ICAgIDYKICAgIChYRU4pIFsgIDM0Mi41NTk1NjJdIFhlbiBjYWxsIHRyYWNlOgogICAgKFhFTikg
WyAgMzQyLjU1OTU2NV0gICAgWzxmZmZmODJkMDgwMjNmMzA0Pl0gUiBjb21tb24vc2NoZWR1bGUu
YyNzY2hlZF93YWl0X3JlbmRlenZvdXNfaW4rMHhhNC8weDI3MAogICAgKFhFTikgWyAgMzQyLjU1
OTU2OF0gICAgWzxmZmZmODJkMDgwMjNmOGFhPl0gRiBjb21tb24vc2NoZWR1bGUuYyNzY2hlZHVs
ZSsweDE3YS8weDI2MAogICAgKFhFTikgWyAgMzQyLjU1OTU3MV0gICAgWzxmZmZmODJkMDgwMjQw
ZDVhPl0gRiBjb21tb24vc29mdGlycS5jI19fZG9fc29mdGlycSsweDVhLzB4OTAKICAgIChYRU4p
IFsgIDM0Mi41NTk1NzRdICAgIFs8ZmZmZjgyZDA4MDI3OGVjNT5dIEYgYXJjaC94ODYvZG9tYWlu
LmMjZ3Vlc3RfaWRsZV9sb29wKzB4MzUvMHg2MAoKICAgIChYRU4pIFsgIDM0Mi41NTk3NjFdIENQ
VTogICAgOQogICAgKFhFTikgWyAgMzQyLjU2MDAyNl0gWGVuIGNhbGwgdHJhY2U6CiAgICAoWEVO
KSBbICAzNDIuNTYwMDI5XSAgICBbPGZmZmY4MmQwODAyNDE2NjE+XSBSIF9zcGluX2xvY2tfaXJx
KzB4MTEvMHg0MAogICAgKFhFTikgWyAgMzQyLjU2MDAzMl0gICAgWzxmZmZmODJkMDgwMjNmMzIz
Pl0gRiBjb21tb24vc2NoZWR1bGUuYyNzY2hlZF93YWl0X3JlbmRlenZvdXNfaW4rMHhjMy8weDI3
MAogICAgKFhFTikgWyAgMzQyLjU2MDAzNl0gICAgWzxmZmZmODJkMDgwMjNmOGFhPl0gRiBjb21t
b24vc2NoZWR1bGUuYyNzY2hlZHVsZSsweDE3YS8weDI2MAogICAgKFhFTikgWyAgMzQyLjU2MDAz
OV0gICAgWzxmZmZmODJkMDgwMjQwZDVhPl0gRiBjb21tb24vc29mdGlycS5jI19fZG9fc29mdGly
cSsweDVhLzB4OTAKICAgIChYRU4pIFsgIDM0Mi41NjAwNDJdICAgIFs8ZmZmZjgyZDA4MDI3OWRi
NT5dIEYgYXJjaC94ODYvZG9tYWluLmMjaWRsZV9sb29wKzB4NTUvMHhiMAoKVGhlIGZpcnN0IEhU
IHNpYmxpbmcgaXMgd2FpdGluZyBmb3IgdGhlIHNlY29uZCBpbiB0aGUgTFAtYXBwbGljYXRpb24K
Y29udGV4dCB3aGlsZSB0aGUgc2Vjb25kIHdhaXRzIGZvciB0aGUgZmlyc3QgaW4gdGhlIHNjaGVk
dWxlciBjb250ZXh0LgoKQW55IHN1Z2dlc3Rpb25zIG9uIGhvdyB0byBpbXByb3ZlIHRoaXMgc2l0
dWF0aW9uIGFyZSB3ZWxjb21lLgoKLS0KVGhhbmtzLApTZXJnZXkKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
