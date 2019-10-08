Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 413A9CF053
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 03:18:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHe5l-0001QL-7x; Tue, 08 Oct 2019 01:15:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M61b=YB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iHe5k-0001Q5-1x
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 01:15:08 +0000
X-Inumbo-ID: 0e70af84-e969-11e9-80e3-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e70af84-e969-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 01:15:03 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0885A21871;
 Tue,  8 Oct 2019 01:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570497303;
 bh=06I0h/TPwCiBF+PPZDZVKMiNZZH6LxkSGHAis/wsgTk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AbsSO6scOdiKxHp++B+mY0lCUmYsx5W0LKis3YQRcF1Pg4xE/u9Prv51+raCPWfgi
 UWkl/VkWwiBTikLZPemupeHRp+9Aik7VWBDJHtEi1wgnF3El31bqfA/n2xS5oMm0mG
 9gIETOIKpdFFM/lLCBYCCC2gBvTf7lkeS/vDEGtg=
From: Stefano Stabellini <sstabellini@kernel.org>
To: Julien.Grall@arm.com
Date: Mon,  7 Oct 2019 18:15:01 -0700
Message-Id: <20191008011501.21038-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1910071811320.13684@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1910071811320.13684@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v2 3/3] xen/arm: fix duplicate memory node in DT
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyBhcmUgcHJlc2VudCBpbiB0aGUgaG9zdCBkZXZp
Y2UgdHJlZSwgZG9tMAppcyBzdGFydGVkIHdpdGggbXVsdGlwbGUgbWVtb3J5IG5vZGVzLiBFYWNo
IG1lbW9yeSBub2RlIHNob3VsZCBoYXZlIGEKdW5pcXVlIG5hbWUsIGJ1dCB0b2RheSB0aGV5IGFy
ZSBhbGwgY2FsbGVkICJtZW1vcnkiIGxlYWRpbmcgdG8gTGludXgKcHJpbnRpbmcgdGhlIGZvbGxv
d2luZyB3YXJuaW5nIGF0IGJvb3Q6CgogIE9GOiBEdXBsaWNhdGUgbmFtZSBpbiBiYXNlLCByZW5h
bWVkIHRvICJtZW1vcnkjMSIKClRoaXMgcGF0Y2ggZml4ZXMgdGhlIHByb2JsZW0gYnkgYXBwZW5k
aW5nIGEgIkA8dW5pdC1hZGRyZXNzPiIgdG8gdGhlCm5hbWUsIGFzIHBlciB0aGUgRGV2aWNlIFRy
ZWUgc3BlY2lmaWNhdGlvbiwgd2hlcmUgPHVuaXQtYWRkcmVzcz4gbWF0Y2hlcwp0aGUgYmFzZSBv
ZiBhZGRyZXNzIG9mIHRoZSBmaXJzdCByZWdpb24uCgpGaXhlczogMjQ4ZmFhNjM3ZDIgKHhlbi9h
cm06IGFkZCByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyB0byB0aGUgZG9tMCBtZW1vcnkgbm9kZSkK
UmVwb3J0ZWQtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0Bl
cGFtLmNvbT4KU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJl
bGxpbmlAeGlsaW54LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gZml4IGJ1ZiBzaXplIGNhbGN1
bGF0aW9uOiB0aGUgbnVtYmVyIGlzIDY0Yml0IGFuZCBwcmludGVkIGFzCiAgaGV4YWRlY2ltYWwK
LSBtb3ZlIGNoZWNrIG9uIG5yX2JhbmtzIHRvIGEgc2VwYXJhdGUgcGF0Y2gKLS0tCiB4ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCmluZGV4IGVhMDFhYWRhMGIuLjNk
ZTRkYWZhZWQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYworKysgYi94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKQEAgLTY0Niw2ICs2NDYsOCBAQCBzdGF0aWMgaW50
IF9faW5pdCBtYWtlX21lbW9yeV9ub2RlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsCiAgICAgaW50
IHJlcywgaTsKICAgICBpbnQgcmVnX3NpemUgPSBhZGRyY2VsbHMgKyBzaXplY2VsbHM7CiAgICAg
aW50IG5yX2NlbGxzID0gcmVnX3NpemUgKiBtZW0tPm5yX2JhbmtzOworICAgIC8qIFBsYWNlaG9s
ZGVyIGZvciBtZW1vcnlAICsgYSA2NC1iaXQgbnVtYmVyICsgXDAgKi8KKyAgICBjaGFyIGJ1Zlsy
NF07CiAgICAgX19iZTMyIHJlZ1tOUl9NRU1fQkFOS1MgKiA0IC8qIFdvcnN0IGNhc2UgYWRkcmNl
bGxzICsgc2l6ZWNlbGxzICovXTsKICAgICBfX2JlMzIgKmNlbGxzOwogCkBAIC02NTcsNyArNjU5
LDggQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV9tZW1vcnlfbm9kZShjb25zdCBzdHJ1Y3QgZG9t
YWluICpkLAogICAgICAgICAgICAgICAgcmVnX3NpemUsIG5yX2NlbGxzKTsKIAogICAgIC8qIGVQ
QVBSIDMuNCAqLwotICAgIHJlcyA9IGZkdF9iZWdpbl9ub2RlKGZkdCwgIm1lbW9yeSIpOworICAg
IHNucHJpbnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksICJtZW1vcnlAJSJQUkl4NjQsIG1lbS0+YmFua1sw
XS5zdGFydCk7CisgICAgcmVzID0gZmR0X2JlZ2luX25vZGUoZmR0LCBidWYpOwogICAgIGlmICgg
cmVzICkKICAgICAgICAgcmV0dXJuIHJlczsKIAotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
