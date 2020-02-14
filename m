Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF56B15FA8F
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2020 00:29:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2kME-0001ET-Qo; Fri, 14 Feb 2020 23:26:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R0dv=4C=amazon.com=prvs=306f93d76=anchalag@srs-us1.protection.inumbo.net>)
 id 1j2kMD-0001EI-U9
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 23:26:49 +0000
X-Inumbo-ID: 792ac44e-4f81-11ea-ade5-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 792ac44e-4f81-11ea-ade5-bc764e2007e4;
 Fri, 14 Feb 2020 23:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581722810; x=1613258810;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=UMKkqskcj+uJc+bMo+rVrL+B1mUIrmErlOz9JcigkDg=;
 b=fU9OsAPncRBWHQdBD8R5S6hcTZ13d7rC5lANPWjjUSF3C9FlbpFNV4jE
 2xs1dtXHzIrcyIMKLqbcz9X6ts+LI394h3co4Fw5QsCl9wpTjDukgK46e
 aPcp4rvO/om3rhSo3hiypduvuPzFJ0lWW6+IsQrhVc5eJXSzcVqUciOxV A=;
IronPort-SDR: XLi6hZdvWyf7uNHazz/iulkhBXgI093HQ6dQRzAdNaXJql5DDSrkG+d7cAh5YRJHw6o1DuT9Es
 275DPTN1UEvw==
X-IronPort-AV: E=Sophos;i="5.70,442,1574121600"; d="scan'208";a="16798132"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 14 Feb 2020 23:26:47 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id 46059A272A; Fri, 14 Feb 2020 23:26:39 +0000 (UTC)
Received: from EX13D07UWB004.ant.amazon.com (10.43.161.196) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:26:25 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D07UWB004.ant.amazon.com (10.43.161.196) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:26:25 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Fri, 14 Feb 2020 23:26:24 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 9BC794028E; Fri, 14 Feb 2020 23:26:24 +0000 (UTC)
Date: Fri, 14 Feb 2020 23:26:24 +0000
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
Message-ID: <489caa869095f77ed8db188d36e858533d7b4d7c.1581721799.git.anchalag@amazon.com>
References: <cover.1581721799.git.anchalag@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1581721799.git.anchalag@amazon.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH v3 08/12] xen/time: introduce xen_{save,
 restore}_steal_clock
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

