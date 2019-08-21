Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1680297224
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 08:17:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0JtA-0003uY-B9; Wed, 21 Aug 2019 06:14:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9TMJ=WR=wdc.com=prvs=12921afdb=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1i0Jt8-0003uT-5q
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 06:14:30 +0000
X-Inumbo-ID: ee00a6c2-c3da-11e9-ac23-bc764e2007e4
Received: from esa3.hgst.iphmx.com (unknown [216.71.153.141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee00a6c2-c3da-11e9-ac23-bc764e2007e4;
 Wed, 21 Aug 2019 06:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566368068; x=1597904068;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tDUu6OfCZAgiE5vxUUEYM/lctnZ4+mN4P7Ofucvf8cQ=;
 b=UIS+/zsj3dLIDYj3hVm0weckNR8UeVKmQAHGtwZeoEfftE3LhOOjfk30
 R9rdQ+vpnRSJonxpu/Tc/n9JfoRNn/agDkbtxrchZjGdHni6BwctGh22D
 3MV8vEpGwSv+md8b3xl+YbJ9Dq7RKt/aB7fr4bqmWVXhELudBfG17hJnq
 Es5n95m/anVg6bn4BFlYbqec/SmN5Sh7QdLNff/2Awmz1ZvTTEEt7W5vm
 f7yLYrfr8C+d3tNzs94KE6L2kL4+u3JnsIZ52Yn6OXy53Ji6rcSln4mLt
 STgBaiBOLiAVfi/NT2TOZf8dXsI4HonH6Srjburqmg1bX+rveFmM/s4Cl w==;
IronPort-SDR: 2clqy71Snpeu0Pts/D0cRAiIvo5Oj4vx+wSC8NMVzXOkBdRS/5pY5S3wtcuEIm1JkfPs/onBZw
 LYIICj8sc48ht6gIKk14QswwDp/sMT7+DQhq7eHLg6dGByfyaGDiAiUN73gNvMP3fANm3/HLhq
 uczUwZVK4n785Jyi6rKeBkA02IefLkydcGkpOVDUQHJLSowuql4p5tHhmvvKc4Uhe3buR5BV12
 vF4hTM6CL1NSzQzvzKmDV4C3KdukXtdSJjf7zyDYQHn9061P+RIRTawhNMwUy2JlYEJQeRufuE
 Ax0=
X-IronPort-AV: E=Sophos;i="5.64,411,1559491200"; d="scan'208";a="120898325"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2019 14:14:27 +0800
IronPort-SDR: 9GNt5ufBRxZOE9xLcPieFC6mAodbro/zKkBTl2rzQ5aJRH/qqrYyK98sAw/MmI4wLOMF5xsDD/
 yFD1eOKXjevTumcjBquUexhstpdad7+7Cj+a308bzmyJPCVPR8Nc91yx0OHxJvyw7DjSaG9CHv
 8uKfI7XSvOaRw93CYeKfdSQJVISI0mQcpJZO5lqebBb9HAW/b9db5JxCgCHgI1YIk1Xm1jx9gW
 Bwy4SekE70LkDZObRF0KLy04lFKjfqpDIZqcQ7E12rBmzuWjO0Wbu6qMGvUSy+z4T8ooFuVI10
 XSHn14CXmaXGP5zzItT3v16s
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 23:11:48 -0700
IronPort-SDR: ZGZ6fU+fR5RzuuKyQ2BV7Qtj88cD9Ywgd0u1B2kvbxKN/qhuT5iNaowYnD43Mmvlu5PKoVZxFu
 EwuFv5WC4mXRvu1Ot2FMKpU7WEJTvW8+WuLi+qEjPsNYZ7a1WaPn3nzKPMvQTxa+AP6VJ7jrhh
 yDltPRtYNqQZHfK0/qhkoQE7+cYR6iw0FLrIjEhPi7rl5kCUe1BDydqeNMnl4XwqCi6Ihev3Rh
 5960wvlRjEiKwa7McvK8/Zoh2N34Yk0PQUrrYQBNjhsSvbtu2ZY5ExsJRLBEA81+ZpGG/t3gaq
 ce4=
WDCIronportException: Internal
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 Aug 2019 23:14:26 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue, 20 Aug 2019 23:14:14 -0700
Message-Id: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH V5 0/9] block: use right accessor to read
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
ay5naXQuCjIuIEJyYW5jaCA6LSBmb3ItbmV4dC4KCkNoYW5nZXMgZnJvbSBWNDotCgoxLiBBZGp1
c3QgY29kZSBmb3IgbGF0ZXN0IGJyYW5jaC4KCkNoYWl0YW55YSBLdWxrYXJuaSAoOSk6CiAgYmxv
Y2s6IGFkZCBhIGhlbHBlciBmdW5jdGlvbiB0byByZWFkIG5yX3NldGNzCiAgYmxrLXpvbmVkOiB1
cGRhdGUgYmxrZGV2X25yX3pvbmVzKCkgd2l0aCBoZWxwZXIKICBibGstem9uZWQ6IHVwZGF0ZSBi
bGtkZXZfcmVwb3J0X3pvbmUoKSB3aXRoIGhlbHBlcgogIGJsay16b25lZDogdXBkYXRlIGJsa2Rl
dl9yZXNldF96b25lcygpIHdpdGggaGVscGVyCiAgYmNhY2hlOiB1cGRhdGUgY2FjaGVkX2Rldl9p
bml0KCkgd2l0aCBoZWxwZXIKICBmMmZzOiB1c2UgaGVscGVyIGluIGluaXRfYmxrel9pbmZvKCkK
ICBibGt0cmFjZTogdXNlIGhlbHBlciBpbiBibGtfdHJhY2Vfc2V0dXBfbGJhKCkKICB0YXJnZXQv
cHNjc2k6IHVzZSBoZWxwZXIgaW4gcHNjc2lfZ2V0X2Jsb2NrcygpCiAgeGVuL2Jsa2JhY2s6IHVz
ZSBoZWxwZXIgaW4gdmJkX3N6KCkKCiBibG9jay9ibGstem9uZWQuYyAgICAgICAgICAgICAgICAg
IHwgMTIgKysrKysrLS0tLS0tCiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2NvbW1vbi5oIHwg
IDIgKy0KIGRyaXZlcnMvbWQvYmNhY2hlL3N1cGVyLmMgICAgICAgICAgfCAgMiArLQogZHJpdmVy
cy90YXJnZXQvdGFyZ2V0X2NvcmVfcHNjc2kuYyB8ICAyICstCiBmcy9mMmZzL3N1cGVyLmMgICAg
ICAgICAgICAgICAgICAgIHwgIDIgKy0KIGluY2x1ZGUvbGludXgvYmxrZGV2LmggICAgICAgICAg
ICAgfCAgNSArKysrKwoga2VybmVsL3RyYWNlL2Jsa3RyYWNlLmMgICAgICAgICAgICB8ICAyICst
CiA3IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKLS0g
CjIuMTcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
