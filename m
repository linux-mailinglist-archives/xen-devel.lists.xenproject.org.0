Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA6115FAA3
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2020 00:30:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2kNC-0001QB-Fy; Fri, 14 Feb 2020 23:27:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R0dv=4C=amazon.com=prvs=306f93d76=anchalag@srs-us1.protection.inumbo.net>)
 id 1j2kNA-0001PJ-9J
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 23:27:48 +0000
X-Inumbo-ID: 9bc8dc16-4f81-11ea-ade5-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bc8dc16-4f81-11ea-ade5-bc764e2007e4;
 Fri, 14 Feb 2020 23:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581722868; x=1613258868;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=w2YudPijii+dzE2cW4maD6E6FQY1WRpU8HmwPnvoM5k=;
 b=HeiQn5cAUKdo/Y8RuhOHqDEZH/v12wrXQksyYEHFTEAbCde5MvR6vMxF
 mgpG4CkNfjV/OsS9mQpYSUy9jV66GBOe6LMIBtqfSqj5xyyZ2akD1TVCQ
 VWc7kLSoodXxcF9X2jXfeYV3LcIvBcc0q9Tq4GascjHVH4ySR0eXH4Er5 k=;
IronPort-SDR: 4QzLk7agU2cCkHMRbCkf+yxdh7O3HX/h13ILndMQD5DBXAC5QIGb3xBDBxJz+ZI2EvA/bpTqBv
 mUC+a3+dOYhg==
