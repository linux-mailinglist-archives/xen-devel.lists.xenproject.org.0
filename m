Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572D91552F3
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 08:28:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izxzo-0007I8-Qr; Fri, 07 Feb 2020 07:24:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nQzt=33=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1izxzn-0007I3-0B
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 07:24:11 +0000
X-Inumbo-ID: d45dfdde-497a-11ea-b2cb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d45dfdde-497a-11ea-b2cb-bc764e2007e4;
 Fri, 07 Feb 2020 07:24:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 07443AFC6;
 Fri,  7 Feb 2020 07:24:07 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  7 Feb 2020 08:24:05 +0100
Message-Id: <20200207072405.2236-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/sched: add some diagnostic info in the run
 queue keyhandler
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
Cc: Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBkdW1waW5nIHRoZSBydW4gcXVldWUgaW5mb3JtYXRpb24gYWRkIHNvbWUgbW9yZSBkYXRh
IHJlZ2FyZGluZwpjdXJyZW50IGFuZCAoaWYga25vd24pIHByZXZpb3VzIHZjcHUgZm9yIGVhY2gg
cGh5c2ljYWwgY3B1LgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgotLS0KIHhlbi9jb21tb24vc2NoZWQvY29yZS5jIHwgMTkgKysrKysrKysrKysrKy0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUu
YwppbmRleCBkNGU4OTQ0ZTBlLi4xMDNkOTRiZDAyIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3Nj
aGVkL2NvcmUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYwpAQCAtMzIzNSw3ICszMjM1
LDcgQEAgdm9pZCBzY2hlZHVsZXJfZnJlZShzdHJ1Y3Qgc2NoZWR1bGVyICpzY2hlZCkKIAogdm9p
ZCBzY2hlZHVsZV9kdW1wKHN0cnVjdCBjcHVwb29sICpjKQogewotICAgIHVuc2lnbmVkIGludCAg
ICAgIGk7CisgICAgdW5zaWduZWQgaW50ICAgICAgaSwgajsKICAgICBzdHJ1Y3Qgc2NoZWR1bGVy
ICpzY2hlZDsKICAgICBjcHVtYXNrX3QgICAgICAgICpjcHVzOwogCkBAIC0zMjQ2LDcgKzMyNDYs
NyBAQCB2b2lkIHNjaGVkdWxlX2R1bXAoc3RydWN0IGNwdXBvb2wgKmMpCiAgICAgaWYgKCBjICE9
IE5VTEwgKQogICAgIHsKICAgICAgICAgc2NoZWQgPSBjLT5zY2hlZDsKLSAgICAgICAgY3B1cyA9
IGMtPmNwdV92YWxpZDsKKyAgICAgICAgY3B1cyA9IGMtPnJlc192YWxpZDsKICAgICAgICAgcHJp
bnRrKCJTY2hlZHVsZXI6ICVzICglcylcbiIsIHNjaGVkLT5uYW1lLCBzY2hlZC0+b3B0X25hbWUp
OwogICAgICAgICBzY2hlZF9kdW1wX3NldHRpbmdzKHNjaGVkKTsKICAgICB9CkBAIC0zMjU2LDEx
ICszMjU2LDE4IEBAIHZvaWQgc2NoZWR1bGVfZHVtcChzdHJ1Y3QgY3B1cG9vbCAqYykKICAgICAg
ICAgY3B1cyA9ICZjcHVwb29sX2ZyZWVfY3B1czsKICAgICB9CiAKLSAgICBpZiAoIHNjaGVkLT5k
dW1wX2NwdV9zdGF0ZSAhPSBOVUxMICkKKyAgICBwcmludGsoIkNQVXMgaW5mbzpcbiIpOworICAg
IGZvcl9lYWNoX2NwdSAoaSwgY3B1cykKICAgICB7Ci0gICAgICAgIHByaW50aygiQ1BVcyBpbmZv
OlxuIik7Ci0gICAgICAgIGZvcl9lYWNoX2NwdSAoaSwgY3B1cykKLSAgICAgICAgICAgIHNjaGVk
X2R1bXBfY3B1X3N0YXRlKHNjaGVkLCBpKTsKKyAgICAgICAgc3RydWN0IHNjaGVkX3Jlc291cmNl
ICpzciA9IGdldF9zY2hlZF9yZXMoaSk7CisKKyAgICAgICAgcHJpbnRrKCJDUFVbJTAyZF0gY3Vy
cmVudD0lcHYsIGN1cnI9JXB2LCBwcmV2PSVwdlxuIiwgaSwKKyAgICAgICAgICAgICAgIGdldF9j
cHVfY3VycmVudChpKSwgc3ItPmN1cnIgPyBzci0+Y3Vyci0+dmNwdV9saXN0IDogTlVMTCwKKyAg
ICAgICAgICAgICAgIHNyLT5wcmV2ID8gc3ItPnByZXYtPnZjcHVfbGlzdCA6IE5VTEwpOworICAg
ICAgICBmb3JfZWFjaF9jcHUgKGosIHNyLT5jcHVzKQorICAgICAgICAgICAgaWYgKCBpICE9IGog
KQorICAgICAgICAgICAgICAgIHByaW50aygiQ1BVWyUwMmRdIGN1cnJlbnQ9JXB2XG4iLCBqLCBn
ZXRfY3B1X2N1cnJlbnQoaikpOworICAgICAgICBzY2hlZF9kdW1wX2NwdV9zdGF0ZShzY2hlZCwg
aSk7CiAgICAgfQogCiAgICAgcmN1X3JlYWRfdW5sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7Ci0t
IAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
