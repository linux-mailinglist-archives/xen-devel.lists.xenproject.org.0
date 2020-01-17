Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9283A140CA5
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:36:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isShI-0002DX-7D; Fri, 17 Jan 2020 14:34:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zPxh=3G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isShG-0002DO-4p
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:34:02 +0000
X-Inumbo-ID: 6607fe10-3936-11ea-b544-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6607fe10-3936-11ea-b544-12813bfff9fa;
 Fri, 17 Jan 2020 14:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579271640;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=rh12PyJmnGACRwQGWxQgppMChjXdVtuFyNVllHnfTxo=;
 b=bPR9mylI2O50nywi2oQljVmNYjd5EvL1jZri3pe0I+gGfvS7zRLepHgV
 mgqDg6v/sh5t/1j5YOSgsIqeS8PQs7elOf5k/a4GdW8Vk5hjxw917Nkn3
 YMngTu+c9AZAinERfc0H3ZSMATtCR6xA1N3xt0EndDTGVU8qw+ul0lcTs 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jNinpCTOP5wY6TiTJU2N/Mb2p2eQ3+G1p1U3Oz1euZTu7KOWOo8+JvN7Y1K8kFNx4S2oSovzO5
 i10xBhc4T6L9F4L/TyhO7EpMTrgzXta/I8HU0NKFQ8Cvte4HNWlhTb2nHVbMRwzC6zYo19iNvG
 yG+zXnyoJBs+amdNTnRE71kxYgrGR1Jx6UFTG3vKtA8sRSCyLSVoi/xSrIUxyKIwzXYkacslRn
 OTDAVj9X5KjVyPmsWJBIB5FU2p6PgBxtEOH0OC15h6ck0Baxg0cir8jWNBOLI/MJRBd93QA0+t
 iAM=
X-SBRS: 2.7
X-MesageID: 11068174
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11068174"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24097.50644.213508.515589@mariner.uk.xensource.com>
Date: Fri, 17 Jan 2020 14:33:56 +0000
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
In-Reply-To: <24097.50107.530788.219066@mariner.uk.xensource.com>
References: <20200113170843.21332-1-ian.jackson@eu.citrix.com>
 <20200113170843.21332-11-ian.jackson@eu.citrix.com>
 <1d3336b4-939f-d2a5-2f0e-91c651d788ff@citrix.com>
 <24097.50107.530788.219066@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 10/10] libxl: event: Move poller pipe
 emptying to the end of afterpoll
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSCB2MiAxMC8xMF0gbGlieGw6IGV2ZW50OiBN
b3ZlIHBvbGxlciBwaXBlIGVtcHR5aW5nIHRvIHRoZSBlbmQgb2YgYWZ0ZXJwb2xsIik6Cj4gVEJI
IEkgc3RpbGwgdGhpbmsgdGhpcyBwYXRjaCB0aWRpZXMgdGhlIGNvZGUgdXAgYSBiaXQuCgpHaXZl
biB5b3UgdGVzdGVkIGl0IHdpdGggdGhpcyBjaGFuZ2UsIGFuZCBJIHRoaW5rIGl0IG1ha2VzIGl0
IGEgYml0CnRpZGllciBhbmQgbm8gbGVzcyBjb3JyZWN0LCBJIHdvdWxkIGxpa2UgdG8ga2VlcCBp
dC4KCkkgcmV3cm90ZSB0aGUgY29tbWl0IG1lc3NhZ2UgLSBzZWUgYmVsb3cuCgpJYW4uCgpsaWJ4
bDogZXZlbnQ6IE1vdmUgcG9sbGVyIHBpcGUgZW1wdHlpbmcgdG8gdGhlIGVuZCBvZiBhZnRlcnBv
bGwKClRoaXMgc2VlbXMgbmVhdGVyLiAgSXQgZG9lc24ndCBoYXZlIGFueSBzaWduaWZpY2FudCBl
ZmZlY3QgYmVjYXVzZToKClRoZSBwb2xsZXIgZmQgd291bGRuJ3QgYmUgZW1wdGllZCBieSB0aW1l
X29jY3Vycy4gIEl0IHdvdWxkIG9ubHkgYmUKd29rZW4gYnkgdGltZV9vY2N1cnMgYXMgYSByZXN1
bHQgb2YgYW4gYW8gY29tcGxldGluZywgb3IgYnkKbGlieGxfX2VnY19hb19jbGVhbnVwXzFfYmF0
b24uICBCdXQgLi4uMV9iYXRvbiB3b24ndCBiZSBjYWxsZWQgaW4KYmV0d2VlbiAoZm9yIG9uZSB0
aGluZywgdGhpcyB3b3VsZCB2aW9sYXRlIHRoZSBydWxlIG9mIG5vdCBzdGlsbApoYXZpbmcgdGhl
IGFjdGl2ZSBjYWxsZXIgd2hlbiAuLi4xX2JhdG9uIGlzIGNhbGxlZCkuCgpXaGlsZSBkaXNjdXNz
aW5nIHRoaXMgcGF0Y2gsIEkgbm90aWNlZCB0aGF0IHRoZXJlIGlzIGEgcG9zc2liaWxpdHkgKGlu
CmxpYnhsIGluIGdlbmVyYWwpIHRoYXQgcG9sbGVyX3B1dCBtaWdodCBiZSBjYWxsZWQgb24gYSB3
b2tlbiBwb2xsZXIuCkl0IHdvdWxkIHByb2JhYmx5IGJlIHNlbnNpYmxlIGF0IHNvbWUgcG9pbnQg
dG8gbWFrZSBwb2xsZXJfZ2V0IGVtcHR5CnRoZSBwaXBlLCBhdCBsZWFzdCBpZiB0aGUgcGlwZV9u
b25lbXB0eSBmbGFnIGlzIHNldC4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgpUZXN0ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT4KLS0tCnYyOiBDb21wbGV0ZWx5IHJldmlzZWQgY29tbWl0IG1lc3NhZ2U7
IG5vdyB3ZSB0aGluayB0aGlzIGlzIGp1c3QKICAgIGNsZWFudXAuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
