Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A75713E9EC
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 18:41:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is95f-0001Tk-AR; Thu, 16 Jan 2020 17:37:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rOD0=3F=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1is95d-0001Tf-Py
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 17:37:53 +0000
X-Inumbo-ID: ec5a2368-3886-11ea-a985-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec5a2368-3886-11ea-a985-bc764e2007e4;
 Thu, 16 Jan 2020 17:37:53 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C738246E4;
 Thu, 16 Jan 2020 17:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579196272;
 bh=RA0gC3u+M4VuPADWnkOULAiiEkP0hcTg7uSzVZvtwbA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ck2lYohBpaXGjfVJSCZ6l+vD8hwLTmP03PpWiOxZ26Ez58WwCHeV1DeCLhOWj3rO0
 MqI3T6Ir1YfnzL0MQ/L3o0sYcW4tACNqzyodYJacefg4CzK2zGc2acBGfom15NaVth
 km+2hwH4a1hkJPs2vPSkRK4TOzu6Jl9d2xG3MJmg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 16 Jan 2020 12:34:03 -0500
Message-Id: <20200116173641.22137-54-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116173641.22137-1-sashal@kernel.org>
References: <20200116173641.22137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Xen-devel] [PATCH AUTOSEL 4.9 094/251] xen,
 cpu_hotplug: Prevent an out of bounds access
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
Cc: Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgMjAxNjc2MDk1ZGRhN2U1YjMxYTVlMWQxMTZkMTBmYzIyOTg1MDc1ZSBdCgpUaGUg
ImNwdSIgdmFyaWFibGUgY29tZXMgZnJvbSB0aGUgc3NjYW5mKCkgc28gU21hdGNoIG1hcmtzIGl0
IGFzCnVudHJ1c3RlZCBkYXRhLiAgV2UgY2FuJ3QgcGFzcyBhIGhpZ2hlciB2YWx1ZSB0aGFuICJu
cl9jcHVfaWRzIiB0bwpjcHVfcG9zc2libGUoKSBvciBpdCByZXN1bHRzIGluIGFuIG91dCBvZiBi
b3VuZHMgYWNjZXNzLgoKRml4ZXM6IGQ2OGQ4MmFmZDRjOCAoInhlbjogaW1wbGVtZW50IENQVSBo
b3RwbHVnZ2luZyIpClNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJA
b3JhY2xlLmNvbT4KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
U2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpTaWduZWQtb2Zm
LWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy94ZW4vY3B1
X2hvdHBsdWcuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2NwdV9ob3RwbHVnLmMgYi9kcml2ZXJz
L3hlbi9jcHVfaG90cGx1Zy5jCmluZGV4IGY0ZTU5YzQ0NTk2NC4uMTcwNTRkNjk1NDExIDEwMDY0
NAotLS0gYS9kcml2ZXJzL3hlbi9jcHVfaG90cGx1Zy5jCisrKyBiL2RyaXZlcnMveGVuL2NwdV9o
b3RwbHVnLmMKQEAgLTUzLDcgKzUzLDcgQEAgc3RhdGljIGludCB2Y3B1X29ubGluZSh1bnNpZ25l
ZCBpbnQgY3B1KQogfQogc3RhdGljIHZvaWQgdmNwdV9ob3RwbHVnKHVuc2lnbmVkIGludCBjcHUp
CiB7Ci0JaWYgKCFjcHVfcG9zc2libGUoY3B1KSkKKwlpZiAoY3B1ID49IG5yX2NwdV9pZHMgfHwg
IWNwdV9wb3NzaWJsZShjcHUpKQogCQlyZXR1cm47CiAKIAlzd2l0Y2ggKHZjcHVfb25saW5lKGNw
dSkpIHsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
