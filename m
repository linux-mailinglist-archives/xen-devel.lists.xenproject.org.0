Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D1018BB5B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 16:43:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jExHk-0005dY-W5; Thu, 19 Mar 2020 15:40:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e0hQ=5E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jExHj-0005dO-JW
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 15:40:39 +0000
X-Inumbo-ID: fb53d3bc-69f7-11ea-bec1-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb53d3bc-69f7-11ea-bec1-bc764e2007e4;
 Thu, 19 Mar 2020 15:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584632439;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+OqTXRnCgMWlxyrIF/CTQEMtB5RA0nhrNAFI/Y4zPOk=;
 b=SfA6muZc/qp3vEVG5EpGK70dwD6sYA2YXAgBySOzkU7J4y4rgLsUuOFx
 Hxs29FydXSQK4RJ8bMaf6BS8izFGwysdMBiqnL1SZyYWA7TwA6amUuh82
 GEA6DHWTfMhMR61Ll16pXnW/CZKe7PkbjeGGHvgUTGGTvo9tmiPhemIiA I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: J1LXgFfnFnBe9C5GbYpGtxLHEyesY91LLYjBwkyyJSTWtijBgA0ln3LcE2ABq+RmijAfc1goyf
 5BpjvQNGFLTx49G/Ey123QVWbhYGRLQUqbnNiPu/FX5p2WUHcZPgMsaF/DultTzLKOE8JiAO2u
 xuKs/nUWOXJbx6hDPwG6kzJlxvUgWVAMidR3qoggAXoQ/+VK74XiCbLoVswFWjZdZ3/dzV4C5q
 SVR7ntYyDsUuAIGi1/tRUPQtjJrm5YmKjQ7eil+V3PKYoguEeYX20UmoTaU7TKBHf8VyvTgLgi
 DP0=