RnJvbTogTXVuZWhpc2EgS2FtYXRhIDxrYW1hdGFtQGFtYXpvbi5jb20+CgpDdXJyZW50bHksIHN0
ZWFsIHRpbWUgYWNjb3VudGluZyBjb2RlIGluIHNjaGVkdWxlciBleHBlY3RzIHN0ZWFsIGNsb2Nr
CmNhbGxiYWNrIHRvIHByb3ZpZGUgbW9ub3RvbmljYWxseSBpbmNyZWFzaW5nIHZhbHVlLiBJZiB0
aGUgYWNjb3VudGluZwpjb2RlIHJlY2VpdmVzIGEgc21hbGxlciB2YWx1ZSB0aGFuIHByZXZpb3Vz
IG9uZSwgaXQgdXNlcyBhIG5lZ2F0aXZlCnZhbHVlIHRvIGNhbGN1bGF0ZSBzdGVhbCB0aW1lIGFu
ZCByZXN1bHRzIGluIGluY29ycmVjdGx5IHVwZGF0ZWQgaWRsZQphbmQgc3RlYWwgdGltZSBhY2Nv
dW50aW5nLiBUaGlzIGJyZWFrcyB1c2Vyc3BhY2UgdG9vbHMgd2hpY2ggcmVhZAovcHJvYy9zdGF0
LgoKdG9wIC0gMDg6MDU6MzUgdXAgIDI6MTIsICAzIHVzZXJzLCAgbG9hZCBhdmVyYWdlOiAwLjAw
LCAwLjA3LCAwLjIzClRhc2tzOiAgODAgdG90YWwsICAgMSBydW5uaW5nLCAgNzkgc2xlZXBpbmcs
ICAgMCBzdG9wcGVkLCAgIDAgem9tYmllCkNwdShzKTogIDAuMCV1cywgIDAuMCVzeSwgIDAuMCVu
aSwzMDEwMC4wJWlkLCAgMC4wJXdhLCAgMC4wJWhpLCAwLjAlc2ksLTEyNTM4NzQyMDQ2NzIuMCVz
dAoKVGhpcyBjYW4gYWN0dWFsbHkgaGFwcGVuIHdoZW4gYSBYZW4gUFZIVk0gZ3Vlc3QgZ2V0cyBy
ZXN0b3JlZCBmcm9tCmhpYmVybmF0aW9uLCBiZWNhdXNlIHN1Y2ggYSByZXN0b3JlZCBndWVzdCBp
cyBqdXN0IGEgZnJlc2ggZG9tYWluIGZyb20KWGVuIHBlcnNwZWN0aXZlIGFuZCB0aGUgdGltZSBp
bmZvcm1hdGlvbiBpbiBydW5zdGF0ZSBpbmZvIHN0YXJ0cyBvdmVyCmZyb20gc2NyYXRjaC4KClRo
aXMgcGF0Y2ggaW50cm9kdWNlcyB4ZW5fc2F2ZV9zdGVhbF9jbG9jaygpIHdoaWNoIHNhdmVzIGN1
cnJlbnQgdmFsdWVzCmluIHJ1bnN0YXRlIGluZm8gaW50byBwZXItY3B1IHZhcmlhYmxlcy4gSXRz
IGNvdXRlcnBhcnQsCnhlbl9yZXN0b3JlX3N0ZWFsX2Nsb2NrKCksIHNldHMgb2Zmc2V0IGlmIGl0
IGZvdW5kIHRoZSBjdXJyZW50IHZhbHVlcyBpbgpydW5zdGF0ZSBpbmZvIGFyZSBzbWFsbGVyIHRo
YW4gcHJldmlvdXMgb25lcy4geGVuX3N0ZWFsX2Nsb2NrKCkgaXMgYWxzbwptb2RpZmllZCB0byB1
c2UgdGhlIG9mZnNldCB0byBlbnN1cmUgdGhhdCBzY2hlZHVsZXIgb25seSBzZWVzCm1vbm90b25p
Y2FsbHkgaW5jcmVhc2luZyBudW1iZXIuCgpTaWduZWQtb2ZmLWJ5OiBNdW5laGlzYSBLYW1hdGEg
PGthbWF0YW1AYW1hem9uLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5jaGFsIEFnYXJ3YWwgPGFuY2hh
bGFnQGFtYXpvbi5jb20+Ci0tLQogZHJpdmVycy94ZW4vdGltZS5jICAgIHwgMjkgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0KIGluY2x1ZGUveGVuL3hlbi1vcHMuaCB8ICAyICsrCiAyIGZp
bGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3hlbi90aW1lLmMgYi9kcml2ZXJzL3hlbi90aW1lLmMKaW5kZXggMDk2ODg1OWMy
OWQwLi4zNTYwMjIyY2MwZGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3RpbWUuYworKysgYi9k
cml2ZXJzL3hlbi90aW1lLmMKQEAgLTIzLDYgKzIzLDkgQEAgc3RhdGljIERFRklORV9QRVJfQ1BV
KHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8sIHhlbl9ydW5zdGF0ZSk7CiAKIHN0YXRpYyBERUZJ
TkVfUEVSX0NQVSh1NjRbNF0sIG9sZF9ydW5zdGF0ZV90aW1lKTsKIAorc3RhdGljIERFRklORV9Q
RVJfQ1BVKHU2NCwgeGVuX3ByZXZfc3RlYWxfY2xvY2spOworc3RhdGljIERFRklORV9QRVJfQ1BV
KHU2NCwgeGVuX3N0ZWFsX2Nsb2NrX29mZnNldCk7CisKIC8qIHJldHVybiBhbiBjb25zaXN0ZW50
IHNuYXBzaG90IG9mIDY0LWJpdCB0aW1lL2NvdW50ZXIgdmFsdWUgKi8KIHN0YXRpYyB1NjQgZ2V0
NjQoY29uc3QgdTY0ICpwKQogewpAQCAtMTQ5LDcgKzE1Miw3IEBAIGJvb2wgeGVuX3ZjcHVfc3Rv
bGVuKGludCB2Y3B1KQogCXJldHVybiBwZXJfY3B1KHhlbl9ydW5zdGF0ZSwgdmNwdSkuc3RhdGUg
PT0gUlVOU1RBVEVfcnVubmFibGU7CiB9CiAKLXU2NCB4ZW5fc3RlYWxfY2xvY2soaW50IGNwdSkK
K3N0YXRpYyB1NjQgX194ZW5fc3RlYWxfY2xvY2soaW50IGNwdSkKIHsKIAlzdHJ1Y3QgdmNwdV9y
dW5zdGF0ZV9pbmZvIHN0YXRlOwogCkBAIC0xNTcsNiArMTYwLDMwIEBAIHU2NCB4ZW5fc3RlYWxf
Y2xvY2soaW50IGNwdSkKIAlyZXR1cm4gc3RhdGUudGltZVtSVU5TVEFURV9ydW5uYWJsZV0gKyBz
dGF0ZS50aW1lW1JVTlNUQVRFX29mZmxpbmVdOwogfQogCit1NjQgeGVuX3N0ZWFsX2Nsb2NrKGlu
dCBjcHUpCit7CisJcmV0dXJuIF9feGVuX3N0ZWFsX2Nsb2NrKGNwdSkgKyBwZXJfY3B1KHhlbl9z
dGVhbF9jbG9ja19vZmZzZXQsIGNwdSk7Cit9CisKK3ZvaWQgeGVuX3NhdmVfc3RlYWxfY2xvY2so
aW50IGNwdSkKK3sKKwlwZXJfY3B1KHhlbl9wcmV2X3N0ZWFsX2Nsb2NrLCBjcHUpID0geGVuX3N0
ZWFsX2Nsb2NrKGNwdSk7Cit9CisKK3ZvaWQgeGVuX3Jlc3RvcmVfc3RlYWxfY2xvY2soaW50IGNw
dSkKK3sKKwl1NjQgc3RlYWxfY2xvY2sgPSBfX3hlbl9zdGVhbF9jbG9jayhjcHUpOworCisJaWYg
KHBlcl9jcHUoeGVuX3ByZXZfc3RlYWxfY2xvY2ssIGNwdSkgPiBzdGVhbF9jbG9jaykgeworCQkv
KiBOZWVkIHRvIHVwZGF0ZSB0aGUgb2Zmc2V0ICovCisJCXBlcl9jcHUoeGVuX3N0ZWFsX2Nsb2Nr
X29mZnNldCwgY3B1KSA9CisJCSAgICBwZXJfY3B1KHhlbl9wcmV2X3N0ZWFsX2Nsb2NrLCBjcHUp
IC0gc3RlYWxfY2xvY2s7CisJfSBlbHNlIHsKKwkJLyogQXZvaWQgdW5uZWNlc3Nhcnkgc3RlYWwg
Y2xvY2sgd2FycCAqLworCQlwZXJfY3B1KHhlbl9zdGVhbF9jbG9ja19vZmZzZXQsIGNwdSkgPSAw
OworCX0KK30KKwogdm9pZCB4ZW5fc2V0dXBfcnVuc3RhdGVfaW5mbyhpbnQgY3B1KQogewogCXN0
cnVjdCB2Y3B1X3JlZ2lzdGVyX3J1bnN0YXRlX21lbW9yeV9hcmVhIGFyZWE7CmRpZmYgLS1naXQg
YS9pbmNsdWRlL3hlbi94ZW4tb3BzLmggYi9pbmNsdWRlL3hlbi94ZW4tb3BzLmgKaW5kZXggM2Iz
OTkyYjViMGMyLi4xMmIzZjQ0NzRhMDUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUveGVuL3hlbi1vcHMu
aAorKysgYi9pbmNsdWRlL3hlbi94ZW4tb3BzLmgKQEAgLTM3LDYgKzM3LDggQEAgdm9pZCB4ZW5f
dGltZV9zZXR1cF9ndWVzdCh2b2lkKTsKIHZvaWQgeGVuX21hbmFnZV9ydW5zdGF0ZV90aW1lKGlu
dCBhY3Rpb24pOwogdm9pZCB4ZW5fZ2V0X3J1bnN0YXRlX3NuYXBzaG90KHN0cnVjdCB2Y3B1X3J1
bnN0YXRlX2luZm8gKnJlcyk7CiB1NjQgeGVuX3N0ZWFsX2Nsb2NrKGludCBjcHUpOwordm9pZCB4
ZW5fc2F2ZV9zdGVhbF9jbG9jayhpbnQgY3B1KTsKK3ZvaWQgeGVuX3Jlc3RvcmVfc3RlYWxfY2xv
Y2soaW50IGNwdSk7CiAKIGludCB4ZW5fc2V0dXBfc2h1dGRvd25fZXZlbnQodm9pZCk7CiAKLS0g
CjIuMjQuMS5BTVpOCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
