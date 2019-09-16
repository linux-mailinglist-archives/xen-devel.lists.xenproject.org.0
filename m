Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FD7B3CD9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 16:48:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9sGP-0001y0-KE; Mon, 16 Sep 2019 14:46:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ffgk=XL=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1i9sGN-0001xv-Rk
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 14:45:59 +0000
X-Inumbo-ID: b1b7fe98-d890-11e9-b76c-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1b7fe98-d890-11e9-b76c-bc764e2007e4;
 Mon, 16 Sep 2019 14:45:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A674C18C427E;
 Mon, 16 Sep 2019 14:45:57 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-124-96.rdu2.redhat.com
 [10.10.124.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28AC65DA5B;
 Mon, 16 Sep 2019 14:45:55 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190913145100.303433-1-anthony.perard@citrix.com>
 <20190913145100.303433-5-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <e624d659-e094-9f4a-5690-2657cfeaa1f2@redhat.com>
Date: Mon, 16 Sep 2019 16:45:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190913145100.303433-5-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Mon, 16 Sep 2019 14:45:57 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH 04/11] OvmfPkg/XenBusDxe: Avoid
 Allocate in XenStoreVSPrint
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMTMvMTkgMTY6NTAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IEluIG9yZGVyIHRvIGJl
IGFibGUgdG8gdXNlIFhlblN0b3JlVlNQcmludCBkdXJpbmcgdGhlCj4gRXhpdEJvb3RTZXJ2aWNl
cywgd2UgcmVtb3ZlIHRoZSBhbGxvY2F0aW9uIGRvbmUgYnkgdGhlIGZ1bmN0aW9uIGFuZAo+IHVz
ZSB0aGUgc3RhY2sgaW5zdGVhZC4KPiAKPiBSZWY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3Jl
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE5MAo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJE
IDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IC0tLQo+ICBPdm1mUGtnL1hlbkJ1c0R4ZS9Y
ZW5TdG9yZS5jIHwgMjEgKysrKysrKysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Pdm1mUGtn
L1hlbkJ1c0R4ZS9YZW5TdG9yZS5jIGIvT3ZtZlBrZy9YZW5CdXNEeGUvWGVuU3RvcmUuYwo+IGlu
ZGV4IDVjYzkwMDE5MGEuLjdiNzFkYzE1NmQgMTAwNjQ0Cj4gLS0tIGEvT3ZtZlBrZy9YZW5CdXNE
eGUvWGVuU3RvcmUuYwo+ICsrKyBiL092bWZQa2cvWGVuQnVzRHhlL1hlblN0b3JlLmMKPiBAQCAt
MTI1OSwyMCArMTI1OSwxNyBAQCBYZW5TdG9yZVZTUHJpbnQgKAo+ICAgIElOIFZBX0xJU1QgICAg
ICAgICAgICAgICBNYXJrZXIKPiAgICApCj4gIHsKPiAtICBDSEFSOCAqQnVmOwo+IC0gIFhFTlNU
T1JFX1NUQVRVUyBTdGF0dXM7Cj4gLSAgVUlOVE4gQnVmU2l6ZTsKPiAtICBWQV9MSVNUIE1hcmtl
cjI7Cj4gKyAgQ0hBUjggICAgICAgICAgIEJ1ZltYRU5TVE9SRV9QQVlMT0FEX01BWF07Cj4gKyAg
VUlOVE4gICAgICAgICAgIENvdW50Owo+ICAKPiAtICBWQV9DT1BZIChNYXJrZXIyLCBNYXJrZXIp
Owo+IC0gIEJ1ZlNpemUgPSBTUHJpbnRMZW5ndGhBc2NpaUZvcm1hdCAoRm9ybWF0U3RyaW5nLCBN
YXJrZXIyKSArIDE7Cj4gLSAgVkFfRU5EIChNYXJrZXIyKTsKPiAtICBCdWYgPSBBbGxvY2F0ZVpl
cm9Qb29sIChCdWZTaXplKTsKPiAtICBBc2NpaVZTUHJpbnQgKEJ1ZiwgQnVmU2l6ZSwgRm9ybWF0
U3RyaW5nLCBNYXJrZXIpOwo+IC0gIFN0YXR1cyA9IFhlblN0b3JlV3JpdGUgKFRyYW5zYWN0aW9u
LCBEaXJlY3RvcnlQYXRoLCBOb2RlLCBCdWYpOwo+IC0gIEZyZWVQb29sIChCdWYpOwo+ICsgIENv
dW50ID0gQXNjaWlWU1ByaW50IChCdWYsIHNpemVvZiAoQnVmKSwgRm9ybWF0U3RyaW5nLCBNYXJr
ZXIpOwo+ICsgIEFTU0VSVCAoQ291bnQgPiAwKTsKPiArICBBU1NFUlQgKENvdW50IDwgc2l6ZW9m
IChCdWYpKTsKPiArICBpZiAoKENvdW50ID09IDApIHx8IChDb3VudCA+PSBzaXplb2YgKEJ1Zikp
KSB7Cj4gKyAgICByZXR1cm4gWEVOU1RPUkVfU1RBVFVTX0VJTlZBTDsKPiArICB9Cj4gIAo+IC0g
IHJldHVybiBTdGF0dXM7Cj4gKyAgcmV0dXJuIFhlblN0b3JlV3JpdGUgKFRyYW5zYWN0aW9uLCBE
aXJlY3RvcnlQYXRoLCBOb2RlLCBCdWYpOwo+ICB9Cj4gIAo+ICBYRU5TVE9SRV9TVEFUVVMKPiAK
ClJldmlld2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
