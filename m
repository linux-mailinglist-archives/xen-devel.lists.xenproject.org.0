Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD669E2187
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 19:13:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNKA3-0002sc-IN; Wed, 23 Oct 2019 17:11:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TICx=YQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iNKA1-0002rM-JC
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 17:11:01 +0000
X-Inumbo-ID: 0b553800-f5b8-11e9-8aca-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b553800-f5b8-11e9-8aca-bc764e2007e4;
 Wed, 23 Oct 2019 17:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571850643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OFqLPj2kV8PSftL12ZLJDfyzqvavohsPHr58Q3YuqZo=;
 b=hEFVo3N+PcBN/6ULP2YU/aZLNyJ6pVmr0iF3EVLYYMEcJwGt51Z1Rnz2
 q4VzxFDTg+8kg2JzssxTG10fg/9udiai/DWnw4vaWBfPKWv/HUsgG8kJR
 cFYjIzsEOmIoE1Yi6DmTq01+2LxSuWO/nDMSch1OZEyJ655hhxDfPTnfN 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: j/XAibLl1a0JSzKn3KCY9isVkb208tdI0hB2UnSR0rzIm1irz71LSU2uuLLpxoIuJAYYFEy/fE
 3EAUooH9Mh1JIy/eb16AZ4BUq+o7ePX8YF62rCDTiXyLJWfHEfFyaiQcJpvg1Fuk/kOBpU1eb6
 +lmAQj+FY0J/1YB2lN5r98Aa6EEpLm2JCexQJ2foGbWsSodAFJUztlytqS3MODcNnHVRt8mLA5
 jrS91TJlSQXIMNC/U/LFgoHwIAXrJaeAmWx7B677loNo5c0592UIrfeEUyN+NLEbPpwGISKn0u
 B7Q=
X-SBRS: 2.7
X-MesageID: 7333657
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7333657"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 17:48:29 +0100
Message-ID: <20191023164837.2700240-16-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023164837.2700240-1-anthony.perard@citrix.com>
References: <20191023164837.2700240-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC XEN PATCH 15/23] convert tools/Makefile to kbuild
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
Cc: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

LS0tCiB4ZW4vdG9vbHMvTWFrZWZpbGUgfCAxNSArKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi90
b29scy9NYWtlZmlsZSBiL3hlbi90b29scy9NYWtlZmlsZQppbmRleCBlOTQwOTM5ZDYxZjQuLmI0
M2Y2MjU5MjAxOSAxMDA2NDQKLS0tIGEveGVuL3Rvb2xzL01ha2VmaWxlCisrKyBiL3hlbi90b29s
cy9NYWtlZmlsZQpAQCAtMSwxMyArMSwyIEBACi0KLWluY2x1ZGUgJChYRU5fUk9PVCkvQ29uZmln
Lm1rCi0KLS5QSE9OWTogZGVmYXVsdAotZGVmYXVsdDoKLQkkKE1BS0UpIHN5bWJvbHMKLQotLlBI
T05ZOiBjbGVhbgotY2xlYW46Ci0Jcm0gLWYgKi5vIHN5bWJvbHMKLQotc3ltYm9sczogc3ltYm9s
cy5jCi0JJChIT1NUQ0MpICQoSE9TVENGTEFHUykgLW8gJEAgJDwKK2hvc3Rwcm9ncy15ICs9IHN5
bWJvbHMKK2Fsd2F5cyArPSAkKGhvc3Rwcm9ncy15KQotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
