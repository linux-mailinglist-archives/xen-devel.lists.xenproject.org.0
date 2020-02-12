Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C38F15B3F1
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 23:37:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j20ao-0003e1-CB; Wed, 12 Feb 2020 22:34:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X/s5=4A=amazon.com=prvs=304f9ffca=anchalag@srs-us1.protection.inumbo.net>)
 id 1j20am-0003dh-Fg
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 22:34:48 +0000
X-Inumbo-ID: dfc79236-4de7-11ea-b803-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfc79236-4de7-11ea-b803-12813bfff9fa;
 Wed, 12 Feb 2020 22:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581546888; x=1613082888;
 h=date:from:to:subject:message-id:mime-version;
 bh=tYSU9iIsoDiHOrDtUYIpPVrJzHedrCrd1HEsqWaOGf0=;
 b=tD+1J8/GbJodCU7B5y1Kbz1Bu64/n3fcoZneWvH4rFY7ChaexmiKoAxJ
 rKdflZjgdYrtWXGR4A2BQH/vSMMEAXA2E26PnAKAbBp+1IakhRrcw5G0F
 37FqG1v2wRGviETPJfk4R0MiKIj+dY6/75KopLV/AqoCjbkE98hCYl67X 8=;
IronPort-SDR: bkSrtJsJHpidimijd2L1wIMETSIqwjC5vVxq1oCoMg6L/owqJK4HB0Xj7VHCDOcGTayR5JOFV8
 X4CMSFr17QNw==
X-IronPort-AV: E=Sophos;i="5.70,434,1574121600"; d="scan'208";a="16328108"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 12 Feb 2020 22:34:47 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com (Postfix) with ESMTPS
 id E0121A28F3; Wed, 12 Feb 2020 22:34:45 +0000 (UTC)
Received: from EX13D05UWC001.ant.amazon.com (10.43.162.82) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 12 Feb 2020 22:34:39 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05UWC001.ant.amazon.com (10.43.162.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 12 Feb 2020 22:34:39 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Wed, 12 Feb 2020 22:34:39 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 83531400D1; Wed, 12 Feb 2020 22:34:39 +0000 (UTC)
Date: Wed, 12 Feb 2020 22:34:39 +0000
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
Message-ID: <20200212223439.GA4444@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH v3 10/12] xen: Introduce wrapper for
 save/restore sched clock offset
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

