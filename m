Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5352FB6182
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 12:37:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAXJ5-0001GP-0h; Wed, 18 Sep 2019 10:35:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bm4j=XN=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAXJ3-0001GG-Ov
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 10:35:29 +0000
X-Inumbo-ID: 07b0b0c2-da00-11e9-962b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07b0b0c2-da00-11e9-962b-12813bfff9fa;
 Wed, 18 Sep 2019 10:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568802928;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=vxZqJP1lxn7bEqCIxD1JRlC6cuyPyYcdfoTpPNc3pEs=;
 b=MZQlrT86lXpkZmwnkA/BqrzaCb+HITvbgZEHJ2sxLrFIO4Kqs0EGYUut
 hunOfeBNCz8Ow3iIIwlP2saQEbjHxUEr0DdkM6EfwoN75orF2dyiesGqF
 Rhw8URKmkFqHVYirT2craHqokf5VbdSU3wxClQILjbsFJzWGkNAPi4VpF 8=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: b4HfoQktoThT/+NptY0fwVB+ofPweV/QFp84WF9UpjtAM+QnjpCtIYd7SlKPMq28BsNCj8eKCP
 5UscUiO5lE4fyMPAgbZxpUXhVqjeQettHKc7ihkcBjqwfxbWWIyJuwAsv20sxTaGULPygpJ9FH
 A07MuiX1+2zB3nfKvJ4KZQqjlvbHs1BiZY26fxZTjyzpQqLZ2NH7nIRaKATRsRKHXmsylOWVc1
 /02tuztAMXOfLFZAElBNmbu80t98wVe/H8XTKgmfDUG45JWpSmlkz/vKNaiPV0LvRXfgX1bWvh
 GLM=
X-SBRS: 2.7
X-MesageID: 5718462
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="5718462"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23938.2156.493501.511169@mariner.uk.xensource.com>
Date: Wed, 18 Sep 2019 11:35:24 +0100
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
In-Reply-To: <20190619175333.29938-2-volodymyr_babchuk@epam.com>
References: <20190619175333.29938-1-volodymyr_babchuk@epam.com>
 <20190619175333.29938-2-volodymyr_babchuk@epam.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v7 1/5] tools/arm: tee: add "tee" option for
 xl.cfg
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Vm9sb2R5bXlyIEJhYmNodWsgd3JpdGVzICgiW1BBVENIIHY3IDEvNV0gdG9vbHMvYXJtOiB0ZWU6
IGFkZCAidGVlIiBvcHRpb24gZm9yIHhsLmNmZyIpOgo+IFRoaXMgZW51bWVyYXRpb24gY29udHJv
bHMgVEVFIHR5cGUgZm9yIGEgZG9tYWluLiBDdXJyZW50bHkgdGhlcmUgaXMKPiB0d28gcG9zc2li
bGUgb3B0aW9uczogZWl0aGVyICdub25lJyBvciAnb3B0ZWUnLgo+IAo+ICdub25lJyBpcyB0aGUg
ZGVmYXVsdCB2YWx1ZSBhbmQgaXQgYmFzaWNhbGx5IGRpc2FibGVzIFRFRSBzdXBwb3J0IGF0Cj4g
YWxsLgo+IAo+ICdvcHRlZScgZW5hYmxlcyBhY2Nlc3MgdG8gdGhlIE9QLVRFRSBydW5uaW5nIG9u
IGEgaG9zdCBtYWNoaW5lLiBUaGlzCj4gcmVxdWlyZXMgc3BlY2lhbCBPUC1URUUgYnVpbGQgd2l0
aCB2aXJ0dWFsaXphdGlvbiBzdXBwb3J0IGVuYWJsZWQuCgpBY2tlZC1ieTogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
