Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D5EFB1BC
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 14:51:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUszg-0002Bg-Hu; Wed, 13 Nov 2019 13:47:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3r5a=ZF=amazon.com=prvs=213cc4842=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iUsze-0002BU-N1
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 13:47:34 +0000
X-Inumbo-ID: 255f5a90-061c-11ea-a230-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 255f5a90-061c-11ea-a230-12813bfff9fa;
 Wed, 13 Nov 2019 13:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1573652854; x=1605188854;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=gRORxlqk4UPl2Q1cABjRJe3672NGCKyCe+lafu9Z3Wo=;
 b=SmdVTsXcVmiDSB/XG2Tu8V/49YabXIGSrejxma4ch6D5jC66kzUa7VPz
 gD3ILuEpcaY5sfwHP23zklqBflQUjW0OUOOAM6Mz/NVgxCYh0gZdXaZ6l
 tlaA1Gr3q5NlLqlcHvo/Fv9F3SIyCEpuBPlXEuaPXivXfFlGeYfBLni3D g=;
IronPort-SDR: sWD26fuw45xmQw6EkdmlG7MnihHbHuQaP5QkxwjCo2F2sPwTqQl5nrehZZjj5lXyj/QW26d5zG
 dym9Huwnf9dA==
X-IronPort-AV: E=Sophos;i="5.68,300,1569283200"; 
   d="scan'208";a="3678586"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 13 Nov 2019 13:47:34 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id EFFF5A2057
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2019 13:47:33 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 13 Nov 2019 13:47:33 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 13 Nov 2019 13:47:32 +0000
Received: from CBG-5CG9341D0C.cbg10.amazon.com (10.55.227.12) by
 mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 13 Nov 2019 13:47:31 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 13 Nov 2019 13:47:29 +0000
Message-ID: <20191113134729.1121-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] domain_create: honour global grant/maptrack
 frame limits...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <pdurrant@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4ud2hlbiB0aGVpciB2YWx1ZXMgYXJlIGxhcmdlciB0aGFuIHRoZSBwZXItZG9tYWluIGNvbmZp
Z3VyZWQgbGltaXRzLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6
b24uY29tPgotLS0KQWZ0ZXIgbWluaW5nIHRocm91Z2ggY29tbWl0cyBpdCBpcyBzdGlsbCB1bmNs
ZWFyIHRvIG1lIGV4YWN0bHkgd2hlbiBYZW4Kc3RvcHBlZCBob25vdXJpbmcgdGhlIGdsb2JhbCB2
YWx1ZXMsIGJ1dCBJIHJlYWxseSB0aGluayB0aGlzIGNvbW1pdCBzaG91bGQKYmUgYmFjay1wb3J0
ZWQgdG8gc3RhYmxlIHRyZWVzIGFzIGl0IHdhcyBhIGJlaGF2aW91cmFsIGNoYW5nZSB0aGF0IGNh
bgpjYXVzZSBkb21VcyB0byBmYWlsIGluIG5vbi1vYnZpb3VzIHdheXMuCi0tLQogeGVuL2NvbW1v
bi9kb21haW4uYyB8IDE0ICsrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWFpbi5j
IGIveGVuL2NvbW1vbi9kb21haW4uYwppbmRleCA2MTExMTZjN2ZjLi5hYWQ2ZDU1YjgyIDEwMDY0
NAotLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jCisrKyBiL3hlbi9jb21tb24vZG9tYWluLmMKQEAg
LTMzNSw2ICszMzUsNyBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5fY3JlYXRlKGRvbWlkX3QgZG9t
aWQsCiAgICAgZW51bSB7IElOSVRfd2F0Y2hkb2cgPSAxdTw8MSwKICAgICAgICAgICAgSU5JVF9l
dnRjaG4gPSAxdTw8MywgSU5JVF9nbnR0YWIgPSAxdTw8NCwgSU5JVF9hcmNoID0gMXU8PDUgfTsK
ICAgICBpbnQgZXJyLCBpbml0X3N0YXR1cyA9IDA7CisgICAgdW5zaWduZWQgaW50IG1heF9ncmFu
dF9mcmFtZXMsIG1heF9tYXB0cmFja19mcmFtZXM7CiAKICAgICBpZiAoIGNvbmZpZyAmJiAoZXJy
ID0gc2FuaXRpc2VfZG9tYWluX2NvbmZpZyhjb25maWcpKSApCiAgICAgICAgIHJldHVybiBFUlJf
UFRSKGVycik7CkBAIC00NTYsOCArNDU3LDE3IEBAIHN0cnVjdCBkb21haW4gKmRvbWFpbl9jcmVh
dGUoZG9taWRfdCBkb21pZCwKICAgICAgICAgICAgIGdvdG8gZmFpbDsKICAgICAgICAgaW5pdF9z
dGF0dXMgfD0gSU5JVF9ldnRjaG47CiAKLSAgICAgICAgaWYgKCAoZXJyID0gZ3JhbnRfdGFibGVf
aW5pdChkLCBjb25maWctPm1heF9ncmFudF9mcmFtZXMsCi0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29uZmlnLT5tYXhfbWFwdHJhY2tfZnJhbWVzKSkgIT0gMCApCisgICAg
ICAgIC8qCisgICAgICAgICAqIE1ha2Ugc3VyZSB0aGF0IHRoZSBjb25maWd1cmVkIHZhbHVlcyBk
b24ndCByZWR1Y2UgYW55CisgICAgICAgICAqIGdsb2JhbCBjb21tYW5kIGxpbmUgb3ZlcnJpZGUu
CisgICAgICAgICAqLworICAgICAgICBtYXhfZ3JhbnRfZnJhbWVzID0gbWF4KGNvbmZpZy0+bWF4
X2dyYW50X2ZyYW1lcywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvcHRfbWF4X2dy
YW50X2ZyYW1lcyk7CisgICAgICAgIG1heF9tYXB0cmFja19mcmFtZXMgPSBtYXgoY29uZmlnLT5t
YXhfbWFwdHJhY2tfZnJhbWVzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9w
dF9tYXhfbWFwdHJhY2tfZnJhbWVzKTsKKworICAgICAgICBpZiAoIChlcnIgPSBncmFudF90YWJs
ZV9pbml0KGQsIG1heF9ncmFudF9mcmFtZXMsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbWF4X21hcHRyYWNrX2ZyYW1lcykpICE9IDAgKQogICAgICAgICAgICAgZ290byBm
YWlsOwogICAgICAgICBpbml0X3N0YXR1cyB8PSBJTklUX2dudHRhYjsKIAotLSAKMi4xNy4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
