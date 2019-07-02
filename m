Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8BD5D593
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 19:47:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiMpc-0007mO-RJ; Tue, 02 Jul 2019 17:44:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bnvP=U7=wdc.com=prvs=079d4847f=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hiMnk-0007f2-DY
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 17:42:44 +0000
X-Inumbo-ID: c9b7df94-9cf0-11e9-9a18-57bb8326399f
Received: from esa4.hgst.iphmx.com (unknown [216.71.154.42])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9b7df94-9cf0-11e9-9a18-57bb8326399f;
 Tue, 02 Jul 2019 17:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562089361; x=1593625361;
 h=from:to:cc:subject:date:message-id;
 bh=ynTWt0LIGk94WvmkDMsXoNoeMmV+rcyKihqB3+wk4H4=;
 b=rH7HjoJoIacN2xy55cKs4YAjSZPDyhY8IhUdtbCfkwxNz18tehZVQGaK
 r+s9D2Rylqbf81z9udSgSkG53QpHAScuk0+J0F8uKjW/5yr8Qjkpmj6O8
 5YcMejcbkIHVBF+NfvW1IjnDv25WJDa44djkmjrdkk5bS8aS2qf2IbgX0
 RR0hYGN2D8dwrMss43wT6p1kj9HxFKKrJUpcXZCtOVYtjENQLGbi/2oTs
 Ft6valAEHc6QbEdLAEH8vCSxSzaQNPC/Vo96bJIPgMwaF/kplptmvHjMk
 dJj2zz53rX8sSakE9ssRbdsiuNPAYdIlfM9cSHZPlBrR0WrBjDw4Zsggd w==;
IronPort-SDR: 8cFuRhbq70NE7bdnIUFnaGULFuYesuqLZrVO/KMqUarpzWlvYkLzGBFGH5WVQtRUZo3bE5QG+2
 Nvjg+A6tHL6Nmkzt6aa1Y2O1fpu/rrfxP2UV94yANo18kDpmj4G+lLOKL5+kKtatVlht7KiPW3
 4nt1WtmyImmdrnkl+drYjp8dpbsPoD5JfbDBi/FbAtKxvm9WnGnpRTCRbi4XmEuqDS6Ljr2jOd
 0HTSPQeJVKW9uX5Fy9kbMv/F+g4XRqN/iWn0QShpFiEm3Pcz4EpDQXTBlbMoheVs2+2e564lrT
 pEc=
X-IronPort-AV: E=Sophos;i="5.63,444,1557158400"; d="scan'208";a="112068293"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2019 01:42:40 +0800
IronPort-SDR: tRKa9XFOjJ69uqD8OIhIxYtiJ5yc63Oeu1+RrmGXpIEgeubct8e3uWbQDhs1a8iV5S1eLDIAJ9
 j/+/PPWHD3jNKaQwd36R00NPQKj2fcR2xgllnMDQX4AIr4XLOlxieGfHubfx60PYA4Pi/dLafc
 YJrEjzVxjj+hCUPaCyoo7gqNy9VnuvjsFpvT2nopOz3cEgaeLBx9jzwsrtIxCkeLXieMMk24iB
 Eux3dAayuRRnG6eMpuJdSDA4/uRNWEhbg99ooUXBH/uDhbsAPSD7r+q/xSdS1sXR++/rsvhNy1
 YDu0FvDAhIqFjOUEZIzazgWu
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 02 Jul 2019 10:41:38 -0700
IronPort-SDR: xFK+TzJBQTZp/heqygJSJnRPo0tQ9hijWGueFKQDOd4LSg6sKwbpFgF0VvZqkwgjK2yMgs4+Or
 icXs+wEaddgqpAV5uoeT3dSDE9avA4PYEYQ5oQOJjphWIpVSmShDFuVRNWCHRdtW1Yhb1pYnjl
 aAwv+rDoH2vPT1ui3sUjymvCZWJL7whXkR2tb9dx3GoZfwOevSFFE/paM5Yqd4R5A9cUZ/LnHQ
 6Kfo8rEQttUxmYSPyKgtw+OUaPzF/7x2osysgEy3nt5xgnr12RTiIDusa1T36wgh5pGspmUXoZ
 flA=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Jul 2019 10:42:39 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue,  2 Jul 2019 10:42:26 -0700
Message-Id: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Approved-At: Tue, 02 Jul 2019 17:44:39 +0000
Subject: [Xen-devel] [PATCH V3 0/9] block: use right accessor to read
 nr_sects
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
Cc: damien.lemoal@wdc.com, linux-btrace@vger.kernel.org, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, konrad.wilk@oracle.com,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>, yuchao0@huawei.com,
 colyli@suse.de, linux-bcache@vger.kernel.org, jaegeuk@kernel.org,
 xen-devel@lists.xenproject.org, kent.overstreet@gmail.com,
 roger.pau@citrix.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpJbiB0aGUgYmxrLXpvbmVkLCBiY2FjaGUsIGYyZnMsIHRhcmdldC1wc2NzaSwgeGVuIGFu
