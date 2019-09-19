Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B50DB7866
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 13:24:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAuVa-0007bY-Lb; Thu, 19 Sep 2019 11:21:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dP6a=XO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAuVZ-0007b2-I0
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 11:21:57 +0000
X-Inumbo-ID: b0589d78-dacf-11e9-978d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0589d78-dacf-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 11:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568892117;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=+8Tu4Fx8/0ByOUQTaPACbkJJmdfHRG3fBv1BpKGV5js=;
 b=RsFMny2lPwJWHeOrjIcbppaAyAlTJ0KfTvFRuZIkB6auoaHdXlAgY8n/
 rt5TYvcqzN/NsrS9A1QevH4HYTIqqVYwzrcqt1LE/rESBZHsWoxXqLU69
 YsFXLWJ6PbtE7CvBpIUSTidtTYPDKvJnNB9B4OEpsLEPrMYSH2sQLoIM4 w=;
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
IronPort-SDR: gnRqf8Yo87Wb6HhnYnC59zi2ykajFPVFqP6XXTAiQUNuvdWchDiq/lAx5EbeKnf6rXNTW5EwkU
 vt2foa7MFj/9wBkyu4dJkHsXlt8gym67igToyxgzN+TA11VwBmXwclETjvEFGXmSQ8hnqR7Ybx
 fAddZX4hzt+R22q/VXc9GPAVaoSe2dP1HIa6r9EEuTDVEdGI6h07Brp5smKGnOryFreiYD94Xe
 dxvhXnjDmyFRmeM4XwfJMo82fbFQi5iRf7dzeeVj9/q0HFeVf1wr9mcIZazfzzvhdVzJmRigNw
 sN4=
X-SBRS: 2.7
X-MesageID: 5778608
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="5778608"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23939.25809.460226.12678@mariner.uk.xensource.com>
Date: Thu, 19 Sep 2019 12:21:53 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190919100334.790782-1-anthony.perard@citrix.com>
References: <23938.2413.911345.500080@mariner.uk.xensource.com>
 <20190919100334.790782-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 11/15] libxl_usb: Fix wrong usage of
 asserts
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYyIDExLzE1XSBsaWJ4bF91c2I6IEZpeCB3
cm9uZyB1c2FnZSBvZiBhc3NlcnRzIik6Cj4gUmVwbGFjZSB0aGUgYXNzZXJ0KDApIGJ5IGFib3J0
KCkgc2luY2UgdGhlIGludGVudGlvbiBpbiBsaWJ4bCBpcyB0aGF0Cj4gYXNzZXJ0cyBhcmUgYWx3
YXlzIGNvbXBpbGVkIGluLiBUaGlzIHBhdGNoIG1ha2VzIGl0cyBjbGVhciBhbmQgcmVtb3Zlcwo+
IHRoZSBuZWVkIHRvIGRlYWwgd2l0aCBhc3NlcnRzIGJlZW4gY29tcGlsZWQgb3V0LgoKQWNrZWQt
Ynk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