SW50cm9kdWNlIHdyYXBwZXJzIGZvciBzYXZlL3Jlc3RvcmUgeGVuX3NjaGVkX2Nsb2NrX29mZnNl
dCB0byBiZQp1c2VkIGJ5IFBNIGhpYmVybmF0aW9uIGNvZGUgdG8gYXZvaWQgc3lzdGVtIGluc3Rh
YmlsaXR5IGR1cmluZyByZXN1bWUuCgpTaWduZWQtb2ZmLWJ5OiBBbmNoYWwgQWdhcndhbCA8YW5j
aGFsYWdAYW1hem9uLmNvbT4KCi0tLQpDaGFuZ2VzIHNpbmNlIFYyOgoqIERyb3BwZWQgbWFya2lu
ZyB0c2MgdW5zdGFibGUgZHVyaW5nIGhpYmVybmF0aW9uIHBhdGNoCiogRml4ZWQgaXNzdWUgd2l0
aCB4ZW5fc2NoZWRfY2xvY2tfb2Zmc2V0IGR1cmluZyBzdXNwZW5kL3Jlc3VtZQoqIE9uIGZ1cnRo
ZXIgaW50ZXJyb2dhdGlvbiBhbmQgdGVzdGluZywgdGhlIGlzc3VlIHdhc24ndCB3aXRoIHRzYwpi
ZWluZyBzdGFibGUvdW5zdGFibGUKCi0tLQogYXJjaC94ODYveGVuL3RpbWUuYyAgICB8IDE1ICsr
KysrKysrKysrKystLQogYXJjaC94ODYveGVuL3hlbi1vcHMuaCB8ICAyICsrCiAyIGZpbGVzIGNo
YW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYveGVuL3RpbWUuYyBiL2FyY2gveDg2L3hlbi90aW1lLmMKaW5kZXggOGNmNjMyZGRhNjA1
Li5lZWI2ZDNkMmVhYWIgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi90aW1lLmMKKysrIGIvYXJj
aC94ODYveGVuL3RpbWUuYwpAQCAtMzc5LDEyICszNzksMjMgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBwdl90aW1lX29wcyB4ZW5fdGltZV9vcHMgX19pbml0Y29uc3QgPSB7CiBzdGF0aWMgc3RydWN0
IHB2Y2xvY2tfdnN5c2NhbGxfdGltZV9pbmZvICp4ZW5fY2xvY2sgX19yZWFkX21vc3RseTsKIHN0
YXRpYyB1NjQgeGVuX2Nsb2NrX3ZhbHVlX3NhdmVkOwogCisvKlRoaXMgaXMgbmVlZGVkIHRvIG1h
aW50YWluIGEgbW9ub3RvbmljIGNsb2NrIHZhbHVlIGR1cmluZyBQTSBoaWJlcm5hdGlvbiAqLwor
dm9pZCB4ZW5fc2F2ZV9zY2hlZF9jbG9ja19vZmZzZXQodm9pZCkKK3sKKwl4ZW5fY2xvY2tfdmFs
dWVfc2F2ZWQgPSB4ZW5fY2xvY2tzb3VyY2VfcmVhZCgpIC0geGVuX3NjaGVkX2Nsb2NrX29mZnNl
dDsKK30KKwordm9pZCB4ZW5fcmVzdG9yZV9zY2hlZF9jbG9ja19vZmZzZXQodm9pZCkKK3sKKwl4
ZW5fc2NoZWRfY2xvY2tfb2Zmc2V0ID0geGVuX2Nsb2Nrc291cmNlX3JlYWQoKSAtIHhlbl9jbG9j
a192YWx1ZV9zYXZlZDsKK30KKwogdm9pZCB4ZW5fc2F2ZV90aW1lX21lbW9yeV9hcmVhKHZvaWQp
CiB7CiAJc3RydWN0IHZjcHVfcmVnaXN0ZXJfdGltZV9tZW1vcnlfYXJlYSB0OwogCWludCByZXQ7
CiAKLQl4ZW5fY2xvY2tfdmFsdWVfc2F2ZWQgPSB4ZW5fY2xvY2tzb3VyY2VfcmVhZCgpIC0geGVu
X3NjaGVkX2Nsb2NrX29mZnNldDsKKwl4ZW5fc2F2ZV9zY2hlZF9jbG9ja19vZmZzZXQoKTsKIAog
CWlmICgheGVuX2Nsb2NrKQogCQlyZXR1cm47CkBAIC00MjYsNyArNDM3LDcgQEAgdm9pZCB4ZW5f
cmVzdG9yZV90aW1lX21lbW9yeV9hcmVhKHZvaWQpCiBvdXQ6CiAJLyogTmVlZCBwdmNsb2NrX3Jl
c3VtZSgpIGJlZm9yZSB1c2luZyB4ZW5fY2xvY2tzb3VyY2VfcmVhZCgpLiAqLwogCXB2Y2xvY2tf
cmVzdW1lKCk7Ci0JeGVuX3NjaGVkX2Nsb2NrX29mZnNldCA9IHhlbl9jbG9ja3NvdXJjZV9yZWFk
KCkgLSB4ZW5fY2xvY2tfdmFsdWVfc2F2ZWQ7CisJeGVuX3Jlc3RvcmVfc2NoZWRfY2xvY2tfb2Zm
c2V0KCk7CiB9CiAKIHN0YXRpYyB2b2lkIHhlbl9zZXR1cF92c3lzY2FsbF90aW1lX2luZm8odm9p
ZCkKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi94ZW4tb3BzLmggYi9hcmNoL3g4Ni94ZW4veGVu
LW9wcy5oCmluZGV4IGQ4NGMzNTc5OTRiZC4uOWY0OTEyNGRmMDMzIDEwMDY0NAotLS0gYS9hcmNo
L3g4Ni94ZW4veGVuLW9wcy5oCisrKyBiL2FyY2gveDg2L3hlbi94ZW4tb3BzLmgKQEAgLTcyLDYg
KzcyLDggQEAgdm9pZCB4ZW5fc2F2ZV90aW1lX21lbW9yeV9hcmVhKHZvaWQpOwogdm9pZCB4ZW5f
cmVzdG9yZV90aW1lX21lbW9yeV9hcmVhKHZvaWQpOwogdm9pZCB4ZW5faW5pdF90aW1lX29wcyh2
b2lkKTsKIHZvaWQgeGVuX2h2bV9pbml0X3RpbWVfb3BzKHZvaWQpOwordm9pZCB4ZW5fc2F2ZV9z
Y2hlZF9jbG9ja19vZmZzZXQodm9pZCk7Cit2b2lkIHhlbl9yZXN0b3JlX3NjaGVkX2Nsb2NrX29m
ZnNldCh2b2lkKTsKIAogaXJxcmV0dXJuX3QgeGVuX2RlYnVnX2ludGVycnVwdChpbnQgaXJxLCB2
b2lkICpkZXZfaWQpOwogCi0tIAoyLjI0LjEuQU1aTgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
