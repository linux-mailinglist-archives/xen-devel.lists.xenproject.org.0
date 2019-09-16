Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F79B3CC1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 16:42:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9sAV-0000o0-LR; Mon, 16 Sep 2019 14:39:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ffgk=XL=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1i9sAU-0000nm-2a
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 14:39:54 +0000
X-Inumbo-ID: d66be480-d88f-11e9-95ee-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d66be480-d88f-11e9-95ee-12813bfff9fa;
 Mon, 16 Sep 2019 14:39:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B2B1FEC522;
 Mon, 16 Sep 2019 14:39:49 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-124-96.rdu2.redhat.com
 [10.10.124.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 416F75FCDF;
 Mon, 16 Sep 2019 14:39:48 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190913145100.303433-1-anthony.perard@citrix.com>
 <20190913145100.303433-4-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <7cc0da4e-770c-d580-d882-41de5f326849@redhat.com>
Date: Mon, 16 Sep 2019 16:39:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190913145100.303433-4-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Mon, 16 Sep 2019 14:39:49 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH 03/11] OvmfPkg/XenBusDxe:
 Rework watch events reception
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

T24gMDkvMTMvMTkgMTY6NTAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFRoaXMgcGF0Y2ggcmV3
b3JrIHRoZSByZWNlcHRpb24gb2YgeGVuc3RvcmUgd2F0Y2ggZXZlbnQgdG8gYXZvaWQKPiBhbGxv
Y2F0aW9uLgo+IAo+IEluc3RlYWQgb2YgcXVldWluZyB3YXRjaCBldmVudHMsIHdlIHNpbXBseSBt
YXJrIGEgWEVOU1RPUkVfV0FUQ0ggYXMKPiAidHJpZ2dlcmVkIi4gV2UgZG9uJ3QgbmVlZCB0byBr
bm93IGhvdyBtYW55IHRpbWUgd2UgcmVjZWl2ZWQgdGhlCj4gZXZlbnQsIG9ubHkgdGhhdCBpdCBo
YXBwZW5lZC4gVGhhdCBhdm9pZCB0byBhbGxvY2F0ZSBhCj4gWEVOU1RPUkVfTUVTU0FHRSBmb3Ig
ZXZlcnkgd2F0Y2ggZXZlbnRzLgo+IAo+IFJlZjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUu
b3JnL3Nob3dfYnVnLmNnaT9pZD0yMTkwCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gLS0tCj4gIE92bWZQa2cvWGVuQnVzRHhlL1hl
blN0b3JlLmMgfCAxMjUgKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDkwIGRlbGV0aW9ucygtKQoKVGhpcyBsb29r
cyBhIGJpdCBtb3JlIGNvbXBsZXggdGhhbiB3aGF0IEkgY2FuIGFsbG9jYXRlIHRpbWUgZm9yIG5v
dywgc28KSSdsbCB0cnVzdCB5b3Ugb24gaXQgLS0gaXQgb25seSBtb2RpZmllcyBYZW5TdG9yZS5j
LiBGZWVkYmFjayBmcm9tIG90aGVyCnJldmlld2VycyBpcyBlbmNvdXJhZ2VkLgoKQWNrZWQtYnk6
IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CgpUaGFua3MKTGFzemxvCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
