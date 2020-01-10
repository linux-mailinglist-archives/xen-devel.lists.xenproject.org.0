Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4053136A64
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 11:00:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipr2n-0000Py-T0; Fri, 10 Jan 2020 09:57:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rEUW=27=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1ipr2m-0000Pt-H9
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 09:57:28 +0000
X-Inumbo-ID: 96ecedd0-338f-11ea-a2eb-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96ecedd0-338f-11ea-a2eb-bc764e2007e4;
 Fri, 10 Jan 2020 09:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578650240;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=D1xWrC6Ag1tBrxL6wpmWs++lZzVmnsxll9hLadKcGpk=;
 b=Y0gdQsXRwosE/29vTUKBauUIYa5v1iWTbpVgHugHJ1Mz5zz7pSvkwBPJ
 ZHh/bbpUSwkN6UYsk13ctmoTAR/qriCmKEG7ZvNW4ag4G8tDXh+Of5Hgu
 rg1RYcdEewdSUk0lW/Gw2ordYwbU2xgO4160GS5P9Tch8/4+20nzWjoTr g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
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
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HXhhWaF+J+teJvwZ9IWGKaLy1dlVfGtAyBZ9z+oarUZnk7jl6ieRvBLQ7LWm2qiHQZea7GSuXy
 HT+5Y8dCIv7+j+5lmoA8+hL6WlTWftfUF3nkfKpGj4zcI/jHubj0nGvIHTHLG/cU9bYeez9HWB
 sE91KGlqhuHmwEheJyXIBfUrLEkAjNpLbaNyi18OdRhQOG2OYv7vMO0ptLp3BouCAU1uF0mp9f
 S5dUivXaoz5p0sPbUeEUNegKbTp+TJDoz7N+cZQVX43Yl/1PtK5nCc+3Taz4x0rH+x3G25uUp1
 Yb4=
X-SBRS: 2.7
X-MesageID: 10748096
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,415,1571716800"; d="scan'208";a="10748096"
From: Lars Kurth <lars.kurth@citrix.com>
To: Paul Durrant <pdurrant@amazon.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] Introduce CHANGELOG.md
Thread-Index: AQHVx5YmlzQIn9VUekmAniQBT9DjzafjmKgA
Date: Fri, 10 Jan 2020 09:56:58 +0000
Message-ID: <BA8AB5C5-EB91-4FCA-B725-DA8EE91159E9@citrix.com>
References: <20200110091238.845-1-pdurrant@amazon.com>
In-Reply-To: <20200110091238.845-1-pdurrant@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.11.191208
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <C940DB52B856C44ABE5C8807BD5CEACC@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] Introduce CHANGELOG.md
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDEwLzAxLzIwMjAsIDA5OjEyLCAiUGF1bCBEdXJyYW50IiA8cGR1cnJhbnRAYW1h
em9uLmNvbT4gd3JvdGU6DQoNCiAgICBBcyBhZ3JlZWQgZHVyaW5nIHRoZSAyMDIwLTAxIGNvbW11
bml0eSBjYWxsIFsxXSB0aGlzIHBhdGNoIGludHJvZHVjZXMgYQ0KICAgIGNoYW5nZWxvZywgYmFz
ZWQgb24gdGhlIHByaW5jaXBsZXMgZXhwbGFpbmVkIGF0IGtlZXBhY2hhbmdlbG9nLmNvbSBbMl0u
DQogICAgQSBuZXcgTUFJTlRBSU5FUlMgZW50cnkgaXMgYWxzbyBhZGRlZCwgd2l0aCBteXNlbGYg
YXMgKGN1cnJlbnRseSBzb2xlKQ0KICAgIG1haW50YWluZXIuDQogICAgDQogICAgWzFdIFNlZSBD
LjIgYXQgaHR0cHM6Ly9jcnlwdHBhZC5mci9wYWQvIy8yL3BhZC9lZGl0L0VSWnRNWUQ1ajZrMHN2
LU5HNkh0bC1BSi8NCiAgICBbMl0gaHR0cHM6Ly9rZWVwYWNoYW5nZWxvZy5jb20vZW4vMS4wLjAv
DQogICAgDQogICAgU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24u
Y29tPg0KDQoNClRoYW5rIHlvdSBQYXVsDQpFeGFjdGx5IHdoYXQgSSB3YXMgbG9va2luZyBmb3IN
Cg0KUmV2aWV3ZWQtYnk6IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4NCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
