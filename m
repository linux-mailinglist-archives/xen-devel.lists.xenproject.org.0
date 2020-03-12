Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6EB182E76
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 12:01:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCLYH-0003MS-I8; Thu, 12 Mar 2020 10:58:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=abR8=45=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jCLYF-0003M8-EI
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 10:58:55 +0000
X-Inumbo-ID: 7675d458-6450-11ea-b149-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7675d458-6450-11ea-b149-12813bfff9fa;
 Thu, 12 Mar 2020 10:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584010734;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=enqFHNDfrZvA/5WPCN4cBR6907cmPyGRzbxgIsZVEbg=;
 b=a2Y6AtjkE+vioK0vTGrrNsKWu0eKIbIxvD6Q9b422ha/N4XK7gLxmQMd
 baqzOScqu0iwho+Dfvv7+qVI9nk7hvC6drMKtTcwVUdYRN7pdLKBtGb2l
 vCHQ3vTJF3f9XfoW/PPbHsi8t+abGPeVqcPXXHN2UUcO+IG9QRixfGBC+ U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LUADQnA+lSf2BDxBpiz/XVoVvreE8wM+DmcnS6yRTeO++aG4NneFs8X7taXGcGByEGq4qzt35m
 tP0x2bmfZFcCLEvzdRBM9MvJHwCBlCPLuw1TLP+9rh5jLveY+7HEbwRIHZMuYgW5MOVxzgNHb5
 nDk5RMyg4n55WHrBEMQ5fTR2Rs6dVeNtDJH4pz6qTHEsyE5KieY9OnenPnZM1SGa2UPz0DnpSR
 nzm2isVBOnuabfBvNFI+Av+ksk5c+02kXg+1CmCoiIumCHfhak4pr65OWwg+Nb07sA7lDxbLTV
 7+0=
X-SBRS: 2.7
X-MesageID: 14016264
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,544,1574139600"; d="scan'208";a="14016264"
Date: Thu, 12 Mar 2020 11:58:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200312105846.GH24458@Air-de-Roger.citrite.net>
References: <20200311183455.23729-1-andrew.cooper3@citrix.com>
 <20200312093035.GE24458@Air-de-Roger.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312093035.GE24458@Air-de-Roger.citrite.net>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/vvmx: Fix deadlock with MSR bitmap
 merging
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
 Kevin Tian <kevin.tian@intel.com>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMTA6MzA6MzVBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIE1hciAxMSwgMjAyMCBhdCAwNjozNDo1NVBNICswMDAwLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOgo+ID4gYy9zIGM0Nzk4NGFhYmVhZCAibnZteDogaW1wbGVtZW50IHN1
