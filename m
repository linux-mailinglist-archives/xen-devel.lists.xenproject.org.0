Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 495451846FC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 13:37:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCjW5-0006V6-UM; Fri, 13 Mar 2020 12:34:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AUXq=46=amazon.de=prvs=334f24509=mheyne@srs-us1.protection.inumbo.net>)
 id 1jCjVD-0006Rr-2O
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 12:33:23 +0000
X-Inumbo-ID: d3863e0e-6526-11ea-a6c1-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3863e0e-6526-11ea-a6c1-bc764e2007e4;
 Fri, 13 Mar 2020 12:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1584102803; x=1615638803;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=5w6yNET4XLc0d6Tyypp0pk6fHTRsavc/jAIm25xtAB4=;
 b=wAhqjYG+tsys4hwMuB1q3g/AooUqyKvX1qxXPnkxtv4LQqVLQdhOwdmp
 DNEIQmWaYfp4iM2RNtbfDnWd9wLG0Hf4DsGXE0lpeS4oSuH/K4qxwVmlD
 1YDPETptuB0DmQOKQJXP7p4tAfqUgtUuMBt3o9TNiXg8LQLOecz1KjLrN Q=;
IronPort-SDR: xIke6OkrfRpBn5Kkj9H2IJIuvsFuz7mW59VW7dT/zyxTt52yfWjsdPUf/C4hm5uRT/nNoKWBsp
 z2uCxEtq3xOw==
X-IronPort-AV: E=Sophos;i="5.70,548,1574121600"; d="scan'208";a="31028701"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 13 Mar 2020 12:33:20 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com (Postfix) with ESMTPS
 id 91C8EA2E9B; Fri, 13 Mar 2020 12:33:19 +0000 (UTC)
Received: from EX13D08EUC003.ant.amazon.com (10.43.164.232) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 13 Mar 2020 12:33:19 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D08EUC003.ant.amazon.com (10.43.164.232) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 13 Mar 2020 12:33:18 +0000
Received: from dev-dsk-mheyne-60001.pdx1.corp.amazon.com (10.184.85.242) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 13 Mar 2020 12:33:17 +0000
Received: by dev-dsk-mheyne-60001.pdx1.corp.amazon.com (Postfix,
 from userid 5466572)
 id 3886F222C9; Fri, 13 Mar 2020 12:33:16 +0000 (UTC)
From: Maximilian Heyne <mheyne@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Mar 2020 12:33:13 +0000
Message-ID: <20200313123316.122003-1-mheyne@amazon.de>
X-Mailer: git-send-email 2.16.6
MIME-Version: 1.0
Precedence: Bulk
X-Mailman-Approved-At: Fri, 13 Mar 2020 12:34:16 +0000
Subject: [Xen-devel] [PATCH 0/3] Cleanup IOREQ server on exit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@citrix.com>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rm9sbG93aW5nIHVwIG9uIGNvbW1pdCA5YzBlZWQ2MSAoInFlbXUtdHJhZDogc3RvcCB1c2luZyB0
aGUgZGVmYXVsdCBJT1JFUQpzZXJ2ZXIiKSwgY2xlYW4gdXAgdGhlIElPUkVRIHNlcnZlciBvbiBl
eGl0LiBUaGlzIGZpeGVzIGEgYnVnIHdpdGggc29mdC1yZXNldAp0aGF0IHNob3dzIHVwIGFzICJi
aW5kIGludGVyZG9tYWluIGlvY3RsIGVycm9yIDIyIiBiZWNhdXNlIHRoZSBldmVudCBjaGFubmVs
cwp3ZXJlIG5vdCBjbG9zZWQgYXQgdGhlIHNvZnQtcmVzZXQgYW5kIGNhbid0IGJlIGJvdW5kIGFn
YWluLgoKRm9yIHRoaXMgSSB1c2VkIHRoZSBleGl0IG5vdGlmaWVycyBmcm9tIFFFTVUgdGhhdCBJ
IGJhY2twb3J0ZWQgdG9nZXRoZXIgd2l0aCB0aGUKcmVxdWlyZWQgZ2VuZXJpYyBub3RpZmllciBs
aXN0cy4KCkFudGhvbnkgTGlndW9yaSAoMSk6CiAgQWRkIHN1cHBvcnQgZm9yIGdlbmVyaWMgbm90
aWZpZXIgbGlzdHMKCkdlcmQgSG9mZm1hbm4gKDEpOgogIEFkZCBleGl0IG5vdGlmaWVycy4KCk1h
eGltaWxpYW4gSGV5bmUgKDEpOgogIHhlbjogY2xlYW51cCBJT1JFUSBzZXJ2ZXIgb24gZXhpdAoK
IE1ha2VmaWxlICAgICAgICAgICAgfCAgMSArCiBody94ZW5fbWFjaGluZV9mdi5jIHwgMTEgKysr
KysrKysrKysKIG5vdGlmeS5jICAgICAgICAgICAgfCAzOSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKIG5vdGlmeS5oICAgICAgICAgICAgfCA0MyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBzeXMtcXVldWUuaCAgICAgICAgIHwgIDUg
KysrKysKIHN5c2VtdS5oICAgICAgICAgICAgfCAgNSArKysrKwogdmwuYyAgICAgICAgICAgICAg
ICB8IDIwICsrKysrKysrKysrKysrKysrKysrCiA3IGZpbGVzIGNoYW5nZWQsIDEyNCBpbnNlcnRp
b25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgbm90aWZ5LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBu
b3RpZnkuaAoKLS0gCjIuMTYuNgoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55
IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hy
aXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmlj
aHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6
IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
