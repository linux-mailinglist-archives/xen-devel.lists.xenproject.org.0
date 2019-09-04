Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B70A7E85
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 10:54:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5R0C-0007t5-BS; Wed, 04 Sep 2019 08:50:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zWnQ=W7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i5R0B-0007sy-7S
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 08:50:55 +0000
X-Inumbo-ID: 1a87ed4c-cef1-11e9-b299-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a87ed4c-cef1-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 08:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567587055;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=qnNLVIWIkppzXV+Ym1UDzq70j/YvmqpSBcJcr9ejgg4=;
 b=FIJKZ+e6LBZ/cqB9syRI+ZbgtXrMhziyeDbldI+lGPAvUTH/DCzF/G/U
 k5ek8UQNTNGR28pS5uiNCnktK8ST8XH+q7WXRsnT/DayWxvu7zRz2jpQd
 sMDPROXkrPkVGnQeGSJzNpKMg6ItaWWPI3b+16UPju2lGZLDfqcxcAsT0 Y=;
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
IronPort-SDR: mXEMnmn4mf3aht6SRithl6nHN+YkgBg1+HsXiCttEnTSXI5DpgQ7cLRzLvWnsAcrqOeVX0TBiz
 uJpzuaRjWykFdTZiUf//vjvitiBrOHLCA+r+ZRq70OCkfBNrKdDBNTuU/bdmwYfkW/vZ6Ig3S0
 BJwdOlDeBmah4bIKrq1TijH8NYqZA+36m1dePCaqWw0dT08BPamsgvOTLrGB3/kEPrCMqci0Ot
 Ppkru0uZFBxpLU1EzJbNt9C1vp+lmi0jb2y9G+EVg3g9zRA04eNnNxaKEfG7sFV93aaY04UDfV
 IqY=
X-SBRS: 2.7
X-MesageID: 5156568
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,465,1559534400"; 
   d="scan'208";a="5156568"
To: Jan Beulich <jbeulich@suse.com>, osstest service owner
 <osstest-admin@xenproject.org>, <xen-devel@lists.xenproject.org>
References: <osstest-140960-mainreport@xen.org>
 <3b5b6d76-9087-05f5-5359-ec24322dda65@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <4df76271-cb52-7d79-af18-4b413aa85c56@citrix.com>
