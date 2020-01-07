Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5A11337B3
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 00:47:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioyXk-0002WH-2X; Tue, 07 Jan 2020 23:45:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wAzM=24=amazon.com=prvs=268257c0c=anchalag@srs-us1.protection.inumbo.net>)
 id 1ioyXi-0002Vz-J0
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 23:45:46 +0000
X-Inumbo-ID: d3539100-31a7-11ea-bf56-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3539100-31a7-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 23:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578440746; x=1609976746;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=NHm42TlJLKDMXwfLCWbPw7bKb/s9QHjU3lyklyyG0cI=;
 b=EI/EFyjfG0QSvSKGZQrLy3ruBsZhASNC7DTJtlviSuSDbYOtly12AUGQ
 5L3IEuk90suW/RQUiQv6N9mwmLK4S7dWb2eM4wtz9BgeV1RR+X92Uapdt
 0vm/LJesemandrsGUNnOTUX7/QroFH52cRO0Wk7RtFPy6OEK0670o9/uO I=;
IronPort-SDR: gkNYw935e97eoztM5ARiz4jflA1dZJd8BbTSLZxwZdbg2Lz2qjmfDCPJWMmvzfDoR8KoPOg4GN
 Ps++MVqJl7vA==
X-IronPort-AV: E=Sophos;i="5.69,407,1571702400"; d="scan'208";a="11408855"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 07 Jan 2020 23:45:46 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id D093FA2715; Tue,  7 Jan 2020 23:45:38 +0000 (UTC)
Received: from EX13D08UEB001.ant.amazon.com (10.43.60.245) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 23:44:58 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D08UEB001.ant.amazon.com (10.43.60.245) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 23:44:57 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Tue, 7 Jan 2020 23:44:57 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 9A92F40E65; Tue,  7 Jan 2020 23:44:57 +0000 (UTC)
Date: Tue, 7 Jan 2020 23:44:57 +0000
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
Message-ID: <20200107234457.GA18829@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH V2 10/11] PM / hibernate: update the resume
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
Cc: anchalag@amazon.com
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
CjIuMTUuMy5BTVpOCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
