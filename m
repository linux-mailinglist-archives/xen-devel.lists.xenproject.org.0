Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C56D83263
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 15:11:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huzCK-0003Mq-8E; Tue, 06 Aug 2019 13:08:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1huzCI-0003Mb-6v
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 13:08:14 +0000
X-Inumbo-ID: 3e3c24b5-b84b-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3e3c24b5-b84b-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 13:08:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 74F71B11B;
 Tue,  6 Aug 2019 13:08:11 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5a4d4a61-a543-c657-8458-cbc6b5a8a633@suse.com>
Message-ID: <06b8a3a1-8e24-3b77-2a21-7802f4fb19af@suse.com>
Date: Tue, 6 Aug 2019 15:08:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5a4d4a61-a543-c657-8458-cbc6b5a8a633@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v5 02/10] AMD/IOMMU: drop stray "else"
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGJsYW5rIGxpbmUgYmV0d2VlbiBpdCBhbmQgdGhlIHByaW9yIGlmKCkgY2xlYXJseSBpbmRp
Y2F0ZXMgdGhhdCB0aGlzCndhcyBtZWFudCB0byBiZSBhIHN0YW5kYWxvbmUgaWYoKS4KClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnY1OiBOZXcuCgot
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCisrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMKQEAgLTE2Niw4ICsxNjYs
OCBAQCBzdGF0aWMgaW50IF9faW5pdCBpb3ZfZGV0ZWN0KHZvaWQpCiAgICAgIGlmICggIWlvbW11
X2VuYWJsZSAmJiAhaW9tbXVfaW50cmVtYXAgKQogICAgICAgICAgcmV0dXJuIDA7CiAgCi0gICAg
ZWxzZSBpZiAoIChpbml0X2RvbmUgPyBhbWRfaW9tbXVfaW5pdF9pbnRlcnJ1cHQoKQotICAgICAg
ICAgICAgICAgICAgICAgICAgIDogYW1kX2lvbW11X2luaXQoZmFsc2UpKSAhPSAwICkKKyAgICBp
ZiAoIChpbml0X2RvbmUgPyBhbWRfaW9tbXVfaW5pdF9pbnRlcnJ1cHQoKQorICAgICAgICAgICAg
ICAgICAgICA6IGFtZF9pb21tdV9pbml0KGZhbHNlKSkgIT0gMCApCiAgICAgIHsKICAgICAgICAg
IHByaW50aygiQU1ELVZpOiBFcnJvciBpbml0aWFsaXphdGlvblxuIik7CiAgICAgICAgICByZXR1
cm4gLUVOT0RFVjsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
