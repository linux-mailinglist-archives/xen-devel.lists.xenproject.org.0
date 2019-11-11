Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441C2F7287
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 11:53:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iU7H2-0008TI-HO; Mon, 11 Nov 2019 10:50:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VDtj=ZD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iU7H1-0008TD-DC
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 10:50:19 +0000
X-Inumbo-ID: 0caaa8e4-0471-11ea-984a-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0caaa8e4-0471-11ea-984a-bc764e2007e4;
 Mon, 11 Nov 2019 10:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573469418;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=9eB3Jh79f8g8iz+sfXdLyw3QMZjjwbdasRqE+tWtYz4=;
 b=Zp28S7CLbh9BEf/1dzS1IbsipVE12nXv1QHTKGlc6zf64HHBAwwYyb/C
 UcAM9BWba1+Uvffne87EgV8Sm3kULRxjSRL9L8EXdKB2UaJzBInimp727
 +L1nd6uwayefjs1oB8LGB0sE4S9/ly9w4HUAtGFEEpZiTehj037nKNinP 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +fF7hiOQgnl5sFWgrsYtwvpWvfc5RAaPBcrShGFV73u4z33gBJMTRRcMwIKpDfVr+UQVAC9WFH
 fNWboN4ukGzHhykSutooZS3+vOdgqu2fDq3Sn44FIRFfnbPXganqtwCu1C5x3pKqXJ4qOZ1Gap
 9MXnhdMJZtYGroQFYtFcj7TDMy8UxXf8+yL+KPMegu3ZSFoTG+tjNIJY0wETAQLJqYNXij0Us5
 4b1eWlLOeok5ll9juEkJ3Aa5kSBA/4h5Uh6dGEcljNGUbVOeYjaVDr1rgAGvOh2u/5lbA0cPas
 5t4=
X-SBRS: 2.7
X-MesageID: 8541335
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,292,1569297600"; 
   d="scan'208";a="8541335"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24009.15590.749510.610776@mariner.uk.xensource.com>
Date: Mon, 11 Nov 2019 10:50:14 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <20191108190952.22163-1-sstabellini@kernel.org>
References: <20191108190952.22163-1-sstabellini@kernel.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] Introduce a description of a new optional
 tag for Backports
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
Cc: Lars Kurth <lars.kurth@citrix.com>, "julien@xen.org" <julien@xen.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3RlZmFubyBTdGFiZWxsaW5pIHdyaXRlcyAoIltQQVRDSF0gSW50cm9kdWNlIGEgZGVzY3JpcHRp
b24gb2YgYSBuZXcgb3B0aW9uYWwgdGFnIGZvciBCYWNrcG9ydHMiKToKPiBTaWduZWQtb2ZmLWJ5
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPgoKKzIK
CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
