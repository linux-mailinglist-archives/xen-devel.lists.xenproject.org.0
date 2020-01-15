Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0404013C9F2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 17:48:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irlnD-0006SX-5m; Wed, 15 Jan 2020 16:45:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UrDx=3E=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1irlnB-0006SS-U3
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 16:45:17 +0000
X-Inumbo-ID: 63da73ce-37b6-11ea-a985-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63da73ce-37b6-11ea-a985-bc764e2007e4;
 Wed, 15 Jan 2020 16:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579106708;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zmi/8LDiB+WUYY4tZ59n33k9O416EYzW4qeyw1+V8/w=;
 b=NvzRd9SfBuUd0GQ9waXfc1AXTDgtVZ64JtUQKxEFAD5bf40mzzsqJlQF
 TMf6M90RrN+hoV2YtT00U6P7LRPBPZRXakG15Ve416Os1nt+ji2ieHASp
 3xd40kcLl17raHlh1XKVDK6ljd/kDiaxIshDrn2q93z0hiDHIro7LqGvk 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9ljdylgG9x6S7h8amK5JVl/dH64K3b3fVsRUh3/SocW1DWNLN3x//4elmWpag4uH+Y3py8Nz7b
 KBtpaXKtN4fWqA/vGL1w3j8TzHCIQZO+323LK5q/2d5gVKzQ37Wo/Oq5A3OnZx4BZoX3OL9djH
 lMHsqoggGXc31nBL0LFIXLyONZR2IFNMUaByDq2vRr2lJUt6GFwl2QP75sMD801W7G5JbVLB8y
 7WUCy/29YAejRvnWHz76vktzN6LIz+XGEV6j0wt028QUd+BEbBmbe/MGGUWYP5FmvkpuwOuifw
 QAo=
X-SBRS: 2.7
X-MesageID: 11325886
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,323,1574139600"; d="scan'208";a="11325886"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 15 Jan 2020 16:44:54 +0000
Message-ID: <20200115164455.247202-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH] linkfarm: Exclude .*.tmp
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RXhjbHVkZSBpbnRlcm1pZGlhdGUgZmlsZXMgLioudG1wIGZyb20gdGhlIGxpbmtmYXJtLCB0aG9z
ZSBhcmUKZ2VuZXJhdGVkIGJ5ICUubzolLmMgcnVsZXMgaW4geGVuL1J1bGVzLm1rIHdoZW4KQ09O
RklHX0VORk9SQ0VfVU5JUVVFX1NZTUJPTFM9eS4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHRvb2xzL2Zpcm13YXJlL3hlbi1k
aXIvTWFrZWZpbGUgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAt
LWdpdCBhL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUgYi90b29scy9maXJtd2FyZS94
ZW4tZGlyL01ha2VmaWxlCmluZGV4IDVmYTFjZjIyZjFjMS4uNTQxM2Y4Njc5MDEyIDEwMDY0NAot
LS0gYS90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCisrKyBiL3Rvb2xzL2Zpcm13YXJl
L3hlbi1kaXIvTWFrZWZpbGUKQEAgLTE3LDYgKzE3LDcgQEAgREVQX0ZJTEVTPSQoZm9yZWFjaCBp
LCAkKExJTktfRklMRVMpLCAkKFhFTl9ST09UKS8kKGkpKQogIyBFeGNsdWRlIHNvbWUgaW50ZXJt
ZWRpYXRlIGZpbGVzIGFuZCBmaW5hbCBidWlsZCBwcm9kdWN0cwogTElOS19FWENMVURFUyA6PSAn
Ki5baXNvYV0nICcuKi5kJyAnLiouZDInICcuY29uZmlnJwogTElOS19FWENMVURFUyArPSAnKi5t
YXAnICd4ZW4nICd4ZW4uZ3onICd4ZW4uZWZpJyAneGVuLXN5bXMnCitMSU5LX0VYQ0xVREVTICs9
ICcuKi50bXAnCiAKICMgVGhpcyBpcyBhbGwgYSBnaWFudCBtZXNzIGFuZCBkb2Vzbid0IHJlYWxs
eSB3b3JrLgogIwotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
