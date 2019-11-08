Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75A6F4454
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 11:19:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT1LL-0002ua-6i; Fri, 08 Nov 2019 10:18:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5eKS=ZA=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iT1LJ-0002uU-DO
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 10:18:13 +0000
X-Inumbo-ID: 11271ba8-0211-11ea-a1d4-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11271ba8-0211-11ea-a1d4-12813bfff9fa;
 Fri, 08 Nov 2019 10:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573208291;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=MrAqL3hqz4E1/6x/dE0Ocqr+tFyiLL1LZKViS+yjIoo=;
 b=gbZuK7EY9lDCuMKZTKWbFn4s8KcWv1r3QmQ6rZw2e1/kP12bTIcv+aH4
 ZUwvBC21qfvOkxB4rlFkcO0O9+/HkMm/xLQ0k0W567aE4N4Gqx9wmvt+8
 Els+hsFb0LhNnEfqnti6su+DVLjXW4BiKFlZRENyjTg4zeiaVcItREDB3 k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dYVkybiPLoBOtHaHU+WLebD+qtUH/k5SPFETGMPC3YORLXlI6b/ZxXxtc5eWOzVpR1iSoeUOvl
 ohS80uYJ3/jfgqvQ6xr/70ormFJB34PDBs8SZGcZe+g6nD3KZiNhdPUYFuLZjx0PI98vTxO2ma
 eKSZncYIawL9+Bdrqifjukjf5DAltRZNgI8GoYA49DMh/GYC2VvSkECezuL9oXwhDndwkbMyeN
 r7NxPmS3Dn/i9QDOzXHauGMD27Vz6vcJcyMf4nOKsZ0falzSQEEimwYRghxZCTcHneztAY9LOY
 dLk=
X-SBRS: 2.7
X-MesageID: 8403008
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,281,1569297600"; 
   d="scan'208";a="8403008"
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
References: <20191105194317.16232-1-andrew.cooper3@citrix.com>
 <20191105194317.16232-3-andrew.cooper3@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <49464527-df13-3eaf-f439-ef7417a23da8@citrix.com>
Date: Fri, 8 Nov 2019 10:18:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191105194317.16232-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86/livepatch: Prevent patching with
 active waitqueues
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvNS8xOSA3OjQzIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IFRoZSBzYWZldHkgb2Yg
bGl2ZXBhdGNoaW5nIGRlcGVuZHMgb24gZXZlcnkgc3RhY2sgaGF2aW5nIGJlZW4gdW53b3VuZCwg
YnV0Cj4gdGhlcmUgaXMgb25lIGNvcm5lciBjYXNlIHdoZXJlIHRoaXMgaXMgbm90IHRydWUuICBU
aGUgU2hhcmluZy9QYWdpbmcvTW9uaXRvcgo+IGluZnJhc3RydWN0dXJlIG1heSB1c2Ugd2FpdHF1
ZXVlcywgd2hpY2ggY29weSB0aGUgc3RhY2sgZnJhbWUgc2lkZXdheXMgYW5kCj4gbG9uZ2ptcCgp
IHRvIGEgZGlmZmVyZW50IHZjcHUuCj4gCj4gVGhpcyBjYXNlIGlzIHJhcmUsIGFuZCBjYW4gYmUg
d29ya2VkIGFyb3VuZCBieSBwYXVzaW5nIHRoZSBvZmZlbmRpbmcKPiBkb21haW4ocyksIHdhaXRp
bmcgZm9yIHRoZWlyIHJpbmdzIHRvIGRyYWluLCB0aGVuIHBlcmZvcm1pbmcgYSBsaXZlcGF0Y2gu
Cj4gCj4gSW4gdGhlIGNhc2UgdGhhdCB0aGVyZSBpcyBhbiBhY3RpdmUgd2FpdHF1ZXVlLCBmYWls
IHRoZSBsaXZlcGF0Y2ggYXR0ZW1wdCB3aXRoCj4gLUVCVVNZLCB3aGljaCBpcyBwcmVmb3JhYmxl
IHRvIHRoZSBmaXJld29ya3Mgd2hpY2ggb2NjdXIgZnJvbSB0cnlpbmcgdG8gdW53aW5kCj4gdGhl
IG9sZCBzdGFjayBmcmFtZSBhdCBhIGxhdGVyIHBvaW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBSb3Nz
IExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
