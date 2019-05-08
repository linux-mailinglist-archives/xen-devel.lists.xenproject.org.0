Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9CE177F2
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 13:33:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOKnW-0006Og-1P; Wed, 08 May 2019 11:31:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=d3I2=TI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hOKnU-0006Ob-M2
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 11:31:40 +0000
X-Inumbo-ID: d6d5d484-7184-11e9-b98b-47160759b404
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6d5d484-7184-11e9-b98b-47160759b404;
 Wed, 08 May 2019 11:31:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AA8D5AC3A;
 Wed,  8 May 2019 11:31:35 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  8 May 2019 13:31:32 +0200
Message-Id: <20190508113132.19198-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/sched: fix csched2_deinit_pdata()
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

Q29tbWl0IDc1M2JhNDNkNmQxNmU2ODggKCJ4ZW4vc2NoZWQ6IGZpeCBjcmVkaXQyIHNtdCBpZGxl
IGhhbmRsaW5nIikKaW50cm9kdWNlZCBhIHJlZ3Jlc3Npb24gd2hlbiBzd2l0Y2hpbmcgY3B1cyBi
ZXR3ZWVuIGNwdXBvb2xzLgoKV2hlbiBhc3NpZ25pbmcgYSBjcHUgdG8gYSBjcHVwb29sIHdpdGgg
Y3JlZGl0MiBiZWluZyB0aGUgZGVmYXVsdApzY2hlZHVsZXIgY3NjaGVkMl9kZWluaXRfcGRhdGEo
KSBpcyBjYWxsZWQgZm9yIHRoZSBjcmVkaXQyIHByaXZhdGUgZGF0YQphZnRlciB0aGUgbmV3IHNj
aGVkdWxlcidzIHByaXZhdGUgZGF0YSBoYXMgYmVlbiBob29rZWQgdG8gdGhlIHBlci1jcHUKc2No
ZWR1bGVyIGRhdGEuIFVuZm9ydHVuYXRlbHkgY3NjaGVkMl9kZWluaXRfcGRhdGEoKSB3aWxsIGN5
Y2xlIHRocm91Z2gKYWxsIHBlci1jcHUgc2NoZWR1bGVyIGFyZWFzIGl0IGtub3dzIG9mIGZvciBy
ZW1vdmluZyB0aGUgY3B1IGZyb20gdGhlCnJlc3BlY3RpdmUgc2libGluZyBtYXNrcyBpbmNsdWRp
bmcgdGhlIGFyZWEgb2YgdGhlIGp1c3QgbW92ZWQgY3B1LiBUaGlzCndpbGwgKGRlcGVuZGluZyBv
biB0aGUgbmV3IHNjaGVkdWxlcikgZWl0aGVyIGNsb2JiZXIgdGhlIGRhdGEgb2YgdGhlCm5ldyBz
Y2hlZHVsZXIgb3IgaW4gY2FzZSBvZiBzY2hlZF9ydCBsZWFkIHRvIGEgY3Jhc2guCgpBdm9pZCB0
aGF0IGJ5IHJlbW92aW5nIHRoZSBjcHUgZnJvbSB0aGUgbGlzdCBvZiBhY3RpdmUgY3B1cyBpbiBj
cmVkaXQyCmRhdGEgZmlyc3QuCgpUaGUgb3Bwb3NpdGUgcHJvYmxlbSBpcyBvY2N1cnJpbmcgd2hl
biByZW1vdmluZyBhIGNwdSBmcm9tIGEgY3B1cG9vbDoKaW5pdF9wZGF0YSgpIG9mIGNyZWRpdDIg
d2lsbCBhY2Nlc3MgdGhlIHBlci1jcHUgZGF0YSBvZiB0aGUgb2xkCnNjaGVkdWxlci4KClNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9u
L3NjaGVkX2NyZWRpdDIuYyB8IDIzICsrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYwppbmRl
eCA2OTU4YjI2NWZjLi45YzFjM2I0ZTA4IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX2Ny
ZWRpdDIuYworKysgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYwpAQCAtMzgxMywyMiArMzgx
MywyMSBAQCBpbml0X3BkYXRhKHN0cnVjdCBjc2NoZWQyX3ByaXZhdGUgKnBydiwgc3RydWN0IGNz
Y2hlZDJfcGNwdSAqc3BjLAogICAgICAgICBhY3RpdmF0ZV9ydW5xdWV1ZShwcnYsIHNwYy0+cnVu
cV9pZCk7CiAgICAgfQogCi0gICAgX19jcHVtYXNrX3NldF9jcHUoY3B1LCAmcnFkLT5pZGxlKTsK
LSAgICBfX2NwdW1hc2tfc2V0X2NwdShjcHUsICZycWQtPmFjdGl2ZSk7Ci0gICAgX19jcHVtYXNr
X3NldF9jcHUoY3B1LCAmcHJ2LT5pbml0aWFsaXplZCk7Ci0gICAgX19jcHVtYXNrX3NldF9jcHUo
Y3B1LCAmcnFkLT5zbXRfaWRsZSk7CisgICAgX19jcHVtYXNrX3NldF9jcHUoY3B1LCAmc3BjLT5z
aWJsaW5nX21hc2spOwogCi0gICAgLyogT24gdGhlIGJvb3QgY3B1IHdlIGFyZSBjYWxsZWQgYmVm
b3JlIGNwdV9zaWJsaW5nX21hc2sgaGFzIGJlZW4gc2V0IHVwLiAqLwotICAgIGlmICggY3B1ID09
IDAgJiYgc3lzdGVtX3N0YXRlIDwgU1lTX1NUQVRFX2FjdGl2ZSApCi0gICAgICAgIF9fY3B1bWFz
a19zZXRfY3B1KGNwdSwgJmNzY2hlZDJfcGNwdShjcHUpLT5zaWJsaW5nX21hc2spOwotICAgIGVs
c2UKKyAgICBpZiAoIGNwdW1hc2tfd2VpZ2h0KCZycWQtPmFjdGl2ZSkgPiAwICkKICAgICAgICAg
Zm9yX2VhY2hfY3B1ICggcmNwdSwgcGVyX2NwdShjcHVfc2libGluZ19tYXNrLCBjcHUpICkKICAg
ICAgICAgICAgIGlmICggY3B1bWFza190ZXN0X2NwdShyY3B1LCAmcnFkLT5hY3RpdmUpICkKICAg
ICAgICAgICAgIHsKICAgICAgICAgICAgICAgICBfX2NwdW1hc2tfc2V0X2NwdShjcHUsICZjc2No
ZWQyX3BjcHUocmNwdSktPnNpYmxpbmdfbWFzayk7Ci0gICAgICAgICAgICAgICAgX19jcHVtYXNr
X3NldF9jcHUocmNwdSwgJmNzY2hlZDJfcGNwdShjcHUpLT5zaWJsaW5nX21hc2spOworICAgICAg
ICAgICAgICAgIF9fY3B1bWFza19zZXRfY3B1KHJjcHUsICZzcGMtPnNpYmxpbmdfbWFzayk7CiAg
ICAgICAgICAgICB9CiAKKyAgICBfX2NwdW1hc2tfc2V0X2NwdShjcHUsICZycWQtPmlkbGUpOwor
ICAgIF9fY3B1bWFza19zZXRfY3B1KGNwdSwgJnJxZC0+YWN0aXZlKTsKKyAgICBfX2NwdW1hc2tf
c2V0X2NwdShjcHUsICZwcnYtPmluaXRpYWxpemVkKTsKKyAgICBfX2NwdW1hc2tfc2V0X2NwdShj
cHUsICZycWQtPnNtdF9pZGxlKTsKKwogICAgIGlmICggY3B1bWFza193ZWlnaHQoJnJxZC0+YWN0
aXZlKSA9PSAxICkKICAgICAgICAgcnFkLT5waWNrX2JpYXMgPSBjcHU7CiAKQEAgLTM5MzcsMTMg
KzM5MzYsMTMgQEAgY3NjaGVkMl9kZWluaXRfcGRhdGEoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAq
b3BzLCB2b2lkICpwY3B1LCBpbnQgY3B1KQogCiAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJSZW1v
dmluZyBjcHUgJWQgZnJvbSBydW5xdWV1ZSAlZFxuIiwgY3B1LCBzcGMtPnJ1bnFfaWQpOwogCi0g
ICAgZm9yX2VhY2hfY3B1ICggcmNwdSwgJnJxZC0+YWN0aXZlICkKLSAgICAgICAgX19jcHVtYXNr
X2NsZWFyX2NwdShjcHUsICZjc2NoZWQyX3BjcHUocmNwdSktPnNpYmxpbmdfbWFzayk7Ci0KICAg
ICBfX2NwdW1hc2tfY2xlYXJfY3B1KGNwdSwgJnJxZC0+aWRsZSk7CiAgICAgX19jcHVtYXNrX2Ns
ZWFyX2NwdShjcHUsICZycWQtPnNtdF9pZGxlKTsKICAgICBfX2NwdW1hc2tfY2xlYXJfY3B1KGNw
dSwgJnJxZC0+YWN0aXZlKTsKIAorICAgIGZvcl9lYWNoX2NwdSAoIHJjcHUsICZycWQtPmFjdGl2
ZSApCisgICAgICAgIF9fY3B1bWFza19jbGVhcl9jcHUoY3B1LCAmY3NjaGVkMl9wY3B1KHJjcHUp
LT5zaWJsaW5nX21hc2spOworCiAgICAgaWYgKCBjcHVtYXNrX2VtcHR5KCZycWQtPmFjdGl2ZSkg
KQogICAgIHsKICAgICAgICAgcHJpbnRrKFhFTkxPR19JTkZPICIgTm8gY3B1cyBsZWZ0IG9uIHJ1
bnF1ZXVlLCBkaXNhYmxpbmdcbiIpOwotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
