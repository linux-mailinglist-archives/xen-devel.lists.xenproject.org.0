Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8598B7854
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 13:21:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAuSA-000667-PP; Thu, 19 Sep 2019 11:18:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dP6a=XO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAuS9-00065y-GZ
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 11:18:25 +0000
X-Inumbo-ID: 320cef46-dacf-11e9-b76c-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 320cef46-dacf-11e9-b76c-bc764e2007e4;
 Thu, 19 Sep 2019 11:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568891906;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=QzQ1aNrbFx733X7tPrdDhZ7S7VYxehGh+Nc4zD8/Mh4=;
 b=H+WqkIHyb3IN+Zq47hIJmtqX0Yfr0mSitkBSwtRxKHGLmbINEZCiZIi0
 B8QAv2be7CPIhBgb5yl2SRMT/xpksrC6t8vQw0z8w0wfSK7yyALo7kNQ+
 rmfDB7Vlh33CQd4x3a+tQtQOPzOjLrhIB9kYTYkwvKnk9NOoADIGUZMJv 0=;
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
IronPort-SDR: Br3X/4b8dRrsRoELV84SqIE4+QhL2aesh+PmxdILVBJix9Lq+o6BVZivdXjwPc6ECkFrryjxWt
 o0sxCiExFjMy0XDaqGD3I2rL18V5pM7rfDTPXATRtaDcnq/117OwVOUSnlLDL7YzooAUWnb3me
 3S4fmyIhsQclfx09KjPMpKgplDS2faJbiGviiO1LPMJBpm48IEbunnow2eN3tzG+V/OL8xT81k
 EnsUtWpzlenZ0QOzN7Cfxpf5v1wJDaoVv3ANgMdA0r3vcsOrl1ysyyBbS/ucfYwNOmX1MIam2h
 i+k=
X-SBRS: 2.7
X-MesageID: 5840580
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="5840580"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23939.25597.378574.563926@mariner.uk.xensource.com>
Date: Thu, 19 Sep 2019 12:18:21 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-29-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-29-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 28/35] libxl_pci: Use ev_qmp in do_pci_add
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDI4LzM1XSBsaWJ4bF9wY2k6IFVzZSBldl9x
bXAgaW4gZG9fcGNpX2FkZCIpOgo+IFRoaXMgcGF0Y2ggYWxzbyByZXBsYWNlcyB0aGUgdXNlIG9m
Cj4gbGlieGxfX3dhaXRfZm9yX2RldmljZV9tb2RlbF9kZXByZWNhdGVkKCkgYnkgaXRzIGVxdWl2
YWxlbnQKPiB3aXRob3V0IHRoZSBuZWVkIGZvciBhIHRocmVhZC4KClRoYW5rcy4KCkFja2VkLWJ5
OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCkJ1dCwgYWZ0ZXIgeW91
ciBzZXJpZXMsIHRoZXJlIGFyZSB0d28gYmFzaWNhbGx5LWlkZW50aWNhbCBmdW5jdGlvbnMKICBh
ZGRfcWVtdV90cmFkX3dhdGNoX3N0YXRlX2NiCiAgcGNpX3JlbW92ZV9xZW11X3RyYWRfd2F0Y2hf
c3RhdGVfY2IKQ2FuIHlvdSBzb21laG93IGNvbWJpbmUgdGhlbSA/ICBJZiBpdCdzIG1vc3QgY29u
dmVuaWVudCwgYQpuZXcgcGF0Y2ggYXQgdGhlIGVuZCBvZiB0aGUgc2VyaWVzIHdvdWxkIGJlIGZp
bmUuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
