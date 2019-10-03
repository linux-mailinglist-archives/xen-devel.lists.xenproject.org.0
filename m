Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81062C963F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 03:38:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFq1S-0003Vo-0W; Thu, 03 Oct 2019 01:35:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KLgg=X4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFq1Q-0003Vj-R4
 for xen-devel@lists.xen.org; Thu, 03 Oct 2019 01:35:12 +0000
X-Inumbo-ID: 0a6270d8-e57e-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 0a6270d8-e57e-11e9-bf31-bc764e2007e4;
 Thu, 03 Oct 2019 01:35:12 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 25CAB222BE;
 Thu,  3 Oct 2019 01:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570066511;
 bh=gxgsK01pHZGsBjshB72aXCD2idVV4itmtFvxc6ZU0Gg=;
 h=Date:From:To:cc:Subject:From;
 b=QVnTKAOaNQdadbxRqa6y8KHFidiUgRBk8ybdy+ZPNzUxjLuv+9vUQ1O463JSJyigw
 tr1lNFWPKgH0akXJDJeI8d8UQUwWYfTwhopVujAKD77JsfzQ60OxQzUstQqeH7DJjU
 7z8tdcGQA7UMEC13xHHqfxHMQk7gxit4tAIlsnm0=
Date: Wed, 2 Oct 2019 18:35:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: julien.grall@arm.com
Message-ID: <alpine.DEB.2.21.1910021833180.2691@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v8 0/8] dom0less device assignment
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
aS94ZW4tdW5zdGFibGUuZ2l0IAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDA3ODhm
NmZmNTE4NTc4YjkxNTBiODE3NGY5MjI3MDNjYmYyMTViMWY6CgogIHhlbi9hcm06IGFkZCBkb20w
LWxlc3MgZGV2aWNlIGFzc2lnbm1lbnQgaW5mbyB0byBkb2NzICgyMDE5LTEwLTAyIDE4OjMyOjUw
IC0wNzAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpTdGVmYW5vIFN0YWJlbGxpbmkgKDgpOgogICAgICB4ZW4vYXJtOiBp
bnRyb2R1Y2UgaGFuZGxlX2RldmljZV9pbnRlcnJ1cHRzCiAgICAgIHhlbi9hcm06IGV4cG9ydCBk
ZXZpY2VfdHJlZV9nZXRfcmVnIGFuZCBkZXZpY2VfdHJlZV9nZXRfdTMyCiAgICAgIHhlbi9hcm06
IGludHJvZHVjZSBraW5mby0+cGhhbmRsZV9naWMKICAgICAgeGVuL2FybTogY29weSBkdGIgZnJh
Z21lbnQgdG8gZ3Vlc3QgZHRiCiAgICAgIHhlbi9hcm06IGFzc2lnbiBkZXZpY2VzIHRvIGJvb3Qg
ZG9tYWlucwogICAgICB4ZW4vYXJtOiBoYW5kbGUgIm11bHRpYm9vdCxkZXZpY2UtdHJlZSIgY29t
cGF0aWJsZSBub2RlcwogICAgICB4ZW4vYXJtOiBpbnRyb2R1Y2UgbnJfc3BpcwogICAgICB4ZW4v
YXJtOiBhZGQgZG9tMC1sZXNzIGRldmljZSBhc3NpZ25tZW50IGluZm8gdG8gZG9jcwoKIGRvY3Mv
bWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQgfCAgNDQgKysrLQogZG9jcy9taXNjL2Fy
bS9wYXNzdGhyb3VnaC50eHQgICAgICAgICB8IDEwNiArKysrKysrKwogeGVuL2FyY2gvYXJtL2Jv
b3RmZHQuYyAgICAgICAgICAgICAgICB8ICAxMCArLQogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWls
ZC5jICAgICAgICAgICB8IDQ1MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiB4
ZW4vYXJjaC9hcm0va2VybmVsLmMgICAgICAgICAgICAgICAgIHwgIDE0ICstCiB4ZW4vYXJjaC9h
cm0vc2V0dXAuYyAgICAgICAgICAgICAgICAgIHwgICAxICsKIHhlbi9pbmNsdWRlL2FzbS1hcm0v
a2VybmVsLmggICAgICAgICAgfCAgIDUgKy0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vc2V0dXAuaCAg
ICAgICAgICAgfCAgIDcgKwogOCBmaWxlcyBjaGFuZ2VkLCA1NzEgaW5zZXJ0aW9ucygrKSwgNjcg
ZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
