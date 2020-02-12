Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C3915B3F6
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 23:38:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j20br-0003pO-Nd; Wed, 12 Feb 2020 22:35:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X/s5=4A=amazon.com=prvs=304f9ffca=anchalag@srs-us1.protection.inumbo.net>)
 id 1j20bq-0003pG-Up
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 22:35:54 +0000
X-Inumbo-ID: 074fd0de-4de8-11ea-ade5-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 074fd0de-4de8-11ea-ade5-bc764e2007e4;
 Wed, 12 Feb 2020 22:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581546955; x=1613082955;
 h=date:from:to:subject:message-id:mime-version;
 bh=mAb4SIbaoDODH4/U698l6fYXrmrb6YPbZDM+uvQY0QE=;
 b=dYBs4+jWyzjf9ISxcH7ojMF0wcwg1l5kzBcXuwRdiF4PKCp/+5rIgfKP
 92fw6jWC2LBcyBkKDR6ON729UoBECCCmpaN7/57DuyHel++pl7Ox8eJsj
 D6f59hNqpzT3RdsXx4bMqGKvD6k3awXEHwFoiXUcR6e1X8sv90SIpobsC 8=;
IronPort-SDR: 1TWmY1HVjrLqoQ7uteZMkEOTJhXdjkOW3b8fpdoEoaiYwZhT6a8l//IPpK5Y8YqgCdgDuPuJ93
 Y1bbRTNghAjA==
X-IronPort-AV: E=Sophos;i="5.70,434,1574121600"; d="scan'208";a="26089661"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-807d4a99.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 12 Feb 2020 22:35:52 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-807d4a99.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8A1EBA1D80; Wed, 12 Feb 2020 22:35:44 +0000 (UTC)
Received: from EX13D08UEB001.ant.amazon.com (10.43.60.245) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 12 Feb 2020 22:35:19 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D08UEB001.ant.amazon.com (10.43.60.245) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 12 Feb 2020 22:35:19 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Wed, 12 Feb 2020 22:35:19 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 4B461400D1; Wed, 12 Feb 2020 22:35:19 +0000 (UTC)
Date: Wed, 12 Feb 2020 22:35:19 +0000
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
Message-ID: <20200212223519.GA4483@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Q2hhbmdlcyBTaW5jZSBWMjoKICogTmV3IHBhdGNoIHRvIHVwZGF0ZSBzY2hlZCBjbG9jayBvZmZz
ZXQgZHVyaW5nIGhpYmVybmF0aW9uIHRvIGF2b2lkCiAgIGh1bmd1cHMgZHVyaW5nIHJlc3VtZSB3
aGVuIHJ1bm5pbmcgYSBDUFUgaW50ZW5zaXZlIHdvcmtsb2FkCi0tLQogYXJjaC94ODYveGVuL3N1
c3BlbmQuYyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vc3VzcGVuZC5jIGIvYXJjaC94ODYveGVuL3N1c3BlbmQu
YwppbmRleCBkYWUwZjc0ZjUzOTAuLjdlNTI3NTk0NDgxMCAxMDA2NDQKLS0tIGEvYXJjaC94ODYv
eGVuL3N1c3BlbmQuYworKysgYi9hcmNoL3g4Ni94ZW4vc3VzcGVuZC5jCkBAIC0xMDUsNiArMTA1
LDggQEAgc3RhdGljIGludCB4ZW5fc3lzY29yZV9zdXNwZW5kKHZvaWQpCiAJCXhlbl9zYXZlX3N0
ZWFsX2Nsb2NrKGNwdSk7CiAJfQogCisJeGVuX3NhdmVfc2NoZWRfY2xvY2tfb2Zmc2V0KCk7CisK
IAl4cmZwLmRvbWlkID0gRE9NSURfU0VMRjsKIAl4cmZwLmdwZm4gPSBfX3BhKEhZUEVSVklTT1Jf
c2hhcmVkX2luZm8pID4+IFBBR0VfU0hJRlQ7CiAKQEAgLTEyNiw2ICsxMjgsMTIgQEAgc3RhdGlj
IHZvaWQgeGVuX3N5c2NvcmVfcmVzdW1lKHZvaWQpCiAKIAlwdmNsb2NrX3Jlc3VtZSgpOwogCisJ
LyoKKwkgKiBSZXN0b3JlIHhlbl9zY2hlZF9jbG9ja19vZmZzZXQgZHVyaW5nIHJlc3VtZSB0byBt
YWludGFpbgorCSAqIG1vbm90b25pYyBjbG9jayB2YWx1ZQorCSAqLworCXhlbl9yZXN0b3JlX3Nj
aGVkX2Nsb2NrX29mZnNldCgpOworCiAJLyogTm9uYm9vdCBDUFVzIHdpbGwgYmUgcmVzdW1lZCB3
aGVuIHRoZXkncmUgYnJvdWdodCB1cCAqLwogCXhlbl9yZXN0b3JlX3N0ZWFsX2Nsb2NrKHNtcF9w
cm9jZXNzb3JfaWQoKSk7CiAKLS0gCjIuMjQuMS5BTVpOCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
