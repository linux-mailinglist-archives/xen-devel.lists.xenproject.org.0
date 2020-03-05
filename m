Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E9E17AA7C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 17:28:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9tIr-0004qL-25; Thu, 05 Mar 2020 16:24:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ek+B=4W=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j9tIp-0004qG-G3
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 16:24:51 +0000
X-Inumbo-ID: d3a4fddd-5efd-11ea-a616-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3a4fddd-5efd-11ea-a616-12813bfff9fa;
 Thu, 05 Mar 2020 16:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583425486;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=GbmlVqVBlIwJ7/ARmxORs3D0/y0FT181Lwt0AIWBYbg=;
 b=Zu2nHFn3r52yr4pNVp2hm21LKNXJnDpQbHD8/QxBQ7aJubNUf0xFuVut
 li+rHN/VfV4IGw12LtUbxIhTryfYPnl4YoxeJan+C7eNPe4Bv0puGcv/o
 mFnVa+FVUYxYjzRLl0ADzdNqoRWeE+7Nggs6WSfRacWDuGGVQQlNIV6ZO U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: T8GwQ1RULyNHYn5DQoay7qDH3nvA9VMfQkVxCaWlvJpjKaLhMq8lmkLLMJQfC5WPodDTmUmS1S
 aySlieDglYDx3Av+snLCHmlNn2fbhRSo4yF7oBVsSjYoJRDxIvj9ddiizzdZC2L4cOT3e5pbkb
 BZDpGztjcpW5uiw2Gd+w+jX97qy0jZNM6ich4dwIsEijaIRWAvyHm4e0n+3fUvMwE5TzKX302n
 FoyE3HnhmA7iVifUaPrJD0vbgvTsMKcYIUP/G1LSqFizOfxiqDZaiBpPvwSmLLkxIfYm7Q0rZB
 vAg=
X-SBRS: 2.7
X-MesageID: 13901130
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,518,1574139600"; d="scan'208";a="13901130"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24161.10156.858608.199136@mariner.uk.xensource.com>
Date: Thu, 5 Mar 2020 16:24:12 +0000
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <cea79256-f260-1710-a783-dadec276e32a@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-8-andrew.cooper3@citrix.com>
 <24148.2202.912512.939428@mariner.uk.xensource.com>
 <cea79256-f260-1710-a783-dadec276e32a@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 07/17] libxc/restore: STATIC_DATA_END
 inference for v2 compatibility
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1BBVENIIHYyIDA3LzE3XSBsaWJ4Yy9yZXN0b3Jl
OiBTVEFUSUNfREFUQV9FTkQgaW5mZXJlbmNlIGZvciB2MiBjb21wYXRpYmlsaXR5Iik6Cj4gT24g
MjQvMDIvMjAyMCAxNzozMiwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiBUaGVzZSAxNyBsaW5lcyBh
cHBlYXJzIHR3aWNlLCBpbiBiYXNpY2FsbHkgaWRlbnRpY2FsIGZvcm0uICBDb3VsZCBpdAo+ID4g
YmUgcmVmYWN0b3JlZCA/Cj4gCj4gTm90IHJlYWxseSwgbm8uCj4gCj4gVGhlIGVycm9yIGhhbmRs
aW5nIChpLmUuIGhhbGYgb2YgdGhvc2UgMTcgbGluZXMpIGlzIGRpZmZlcmVudCwgbWFraW5nIGl0
Cj4gc29tZXdoYXQgYXdrd2FyZCB0byBmaXQgaW50byBhIHN0YXRpYyBpbmxpbmUuCgpZb3UgY291
bGQgaGFuZGxlIHRoYXQgd2l0aCBhIHNtYWxsIGJpdCBvZiBjb2RlIGFyb3VuZCBvbmUgb2YgdGhl
IGNhbGwKc2l0ZXMgdG8gYWRqdXN0IHRoZSBlcnJvciBoYW5kbGluZy4gIChBbHNvLCB3aGF0IGEg
bWVzcywgYnV0IEkgZ3Vlc3MKd2UncmUgaGVyZSBub3cuLi4pCgo+IE1vcmUgaW1wb3J0YW50bHkg
aG93ZXZlciwgYnkgZGVzaWduLCBjb21tb24gY29kZSBjYW4ndCBjYWxsCj4gYXJjaC1zcGVjaWZp
YyBjb2RlIHdpdGhvdXQgYSByZXN0b3JlX29wcyBob29rLsKgIERlZHVwaW5nIHRoZXNlIHdvdWxk
Cj4gcmVxdWlyZSBicmVha2luZyB0aGUgcmVzdHJpY3Rpb24gd2hpY2ggaXMgY3VycmVudGx5IGRv
aW5nIGEgZGVjZW50IGpvYgo+IG9mIGtlZXBpbmcgeDg2LWlzbXMgb3V0IG9mIGNvbW1vbiBjb2Rl
LgoKSSdtIGFmcmFpZCB5b3UncmUgZ29pbmcgdG8gaGF2ZSB0byBleHBsYWluIHRoYXQgdG8gbWUg
YXQgYSBiaXQgZ3JlYXRlcgpsZW5ndGguICBUaGUgYmlnZ2VzdCB0aGluZyB0aGF0IGlzIGNvbmZ1
c2luZyBtZSBhYm91dCB5b3VyIHN0YXRlbWVudApoZXJlIGlzIHRoYXQgeW91ciBwYXRjaCBpcyBp
bmRlZWQgYWRkaW5nIHg4Ni1zcGVjaWZpYyBjb2RlIHRvIGEgY29tbW9uCmZpbGUuICBCdXQgYWxz
byBJIGRvbid0IHVuZGVyc3RhbmQgdGhlIGNvbW1lbnQgYWJvdXQgcmVzdG9yZV9vcHMKaG9va3Mg
LSBkbyB5b3UgbWVhbiBzb21ldGhpbmcgaW4gcmVzdG9yZV9jYWxsYmFja3MgPwoKVGhhbmtzLApJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
