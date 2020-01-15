Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F350F13BCD0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 10:51:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irfGo-0007QL-FH; Wed, 15 Jan 2020 09:47:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eK3x=3E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1irfGm-0007PZ-Nh
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 09:47:24 +0000
X-Inumbo-ID: 0310c992-377c-11ea-a2eb-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0310c992-377c-11ea-a2eb-bc764e2007e4;
 Wed, 15 Jan 2020 09:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579081635;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sqQWDgFEa7VnPIMJ1dHgQmEapgtyXg1PPiD9j1DVXng=;
 b=aqxDOHU6PGQbBwwj5NGOJELlSZHz4iJbjL3how91PtoKBWz9u7Ap68Hc
 vXwtwd3qYgyWAkb8QRTYz/8UCNqPZ1h3g/7D/urYbltHE/f6SPdo4wY4M
 QQlsZx+mWe4BmBGYwqWjNC0CMDarQZSVEqznaMJNcpuhHZEiig2DDuTlJ o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LltgTM1MTIuXy9tkrSWGIfcjc0RjmQjzqR+9uuV4SNf4RNmJUh2jaddeoAJ+kSZhxuhoqgnYqL
 NUalBocl3ywqUc9skCuTOAbfAOkxR2FK5LX+AvrmaYWtcm0RM33Q8W9xq+RFPF42QE1jQ7dtlm
 ZRb7TvjuCVDd0oG3IUw6smUNKgsIrL1erUCZktFJ7XY9TFUu1u9Qxr7zC3rPWhwly690srT+vb
 hqRKyeQbSH3pvZ640cTJzuhPSqO9ukIvm3KZuHxmpu7pmPyF/lNdIqHWSzYkQJ3xyebG8YrT3e
 HKA=
