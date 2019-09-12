Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 402AEB0CBB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 12:20:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8M9n-0003Gg-6z; Thu, 12 Sep 2019 10:16:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TKPp=XH=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i8M9l-0003Gb-Sf
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 10:16:53 +0000
X-Inumbo-ID: 70c052ac-d546-11e9-b299-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70c052ac-d546-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 10:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568283413;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cKRMiJrHSJAGkJtVzL6/jZR4eJhgQ9UXWDqK+AmziUQ=;
 b=aLJERKDurrTFyiaOWSdfCJui9WddlZo56wq1SNTuc2XM/3mRxSTI5/qG
 IgRfbvyZhAj4llnjB6VH1Q7d1EbcwsUgQRGCJP/7EmftpW/bByoakZ/AE
 bi49Xf630zPNrTcVqtuluL7u/PemwFcW1Lma7uSx3DHYf/OHywYCPCUzc 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RROzK3s5hvkoj5LzzXiM0usSw55gMe5qwpV6EYcdVtxU0ZgMTokic+8HHFQCZkivn/vPSUYe2a
 8t662YfrFiszB9DSh5fGnsM85SrapGm33vysZLSJa2iEXqSEbwGZSyqsnMJPzjjTqRDcuCS4og
 G7f0Jqq8GjT43IbHL3zMSp7CaqzXIUIX7o1cpqGLEMR9+DC2zqel+ZPI4OlsMg5s8i3Dkn/pqg
 8OSHv7czZOCqwCOyZcWAT5jWXoi2TbMSdtQVqsWVJKtBCT2AxfHrZCWXemW90+uBTs+jzlyq3W
 P7I=
X-SBRS: 2.7
X-MesageID: 5476475
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,495,1559534400"; 
   d="scan'208";a="5476475"
Date: Thu, 12 Sep 2019 11:16:40 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190912101640.GB1308@perard.uk.xensource.com>
References: <20190911143618.23477-1-paul.durrant@citrix.com>
 <20190911143618.23477-2-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911143618.23477-2-paul.durrant@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 1/3] xen / notify: introduce a new
 XenWatchList abstraction
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
Cc: xen-devel@lists.xenproject.org, Stefano
 Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMDM6MzY6MTZQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFhlbnN0b3JlIHdhdGNoIGNhbGwtYmFja3MgYXJlIGFscmVhZHkgYWJzdHJhY3RlZCBh
d2F5IGZyb20gWGVuQnVzIHVzaW5nCj4gdGhlIFhlbldhdGNoIGRhdGEgc3RydWN0dXJlIGJ1dCB0
aGUgYXNzb2NpYXRlZCBOb3RpZmllckxpc3QgbWFuaXB1bGF0aW9uCj4gYW5kIGZpbGUgaGFuZGxl
IHJlZ2lzdGF0aW9uIGlzIHN0aWxsIG9wZW4gY29kZWQgaW4gdmFyaW91cyB4ZW5fYnVzXy4uLigp
CiAgICAgICAgICAgICAgICAgIF4gcmVnaXN0cmF0aW9uCj4gZnVuY3Rpb25zLgo+IFRoaXMgcGF0
Y2ggY3JlYXRlcyBhIG5ldyBYZW5XYXRjaExpc3QgZGF0YSBzdHJ1Y3R1cmUgdG8gYWxsb3cgdGhl
c2UKPiBpbnRlcmFjdGlvbnMgdG8gYmUgYWJzdHJhY3RlZCBhd2F5IGZyb20gWGVuQnVzIGFzIHdl
bGwuIFRoaXMgaXMgaW4KPiBwcmVwYXJhdGlvbiBmb3IgYSBzdWJzZXF1ZW50IHBhdGNoIHdoaWNo
IHdpbGwgaW50cm9kdWNlIHNlcGFyYXRlIHdhdGNoIGxpc3RzCj4gZm9yIFhlbkJ1cyBhbmQgWGVu
RGV2aWNlIG9iamVjdHMuCj4gCj4gTk9URTogVGhpcyBwYXRjaCBhbHNvIGludHJvZHVjZXMgYSBu
ZXcgTm90aWZpZXJMaXN0RW1wdHkoKSBoZWxwZXIgZnVuY3Rpb24KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeIG5vdGlmaWVyX2xpc3RfZW1wdHkoKSA/Cgo+ICAgICAg
IGZvciB0aGUgcHVycG9zZXMgb2YgYWRkaW5nIGFuIGFzc2VydGlvbiB0aGF0IGEgWGVuV2F0Y2hM
aXN0IGlzIG5vdAo+ICAgICAgIGZyZWVkIHdoaWxzdCBpdHMgYXNzb2NpYXRlZCBOb3RpZmllckxp
c3QgaXMgc3RpbGwgb2NjdXBpZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxw
YXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50
aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
