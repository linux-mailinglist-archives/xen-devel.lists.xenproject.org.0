Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0853166246
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 17:22:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4oYf-0007v7-7n; Thu, 20 Feb 2020 16:20:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FovI=4I=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j4oYd-0007uw-Q3
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 16:20:11 +0000
X-Inumbo-ID: dd800628-53fc-11ea-8561-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd800628-53fc-11ea-8561-12813bfff9fa;
 Thu, 20 Feb 2020 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582215611;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=fCpFI5gY0JVII4PpcK9tVOEGYCh9jgvT+Niamb9VlpE=;
 b=XK88EEQ+ihDqe9yl8lEThbTicN6a9aGLPmBhNPFej2I2Odx/jwzQBRdn
 +vi93y0JKxiMS4+aYrPQHlm+1Q5Ik/i1GuIogBSgoT9iSOc0Z7ijr7/d+
 xZf82Ap8oEKyGGLliqNAM6KhsdYDFo4fDW++HFG8LdIC/u+5L1HYZv4ER E=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rb0yf7lnHFLOJjAucVAwWiOszo/kGdKxsIBFOI4wMv7Gi/VsZQyJC97FrKOi5fyyDnMbYRGE+R
 yCtvV+ZgqWRXwvKcCnZKR0Ljr1249sKG1xC9w5eizRzyeOoSf1tiCBvQjc+Zlcah1vrbeJ9ZAv
 nRCngWGfWf76kx5ROHTmmHRc+11Wodmqz1rPkrlecn4CsGUhYSf2Uy/iG1S+ckSDPw5kG9QE0X
 4v4L0Y/v7eJLRGYrzUdZipALDDkfDPaykxuEJ3eGcQPq2ZL25doYr+/oL8DSQMTG9mucpqlEJb
 WW0=
X-SBRS: 2.7
X-MesageID: 12769795
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,464,1574139600"; d="scan'208";a="12769795"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24142.45494.933690.121875@mariner.uk.xensource.com>
Date: Thu, 20 Feb 2020 16:20:06 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200219093754.2924-3-pdurrant@amazon.com>
References: <20200219093754.2924-1-pdurrant@amazon.com>
 <20200219093754.2924-3-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v6 2/6] libxl: modify libxl__logv() to only
 log valid domid values
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2NiAyLzZdIGxpYnhsOiBtb2RpZnkgbGlieGxf
X2xvZ3YoKSB0byBvbmx5IGxvZyB2YWxpZCBkb21pZCB2YWx1ZXMiKToKPiBTb21lIGNvZGUtcGF0
aHMgdXNlIHZhbHVlcyBvdGhlciB0aGFuIElOVkFMSURfRE9NSUQgdG8gaW5kaWNhdGUgYW4gaW52
YWxpZAo+IGRvbWFpbiBpZC4gU3BlY2lmaWNhbGx5LCB4bCB3aWxsIHBhc3MgYSB2YWx1ZSBvZiAw
IHdoZW4gY3JlYXRpbmcvcmVzdG9yaW5nCj4gYSBkb21haW4uIFRoZXJlZm9yZSBtb2RpZnkgbGli
eGxfX2xvZ3YoKSB0byB1c2UgbGlieGxfZG9taWRfdmFsaWRfZ3Vlc3QoKQo+IGFzIGEgdmFsaWRp
dHkgdGVzdC4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
