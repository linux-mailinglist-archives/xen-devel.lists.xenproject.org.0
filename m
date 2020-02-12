Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C8215B3F3
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 23:38:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j20cJ-0003u6-2Q; Wed, 12 Feb 2020 22:36:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X/s5=4A=amazon.com=prvs=304f9ffca=anchalag@srs-us1.protection.inumbo.net>)
 id 1j20cH-0003to-LB
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 22:36:21 +0000
X-Inumbo-ID: 17afc902-4de8-11ea-b803-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17afc902-4de8-11ea-b803-12813bfff9fa;
 Wed, 12 Feb 2020 22:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581546982; x=1613082982;
 h=date:from:to:subject:message-id:mime-version;
 bh=ZcT5NL3HFOPFbym2IiAARR+k8Y7xo5J+zpygwD2ALWc=;
 b=OBTbLSy3uAILFo/AKR2w77FqbxDrXMS0XsBY6hCNboXUgPEOEGQNiojN
 SCwczM2RxJ+CFTGBy0emzyV8tgXCjP1eSguAFPoShKCMJfUGE4RQM2WHq
 VAWYow1x5lP0lQ1mJ5nFZM2r1AscK5HPOUGEbwBI/HnVOi6pEYW1RWLZv M=;
IronPort-SDR: RuG58dnJ7bK0jmVNwi+pnsRoVw06xDHGaPsu5B6jHAddTjNNYzGJxuu6rUzhRt+WNLOPfopBFM
 6yF3lWoXEQ8Q==
X-IronPort-AV: E=Sophos;i="5.70,434,1574121600"; d="scan'208";a="16854725"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 12 Feb 2020 22:36:22 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 910E62427DA; Wed, 12 Feb 2020 22:36:14 +0000 (UTC)
Received: from EX13D01UWB002.ant.amazon.com (10.43.161.136) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 12 Feb 2020 22:35:52 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13d01UWB002.ant.amazon.com (10.43.161.136) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 12 Feb 2020 22:35:52 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Wed, 12 Feb 2020 22:35:52 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 28812400D1; Wed, 12 Feb 2020 22:35:52 +0000 (UTC)
Date: Wed, 12 Feb 2020 22:35:52 +0000
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
Message-ID: <20200212223552.GA4609@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
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
QW5jaGFsIEFnYXJ3YWwgPGFuY2hhbGFnQGFtYXpvbi5jb20+CgotLS0KICBDaGFuZ2VzIHNpbmNl
IFYyOiBOb25lCi0tLQoga2VybmVsL3Bvd2VyL3VzZXIuYyB8IDYgKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEva2VybmVs
L3Bvd2VyL3VzZXIuYyBiL2tlcm5lbC9wb3dlci91c2VyLmMKaW5kZXggNzc0Mzg5NTRjYzJiLi5k
Mzk2ZTMxM2NiN2IgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9wb3dlci91c2VyLmMKKysrIGIva2VybmVs
L3Bvd2VyL3VzZXIuYwpAQCAtMzc0LDggKzM3NCwxMiBAQCBzdGF0aWMgbG9uZyBzbmFwc2hvdF9p
b2N0bChzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgaW50IGNtZCwKIAkJCWlmIChzd2Rldikg
ewogCQkJCW9mZnNldCA9IHN3YXBfYXJlYS5vZmZzZXQ7CiAJCQkJZGF0YS0+c3dhcCA9IHN3YXBf
dHlwZV9vZihzd2Rldiwgb2Zmc2V0LCBOVUxMKTsKLQkJCQlpZiAoZGF0YS0+c3dhcCA8IDApCisJ
CQkJaWYgKGRhdGEtPnN3YXAgPCAwKSB7CiAJCQkJCWVycm9yID0gLUVOT0RFVjsKKwkJCQl9IGVs
c2UgeworCQkJCQlzd3N1c3BfcmVzdW1lX2RldmljZSA9IHN3ZGV2OworCQkJCQlzd3N1c3BfcmVz
dW1lX2Jsb2NrID0gb2Zmc2V0OworCQkJCX0KIAkJCX0gZWxzZSB7CiAJCQkJZGF0YS0+c3dhcCA9
IC0xOwogCQkJCWVycm9yID0gLUVJTlZBTDsKLS0gCjIuMjQuMS5BTVpOCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
