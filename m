Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0F3133798
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 00:43:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioyTE-0001rE-QG; Tue, 07 Jan 2020 23:41:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wAzM=24=amazon.com=prvs=268257c0c=anchalag@srs-us1.protection.inumbo.net>)
 id 1ioyTD-0001r6-DK
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 23:41:07 +0000
X-Inumbo-ID: 28030c9a-31a7-11ea-bf56-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28030c9a-31a7-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 23:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578440459; x=1609976459;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=R/ChRdUub8GaU9C55T2reGXH2khOUkoMgXccaQMjyI4=;
 b=SF4dCTB8IsKeN/VdRKwCZ3QjbKruP0lWSOXIsBf2ZozAVK2AARa+Pveu
 Vrd7F2XP+lmaVx5OcJrulV7lrcLvYL1thiRQAfyMVDo/UGJhyAIwjVaWk
 ZiSYeLuRyyxOhjySYbx2pZTYMLOy/ja5Z3f553cqIL2CTRFik0hLL0srP g=;
IronPort-SDR: 5g/iqkzFvYugBmDKt0Glzcp1Q3t/ykf/uYOlIE5v/VAcV7ggyE/V7zO/wgrTEjPikfKPNIr6jw
 N16mKYQ8zZGw==
X-IronPort-AV: E=Sophos;i="5.69,407,1571702400"; d="scan'208";a="11930671"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 07 Jan 2020 23:40:57 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1A4B4A1EE3; Tue,  7 Jan 2020 23:40:55 +0000 (UTC)
Received: from EX13D08UEB002.ant.amazon.com (10.43.60.107) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 23:40:39 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D08UEB002.ant.amazon.com (10.43.60.107) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 23:40:38 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Tue, 7 Jan 2020 23:40:38 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 4B11640E65; Tue,  7 Jan 2020 23:40:38 +0000 (UTC)
Date: Tue, 7 Jan 2020 23:40:38 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
 <linux-pm@vger.kernel.org>, <linux-mm@kvack.org>, <kamatam@amazon.com>,
 <sstabellini@kernel.org>, <konrad.wilk@oracle.co>, <roger.pau@citrix.com>,
 <axboe@kernel.dk>, <davem@davemloft.net>, <rjw@rjwysocki.net>,
 <len.brown@intel.com>, <pavel@ucw.cz>, <peterz@infradead.org>,
 <eduval@amazon.com>, <sblbir@amazon.com>, <anchalag@amazon.com>,
 <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <Woodhouse@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>,
 <dwmw@amazon.co.uk>, <fllinden@amaozn.com>
