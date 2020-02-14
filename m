Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D1615FAA2
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2020 00:30:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2kO3-0001cr-4V; Fri, 14 Feb 2020 23:28:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R0dv=4C=amazon.com=prvs=306f93d76=anchalag@srs-us1.protection.inumbo.net>)
 id 1j2kO1-0001cb-UD
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 23:28:41 +0000
X-Inumbo-ID: b947132a-4f81-11ea-bb5b-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b947132a-4f81-11ea-bb5b-12813bfff9fa;
 Fri, 14 Feb 2020 23:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581722917; x=1613258917;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=XFd2LTl25ne3kMWrL/YPna7uVttvsKNxoFQR8TCvE9E=;
 b=m0a62/lKKLCqMlQYPcsCumDyvtuTauNQVD6L5UwkutcOiVZvd078XFM8
 DlDNWxn5Xvj1kG7gqOKOJNpPw3+ZVsKfayPQd8MhIHUb68E8Jh42wok7P
 HOkZIEbFOF/8UjAerb3YePdKAakmk+Ikxw7g+Qo/HpVw3ZFOFQtqklxMz w=;
IronPort-SDR: Uq4xL82dqRbjGX7NdFvnD6eSDrEZWhgkJv2ITzh9uXV0XvYsU1YnSahYNjBZ0qyDvhYKBxVhJc
 Teid1lqAMnhQ==
X-IronPort-AV: E=Sophos;i="5.70,442,1574121600"; d="scan'208";a="26559030"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 14 Feb 2020 23:28:35 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3AFE1A23FF; Fri, 14 Feb 2020 23:28:27 +0000 (UTC)
Received: from EX13D08UEB002.ant.amazon.com (10.43.60.107) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:28:07 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D08UEB002.ant.amazon.com (10.43.60.107) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:28:07 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP
 Server id 15.0.1236.3 via Frontend Transport; Fri, 14 Feb 2020 23:28:07 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 500DF4028E; Fri, 14 Feb 2020 23:28:07 +0000 (UTC)
Date: Fri, 14 Feb 2020 23:28:07 +0000
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
Message-ID: <4659d20be8f27e40ef39adfa06b0c759c2d6cd78.1581721799.git.anchalag@amazon.com>
References: <cover.1581721799.git.anchalag@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1581721799.git.anchalag@amazon.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH v3 12/12] PM / hibernate: update the resume
 offset on SNAPSHOT_SET_SWAP_AREA
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

RnJvbTogQWxla3NlaSBCZXNvZ29ub3YgPGN5YmVyYXhAYW1hem9uLmNvbT4KClRoZSBTTkFQU0hP
VF9TRVRfU1dBUF9BUkVBIGlzIHN1cHBvc2VkIHRvIGJlIHVzZWQgdG8gc2V0IHRoZSBoaWJlcm5h
dGlvbgpvZmZzZXQgb24gYSBydW5uaW5nIGtlcm5lbCB0byBlbmFibGUgaGliZXJuYXRpbmcgdG8g
YSBzd2FwIGZpbGUuCkhvd2V2ZXIsIGl0IGRvZXNuJ3QgYWN0dWFsbHkgdXBkYXRlIHRoZSBzd3N1
c3BfcmVzdW1lX2Jsb2NrIHZhcmlhYmxlLiBBcwphIHJlc3VsdCwgdGhlIGhpYmVybmF0aW9uIGZh
aWxzIGF0IHRoZSBsYXN0IHN0ZXAgKGFmdGVyIGFsbCB0aGUgZGF0YSBpcwp3cml0dGVuIG91dCkg
aW4gdGhlIHZhbGlkYXRpb24gb2YgdGhlIHN3YXAgc2lnbmF0dXJlIGluCm1hcmtfc3dhcGZpbGVz
KCkuCgpCZWZvcmUgdGhpcyBwYXRjaCwgdGhlIGNvbW1hbmQgbGluZSBwcm9jZXNzaW5nIHdhcyB0
aGUgb25seSBwbGFjZSB3aGVyZQpzd3N1c3BfcmVzdW1lX2Jsb2NrIHdhcyBzZXQuCgpTaWduZWQt
b2ZmLWJ5OiBBbGVrc2VpIEJlc29nb25vdiA8Y3liZXJheEBhbWF6b24uY29tPgpTaWduZWQtb2Zm
LWJ5OiBNdW5laGlzYSBLYW1hdGEgPGthbWF0YW1AYW1hem9uLmNvbT4KU2lnbmVkLW9mZi1ieTog
QW5jaGFsIEFnYXJ3YWwgPGFuY2hhbGFnQGFtYXpvbi5jb20+Ci0tLQoga2VybmVsL3Bvd2VyL3Vz
ZXIuYyB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEva2VybmVsL3Bvd2VyL3VzZXIuYyBiL2tlcm5lbC9wb3dlci91
c2VyLmMKaW5kZXggNzc0Mzg5NTRjYzJiLi5kMzk2ZTMxM2NiN2IgMTAwNjQ0Ci0tLSBhL2tlcm5l
bC9wb3dlci91c2VyLmMKKysrIGIva2VybmVsL3Bvd2VyL3VzZXIuYwpAQCAtMzc0LDggKzM3NCwx
MiBAQCBzdGF0aWMgbG9uZyBzbmFwc2hvdF9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWdu
ZWQgaW50IGNtZCwKIAkJCWlmIChzd2RldikgewogCQkJCW9mZnNldCA9IHN3YXBfYXJlYS5vZmZz
ZXQ7CiAJCQkJZGF0YS0+c3dhcCA9IHN3YXBfdHlwZV9vZihzd2Rldiwgb2Zmc2V0LCBOVUxMKTsK
LQkJCQlpZiAoZGF0YS0+c3dhcCA8IDApCisJCQkJaWYgKGRhdGEtPnN3YXAgPCAwKSB7CiAJCQkJ
CWVycm9yID0gLUVOT0RFVjsKKwkJCQl9IGVsc2UgeworCQkJCQlzd3N1c3BfcmVzdW1lX2Rldmlj
ZSA9IHN3ZGV2OworCQkJCQlzd3N1c3BfcmVzdW1lX2Jsb2NrID0gb2Zmc2V0OworCQkJCX0KIAkJ
CX0gZWxzZSB7CiAJCQkJZGF0YS0+c3dhcCA9IC0xOwogCQkJCWVycm9yID0gLUVJTlZBTDsKLS0g
CjIuMjQuMS5BTVpOCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
