Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6578975F0A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 08:28:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqtgB-0003DW-FZ; Fri, 26 Jul 2019 06:26:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6973=VX=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hqtgA-0003D8-9K
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 06:26:10 +0000
X-Inumbo-ID: 413df3ca-af6e-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 413df3ca-af6e-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 06:26:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 73B98AD31;
 Fri, 26 Jul 2019 06:26:08 +0000 (UTC)
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 26 Jul 2019 08:26:07 +0200
Message-ID: <156412236781.2385.9110155201477198899.stgit@Palanthas>
In-Reply-To: <156412188377.2385.12588508835559819141.stgit@Palanthas>
References: <156412188377.2385.12588508835559819141.stgit@Palanthas>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 4/4] xen: sched: refactor the ASSERTs around
 vcpu_deassing()
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
Cc: George Dunlap <george.dunlap@citix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaXMgYWxsIHRoZSB0aW1lIHRoYXQgd2UgY2FsbCB2Y3B1X2RlYXNzaW5nKCkgdGhhdCB0aGUg
dmNwdSBfbXVzdF8gYmUKYXNzaWduZWQgdG8gYSBwQ1BVLCBhbmQgaGVuY2UgdGhhdCBzdWNoIHBD
UFUgY2FuJ3QgYmUgZnJlZS4KClRoZXJlZm9yZSwgbW92ZSB0aGUgQVNTRVJULXMgd2hpY2ggY2hl
Y2sgZm9yIHRoZXNlIHByb3BlcnRpZXMgaW4gdGhhdApmdW5jdGlvbiwgd2hlcmUgdGhleSBiZWxv
bmcgYmV0dGVyLgoKU2lnbmVkLW9mZi1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNl
LmNvbT4KUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0aXguY29t
PgotLS0KIHhlbi9jb21tb24vc2NoZWRfbnVsbC5jIHwgICAgNSArKy0tLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29t
bW9uL3NjaGVkX251bGwuYyBiL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jCmluZGV4IDFiYmNhZjky
YjkuLmM3MjMzNWU1ZmEgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jCisrKyBi
L3hlbi9jb21tb24vc2NoZWRfbnVsbC5jCkBAIC0zNjgsNiArMzY4LDggQEAgc3RhdGljIGJvb2wg
dmNwdV9kZWFzc2lnbihzdHJ1Y3QgbnVsbF9wcml2YXRlICpwcnYsIHN0cnVjdCB2Y3B1ICp2KQog
ICAgIHN0cnVjdCBudWxsX3ZjcHUgKnd2YzsKIAogICAgIEFTU0VSVChsaXN0X2VtcHR5KCZudWxs
X3ZjcHUodiktPndhaXRxX2VsZW0pKTsKKyAgICBBU1NFUlQocGVyX2NwdShucGMsIHYtPnByb2Nl
c3NvcikudmNwdSA9PSB2KTsKKyAgICBBU1NFUlQoIWNwdW1hc2tfdGVzdF9jcHUodi0+cHJvY2Vz
c29yLCAmcHJ2LT5jcHVzX2ZyZWUpKTsKIAogICAgIHBlcl9jcHUobnBjLCBjcHUpLnZjcHUgPSBO
VUxMOwogICAgIGNwdW1hc2tfc2V0X2NwdShjcHUsICZwcnYtPmNwdXNfZnJlZSk7CkBAIC01Mjks
OSArNTMxLDYgQEAgc3RhdGljIHZvaWQgbnVsbF92Y3B1X3JlbW92ZShjb25zdCBzdHJ1Y3Qgc2No
ZWR1bGVyICpvcHMsIHN0cnVjdCB2Y3B1ICp2KQogICAgICAgICBnb3RvIG91dDsKICAgICB9CiAK
LSAgICBBU1NFUlQocGVyX2NwdShucGMsIHYtPnByb2Nlc3NvcikudmNwdSA9PSB2KTsKLSAgICBB
U1NFUlQoIWNwdW1hc2tfdGVzdF9jcHUodi0+cHJvY2Vzc29yLCAmcHJ2LT5jcHVzX2ZyZWUpKTsK
LQogICAgIHZjcHVfZGVhc3NpZ24ocHJ2LCB2KTsKIAogIG91dDoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
