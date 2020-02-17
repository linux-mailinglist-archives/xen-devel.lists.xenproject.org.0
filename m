Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB96161940
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 18:58:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3kcM-0003rn-KE; Mon, 17 Feb 2020 17:55:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCVl=4F=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j3kcL-0003rg-LR
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 17:55:37 +0000
X-Inumbo-ID: b350f4b7-51ae-11ea-8024-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b350f4b7-51ae-11ea-8024-12813bfff9fa;
 Mon, 17 Feb 2020 17:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581962137;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=rvhF4eT1ZMXGlGBiIzp+eZ2Q6xZTavJ6L2NfpRLZZgs=;
 b=ROyqMNLlv+pmJCQHqiupBXv7AdosvtPSTkqt3TvlnGEeVhwOwiVF3L+Q
 LlqK0NczRYIJQAZmQV2F6fBV3fzg2bD9Yet7QHu+j91oosIAMl7JOwQb8
 SnOQKVb3tokvHVc862zvVePvreS3tfYU0v6RLXen5CmxjFFqx4XMy4GKR E=;
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
IronPort-SDR: ABbo7jNNIkfsk0ZuEecu0Tygha3WA8prn2OoSdCMYCFNQJaq1ye/dGYHuZ8a1rrE2NOzBTx/6d
 fMgK1olJS9AIqGp3+KCYuwehWhnOwonj0ZigWvmgNk/o4WL1eW3Zh6GYDIRLdVMr6yGTZu+m8c
 8tkq8B6J1r9+lT2S8UrWR246vIXeHLx2syJhT5RYLotcd0ymPoMTGhxIVvHsppKJ77YU09NJn1
 QE6i7jSZdhK3wUdjKVMiuSFRAxUnkPIA3c7afrb+8qnEaMxwcfd6mAXSCjI5Mgm2CecLkuSdv6
 WZs=
X-SBRS: 2.7
X-MesageID: 12567981
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,453,1574139600"; d="scan'208";a="12567981"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24138.54165.558268.732335@mariner.uk.xensource.com>
Date: Mon, 17 Feb 2020 17:55:33 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200131150149.2008-8-pdurrant@amazon.com>
References: <20200131150149.2008-1-pdurrant@amazon.com>
 <20200131150149.2008-8-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v5 7/7] xl: allow domid to be preserved on
 save/restore or migrate
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

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2NSA3LzddIHhsOiBhbGxvdyBkb21pZCB0byBi
ZSBwcmVzZXJ2ZWQgb24gc2F2ZS9yZXN0b3JlIG9yIG1pZ3JhdGUiKToKPiBUaGlzIHBhdGNoIGFk
ZHMgYSAnLUQnIGNvbW1hbmQgbGluZSBvcHRpb24gdG8gc2F2ZSBhbmQgbWlncmF0ZSB0byBhbGxv
dwo+IHRoZSBkb21haW4gaWQgdG8gYmUgaW5jb3Jwb3JhdGVkIGludG8gdGhlIHNhdmVkIGRvbWFp
biBjb25maWd1cmF0aW9uIGFuZAo+IGhlbmNlIGJlIHByZXNlcnZlZC4KPiAKPiBOT1RFOiBMb2dp
Y2FsbHkgaXQgbWF5IHNlZW0gYXMgdGhvdWdoIHByZXNlcnZhdGlvbiBvZiBkb21pZCBzaG91bGQg
YmUKPiAgICAgICBkZWFsdCB3aXRoIGJ5IGxpYnhsLCBidXQgdGhlIGxpYnhsIG1pZ3JhdGlvbiBz
dHJlYW0gaGFzIG5vIHJlY29yZAo+ICAgICAgIGluIHdoaWNoIHRvIHRyYW5zZmVyIGRvbWlkIGFu
ZCByZW1vdGUgZG9tYWluIGNyZWF0aW9uIG9jY3VycyBiZWZvcmUKPiAgICAgICB0aGUgbWlncmF0
aW9uIHN0cmVhbSBpcyBwYXJzZWQuIEhlbmNlIHRoaXMgcGF0Y2ggbW9kaWZpZXMgeGwgcmF0aGVy
Cj4gICAgICAgdGhlbiBsaWJ4bC4KClRoYW5rcy4KCkkgdGhpbmsgSSBhbSBzYXRpc2ZpZWQgdGhh
dCB0aGlzIGlzIHRoZSBiZXN0IHdlIGNhbiBkbyB3aXRob3V0CnRyZW1lbmRvdXMgYW1vdW50cyBv
ZiByZW9yZ2FuaXNhdGlvbi4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KClJlZ2FyZHMsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