ZCBibGt0cmFjZQppbXBsZW1lbnRhdGlvbiBibG9jayBkZXZpY2UtPmhkX3BhcnQtPm51bWJlciBv
ZiBzZWN0b3JzIGZpZWxkIGlzCmFjY2Vzc2VkIGRpcmVjdGx5IHdpdGhvdXQgYW55IGFwcHJvcHJp
YXRlIGxvY2tpbmcgb3IgYWNjZXNzb3IgZnVuY3Rpb24uIApUaGVyZSBpcyBhbiBleGlzdGluZyBh
Y2Nlc3NvciBmdW5jdGlvbiBwcmVzZW50IGluIHRoZSBpbiAKaW5jbHVkZS9saW51eC9nZW5oZC5o
IHdoaWNoIHNob3VsZCBiZSB1c2VkIHRvIHJlYWQgdGhlCmJkZXYtPmhkX3BhcnQtPm5yX3NlY3Rz
LgoKRnJvbSAke0tFUk5fRElSfS9pbmNsdWRlL2xpbnV4L2dlbmhkLmg6LQo8c25pcD4KNzE0IC8q
CjcxNSAgKiBBbnkgYWNjZXNzIG9mIHBhcnQtPm5yX3NlY3RzIHdoaWNoIGlzIG5vdCBwcm90ZWN0
ZWQgYnkgcGFydGl0aW9uCjcxNiAgKiBiZF9tdXRleCBvciBnZW5kaXNrIGJkZXYgYmRfbXV0ZXgs
IHNob3VsZCBiZSBkb25lIHVzaW5nIHRoaXMKNzE3ICAqIGFjY2Vzc29yIGZ1bmN0aW9uLgo3MTgg
ICoKNzE5ICAqIENvZGUgd3JpdHRlbiBhbG9uZyB0aGUgbGluZXMgb2YgaV9zaXplX3JlYWQoKSBh
bmQgaV9zaXplX3dyaXRlKCkuCjcyMCAgKiBDT05GSUdfUFJFRU1QVCBjYXNlIG9wdGltaXplcyB0
aGUgY2FzZSBvZiBVUCBrZXJuZWwgd2l0aCBwcmVlbXB0aW9uCjcyMSAgKiBvbi4KNzIyICAqLwo3
MjMgc3RhdGljIGlubGluZSBzZWN0b3JfdCBwYXJ0X25yX3NlY3RzX3JlYWQoc3RydWN0IGhkX3N0
cnVjdCAqcGFydCkKNzI0IHsKPHNuaXA+CgpUaGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2VzIGEg
aGVscGVyIGZ1bmN0aW9uIG9uIHRoZSB0b3Agb2YgdGhlCnBhcnRfbnJfc2VjdHNfcmVhZCgpIGFu
ZCByZW1vdmVzIHRoZSBhbGwgZGlyZWN0IGFjY2Vzc2VzIHRvIHRoZQpiZGV2LT5oZF9wYXJ0LT5u
cl9zZWN0cy4KClRoaXMgc2VyaWVzIGlzIGJhc2VkIG9uIDotCgoxLiBSZXBvIDotCiAgIGdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9heGJvZS9saW51eC1ibG9j
ay5naXQuCjIuIEJyYW5jaCA6LSBmb3ItbmV4dC4KClBsZWFzZSBjb25zaWRlciB0aGlzIGZvciA1
LjMuCgpDaGFuZ2VzIGZyb20gVjI6LQoKMS4gQWRkIHRhcmdldC1wc2NzaSBwYXRjaC4KMi4gR2V0
IHJpZCBvZiBleHRyYSB2YXJpYWJsZSBpbiB0aGUgYmRldl9ucl9zZXRjcygpLgozLiBBZGQgY29t
cGlsZSBvbmx5IHBhdGNoIGZvciB4ZW4vYmxrYmFjay4KCkNoYWl0YW55YSBLdWxrYXJuaSAoOSk6
CiAgYmxvY2s6IGFkZCBhIGhlbHBlciBmdW5jdGlvbiB0byByZWFkIG5yX3NldGNzCiAgYmxrLXpv
bmVkOiB1cGRhdGUgYmxrZGV2X25yX3pvbmVzKCkgd2l0aCBoZWxwZXIKICBibGstem9uZWQ6IHVw
ZGF0ZSBibGtkZXZfcmVwb3J0X3pvbmUoKSB3aXRoIGhlbHBlcgogIGJsay16b25lZDogdXBkYXRl
IGJsa2Rldl9yZXNldF96b25lcygpIHdpdGggaGVscGVyCiAgYmNhY2hlOiB1cGRhdGUgY2FjaGVk
X2Rldl9pbml0KCkgd2l0aCBoZWxwZXIKICBmMmZzOiB1c2UgaGVscGVyIGluIGluaXRfYmxrel9p
bmZvKCkKICBibGt0cmFjZTogdXNlIGhlbHBlciBpbiBibGtfdHJhY2Vfc2V0dXBfbGJhKCkKICB0
YXJnZXQvcHNjc2k6IHVzZSBoZWxwZXIgaW4gcHNjc2lfZ2V0X2Jsb2NrcygpCiAgeGVuL2Jsa2Jh
Y2s6IHVzZSBoZWxwZXIgaW4gdmJkX3N6KCkKCiBibG9jay9ibGstem9uZWQuYyAgICAgICAgICAg
ICAgICAgIHwgMTIgKysrKysrLS0tLS0tCiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2NvbW1v
bi5oIHwgIDIgKy0KIGRyaXZlcnMvbWQvYmNhY2hlL3N1cGVyLmMgICAgICAgICAgfCAgMiArLQog
ZHJpdmVycy90YXJnZXQvdGFyZ2V0X2NvcmVfcHNjc2kuYyB8ICAyICstCiBmcy9mMmZzL3N1cGVy
LmMgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGluY2x1ZGUvbGludXgvYmxrZGV2LmggICAg
ICAgICAgICAgfCAgNiArKysrKysKIGtlcm5lbC90cmFjZS9ibGt0cmFjZS5jICAgICAgICAgICAg
fCAgMiArLQogNyBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMo
LSkKCi0tIAoyLjE5LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