X-SBRS: 2.7
X-MesageID: 11365709
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,322,1574139600"; d="scan'208";a="11365709"
Date: Wed, 15 Jan 2020 10:47:03 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20200115094703.GH11756@Air-de-Roger>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from
 deep C-state
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgMDc6MzY6MjFQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gSWYgSVRTQyBpcyBub3QgYXZhaWxhYmxlIG9uIENQVSAoZS5nIGlmIHJ1bm5pbmcg
bmVzdGVkIGFzIFBWIHNoaW0pCj4gdGhlbiBYODZfRkVBVFVSRV9OT05TVE9QX1RTQyBpcyBub3Qg
YWR2ZXJ0aXNlZCBpbiBjZXJ0YWluIGNhc2VzLCBpLmUuCj4gYWxsIEFNRCBhbmQgc29tZSBvbGQg
SW50ZWwgcHJvY2Vzc29ycy4gSW4gd2hpY2ggY2FzZSBUU0Mgd291bGQgbmVlZCB0bwo+IGJlIHJl
c3RvcmVkIG9uIENQVSBmcm9tIHBsYXRmb3JtIHRpbWUgYnkgWGVuIHVwb24gZXhpdGluZyBkZWVw
IEMtc3RhdGVzLgo+IAo+IEFzIHBsYXRmb3JtIHRpbWUgbWlnaHQgYmUgYmVoaW5kIHRoZSBsYXN0
IFRTQyBzdGFtcCByZWNvcmRlZCBmb3IgdGhlCj4gY3VycmVudCBDUFUsIGludmFyaWFudCBvZiBU
U0Mgc3RhbXAgYmVpbmcgYWx3YXlzIGJlaGluZCBsb2NhbCBUU0MgY291bnRlcgo+IGlzIHZpb2xh
dGVkLiBUaGlzIGhhcyBhbiBlZmZlY3Qgb2YgZ2V0X3NfdGltZSgpIGdvaW5nIG5lZ2F0aXZlIHJl
c3VsdGluZwo+IGluIGV2ZW50dWFsIHN5c3RlbSBoYW5nIG9yIGNyYXNoLgo+IAo+IEZpeCB0aGlz
IGlzc3VlIGJ5IHVwZGF0aW5nIGxvY2FsIFRTQyBzdGFtcCBhbG9uZyB3aXRoIFRTQyBjb3VudGVy
IHdyaXRlLgoKVGhhbmtzISBJIGhhdmVuJ3Qgc2VlbiBzdWNoIGlzc3VlIGJlY2F1c2UgSSd2ZSBi
ZWVuIHJ1bm5pbmcgdGhlIHNoaW0Kd2l0aCBub21pZ3JhdGUgaW4gb3JkZXIgdG8gcHJldmVudCB0
aGUgdlRTQyBvdmVyaGVhZC4KCj4gCj4gU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGln
b3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4gLS0tCj4gVGhpcyBjYXVzZWQgcmVsaWFibGUgaGFu
Z3Mgb2Ygc2hpbSBkb21haW5zIHdpdGggbXVsdGlwbGUgdkNQVXMgb24gYWxsIEFNRAo+IHN5c3Rl
bXMuIFRoZSBwcm9ibGVtIGdvdCBhbHNvIHJlcHJvZHVjZWQgb24gYmFyZS1tZXRhbCBieSBhcnRp
ZmljYWxseQo+IG1hc2tpbmcgSVRTQyBmZWF0dXJlIGJpdC4gVGhlIHByb3Bvc2VkIGZpeCBoYXMg
YmVlbiB2ZXJpZmllZCBmb3IgYm90aAo+IGNhc2VzLgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvdGlt
ZS5jIHwgOCArKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni90aW1lLmMgYi94ZW4vYXJj
aC94ODYvdGltZS5jCj4gaW5kZXggZTc5Y2I0ZC4uZjZiMjZmOCAxMDA2NDQKPiAtLS0gYS94ZW4v
YXJjaC94ODYvdGltZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L3RpbWUuYwo+IEBAIC05NTUsMTAg
Kzk1NSwxNiBAQCB1NjQgc3RpbWUydHNjKHNfdGltZV90IHN0aW1lKQo+ICAKPiAgdm9pZCBjc3Rh
dGVfcmVzdG9yZV90c2Modm9pZCkKPiAgewo+ICsgICAgc3RydWN0IGNwdV90aW1lICp0ID0gJnRo
aXNfY3B1KGNwdV90aW1lKTsKPiArCj4gICAgICBpZiAoIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVS
RV9OT05TVE9QX1RTQykgKQo+ICAgICAgICAgIHJldHVybjsKPiAgCj4gLSAgICB3cml0ZV90c2Mo
c3RpbWUydHNjKHJlYWRfcGxhdGZvcm1fc3RpbWUoTlVMTCkpKTsKPiArICAgIHQtPnN0YW1wLm1h
c3Rlcl9zdGltZSA9IHJlYWRfcGxhdGZvcm1fc3RpbWUoTlVMTCk7Cj4gKyAgICB0LT5zdGFtcC5s
b2NhbF90c2MgPSBzdGltZTJ0c2ModC0+c3RhbXAubWFzdGVyX3N0aW1lKTsKPiArICAgIHQtPnN0
YW1wLmxvY2FsX3N0aW1lID0gdC0+c3RhbXAubWFzdGVyX3N0aW1lOwo+ICsKPiArICAgIHdyaXRl
X3RzYyh0LT5zdGFtcC5sb2NhbF90c2MpOwoKSW4gb3JkZXIgdG8gYXZvaWQgdGhlIFRTQyB3cml0
ZSAoYW5kIHRoZSBsaWtlbHkgYXNzb2NpYXRlZCB2bWV4aXQpLApjb3VsZCB5b3UgaW5zdGVhZCBk
bzoKCnQtPnN0YW1wLmxvY2FsX3N0aW1lID0gdC0+c3RhbXAubWFzdGVyX3N0aW1lID0gcmVhZF9w
bGF0Zm9ybV9zdGltZShOVUxMKTsKdC0+c3RhbXAubG9jYWxfdHNjID0gcmR0c2Nfb3JkZXJlZCgp
OwoKSSB0aGluayBpdCBzaG91bGQgYWNoaWV2ZSB0aGUgc2FtZSBhcyBpdCBzeW5jcyB0aGUgbG9j
YWwgVFNDIHN0YW1wIGFuZAp0aW1lcywgd291bGQgYXZvaWQgdGhlIFRTQyB3cml0ZSBhbmQgc2xp
Z2h0bHkgc2ltcGxpZmllcyB0aGUgbG9naWMuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
