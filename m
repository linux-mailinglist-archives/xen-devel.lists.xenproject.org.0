Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CEB173B68
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 16:31:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7hYA-0000ju-Vn; Fri, 28 Feb 2020 15:27:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7hY9-0000jp-IQ
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 15:27:37 +0000
X-Inumbo-ID: d8e50ec3-5a3e-11ea-997c-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8e50ec3-5a3e-11ea-997c-12813bfff9fa;
 Fri, 28 Feb 2020 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582903656;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=puf6xT1D1+iq2ZviF6e5jHonwOZ90xKwn4Xp10ZpfNA=;
 b=d+ExCyzGH3CC87tRh8+fOfLLVzw1sGadDVQh/2svrfo6qE8ydQXjOOXc
 RuTS/Dm0LJrzwoEZf8ckl1IqSii7nufrs7blODzVPPvMJ2oqZJGKCGw03
 mb+EvzR1cnq198jLyjrzqDjnDRG8zTX8KCLXpwKY/GPxgGM+7Aehljxe7 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5P6BI2LpZBD9Zx9sFPOZCO8j8z1JK/8VgmzBoeqCuizW2i6NiIst5ahgJVaC7kllpmvxiYA90Z
 pmKatd5+jZxmMC9IeGAVZs7QWLAh8J1kmxkjjaC8OrtMV9DmfowCyPS700ns2UVjKoR3Iy2cwK
 VQlO4/Xk+SO+YMTuvfzJJW/VSzgwURxUcJwLnXZzSxsBsaWLIQsK/Om5s5oOqiHzNGqiO5fI83
 jA1LktT1ofXkbuSopXAoly7t/aJIPRAoR6AdTOZwCRTGlA8ZlOBTmNt7w0FdP351HA467f/VGj
 Q84=
X-SBRS: 2.7
X-MesageID: 13802755
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,496,1574139600"; d="scan'208";a="13802755"
Date: Fri, 28 Feb 2020 16:27:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200228152728.GA24458@Air-de-Roger.citrite.net>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-2-roger.pau@citrix.com>
 <7df3df82-c6c3-37ab-3123-cd2894268b4d@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7df3df82-c6c3-37ab-3123-cd2894268b4d@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 1/7] x86/hvm: allow ASID flush when v !=
 current
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

T24gRnJpLCBGZWIgMjgsIDIwMjAgYXQgMDI6Mjk6MDlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTkuMDIuMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gQ3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiBvZiBodm1fYXNpZF9mbHVzaF92Y3B1IGlzIG5vdCBzYWZlIHRv
IHVzZQo+ID4gdW5sZXNzIHRoZSB0YXJnZXQgdkNQVSBpcyBlaXRoZXIgcGF1c2VkIG9yIHRoZSBj
dXJyZW50bHkgcnVubmluZyBvbmUsCj4gPiBhcyBpdCBtb2RpZmllcyB0aGUgZ2VuZXJhdGlvbiB3
aXRob3V0IGFueSBsb2NraW5nLgo+IAo+IEluZGVlZCwgYnV0IHRoZSBpc3N1ZSB5b3UncmUgdGFr
aW5nIGNhcmUgb2YgaXMgaGlnaGx5IHRoZW9yZXRpY2FsOgo+IEkgZG9uJ3QgdGhpbmsgYW55IHNh
bmUgY29tcGlsZXIgd2lsbCBzcGxpdCB3cml0ZXMgb2YgdGhlIGZpZWxkcwo+IHRvIG11bHRpcGxl
IGluc25zLiBJdCB3b3VsZCBiZSBuaWNlIGlmIHRoaXMgd2FzIG1hZGUgY2xlYXIgaGVyZS4KCldo
YXQgYWJvdXQgYWRkaW5nOgoKPiA+IEZpeCB0aGlzIGJ5IHVzaW5nIGF0b21pYyBvcGVyYXRpb25z
IHdoZW4gYWNjZXNzaW5nIHRoZSBnZW5lcmF0aW9uCj4gPiBmaWVsZCwgYm90aCBpbiBodm1fYXNp
ZF9mbHVzaF92Y3B1X2FzaWQgYW5kIG90aGVyIEFTSUQgZnVuY3Rpb25zLiBUaGlzCj4gPiBhbGxv
d3MgdG8gc2FmZWx5IGZsdXNoIHRoZSBjdXJyZW50IEFTSUQgZ2VuZXJhdGlvbi4gTm90ZSB0aGF0
IGZvciB0aGUKPiA+IGZsdXNoIHRvIHRha2UgZWZmZWN0IGlmIHRoZSB2Q1BVIGlzIGN1cnJlbnRs
eSBydW5uaW5nIGEgdm1leGl0IGlzCj4gPiByZXF1aXJlZC4KCiJNb3N0IGNvbXBpbGVycyB3aWxs
IGFscmVhZHkgZG8gc3VjaCB3cml0ZXMgYW5kIHJlYWRzIGFzIGEgc2luZ2xlCmluc3RydWN0aW9u
LCBzbyB0aGUgdXNhZ2Ugb2YgYXRvbWljIG9wZXJhdGlvbnMgaXMgbW9zdGx5IHVzZWQgYXMgYQpz
YWZldHkgbWVhc3VyZS4iCgpIZXJlPwoKPiA+IE5vdGUgdGhlIHNhbWUgY291bGQgYmUgYWNoaWV2
ZWQgYnkgaW50cm9kdWNpbmcgYW4gZXh0cmEgZmllbGQgdG8KPiA+IGh2bV92Y3B1X2FzaWQgdGhh
dCBzaWduYWxzIGh2bV9hc2lkX2hhbmRsZV92bWVudGVyIHRoZSBuZWVkIHRvIGNhbGwKPiA+IGh2
bV9hc2lkX2ZsdXNoX3ZjcHUgb24gdGhlIGdpdmVuIHZDUFUgYmVmb3JlIHZtZW50cnksIHRoaXMg
aG93ZXZlcgo+ID4gc2VlbXMgdW5uZWNlc3NhcnkgYXMgaHZtX2FzaWRfZmx1c2hfdmNwdSBpdHNl
bGYgb25seSBzZXRzIHR3byB2Q1BVCj4gPiBmaWVsZHMgdG8gMCwgc28gdGhlcmUncyBubyBuZWVk
IHRvIGRlbGF5IHRoaXMgdG8gdGhlIHZtZW50cnkgQVNJRAo+ID4gaGVscGVyLgo+ID4gCj4gPiBU
aGlzIGlzIG5vdCBhIGJ1Z2ZpeCBhcyBubyBjYWxsZXJzIHRoYXQgd291bGQgdmlvbGF0ZSB0aGUg
YXNzdW1wdGlvbnMKPiA+IGxpc3RlZCBpbiB0aGUgZmlyc3QgcGFyYWdyYXBoIGhhdmUgYmVlbiBm
b3VuZCwgYnV0IGEgcHJlcGFyYXRvcnkKPiA+IGNoYW5nZSBpbiBvcmRlciB0byBhbGxvdyByZW1v
dGUgZmx1c2hpbmcgb2YgSFZNIHZDUFVzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IFJldmlld2VkLWJ5OiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgo+IAo+IFdpdGggYSBzdWl0YWJsZSBjbGFyaWZpY2F0aW9uIGFkZGVkCj4g
QWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRoYW5rcywgUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
