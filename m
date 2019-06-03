Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FB533B92
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 00:50:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXvje-0007oQ-Qb; Mon, 03 Jun 2019 22:47:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hXvjd-0007oJ-JI
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 22:47:21 +0000
X-Inumbo-ID: 8b77593f-8651-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8b77593f-8651-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 22:47:20 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A69BC26ABC;
 Mon,  3 Jun 2019 22:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559602040;
 bh=6fe9f+v9KAovitda0k29PxrLKCD3ArE0WvGiuloIEpQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=rQ4wyzOjUZVIQC3sM8XbwVxloMyw7xXoVEkDnxgziPtGnqik8raEyVJZKhib+Y9Rz
 Xqu+LV8mFUaLpsbkZfXmlxX7n8qVR8MtT/Xm77OgfJt0D8cjGwg5RxXnDOLybN95uI
 M8Tn6lTwZhsSpdc7fw8xCLGnFjMWqd43k+9Z7is0=
Date: Mon, 3 Jun 2019 15:47:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514122456.28559-12-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906031546580.14041@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-12-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 11/19] xen/arm32: head:
 Don't set MAIR0 and MAIR1
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBjby1wcm9jZXNz
b3IgcmVnaXN0ZXJzIE1BSVIwIGFuZCBNQUlSMSBhcmUgbWFuYWdlZCBieSBFTDEuIFNvIHRoZXJl
Cj4gYXJlIG5vIG5lZWQgdG8gaW5pdGlhbGl6ZSB0aGVtIGR1cmluZyBYZW4gYm9vdC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IFJldmll
d2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKUmV2aWV3ZWQt
Ynk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCj4gLS0tCj4g
ICAgIENoYW5nZXMgaW4gdjIKPiAgICAgICAgIC0gQWRkIEFuZHJpaSdzIHJldmlld2VkLWJ5Cj4g
LS0tCj4gIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgfCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVh
ZC5TIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+IGluZGV4IGQ0MmExMzU1NmMuLjM0NDg4
MTdhYWIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+ICsrKyBiL3hl
bi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiBAQCAtMjEyLDggKzIxMiw2IEBAIGNwdV9pbml0X2Rv
bmU6Cj4gICAgICAgICAgLyogU2V0IHVwIG1lbW9yeSBhdHRyaWJ1dGUgdHlwZSB0YWJsZXMgKi8K
PiAgICAgICAgICBsZHIgICByMCwgPU1BSVIwVkFMCj4gICAgICAgICAgbGRyICAgcjEsID1NQUlS
MVZBTAo+IC0gICAgICAgIG1jciAgIENQMzIocjAsIE1BSVIwKQo+IC0gICAgICAgIG1jciAgIENQ
MzIocjEsIE1BSVIxKQo+ICAgICAgICAgIG1jciAgIENQMzIocjAsIEhNQUlSMCkKPiAgICAgICAg
ICBtY3IgICBDUDMyKHIxLCBITUFJUjEpCj4gIAo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
