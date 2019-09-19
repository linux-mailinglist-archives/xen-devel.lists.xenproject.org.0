Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DA0B8150
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 21:19:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB1w5-0006ab-6q; Thu, 19 Sep 2019 19:17:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dP6a=XO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iB1w4-0006aW-7v
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 19:17:48 +0000
X-Inumbo-ID: 294a70de-db12-11e9-9673-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 294a70de-db12-11e9-9673-12813bfff9fa;
 Thu, 19 Sep 2019 19:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568920666;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=RMo6pnHIKZSCS8S+xuoKRclKjv6/F608feePMM1bhXQ=;
 b=Ie3G46nM+MJ7h4xMLcrv+8lvkcxR5D0b2WlY5ZjB5l/g+8pcAjCqUFoO
 uOWJMnB7pSFoXTkgJWSxZr3vp4EMw1jNaL6oILDuuD2vW8uPO/RCm/4Bj
 hBPHHfhM5Q2WvCNR/9x8pYCywMObXqWbc71ZIwQK82CMh4leNh7LpKBpE E=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 78os02E26U3yrRPWOQHEqEVm4qDqGWJlexUqKuPhFTem1B9QhhxKS1rfOLI4HEO+RvH6ujntHp
 uXXawze9KyywgMfN68BWPd4tV2ETvXgkE3ZWKAfeS0qZDr4ahoQpwEV+vS7NQhYIlVjctuYR2w
 I5NGlBVFjC1AY55Z2GwKOtabkejs5IJ2Km4T8x3Pq781Qzwjw9tBY/e9ESYTIh5MvaNoH+NaLp
 nRu5AVejsJBz4mo37nX2UbyZBz5rfrPeg0+3nmsWY51KmQ9ctu9foN2OnJ8XhV489nW2jYaw4q
 AKk=
X-SBRS: 2.7
X-MesageID: 6072491
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="6072491"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23939.54359.383717.347600@mariner.uk.xensource.com>
Date: Thu, 19 Sep 2019 20:17:43 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190919171656.899649-1-anthony.perard@citrix.com>,
 <20190919171656.899649-33-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
 <20190919171656.899649-33-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 00/35] libxl refactoring to use ev_qmp
 (with API changes) [and 1 more messages]
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
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYyIDAwLzM1XSBsaWJ4bCByZWZhY3Rvcmlu
ZyB0byB1c2UgZXZfcW1wICh3aXRoIEFQSSBjaGFuZ2VzKSIpOgo+IFBhdGNoZXMgd2l0aCBtaXNz
aW5nIGFja2VzOgouLi4KPiAgICAgbGlieGw6IFVzZSBldl9xbXAgaW4gbGlieGxfc2V0X3ZjcHVv
bmxpbmUKCkZyb20gbXkgcG9pbnQgb2YgdmlldyBJIHNlZW0gdG8gaGF2ZSBzZW50IGEgYWNrIGZv
ciB0aGlzLAoKICAgTWVzc2FnZS1JRDogPDIzOTM3LjY4NDIuNDI2ODU3LjgwMDg2NkBtYXJpbmVy
LnVrLnhlbnNvdXJjZS5jb20+CiAgIEluLVJlcGx5LVRvOiA8MjAxOTA4MDIxNTM2MDYuMzIwNjEt
MzMtYW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KICAgUmVmZXJlbmNlczogPDIwMTkwODAyMTUz
NjA2LjMyMDYxLTEtYW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KICAgICAgICAgICA8MjAxOTA4
MDIxNTM2MDYuMzIwNjEtMzMtYW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KICAgRnJvbTogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+CiAgIFRvOiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KICAgQ2M6ICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmciIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+LAogICAgICAgV2VpIExp
dSA8d2xAeGVuLm9yZz4KICAgU3ViamVjdDogUmU6IFtQQVRDSCAzMi8zNV0gbGlieGw6IFVzZSBl
dl9xbXAgaW4gbGlieGxfc2V0X3ZjcHVvbmxpbmUKICAgRGF0ZTogVHVlLCAxNyBTZXAgMjAxOSAx
ODo0MToxNCArMDEwMAoKPyAgSSBob3BlIGl0J3Mgbm90IG1haWwgZ29pbmcgbWlzc2luZyBhZ2Fp
bi4uLgoKVGhhbmtzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
