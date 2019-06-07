Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAFD389F8
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 14:16:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZDjp-00017G-2G; Fri, 07 Jun 2019 12:12:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0f+t=UG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hZDjn-00017B-Eg
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 12:12:51 +0000
X-Inumbo-ID: 917430cc-891d-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 917430cc-891d-11e9-8980-bc764e045a96;
 Fri, 07 Jun 2019 12:12:50 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: r7Peqgz3rGZimsHpAZ+DQsh13NTFV3aYhCxy6dWL/rs3gcx/377Ap83t8r83eoZF1psV9fnzPH
 p9d9/ow5mkDOYOTovOZLaCihJzeXWeNQppo9TLJUutzMsubL+a96vl51x0C6MaHPQoPbF7qXtp
 lRTjRGU1/9RdO8NOMVFXDCdxxpbwXQ9cd6zo5k0MaMPhXIZcDR2yoykCzUqqSE794xNBoylmOp
 WjoZA492A9vifVcQNicIN1uZ9pqFaUNNREfT8ggOg4mWTDcrRzhk6M/lRXJMGJoLc1MjVvoUJT
 a/s=
X-SBRS: -0.9
X-MesageID: 1452232
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,563,1557201600"; 
   d="scan'208";a="1452232"
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <1559909224-26062-1-git-send-email-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ec9e3d3d-867d-cccf-b873-6f145188f824@citrix.com>
Date: Fri, 7 Jun 2019 13:12:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559909224-26062-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86: Fix boot with CONFIG_XSM enabled
 following c/s 7177f589ba
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDYvMjAxOSAxMzowNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBDdXJyZW50bHksIGJv
b3Rpbmcgc3RhZ2luZyBmYWlscyB3aXRoOgo+Cj4gICAoWEVOKSBVc2luZyBBUElDIGRyaXZlciBk
ZWZhdWx0Cj4gICAoWEVOKSAtLS0tWyBYZW4tNC4xMy11bnN0YWJsZSAgeDg2XzY0ICBkZWJ1Zz15
ICAgTm90IHRhaW50ZWQgXS0tLS0KPiAgIChYRU4pIENQVTogICAgMAo+ICAgKFhFTikgUklQOiAg
ICBlMDA4Ols8ZmZmZjgyZDA4MDM4ZjY2ZT5dIF9feDg2X2luZGlyZWN0X3RodW5rX3JheCsweGUv
MHgxMAo+ICAgKFhFTikgUkZMQUdTOiAwMDAwMDAwMDAwMDEwMDE2ICAgQ09OVEVYVDogaHlwZXJ2
aXNvcgo+ICAgKFhFTikgcmF4OiBjMmMyYzJjMmMyYzJjMmMyICAgcmJ4OiBmZmZmODMwMDNmNGNj
MDAwICAgcmN4OiAwMDAwMDAwMDAwMDAwMDAwCj4gICA8c25pcD4KPiAgIChYRU4pIFhlbiBjb2Rl
IGFyb3VuZCA8ZmZmZjgyZDA4MDM4ZjY2ZT4gKF9feDg2X2luZGlyZWN0X3RodW5rX3JheCsweGUv
MHgxMCk6Cj4gICAoWEVOKSAgYWUgZTggZWIgZmIgNDggODkgMDQgMjQgPGMzPiA5MCBlOCAwNSAw
MCAwMCAwMCAwZiBhZSBlOCBlYiBmYiA0OCA4OSAwYyAyNAo+ICAgKFhFTikgWGVuIHN0YWNrIHRy
YWNlIGZyb20gcnNwPWZmZmY4MmQwODA4MjdkMjg6Cj4gICAoWEVOKSAgICBjMmMyYzJjMmMyYzJj
MmMyIGZmZmY4MmQwODAyMDc1ODggZmZmZjgyZDA4MDgyN2Q2OCAwMDAwMDAwMDAwMDAwMDAwCj4g
ICA8c25pcD4KPiAgIChYRU4pIFhlbiBjYWxsIHRyYWNlOgo+ICAgKFhFTikgICAgWzxmZmZmODJk
MDgwMzhmNjZlPl0gX194ODZfaW5kaXJlY3RfdGh1bmtfcmF4KzB4ZS8weDEwCj4gICAoWEVOKSAg
ICBbPGZmZmY4MmQwODA2MDc4YTk+XSBzZXR1cF9zeXN0ZW1fZG9tYWlucysweDE4LzB4YWIKPiAg
IChYRU4pICAgIFs8ZmZmZjgyZDA4MDYyZDljOD5dIF9fc3RhcnRfeGVuKzB4MWVhOS8weDI5MzUK
PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDIwMDBmMz5dIF9faGlnaF9zdGFydCsweDUzLzB4NTUK
PiAgIChYRU4pCj4gICAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqCj4gICAoWEVOKSBQYW5pYyBvbiBDUFUgMDoKPiAgIChYRU4pIEdFTkVSQUwgUFJPVEVDVElP
TiBGQVVMVAo+ICAgKFhFTikgW2Vycm9yX2NvZGU9MDAwMF0KPiAgIChYRU4pICoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPgo+IFVCU0FOICh3aGljaCBJIGhhcHBlbmVk
IHRvIGhhdmUgYWN0aXZlIGluIG15IGJ1aWxkIGF0IHRoZSB0aW1lKSBpZGVudGlmaWVzIHRoZQo+
IHByb2JsZW0gZXhwbGljaXRseToKPgo+ICAgKFhFTikgVXNpbmcgQVBJQyBkcml2ZXIgZGVmYXVs
dAo+ICAgKFhFTikgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAgIChYRU4pIFVCU0FOOiBVbmRl
ZmluZWQgYmVoYXZpb3VyIGluIC9sb2NhbC94ZW4uZ2l0L3hlbi9pbmNsdWRlL3hzbS94c20uaDoz
MDk6MTkKPiAgIChYRU4pIG1lbWJlciBhY2Nlc3Mgd2l0aGluIG51bGwgcG9pbnRlciBvZiB0eXBl
ICdzdHJ1Y3QgeHNtX29wZXJhdGlvbnMnCj4gICAoWEVOKSAtLS0tWyBYZW4tNC4xMy11bnN0YWJs
ZSAgeDg2XzY0ICBkZWJ1Zz15ICAgTm90IHRhaW50ZWQgXS0tLS0KPgo+ICJhZGp1c3Qgc3lzdGVt
IGRvbWFpbiBjcmVhdGlvbiAoYW5kIGNhbGwgaXQgZWFybGllciBvbiB4ODYpIiBkaWRuJ3QgYWNj
b3VudAo+IGZvciB0aGUgZmFjdCB0aGF0IGRvbWFpbl9jcmVhdGUoKSBkZXBlbmRzIG9uIFhTTSBh
bHJlYWR5IGJlaW5nIHNldCB1cC4gIFRoZXJlCj4gaXMgbm90aGluZyB2ZXJ5IGludGVyZXN0aW5n
IHdoaWNoIHhzbV9tdWx0aWJvb3RfaW5pdCgpIG1vcmUgdGhhbiBhbGxvY2F0aW5nCj4gbWVtb3J5
LCB3aGljaCBtZWFucyBpdCBpcyBzYWZlIHRvIG1vdmUgZWFybGllciBkdXJpbmcgYm9vdC4KCk9o
IC0gcGVyaGFwcyBpdCBpcyB3b3J0aCBwb2ludGluZyBvdXQgdGhhdCB3ZSBlbmQgdXAgZm9sbG93
aW5nIHRoZSBOVUxMCmZ1bmN0aW9uIHBvaW50ZXIgeHNtX29wcy0+YWxsb2Nfc2VjdXJpdHlfZG9t
YWluKCkgYW5kIGV4ZWN1dGUgcGFydCBvZgp0aGUgMTZiaXQgSVZUIHVudGlsIHdlIGVuZCB1cCB3
aXRoIHRoZSByZXRwb2xpbmUgZXhwbG9zaW9uLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
