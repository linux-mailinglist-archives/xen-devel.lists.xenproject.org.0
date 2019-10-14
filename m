Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9360D5E6A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 11:15:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJwLs-0005mG-Mi; Mon, 14 Oct 2019 09:09:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XCkI=YH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iJwLr-0005mB-UM
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 09:09:15 +0000
X-Inumbo-ID: 4ae89e38-ee62-11e9-a531-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ae89e38-ee62-11e9-a531-bc764e2007e4;
 Mon, 14 Oct 2019 09:09:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C4700B65E;
 Mon, 14 Oct 2019 09:09:13 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 14 Oct 2019 11:09:09 +0200
Message-Id: <20191014090910.9701-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191014090910.9701-1-jgross@suse.com>
References: <20191014090910.9701-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 1/2] xen/netback: fix error path of
 xenvif_connect_data()
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, stable@vger.kernel.org,
 Paul Durrant <paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

eGVudmlmX2Nvbm5lY3RfZGF0YSgpIGNhbGxzIG1vZHVsZV9wdXQoKSBpbiBjYXNlIG9mIGVycm9y
LiBUaGlzIGlzCndyb25nIGFzIHRoZXJlIGlzIG5vIHJlbGF0ZWQgbW9kdWxlX2dldCgpLgoKUmVt
b3ZlIHRoZSBzdXBlcmZsdW91cyBtb2R1bGVfcHV0KCkuCgpGaXhlczogMjc5ZjQzOGUzNmMwYTcg
KCJ4ZW4tbmV0YmFjazogRG9uJ3QgZGVzdHJveSB0aGUgbmV0ZGV2IHVudGlsIHRoZSB2aWYgaXMg
c2h1dCBkb3duIikKQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDMuMTIKU2lnbmVkLW9m
Zi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIGRyaXZlcnMvbmV0L3hl
bi1uZXRiYWNrL2ludGVyZmFjZS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2ludGVyZmFjZS5jIGIvZHJp
dmVycy9uZXQveGVuLW5ldGJhY2svaW50ZXJmYWNlLmMKaW5kZXggMjQwZjc2MmIzNzQ5Li4xMDNl
ZDAwNzc1ZWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2ludGVyZmFjZS5j
CisrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2ludGVyZmFjZS5jCkBAIC03MTksNyArNzE5
LDYgQEAgaW50IHhlbnZpZl9jb25uZWN0X2RhdGEoc3RydWN0IHhlbnZpZl9xdWV1ZSAqcXVldWUs
CiAJeGVudmlmX3VubWFwX2Zyb250ZW5kX2RhdGFfcmluZ3MocXVldWUpOwogCW5ldGlmX25hcGlf
ZGVsKCZxdWV1ZS0+bmFwaSk7CiBlcnI6Ci0JbW9kdWxlX3B1dChUSElTX01PRFVMRSk7CiAJcmV0
dXJuIGVycjsKIH0KIAotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
