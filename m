Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CC114B303
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 11:50:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwONJ-0006MN-SM; Tue, 28 Jan 2020 10:45:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g73u=3R=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iwONI-0006MI-Co
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 10:45:40 +0000
X-Inumbo-ID: 5259b6dd-41bb-11ea-8660-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5259b6dd-41bb-11ea-8660-12813bfff9fa;
 Tue, 28 Jan 2020 10:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580208339;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qcB8pfdjIuEFfdBjhd7IqoIKPyJIK46ZjdGVB1UTImQ=;
 b=b9vYlYD6rW1vYKiwJW2JNCw4dx2yg7TfCRsdczVy8EWTw4Y05TA6n+E7
 dxP0kwAmMN+w+Dc/V/DPX4C9ir6XCDSh/cf67hF5QrN9xa/GnNEwnWunX
 maf4N8wejXmYOU0DgqsSp8umePL9cg3vMoLaEM9cJt60FWXsWPZ+95jSE c=;
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
IronPort-SDR: NoF5kk/dUgnt52oPimpNG0i4iN+WDH8pXpcykqgvbCfQKyf4gGmZjxIcteXbB7E+Mk6kX7Ykjf
 I5eVoKcr5xfB2kNODqZ3PJXgP1BEBlxv8qeetJryqT7OvSncniyXrQYNo6ZLkJSGDP3Zzhc0Vf
 txWtPHMR6FxGpw2wMhOZhY7PiNV4Xv7PfAg9ZD2QV5zZgCGEfQvCkusmz/bbQZz/ZjrjHrW5uv
 x1uSE3gyCvTJOq8Q24guZM+rJo5lJTRqzus+AOYT3KzlAzeYbBUGEt0j//KJNu6OfX2V2AAaQV
 1fU=
X-SBRS: 2.7
X-MesageID: 12146474
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,373,1574139600"; d="scan'208";a="12146474"
Date: Tue, 28 Jan 2020 11:45:28 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20200128104528.GL57924@desktop-tdan49n.eng.citrite.net>
References: <1580160556-25621-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580160556-25621-1-git-send-email-igor.druzhinin@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/suspend: disable watchdog before
 calling console_start_sync()
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDk6Mjk6MTZQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gLi4uIGFuZCBlbmFibGUgaXQgYWZ0ZXIgZXhpdGluZyBTLXN0YXRlLiBPdGhlcndp
c2UgYWNjdW11bGF0ZWQKPiBvdXRwdXQgaW4gc2VyaWFsIGJ1ZmZlciBtaWdodCBlYXNpbHkgdHJp
Z2dlciB0aGUgd2F0Y2hkb2cgaWYgaXQncwo+IHN0aWxsIGVuYWJsZWQgYWZ0ZXIgZW50ZXJpbmcg
c3luYyB0cmFuc21pc3Npb24gbW9kZS4KCkNhbid0IHlvdSBqdXN0IHByb2Nlc3MgdGhlIHdhdGNo
ZG9nIGluIHNlcmlhbF9zdGFydF9zeW5jIGluc3RlYWQgb2YKZGlzYWJsaW5nIGl0PwoKVGhhbmtz
LCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
