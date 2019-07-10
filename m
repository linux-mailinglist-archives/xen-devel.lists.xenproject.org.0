Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D13964690
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 14:57:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlC7b-0002sD-68; Wed, 10 Jul 2019 12:54:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dFy6=VH=amazon.de=prvs=087c1bc88=nmanthey@srs-us1.protection.inumbo.net>)
 id 1hlC7Z-0002s8-Pd
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 12:54:53 +0000
X-Inumbo-ID: e725c92a-a311-11e9-8dc3-63f53ce0e9d8
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e725c92a-a311-11e9-8dc3-63f53ce0e9d8;
 Wed, 10 Jul 2019 12:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1562763290; x=1594299290;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=92dFvhKc72/yGtzSEIpZ0FMZb3m+qiaZaY36BC0j5I0=;
 b=P/0p3oRAfvo2uZCW0xqEdLN2U05TZxKo9ETCff8tYwWrXwBdB/VK3NYh
 jpsUVBe3YgyMBX4svIFge5XK+4YsXVuZMWPUWvKyd+cqyp4FIRuNyCH6F
 TMDyjW2gZN4NIUruiPb1QBuMB1VuC7YZT0WoyOt8QSOvbrtTGiYJzHilX 0=;
X-IronPort-AV: E=Sophos;i="5.62,474,1554768000"; d="scan'208";a="810406041"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 10 Jul 2019 12:54:47 +0000
Received: from EX13MTAUEB001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS
 id E7A38A1ED8; Wed, 10 Jul 2019 12:54:43 +0000 (UTC)
Received: from EX13D08UEB004.ant.amazon.com (10.43.60.142) by
 EX13MTAUEB001.ant.amazon.com (10.43.60.96) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 10 Jul 2019 12:54:43 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D08UEB004.ant.amazon.com (10.43.60.142) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 10 Jul 2019 12:54:42 +0000
Received: from uc1a35a69ae4659.ant.amazon.com (10.95.156.35) by
 mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 10 Jul 2019 12:54:39 +0000
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Jul 2019 14:54:35 +0200
Message-ID: <1562763277-11674-1-git-send-email-nmanthey@amazon.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH L1TF MDS GT v2] grant table protection
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
b24gZGVwZW5kZW50IGFjY2Vzc2VzCgogeGVuL2NvbW1vbi9ncmFudF90YWJsZS5jIHwgMTE1ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNzkgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCgoKCkFt
YXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3
IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVy
YnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJC
IDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
