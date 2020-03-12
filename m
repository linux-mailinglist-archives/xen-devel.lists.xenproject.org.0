Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D74182E6E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 12:00:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCLX9-00039R-V1; Thu, 12 Mar 2020 10:57:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=URUF=45=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jCLX8-00039J-OX
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 10:57:46 +0000
X-Inumbo-ID: 4def4f82-6450-11ea-b149-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4def4f82-6450-11ea-b149-12813bfff9fa;
 Thu, 12 Mar 2020 10:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584010666;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=/CdKvaBgI0EGOhjgGwd1YHnS8N5BlnWYTuuQkdnwzZ4=;
 b=KRgCI8eV9MxvOMGVKLmtcrjOldJuzuDMqSmdm1ltSgq2CK3i7dNqof6+
 TS5Dmd/TqfTWqjfDk40it80HK/vymsVeLE4rVcgTi9y4u5cAT6EA+p5o4
 rym/K7XU6Ye+fERrXYQJgrnEnoyzpqrsbz+TmPwvJr9iV1h6VBDasdX3A s=;
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
IronPort-SDR: tx4a1a+B1/w+XA/SlV3lFn1ToXSM4hSv+FhFpKSanHTiHFRDVHOPY1EbM9iYPXcZ4F6QYeh6OE
 XY1G1eTp1xxjZlDNXgFN1o10BtLcb1q4VWk5qu8/kl6Asnz99nepOzNriu/0xEOekJEwfcsqNs
 AONZYHdX8qouHThaQyz9HKiQ8IJeac8d+zh+MAcoW0yL06igG6Ef3CB7Ea7Abu5hkDb6Vu7cWn
 NFz7rg0k13dG20lE69A5q/xSaK3+GNL8QlHWxGEMJS1wSsQeDXVR/YugpH3pH5SHHy9fc3sx/t
 ucQ=
X-SBRS: 2.7
X-MesageID: 13809567
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,544,1574139600"; d="scan'208";a="13809567"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24170.5541.117045.353743@mariner.uk.xensource.com>
Date: Thu, 12 Mar 2020 10:57:41 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20200311172010.7777-2-roger.pau@citrix.com>
References: <20200311172010.7777-1-roger.pau@citrix.com>
 <20200311172010.7777-2-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH OSSTEST v5 2/5] host: introduce a helper to
 modify hostflags
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCBPU1NURVNUIHY1IDIvNV0gaG9zdDogaW50
cm9kdWNlIGEgaGVscGVyIHRvIG1vZGlmeSBob3N0ZmxhZ3MiKToKPiBBZGQgYSBnZW5lcmljIGZ1
bmN0aW9uIHRvIHBlcmZvcm0gZGF0YWJhc2UgY2hhbmdlcyByZWxhdGVkIHRvIGEgaG9zdAo+IGZs
YWcgYW5kIGFkZCBhIHdyYXBwZXIgdG8gVGVzdFN1cHBvcnQuCgpSZXZpZXdlZC1ieTogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
