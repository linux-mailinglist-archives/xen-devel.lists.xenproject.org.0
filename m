Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B7CC8FA5
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:19:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFiFL-0008CP-I7; Wed, 02 Oct 2019 17:17:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aMxB=X3=amazon.com=prvs=17142d732=hongyax@srs-us1.protection.inumbo.net>)
 id 1iFiFJ-0008CK-VA
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 17:17:02 +0000
X-Inumbo-ID: 728e5528-e538-11e9-8628-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id 728e5528-e538-11e9-8628-bc764e2007e4;
 Wed, 02 Oct 2019 17:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1570036621; x=1601572621;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=f6cwDU2ie2s8UVTn9hlExfxVN53hCHOL9mZq5a2tA1c=;
 b=OuRTPhsiT1W5CIrsxaxgZGeggGjKSfeWdVha0x4sIs/ph9dXpnxG9PjD
 SJm84pN71wSJJhDogDWYDEilhBpElZtEljZray0zhDmBc41hEnbdGzI4W
 fAUfKRsx5E1/wKDIJ8gvHGSVKdXEv9gdgjCkj18t2lBopQgKYS6IvSoXm 4=;
X-IronPort-AV: E=Sophos;i="5.67,249,1566864000"; d="scan'208";a="754987207"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 02 Oct 2019 17:16:56 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id 89D87A05E5; Wed,  2 Oct 2019 17:16:56 +0000 (UTC)
Received: from EX13D09UEE002.ant.amazon.com (10.43.62.239) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 2 Oct 2019 17:16:56 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D09UEE002.ant.amazon.com (10.43.62.239) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 2 Oct 2019 17:16:55 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 2 Oct 2019 17:16:55 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 2 Oct 2019 18:16:45 +0100
Message-ID: <cover.1570034362.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 0/9] Add alternative API for Xen PTEs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBiYXRjaCBhZGRzIGFuIGFsdGVybmF0aXZlIGFsbG9jLW1hcC11bm1hcC1mcmVlIFhlbiBQ
VEUgQVBJIHRvIHRoZQpub3JtYWwgYWxsb2MtZnJlZSBvbiB0aGUgeGVuaGVhcCwgaW4gcHJlcGFy
YXRpb24gb2Ygc3dpdGNoaW5nIHRvIGRvbWhlYXAKZm9yIFhlbiBwYWdlIHRhYmxlcy4gU2luY2Ug
bWFwIGFuZCB1bm1hcCBhcmUgYmFzaWNhbGx5IG5vLW9wcyBub3csIGFuZApvdGhlciBjaGFuZ2Vz
IGFyZSBjb3NtZXRpYyB0byBlYXNlIGZ1dHVyZSBwYXRjaGVzLCB0aGlzIGJhdGNoIGRvZXMgbm90
CmludHJvZHVjZSBhbnkgZnVuY3Rpb25hbCBjaGFuZ2VzLgoKdHJlZToKaHR0cHM6Ly94ZW5iaXRz
Lnhlbi5vcmcvZ2l0LWh0dHAvcGVvcGxlL2h4MjQyL3hlbi5naXQgeGVuX3B0ZV9tYXAtdjMKCnYy
OiAKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8y
MDE5LTA5L21zZzAzMjIxLmh0bWwKCi0tLQpDaGFuZ2VkIHNpbmNlIHYyOgotIHNwbGl0IGludG8g
YSBzbWFsbGVyIHNlcmllcwotIGRyb3AgdGhlIGNsZWFyX3BhZ2Ugb3B0aW1pc2F0aW9uIGFzIFdl
aSBzdWdnZXN0cwotIHJlYmFzZQoKQ2hhbmdlZCBzaW5jZSB2MToKLSBzcXVhc2ggc29tZSBjb21t
aXRzCi0gbWVyZ2UgYnVnIGZpeGVzIGludG8gdGhpcyBmaXJzdCBiYXRjaAotIHJlYmFzZSBhZ2Fp
bnN0IGxhdGVzdCBtYXN0ZXIKCldlaSBMaXUgKDkpOgogIHg4NjogbW92ZSBzb21lIHhlbiBtbSBm
dW5jdGlvbiBkZWNsYXJhdGlvbnMKICB4ODY6IGludHJvZHVjZSBhIG5ldyBzZXQgb2YgQVBJcyB0
byBtYW5hZ2UgWGVuIHBhZ2UgdGFibGVzCiAgeDg2L21tOiBpbnRyb2R1Y2UgbHsxLDJ9dCBsb2Nh
bCB2YXJpYWJsZXMgdG8gbWFwX3BhZ2VzX3RvX3hlbgogIHg4Ni9tbTogaW50cm9kdWNlIGx7MSwy
fXQgbG9jYWwgdmFyaWFibGVzIHRvIG1vZGlmeV94ZW5fbWFwcGluZ3MKICB4ODYvbW06IG1hcF9w
YWdlc190b194ZW4gc2hvdWxkIGhhdmUgb25lIGV4aXQgcGF0aAogIHg4Ni9tbTogYWRkIGFuIGVu
ZF9vZl9sb29wIGxhYmVsIGluIG1hcF9wYWdlc190b194ZW4KICB4ODYvbW06IG1ha2Ugc3VyZSB0
aGVyZSBpcyBvbmUgZXhpdCBwYXRoIGZvciBtb2RpZnlfeGVuX21hcHBpbmdzCiAgeDg2L21tOiBh
ZGQgYW4gZW5kX29mX2xvb3AgbGFiZWwgaW4gbW9kaWZ5X3hlbl9tYXBwaW5ncwogIHg4Ni9tbTog
Y2hhbmdlIHBsKmUgdG8gbCp0IGluIHZpcnRfdG9feGVuX2wqZQoKIHhlbi9hcmNoL3g4Ni9tbS5j
ICAgICAgICAgIHwgMzAwICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIHhl
bi9pbmNsdWRlL2FzbS14ODYvbW0uaCAgIHwgIDE2ICsrCiB4ZW4vaW5jbHVkZS9hc20teDg2L3Bh
Z2UuaCB8ICAgNSAtCiAzIGZpbGVzIGNoYW5nZWQsIDIwNiBpbnNlcnRpb25zKCspLCAxMTUgZGVs
ZXRpb25zKC0pCgotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
