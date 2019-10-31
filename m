Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4919DEB392
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 16:12:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQC5A-0006Yd-6y; Thu, 31 Oct 2019 15:09:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=msrb=YY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iQC58-0006XN-Ad
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 15:09:50 +0000
X-Inumbo-ID: 75fbf34a-fbf0-11e9-954c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 75fbf34a-fbf0-11e9-954c-12813bfff9fa;
 Thu, 31 Oct 2019 15:09:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7B76625;
 Thu, 31 Oct 2019 08:09:39 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (unknown [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 085003F71E;
 Thu, 31 Oct 2019 08:09:38 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 31 Oct 2019 15:09:08 +0000
Message-Id: <20191031150922.22938-6-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191031150922.22938-1-julien.grall@arm.com>
References: <20191031150922.22938-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 v4 05/19] xen/arm: traps: Update the
 correct PC when inject a virtual SError to the guest
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
Cc: jgross@suse.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBpbmplY3RpbmcgYSB2aXJ0dWFsIEFib3J0IHRvIHRoZSBndWVzdCwgd2Ugd2FudCB0byB1
cGRhdGUgdGhlIGd1ZXN0ClBDIHNvIGl0IGNhbiByZS1leGVjdXRlIHRoZSBIVkMvU01DIG9uY2Ug
aXQgaGFzIGhhbmRsZWQgdGhlIFNFcnJvci4KClRoaXMgaXMgdW5mb3J0dW5hdGVseSBub3QgdGhl
IGNhc2Ugd2hlbiB0aGUgU0Vycm9yIGlzIHN5bmNocm9uaXplZCBvbgplbnRyeSBmcm9tIHRoZSBn
dWVzdC4gQXMgdGhlIFNFcnJvciB3aWxsIGJlIHJlY2VpdmVkIHdoaWxlIHJ1bm5pbmcgaW4KaHlw
ZXJ2aXNvciBjb250ZXh0LCB3ZSB3aWxsIHVwZGF0ZSB0aGUgUEMgb2YgaHlwZXJ2aXNvciBjb250
ZXh0IChpLmUKdGhlIHRyYXApLgoKUmV3b3JrIGluamVjdF92YWJ0X2V4Y2VwdGlvbiBzbyBpdCB1
c2VzIHRoZSBndWVzdCBjb250ZXh0IHJhdGhlciB0aGFuCnRoZSBjdXJyZW50IG9uZS4KClNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkFja2VkLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgotLS0KClRlY2huaWNh
bGx5LCB1cGRhdGluZyB0aGUgUEMgaXMgb25seSBuZWNlc3Nhcnkgd2hlbiBndWVzdCBTRXJyb3Ig
YXJlCnJlY2VpdmVkIHdoaWxlIHJ1bm5pbmcgaW4gaHlwZXJ2aXNvci4gVGhlIGNvZGUgc2hvdWxk
IGJlIHJld29ya2VkIHRvIGdldAp0aGUgcGF0aCBhIGJpdCBzaW1wbGVyLCBidXQgdGhpcyBpcyBw
b3N0IFhlbiA0LjEzIHdvcmsuCgogICAgQ2hhbmdlcyBpbiB2NDoKICAgICAgICAtIEFkZCBTdGVm
YW5vJ3MgYWNrZWQtYnkKCiAgICBDaGFuZ2VzIGluIHYzOgogICAgICAgIC0gcy92Y3B1X2luZm8v
dmNwdS8KCiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0gQWRkIHBhdGNoCi0tLQogeGVuL2Fy
Y2gvYXJtL3RyYXBzLmMgfCAxNSArKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90
cmFwcy5jIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKaW5kZXggMzI2MjA1MmY0Ny4uMTJjNTJhMzg2
MCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3RyYXBzLmMKKysrIGIveGVuL2FyY2gvYXJtL3Ry
YXBzLmMKQEAgLTYyOSwxMSArNjI5LDE4IEBAIHN0YXRpYyB2b2lkIGluamVjdF9kYWJ0X2V4Y2Vw
dGlvbihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywKICNlbmRpZgogfQogCi0vKiBJbmplY3Qg
YSB2aXJ0dWFsIEFib3J0L1NFcnJvciBpbnRvIHRoZSBndWVzdC4gKi8KLXN0YXRpYyB2b2lkIGlu
amVjdF92YWJ0X2V4Y2VwdGlvbihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKKy8qCisgKiBJ
bmplY3QgYSB2aXJ0dWFsIEFib3J0L1NFcnJvciBpbnRvIHRoZSBndWVzdC4KKyAqCisgKiBUaGlz
IHNob3VsZCBvbmx5IGJlIGNhbGxlZCB3aXRoICdjdXJyZW50Jy4KKyAqLworc3RhdGljIHZvaWQg
aW5qZWN0X3ZhYnRfZXhjZXB0aW9uKHN0cnVjdCB2Y3B1ICp2KQogeworICAgIHN0cnVjdCBjcHVf
dXNlcl9yZWdzICpyZWdzID0gZ3Vlc3RfY3B1X3VzZXJfcmVncygpOwogICAgIGNvbnN0IHVuaW9u
IGhzciBoc3IgPSB7IC5iaXRzID0gcmVncy0+aHNyIH07CiAKKyAgICBBU1NFUlQodiA9PSBjdXJy
ZW50KTsKKwogICAgIC8qCiAgICAgICogU1ZDL0hWQy9TTUMgYWxyZWFkeSBoYXZlIGFuIGFkanVz
dGVkIFBDIChTZWUgQVJNIEFSTSBEREkgMDQ4N0EuagogICAgICAqIEQxLjEwLjEgZm9yIG1vcmUg
ZGV0YWlscyksIHdoaWNoIHdlIG5lZWQgdG8gY29ycmVjdCBpbiBvcmRlciB0bwpAQCAtNjU2LDcg
KzY2Myw3IEBAIHN0YXRpYyB2b2lkIGluamVjdF92YWJ0X2V4Y2VwdGlvbihzdHJ1Y3QgY3B1X3Vz
ZXJfcmVncyAqcmVncykKICAgICAgICAgYnJlYWs7CiAgICAgfQogCi0gICAgdmNwdV9oY3Jfc2V0
X2ZsYWdzKGN1cnJlbnQsIEhDUl9WQSk7CisgICAgdmNwdV9oY3Jfc2V0X2ZsYWdzKHYsIEhDUl9W
QSk7CiB9CiAKIC8qCkBAIC02ODMsNyArNjkwLDcgQEAgc3RhdGljIHZvaWQgX19kb190cmFwX3Nl
cnJvcihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgYm9vbCBndWVzdCkKICAgICAgKiBmb3J3
YXJkZWQgdG8gdGhlIGN1cnJlbnRseSBydW5uaW5nIHZDUFUuCiAgICAgICovCiAgICAgaWYgKCBz
ZXJyb3JzX29wID09IFNFUlJPUlNfRElWRVJTRSAmJiBndWVzdCApCi0gICAgICAgICAgICByZXR1
cm4gaW5qZWN0X3ZhYnRfZXhjZXB0aW9uKHJlZ3MpOworICAgICAgICAgICAgcmV0dXJuIGluamVj
dF92YWJ0X2V4Y2VwdGlvbihjdXJyZW50KTsKIAogICAgIGRvX3VuZXhwZWN0ZWRfdHJhcCgiU0Vy
cm9yIiwgcmVncyk7CiB9Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
