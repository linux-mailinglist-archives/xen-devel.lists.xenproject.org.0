Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB884E752C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 16:32:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP6yC-0001P8-Lz; Mon, 28 Oct 2019 15:30:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=datn=YV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iP6yB-0001Op-BM
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 15:30:11 +0000
X-Inumbo-ID: cd382a44-f997-11e9-94fa-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd382a44-f997-11e9-94fa-12813bfff9fa;
 Mon, 28 Oct 2019 15:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572276599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ATqAvq9OoNBmIru3aSpWIA31Ox5T/qlDCioXlg26WZ8=;
 b=CSjo9GmuYkFr03BJ8eSfXcpwSbRkOOJ0aEEEyzpibsRHqOCv5RMEvOku
 WMIqhHlpuxsW5thaAIsvzCEX7Hdc3rdy/qOsvMMHHXc94lEYiWgbHV2q9
 2z848AVTV0xWhgp4TLWTQPsfPc1iDAUhoBBxfOZhQkCV86Ajj5AWnuZ6f M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: l+BCj0YlS/JDWngccKURZnjJL5evtRQCd3tiNIOQTXnqOnFWMYC0gedbYkKOV93nFi/7gQBsOR
 r5IpvzxeVZws1CJy3XHUT975vel/4EBKCFdg6pqpUVX/KihYsgPceM2q+3O58Hz9QsPDjqJriD
 NNa9iIBwXxk2frXpPlDFSMgYT+PKdbQvG40SOvnKFrAHtEK/lcMOIhOi2jLQxc5EEk04stOmNo
 TP5jWvFQt8SW9Ob60XX/5OnqmtCql7FSNlOZP08ecKYca7Rt0AU2gVJlLhTbb7Dr12fCbNtXZ9
 PLA=
X-SBRS: 2.7
X-MesageID: 7969694
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,240,1569297600"; 
   d="scan'208";a="7969694"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 28 Oct 2019 15:29:48 +0000
Message-ID: <20191028152948.11900-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191028152948.11900-1-ian.jackson@eu.citrix.com>
References: <20191028152948.11900-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 3/3] libxl: Set shadow_memkb for
 stub device model domains
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UHJldmlvdXNseSB3ZSBkaWQgbm90IGRvIHRoaXMuICBJbmRlZWQgd2UgaGF2ZSBuZXZlciBkb25l
IHNvLiAgU3R1Ygpkb21haW5zIGhhdmUgaGFkIG5vIG1lbW9yeSBhbGxvd2FuY2UgZm9yIHNoYWRv
dyBtZW1vcnkuICBUaGlzIHNlZW1zIHRvCmJlIGFuIGV4aXN0aW5nIGJ1ZyB3aGljaCB3ZSBmaXgu
Cgp4ODYgbWFpbnRhaW5lcnM6IHBsZWFzZSBjb21tZW50LgoKSSBhbSBub3Qgc3VyZSBvZiB0aGUg
aW50ZXJhY3Rpb24gYmV0d2VlbiB0aGlzIGNoYW5nZSBhbmQgZG9tMAphdXRvYmFsbG9vbmluZy4g
IFRoZSBtZW1vcnkgcmVxdWlyZW1lbnQgZGlzY2xvc2VkIHRvIGxpYnhsJ3MKY2FsbGVyIChlZywg
eGwpIGJ5IGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeSBkbyBub3QgaW5jbHVkZSB0aGlzCmFkZGl0
aW9uYWwgbWVtb3J5LiAgSWYgdGhleSBzaG91bGQgZG8sIHRoZW4KbGlieGxfZ2V0X3JlcXVpcmVk
X3NoYWRvd19tZW1vcnkgYW5kL29yIGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeQptYXkgbmVlZCBh
ZGp1c3RpbmcgdG8gcGF5IGF0dGVudGlvbiB0byB3aGV0aGVyIGEgc3R1YiBkbSBpcyBnb2luZyB0
bwpiZSByZXF1aXJlZC4gIEN1cnJlbnRseSBsaWJ4bF9fZG9tYWluX25lZWRfbWVtb3J5IHNpbXBs
eSBhZGRzIDMyS2J5CmZvciBndWVzdHMgd2l0aCBhIHN0dWIgZG0uCgpTaWduZWQtb2ZmLWJ5OiBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ0M6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ0M6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0t
LQogdG9vbHMvbGlieGwvbGlieGxfZG0uYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9kbS5jIGIvdG9vbHMvbGlieGwv
bGlieGxfZG0uYwppbmRleCA3ZTUyZjA5NzMxLi5mZjc0NmE4OTBhIDEwMDY0NAotLS0gYS90b29s
cy9saWJ4bC9saWJ4bF9kbS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKQEAgLTIxNDEs
NyArMjE0MSw2IEBAIHZvaWQgbGlieGxfX3NwYXduX3N0dWJfZG0obGlieGxfX2VnYyAqZWdjLCBs
aWJ4bF9fc3R1Yl9kbV9zcGF3bl9zdGF0ZSAqc2RzcykKICAgICBsaWJ4bF9kb21haW5fYnVpbGRf
aW5mb19pbml0KCZkbV9jb25maWctPmJfaW5mbyk7CiAgICAgbGlieGxfZG9tYWluX2J1aWxkX2lu
Zm9faW5pdF90eXBlKCZkbV9jb25maWctPmJfaW5mbywgTElCWExfRE9NQUlOX1RZUEVfUFYpOwog
Ci0gICAgZG1fY29uZmlnLT5iX2luZm8uc2hhZG93X21lbWtiID0gMDsKICAgICBkbV9jb25maWct
PmJfaW5mby5tYXhfdmNwdXMgPSAxOwogICAgIGRtX2NvbmZpZy0+Yl9pbmZvLm1heF9tZW1rYiA9
IDI4ICogMTAyNCArCiAgICAgICAgIGd1ZXN0X2NvbmZpZy0+Yl9pbmZvLnZpZGVvX21lbWtiOwot
LSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
