Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F650184606
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 12:36:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCiZ4-0000Yv-7f; Fri, 13 Mar 2020 11:33:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tV7J=46=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jCiZ3-0000Yq-9E
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 11:33:17 +0000
X-Inumbo-ID: 6e1d4ab1-651e-11ea-b2c6-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e1d4ab1-651e-11ea-b2c6-12813bfff9fa;
 Fri, 13 Mar 2020 11:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584099197;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=rRO3lfVLxiPhnOW/Aly+A6x3IQ+eZmPpnbNaHjloQBY=;
 b=gHQH7iEFvC+Bf8YAYQGt1MgXIAs/IwaMc+zlR7pAmOSrkDPtDm+BUm+P
 h4XN6zW1M3YIz3WbQPwpmApL2eXEd0P7aRqsXKX5KAICN04bE8EyiKdDK
 RK86wjK0ZWTyvhJ+OgLoGD0B/zC39Lg1MTTsw+B4nAt7pNCiGomQ4amod w=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aCc0nu82hH50vKcnB/3sfojpLTdMQpUfIhmTU94nIJREdicvfazOYYGwkqagWiGzpbVo7aIcdd
 9kOiNyP2aZcHJTsjxeROeVUKd7HboOF3bq6T4Slf9yvo2tQq5emohKXhj4kNjUjbETuHJ9EhIn
 nVEqqfB2mD6npcUyiY2JsLzHb0OoE6ckcCsENKYX4lc1ISFMv5FUfvnMg2x+wwaA+9hX0JSahK
 ah267OZAUC8uJUC4YufNSvJZtOtxPyO7w1DyLdBiClDDwpN+7FqNI2GD32fm2PQ5+02EbGv77R
 /s0=
X-SBRS: 2.7
X-MesageID: 14094744
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,548,1574139600"; d="scan'208";a="14094744"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24171.28534.420200.220315@mariner.uk.xensource.com>
Date: Fri, 13 Mar 2020 11:33:10 +0000
To: =?iso-8859-2?Q?Pawe=B3?= Marczewski <pawel@invisiblethingslab.com>
In-Reply-To: <f6691746dcbdc30a14dbe36d219697187afe502b.1584098295.git.pawel@invisiblethingslab.com>
References: <f6691746dcbdc30a14dbe36d219697187afe502b.1584098295.git.pawel@invisiblethingslab.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH] libxl: fix cleanup bug in
 initiate_domain_create()
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
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF3ZcWCIE1hcmN6ZXdza2kgd3JpdGVzICgiW1hFTiBQQVRDSF0gbGlieGw6IGZpeCBjbGVhbnVw
IGJ1ZyBpbiBpbml0aWF0ZV9kb21haW5fY3JlYXRlKCkiKToKPiBJbiBjYXNlIG9mIGVycm9ycywg
d2UgaW1tZWRpYXRlbHkgY2FsbCBkb21jcmVhdGVfY29tcGxldGUoKQo+IHdoaWNoIGNsZWFucyB1
cCB0aGUgY29uc29sZV94c3dhaXQgb2JqZWN0LiBNYWtlIHN1cmUgaXQgaXMgaW5pdGlhbGl6ZWQK
PiBiZWZvcmUgd2Ugc3RhcnQgY2xlYW51cC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXdlxYIgTWFy
Y3pld3NraSA8cGF3ZWxAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KClJldmlld2VkLWJ5OiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCkkgd2lsbCBwdXNoIHRoaXMgaW4g
YSBtb21lbnQuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