X-IronPort-AV: E=Sophos;i="5.70,442,1574121600"; d="scan'208";a="26558954"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 14 Feb 2020 23:27:45 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9E2B3C0845; Fri, 14 Feb 2020 23:27:38 +0000 (UTC)
Received: from EX13D08UEB001.ant.amazon.com (10.43.60.245) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:27:25 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D08UEB001.ant.amazon.com (10.43.60.245) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:27:25 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Fri, 14 Feb 2020 23:27:19 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id F07DD4028E; Fri, 14 Feb 2020 23:27:18 +0000 (UTC)
Date: Fri, 14 Feb 2020 23:27:18 +0000
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
Message-ID: <305f20fbf503b637b1a08b7bec543f49271a725a.1581721799.git.anchalag@amazon.com>
References: <cover.1581721799.git.anchalag@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1581721799.git.anchalag@amazon.com>
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
aGFsYWdAYW1hem9uLmNvbT4KLS0tCiBhcmNoL3g4Ni94ZW4vdGltZS5jICAgIHwgMTUgKysrKysr
KysrKysrKy0tCiBhcmNoL3g4Ni94ZW4veGVuLW9wcy5oIHwgIDIgKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMTUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni94ZW4vdGltZS5jIGIvYXJjaC94ODYveGVuL3RpbWUuYwppbmRleCA4Y2Y2MzJkZGE2MDUuLmVl
YjZkM2QyZWFhYiAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL3RpbWUuYworKysgYi9hcmNoL3g4
Ni94ZW4vdGltZS5jCkBAIC0zNzksMTIgKzM3OSwyMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHB2
X3RpbWVfb3BzIHhlbl90aW1lX29wcyBfX2luaXRjb25zdCA9IHsKIHN0YXRpYyBzdHJ1Y3QgcHZj
bG9ja192c3lzY2FsbF90aW1lX2luZm8gKnhlbl9jbG9jayBfX3JlYWRfbW9zdGx5Owogc3RhdGlj
IHU2NCB4ZW5fY2xvY2tfdmFsdWVfc2F2ZWQ7CiAKKy8qVGhpcyBpcyBuZWVkZWQgdG8gbWFpbnRh
aW4gYSBtb25vdG9uaWMgY2xvY2sgdmFsdWUgZHVyaW5nIFBNIGhpYmVybmF0aW9uICovCit2b2lk
IHhlbl9zYXZlX3NjaGVkX2Nsb2NrX29mZnNldCh2b2lkKQoreworCXhlbl9jbG9ja192YWx1ZV9z
YXZlZCA9IHhlbl9jbG9ja3NvdXJjZV9yZWFkKCkgLSB4ZW5fc2NoZWRfY2xvY2tfb2Zmc2V0Owor
fQorCit2b2lkIHhlbl9yZXN0b3JlX3NjaGVkX2Nsb2NrX29mZnNldCh2b2lkKQoreworCXhlbl9z
Y2hlZF9jbG9ja19vZmZzZXQgPSB4ZW5fY2xvY2tzb3VyY2VfcmVhZCgpIC0geGVuX2Nsb2NrX3Zh
bHVlX3NhdmVkOworfQorCiB2b2lkIHhlbl9zYXZlX3RpbWVfbWVtb3J5X2FyZWEodm9pZCkKIHsK
IAlzdHJ1Y3QgdmNwdV9yZWdpc3Rlcl90aW1lX21lbW9yeV9hcmVhIHQ7CiAJaW50IHJldDsKIAot
CXhlbl9jbG9ja192YWx1ZV9zYXZlZCA9IHhlbl9jbG9ja3NvdXJjZV9yZWFkKCkgLSB4ZW5fc2No
ZWRfY2xvY2tfb2Zmc2V0OworCXhlbl9zYXZlX3NjaGVkX2Nsb2NrX29mZnNldCgpOwogCiAJaWYg
KCF4ZW5fY2xvY2spCiAJCXJldHVybjsKQEAgLTQyNiw3ICs0MzcsNyBAQCB2b2lkIHhlbl9yZXN0
b3JlX3RpbWVfbWVtb3J5X2FyZWEodm9pZCkKIG91dDoKIAkvKiBOZWVkIHB2Y2xvY2tfcmVzdW1l
KCkgYmVmb3JlIHVzaW5nIHhlbl9jbG9ja3NvdXJjZV9yZWFkKCkuICovCiAJcHZjbG9ja19yZXN1
bWUoKTsKLQl4ZW5fc2NoZWRfY2xvY2tfb2Zmc2V0ID0geGVuX2Nsb2Nrc291cmNlX3JlYWQoKSAt
IHhlbl9jbG9ja192YWx1ZV9zYXZlZDsKKwl4ZW5fcmVzdG9yZV9zY2hlZF9jbG9ja19vZmZzZXQo
KTsKIH0KIAogc3RhdGljIHZvaWQgeGVuX3NldHVwX3ZzeXNjYWxsX3RpbWVfaW5mbyh2b2lkKQpk
aWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3hlbi1vcHMuaCBiL2FyY2gveDg2L3hlbi94ZW4tb3Bz
LmgKaW5kZXggZDg0YzM1Nzk5NGJkLi45ZjQ5MTI0ZGYwMzMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2
L3hlbi94ZW4tb3BzLmgKKysrIGIvYXJjaC94ODYveGVuL3hlbi1vcHMuaApAQCAtNzIsNiArNzIs
OCBAQCB2b2lkIHhlbl9zYXZlX3RpbWVfbWVtb3J5X2FyZWEodm9pZCk7CiB2b2lkIHhlbl9yZXN0
b3JlX3RpbWVfbWVtb3J5X2FyZWEodm9pZCk7CiB2b2lkIHhlbl9pbml0X3RpbWVfb3BzKHZvaWQp
Owogdm9pZCB4ZW5faHZtX2luaXRfdGltZV9vcHModm9pZCk7Cit2b2lkIHhlbl9zYXZlX3NjaGVk
X2Nsb2NrX29mZnNldCh2b2lkKTsKK3ZvaWQgeGVuX3Jlc3RvcmVfc2NoZWRfY2xvY2tfb2Zmc2V0
KHZvaWQpOwogCiBpcnFyZXR1cm5fdCB4ZW5fZGVidWdfaW50ZXJydXB0KGludCBpcnEsIHZvaWQg
KmRldl9pZCk7CiAKLS0gCjIuMjQuMS5BTVpOCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
