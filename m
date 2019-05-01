Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C35010732
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 12:50:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLmnK-0005dr-Bp; Wed, 01 May 2019 10:48:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmnJ-0005cj-79
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:48:57 +0000
X-Inumbo-ID: b69a5220-6bfe-11e9-921d-bfeb0c51f066
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b69a5220-6bfe-11e9-921d-bfeb0c51f066;
 Wed, 01 May 2019 10:48:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208";a="84837308"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 1 May 2019 11:48:39 +0100
Message-ID: <20190501104839.21621-16-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
References: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 15/15] ts-kernel-build: Move main
 program to bottom of script
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

SGF2aW5nIGl0IGluIHRoZSBtaWRkbGUgbWFrZXMgaXQgcXVpdGUgaGFyZCB0byBmaW5kICEKCk5v
IGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMta2VybmVsLWJ1aWxkIHwgMjggKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDE0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RzLWtlcm5lbC1idWlsZCBiL3RzLWtlcm5lbC1idWls
ZAppbmRleCA3MWVkYTQ4ZC4uZjdkMDU5YjAgMTAwNzU1Ci0tLSBhL3RzLWtlcm5lbC1idWlsZAor
KysgYi90cy1rZXJuZWwtYnVpbGQKQEAgLTQ2NiwyMCArNDY2LDYgQEAgc3ViIGZ3aW5zdGFsbCAo
KSB7CiBFTkQKIH0KIAotY2hlY2thcmNoKCk7Ci1jaGVja291dCgpOwotY29uZmlnKCk7Ci1idWls
ZCgpOwota2luc3RhbGwoKTsKLWlmICgkcnt0cmVlX2xpbnV4ZmlybXdhcmV9KSB7Ci0gICAgZndi
dWlsZCgpOwotICAgIGZ3aW5zdGFsbCgpOwotfQotYnVpbHRfc3Rhc2goJGhvLCAkYnVpbGRkaXIs
ICdkaXN0JywgJ2tlcm5kaXN0Jyk7Ci1idWlsdF9zdGFzaF9kZWJ1Z2ZpbGUoJGhvLCAkYnVpbGRk
aXIsICd2bWxpbnV4JywgJ2xpbnV4L3ZtbGludXgnKTsKLWJ1aWx0X2NvbXByZXNzX3N0YXNoZWQo
J3ZtbGludXgnKTsKLWJ1aWx0X3N0YXNoX2RlYnVnZmlsZSgkaG8sICRidWlsZGRpciwgJ2NvbmZp
ZycsICdsaW51eC8uY29uZmlnJyk7Ci0KIHN1YiBlbmFibGVfeGVuX2NvbmZpZyAoKSB7CiAgICAg
cmV0dXJuIDw8J0VORCc7CiAjIS9iaW4vc2gKQEAgLTYzMywzICs2MTksMTcgQEAgc2V0b3B0IENP
TkZJR19URUdSQV9IT1NUMVggbgogZXhpdCAwCiBFTkQKIH0KKworY2hlY2thcmNoKCk7CitjaGVj
a291dCgpOworY29uZmlnKCk7CitidWlsZCgpOwora2luc3RhbGwoKTsKK2lmICgkcnt0cmVlX2xp
bnV4ZmlybXdhcmV9KSB7CisgICAgZndidWlsZCgpOworICAgIGZ3aW5zdGFsbCgpOworfQorYnVp
bHRfc3Rhc2goJGhvLCAkYnVpbGRkaXIsICdkaXN0JywgJ2tlcm5kaXN0Jyk7CitidWlsdF9zdGFz
aF9kZWJ1Z2ZpbGUoJGhvLCAkYnVpbGRkaXIsICd2bWxpbnV4JywgJ2xpbnV4L3ZtbGludXgnKTsK
K2J1aWx0X2NvbXByZXNzX3N0YXNoZWQoJ3ZtbGludXgnKTsKK2J1aWx0X3N0YXNoX2RlYnVnZmls
ZSgkaG8sICRidWlsZGRpciwgJ2NvbmZpZycsICdsaW51eC8uY29uZmlnJyk7Ci0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
