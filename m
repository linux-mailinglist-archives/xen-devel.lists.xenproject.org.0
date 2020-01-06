Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2223B13126C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 13:58:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioRvu-0002c4-2u; Mon, 06 Jan 2020 12:56:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qyqH=23=amazon.de=prvs=267241f8d=wipawel@srs-us1.protection.inumbo.net>)
 id 1ioRvt-0002bt-8v
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 12:56:33 +0000
X-Inumbo-ID: f6e33db6-3083-11ea-ab01-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6e33db6-3083-11ea-ab01-12813bfff9fa;
 Mon, 06 Jan 2020 12:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1578315393; x=1609851393;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=mjmOd3Fhhp/+5+LbgHhZWvhd9TtBU0ojPc/uIol9plI=;
 b=qZBFLl+3bLwtyKWB4VvW+akEgUNe4vdRVcX51OUQ2Y6OrEfKBMxV/JK9
 bgIlhifDSFVe04q2kXwo+H+MHy/irP1I1Z1oIPOA1eX96VtFN06JAAaf5
 v2HeA0htb2LduD86tRMTjIF+oXY2qNQHWU22Blt9rn2aeYJZfuyU0uaFk s=;
IronPort-SDR: YWBOBcDpG8djRJs9dyqaYs2Ibo6GPVMe/w2dw5/UiRjGPnUJq033h7EtaVXUMicTl3IIT2Ne3W
 6US9/ibP/nqQ==
X-IronPort-AV: E=Sophos;i="5.69,402,1571702400"; d="scan'208";a="11161563"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 06 Jan 2020 12:56:32 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id EA04BC06ED; Mon,  6 Jan 2020 12:56:31 +0000 (UTC)
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 6 Jan 2020 12:56:31 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 6 Jan 2020 12:56:30 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server
 id 15.0.1367.3 via Frontend Transport; Mon, 6 Jan 2020 12:56:28 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 6 Jan 2020 12:56:23 +0000
Message-ID: <20200106125623.97666-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] livepatch: use proper rc variable in
 livepatch_do_action()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rml4IGMmcCBidWcgaW4gdGhlIGxpdmVwYXRjaF9kb19hY3Rpb24oKSBjb2RlIG9mCkxJVkVQQVRD
SF9BQ1RJT05fUkVQTEFDRSBjYXNlLgpUaGUgY29ycmVjdCB2YXJpYWJsZSBoYW5kbGluZyByZXR1
cm4gY29kZSBvZiByZXZlcnQgYWN0aW9uIGlzCm90aGVyLT5yYyBpbiB0aGlzIGNhc2UuCgpDb3Zl
cml0eS1JRDogMTQ1NzQ2NwpGaXhlczogNjA0NzEwNGMzYyAoImxpdmVwYXRjaDogQWRkIHBlci1m
dW5jdGlvbiBhcHBsaWVkL3JldmVydGVkIHN0YXRlIHRyYWNraW5nIG1hcmtlciIpClNpZ25lZC1v
ZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KUmVwb3J0ZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQogeGVuL2Nv
bW1vbi9saXZlcGF0Y2guYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vbGl2ZXBhdGNoLmMgYi94ZW4v
Y29tbW9uL2xpdmVwYXRjaC5jCmluZGV4IDJhOGFiMTM4NzkuLjVjNjdmM2RlNWEgMTAwNjQ0Ci0t
LSBhL3hlbi9jb21tb24vbGl2ZXBhdGNoLmMKKysrIGIveGVuL2NvbW1vbi9saXZlcGF0Y2guYwpA
QCAtMTQ1Niw3ICsxNDU2LDcgQEAgc3RhdGljIHZvaWQgbGl2ZXBhdGNoX2RvX2FjdGlvbih2b2lk
KQogICAgICAgICAgICAgZWxzZQogICAgICAgICAgICAgICAgIG90aGVyLT5yYyA9IHJldmVydF9w
YXlsb2FkKG90aGVyKTsKIAotICAgICAgICAgICAgaWYgKCAhd2FzX2FjdGlvbl9jb25zaXN0ZW50
KG90aGVyLCByYyA/IExJVkVQQVRDSF9GVU5DX0FQUExJRUQgOiBMSVZFUEFUQ0hfRlVOQ19OT1Rf
QVBQTElFRCkgKQorICAgICAgICAgICAgaWYgKCAhd2FzX2FjdGlvbl9jb25zaXN0ZW50KG90aGVy
LCBvdGhlci0+cmMgPyBMSVZFUEFUQ0hfRlVOQ19BUFBMSUVEIDogTElWRVBBVENIX0ZVTkNfTk9U
X0FQUExJRUQpICkKICAgICAgICAgICAgICAgICBwYW5pYygibGl2ZXBhdGNoOiBwYXJ0aWFsbHkg
cmV2ZXJ0ZWQgcGF5bG9hZCAnJXMnIVxuIiwgb3RoZXItPm5hbWUpOwogCiAgICAgICAgICAgICBp
ZiAoIG90aGVyLT5yYyA9PSAwICkKLS0gCjIuMTYuNQoKCgoKQW1hem9uIERldmVsb3BtZW50IENl
bnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNm
dWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MKRWluZ2V0cmFnZW4g
YW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJl
cmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
