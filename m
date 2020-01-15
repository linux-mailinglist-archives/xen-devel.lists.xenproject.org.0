Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5623813CBD1
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 19:15:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irn8Z-0007El-D3; Wed, 15 Jan 2020 18:11:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JaZC=3E=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1irn8X-0007Eg-Kr
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 18:11:25 +0000
X-Inumbo-ID: 6b7007e6-37c2-11ea-ac27-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b7007e6-37c2-11ea-ac27-bc764e2007e4;
 Wed, 15 Jan 2020 18:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579111876;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kVesPfSNojmiBAyWIPuqI8IcEqnk1P2ahnAW+363fY4=;
 b=WZWxPE15+P3+uI7OI784g3HKOxVSePG+qpGbq+OgrMbeTp9Gi6nI8GpG
 qQKw+tLMfSNzqpkPDa46rJkH5Oit4XNdjWiB1Z33/p6QvS8KREjDirkP+
 XrJbVsJ7d16a6mA7eOKWaKYLvqiU9se92TxdkyaZIiWgCQFcVvS5bqfUV s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Uhu5Jk4oZotxCOwfURSoQxF9gbeu3CYMw5/41i6Z3BUKVgcdqoxuH3b9hYRPgjXhDFjHjC7uzy
 Mr4Cc2+ogbmG4p3Os/pjHeRbBYya2Xk5SheHXEJx4y5Vcr6SRDGkVP0BO9o8EZDk7YouuYJciP
 mWNJC/c1TPV9Ym9te3EDW4Hd5bxHvK/BLwJafnflnvHBmwoKQO/3M9RyKi8cqDmS3fSRSZ3RIg
 je4ZDf5d39OBk1H/KEofGbHHw2XAPP1fFSXyetvsYEOCfPNnJj4jEhCk2Oujt3heX4CuUFEG2N
 MLE=
X-SBRS: 2.7
X-MesageID: 11130077
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,323,1574139600"; d="scan'208";a="11130077"
From: Lars Kurth <lars.kurth@citrix.com>
To: Lars Kurth <lars.kurth@xenproject.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] get-maintainer.pl: Dont fall over when L: contains a
 display name
Thread-Index: AQHVx/ua0rlFn44d4kGSFkHathzZbqfr/ZqA
Date: Wed, 15 Jan 2020 18:11:11 +0000
Message-ID: <8885FB4A-0DDA-4B72-93D3-E64FBC836458@citrix.com>
References: <89248aebf252aaabf5fce44ef4cffc7e3da38212.1578691030.git.lars.kurth@citrix.com>
In-Reply-To: <89248aebf252aaabf5fce44ef4cffc7e3da38212.1578691030.git.lars.kurth@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.12.200112
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <6713A75D9F60D04AB2758A86CB10CD28@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] get-maintainer.pl: Dont fall over when L:
 contains a display name
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
Cc: "jgross@suse.com" <jgross@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>, Julien
 Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSBzaG91bGQgaGF2ZSBhZGRlZCBtb3JlIHBlb3BsZSB0byB0aGlzIGNoYW5nZS4gVGhlIGlzc3Vl
IHdpdGhvdXQgdGhpcyBmaXggaXMgdGhhdCBlbnRyaWVzIHN1Y2ggYXMNCg0KTDogeGVuLWRldmVs
IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+DQoNCmJyZWFrIGdldF9tYWludGFpbmVy
LnBsIGFuZCB0aHVzIGFkZF9tYWludGFpbmVycy5wbA0KDQpMYXJzDQoNCu+7v09uIDEwLzAxLzIw
MjAsIDIxOjE5LCAiTGFycyBLdXJ0aCIgPGxhcnMua3VydGhAeGVucHJvamVjdC5vcmc+IHdyb3Rl
Og0KDQogICAgRnJvbTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPg0KICAgIA0K
ICAgIFByaW9yIHRvIHRoaXMgY2hhbmdlIGUtbWFpbCBhZGRyZXNzZXMgb2YgdGhlIGZvcm0gImRp
c3BsYXkgbmFtZQ0KICAgIDxlbWFpbD4iIHdvdWxkIHJlc3VsdCBpbnRvIGVtcHR5IG91dHB1dC4g
QWxzbyBzZWUNCiAgICBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwv
eGVuLWRldmVsLzIwMjAtMDEvbXNnMDA3NTMuaHRtbA0KICAgIA0KICAgIFNpZ25lZC1vZmYtYnk6
IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4NCiAgICAtLS0NCiAgICBDQzogamdy
b3NzQHN1c2UuY29tDQogICAgLS0tDQogICAgIHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgfCAy
ICstDQogICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
ICAgIA0KICAgIGRpZmYgLS1naXQgYS9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIGIvc2NyaXB0
cy9nZXRfbWFpbnRhaW5lci5wbA0KICAgIGluZGV4IDJlNjYxZjQ3ZDguLjQ4ZTA3MzcwZTggMTAw
NzU1DQogICAgLS0tIGEvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbA0KICAgICsrKyBiL3Njcmlw
dHMvZ2V0X21haW50YWluZXIucGwNCiAgICBAQCAtMTA3Myw3ICsxMDczLDcgQEAgc3ViIGFkZF9j
YXRlZ29yaWVzIHsNCiAgICAgCSAgICBteSAkcHR5cGUgPSAkMTsNCiAgICAgCSAgICBteSAkcHZh
bHVlID0gJDI7DQogICAgIAkgICAgaWYgKCRwdHlwZSBlcSAiTCIpIHsNCiAgICAtCQlteSAkbGlz
dF9hZGRyZXNzID0gJHB2YWx1ZTsNCiAgICArCQlteSAoJGxpc3RfbmFtZSwgJGxpc3RfYWRkcmVz
cykgPSBwYXJzZV9lbWFpbCgkcHZhbHVlKTsgICAgICAgICAgICANCiAgICAgCQlteSAkbGlzdF9h
ZGRpdGlvbmFsID0gIiI7DQogICAgIAkJbXkgJGxpc3Rfcm9sZSA9IGdldF9saXN0X3JvbGUoJGkp
Ow0KICAgICANCiAgICAtLSANCiAgICAyLjEzLjANCiAgICANCiAgICANCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
