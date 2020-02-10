Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32706157F81
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 17:13:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Bdn-0007YS-3t; Mon, 10 Feb 2020 16:10:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8uky=36=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j1Bdl-0007YK-2Q
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 16:10:29 +0000
X-Inumbo-ID: da379d76-4c1f-11ea-b472-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da379d76-4c1f-11ea-b472-bc764e2007e4;
 Mon, 10 Feb 2020 16:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581351028;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=bo9oINFD4os8sSS7fB73LCckGH2gnMqgbP2wLorWPFg=;
 b=E86CVfSoQYEAM0KEtUsf0i47k3MZODD99nors3hAbAzUyWquWicTx9k1
 6jdL+bMs4Kc9aEveKa75dkBVAj7TPU2WANYZaT5IimDntC1+IHZ09JoUL
 NvR1Rcqhl9kWSFXxiZ+a9q33IsFwL2fsfh2lpI0mwshSW6rXtEjLd9PPb 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: thNhDMvnS0uNNoBe8ZrgcdHydvPmKVEEa1wz8yfdn1Rvq+cj2iYx9UIr39K0TeoMw5Yenw2ECF
 /bgqqQHKpeLttKaarSh7+wUoURBajD/SxxWDOTGUIjs57XjEIQdNq72wxF2gDPHdABFgCUZsPh
 zwlIf6gJ05FKQvSPgFs7OFfOoaVbAR0mC7RpBYJ1g6IrvSA6+cZquXwQd3DEIsnIytAyxEmlT3
 ls13NoXnPIj859389ntIrBKvHfaVakn9wVpbfNUsDxwihWkclpopSi3kg4dv8M1PeZkO2JCso7
 E1w=
X-SBRS: 2.7
X-MesageID: 12833598
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12833598"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24129.32880.676619.646411@mariner.uk.xensource.com>
Date: Mon, 10 Feb 2020 16:10:24 +0000
To: Christopher Clark <christopher.w.clark@gmail.com>
In-Reply-To: <20200210043516.1996-3-christopher.w.clark@gmail.com>
References: <20200210043516.1996-1-christopher.w.clark@gmail.com>
 <20200210043516.1996-3-christopher.w.clark@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 2/2] python,
 pygrub: pass DISTUTILS env vars as setup.py args
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rich Persaud <persaur@gmail.com>,
 Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hyaXN0b3BoZXIgQ2xhcmsgd3JpdGVzICgiW1BBVENIIDIvMl0gcHl0aG9uLCBweWdydWI6IHBh
c3MgRElTVFVUSUxTIGVudiB2YXJzIGFzIHNldHVwLnB5IGFyZ3MiKToKPiBBbGxvdyB0byByZXNw
ZWN0IHRoZSB0YXJnZXQgaW5zdGFsbCBkaXIgKFBZVEhPTl9TSVRFUEFDS0FHRVNfRElSKQo+IGFz
IHdlbGwgYXMgb3RoZXIgcGFyYW1ldGVycyBzZXQgYnkgdGhlIE9wZW5FbWJlZGRlZCBidWlsZCBz
eXN0ZW0uCj4gVGhpcyBpcyBlc3BlY2lhbGx5IHVzZWZ1bCB3aGVuIHRoZSB0YXJnZXQgbGliZGly
IGlzIG5vdCB0aGUgZGVmYXVsdCBvbmUKPiAoL3Vzci9saWIpLCBidXQgZm9yIGV4YW1wbGUgL3Vz
ci9saWI2NC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYWNpZWogUGlqYW5vd3NraSA8bWFjaWVqLnBp
amFub3dza2lAM21kZWIuY29tPgo+IAo+IFRoaXMgZW5hYmxlcyB0aGUgZGlzdHJvIGJ1aWxkIHN5
c3RlbSB0byBwYXNzIGFkZGl0aW9uYWwgYXJncyB0byB0aGUKPiBweXRob24gc2V0dXAucHkgYnVp
bGQgYW5kIGluc3RhbGwgY29tbWFuZHMuCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xh
cmsgPGNocmlzdG9waGVyLmNsYXJrNkBiYWVzeXN0ZW1zLmNvbT4KClRoYW5rcy4gIFRoZSBvdmVy
YWxsIGlkZWEgaGVyZSBpcyB2ZXJ5IHNvdW5kIGFuZCBJIHdvdWxkIGxpa2UgdG8gdGFrZQp0aGlz
IHBhdGNoIGluIHNvbWUgZm9ybS4gIEJ1dCwgYW5kIEkgaG9wZSB0aGlzIGlzIG5vdCB0b28gYW5u
b3lpbmcsIEkKaGF2ZSBhIGNvdXBsZSBvZiBvYnNlcnZhdGlvbnMvcXVlc3Rpb25zOgoKRmlyc3Rs
eSwgdGhlIGNvbW1pdCBtZXNzYWdlIG1lbnRpb25zIFBZVEhPTl9TSVRFUEFDS0FHRVNfRElSIHdo
aWNoIGlzCmEgdGhpbmcgd2hpY2ggZG9lcyBub3QgYXBwZWFycyBpbiB0aGlzIGNvbW1pdC4gIEFJ
VUkgdGhlIE9wZW5FbWJlZGRlZApidWlsZCBzeXN0ZW0gaG9ub3VycyB0aGF0IGFuZCBpbXBsZW1l
bnRzIGl0IGJ5IHNldHRpbmcKRElTVFVUSUxTX0JVSUxEX0FSR1MgYW5kIERJU1RVVElMU19JTlNU
QUxMX0FSR1MuICBJIHRoaW5rIHRoaXMgbmVlZHMKdG8gYmUgZXhwbGFpbmVkIGNvcnJlY3RseSBp
biB0aGUgY29tbWl0IG1lc3NhZ2UuCgpTZWNvbmRseSwgaXQgYm90aGVycyBtZSB0aGF0IHRoZSBl
bnYgdmFyIG5hbWUgZG9lcyBub3QgbWVudGlvbiBweXRob24KYXQgYWxsLiAgV291bGQgaXQgYmUg
T0sgdG8gY2hhbmdlIGl0IHRvIFBZRElTVFVUSUxTXy4uLiBvciBzb21ldGhpbmcgPwoKVGhhbmtz
LApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
