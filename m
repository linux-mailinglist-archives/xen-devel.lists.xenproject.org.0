Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 290A4B53B2
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 19:10:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGxR-0003kC-9w; Tue, 17 Sep 2019 17:08:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGxQ-0003ji-2Y
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:08:04 +0000
X-Inumbo-ID: b561c5d2-d96d-11e9-b76c-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b561c5d2-d96d-11e9-b76c-bc764e2007e4;
 Tue, 17 Sep 2019 17:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568740084;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=P3FUV3EKytKhnY50JZtqCAE5PD0TH5EdyPhG+o0WSRs=;
 b=Fi9cqKU6fpPSwv6JARN7leh66p7n7AxW99OlXpd2SRdD3108B/d9X+CU
 z3etY5pYCi2KeANq2oBlW0VufSR5Bd85HNZg0KxUPa4yuFfOMxVRyfB1q
 4rh3AJsCWFGKx81goIl4lInBcZ1zmYpL9a/2HRcveS6D92JShX7GwDUmt 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WW6vzbDH2bzUqJoceaIS2abtD6GLJ43FwXPrfjwLZg3GD+pHxBx6/oZAD93881hithhBAZ8IT8
 TQrpI9yAK4Zl2TA7bZQm/RYL85oc+OI1/7w+2M3MLDk81v1b43ftLN7ydP3WqO8xk1Sm7EHxbD
 V+W2ud1XtUluBpNE0qIfIsvSUHIBQjsNtAG2RufYdr+JgLPBSAUsNw++R/hczPjIMOvfBTAO3z
 JbWrisntza7aaT9hOG/nRBRXRNhfEENNaQR6aQEYu1ZS+o4qU24gkwjP3HMUvHYaiK1w/+Z5rT
 FnU=
X-SBRS: 2.7
X-MesageID: 5742856
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5742856"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.4843.257626.832346@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 18:07:55 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-19-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-19-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 18/35] libxl: Add device_{config,
 type} to libxl__ao_device
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDE4LzM1XSBsaWJ4bDogQWRkIGRldmljZV97
Y29uZmlnLHR5cGV9IHRvIGxpYnhsX19hb19kZXZpY2UiKToKPiBUaGVzZSB0d28gZmllbGRzIGhl
bHAgdG8gZ2l2ZSBtb3JlIGluZm9ybWF0aW9uIGFib3V0IHRoZSBkZXZpY2UgYmVlbgo+IGhvdHBs
dWcvaG90dW5wbHVnIHRvIGNhbGxiYWNrcy4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
