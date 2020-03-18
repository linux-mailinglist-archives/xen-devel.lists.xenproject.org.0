Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9580F18A1A1
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 18:36:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEcYn-0006Rc-Q6; Wed, 18 Mar 2020 17:32:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xbLb=5D=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jEcYm-0006RX-SK
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 17:32:52 +0000
X-Inumbo-ID: 7e1cb080-693e-11ea-bb3a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e1cb080-693e-11ea-bb3a-12813bfff9fa;
 Wed, 18 Mar 2020 17:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1R8tZJcYN4tYZnqAnW3BaOpJQtbMY/9yYaflzyTYuJE=; b=dtNQy8TxkeFh+7l8jHLk3WBSsM
 LpOWWbel6YloxsMfvEuiWcAdk0htrSbL8gOQF6jitSP+hCJf7K3MK+xL/XCw5WF8ssTeH9Vg++rTZ
 qDDd19EZItmZQMdMsQc8KDs24xIG3oVbX45MhUt5tSDzrb9TxxQugbZ2DbTWknc2jR/c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jEcYk-0005UC-In; Wed, 18 Mar 2020 17:32:50 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jEcYk-0007B3-9d; Wed, 18 Mar 2020 17:32:50 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Date: Wed, 18 Mar 2020 17:32:42 +0000
Message-Id: <20200318173243.29183-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318173243.29183-1-paul@xen.org>
References: <20200318173243.29183-1-paul@xen.org>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 2/3] x86 / ioreq: use a MEMF_no_refcount
 allocation for server pages...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKLi4uIG5vdyB0aGF0IGl0
IGlzIHNhZmUgdG8gYXNzaWduIHRoZW0uCgpUaGlzIGF2b2lkcyByZWx5aW5nIG9uIGxpYnhsIChv
ciB3aGF0ZXZlciB0b29sc3RhY2sgaXMgaW4gdXNlKSBzZXR0aW5nCm1heF9wYWdlcyB1cCB3aXRo
IHN1ZmZpY2llbnQgJ3Nsb3AnIHRvIGFsbG93IGFsbCBuZWNlc3NhcnkgaW9yZXEgc2VydmVyCnBh
Z2VzIHRvIGJlIGFsbG9jYXRlZC4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bEB4
ZW4ub3JnPgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0K
Q2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KCnYyOgogLSBOZXcgaW4gdjIKLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgYi94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMK
aW5kZXggMzZmYmJjZjBlYS4uNzBlNjE3ODhkNyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2
bS9pb3JlcS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwpAQCAtMzc2LDcgKzM3Niw3
IEBAIHN0YXRpYyBpbnQgaHZtX2FsbG9jX2lvcmVxX21mbihzdHJ1Y3QgaHZtX2lvcmVxX3NlcnZl
ciAqcywgYm9vbCBidWYpCiAgICAgICAgIHJldHVybiAwOwogICAgIH0KIAotICAgIHBhZ2UgPSBh
bGxvY19kb21oZWFwX3BhZ2Uocy0+dGFyZ2V0LCAwKTsKKyAgICBwYWdlID0gYWxsb2NfZG9taGVh
cF9wYWdlKHMtPnRhcmdldCwgTUVNRl9ub19yZWZjb3VudCk7CiAKICAgICBpZiAoICFwYWdlICkK
ICAgICAgICAgcmV0dXJuIC1FTk9NRU07Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
