Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C28DF176070
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 17:53:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8oGh-0001Ed-V7; Mon, 02 Mar 2020 16:50:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1vPy=4T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j8oGg-0001EU-IL
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 16:50:10 +0000
X-Inumbo-ID: e052ebd4-5ca5-11ea-8616-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e052ebd4-5ca5-11ea-8616-bc764e2007e4;
 Mon, 02 Mar 2020 16:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583167810;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=e7xVANgHSaIoG9Atdf/r/L/j9/Cc/jMIGffySDYd/ok=;
 b=E6TwtHePWtD+RoF+8XEn0I26+AsygrUZelakB5JCcyDI5NhSY9+Ec5J3
 uqTy9tgjTMZm34o6HbgabiG1ulVBSPmI1XrXf/4cKhQ25/AdMfi38MUj6
 oxnzsdV0L9SI9ykS0/Mmr9VDXkWS4WYT2mr1ElukUGSGFWPav4EOSBizu Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zqowGZ++50zlvSkCZ9OvKmIqYcgZaFi6JzQy3kbXUNeDPcLB4WPQibZuUcOorJFYokihs5kDNk
 GDLP+YYoEbuZwE76pNLJzLh5ZIp5Flj7fNoKCO0CY0BAE7szSyjlVN9Dj13CTRI7XXuQsceiNt
 sOnlT110jb4zVp3ls4z2EGGZrnneEs/wKuwNi+q8rKtzWcC0iDxvP3ci4t5XQdBh18rEugZYQh
 b3MwvGeKZEM/3aq+1/Ic0qI0vbXNp9d5X4/0RpEnJYOsZqSRWyDyKnCvvLwnw2uXoBsgqPJYsI
 EPA=
