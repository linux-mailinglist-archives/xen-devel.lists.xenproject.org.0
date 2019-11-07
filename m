Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D16CF3520
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 17:54:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSl1R-0007aY-3J; Thu, 07 Nov 2019 16:52:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a42S=Y7=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iSl1P-0007aR-H6
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 16:52:35 +0000
X-Inumbo-ID: fe9e5646-017e-11ea-a1ca-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe9e5646-017e-11ea-a1ca-12813bfff9fa;
 Thu, 07 Nov 2019 16:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573145554;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=+8bVMiIuPai0cpfn8YsFU4GB36Pj+zBU4UbIduArCgs=;
 b=H0ZcL/99gUdVZpxSQvPQkzYMHI4U8FYlJ9WKNLqqsCyDL6JZc2keevoG
 soPDj3J9d2EdSGMMMYneGa3psDHyn+UYGA2rR8XHn5eUDUxVceqKm2ZXq
 +Q0yozPVGkuRaIt5KHhP7X4rpo/BSN7M7VDIGYBxqmiAvwh4L0xwjRtrN E=;
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
IronPort-SDR: 1+uy/1Asij7xy3bauene8xEqR9LZxS31gPZjY05OYZGw0Pht9yy/jInyk5dcYfZTTgv8S6ozfR
 /5WyysqrbFvMzN5jdNzagBnCKNAQQm4D8IGjHljUrtgxgDYMzwEdL/yVUn1ybl5zWkeLBt23YU
 g+Qh3Y7l2lrCPgyLtYP5F3A0T/VRwFuxecArqWRVojHvr3zzlo/4blfKSb3xbBUs/zdNNBibde
 i7AvW8mghm41pNf8vlqF2Hd/Mflk8/ZAp6WugTpPyc1jS2JeuwEbRVCBKo1zTABxS0CXj5kJcQ
 FSo=
X-SBRS: 2.7
X-MesageID: 8009617
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,278,1569297600"; 
   d="scan'208";a="8009617"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24004.19406.809934.677120@mariner.uk.xensource.com>
Date: Thu, 7 Nov 2019 16:52:30 +0000
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <7e199416-1d95-19d1-57f8-cedb04e6101b@suse.com>
References: <7e199416-1d95-19d1-57f8-cedb04e6101b@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] OSStest priorities
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SsO8cmdlbiBHcm/DnyB3cml0ZXMgKCJPU1N0ZXN0IHByaW9yaXRpZXMiKToKPiBpbiB0aGUgWGVu
IGNvbW11bml0eSBjYWxsIHdlIGFncmVlZCB0byB0cnkgdG8gc3BlZWQgdXAgT1NTdGVzdCBmb3IK
PiB4ZW4tdW5zdGFibGUgaW4gb3JkZXIgdG8gbWFrZSBiZXR0ZXIgcHJvZ3Jlc3Mgd2l0aCB0aGUg
NC4xMyByZWxlYXNlLgo+IAo+IENvdWxkIHlvdSBwbGVhc2Ugc3VzcGVuZCB0ZXN0aW5nIGZvciBY
ZW4gNC4xMCBhbmQgb2xkZXIgKEphbiBhZ3JlZWQgb24KPiB0aGF0KSwgYW5kIGRpc2FibGUgdGhl
IExpbnV4IGtlcm5lbCB0ZXN0cyB3aGljaCBhcmUgY3VycmVudGx5IGZhaWxpbmcKPiAoaW5jbHVk
aW5nIHRoZSBiaXNlY3RpbmcpPwo+IAo+IFRoaXMgc2hvdWxkIGZyZWUgbG90cyBvZiByZXNvdXJj
ZXMgaW4gT1NTdGVzdCByZWR1Y2luZyB4ZW4tdW5zdGFibGUKPiB0ZXN0IGxhdGVuY2llcy4KCk5v
IHByb2JsZW0uICBEb25lLiAgKEkgZGlkbid0IGNhbmNlbCB0aGUgaW4tcHJvZ3Jlc3MgZmxpZ2h0
cywgc28gYSBmZXcKcmVwb3J0cyB3aWxsIHN0aWxsIGFwcGVhciBmb3IgdGhlc2Ugc3VzcGVuZGVk
IGJyYW5jaGVzLikKCkkgd2lsbCBrZWVwIGFuIGV5ZSBvbiBpdC4KClJlZ2FyZHMsCklhbi4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