Message-ID: <20200107234038.GA18296@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH V2 04/11] x86/xen: add system core suspend
 and resume callbacks
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: anchalag@amazon.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTXVuZWhpc2EgS2FtYXRhIDxrYW1hdGFtQGFtYXpvbi5jb20+CgpBZGQgWGVuIFBWSFZN
IHNwZWNpZmljIHN5c3RlbSBjb3JlIGNhbGxiYWNrcyBmb3IgUE0gc3VzcGVuZCBhbmQKaGliZXJu
YXRpb24gc3VwcG9ydC4gVGhlIGNhbGxiYWNrcyBzdXNwZW5kIGFuZCByZXN1bWUgWGVuCnByaW1p
dGl2ZXMsbGlrZSBzaGFyZWRfaW5mbywgcHZjbG9jayBhbmQgZ3JhbnQgdGFibGUuIE5vdGUgdGhh
dApYZW4gc3VzcGVuZCBjYW4gaGFuZGxlIHRoZW0gaW4gYSBkaWZmZXJlbnQgbWFubmVyLCBidXQg
c3lzdGVtCmNvcmUgY2FsbGJhY2tzIGFyZSBjYWxsZWQgZnJvbSB0aGUgY29udGV4dC4gU28gaWYg
dGhlIGNhbGxiYWNrcwphcmUgY2FsbGVkIGZyb20gWGVuIHN1c3BlbmQgY29udGV4dCwgcmV0dXJu
IGltbWVkaWF0ZWx5LgoKU2lnbmVkLW9mZi1ieTogQWdhcndhbCBBbmNoYWwgPGFuY2hhbGFnQGFt
YXpvbi5jb20+ClNpZ25lZC1vZmYtYnk6IE11bmVoaXNhIEthbWF0YSA8a2FtYXRhbUBhbWF6b24u
Y29tPgotLS0KIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgfCAgMSArCiBhcmNoL3g4Ni94
ZW4vc3VzcGVuZC5jICAgICAgIHwgNTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKIGluY2x1ZGUveGVuL3hlbi1vcHMuaCAgICAgICAgfCAgMyArKysKIDMgZmls
ZXMgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9l
bmxpZ2h0ZW5faHZtLmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCmluZGV4IDc1YjFl
YzdhMGZjZC4uMTM4ZTcxNzg2ZTAzIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVu
X2h2bS5jCisrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMKQEAgLTIwNCw2ICsyMDQs
NyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgeGVuX2h2bV9ndWVzdF9pbml0KHZvaWQpCiAJaWYgKHhl
bl9mZWF0dXJlKFhFTkZFQVRfaHZtX2NhbGxiYWNrX3ZlY3RvcikpCiAJCXhlbl9oYXZlX3ZlY3Rv
cl9jYWxsYmFjayA9IDE7CiAKKwl4ZW5fc2V0dXBfc3lzY29yZV9vcHMoKTsKIAl4ZW5faHZtX3Nt
cF9pbml0KCk7CiAJV0FSTl9PTih4ZW5fY3B1aHBfc2V0dXAoeGVuX2NwdV91cF9wcmVwYXJlX2h2
bSwgeGVuX2NwdV9kZWFkX2h2bSkpOwogCXhlbl91bnBsdWdfZW11bGF0ZWRfZGV2aWNlcygpOwpk
aWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3N1c3BlbmQuYyBiL2FyY2gveDg2L3hlbi9zdXNwZW5k
LmMKaW5kZXggMWQ4MzE1MmM3NjFiLi43ODRjNDQ4NDEwMGIgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2
L3hlbi9zdXNwZW5kLmMKKysrIGIvYXJjaC94ODYveGVuL3N1c3BlbmQuYwpAQCAtMiwxNyArMiwy
MiBAQAogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CiAjaW5jbHVkZSA8bGludXgvdGljay5oPgog
I2luY2x1ZGUgPGxpbnV4L3BlcmNwdS1kZWZzLmg+CisjaW5jbHVkZSA8bGludXgvc3lzY29yZV9v
cHMuaD4KKyNpbmNsdWRlIDxsaW51eC9rZXJuZWxfc3RhdC5oPgogCiAjaW5jbHVkZSA8eGVuL3hl
bi5oPgogI2luY2x1ZGUgPHhlbi9pbnRlcmZhY2UveGVuLmg+CisjaW5jbHVkZSA8eGVuL2ludGVy
ZmFjZS9tZW1vcnkuaD4KICNpbmNsdWRlIDx4ZW4vZ3JhbnRfdGFibGUuaD4KICNpbmNsdWRlIDx4
ZW4vZXZlbnRzLmg+CisjaW5jbHVkZSA8eGVuL3hlbi1vcHMuaD4KIAogI2luY2x1ZGUgPGFzbS9j
cHVmZWF0dXJlcy5oPgogI2luY2x1ZGUgPGFzbS9tc3ItaW5kZXguaD4KICNpbmNsdWRlIDxhc20v
eGVuL2h5cGVyY2FsbC5oPgogI2luY2x1ZGUgPGFzbS94ZW4vcGFnZS5oPgogI2luY2x1ZGUgPGFz
bS9maXhtYXAuaD4KKyNpbmNsdWRlIDxhc20vcHZjbG9jay5oPgogCiAjaW5jbHVkZSAieGVuLW9w
cy5oIgogI2luY2x1ZGUgIm1tdS5oIgpAQCAtODIsMyArODcsNTEgQEAgdm9pZCB4ZW5fYXJjaF9z
dXNwZW5kKHZvaWQpCiAKIAlvbl9lYWNoX2NwdSh4ZW5fdmNwdV9ub3RpZnlfc3VzcGVuZCwgTlVM
TCwgMSk7CiB9CisKK3N0YXRpYyBpbnQgeGVuX3N5c2NvcmVfc3VzcGVuZCh2b2lkKQoreworCXN0
cnVjdCB4ZW5fcmVtb3ZlX2Zyb21fcGh5c21hcCB4cmZwOworCWludCByZXQ7CisKKwkvKiBYZW4g
c3VzcGVuZCBkb2VzIHNpbWlsYXIgc3R1ZmZzIGluIGl0cyBvd24gbG9naWMgKi8KKwlpZiAoeGVu
X3N1c3BlbmRfbW9kZV9pc194ZW5fc3VzcGVuZCgpKQorCQlyZXR1cm4gMDsKKworCXhyZnAuZG9t
aWQgPSBET01JRF9TRUxGOworCXhyZnAuZ3BmbiA9IF9fcGEoSFlQRVJWSVNPUl9zaGFyZWRfaW5m
bykgPj4gUEFHRV9TSElGVDsKKworCXJldCA9IEhZUEVSVklTT1JfbWVtb3J5X29wKFhFTk1FTV9y
ZW1vdmVfZnJvbV9waHlzbWFwLCAmeHJmcCk7CisJaWYgKCFyZXQpCisJCUhZUEVSVklTT1Jfc2hh
cmVkX2luZm8gPSAmeGVuX2R1bW15X3NoYXJlZF9pbmZvOworCisJcmV0dXJuIHJldDsKK30KKwor
c3RhdGljIHZvaWQgeGVuX3N5c2NvcmVfcmVzdW1lKHZvaWQpCit7CisJLyogWGVuIHN1c3BlbmQg
ZG9lcyBzaW1pbGFyIHN0dWZmcyBpbiBpdHMgb3duIGxvZ2ljICovCisJaWYgKHhlbl9zdXNwZW5k
X21vZGVfaXNfeGVuX3N1c3BlbmQoKSkKKwkJcmV0dXJuOworCisJLyogTm8gbmVlZCB0byBzZXR1
cCB2Y3B1X2luZm8gYXMgaXQncyBhbHJlYWR5IG1vdmVkIG9mZiAqLworCXhlbl9odm1fbWFwX3No
YXJlZF9pbmZvKCk7CisKKwlwdmNsb2NrX3Jlc3VtZSgpOworCisJZ250dGFiX3Jlc3VtZSgpOwor
fQorCisvKgorICogVGhlc2UgY2FsbGJhY2tzIHdpbGwgYmUgY2FsbGVkIHdpdGggaW50ZXJydXB0
cyBkaXNhYmxlZCBhbmQgd2hlbiBoYXZpbmcgb25seQorICogb25lIENQVSBvbmxpbmUuCisgKi8K
K3N0YXRpYyBzdHJ1Y3Qgc3lzY29yZV9vcHMgeGVuX2h2bV9zeXNjb3JlX29wcyA9IHsKKwkuc3Vz
cGVuZCA9IHhlbl9zeXNjb3JlX3N1c3BlbmQsCisJLnJlc3VtZSA9IHhlbl9zeXNjb3JlX3Jlc3Vt
ZQorfTsKKwordm9pZCBfX2luaXQgeGVuX3NldHVwX3N5c2NvcmVfb3BzKHZvaWQpCit7CisJaWYg
KHhlbl9odm1fZG9tYWluKCkpCisJCXJlZ2lzdGVyX3N5c2NvcmVfb3BzKCZ4ZW5faHZtX3N5c2Nv
cmVfb3BzKTsKK30KZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL3hlbi1vcHMuaCBiL2luY2x1ZGUv
eGVuL3hlbi1vcHMuaAppbmRleCA2YzM2ZTE2MWRmZDEuLjNiMzk5MmI1YjBjMiAxMDA2NDQKLS0t
IGEvaW5jbHVkZS94ZW4veGVuLW9wcy5oCisrKyBiL2luY2x1ZGUveGVuL3hlbi1vcHMuaApAQCAt
NDMsNiArNDMsOSBAQCBpbnQgeGVuX3NldHVwX3NodXRkb3duX2V2ZW50KHZvaWQpOwogYm9vbCB4
ZW5fc3VzcGVuZF9tb2RlX2lzX3hlbl9zdXNwZW5kKHZvaWQpOwogYm9vbCB4ZW5fc3VzcGVuZF9t
b2RlX2lzX3BtX3N1c3BlbmQodm9pZCk7CiBib29sIHhlbl9zdXNwZW5kX21vZGVfaXNfcG1faGli
ZXJuYXRpb24odm9pZCk7CisKK3ZvaWQgeGVuX3NldHVwX3N5c2NvcmVfb3BzKHZvaWQpOworCiBl
eHRlcm4gdW5zaWduZWQgbG9uZyAqeGVuX2NvbnRpZ3VvdXNfYml0bWFwOwogCiAjaWYgZGVmaW5l
ZChDT05GSUdfWEVOX1BWKSB8fCBkZWZpbmVkKENPTkZJR19BUk0pIHx8IGRlZmluZWQoQ09ORklH
X0FSTTY0KQotLSAKMi4xNS4zLkFNWk4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