X-SBRS: 2.7
X-MesageID: 13288131
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,507,1574139600"; d="scan'208";a="13288131"
Date: Mon, 2 Mar 2020 17:50:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200302165001.GM24458@Air-de-Roger.citrite.net>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-5-roger.pau@citrix.com>
 <cdb97977-2bae-5067-623d-76409fa643a2@suse.com>
 <20200228165048.GE24458@Air-de-Roger.citrite.net>
 <c81eb9d7-56f8-47aa-8551-da971b7d7c75@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c81eb9d7-56f8-47aa-8551-da971b7d7c75@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 4/7] x86/tlb: introduce a flush guests
 TLB flag
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Tim Deegan <tim@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXIgMDIsIDIwMjAgYXQgMTE6MzE6MjNBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMDIuMjAyMCAxNzo1MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgRmViIDI4LCAyMDIwIGF0IDA1OjE0OjA1UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDE5LjAyLjIwMjAgMTg6NDMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4g
VGhpcyB3YXMgcHJldmlvdXNseSB1bmNvbmRpdGlvbmFsbHkgZG9uZSBpbiBlYWNoIHByZV9mbHVz
aCBjYWxsLCBidXQKPiA+Pj4gdGhhdCdzIG5vdCByZXF1aXJlZDogSFZNIGd1ZXN0cyBub3QgdXNp
bmcgc2hhZG93IGRvbid0IHJlcXVpcmUgbGluZWFyCj4gPj4+IFRMQiBmbHVzaGVzIGFzIFhlbiBk
b2Vzbid0IG1vZGlmeSB0aGUgZ3Vlc3QgcGFnZSB0YWJsZXMgaW4gdGhhdCBjYXNlCj4gPj4+IChp
ZTogd2hlbiB1c2luZyBIQVApLgo+ID4+Cj4gPj4gVGhpcyBleHBsYWlucyB0aGUgY29ycmVjdG5l
c3MgaW4gb25lIGRpcmVjdGlvbi4gV2hhdCBhYm91dCB0aGUKPiA+PiByZW1vdmFsIG9mIHRoaXMg
ZnJvbSB0aGUgc3dpdGNoX2NyM19jcjQoKSBwYXRoPwo+ID4gCj4gPiBBRkFJQ1QgdGhhdCdzIG5l
dmVyIHVzZWQgYnkgc2hhZG93IGNvZGUgdG8gbW9kaWZ5IGNyMyBvciBjcjQsIGFuZAo+ID4gaGVu
Y2UgZG9lc24ndCByZXF1aXJlIGEgZ3Vlc3QgbGluZWFyIFRMQiBmbHVzaC4KPiAKPiBYU0EtMjk0
IHRlbGxzIG1lIHRvIGJlIHZlcnkgY29uc2VydmF0aXZlIGhlcmUuIEl0IGlzIG5vdCBuZWNlc3Nh
cmlseQo+IHRoZSBkaXJlY3QgdXNlIGJ5IHNoYWRvdyBjb2RlIHRoYXQgbWF0dGVyczsgdG9nZ2xl
X2d1ZXN0XyooKSBpc24ndAo+IHVzZWQgZGlyZWN0bHkgYnkgaXQsIGVpdGhlci4KCnRvZ2dsZV9n
dWVzdF97bW9kZS9wdH0gc2VlbXMgdG8gYmUgZXhjbHVzaXZlbHkgdXNlZCBieSBQViBndWVzdHMu
IEknbQpmaW5lIHdpdGggYWRkaW5nIGV4dHJhIGZsdXNoZXMgdG8gYmUgb24gdGhlIHNhZmUgc2lk
ZSwgYnV0IHRob3NlCmZ1bmN0aW9ucyBhcmUgbmV2ZXIgdXNlZCBhZ2FpbnN0IGEgSFZNIGd1ZXN0
IEFGQUlDVC4gVGhlIG9ubHkgcmVhc29uCnRvIGZsdXNoIGEgSFZNIGd1ZXN0ICdpbnRlcm5hbCcg
VExCIGlzIHdoZW4gdXNpbmcgc2hhZG93LCBhbmQgaW4gdGhhdApjYXNlIHRoZSBzaGFkb3cgY29k
ZSBtdXN0IGFscmVhZHkgdGFrZSBjYXJlIG9mIGlzc3Vpbmcgc3VjaCBmbHVzaGVzLgoKPiA+PiBJ
IGFkbWl0IHRoZSBuYW1lcyBvZiB0aGUgaW52b2x2ZWQgZnVuY3Rpb25zCj4gPj4gKGh2bV9mbHVz
aF9ndWVzdF90bGJzKCksIGh2bV9hc2lkX2ZsdXNoX2NvcmUoKSkgYXJlIHNvbWV3aGF0Cj4gPj4g
bWlzbGVhZGluZywgYXMgdGhleSBkb24ndCBhY3R1YWxseSBkbyBhbnkgZmx1c2hpbmcsIHRoZXkg
bWVyZWx5Cj4gPj4gYXJyYW5nZSBmb3Igd2hhdCBpcyBpbiB0aGUgVExCIHRvIG5vIGxvbmdlciBi
ZSBhYmxlIHRvIGJlIHVzZWQsCj4gPj4gc28gZ2l2aW5nIHRoaXMgYSBzdWl0YWJsZSBuYW1lIGlz
ICJoaXN0b3JpY2FsbHkiIGNvbXBsaWNhdGVkLgo+ID4+IFdoYXQgaWYgd2UgZGlkIGF3YXkgd2l0
aCB0aGUgaHZtX2ZsdXNoX2d1ZXN0X3RsYnMoKSB3cmFwcGVyLAo+ID4+IG5hbWluZyB0aGUgY29u
c3RhbnQgaGVyZSB0aGVuIGFmdGVyIGh2bV9hc2lkX2ZsdXNoX2NvcmUoKSwgZS5nLgo+ID4+IEZM
VVNIX0FTSURfQ09SRT8KPiA+IAo+ID4gSSdtIG5vdCBvcHBvc2VkIHRvIHJlbmFtaW5nLiBUaGUg
Y29tbWVudCBiZWZvcmUgdGhlIGRlZmluaXRpb24gd2FzCj4gPiBhbHNvIG1lYW50IHRvIGNsYXJp
ZnkgaXQncyB1c2FnZSwgYW5kIGhlbmNlIHRoZSBleHBsaWNpdCBtZW50aW9uIG9mCj4gPiBBU0lE
L1ZQSUQuCj4gCj4gLi4uIHRoZXJlJ3MgYWxzbyBvbmUgbW9yZSBhcmd1bWVudCBmb3IgcmVuYW1p
bmc6IFRoZSBwcmVzZW50Cj4gbmFtZSBkb2Vzbid0IGNvbnZleSBhdCBhbGwgdGhhdCB0aGlzIG9w
ZXJhdGlvbiBpcyBIVk0tb25seQo+IChpLmUuIFBWIGd1ZXN0cyB3b3VsZG4ndCBoYXZlIHRoZWly
IFRMQnMgW2FzIGZhciBhcyBvbmUgY2FuCj4gY2FsbCB0aGVtICJ0aGVpciJdIGZsdXNoZWQpLgoK
RG8geW91IHRoaW5rIEZMVVNIX0FTSURfQ09SRSBpcyBjbGVhciBlbm91Z2gsIG9yIHdvdWxkIHlv
dSBwcmVmZXIKRkxVU0hfSFZNX0FTSURfQ09SRT8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