cHBvcnQgZm9yIE1TUiBiaXRtYXBzIiBpbnRyb2R1Y2VkIGEgdXNlIG9mCj4gPiBtYXBfZG9tYWlu
X3BhZ2UoKSB3aGljaCBtYXkgZ2V0IHVzZWQgaW4gdGhlIG1pZGRsZSBvZiBjb250ZXh0IHN3aXRj
aC4KPiA+IAo+ID4gVGhpcyBpcyBub3Qgc2FmZSwgYW5kIGNhdXNlcyBYZW4gdG8gZGVhZGxvY2sg
b24gdGhlIG1hcGNhY2hlIGxvY2s6Cj4gPiAKPiA+ICAgKFhFTikgWGVuIGNhbGwgdHJhY2U6Cj4g
PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDIyZDZhZT5dIFIgX3NwaW5fbG9jaysweDM0LzB4NWUK
PiA+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMzIxOWQ3Pl0gRiBtYXBfZG9tYWluX3BhZ2UrMHgy
NTAvMHg1MjcKPiA+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMzU2MzMyPl0gRiBkb19wYWdlX2Zh
dWx0KzB4NDIwLzB4NzgwCj4gPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDM4ZGEzZD5dIEYgeDg2
XzY0L2VudHJ5LlMjaGFuZGxlX2V4Y2VwdGlvbl9zYXZlZCsweDY4LzB4OTQKPiA+ICAgKFhFTikg
ICAgWzxmZmZmODJkMDgwMzE3MjlmPl0gRiBfX2ZpbmRfbmV4dF96ZXJvX2JpdCsweDI4LzB4NjkK
PiA+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMzIxYTRkPl0gRiBtYXBfZG9tYWluX3BhZ2UrMHgy
YzYvMHg1MjcKPiA+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMjllZWIyPl0gRiBudm14X3VwZGF0
ZV9leGVjX2NvbnRyb2wrMHgxZDcvMHgzMjMKPiA+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMjk5
ZjVhPl0gRiB2bXhfdXBkYXRlX2NwdV9leGVjX2NvbnRyb2wrMHgyMy8weDQwCj4gPiAgIChYRU4p
ICAgIFs8ZmZmZjgyZDA4MDI5YTNmNz5dIEYgYXJjaC94ODYvaHZtL3ZteC92bXguYyN2bXhfY3R4
dF9zd2l0Y2hfZnJvbSsweGI3LzB4MTIxCj4gPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDMxZDc5
Nj5dIEYgYXJjaC94ODYvZG9tYWluLmMjX19jb250ZXh0X3N3aXRjaCsweDEyNC8weDRhOQo+ID4g
ICAoWEVOKSAgICBbPGZmZmY4MmQwODAzMjA5MjU+XSBGIGNvbnRleHRfc3dpdGNoKzB4MTU0LzB4
NjJjCj4gPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDI1MmYzZT5dIEYgY29tbW9uL3NjaGVkL2Nv
cmUuYyNzY2hlZF9jb250ZXh0X3N3aXRjaCsweDE2YS8weDE3NQo+ID4gICAoWEVOKSAgICBbPGZm
ZmY4MmQwODAyNTM4Nzc+XSBGIGNvbW1vbi9zY2hlZC9jb3JlLmMjc2NoZWR1bGUrMHgyYWQvMHgy
YmMKPiA+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMjJjYzk3Pl0gRiBjb21tb24vc29mdGlycS5j
I19fZG9fc29mdGlycSsweGI3LzB4YzgKPiA+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMjJjZDM4
Pl0gRiBkb19zb2Z0aXJxKzB4MTgvMHgxYQo+ID4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAyYTJm
YmI+XSBGIHZteF9hc21fZG9fdm1lbnRyeSsweDJiLzB4MzAKPiA+IAo+ID4gQ29udmVydCB0aGUg
ZG9taGVhcCBwYWdlIGludG8gYmVpbmcgYSB4ZW5oZWFwIHBhZ2UuCj4gCj4gRml4ZXM6IGM0Nzk4
NGFhYmVhZDUzOTEgKCdudm14OiBpbXBsZW1lbnQgc3VwcG9ydCBmb3IgTVNSIGJpdG1hcHMnKQo+
IAo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KPiA+IC0tLQo+ID4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiA+
IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+ID4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgo+ID4gQ0M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29t
Pgo+ID4gCj4gPiBJIHN1c3BlY3QgdGhpcyBpcyB0aGUgbm90LXF1aXRlLWNvbnNpc3RlbnQtZW5v
dWdoLXRvLWJpc2VjdCBpc3N1ZSB3aGljaAo+ID4gT1NTVGVzdCBpcyBoaXR0aW5nIGFuZCBpbnRl
cmZlcmluZyB3aXRoIHB1c2hlcyB0byBtYXN0ZXIuCj4gPiAtLS0KPiA+ICB4ZW4vYXJjaC94ODYv
aHZtL3ZteC92dm14LmMgICAgICAgIHwgMTkgKysrKy0tLS0tLS0tLS0tLS0tLQo+ID4gIHhlbi9p
bmNsdWRlL2FzbS14ODYvaHZtL3ZteC92dm14LmggfCAgMiArLQo+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXgu
Ywo+ID4gaW5kZXggOTI2YTExYzE1Zi4uZjA0OTkyMDE5NiAxMDA2NDQKPiA+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vdm14L3Z2bXguYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZt
eC5jCj4gPiBAQCAtMTMwLDEyICsxMzAsOSBAQCBpbnQgbnZteF92Y3B1X2luaXRpYWxpc2Uoc3Ry
dWN0IHZjcHUgKnYpCj4gPiAgCj4gPiAgICAgIGlmICggY3B1X2hhc192bXhfbXNyX2JpdG1hcCAp
Cj4gPiAgICAgIHsKPiA+IC0gICAgICAgIG52bXgtPm1zcl9tZXJnZWQgPSBhbGxvY19kb21oZWFw
X3BhZ2UoZCwgTUVNRl9ub19vd25lcik7Cj4gPiArICAgICAgICBudm14LT5tc3JfbWVyZ2VkID0g
YWxsb2NfeGVuaGVhcF9wYWdlKCk7Cj4gCj4gQ291bGQgd2UgYWxzbyB1c2UgX19tYXBfZG9tYWlu
X3BhZ2VfZ2xvYmFsIGhlcmUgKGtlZXBpbmcgdGhlIGRvbWhlYXAKPiBhbGxvY2F0aW9uKSBpbiBv
cmRlciB0byBtYXAgdGhlIHBhZ2Ugb24gaW5pdCBhbmQga2VlcCBpdCBtYXBwZWQgdW50aWwKPiB0
aGUgZG9tYWluIGlzIGRlc3Ryb3llZD8KCkp1c3QgcmVhZCAnbnZteCBkZWFkbG9jayB3aXRoIE1T
UiBiaXRtYXBzJyBub3cgYW5kIHJlYWxpemVkIHRoYXQgeW91Cm1lbnRpb24gdXNpbmcgbWFwX2Rv
bWFpbl9wYWdlX2dsb2JhbCB0aGVyZSBhcyBhbiBvcHRpb24gYWxzbywgc28gSQpndWVzcyB5b3Ug
d2VudCB3aXRoIHRoZSB4ZW5oZWFwIHBhZ2Ugb3B0aW9uIGJlY2F1c2UgaXQgd2FzIHNpbXBsZXIu
CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
