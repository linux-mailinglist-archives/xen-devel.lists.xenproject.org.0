Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5D5106183
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 06:58:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY1vj-000224-QT; Fri, 22 Nov 2019 05:56:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m0bm=ZO=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1iY1vh-00021j-Jt
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 05:56:29 +0000
X-Inumbo-ID: d11308e2-0cec-11ea-a345-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d11308e2-0cec-11ea-a345-12813bfff9fa;
 Fri, 22 Nov 2019 05:56:25 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD3EB2071B;
 Fri, 22 Nov 2019 05:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574402184;
 bh=jQHII3kekIjKGDfMOcLc7BNncRQEMcbsFHnnxjyp1vE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yxbzHQvpX+zpqfqS2r+p68LeFowzlVIbLf31yoMlbjoSmLLJfzCWxEYWmb0bkgy1Q
 lLaMffvEinTfky3gNKWxFjzmmicaFoY/n+WqxJkfG4PzNBGcAjFCArxdWYokjjD14/
 q0P1NLlBIyG0JgrBVw8TUocovrDfRKKUxTQ79BoM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 22 Nov 2019 00:54:13 -0500
Message-Id: <20191122055544.3299-34-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122055544.3299-1-sashal@kernel.org>
References: <20191122055544.3299-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Xen-devel] [PATCH AUTOSEL 4.14 035/127] xen/pciback: Check
 dev_data before using it
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
Cc: Sasha Levin <sashal@kernel.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpbIFVwc3Ry
ZWFtIGNvbW1pdCAxNjY5OTA3ZTNkMWFiZmEzZjc1ODZlMmQ1NWRiYmMxMTdiNWFkYmEyIF0KCklm
IHBjaXN0dWJfaW5pdF9kZXZpY2UgZmFpbHMsIHRoZSByZWxlYXNlIGZ1bmN0aW9uIHdpbGwgYmUg
Y2FsbGVkIHdpdGgKZGV2X2RhdGEgc2V0IHRvIE5VTEwuICBDaGVjayBpdCBiZWZvcmUgdXNpbmcg
aXQgdG8gYXZvaWQgYSBOVUxMIHBvaW50ZXIKZGVyZWZlcmVuY2UuCgpTaWduZWQtb2ZmLWJ5OiBS
b3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEJv
cmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+ClNpZ25lZC1vZmYtYnk6
IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+ClNpZ25lZC1vZmYt
Ynk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL3hlbi94ZW4t
cGNpYmFjay9wY2lfc3R1Yi5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9w
Y2lfc3R1Yi5jIGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIuYwppbmRleCA5ZTQ4
MGZkZWJlMWYwLi44YzI1MGY0YTNhOTdhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi94ZW4tcGNp
YmFjay9wY2lfc3R1Yi5jCisrKyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaV9zdHViLmMK
QEAgLTEwNiw3ICsxMDYsOCBAQCBzdGF0aWMgdm9pZCBwY2lzdHViX2RldmljZV9yZWxlYXNlKHN0
cnVjdCBrcmVmICprcmVmKQogCSAqIGlzIGNhbGxlZCBmcm9tICJ1bmJpbmQiIHdoaWNoIHRha2Vz
IGEgZGV2aWNlX2xvY2sgbXV0ZXguCiAJICovCiAJX19wY2lfcmVzZXRfZnVuY3Rpb25fbG9ja2Vk
KGRldik7Ci0JaWYgKHBjaV9sb2FkX2FuZF9mcmVlX3NhdmVkX3N0YXRlKGRldiwgJmRldl9kYXRh
LT5wY2lfc2F2ZWRfc3RhdGUpKQorCWlmIChkZXZfZGF0YSAmJgorCSAgICBwY2lfbG9hZF9hbmRf
ZnJlZV9zYXZlZF9zdGF0ZShkZXYsICZkZXZfZGF0YS0+cGNpX3NhdmVkX3N0YXRlKSkKIAkJZGV2
X2luZm8oJmRldi0+ZGV2LCAiQ291bGQgbm90IHJlbG9hZCBQQ0kgc3RhdGVcbiIpOwogCWVsc2UK
IAkJcGNpX3Jlc3RvcmVfc3RhdGUoZGV2KTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
