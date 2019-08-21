Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9270B9709A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 05:56:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0HgL-0007Wm-Kc; Wed, 21 Aug 2019 03:53:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tsmg=WR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i0HgJ-0007Wh-II
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 03:53:07 +0000
X-Inumbo-ID: 2ec105a8-c3c7-11e9-adbf-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ec105a8-c3c7-11e9-adbf-12813bfff9fa;
 Wed, 21 Aug 2019 03:53:06 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6BF4722CF7;
 Wed, 21 Aug 2019 03:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566359585;
 bh=uRRVeBnfnzDwwH7QVxhQOUjGsld1O0YDKLGyeS1Yv8g=;
 h=Date:From:To:cc:Subject:From;
 b=Vf/unoDoauvkESzQ21T6L9zwJq+FX3U5/D5CtsJha/tJyqmXgGYhHtDtUdZ6IyFZx
 V1znuhWRSgSINpcK1A7axn3mk0K98AjCjHAgNuJ9GnnCGR6TOfy9edS/mk+/2iM+85
 quVuC5sIMBj7wOQQt7gSqR9xoivToC3jIamLtxZE=
Date: Tue, 20 Aug 2019 20:53:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: julien.grall@arm.com
Message-ID: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 0/8] dom0less device assignment
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
CkNoZWVycywKClN0ZWZhbm8KCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDJj
MTljN2U4YmI0MGM5MTBjMDEwNWEwOGMwZTU2ZWRkMmVhMGU1ZWQ6CgogIHhlbi9hcm06IHVuYnJl
YWsgYXJtNjQgYnVpbGQgZm9yIG9sZGVyIHRvb2xjaGFpbnMgKDIwMTktMDgtMDcgMDk6NTU6NTEg
LTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgaHR0cDov
L3hlbmJpdHMueGVucHJvamVjdC5vcmcvZ2l0LWh0dHAvcGVvcGxlL3NzdGFiZWxsaW5pL3hlbi11
bnN0YWJsZS5naXQgZG9tMGxlc3MtcHQtNAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IDczOWY2ZjIxZjljZTA3NWNmZDU5NTVlOTk0NjRiYzU4NWFjYjU2MmQ6CgogIHhlbi9hcm06IGFk
ZCBkb20wLWxlc3MgZGV2aWNlIGFzc2lnbm1lbnQgaW5mbyB0byBkb2NzICgyMDE5LTA4LTIwIDE4
OjM3OjM5IC0wNzAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpTdGVmYW5vIFN0YWJlbGxpbmkgKDgpOgogICAgICB4ZW4v
YXJtOiBpbnRyb2R1Y2UgaGFuZGxlX2RldmljZV9pbnRlcnJ1cHRzCiAgICAgIHhlbi9hcm06IGV4
cG9ydCBkZXZpY2VfdHJlZV9nZXRfcmVnIGFuZCBkZXZpY2VfdHJlZV9nZXRfdTMyCiAgICAgIHhl
bi9hcm06IGludHJvZHVjZSBraW5mby0+Z3Vlc3RfcGhhbmRsZV9naWMKICAgICAgeGVuL2FybTog
Y29weSBkdGIgZnJhZ21lbnQgdG8gZ3Vlc3QgZHRiCiAgICAgIHhlbi9hcm06IGFzc2lnbiBkZXZp
Y2VzIHRvIGJvb3QgZG9tYWlucwogICAgICB4ZW4vYXJtOiBoYW5kbGUgIm11bHRpYm9vdCxkZXZp
Y2UtdHJlZSIgY29tcGF0aWJsZSBub2RlcwogICAgICB4ZW4vYXJtOiBpbnRyb2R1Y2UgbnJfc3Bp
cwogICAgICB4ZW4vYXJtOiBhZGQgZG9tMC1sZXNzIGRldmljZSBhc3NpZ25tZW50IGluZm8gdG8g
ZG9jcwoKIGRvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQgfCAgNDQgKysrKy0K
IGRvY3MvbWlzYy9hcm0vcGFzc3Rocm91Z2gudHh0ICAgICAgICAgfCAxMDUgKysrKysrKysrKysr
CiB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jICAgICAgICAgICAgICAgIHwgIDEwICstCiB4ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMgICAgICAgICAgIHwgMjk5ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0KIHhlbi9hcmNoL2FybS9rZXJuZWwuYyAgICAgICAgICAgICAgICAgfCAg
MTQgKy0KIHhlbi9hcmNoL2FybS9zZXR1cC5jICAgICAgICAgICAgICAgICAgfCAgIDEgKwogeGVu
L2luY2x1ZGUvYXNtLWFybS9rZXJuZWwuaCAgICAgICAgICB8ICAgNSArLQogeGVuL2luY2x1ZGUv
YXNtLWFybS9zZXR1cC5oICAgICAgICAgICB8ICAgMSArCiB4ZW4vaW5jbHVkZS94ZW4vZGV2aWNl
X3RyZWUuaCAgICAgICAgIHwgICA2ICsKIDkgZmlsZXMgY2hhbmdlZCwgNDI3IGluc2VydGlvbnMo
KyksIDU4IGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