Date: Wed, 4 Sep 2019 09:50:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3b5b6d76-9087-05f5-5359-ec24322dda65@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [xen-unstable test] 140960: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDkvMjAxOSAwOTozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDMuMDkuMjAxOSAy
MjowMCwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+PiBmbGlnaHQgMTQwOTYwIHhlbi11
bnN0YWJsZSByZWFsIFtyZWFsXQo+PiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9y
Zy9vc3N0ZXN0L2xvZ3MvMTQwOTYwLwo+Pgo+PiBSZWdyZXNzaW9ucyA6LSgKPj4KPj4gVGVzdHMg
d2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4+IGluY2x1ZGluZyB0ZXN0
cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+PiAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1wdnNoaW0g
ICAxOCBndWVzdC1sb2NhbG1pZ3JhdGUveDEwICAgZmFpbCBSRUdSLiB2cy4gMTM5ODc2Cj4gVGhp
cyBsb29rcyB0byBiZSByZWN1cnJpbmcsIHNvIEkndmUgdGFrZW4gYW5vdGhlciBsb29rLgoKSSBo
YWQgYSBzdXNwaWNpb24gYXMgd2VsbCwgYnV0IGZpeGluZyB0aGUgaW50ZXJtaXR0ZW50IGJ1aWxk
IHByb2JsZW1zCndhcyB0aGUgZmlyc3QgcHJpb3JpdHkuCgpBIG1ham9yIGNoYW5nZSBpbiBzaGlt
IGluIHRoZSByYW5nZSB1bmRlciB0ZXN0IGlzIHN3aXRjaGluZyBmcm9tIENyZWRpdDEKdG8gTlVM
TCBhcyBhIHNjaGVkdWxlciwgZm9sbG93aW5nIERhcmlvJ3MgZml4aW5nIG9mIHdoYXQgd2UgdGhv
dWdodCB3YXMKdGhlIGZpbmFsIG91dHN0YW5kaW5nIGJ1Zy7CoCBQZXJoYXBzIGl0IHdhc24ndCB0
aGUgZmluYWwgYnVnLi4uCgo+ICBUaGUgdGhyZWUKPiBtaWdyYXRpb25zIGxlYXZlIHRoaXMgYWJi
cmV2aWF0ZWQgcGF0dGVybiBpbiB0aGUgbG9nOgo+Cj4gU2VwICAzIDE0OjIwOjQyLjQ0NjY2NyAo
WEVOKSBIVk0gZDF2MCBzYXZlOiBDUFVfTVNSCj4gLi4uCj4gU2VwICAzIDE0OjIwOjU3Ljg1MDY3
MCAoWEVOKSBIVk0yIHJlc3RvcmU6IENQVSAwCj4gLi4uCj4gU2VwICAzIDE0OjIxOjM3LjA2Mjg0
MCAoWEVOKSBIVk0gZDJ2MCBzYXZlOiBDUFVfTVNSCj4gU2VwICAzIDE0OjIxOjM3LjA2Mjg4OCAo
WEVOKSBIVk0zIHJlc3RvcmU6IENQVSAwCj4gLi4uCj4gU2VwICAzIDE0OjIxOjU2LjQzODU1MiAo
WEVOKSBIVk0gZDN2MCBzYXZlOiBDUFVfTVNSCj4gLi4uCj4gU2VwICAzIDE0OjIyOjExLjUwNjUw
OCAoWEVOKSBIVk00IHJlc3RvcmU6IENQVSAwCj4KPiBUaGVyZWZvcmUgSSB3b25kZXIgd2hldGhl
ciB0aGUgZmlyc3Qgb25lIGdvdCBsdWNreSBhbmQgZmluaXNoZWQKPiBiYXJlbHkgYWhlYWQgb2Yg
dGltaW5nIG91dCwgd2hpbGUgdGhlIDJuZCB3b3JrZWQgaW5zdGFudGx5IGFuZCB0aGUKPiAzcmQg
dGhlbiBlbmRlZCB1cCBleGNlZWRpbmcgdGhlIHRpbWVvdXQuIFdoYXQgaXMgY3VyaW91cyBhcmUg
dGhlCj4gaW50ZXJtZWRpYXRlIGxvZyBlbnRyaWVzIChiZXR3ZWVuIHRoZSBsYXN0ICJzYXZlIiBh
bmQgdGhlIGZpcnN0Cj4gY29ycmVzcG9uZGluZyAicmVzdG9yZSIgbG9nIGVudHJpZXMpOiBNYW55
IG9uZXMgb2YgdGhlIGZvcm0KPgo+IChYRU4pIGVtdWwtcHJpdi1vcC5jOjExMTM6ZDB2MiBEb21h
aW4gYXR0ZW1wdGVkIFdSTVNSIGMwMDExMDIwIGZyb20gMHgwMDAwMDAwMDAwMDAwMDAwIHRvIDB4
MDA0MDAwMDAwMDAwMDAwMAoKVGhpcyBpcyBkdWUgdG8gYSBsYWNrIG9mIE1TUl9WSVJUX1NQRUNf
Q1RSTC7CoCBJdCBpcyBzc2hkIChvciBzeXN0ZW1kIG9uCml0cyBiZWhhbGYgLSB1bmNsZWFyIHdo
aWNoKSB1c2luZyB0aGUgU1NCRCBwcmN0bCB0byBwcm90ZWN0IGl0c2VsZiwgYW5kClhlbiwgaGF2
aW5nIG5vIHN1cHBvcnQsIGlzIGNhdXNpbmcgTGludXggdG8gZmFsbCBiYWNrIHRvIG5hdGl2ZSBt
ZXRob2RzCmFuZCBmYWxsaW5nIGZvd2wgb2YgWGVucyB3cml0ZS9kaXNjYXJkIHBvbGljeSBvbiBN
U1JzLgoKPiB3aXRoIGEgMTVzIGdhcCBiZXR3ZWVuIHRoZSBmaXJzdCBhbmQgbWFueSBzdWJzZXF1
ZW50IG9uZXMpIGFuZAo+IGZpbmFsbHkgb25lIG9mIHRoZSBmb3JtCj4KPiBbICA0NTEuMjY3NjY5
XSBzeXN0ZW1kLWxvZ2luZFsyNzY2XTogTmV3IHNlc3Npb24gMzkgb2YgdXNlciByb290Lgo+Cj4g
QW5kIGZpbmFsbHksIGF0IGFyb3VuZCB0aGUgdGltZSBvZiB0aGUgZmFpbGVkIG1pZ3JhdGlvbgo+
Cj4gSU5JVDogSWQgIlQwIiByZXNwYXduaW5nIHRvbyBmYXN0OiBkaXNhYmxlZCBmb3IgNSBtaW51
dGVzCgpHb29nbGluZyBhcm91bmQgc3VnZ2VzdHMgaXQgaXMgYW4gaW5pdHRhYiBtaXNjb25maWd1
cmF0aW9uLgoKPgo+IFdoaWxlIGl0J3Mgbm90IGNsZWFyIHRoYXQgdGhpcyBwYXJhbGxlbCBhY3Rp
dml0eSBpcyBjYXVzaW5nIHRoZQo+IG1pZ3JhdGlvbiB0byBwcm9ncmVzcyB0b28gc2xvd2x5LCBp
dCBsb29rcyB0byBiZSBhIHBvc3NpYmlsaXR5IGF0Cj4gbGVhc3QuIENhbiBhbnlvbmUgZXhwbGFp
biB3aGF0IHRoZXNlIGFyZT8KPgo+PiAgYnVpbGQtYW1kNjQteHNtICAgICAgICAgICAgICAgNiB4
ZW4tYnVpbGQgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTM5ODc2Cj4gSSB0YWtlIGl0
IHRoYXQgdGhpcyBpcyBzdXBwb3NlZCB0byBiZSB0YWtlbiBjYXJlIG9mIGJ5IGEzNDI5MDBkNDgK
PiAoInRvb2xzL3NoaW06IEFwcGx5IG1vcmUgZHVjdCB0YXBlIHRvIHRoZSBsaW5rZmFybSBsb2dp
YyIpLgoKWWVzIC0gaXQgc2hvdWxkIGRvLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
