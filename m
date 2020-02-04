Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C291521F8
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 22:32:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz5jm-0007YP-77; Tue, 04 Feb 2020 21:28:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I1tw=3Y=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iz5jk-0007YK-U2
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 21:28:00 +0000
X-Inumbo-ID: 377f1264-4795-11ea-9021-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 377f1264-4795-11ea-9021-12813bfff9fa;
 Tue, 04 Feb 2020 21:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580851680;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Xof2VYDgf86aRjvQ/AbNQJQ1DI+B3jJWvvHeqrVxZ4k=;
 b=E7y8l1h8YvTgoiFtP6jHOdP1Hg+N8U1v2z0tjhHsiXwrswJen8SSQ6qQ
 4JVIV+6OKlE8MmYiMZ5ieoczzJAibIlPZfk1+95plBQk8C3lwE79MPI4x
 IIvTcvqePHypYzDCbuOAtBplOK3VWAcUiOxWKqiY7m0M9DMoJQLtK6sZs A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sL1IoTwmXwhaJuOVjl8LJ2gabGWsj3k01W2Kz/YgVk76PWf/RqZkpZwHIrD4S2NIUj1Jv6H+W/
 KsePHUZR7npDtzJjInytoZfnQD0KVDGI90K2PK7czn8lubYwWdsUW6cB+p4vWMHxavTGqC2nCn
 8L63i/lGerBIhOjkHhKwkeEMbyOEAE8ewZmDMza8NS0NCsKiv8bGuaxATEDjrxW3g7RHvLEZzH
 g4FVM6Cr3B8g7N4ZXq63KLrx0/0Uh+Lx2ojaEktzxXl8L9bWTtvqxFoQIB0n7IPGBJByXdTGoF
 EbU=
X-SBRS: 2.7
X-MesageID: 11953942
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,403,1574139600"; d="scan'208";a="11953942"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1580830825-18767-1-git-send-email-igor.druzhinin@citrix.com>
 <1580830825-18767-3-git-send-email-igor.druzhinin@citrix.com>
 <20200204172851.GN4679@Air-de-Roger>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <96a7682d-a6f5-cea5-5fa6-3a7d75d65506@citrix.com>
Date: Tue, 4 Feb 2020 21:27:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200204172851.GN4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86/time: report correct frequency of
 Xen PV clocksource
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

T24gMDQvMDIvMjAyMCAxNzoyOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEZl
YiAwNCwgMjAyMCBhdCAwMzo0MDoyNVBNICswMDAwLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4g
VGhlIHZhbHVlIG9mIHRoZSBjb3VudGVyIHJlcHJlc2VudHMgdGhlIG51bWJlciBvZiBuYW5vc2Vj
b25kcwo+PiBzaW5jZSBob3N0IGJvb3QuIFRoYXQgbWVhbnMgdGhlIGNvcnJlY3QgZnJlcXVlbmN5
IGlzIGFsd2F5cyAxR0h6Lgo+Pgo+PiBUaGlzIGluY29uc2lzdGVuY3kgY2F1c2VkIHRpbWUgdG8g
Z28gc2xvd2VyIGluIFBWIHNoaW0gb24gbW9zdAo+PiBwbGF0Zm9ybXMuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgo+IAo+IFJl
dmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkFjdHVh
bGx5LCB0aGlzIHBhdGNoIGlzIGJ1Z2d5IGFuZCBjYXVzZXMgYSBzeXN0ZW0gdG8gYWx3YXlzIGRl
dGVjdCAxR0h6CnByb2Nlc3Nvci4gSSdsbCBzZW5kIGEgdjIuCgpJZ29yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
