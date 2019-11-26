Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4711D10A70E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 00:19:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZk47-0008Kn-Ds; Tue, 26 Nov 2019 23:16:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nsV+=ZS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iZk45-0008KS-DF
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 23:16:13 +0000
X-Inumbo-ID: bc8f0326-10a2-11ea-a3a9-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc8f0326-10a2-11ea-a3a9-12813bfff9fa;
 Tue, 26 Nov 2019 23:16:12 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFB892068E;
 Tue, 26 Nov 2019 23:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574810172;
 bh=85uMkOoqiGrWXOY9wUWpM3GaHJFAZe/XzHwO+h4jGGE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=WrjM4Veqal2vxJ1XhDZCZwprRoh9QPSwQyiuT5L4PFg2SJ5wLomIU9i+f1bPkMoal
 NMXwbAn5e9Rt7PlcM8yzqk0SItXlHzmeLyqCAoMM8nNjZA3b7QfLdTtAZYVzevTKDw
 Pjh88FGBtb3I6unr3aZBzsAK7RNVg3it1vobGScc=
Date: Tue, 26 Nov 2019 15:16:11 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
In-Reply-To: <20191115201037.44982-3-stewart.hildebrand@dornerworks.com>
Message-ID: <alpine.DEB.2.21.1911261418240.8205@sstabellini-ThinkPad-T480s>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115201037.44982-3-stewart.hildebrand@dornerworks.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [XEN PATCH v3 07/11] xen: arm: vgic: allow delivery
 of PPIs to guests
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
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxNSBOb3YgMjAxOSwgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOgo+IEFsbG93IHZn
aWNfZ2V0X2h3X2lycV9kZXNjIHRvIGJlIGNhbGxlZCB3aXRoIGEgdmNwdSBhcmd1bWVudC4KPiAK
PiBVc2UgdmNwdSBhcmd1bWVudCBpbiB2Z2ljX2Nvbm5lY3RfaHdfaXJxLgo+IAo+IHZnaWNfY29u
bmVjdF9od19pcnEgaXMgY2FsbGVkIGZvciBQUElzIGFuZCBTUElzLCBub3QgU0dJcy4gRW5mb3Jj
ZSB3aXRoCj4gQVNTRVJUcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGV3YXJ0IEhpbGRlYnJhbmQg
PHN0ZXdhcnQuaGlsZGVicmFuZEBkb3JuZXJ3b3Jrcy5jb20+Cj4gCj4gLS0tCj4gdjM6IG5ldyBw
YXRjaAo+IAo+IC0tLQo+IE5vdGU6IEkgaGF2ZSBvbmx5IG1vZGlmaWVkIHRoZSBvbGQgdmdpYyB0
byBhbGxvdyBkZWxpdmVyeSBvZiBQUElzLgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vZ2ljLXZnaWMu
YyB8IDI0ICsrKysrKysrKysrKysrKystLS0tLS0tLQo+ICB4ZW4vYXJjaC9hcm0vdmdpYy5jICAg
ICB8ICA2ICsrKy0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDExIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYyBiL3hl
bi9hcmNoL2FybS9naWMtdmdpYy5jCj4gaW5kZXggOThjMDIxZjFhOC4uMmM2NmE4ZmE5MiAxMDA2
NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9n
aWMtdmdpYy5jCj4gQEAgLTQxOCw3ICs0MTgsNyBAQCBzdHJ1Y3QgaXJxX2Rlc2MgKnZnaWNfZ2V0
X2h3X2lycV9kZXNjKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2Y3B1ICp2LAo+ICB7Cj4gICAg
ICBzdHJ1Y3QgcGVuZGluZ19pcnEgKnA7Cj4gIAo+IC0gICAgQVNTRVJUKCF2ICYmIHZpcnEgPj0g
MzIpOwo+ICsgICAgQVNTRVJUKCghdiAmJiAodmlycSA+PSAzMikpIHx8ICghZCAmJiB2ICYmICh2
aXJxID49IDE2KSAmJiAodmlycSA8IDMyKSkpOwoKSSBkb24ndCB0aGluayAhZCBpcyBuZWNlc3Nh
cnkgZm9yIHRoaXMgdG8gd29yayBhcyBpbnRlbmRlZCBzbyBJIHdvdWxkCmxpbWl0IHRoZSBBU1NF
UlQgdG8KCiAgQVNTRVJUKCghdiAmJiAodmlycSA+PSAzMikpIHx8ICh2ICYmICh2aXJxID49IDE2
KSAmJiAodmlycSA8IDMyKSkpOwoKdGhlIGNhbGxlciBjYW4gYWx3YXlzIHBhc3Mgdi0+ZG9tYWlu
CgoKPiAgICAgIGlmICggIXYgKQo+ICAgICAgICAgIHYgPSBkLT52Y3B1WzBdOwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