X-SBRS: 2.7
X-MesageID: 14268054
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,572,1574139600"; d="scan'208";a="14268054"
Date: Thu, 19 Mar 2020 16:40:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200319154028.GP24458@Air-de-Roger.citrite.net>
References: <20200303172046.50569-1-roger.pau@citrix.com>
 <20200303172046.50569-7-roger.pau@citrix.com>
 <260013af-2af0-98e1-70d8-087fd8d22a4f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <260013af-2af0-98e1-70d8-087fd8d22a4f@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v6 6/6] x86/tlb: use Xen L0 assisted TLB
 flush when available
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXIgMDYsIDIwMjAgYXQgMTA6MzI6NTVBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDMuMDMuMjAyMCAxODoyMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gVXNl
IFhlbidzIEwwIEhWTU9QX2ZsdXNoX3RsYnMgaHlwZXJjYWxsIGluIG9yZGVyIHRvIHBlcmZvcm0g
Zmx1c2hlcy4KPiA+IFRoaXMgZ3JlYXRseSBpbmNyZWFzZXMgdGhlIHBlcmZvcm1hbmNlIG9mIFRM
QiBmbHVzaGVzIHdoZW4gcnVubmluZwo+ID4gd2l0aCBhIGhpZ2ggYW1vdW50IG9mIHZDUFVzIGFz
IGEgWGVuIGd1ZXN0LCBhbmQgaXMgc3BlY2lhbGx5IGltcG9ydGFudAo+ID4gd2hlbiBydW5uaW5n
IGluIHNoaW0gbW9kZS4KPiA+IAo+ID4gVGhlIGZvbGxvd2luZyBmaWd1cmVzIGFyZSBmcm9tIGEg
UFYgZ3Vlc3QgcnVubmluZyBgbWFrZSAtajMyIHhlbmAgaW4KPiA+IHNoaW0gbW9kZSB3aXRoIDMy
IHZDUFVzIGFuZCBIQVAuCj4gPiAKPiA+IFVzaW5nIHgyQVBJQyBhbmQgQUxMQlVUIHNob3J0aGFu
ZDoKPiA+IHJlYWwJNG0zNS45NzNzCj4gPiB1c2VyCTRtMzUuMTEwcwo+ID4gc3lzCTM2bTI0LjEx
N3MKPiA+IAo+ID4gVXNpbmcgTDAgYXNzaXN0ZWQgZmx1c2g6Cj4gPiByZWFsICAgIDFtMi41OTZz
Cj4gPiB1c2VyICAgIDRtMzQuODE4cwo+ID4gc3lzICAgICA1bTE2LjM3NHMKPiA+IAo+ID4gVGhl
IGltcGxlbWVudGF0aW9uIGFkZHMgYSBuZXcgaG9vayB0byBoeXBlcnZpc29yX29wcyBzbyBvdGhl
cgo+ID4gZW5saWdodGVubWVudHMgY2FuIGFsc28gaW1wbGVtZW50IHN1Y2ggYXNzaXN0ZWQgZmx1
c2gganVzdCBieSBmaWxsaW5nCj4gPiB0aGUgaG9vay4KPiA+IAo+ID4gTm90ZSB0aGF0IHRoZSBY
ZW4gaW1wbGVtZW50YXRpb24gY29tcGxldGVseSBpZ25vcmVzIHRoZSBkaXJ0eSBDUFUgbWFzawo+
ID4gYW5kIHRoZSBsaW5lYXIgYWRkcmVzcyBwYXNzZWQgaW4sIGFuZCBhbHdheXMgcGVyZm9ybXMg
YSBnbG9iYWwgVExCCj4gPiBmbHVzaCBvbiBhbGwgdkNQVXMuIFRoaXMgaXMgYSBsaW1pdGF0aW9u
IG9mIHRoZSBoeXBlcmNhbGwgcHJvdmlkZWQgYnkKPiA+IFhlbi4gQWxzbyBub3RlIHRoYXQgbG9j
YWwgVExCIGZsdXNoZXMgYXJlIG5vdCBwZXJmb3JtZWQgdXNpbmcgdGhlCj4gPiBhc3Npc3RlZCBU
TEIgZmx1c2gsIG9ubHkgcmVtb3RlIG9uZXMuCj4gCj4gQXMgdG8gdGhpcyBsYXN0IHNlbnRlbmNl
IC0gaXNuJ3QgdGhpcyB3YXN0ZWZ1bCBhdCBsZWFzdCB3aGVuIGEKPiBmdWxsIGFkZHJlc3Mgc3Bh
Y2UgZmx1c2ggaXMgYmVpbmcgcHJvY2Vzc2VkIGFueXdheT8KCkxpa2VseSB5ZXMsIGlmIHRoZXJl
IGFyZSBnbG9iYWwgVExCIGZsdXNoZXMgaW4gcGFyYWxsZWwgdG8gbG9jYWwgb25lcy4KQUZBSUNU
IHRoZSBwdXJwb3NlIG9mIHRoZSB0aW1lc3RhbXBlZCBUTEIgaXMgdG8gY29wZSB3aXRoIHNvbWUg
b2YKdGhpcywgYnkgcmVjb3JkaW5nIHRoZSBsYXN0IFRMQiBzdGFtcCBhbmQgYXZvaWRpbmcgZmx1
c2hlcyByZXF1ZXN0ZWQKYmVmb3JlIHRoYXQuIEhlcmUgd2UgaGF2ZSB0byBkaXNhYmxlIHN1Y2gg
dGltZXN0YW1wcywgc2luY2UgdGhlCmZsdXNoIGlzIGRvbmUgb24gdGhlIGJhY2sgb2YgdGhlIHZD
UFUsIGFuZCBoZW5jZSBpdCdzIG5vdCBwb3NzaWJsZSB0bwphY2N1cmF0ZWx5IHJlY29yZCBpdCdz
IHRpbWVzdGFtcC4KCkZyb20gbXkgZGF0YSBhYm92ZSB0aGUgYmVuZWZpdCBvZiB1c2luZyB0aGUg
YXNzaXN0ZWQgVExCIGdyZWF0bHkKb3V0d2VpZ2hzIHRoZSBmYWN0IHRoYXQgdGhlIHRpbWVzdGFt
cGVkIFRMQiBpcyBkaXNhYmxlZC4KCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IFJldmlld2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgo+IAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpU
aGFua3MsIHdpbGwgcmVzZW5kIHRoaXMgbm93LgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
