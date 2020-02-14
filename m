Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C59E715FAA0
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2020 00:29:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2kNR-0001UI-Pg; Fri, 14 Feb 2020 23:28:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R0dv=4C=amazon.com=prvs=306f93d76=anchalag@srs-us1.protection.inumbo.net>)
 id 1j2kNR-0001U9-3J
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 23:28:05 +0000
X-Inumbo-ID: a62e37a0-4f81-11ea-bc8e-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a62e37a0-4f81-11ea-bc8e-bc764e2007e4;
 Fri, 14 Feb 2020 23:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581722885; x=1613258885;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=r7lbs73sfsvJ86GyRkYhd6/aeNxAVZ1wrAJ3MEWq1QM=;
 b=jwuZcxirIEZ26bG1T0DW23l6tUIYdJZ02NsfadzjyuUp3hCnYVL0IdnP
 XXvnqQyk4TMmN/AbGrArBcqwHKIUO6v4my4d7H0gLcXUJ+iCffI+Uf2Mi
 /GYGXSxMqOJFFR3WBHBDEZQcVdtcyHNR0mpziRwpeLDxju/vkhTvGKQLM k=;
IronPort-SDR: X/XzvIor/0OFWv03EfXx440JHiYbVRPs0/IdGKwx33/R2EoMJmQ5ptVamF7pjfJBRu2Y5e+cqT
 EI7LVBBlt1ZA==
X-IronPort-AV: E=Sophos;i="5.70,442,1574121600"; d="scan'208";a="16391307"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 14 Feb 2020 23:27:53 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2E0C8A28F8; Fri, 14 Feb 2020 23:27:46 +0000 (UTC)
Received: from EX13D05UWC001.ant.amazon.com (10.43.162.82) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:27:29 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05UWC001.ant.amazon.com (10.43.162.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:27:29 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Fri, 14 Feb 2020 23:27:28 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 214814028E; Fri, 14 Feb 2020 23:27:29 +0000 (UTC)
Date: Fri, 14 Feb 2020 23:27:29 +0000
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
Message-ID: <feefc88bca88e910c2860f6fbcb85097c6528cc7.1581721799.git.anchalag@amazon.com>
References: <cover.1581721799.git.anchalag@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1581721799.git.anchalag@amazon.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH v3 11/12] xen: Update sched clock offset to
 avoid system instability in hibernation
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

U2F2ZS9yZXN0b3JlIHhlbl9zY2hlZF9jbG9ja19vZmZzZXQgaW4gc3lzY29yZSBzdXNwZW5kL3Jl
c3VtZSBkdXJpbmcgUE0KaGliZXJuYXRpb24uIENvbW1pdCAnODY3Y2VmYjRjYjEwMTI6ICgieGVu
OiBGaXggeDg2IHNjaGVkX2Nsb2NrKCkgaW50ZXJmYWNlCmZvciB4ZW4iKScgZml4ZXMgeGVuIGd1
ZXN0IHRpbWUgaGFuZGxpbmcgZHVyaW5nIG1pZ3JhdGlvbi4gQSBzaW1pbGFyIGlzc3VlCmlzIHNl
ZW4gZHVyaW5nIFBNIGhpYmVybmF0aW9uIHdoZW4gc3lzdGVtIHJ1bnMgQ1BVIGludGVuc2l2ZSB3
b3JrbG9hZC4KUG9zdCByZXN1bWUgcHZjbG9jayByZXNldHMgdGhlIHZhbHVlIHRvIDAgaG93ZXZl
ciwgeGVuIHNjaGVkX2Nsb2NrX29mZnNldAppcyBuZXZlciB1cGRhdGVkLiBTeXN0ZW0gaW5zdGFi
aWxpdHkgaXMgc2VlbiBkdXJpbmcgcmVzdW1lIGZyb20gaGliZXJuYXRpb24Kd2hlbiBzeXN0ZW0g
aXMgdW5kZXIgaGVhdnkgQ1BVIGxvYWQuIFNpbmNlIHhlbl9zY2hlZF9jbG9ja19vZmZzZXQgaXMg
bm90CnVwZGF0ZWQsIHN5c3RlbSBkb2VzIG5vdCBzZWUgdGhlIG1vbm90b25pYyBjbG9jayB2YWx1
ZSBhbmQgdGhlIHNjaGVkdWxlcgp3b3VsZCB0aGVuIHRoaW5rIHRoYXQgaGVhdnkgQ1BVIGhvZyB0
YXNrcyBuZWVkIG1vcmUgdGltZSBpbiBDUFUsIGNhdXNpbmcKdGhlIHN5c3RlbSB0byBmcmVlemUK
ClNpZ25lZC1vZmYtYnk6IEFuY2hhbCBBZ2Fyd2FsIDxhbmNoYWxhZ0BhbWF6b24uY29tPgotLS0K
IGFyY2gveDg2L3hlbi9zdXNwZW5kLmMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3N1c3BlbmQuYyBiL2FyY2gv
eDg2L3hlbi9zdXNwZW5kLmMKaW5kZXggZGFlMGY3NGY1MzkwLi43ZTUyNzU5NDQ4MTAgMTAwNjQ0
Ci0tLSBhL2FyY2gveDg2L3hlbi9zdXNwZW5kLmMKKysrIGIvYXJjaC94ODYveGVuL3N1c3BlbmQu
YwpAQCAtMTA1LDYgKzEwNSw4IEBAIHN0YXRpYyBpbnQgeGVuX3N5c2NvcmVfc3VzcGVuZCh2b2lk
KQogCQl4ZW5fc2F2ZV9zdGVhbF9jbG9jayhjcHUpOwogCX0KIAorCXhlbl9zYXZlX3NjaGVkX2Ns
b2NrX29mZnNldCgpOworCiAJeHJmcC5kb21pZCA9IERPTUlEX1NFTEY7CiAJeHJmcC5ncGZuID0g
X19wYShIWVBFUlZJU09SX3NoYXJlZF9pbmZvKSA+PiBQQUdFX1NISUZUOwogCkBAIC0xMjYsNiAr
MTI4LDEyIEBAIHN0YXRpYyB2b2lkIHhlbl9zeXNjb3JlX3Jlc3VtZSh2b2lkKQogCiAJcHZjbG9j
a19yZXN1bWUoKTsKIAorCS8qCisJICogUmVzdG9yZSB4ZW5fc2NoZWRfY2xvY2tfb2Zmc2V0IGR1
cmluZyByZXN1bWUgdG8gbWFpbnRhaW4KKwkgKiBtb25vdG9uaWMgY2xvY2sgdmFsdWUKKwkgKi8K
Kwl4ZW5fcmVzdG9yZV9zY2hlZF9jbG9ja19vZmZzZXQoKTsKKwogCS8qIE5vbmJvb3QgQ1BVcyB3
aWxsIGJlIHJlc3VtZWQgd2hlbiB0aGV5J3JlIGJyb3VnaHQgdXAgKi8KIAl4ZW5fcmVzdG9yZV9z
dGVhbF9jbG9jayhzbXBfcHJvY2Vzc29yX2lkKCkpOwogCi0tIAoyLjI0LjEuQU1aTgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
