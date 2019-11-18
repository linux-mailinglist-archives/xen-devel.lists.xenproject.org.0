Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407E8100A45
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 18:31:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWkp0-0007of-UA; Mon, 18 Nov 2019 17:28:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MHAF=ZK=amazon.de=prvs=218f0b807=wipawel@srs-us1.protection.inumbo.net>)
 id 1iWkp0-0007oa-0V
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 17:28:18 +0000
X-Inumbo-ID: ce29c812-0a28-11ea-a2dc-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce29c812-0a28-11ea-a2dc-12813bfff9fa;
 Mon, 18 Nov 2019 17:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1574098097; x=1605634097;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=l7d0Rxq3xDDLXhf9KcjBpC0z1lqIsYKKUnetedI5zM0=;
 b=JqF4uWvh7bijDBFasLwdcBOYKd+p/7MZgmZhCxL3+NTETcwKODPukJf3
 nIerRctfZIn+QofI6RhI8OXCuUlMTgs6CptLvLUw0+9s+RWZiDWJzG0V/
 aoqfbcDfhUOL1AL/6obg7tR06qkj1RLH2cWDZCvrwe8a/6qraXuN7IQwn M=;
IronPort-SDR: fZ6z/PvOGoOgoMzmC/DDDsOJAy9vN9lzK6XwTY/7Izxga5fZ1VOXxSV5uk1427W+bQPab4Rj2e
 tsP/fIyNLhGA==
X-IronPort-AV: E=Sophos;i="5.68,320,1569283200"; 
   d="scan'208";a="8968016"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 18 Nov 2019 17:28:13 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 80961A2AB6; Mon, 18 Nov 2019 17:28:11 +0000 (UTC)
Received: from EX13D02EUB003.ant.amazon.com (10.43.166.172) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 18 Nov 2019 17:28:10 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D02EUB003.ant.amazon.com (10.43.166.172) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 18 Nov 2019 17:28:09 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Mon, 18 Nov 2019 17:28:09 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Thread-Topic: livepatch-build-tools regression
Thread-Index: AQHVni9ReRquixYoHEOXl3oCOkZoJaeRI0wAgAAGFwCAAAVUAA==
Date: Mon, 18 Nov 2019 17:28:09 +0000
Message-ID: <D092B667-0662-4B8E-958E-02B14530C363@amazon.com>
References: <5ef38d72-3a80-e2ef-68d9-ec498866d4eb@citrix.com>
 <DD847497-6517-4668-9AD6-66F11B91288A@amazon.com>
 <b686f6b2-96e4-6f41-7844-bb0ab184cc71@citrix.com>
In-Reply-To: <b686f6b2-96e4-6f41-7844-bb0ab184cc71@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.193]
Content-ID: <B2A13E39FEDE9248AF42090CA4001F90@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] livepatch-build-tools regression
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Paraschiv, Andra-Irina" <andraprs@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 "Pohlack, 
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 "Manthey, Norbert" <nmanthey@amazon.de>, Martin Mazein <amazein@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>, "Doebel,
 Bjoern" <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDE4LiBOb3YgMjAxOSwgYXQgMTg6MDksIFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFz
bGlAY2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4gT24gMTgvMTEvMjAxOSAxNjo0NywgV2llY3pvcmtp
ZXdpY3osIFBhd2VsIHdyb3RlOgo+PiAKPj4gCj4+PiBPbiAxOC4gTm92IDIwMTksIGF0IDE3OjQy
LCBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gCj4+
PiBIZWxsbywKPj4+IAo+Pj4gVHJ5aW5nIHRvIGJ1aWxkIGEgc2ltcGxlIHZlcnNpb24gb2YgWFNB
LTMwNCBMaXZlLVBhdGNoIGZvciA0LjEzIGdpdmVzCj4+PiB0aGUgZm9sbG93aW5nIGVycm9yIGR1
cmluZyBMUCB1cGxvYWQ6Cj4+PiAKPj4+ICAgKFhFTikgbGl2ZXBhdGNoOiBscDogVW5rbm93biBz
eW1ib2w6IC5MQzcKPj4+IAo+Pj4gQmlzZWN0aW5nIGlkZW50aWZpZWQgdGhlIGZpcnN0IGJhZCBj
b21taXQgYXM6Cj4+PiAKPj4+ICAgY29tbWl0IDg1NGE3Y2E2MGUzNSAiY3JlYXRlLWRpZmYtb2Jq
ZWN0OiBEbyBub3QgaW5jbHVkZSBhbGwgLnJvZGF0YSBzZWN0aW9ucyIKPj4+IAo+Pj4gQmFzZSB2
ZXJzaW9uIG9mIFhlbiB1c2VkIGZvciB0aGlzIGV4cGVyaW1lbnQgaXMgZDEzZGZiMDJhYWZhYgo+
Pj4gVGhlIHBhdGNoIGZpbGUgdXNlZCBmb3IgTFAgaXMgYXR0YWNoZWQuCj4+PiAKPj4+IC0tCj4+
PiBUaGFua3MsCj4+PiBTZXJnZXkKPj4+IDwwMDAxLWxpdmUtcGF0Y2gucGF0Y2g+Cj4+IAo+PiBD
b3VsZCB5b3UgZ2l2ZSB0aGlzIGEgdHJ5Pwo+PiAKPj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wYXRjaC8xMTIyODE5MS8KPj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRj
aC8xMTIyODE4OS8KPiAKPiBVbmZvcnR1bmF0ZWx5LCB0aG9zZSBwYXRjaGVzIGRpZG4ndCByZXNv
bHZlIHRoZSBpc3N1ZSBmb3IgbWUuCj4gCj4gRm9yZ290IHRvIGFkZCwgbXkgZ2NjIHZlcnNpb24g
aXMKPiAKPiAJZ2NjIChVYnVudHUgNy40LjAtMXVidW50dTF+MTguMDQuMSkgNy40LjAKCkNvdWxk
IHlvdSBidWlsZCB0aGUgbHAgd2l0aCBkZWJ1ZyAoLWQpIGFuZCBwcm92aWRlIG1lIHdpdGggdGhl
IGNyZWF0ZS1kaWZmLW9iamVjdC5sb2cgZmlsZT8KCj4gCj4gLS0KPiBUaGFua3MsCj4gU2VyZ2V5
CgpCZXN0IFJlZ2FyZHMsClBhd2VsIFdpZWN6b3JraWV3aWN6CgoKCgoKCkFtYXpvbiBEZXZlbG9w
bWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNj
aGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0
cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNp
dHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
