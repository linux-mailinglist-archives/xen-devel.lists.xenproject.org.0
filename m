Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981E5100B3D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 19:15:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWlWC-0004Wn-LR; Mon, 18 Nov 2019 18:12:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AWEU=ZK=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iWlWB-0004Wg-7k
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 18:12:55 +0000
X-Inumbo-ID: 08bb0b98-0a2f-11ea-984a-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08bb0b98-0a2f-11ea-984a-bc764e2007e4;
 Mon, 18 Nov 2019 18:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574100771;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=W/qTpwnqdK7tgsBQfo68o/trjUhe/v+NTPmWjo+SVd4=;
 b=Nb8/vCtvwJoUL2H2eIFGgzDpRnm5dC2y2+60k+NNi1zQbb5hqorvrU4Z
 nMGWWlC/V9uX/tLmj8+OxfcwR5cPUqPQuDVAYo3P47aaKmtabFNFC/r2I
 ach+aof7RI7ukBkuVmpXeOnzyJzHvPTQaeLOL5HmwwVKBBSZ/gAyXj9Vd w=;
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
IronPort-SDR: awUhnQRIibdyHeNgKkeddbHgDaYFqmADLqE95rSTwG64JU5mlzJJCR6yyJ7Uj4/rXYpCZH7Mtt
 BqYlYGT25Xnxc4TSvztGyjbqvYZrVzq3ggucDyqpoakachvQaTeZhFoR6ujU/rdII346lDm6a/
 YErCOGlf9SkOEaD9tp4iCZxzFA4V+cNxERJ8cKJwxnMI2XTb7W/dXdeQg9DHkNQxSDuuSJBZbI
 CIPBfpNUffQbLvZvQPlfTQXQm26tXUjnRoayL/CLETUVh9LVNaeKFOIz9xsdPKERidBcLoMgqf
 BYM=
X-SBRS: 2.7
X-MesageID: 8891961
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,321,1569297600"; 
   d="scan'208";a="8891961"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24018.57120.749913.313801@mariner.uk.xensource.com>
Date: Mon, 18 Nov 2019 18:12:48 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191118181014.1472995-1-anthony.perard@citrix.com>
References: <20191118174956.GD1425@perard.uk.xensource.com>
 <20191118181014.1472995-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v4 6/7] libxl: Introduce
 libxl__ev_immediate
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1hFTiBQQVRDSCBmb3ItNC4xMyB2NCA2LzddIGxpYnhs
OiBJbnRyb2R1Y2UgbGlieGxfX2V2X2ltbWVkaWF0ZSIpOgo+IFRoaXMgbmV3IGV2IGFsbG93cyB0
byBhcnJhbmdlIGEgbm9uLXJlZW50cmFudCBjYWxsYmFjayB0byBiZSBjYWxsZWQuCj4gVGhpcyBo
YXBwZW4gaW1tZWRpYXRlbHkgYWZ0ZXIgdGhlIGN1cnJlbnQgZXZlbnQgaXMgcHJvY2Vzc2VkIGFu
ZCBhZnRlcgo+IG90aGVyIGV2X2ltbWVkaWF0ZXMgdGhhdCB3b3VsZCBoYXZlIGFscmVhZHkgYmVl
biByZWdpc3RlcmVkLgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgoKSG93ZXZlcjoKCj4gKyAgICB3aGlsZSAoIUxJQlhMX1NUQUlMUV9FTVBUWSgmZWdj
LT5ldl9pbW1lZGlhdGVzKSkgewo+ICsgICAgICAgIGVpID0gTElCWExfU1RBSUxRX0ZJUlNUKCZl
Z2MtPmV2X2ltbWVkaWF0ZXMpOwo+ICsgICAgICAgIExJQlhMX1NUQUlMUV9SRU1PVkVfSEVBRCgm
ZWdjLT5ldl9pbW1lZGlhdGVzLCBlbnRyeSk7CgpJIHRoaW5rIG1heWJlIHlvdSB3ZXJlIHVuYXdh
cmUgdGhhdCBMSUJYTF9TVEFJTFFfRklSU1QgbWF5IGJlIHVzZWQgb24KYW4gZW1wdHkgbGlzdCBh
bmQgd2lsbCByZXR1cm4gTlVMTC4gIFRoaXMgbWFrZXMgbm8gZGlmZmVyZW5jZSAodGhlCmNvbXBp
bGVyIHdpbGwgZ2V0IHJpZCBvZiB0aGUgZHVwbGljYXRpb24sIHN1cmVseSkgYnV0IG1pZ2h0IG1h
a2UgdGhlCmNvZGUgZnJhY3Rpb25hbGx5IHNob3J0ZXIuCgpJYW4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
