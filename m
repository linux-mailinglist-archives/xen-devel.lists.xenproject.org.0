Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 270C6B539C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 19:07:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGtp-0002hL-2i; Tue, 17 Sep 2019 17:04:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGtn-0002gy-2k
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:04:19 +0000
X-Inumbo-ID: 294b09aa-d96d-11e9-961b-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 294b09aa-d96d-11e9-961b-12813bfff9fa;
 Tue, 17 Sep 2019 17:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568739848;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=B3qcE6lwG4gHgdkoQ78vj/nwQHxnRhTwAGIP8QjdP9M=;
 b=RIkYuCd58A2KpJTwadHrcGZtRAjF8CAOD86xIZ1PRPOeMOF0ZLv5vmEW
 JX2RQzPdpAiEej8KXTNuBbubKGZEX2HafIzTC6tc9knjxBBdeCLtRsscC
 3R7cfe9YguDuy9KzaaE2w3LgwgmggOHxow4hHG6PP1Nw8jVmCoEffOfYs c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4QMVCavMPf+egpIu5QDXUzNy6BEcMmTFoCWmf+w3k0st3Q7nOFBKIoGSQqNJulH5zpBR/mB7Xa
 J/fwaRQHH8QbXy/HsWyDFwWQOUMv0YMRQgIzxXo8grmYpMz47lfm/RUoXP/AmDIZ+VAiTzY+1U
 CRDPYYS/573WdnoELSdHbNesT+kM1znzcI3+BXtIyFH17mUSeD25hGH3ZtIVcsvsWWSdHt54aP
 ghzPQcrgsiiaW2v3Bom49yj/f3V30tc6qTw7IvTIHnxOTELUL8JpiO+lTNbfpqGoAnUKp1YS8T
 g0Q=
X-SBRS: 2.7
X-MesageID: 5682847
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5682847"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.4613.112797.416037@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 18:04:05 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-11-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-11-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 10/35] libxl: Re-introduce
 libxl__domain_resume
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDEwLzM1XSBsaWJ4bDogUmUtaW50cm9kdWNl
IGxpYnhsX19kb21haW5fcmVzdW1lIik6Cj4gbGlieGxfX2RvbWFpbl9yZXN1bWUgaXMgYSByZXdv
cmsgbGlieGxfX2RvbWFpbl9yZXN1bWVfZGVwcmVjYXRlZC4gSXQKPiBtYWtlcyB1c2VzIG9mIGV2
X3hzd2F0Y2ggYW5kIGV2X3FtcCwgdG8gcmVwbGFjZSBzeW5jaHJvbm91cyBRTVAgY2FsbHMKPiBh
bmQgbGlieGxfX3dhaXRfZm9yX2RldmljZV9tb2RlbF9kZXByZWNhdGVkIGNhbGwuCgpBY2tlZC1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
