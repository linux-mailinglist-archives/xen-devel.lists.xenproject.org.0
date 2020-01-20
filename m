Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75B41429E0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 12:53:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itVaB-0006Cl-RX; Mon, 20 Jan 2020 11:51:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YHbP=3J=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1itVaA-0006Cd-8y
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 11:51:02 +0000
X-Inumbo-ID: 1e0d4092-3b7b-11ea-b955-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e0d4092-3b7b-11ea-b955-12813bfff9fa;
 Mon, 20 Jan 2020 11:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579521057;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HUq56eAUGpYuUji+VNI0lFINBl+GPjPZD6tx4IZbjMM=;
 b=WZ72JKxvvVxj6XCWNmi2h342ka4YbeNqFKxPYOL7jGJyWazurXyzqTfo
 6ZxQ13rcfAcEOgBIbz5suRGJWgbNdss+SDMQek6tG5QO7wWDen6Yj7j2O
 7n6kcLc//megsT5sN9pc5KIrr0MLNIORLvfVtv8VzSdMw8XKlvnEDnK9s Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8n2UDH59ocBS2qdnLy8KyMqy8SXyu9R3Sm3A/do1IvYf8YqDcBoaUC1BJVrp8IOa5pgHeXY7xw
 4MI3RagR9wIkZ6JYKXaRPi1/D/VCOFIDLisevLSJk9lPUDeQ3FvI/T4FhGo5KsISbq0HjMQghI
 DwDAhVVqv+dK/0SSd+ozrGiW//75C6As8BTsjA7nOGZRSHc4Z5V0Ew87IxbbuhNVHOn/Pcr3Vk
 O9fh64x5LzUXeKs8apMsTk9qFuByorBBXKB8T4KjMC+VztX2fj10tJV+GyEpMVScHr3uFSj5/9
 oYA=
X-SBRS: 2.7
X-MesageID: 11146372
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,341,1574139600"; d="scan'208";a="11146372"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 20 Jan 2020 11:50:53 +0000
Message-ID: <20200120115053.1010739-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200120115053.1010739-1-anthony.perard@citrix.com>
References: <20200120115053.1010739-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH 3/3] tools: Default to python3
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

TWFpbiByZWFzb24sIG5ld2VyIHZlcnNpb24gb2YgUUVNVSBkb2Vzbid0IHN1cHBvcnQgcHl0aG9u
IDIueCBhbnltb3JlLgpTZWNvbmQgbWFpbiByZWFzb24sIHB5dGhvbjIgaXMgRU9MLgoKU2lnbmVk
LW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQoK
UGxlYXNlLCByZXJ1biAuL2F1dG9nZW4uc2gKLS0tCiB0b29scy9jb25maWd1cmUuYWMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS90b29scy9jb25maWd1cmUuYWMgYi90b29scy9jb25maWd1cmUuYWMKaW5kZXggOGQ4NmM0
MmRlOGU1Li5mMjg4ZDJjYzNmZGQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2NvbmZpZ3VyZS5hYworKysg
Yi90b29scy9jb25maWd1cmUuYWMKQEAgLTMzNyw3ICszMzcsNyBAQCBjYXNlICIkaG9zdF9vcyIg
aW4KICAgZnJlZWJzZCopIDs7CiAgICopIEFYX1BBVEhfUFJPR19PUl9GQUlMKFtCQVNIXSwgW2Jh
c2hdKTs7CiBlc2FjCi1BU19JRihbdGVzdCAteiAiJFBZVEhPTiJdLCBbQUNfQ0hFQ0tfUFJPR1Mo
W1BZVEhPTl0sIFtweXRob24gcHl0aG9uMyBweXRob24yXSwgZXJyKV0pCitBU19JRihbdGVzdCAt
eiAiJFBZVEhPTiJdLCBbQUNfQ0hFQ0tfUFJPR1MoW1BZVEhPTl0sIFtweXRob24zIHB5dGhvbiBw
eXRob24yXSwgZXJyKV0pCiBBU19JRihbdGVzdCAiJFBZVEhPTiIgPSAiZXJyIl0sIFtBQ19NU0df
RVJST1IoW05vIHB5dGhvbiBpbnRlcnByZXRlciBmb3VuZF0pXSkKIEFTX0lGKFtlY2hvICIkUFlU
SE9OIiB8IGdyZXAgLXEgIl4vIl0sIFtdLCBbQUNfUEFUSF9QUk9HKFtQWVRIT05dLCBbJFBZVEhP
Tl0pXSkKIFBZVEhPTlBBVEg9JFBZVEhPTgotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
