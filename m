Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881A8F01A9
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 16:40:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS0uK-0007wr-DV; Tue, 05 Nov 2019 15:38:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oMid=Y5=amazon.de=prvs=2054ccce1=wipawel@srs-us1.protection.inumbo.net>)
 id 1iS0uJ-0007wj-GC
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 15:38:11 +0000
X-Inumbo-ID: 45bae2cc-ffe2-11e9-9631-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45bae2cc-ffe2-11e9-9631-bc764e2007e4;
 Tue, 05 Nov 2019 15:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1572968291; x=1604504291;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=1y9d+GtHSAqAKr13q6Cf6wlz7pVr0G7XBvr/lEBBgWk=;
 b=mFyx0UmWgLKZBUgFxBRpkMTfySxjM6hTYrmn2dwvlIRsGBqmnT/p479H
 BszQv1OnZbpBdeoF8alUS9TlVhLrhiqf1vdFgCmZMCpCSfEsE93HHLBV4
 S0HnZylbKytD4G+VhXWrDoyRJW/DzUkbWZFhahp+6/jRZCl+3ACSvHvxV Y=;
IronPort-SDR: rTwVj1LjrV8gLKciSyLQdKRhiT2I1MNw10RG7KpgwGKLg5XAACCyE63u1eGxV6CclrIfLU9SAZ
 UWoht9+jySUw==
X-IronPort-AV: E=Sophos;i="5.68,271,1569283200"; 
   d="scan'208";a="2774113"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 05 Nov 2019 15:38:10 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id 4084AA2AFA; Tue,  5 Nov 2019 15:38:09 +0000 (UTC)
Received: from EX13D05EUB002.ant.amazon.com (10.43.166.45) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 5 Nov 2019 15:38:07 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D05EUB002.ant.amazon.com (10.43.166.45) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 5 Nov 2019 15:38:06 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 5 Nov 2019 15:38:05 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 5 Nov 2019 15:37:44 +0000
Message-ID: <20191105153745.74257-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] create-diff-object: do not strip STN_UNDEF
 symbols from *.fixup
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>, wipawel@amazon.com, Ross
 Lagerwall <ross.lagerwall@citrix.com>, mpohlack@amazon.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHJlbGEgZ3JvdXBzIGluIHRoZSAqLmZpeHVwIHNlY3Rpb25zIHZhcnkgaW4gc2l6ZS4gVGhh
dCBtYWtlcyBpdAptb3JlIGNvbXBsZXggdG8gaGFuZGxlIGluIHRoZSBsaXZlcGF0Y2hfc3RyaXBf
dW5kZWZpbmVkX2VsZW1lbnRzKCkuCkl0IGlzIGFsc28gdW5uZWNlc3NhcnkgYXMgdGhlIC5maXh1
cCBzZWN0aW9ucyBhcmUgdW5saWtlbHkgdG8gaGF2ZQphbnkgU1ROX1VOREVGIHN5bWJvbHMgYW55
d2F5LgoKU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9u
LmRlPgotLS0KIGNyZWF0ZS1kaWZmLW9iamVjdC5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvY3JlYXRlLWRpZmYtb2JqZWN0LmMgYi9j
cmVhdGUtZGlmZi1vYmplY3QuYwppbmRleCAyZjBlMTYyLi5hYmYzY2M3IDEwMDY0NAotLS0gYS9j
cmVhdGUtZGlmZi1vYmplY3QuYworKysgYi9jcmVhdGUtZGlmZi1vYmplY3QuYwpAQCAtMjA4MSw2
ICsyMDgxLDEzIEBAIHN0YXRpYyB2b2lkIGxpdmVwYXRjaF9zdHJpcF91bmRlZmluZWRfZWxlbWVu
dHMoc3RydWN0IGtwYXRjaF9lbGYgKmtlbGYpCiAJCWlmICghaXNfcmVsYV9zZWN0aW9uKHNlYykp
CiAJCQljb250aW51ZTsKIAorCQkvKiBUaGUgcmVsYSBncm91cHMgaW4gdGhlIC5maXh1cCBzZWN0
aW9ucyB2YXJ5IGluIHNpemUuCisJCSAqIElnbm9yZSB0aGVtIGFzIHRoZXkgYXJlIHVubGlrZWx5
IHRvIGhhdmUgYW55IFNUTl9VTkRFRgorCQkgKiBzeW1ib2xzIGFueXdheS4KKwkJICovCisJCWlm
IChzdHJzdHIoc2VjLT5uYW1lLCAiLmZpeHVwIikpCisJCQljb250aW51ZTsKKwogCQkvKiBvbmx5
IGtub3duLCBmaXhlZC1zaXplIGVudHJpZXMgY2FuIGJlIHN0cmlwcGVkICovCiAJCWVudHJ5X3Np
emUgPSBnZXRfc2VjdGlvbl9lbnRyeV9zaXplKHNlYy0+YmFzZSwga2VsZik7CiAJCWlmIChlbnRy
eV9zaXplID09IDApCi0tIAoyLjE2LjUKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2Vy
bWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6
IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dl
cmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3Qt
SUQ6IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
