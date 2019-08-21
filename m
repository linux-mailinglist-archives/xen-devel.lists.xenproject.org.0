Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19817974D4
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:24:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0LsA-0001JZ-0N; Wed, 21 Aug 2019 08:21:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0Ls7-0001FH-8u
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 08:21:35 +0000
X-Inumbo-ID: abc3ae1e-c3ec-11e9-adc2-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id abc3ae1e-c3ec-11e9-adc2-12813bfff9fa;
 Wed, 21 Aug 2019 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375687; x=1597911687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=yjHoo2p+vw3cgZRsjQ4lY3ttQjWxdvrgMGCB7ylyfAU=;
 b=BDgOnt/71FUxWw2bCVF+kJPfczCFG/PLMwK448UAogjs3SDRBKcDwWwg
 zGmyVJSLvPpdwzlZfZz3FXAT5IaJt3cjIOT8PapOC0jMfL3+fA1bqKk7H
 0KunQFfpgNA5O7b7LSpI+byFqzuWemZIP6oqF+q3XKpkCvXkJNPxuJz73 s=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="695968514"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2a-8549039f.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 21 Aug 2019 08:21:26 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-8549039f.us-west-2.amazon.com (Postfix) with ESMTPS
 id 96A51A1BCD; Wed, 21 Aug 2019 08:21:26 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:10 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:09 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:21:08 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 21 Aug 2019 08:20:39 +0000
Message-ID: <20190821082056.91090-4-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821082056.91090-1-wipawel@amazon.de>
References: <20190821082056.91090-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 03/20] livepatch-build: Do not follow every
 symlink for patch file
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wipawel@amazon.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, mpohlack@amazon.com,
 Pawel Wieczorkiewicz <wipawel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gc29tZSBidWlsZCBzeXN0ZW1zIHN5bWxpbmtzIG1pZ2h0IGJlIHVzZWQgZm9yIHBhdGNoIGZp
bGUgbmFtZXMKdG8gcG9pbnQgZnJvbSB0YXJnZXQgZGlyZWN0b3JpZXMgdG8gYWN0dWFsIHBhdGNo
ZXMuIEZvbGxvd2luZyB0aG9zZQpzeW1saW5rcyBicmVha3MgbmFtaW5nIGNvbnZlbnRpb24gYXMg
dGhlIHJlc3VsdGluZyBidWlsdCBtb2R1bGVzCndvdWxkIGJlIG5hbWVkIGFmdGVyIHRoZSBhY3R1
YWwgaGFyZGxpbmsgaW5zdGVhZHMgb2YgdGhlIHN5bWxpbmsuCgpMaXZlcGF0Y2gtYnVpbGQgb2J0
YWlucyBob3RwYXRjaCBuYW1lIGZyb20gdGhlIHBhdGNoIGZpbGUsIHNvIGl0CnNob3VsZCBub3Qg
Y2Fub25pY2FsaXplIHRoZSBmaWxlIHBhdGggcmVzb2x2aW5nIGFsbCB0aGUgc3ltbGlua3MgdG8K
bm90IGxvc2UgdGhlIG9yaWdpbmFsIHN5bWxpbmsgbmFtZS4KClNpZ25lZC1vZmYtYnk6IFBhd2Vs
IFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBQ
b2hsYWNrIDxtcG9obGFja0BhbWF6b24uZGU+ClJldmlld2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxk
b2ViZWxAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBh
bWF6b24uZGU+ClJldmlld2VkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0
cml4LmNvbT4KLS0tCiBsaXZlcGF0Y2gtYnVpbGQgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saXZlcGF0Y2gtYnVp
bGQgYi9saXZlcGF0Y2gtYnVpbGQKaW5kZXggYzA1N2ZhMS4uNzk2ODM4YyAxMDA3NTUKLS0tIGEv
bGl2ZXBhdGNoLWJ1aWxkCisrKyBiL2xpdmVwYXRjaC1idWlsZApAQCAtMjY1LDcgKzI2NSw5IEBA
IGRvbmUKIFsgLXogIiRERVBFTkRTIiBdICYmIGRpZSAiQnVpbGQtaWQgZGVwZW5kZW5jeSBub3Qg
Z2l2ZW4iCiAKIFNSQ0RJUj0iJChyZWFkbGluayAtbSAtLSAiJHNyY2FyZyIpIgotUEFUQ0hGSUxF
PSIkKHJlYWRsaW5rIC1tIC0tICIkcGF0Y2hhcmciKSIKKyMgV2UgbmVlZCBhbiBhYnNvbHV0ZSBw
YXRoIGJlY2F1c2Ugd2UgbW92ZSBhcm91bmQsIGJ1dCB3ZSBuZWVkIHRvCisjIHJldGFpbiB0aGUg
bmFtZSBvZiB0aGUgc3ltbGluayAoPSByZWFscGF0aCAtcykKK1BBVENIRklMRT0iJChyZWFkbGlu
ayAtZiAiJChkaXJuYW1lICIkcGF0Y2hhcmciKSIpLyQoYmFzZW5hbWUgIiRwYXRjaGFyZyIpIgog
Q09ORklHRklMRT0iJChyZWFkbGluayAtbSAtLSAiJGNvbmZpZ2FyZyIpIgogT1VUUFVUPSIkKHJl
YWRsaW5rIC1tIC0tICIkb3V0cHV0YXJnIikiCiAKLS0gCjIuMTYuNQoKCgoKQW1hem9uIERldmVs
b3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdl
c2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5n
ZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIK
U2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
