Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 248E615C07B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 15:37:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2Fa9-0007TK-Q9; Thu, 13 Feb 2020 14:35:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=06QY=4B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j2Fa8-0007TF-NJ
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 14:35:08 +0000
X-Inumbo-ID: 07f9e304-4e6e-11ea-b8b5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07f9e304-4e6e-11ea-b8b5-12813bfff9fa;
 Thu, 13 Feb 2020 14:35:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2A32BAE78;
 Thu, 13 Feb 2020 14:35:07 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 13 Feb 2020 15:35:04 +0100
Message-Id: <20200213143504.23777-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/sched: fix get_cpu_idle_time() with core
 scheduling
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

Z2V0X2NwdV9pZGxlX3RpbWUoKSBpcyBjYWxsaW5nIHZjcHVfcnVuc3RhdGVfZ2V0KCkgZm9yIGFu
IGlkbGUgdmNwdS4KV2l0aCBjb3JlIHNjaGVkdWxpbmcgYWN0aXZlIHRoaXMgaXMgZnJhZ2lsZSwg
YXMgaWRsZSB2Y3B1cyBhcmUgYXNzaWduZWQKdG8gb3RoZXIgc2NoZWR1bGluZyB1bml0cyB0ZW1w
b3JhcmlseSwgYW5kIHRoYXQgYXNzaWdubWVudCBpcyBjaGFuZ2VkCmluIHNvbWUgY2FzZXMgd2l0
aG91dCBob2xkaW5nIHRoZSBzY2hlZHVsaW5nIGxvY2ssIGFuZAp2Y3B1X3J1bnN0YXRlX2dldCgp
IGlzIHVzaW5nIHYtPnNjaGVkX3VuaXQgYXMgcGFyYW1ldGVyIGZvcgp1bml0X3NjaGVkdWxlX1t1
bl1sb2NrX2lycSgpLCByZXN1bHRpbmcgaW4gYW4gQVNTRVJUKCkgdHJpZ2dlcmluZyBpbgp1bmxv
Y2sgaW4gY2FzZSB2LT5zY2hlZF91bml0IGhhcyBjaGFuZ2VkIG1lYW53aGlsZS4KCkZpeCB0aGF0
IGJ5IHVzaW5nIGEgbG9jYWwgdW5pdCB2YXJpYWJsZSBob2xkaW5nIHRoZSBjb3JyZWN0IHVuaXQu
CgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQpJIGhh
dmUgdmVyaWZpZWQgdGhhdCBhbGwgb3RoZXIgdXNlcyBvZiB2LT5zY2hlZF91bml0IGFyZSBub3QK
cHJvYmxlbWF0aWM6IHRoZXkgYXJlIGFsbCBmb3Igbm9uLWlkbGUgdmNwdXMsIG9yIGluIHNjaGVk
dWxpbmcgcGF0aHMKZGVhbGluZyB3aXRoIHNjaGVkdWxpbmcgdGhlbXNlbHZlcyBhbmQgdGh1cyBi
ZWluZyBhd2FyZSBvZiB0aGUKcG90ZW50aWFsIHByb2JsZW0gb3Igbm90IHZ1bG5lcmFibGUgYnkg
aXQuCi0tLQogeGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgfCAxMyArKysrKysrKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jCmluZGV4
IDJlNDNmODAyOWYuLmRlNWE2YjFhNTcgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWQvY29y
ZS5jCisrKyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jCkBAIC0zMDgsMTcgKzMwOCwyNiBAQCB2
b2lkIHZjcHVfcnVuc3RhdGVfZ2V0KGNvbnN0IHN0cnVjdCB2Y3B1ICp2LAogewogICAgIHNwaW5s
b2NrX3QgKmxvY2s7CiAgICAgc190aW1lX3QgZGVsdGE7CisgICAgc3RydWN0IHNjaGVkX3VuaXQg
KnVuaXQ7CiAKICAgICByY3VfcmVhZF9sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7CiAKLSAgICBs
b2NrID0gbGlrZWx5KHYgPT0gY3VycmVudCkgPyBOVUxMIDogdW5pdF9zY2hlZHVsZV9sb2NrX2ly
cSh2LT5zY2hlZF91bml0KTsKKyAgICAvKgorICAgICAqIEJlIGNhcmVmdWwgaW4gY2FzZSBvZiBh
biBpZGxlIHZjcHU6IHRoZSBhc3NpZ25tZW50IHRvIGEgdW5pdCBtaWdodAorICAgICAqIGNoYW5n
ZSBldmVuIHdpdGggdGhlIHNjaGVkdWxpbmcgbG9jayBoZWxkLCBzbyBiZSBzdXJlIHRvIHVzZSB0
aGUKKyAgICAgKiBjb3JyZWN0IHVuaXQgZm9yIGxvY2tpbmcgaW4gb3JkZXIgdG8gYXZvaWQgdHJp
Z2dlcmluZyBhbiBBU1NFUlQoKSBpbgorICAgICAqIHRoZSB1bmxvY2sgZnVuY3Rpb24uCisgICAg
ICovCisgICAgdW5pdCA9IGlzX2lkbGVfdmNwdSh2KSA/IGdldF9zY2hlZF9yZXModi0+cHJvY2Vz
c29yKS0+c2NoZWRfdW5pdF9pZGxlCisgICAgICAgICAgICAgICAgICAgICAgICAgICA6IHYtPnNj
aGVkX3VuaXQ7CisgICAgbG9jayA9IGxpa2VseSh2ID09IGN1cnJlbnQpID8gTlVMTCA6IHVuaXRf
c2NoZWR1bGVfbG9ja19pcnEodW5pdCk7CiAgICAgbWVtY3B5KHJ1bnN0YXRlLCAmdi0+cnVuc3Rh
dGUsIHNpemVvZigqcnVuc3RhdGUpKTsKICAgICBkZWx0YSA9IE5PVygpIC0gcnVuc3RhdGUtPnN0
YXRlX2VudHJ5X3RpbWU7CiAgICAgaWYgKCBkZWx0YSA+IDAgKQogICAgICAgICBydW5zdGF0ZS0+
dGltZVtydW5zdGF0ZS0+c3RhdGVdICs9IGRlbHRhOwogCiAgICAgaWYgKCB1bmxpa2VseShsb2Nr
ICE9IE5VTEwpICkKLSAgICAgICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHYtPnNj
aGVkX3VuaXQpOworICAgICAgICB1bml0X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdW5pdCk7
CiAKICAgICByY3VfcmVhZF91bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKIH0KLS0gCjIuMTYu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
