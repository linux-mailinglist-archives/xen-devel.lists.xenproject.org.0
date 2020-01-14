Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F32713B108
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 18:35:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irQ3a-0002L9-Kd; Tue, 14 Jan 2020 17:32:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irQ3Y-0002L4-Ih
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 17:32:44 +0000
X-Inumbo-ID: de333049-36f3-11ea-8415-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de333049-36f3-11ea-8415-12813bfff9fa;
 Tue, 14 Jan 2020 17:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579023163;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=VSx/XJMeHTzzPYMlIWrIlxXP7N8Vo7rGzdDqp3BZmwU=;
 b=B7zbvu8vNaZL/ziXJtalJ9QWgfZKEzV5RrIdUsa5XKHSTn9XpcTijQNJ
 QqiemtANvT18tFYvCGOSkufrMEJjie3Q9AWBme4wVyU0Nnq1MXalkhxqU
 M0CQeEB8f5+EJSuuIfiBRzEvP0LuaaRlwcCnJXO2etQS+EOpO9D3G5QRZ A=;
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
IronPort-SDR: 2mSqKRjfGU1r/ZQNAIf8Z6518SC5lN1qJ0u7ROAbe9aaCAzU1cMi9Xipy2GhU+0KdSsm/NohAs
 irAaxf/iL28CT50rbf/HU8EIfdUi0JexkBsS7a4hbElLfSW9D8X47asmOwhfDZEBJHzCU2xgmB
 /W8s9mDe0+JwKQDL1sLs7QyXuUpee20rGTDg+Eo14KBkiXfXChaRoQ9jpvLkOevnRafBnlIYZu
 XJ8jx+DtEMt12hx+wjk/V6HML4wzYKCSQkgmgPLJHqit53VEVw+kbY+CtGjz0THLPglQMYxPMC
 r58=
X-SBRS: 2.7
X-MesageID: 10897549
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,319,1574139600"; d="scan'208";a="10897549"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24093.64287.92164.372648@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 17:32:15 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200103130616.13724-5-andrew.cooper3@citrix.com>
References: <20200103130616.13724-1-andrew.cooper3@citrix.com>
 <20200103130616.13724-5-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 18/20] tools/libxl: Plumb
 domain_create_state down into libxl__build_pre()
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
Cc: Anthony
 Perard <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMTgvMjBdIHRvb2xzL2xpYnhsOiBQbHVtYiBk
b21haW5fY3JlYXRlX3N0YXRlIGRvd24gaW50byBsaWJ4bF9fYnVpbGRfcHJlKCkiKToKPiBUbyBm
aXggQ1BVSUQgaGFuZGxpbmcsIGxpYnhsX19idWlsZF9wcmUoKSBpcyBnb2luZyB0byBoYXZlIHRv
IGRpc3Rpbmd1aXNoCj4gYmV0d2VlbiBhIGJyYW5kIG5ldyBWTSB2cyBvbmUgd2hpY2ggaXMgYmVp
bmcgbWlncmF0ZWQtaW4vcmVzdW1lZC4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
