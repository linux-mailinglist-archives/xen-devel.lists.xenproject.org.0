Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8077215FA89
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2020 00:27:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2kJg-0000g7-Js; Fri, 14 Feb 2020 23:24:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R0dv=4C=amazon.com=prvs=306f93d76=anchalag@srs-us1.protection.inumbo.net>)
 id 1j2kJe-0000fy-FU
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 23:24:10 +0000
X-Inumbo-ID: 176d4bbe-4f81-11ea-aa99-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 176d4bbe-4f81-11ea-aa99-bc764e2007e4;
 Fri, 14 Feb 2020 23:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581722646; x=1613258646;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=SCTjmV5xVHiNIjiUIMGTdFjC64fXGAUedyZ2c0jICro=;
 b=IGFdlyIo0ETrBthZOiVLxjWcWKC2q5sAPiaZccgFqz/gM2gyjHHCaYsx
 6241l4lMLapZWyiYuACCBb42ThX2EhBmrbw/Cyr2YSiATD+qWeQOrU9Ya
 ELCw8PSgsiLOi0Cc5ip9qoyXxVkB8x6fJ2EdtaYNhqUUUiu3btWFdYIL5 c=;
IronPort-SDR: JzAKEQFmt4fMrLQTT6W4ifLu5G8na8fKhxKHe4zKqllP8KgJavXvCmP8vOJYIvv5GSVTDYHFGt
 Y6m0eh0Ld8ug==
X-IronPort-AV: E=Sophos;i="5.70,442,1574121600"; d="scan'208";a="26558553"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 14 Feb 2020 23:24:02 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com (Postfix) with ESMTPS
 id 60F9AA2998; Fri, 14 Feb 2020 23:23:55 +0000 (UTC)
Received: from EX13D08UEB002.ant.amazon.com (10.43.60.107) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:23:43 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D08UEB002.ant.amazon.com (10.43.60.107) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:23:43 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Fri, 14 Feb 2020 23:23:42 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 833344028E; Fri, 14 Feb 2020 23:23:42 +0000 (UTC)
Date: Fri, 14 Feb 2020 23:23:42 +0000
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
Message-ID: <8f87ac8101596b27b210697a507b47e3569a96d5.1581721799.git.anchalag@amazon.com>
References: <cover.1581721799.git.anchalag@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1581721799.git.anchalag@amazon.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH v3 03/12] x86/xen: Introduce new function to
 map HYPERVISOR_shared_info on Resume
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

SW50cm9kdWNlIGEgc21hbGwgZnVuY3Rpb24gd2hpY2ggcmUtdXNlcyBzaGFyZWQgcGFnZSdzIFBB
IGFsbG9jYXRlZApkdXJpbmcgZ3Vlc3QgaW5pdGlhbGl6YXRpb24gdGltZSBpbiByZXNlcnZlX3No
YXJlZF9pbmZvKCkgYW5kIG5vdAphbGxvY2F0ZSBuZXcgcGFnZSBkdXJpbmcgcmVzdW1lIGZsb3cu
Ckl0IGFsc28gIGRvZXMgdGhlIG1hcHBpbmcgb2Ygc2hhcmVkX2luZm9fcGFnZSBieSBjYWxsaW5n
Cnhlbl9odm1faW5pdF9zaGFyZWRfaW5mbygpIHRvIHVzZSB0aGUgZnVuY3Rpb24uCgpTaWduZWQt
b2ZmLWJ5OiBBbmNoYWwgQWdhcndhbCA8YW5jaGFsYWdAYW1hem9uLmNvbT4KLS0tCiBhcmNoL3g4
Ni94ZW4vZW5saWdodGVuX2h2bS5jIHwgNyArKysrKysrCiBhcmNoL3g4Ni94ZW4veGVuLW9wcy5o
ICAgICAgIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVu
X2h2bS5jCmluZGV4IGUxMzhmN2RlNTJkMi4uNzViMWVjN2EwZmNkIDEwMDY0NAotLS0gYS9hcmNo
L3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCisrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZt
LmMKQEAgLTI3LDYgKzI3LDEzIEBACiAKIHN0YXRpYyB1bnNpZ25lZCBsb25nIHNoYXJlZF9pbmZv
X3BmbjsKIAordm9pZCB4ZW5faHZtX21hcF9zaGFyZWRfaW5mbyh2b2lkKQoreworCXhlbl9odm1f
aW5pdF9zaGFyZWRfaW5mbygpOworCWlmIChzaGFyZWRfaW5mb19wZm4pCisJCUhZUEVSVklTT1Jf
c2hhcmVkX2luZm8gPSBfX3ZhKFBGTl9QSFlTKHNoYXJlZF9pbmZvX3BmbikpOworfQorCiB2b2lk
IHhlbl9odm1faW5pdF9zaGFyZWRfaW5mbyh2b2lkKQogewogCXN0cnVjdCB4ZW5fYWRkX3RvX3Bo
eXNtYXAgeGF0cDsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi94ZW4tb3BzLmggYi9hcmNoL3g4
Ni94ZW4veGVuLW9wcy5oCmluZGV4IDQ1YTQ0MWMzM2Q2ZC4uZDg0YzM1Nzk5NGJkIDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni94ZW4veGVuLW9wcy5oCisrKyBiL2FyY2gveDg2L3hlbi94ZW4tb3BzLmgK
QEAgLTU2LDYgKzU2LDcgQEAgdm9pZCB4ZW5fZW5hYmxlX3N5c2NhbGwodm9pZCk7CiB2b2lkIHhl
bl92Y3B1X3Jlc3RvcmUodm9pZCk7CiAKIHZvaWQgeGVuX2NhbGxiYWNrX3ZlY3Rvcih2b2lkKTsK
K3ZvaWQgeGVuX2h2bV9tYXBfc2hhcmVkX2luZm8odm9pZCk7CiB2b2lkIHhlbl9odm1faW5pdF9z
aGFyZWRfaW5mbyh2b2lkKTsKIHZvaWQgeGVuX3VucGx1Z19lbXVsYXRlZF9kZXZpY2VzKHZvaWQp
OwogCi0tIAoyLjI0LjEuQU1aTgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
