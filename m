Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9277166968
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 10:55:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlrHV-0007AX-Jy; Fri, 12 Jul 2019 08:51:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BMMu=VJ=amazon.de=prvs=0898c1a4e=nmanthey@srs-us1.protection.inumbo.net>)
 id 1hlrHT-0007AS-Rz
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 08:51:52 +0000
X-Inumbo-ID: 4979d536-a482-11e9-8980-bc764e045a96
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4979d536-a482-11e9-8980-bc764e045a96;
 Fri, 12 Jul 2019 08:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1562921510; x=1594457510;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=7pb+lnkoEm4CyIvlMOOJm8ACBE0wTcF2Pmgs2qdkcjU=;
 b=EG7nAto2nw+Vv28QgOl4YKbFhYlYKJeM0pM+fCpfHfBLjnTNBM1dbpNx
 jvQDqnjD/Jq47gGKb97WHLgrbfXIX8aB7yvn7cKra524Waj7DXx8Z3tVV
 YaxxjWQuGkAYG23+Syx48ljLpqQDML0jZxkBXqK7pEh2bPHLVtM58B71q Y=;
X-IronPort-AV: E=Sophos;i="5.62,481,1554768000"; d="scan'208";a="810819081"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 12 Jul 2019 08:51:48 +0000
Received: from EX13MTAUEB001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6127CA18EF; Fri, 12 Jul 2019 08:51:47 +0000 (UTC)
Received: from EX13D08UEB003.ant.amazon.com (10.43.60.11) by
 EX13MTAUEB001.ant.amazon.com (10.43.60.96) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 12 Jul 2019 08:51:46 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D08UEB003.ant.amazon.com (10.43.60.11) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 12 Jul 2019 08:51:46 +0000
Received: from uc1a35a69ae4659.ant.amazon.com (10.28.85.50) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 12 Jul 2019 08:51:44 +0000
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 12 Jul 2019 10:51:40 +0200
Message-ID: <1562921502-20137-1-git-send-email-nmanthey@amazon.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH L1TF MDS GT v3 0/2] grant table protection
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>,
 Bjoern Doebel <doebel@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVhciBhbGwsCgpUaGlzIHBhdGNoIHNlcmllcyBhdHRlbXB0cyB0byBtaXRpZ2F0ZSB0aGUgaXNz
dWUgdGhhdCBoYXZlIGJlZW4gcmFpc2VkIGluIHRoZQpYU0EtMjg5IChodHRwczovL3hlbmJpdHMu
eGVuLm9yZy94c2EvYWR2aXNvcnktMjg5Lmh0bWwpLiBUbyBibG9jayBzcGVjdWxhdGl2ZQpleGVj
dXRpb24gb24gSW50ZWwgaGFyZHdhcmUsIGFuIGxmZW5jZSBpbnN0cnVjdGlvbiBpcyByZXF1aXJl
ZCB0byBtYWtlIHN1cmUKdGhhdCBzZWxlY3RlZCBjaGVja3MgYXJlIG5vdCBieXBhc3NlZC4gU3Bl
Y3VsYXRpdmUgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzIGNhbgpiZSBwcmV2ZW50ZWQgYnkgdXNpbmcg
dGhlIGFycmF5X2luZGV4X25vc3BlYyBtYWNyby4KClRoaXMgc2VyaWVzIHBpY2tzIHVwIHRoZSBs
YXN0IHJlbWFpbmluZyBjb21taXQgb2YgbXkgcHJldmlvdXMgTDFURiBzZXJpZXMsIGFuZApzcGxp
dHMgaXQgaW50byBzZXZlcmFsIGNvbW1pdHMgdG8gaGVscCB0YXJnZXR0aW5nIHRoZSBkaXNjdXNz
aW9uIGJldHRlci4gVGhlCmFjdHVhbCBjaGFuZ2UgaXMgdG8gcHJvdGVjdCBncmFudC10YWJsZSBj
b2RlLgoKVGhpcyBpcyBwYXJ0IG9mIHRoZSBzcGVjdWxhdGl2ZSBoYXJkZW5pbmcgZWZmb3J0LgoK
QmVzdCwKTm9yYmVydAoKTm9yYmVydCBNYW50aGV5ICgyKToKICBjb21tb24vZ3JhbnRfdGFibGU6
IGhhcmRlbiBib3VuZCBhY2Nlc3NlcwogIGNvbW1vbi9ncmFudF90YWJsZTogaGFyZGVuIHZlcnNp
b24gZGVwZW5kZW50IGFjY2Vzc2VzCgogeGVuL2NvbW1vbi9ncmFudF90YWJsZS5jIHwgMTA3ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNzUgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCgoKCkFt
YXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3
IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVy
YnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJC
IDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
