Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E806C9749C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:22:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0LrA-0008AY-Hy; Wed, 21 Aug 2019 08:20:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0Lr9-0008AA-Mq
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 08:20:35 +0000
X-Inumbo-ID: 8ce0579a-c3ec-11e9-951b-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ce0579a-c3ec-11e9-951b-bc764e2007e4;
 Wed, 21 Aug 2019 08:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375635; x=1597911635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7hjHr1HnTw/wFiWHJw0+LK26cGnsATVQG/dG8p/zPFk=;
 b=s7T2hJWRdPXQ7nBU8t5EhcBjr2pcbyyaCXnkocylexQ/UVowdS/y/U+c
 WjITtYwqElcFRempcpkr420+PfjVRhZVldDwkd7Ihh2XDl3hQkJFFgdw8
 w4tq3TBHNsOuf8g3nrFJjMeaD4r82Hq+yOu6Dtr5L20vaL0P23J9pLVWi Y=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="780418941"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 21 Aug 2019 08:20:34 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS
 id 46767A2B34; Wed, 21 Aug 2019 08:20:33 +0000 (UTC)
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:20:05 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:20:04 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:20:02 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>, <xen-devel@lists.xenproject.org>
Date: Wed, 21 Aug 2019 08:19:20 +0000
Message-ID: <20190821081931.90887-4-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821081931.90887-1-wipawel@amazon.de>
References: <20190821081931.90887-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 03/14] python: Add XC binding for Xen build ID
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wipawel@amazon.com, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Pawel Wieczorkiewicz <wipawel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RXh0ZW5kIHRoZSBsaXN0IG9mIHhjKCkgb2JqZWN0IG1ldGhvZHMgd2l0aCBhZGRpdGlvbmFsIG9u
ZSB0byBkaXNwbGF5ClhlbidzIGJ1aWxkaWQuIFRoZSBpbXBsZW1lbnRhdGlvbiBmb2xsb3dzIHRo
ZSBsaWJ4bCBpbXBsZW1lbnRhdGlvbgooZS5nLiBtYXggYnVpbGRpZCBzaXplIGFzc3VtcHRpb24g
YmVpbmcgWENfUEFHRV9TSVpFIG1pbnVzCnNpemVvZihidWlsZGlkLT5sZW4pKS4KClNpZ25lZC1v
ZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KUmV2aWV3ZWQt
Ynk6IE1hcnRpbiBNYXplaW4gPGFtYXplaW5AYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogQW5kcmEt
SXJpbmEgUGFyYXNjaGl2IDxhbmRyYXByc0BhbWF6b24uY29tPgpSZXZpZXdlZC1ieTogTm9yYmVy
dCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+CkFja2VkLWJ5OiBNYXJlayBNYXJjenlrb3dz
a2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Ci0tLQogdG9vbHMv
cHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xz
L3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYyBiL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwv
eGMveGMuYwppbmRleCAxODhiZmEzNGRhLi43ZjAzNThiYTljIDEwMDY0NAotLS0gYS90b29scy9w
eXRob24veGVuL2xvd2xldmVsL3hjL3hjLmMKKysrIGIvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZl
bC94Yy94Yy5jCkBAIC0xMjE0LDYgKzEyMTQsMjYgQEAgb3V0OgogICAgIHJldHVybiByZXRfb2Jq
ID8gcmV0X29iaiA6IHB5eGNfZXJyb3JfdG9fZXhjZXB0aW9uKHNlbGYtPnhjX2hhbmRsZSk7CiB9
CiAKK3N0YXRpYyBQeU9iamVjdCAqcHl4Y194ZW5idWlsZGlkKFhjT2JqZWN0ICpzZWxmKQorewor
ICAgIHhlbl9idWlsZF9pZF90ICpidWlsZGlkOworICAgIGludCBpLCByOworICAgIGNoYXIgKnN0
cjsKKworICAgIGJ1aWxkaWQgPSBhbGxvY2EoWENfUEFHRV9TSVpFKTsKKyAgICBidWlsZGlkLT5s
ZW4gPSBYQ19QQUdFX1NJWkUgLSBzaXplb2YoKmJ1aWxkaWQpOworCisgICAgciA9IHhjX3ZlcnNp
b24oc2VsZi0+eGNfaGFuZGxlLCBYRU5WRVJfYnVpbGRfaWQsIGJ1aWxkaWQpOworICAgIGlmICgg
ciA8PSAwICkKKyAgICAgICAgcmV0dXJuIHB5eGNfZXJyb3JfdG9fZXhjZXB0aW9uKHNlbGYtPnhj
X2hhbmRsZSk7CisKKyAgICBzdHIgPSBhbGxvY2EoKHIgKiAyKSArIDEpOworICAgIGZvciAoIGkg
PSAwOyBpIDwgcjsgaSsrICkKKyAgICAgICAgc25wcmludGYoJnN0cltpICogMl0sIDMsICIlMDJo
aHgiLCBidWlsZGlkLT5idWZbaV0pOworCisgICAgcmV0dXJuIFB5X0J1aWxkVmFsdWUoInMiLCBz
dHIpOworfQorCiBzdGF0aWMgUHlPYmplY3QgKnB5eGNfeGVuaW5mbyhYY09iamVjdCAqc2VsZikK
IHsKICAgICB4ZW5fZXh0cmF2ZXJzaW9uX3QgeGVuX2V4dHJhOwpAQCAtMjI5Nyw2ICsyMzE3LDEz
IEBAIHN0YXRpYyBQeU1ldGhvZERlZiBweXhjX21ldGhvZHNbXSA9IHsKICAgICAgICJSZXR1cm5z
IFtkaWN0XTogaW5mb3JtYXRpb24gYWJvdXQgWGVuIgogICAgICAgIiAgICAgICAgW05vbmVdOiBv
biBmYWlsdXJlLlxuIiB9LAogCisgICAgeyAiYnVpbGRpZCIsCisgICAgICAoUHlDRnVuY3Rpb24p
cHl4Y194ZW5idWlsZGlkLAorICAgICAgTUVUSF9OT0FSR1MsICJcbiIKKyAgICAgICJHZXQgWGVu
IGJ1aWxkaWRcbiIKKyAgICAgICJSZXR1cm5zIFtzdHJdOiBYZW4gYnVpbGRpZCIKKyAgICAgICIg
ICAgICAgIFtOb25lXTogb24gZmFpbHVyZS5cbiIgfSwKKwogICAgIHsgInNoYWRvd19jb250cm9s
IiwgCiAgICAgICAoUHlDRnVuY3Rpb24pcHl4Y19zaGFkb3dfY29udHJvbCwgCiAgICAgICBNRVRI
X1ZBUkFSR1MgfCBNRVRIX0tFWVdPUkRTLCAiXG4iCi0tIAoyLjE2LjUKCgoKCkFtYXpvbiBEZXZl
bG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpH
ZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWlu
Z2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBC
ClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
