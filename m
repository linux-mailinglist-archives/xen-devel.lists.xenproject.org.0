Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D257B16252E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 12:03:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j40bf-0006SR-GK; Tue, 18 Feb 2020 10:59:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NVht=4G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j40be-0006SI-HK
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 10:59:58 +0000
X-Inumbo-ID: cca1db08-523d-11ea-b0fd-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cca1db08-523d-11ea-b0fd-bc764e2007e4;
 Tue, 18 Feb 2020 10:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582023597;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Q1BOVrCShT77daPAnKeJkvFw/ptFHeUU9Htvz+7zi1s=;
 b=MC6hao1ltgJwT1cDh7sUOPqS2CRnNRRNgO24LsHBsNhjYbv7nXwsesqH
 2GY/nRFz2WuscrJBlmAQ0rTLvpq9+r2xEXvGoKfUn/difnXdofYoArrXD
 F8NKofS8RrkwFD1gxkNk4OCRcKGpGCxsFMMeMXJ66qFIjFqQCqBuPx7yE s=;
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
IronPort-SDR: MQFNcqgMzS1Mzd4FYo7EwqumUPFB0p3fRbGvt/UAO5ui8Tt0ZjX1UFoyHO4nJ/fYO17kJXHIrr
 Oq19adg8yZdUR41aSizSKKCG4oDWwItG49kOUlWNvaFTv384jMU056Bq59WFAETE8sABRoWNSo
 exdSqXZhMWbaF+wlDjhumoVfxD3f2/Pbtui0OQzQHZiNK3QqNBKiMVXV+QNiIs0pcbQXMJXgmU
 fzWAmAuYFF/+phTXKnZZrEVuVxEUjeMv3Sl2QFAvuL6BvN+LQ2Xq38gxjz4tFaXAzBaEGOhulK
 d+0=
X-SBRS: 2.7
X-MesageID: 12784777
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="12784777"
Date: Tue, 18 Feb 2020 11:59:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200218105949.GR4679@Air-de-Roger>
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <20200217184324.73762-5-roger.pau@citrix.com>
 <49a2df52-27fc-c6f2-f28c-03e913fb0331@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49a2df52-27fc-c6f2-f28c-03e913fb0331@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 4/6] x86: track when in #NMI context
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
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMTA6NDA6MDJBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNy8wMi8yMDIwIDE4OjQzLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBB
ZGQgaGVscGVycyB0byB0cmFjayB3aGVuIHJ1bm5pbmcgaW4gI01DIGNvbnRleHQuIFRoaXMgaXMg
bW9kZWxlZAo+ID4gYWZ0ZXIgdGhlIGluX2lycSBoZWxwZXJzLCBidXQgZG9lcyBub3Qgc3VwcG9y
dCByZWVudHJ5Lgo+ID4KPiA+IE5vdGUgdGhhdCB0aGVyZSBhcmUgbm8gdXNlcnMgb2YgaW5fbWMo
KSBpbnRyb2R1Y2VkIGJ5IHRoZSBjaGFuZ2UsCj4gPiBmdXJ0aGVyIHVzZXJzIHdpbGwgYmUgYWRk
ZWQgYnkgZm9sbG93dXAgY2hhbmdlcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBZb3UgcHJvYmFibHkgbWVhbiBzL21j
L25taS8gdGhyb3VnaG91dCB0aGUgY29tbWl0IG1lc3NhZ2UsIGJ1dCBJJ20KPiBhZnJhaWQgdGhl
c2UgYXJlIHJhdGhlciBwcm9ibGVtYXRpYy4KCkVyLCB5ZXMsIHNvcnJ5LCBjJnAgZnJvbSB0aGUg
cHJldmlvdXMgY29tbWl0IGFuZCBJIGZhaWxlZCB0byBhZGp1c3QKaXQuCgo+IAo+IE5NSXMgY2Fu
IGJlIHJlY3Vyc2l2ZWx5IGVudGVyZWQsIGVzcGVjaWFsbHkgb24gY29ybmVyIGNhc2VzIGluIHRo
ZSBjcmFzaAo+IHBhdGguwqAgQXNzZXJ0aW5nIHRoYXQgdGhlIGNyYXNoIHBhdGggaXMgbm90IHJl
Y3Vyc2l2ZSBjYW4gbGVhZCB0byBuZXZlcgo+IGVudGVyaW5nIHRoZSBjcmFzaCBrZXJuZWwuCgpJ
cyB0aGlzIHNwZWNpZmljIHRvIGhvdyBYZW4gaGFuZGxlcyAjTk1JPwoKSW50ZWwgU0RNIHN0YXRl
cyB0aGF0ICNOTUkgaXMgbm90IHJlZW50cmFudCwgYXMgZnVydGhlciAjTk1JcyBhcmUKYmxvY2tl
ZCB1bnRpbCB0aGUgZXhlY3V0aW9uIG9mIHRoZSBpcmV0IGluc3RydWN0aW9uOgoKIldoaWxlIGFu
IE5NSSBpbnRlcnJ1cHQgaGFuZGxlciBpcyBleGVjdXRpbmcsIHRoZSBwcm9jZXNzb3IgYmxvY2tz
CmRlbGl2ZXJ5IG9mIHN1YnNlcXVlbnQgTk1JcyB1bnRpbCB0aGUgbmV4dCBleGVjdS0gdGlvbiBv
ZiB0aGUgSVJFVAppbnN0cnVjdGlvbi4gVGhpcyBibG9ja2luZyBvZiBOTUlzIHByZXZlbnRzIG5l
c3RlZCBleGVjdXRpb24gb2YgdGhlCk5NSSBoYW5kbGVyLiBJdCBpcyByZWNvbW1lbmRlZCB0aGF0
IHRoZSBOTUkgaW50ZXJydXB0IGhhbmRsZXIgYmUKYWNjZXNzZWQgdGhyb3VnaCBhbiBpbnRlcnJ1
cHQgZ2F0ZSB0byBkaXNhYmxlIG1hc2thYmxlIGhhcmR3YXJlCmludGVycnVwdHMgKHNlZSBTZWN0
aW9uIDYuOC4xLCDigJxNYXNraW5nIE1hc2thYmxlIEhhcmR3YXJlCkludGVycnVwdHPigJ0pLiIK
CkFGQUlDVCB0aGVyZSdzIG5vIGlyZXQgaW4gZG9fbm1pIHVudGlsIGl0IGhhcyBmaW5pc2hlZCBl
eGVjdXRpb24uCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
