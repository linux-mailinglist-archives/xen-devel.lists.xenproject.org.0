Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7173DC2AE8
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 01:31:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF55s-0000fQ-Fa; Mon, 30 Sep 2019 23:28:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/D4s=XZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iF55q-0000fK-Eg
 for xen-devel@lists.xen.org; Mon, 30 Sep 2019 23:28:38 +0000
X-Inumbo-ID: 072f8e1e-e3da-11e9-96ea-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 072f8e1e-e3da-11e9-96ea-12813bfff9fa;
 Mon, 30 Sep 2019 23:28:37 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A7B0B20815;
 Mon, 30 Sep 2019 23:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569886117;
 bh=iGH2fcjhJrDQCLng3SHi/2GVfWvMQdJSwrGc2jJJBRY=;
 h=Date:From:To:cc:Subject:From;
 b=oiEl3mMtgITnBwBB4o/t6VjeN+Q+FxzNAJJ8Kw8BItH4NyuQbHrGRXMo8AEhj5ydK
 XdbFDr7p84jeul7IB4YgZg/PMh/AbrHYIliIlGi9/6mxUsOWRw1yinwd3gkLXcUFTp
 VWJ/wyM+oXttottD0UBp4tCi2pm+9cw9b2s46dqc=
Date: Mon, 30 Sep 2019 16:28:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: julien.grall@arm.com
Message-ID: <alpine.DEB.2.21.1909301624550.2594@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7a 0/8] dom0less device assignment
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, sstabellini@kernel.org,
 andrii_anisov@epam.com, xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBzbWFsbCBwYXRjaCBzZXJpZXMgYWRkcyBkZXZpY2UgYXNzaWdubWVudCBz
dXBwb3J0IHRvIERvbTBsZXNzLgpUaGUgbGFzdCBwYXRjaCBpcyB0aGUgZG9jdW1lbnRhdGlvbi4K
CkNoZWVycywKClN0ZWZhbm8KCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDdh
NGU2NzExMTE0OTA1YjNjYmJlNDhlODFjMzIyMjM2MWE3ZjM1Nzk6CgogIHhlbi9zY2hlZDogbW92
ZSBzdHJ1Y3QgdGFza19zbGljZSBpbnRvIHN0cnVjdCBzY2hlZF91bml0ICgyMDE5LTA5LTI3IDE2
OjAzOjMxICswMjAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cgog
IGh0dHA6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2dpdC1odHRwL3Blb3BsZS9zc3RhYmVsbGlu
aS94ZW4tdW5zdGFibGUuZ2l0IGRvbTBsZXNzLXB0LXY3YQoKZm9yIHlvdSB0byBmZXRjaCBjaGFu
Z2VzIHVwIHRvIDkzM2EyZGVmMjFiYzA2NTdmNjJlNDVmNDM0NDA3NDdhMjAxYzNhODM6CgogIHhl
bi9hcm06IGFkZCBkb20wLWxlc3MgZGV2aWNlIGFzc2lnbm1lbnQgaW5mbyB0byBkb2NzICgyMDE5
LTA5LTMwIDE2OjA1OjAyIC0wNzAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpTdGVmYW5vIFN0YWJlbGxpbmkgKDgpOgog
ICAgICB4ZW4vYXJtOiBpbnRyb2R1Y2UgaGFuZGxlX2RldmljZV9pbnRlcnJ1cHRzCiAgICAgIHhl
bi9hcm06IGV4cG9ydCBkZXZpY2VfdHJlZV9nZXRfcmVnIGFuZCBkZXZpY2VfdHJlZV9nZXRfdTMy
CiAgICAgIHhlbi9hcm06IGludHJvZHVjZSBraW5mby0+cGhhbmRsZV9naWMKICAgICAgeGVuL2Fy
bTogY29weSBkdGIgZnJhZ21lbnQgdG8gZ3Vlc3QgZHRiCiAgICAgIHhlbi9hcm06IGFzc2lnbiBk
ZXZpY2VzIHRvIGJvb3QgZG9tYWlucwogICAgICB4ZW4vYXJtOiBoYW5kbGUgIm11bHRpYm9vdCxk
ZXZpY2UtdHJlZSIgY29tcGF0aWJsZSBub2RlcwogICAgICB4ZW4vYXJtOiBpbnRyb2R1Y2UgbnJf
c3BpcwogICAgICB4ZW4vYXJtOiBhZGQgZG9tMC1sZXNzIGRldmljZSBhc3NpZ25tZW50IGluZm8g
dG8gZG9jcwoKIGRvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQgfCAgNDQgKysr
LQogZG9jcy9taXNjL2FybS9wYXNzdGhyb3VnaC50eHQgICAgICAgICB8IDEwMSArKysrKysrKwog
eGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyAgICAgICAgICAgICAgICB8ICAxMCArLQogeGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jICAgICAgICAgICB8IDQyOSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tCiB4ZW4vYXJjaC9hcm0va2VybmVsLmMgICAgICAgICAgICAgICAgIHwgIDE0
ICstCiB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICAgICAgICAgICAgICAgIHwgICAxICsKIHhlbi9p
bmNsdWRlL2FzbS1hcm0va2VybmVsLmggICAgICAgICAgfCAgIDUgKy0KIHhlbi9pbmNsdWRlL2Fz
bS1hcm0vc2V0dXAuaCAgICAgICAgICAgfCAgIDcgKwogOCBmaWxlcyBjaGFuZ2VkLCA1NDQgaW5z
ZXJ0aW9ucygrKSwgNjcgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
