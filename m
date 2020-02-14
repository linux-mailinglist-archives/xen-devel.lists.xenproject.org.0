Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D5715FA8B
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2020 00:27:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2kKI-0000o1-8E; Fri, 14 Feb 2020 23:24:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R0dv=4C=amazon.com=prvs=306f93d76=anchalag@srs-us1.protection.inumbo.net>)
 id 1j2kKG-0000nq-SN
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 23:24:48 +0000
X-Inumbo-ID: 30c51eca-4f81-11ea-ade5-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30c51eca-4f81-11ea-ade5-bc764e2007e4;
 Fri, 14 Feb 2020 23:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581722688; x=1613258688;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=O4TyplSL+UdPLY/NuUPDprwnMfLeEuUi3w9c5rcDMEE=;
 b=Mgk0Dq1O8Jq52EqeAClb4ctgTMPGRrN41Qi5hucpS+1YlNy3qcH83x7y
 bji9MIg3zxk+pxyD9APV8BvbcaPPUlj5F0DnuoYdWiAbiXGJR685fvpc/
 jpt2mmteyKVUldijdhKZs7dGZhqKnlc/d5q2F/jPyNXH44EkXbKe1XUDB I=;
IronPort-SDR: jucGW3i6+D+Zt1UnEu8igkzhVY7ZncQ6ZmzcjtF2QWs4I5Qu8TXOsW70zoTfaFnk99NzPxn2lB
 9Cxg1E1dRtaQ==
X-IronPort-AV: E=Sophos;i="5.70,442,1574121600"; d="scan'208";a="26558627"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 14 Feb 2020 23:24:45 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com (Postfix) with ESMTPS
 id 15478A2998; Fri, 14 Feb 2020 23:24:38 +0000 (UTC)
Received: from EX13D05UWB003.ant.amazon.com (10.43.161.26) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:24:19 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D05UWB003.ant.amazon.com (10.43.161.26) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:24:18 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Fri, 14 Feb 2020 23:24:18 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id DCDD44028E; Fri, 14 Feb 2020 23:24:18 +0000 (UTC)
Date: Fri, 14 Feb 2020 23:24:18 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
 <linux-pm@vger.kernel.org>, <linux-mm@kvack.org>, <kamatam@amazon.com>,
 <sstabellini@kernel.org>, <konrad.wilk@oracle.com>, <roger.pau@citrix.com>,
 <axboe@kernel.dk>, <davem@davemloft.net>, <rjw@rjwysocki.net>,
 <len.brown@intel.com>, <pavel@ucw.cz>, <peterz@infradead.org>,
 <eduval@amazon.com>, <sblbir@amazon.com>, <anchalag@amazon.com>,
 <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dwmw@amazon.co.uk>, <fllinden@amaozn.com>, <benh@kernel.crashing.org>
