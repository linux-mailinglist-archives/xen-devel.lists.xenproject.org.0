Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 945A8127AC7
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 13:11:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiH5i-0006Wr-Pu; Fri, 20 Dec 2019 12:09:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ryrQ=2K=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iiH5g-0006Wk-QJ
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 12:09:08 +0000
X-Inumbo-ID: 812d194e-2321-11ea-88e7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 812d194e-2321-11ea-88e7-bc764e2007e4;
 Fri, 20 Dec 2019 12:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576843740;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=bN6K5TbQWbNf3xFDkHvGfWQhS1SK6pYaQfTo3aW56Fo=;
 b=SRW2j4ZhuaILYdoAcjTu1sPIJtptpcO4Z4XFJ88GdRNsR4Fi50kcr2pQ
 vuMk4hLVwQVVw7dvHC2912d4uRgh6jHQccBrH+vrQcOkYdeGbWTTdrozm
 y2nkq32Hezov08q9LmWRVZyvyHgPtJMDgPMn1pJ7jlPxGXlq3ARo4KjUn o=;
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
IronPort-SDR: kcdGW3IAix9NLp1gCj9vl6zMwCk2gNcdtpOTnd+i1Tc5n9pI9c51gNZvOoLXXuGAKKM1Mg4bGL
 nvET92c6GusqF1wZNs97nL4eQ/OgE8+vsDtWfBjf0vlPm3/LU4H8Vd0NUcWTohwYLT4xQl/Amx
 F07PCXjPpVa5D7Gck/PrU8og0txd0d518pIPlRdgvP+QDFs1OCyPym5aPAkjdoFYlTNMtUFdZ2
 sk/mI0HWvV6jqzN+76YxATzeUEt7HVPvhBHHm6fdXjeHZR2uS2yl8I7UAJh3B85GiX+xHnBHKz
 2v4=
X-SBRS: 2.7
X-MesageID: 9973418
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,335,1571716800"; 
   d="scan'208";a="9973418"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24060.47576.926894.915900@mariner.uk.xensource.com>
Date: Fri, 20 Dec 2019 12:08:56 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191219204202.27849-1-andrew.cooper3@citrix.com>
References: <20191219204202.27849-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] [PATCH] libxc/restore: Fix data auditing in
 handle_x86_pv_vcpu_blob()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0hdIGxpYnhjL3Jlc3RvcmU6IEZpeCBkYXRhIGF1
ZGl0aW5nIGluIGhhbmRsZV94ODZfcHZfdmNwdV9ibG9iKCkiKToKPiBUaGUgY3VycmVudCBsb2dp
YyBvbmx5IHdvcmtzIGJ5IGNoYW5jZSwgaW4gdGhhdCBYU0FWRSByZWNvcmRzIGFsc28gdGVuZCB0
byBiZQo+IGEgbXVsdGlwbGUgb2YgMTI4LiAgSW1wbGVtZW50IHRoZSBtaXNzaW5nIGxvZ2ljIGZv
ciBYU0FWRS4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
