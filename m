Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6B510731
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 12:50:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLmnC-0005Ui-6p; Wed, 01 May 2019 10:48:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmnA-0005U8-OP
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:48:48 +0000
X-Inumbo-ID: b1aa9400-6bfe-11e9-abce-478f4e94a758
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1aa9400-6bfe-11e9-abce-478f4e94a758;
 Wed, 01 May 2019 10:48:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208";a="84837295"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 1 May 2019 11:48:27 +0100
Message-ID: <20190501104839.21621-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
References: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 03/15] arch replumbing:
 ts-host-install: Move $kern_arch_info setting
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIGdvaW5nIHRvIHdhbnQgdG8gZG8gdGhpcyBhZnRlciBzZWxlY3Rob3N0LgoKTm8gZnVu
Y3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KLS0tCiB0cy1ob3N0LWluc3RhbGwgfCAyMCArKysrKysrKysrKysrLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvdHMtaG9zdC1pbnN0YWxsIGIvdHMtaG9zdC1pbnN0YWxsCmluZGV4IDQ1ZjA0
NzY0Li4zYzE0ZjE3MSAxMDA3NTUKLS0tIGEvdHMtaG9zdC1pbnN0YWxsCisrKyBiL3RzLWhvc3Qt
aW5zdGFsbApAQCAtMzEsNyArMzEsNyBAQCBteSAkZGViY29uZl9wcmlvcml0eTsKIG15ICRwb3dl
cm9uX3Rlc3Rfb25seTsKIAogb3VyICV4b3B0czsKLW91ciAka2Vybl9hcmNoX2luZm87CitvdXIg
JGJ1aWxkOwogCiB3aGlsZSAoQEFSR1YgYW5kICRBUkdWWzBdID1+IG0vXi0vKSB7CiAgICAgJF89
IHNoaWZ0IEBBUkdWOwpAQCAtNDMsMTIgKzQzLDcgQEAgd2hpbGUgKEBBUkdWIGFuZCAkQVJHVlsw
XSA9fiBtL14tLykgewogICAgIH0gZWxzaWYgIChtL14tLXJlc2N1ZSQvKSB7CiAJJHhvcHRze1Jl
c2N1ZU1vZGV9PSAxOwogICAgIH0gZWxzaWYgIChtL14tLWJ1aWxkJC8pIHsKLQlpZiAoJHJ7YXJj
aH0gZXEgJ2kzODYnKSB7Ci0JICAgICRrZXJuX2FyY2hfaW5mbyA9IHsKLSAgICAgICAgICAgICAg
ICBLZXJuZWxfRGViaWFuID0+ICdhbWQ2NCcsCi0gICAgICAgICAgICAgICAgVXNlcmxhbmRfc2V0
YXJjaCA9PiAnaTM4NicsCi0gICAgICAgICAgICB9OwotCX0KKwkkYnVpbGQgPSAxOwogICAgIH0g
ZWxzZSB7CiAJZGllICIkXyAkISI7CiAgICAgfQpAQCAtNjMsNiArNTgsMTcgQEAgZXhpdCAwIGlm
ICRoby0+e1NoYXJlZFJlYWR5fTsKIG91ciAldGltZW91dD0gcXcoUmVhZFByZXNlZWQgIDM1MAog
ICAgICAgICAgICAgICAgICBTc2hkICAgICAgICAyNDAwKTsKIAorb3VyICRrZXJuX2FyY2hfaW5m
bzsKKworaWYgKCRidWlsZCkgeworICAgIGlmICgkcnthcmNofSBlcSAnaTM4NicpIHsKKwkka2Vy
bl9hcmNoX2luZm8gPSB7CisJICAgIEtlcm5lbF9EZWJpYW4gPT4gJ2FtZDY0JywKKwkgICAgVXNl
cmxhbmRfc2V0YXJjaCA9PiAnaTM4NicsCisJfTsKKyAgICB9Cit9CisKIHN1YiBpbnN0YWxsICgp
IHsKICAgICBteSAoJHBzX3VybCwkcHNfZmlsZSk9IHByZXNlZWRfY3JlYXRlCiAgICAgICAgICgk
aG8sICcnLAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