Message-ID: <49b41926cf0d2b50a9632d425cd09257853ca73b.1581721799.git.anchalag@amazon.com>
References: <cover.1581721799.git.anchalag@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1581721799.git.anchalag@amazon.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH v3 04/12] x86/xen: add system core suspend
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
KysrCiBpbmNsdWRlL3hlbi94ZW4tb3BzLmggICAgICAgIHwgIDMgKysKIDMgZmlsZXMgY2hhbmdl
ZCwgNTcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5f
aHZtLmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCmluZGV4IDc1YjFlYzdhMGZjZC4u
MTM4ZTcxNzg2ZTAzIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCisr
KyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMKQEAgLTIwNCw2ICsyMDQsNyBAQCBzdGF0
aWMgdm9pZCBfX2luaXQgeGVuX2h2bV9ndWVzdF9pbml0KHZvaWQpCiAJaWYgKHhlbl9mZWF0dXJl
KFhFTkZFQVRfaHZtX2NhbGxiYWNrX3ZlY3RvcikpCiAJCXhlbl9oYXZlX3ZlY3Rvcl9jYWxsYmFj
ayA9IDE7CiAKKwl4ZW5fc2V0dXBfc3lzY29yZV9vcHMoKTsKIAl4ZW5faHZtX3NtcF9pbml0KCk7
CiAJV0FSTl9PTih4ZW5fY3B1aHBfc2V0dXAoeGVuX2NwdV91cF9wcmVwYXJlX2h2bSwgeGVuX2Nw
dV9kZWFkX2h2bSkpOwogCXhlbl91bnBsdWdfZW11bGF0ZWRfZGV2aWNlcygpOwpkaWZmIC0tZ2l0
IGEvYXJjaC94ODYveGVuL3N1c3BlbmQuYyBiL2FyY2gveDg2L3hlbi9zdXNwZW5kLmMKaW5kZXgg
MWQ4MzE1MmM3NjFiLi43ODRjNDQ4NDEwMGIgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9zdXNw
ZW5kLmMKKysrIGIvYXJjaC94ODYveGVuL3N1c3BlbmQuYwpAQCAtMiwxNyArMiwyMiBAQAogI2lu
Y2x1ZGUgPGxpbnV4L3R5cGVzLmg+CiAjaW5jbHVkZSA8bGludXgvdGljay5oPgogI2luY2x1ZGUg
PGxpbnV4L3BlcmNwdS1kZWZzLmg+CisjaW5jbHVkZSA8bGludXgvc3lzY29yZV9vcHMuaD4KKyNp
bmNsdWRlIDxsaW51eC9rZXJuZWxfc3RhdC5oPgogCiAjaW5jbHVkZSA8eGVuL3hlbi5oPgogI2lu
Y2x1ZGUgPHhlbi9pbnRlcmZhY2UveGVuLmg+CisjaW5jbHVkZSA8eGVuL2ludGVyZmFjZS9tZW1v
cnkuaD4KICNpbmNsdWRlIDx4ZW4vZ3JhbnRfdGFibGUuaD4KICNpbmNsdWRlIDx4ZW4vZXZlbnRz
Lmg+CisjaW5jbHVkZSA8eGVuL3hlbi1vcHMuaD4KIAogI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJl
cy5oPgogI2luY2x1ZGUgPGFzbS9tc3ItaW5kZXguaD4KICNpbmNsdWRlIDxhc20veGVuL2h5cGVy
Y2FsbC5oPgogI2luY2x1ZGUgPGFzbS94ZW4vcGFnZS5oPgogI2luY2x1ZGUgPGFzbS9maXhtYXAu
aD4KKyNpbmNsdWRlIDxhc20vcHZjbG9jay5oPgogCiAjaW5jbHVkZSAieGVuLW9wcy5oIgogI2lu
Y2x1ZGUgIm1tdS5oIgpAQCAtODIsMyArODcsNTEgQEAgdm9pZCB4ZW5fYXJjaF9zdXNwZW5kKHZv
aWQpCiAKIAlvbl9lYWNoX2NwdSh4ZW5fdmNwdV9ub3RpZnlfc3VzcGVuZCwgTlVMTCwgMSk7CiB9
CisKK3N0YXRpYyBpbnQgeGVuX3N5c2NvcmVfc3VzcGVuZCh2b2lkKQoreworCXN0cnVjdCB4ZW5f
cmVtb3ZlX2Zyb21fcGh5c21hcCB4cmZwOworCWludCByZXQ7CisKKwkvKiBYZW4gc3VzcGVuZCBk
b2VzIHNpbWlsYXIgc3R1ZmZzIGluIGl0cyBvd24gbG9naWMgKi8KKwlpZiAoeGVuX3N1c3BlbmRf
bW9kZV9pc194ZW5fc3VzcGVuZCgpKQorCQlyZXR1cm4gMDsKKworCXhyZnAuZG9taWQgPSBET01J
RF9TRUxGOworCXhyZnAuZ3BmbiA9IF9fcGEoSFlQRVJWSVNPUl9zaGFyZWRfaW5mbykgPj4gUEFH
RV9TSElGVDsKKworCXJldCA9IEhZUEVSVklTT1JfbWVtb3J5X29wKFhFTk1FTV9yZW1vdmVfZnJv
bV9waHlzbWFwLCAmeHJmcCk7CisJaWYgKCFyZXQpCisJCUhZUEVSVklTT1Jfc2hhcmVkX2luZm8g
PSAmeGVuX2R1bW15X3NoYXJlZF9pbmZvOworCisJcmV0dXJuIHJldDsKK30KKworc3RhdGljIHZv
aWQgeGVuX3N5c2NvcmVfcmVzdW1lKHZvaWQpCit7CisJLyogWGVuIHN1c3BlbmQgZG9lcyBzaW1p
bGFyIHN0dWZmcyBpbiBpdHMgb3duIGxvZ2ljICovCisJaWYgKHhlbl9zdXNwZW5kX21vZGVfaXNf
eGVuX3N1c3BlbmQoKSkKKwkJcmV0dXJuOworCisJLyogTm8gbmVlZCB0byBzZXR1cCB2Y3B1X2lu
Zm8gYXMgaXQncyBhbHJlYWR5IG1vdmVkIG9mZiAqLworCXhlbl9odm1fbWFwX3NoYXJlZF9pbmZv
KCk7CisKKwlwdmNsb2NrX3Jlc3VtZSgpOworCisJZ250dGFiX3Jlc3VtZSgpOworfQorCisvKgor
ICogVGhlc2UgY2FsbGJhY2tzIHdpbGwgYmUgY2FsbGVkIHdpdGggaW50ZXJydXB0cyBkaXNhYmxl
ZCBhbmQgd2hlbiBoYXZpbmcgb25seQorICogb25lIENQVSBvbmxpbmUuCisgKi8KK3N0YXRpYyBz
dHJ1Y3Qgc3lzY29yZV9vcHMgeGVuX2h2bV9zeXNjb3JlX29wcyA9IHsKKwkuc3VzcGVuZCA9IHhl
bl9zeXNjb3JlX3N1c3BlbmQsCisJLnJlc3VtZSA9IHhlbl9zeXNjb3JlX3Jlc3VtZQorfTsKKwor
dm9pZCBfX2luaXQgeGVuX3NldHVwX3N5c2NvcmVfb3BzKHZvaWQpCit7CisJaWYgKHhlbl9odm1f
ZG9tYWluKCkpCisJCXJlZ2lzdGVyX3N5c2NvcmVfb3BzKCZ4ZW5faHZtX3N5c2NvcmVfb3BzKTsK
K30KZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL3hlbi1vcHMuaCBiL2luY2x1ZGUveGVuL3hlbi1v
cHMuaAppbmRleCA2YzM2ZTE2MWRmZDEuLjNiMzk5MmI1YjBjMiAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS94ZW4veGVuLW9wcy5oCisrKyBiL2luY2x1ZGUveGVuL3hlbi1vcHMuaApAQCAtNDMsNiArNDMs
OSBAQCBpbnQgeGVuX3NldHVwX3NodXRkb3duX2V2ZW50KHZvaWQpOwogYm9vbCB4ZW5fc3VzcGVu
ZF9tb2RlX2lzX3hlbl9zdXNwZW5kKHZvaWQpOwogYm9vbCB4ZW5fc3VzcGVuZF9tb2RlX2lzX3Bt
X3N1c3BlbmQodm9pZCk7CiBib29sIHhlbl9zdXNwZW5kX21vZGVfaXNfcG1faGliZXJuYXRpb24o
dm9pZCk7CisKK3ZvaWQgeGVuX3NldHVwX3N5c2NvcmVfb3BzKHZvaWQpOworCiBleHRlcm4gdW5z
aWduZWQgbG9uZyAqeGVuX2NvbnRpZ3VvdXNfYml0bWFwOwogCiAjaWYgZGVmaW5lZChDT05GSUdf
WEVOX1BWKSB8fCBkZWZpbmVkKENPTkZJR19BUk0pIHx8IGRlZmluZWQoQ09ORklHX0FSTTY0KQot
LSAKMi4yNC4xLkFNWk4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
