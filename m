Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AACF8198
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 21:55:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUGgA-0000qD-Pd; Mon, 11 Nov 2019 20:52:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M6oq=ZD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iUGg9-0000q8-Ib
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 20:52:53 +0000
X-Inumbo-ID: 3ab91032-04c5-11ea-b678-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ab91032-04c5-11ea-b678-bc764e2007e4;
 Mon, 11 Nov 2019 20:52:53 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51166206A3;
 Mon, 11 Nov 2019 20:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573505572;
 bh=blvi5G0hgd+l9x8XElDjEaE8O2IZ51iSkdKh/V0S3Nw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=novKamP3/6SOzTHmnebN7gmAxxib+5ax3/N5Fhhil60vGSfHXVDK3aFR9bd9Mbt5/
 3tirdLw2uJjoWgtLbeQcP3vklWb0R3neDhpl/Lq2kYfVhGkM35keM6gts8Qb2nlRHM
 qpt0jfSjQhQyrrUvAAOBO/eQNjQiiJUlcnOwT+gY=
Date: Mon, 11 Nov 2019 12:52:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrii Anisov <andrii.anisov@gmail.com>
In-Reply-To: <1573031953-12894-5-git-send-email-andrii.anisov@gmail.com>
Message-ID: <alpine.DEB.2.21.1911111250570.2677@sstabellini-ThinkPad-T480s>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-5-git-send-email-andrii.anisov@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC 4/7] arm/gic: Drop pointless assertions
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
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA2IE5vdiAyMDE5LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEZyb206IEFuZHJpaSBB
bmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4gCj4gQWxzbyBhcm1jbGFuZyBjb21wbGFp
bnMgYWJvdXQgdGhlIGNvbmRpdGlvbiBhbHdheXMgdHJ1ZSwKPiBiZWNhdXNlIGBzZ2lgIGlzIG9m
IHR5cGUgZW51bSB3aXRoIGFsbCBpdHMgdmFsdWVzIHVuZGVyIDE2Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgpBbHRob3VnaCBJIGFt
IG5vdCBjb21wbGV0ZWx5IG9wcG9zZWQgdG8gdGhpcywgZ2l2ZW4gdGhlIGNob2ljZSBJIHdvdWxk
CnByZWZlciB0byBrZWVwIHRoZSBBU1NFUlRzLgoKR2l2ZW4gdGhhdCBJIHdvdWxkIGltYWdpbmUg
dGhhdCB0aGUgQVJNIEMgQ29tcGlsZXIgd2lsbCBhbHNvIGNvbXBsYWluCmFib3V0IG1hbnkgb3Ro
ZXIgQVNTRVJUcywgSSB3b25kZXIgaWYgaXQgd291bGRuJ3QgYmUgYmV0dGVyIHRvIGp1c3QKZGlz
YWJsZSAqYWxsKiBBU1NFUlRzIHdoZW4gYnVpbGRpbmcgd2l0aCBhcm1jYyBieSBjaGFuZ2luZyB0
aGUKaW1wbGVtZW50YXRpb24gb2YgdGhlIEFTU0VSVCBNQUNSTy4KCgo+IC0tLQo+ICB4ZW4vYXJj
aC9hcm0vZ2ljLmMgfCA2IC0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy5jIGIveGVuL2FyY2gvYXJtL2dpYy5j
Cj4gaW5kZXggMTEzNjU1YS4uNThjNjE0MSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vZ2lj
LmMKPiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLmMKPiBAQCAtMjk0LDggKzI5NCw2IEBAIHZvaWQg
X19pbml0IGdpY19pbml0KHZvaWQpCj4gIAo+ICB2b2lkIHNlbmRfU0dJX21hc2soY29uc3QgY3B1
bWFza190ICpjcHVtYXNrLCBlbnVtIGdpY19zZ2kgc2dpKQo+ICB7Cj4gLSAgICBBU1NFUlQoc2dp
IDwgMTYpOyAvKiBUaGVyZSBhcmUgb25seSAxNiBTR0lzICovCj4gLQo+ICAgICAgZ2ljX2h3X29w
cy0+c2VuZF9TR0koc2dpLCBTR0lfVEFSR0VUX0xJU1QsIGNwdW1hc2spOwo+ICB9Cj4gIAo+IEBA
IC0zMDYsMTUgKzMwNCwxMSBAQCB2b2lkIHNlbmRfU0dJX29uZSh1bnNpZ25lZCBpbnQgY3B1LCBl
bnVtIGdpY19zZ2kgc2dpKQo+ICAKPiAgdm9pZCBzZW5kX1NHSV9zZWxmKGVudW0gZ2ljX3NnaSBz
Z2kpCj4gIHsKPiAtICAgIEFTU0VSVChzZ2kgPCAxNik7IC8qIFRoZXJlIGFyZSBvbmx5IDE2IFNH
SXMgKi8KPiAtCj4gICAgICBnaWNfaHdfb3BzLT5zZW5kX1NHSShzZ2ksIFNHSV9UQVJHRVRfU0VM
RiwgTlVMTCk7Cj4gIH0KPiAgCj4gIHZvaWQgc2VuZF9TR0lfYWxsYnV0c2VsZihlbnVtIGdpY19z
Z2kgc2dpKQo+ICB7Cj4gLSAgIEFTU0VSVChzZ2kgPCAxNik7IC8qIFRoZXJlIGFyZSBvbmx5IDE2
IFNHSXMgKi8KPiAtCj4gICAgIGdpY19od19vcHMtPnNlbmRfU0dJKHNnaSwgU0dJX1RBUkdFVF9P
VEhFUlMsIE5VTEwpOwo+ICB9Cj4gIAo+IC0tIAo+IDIuNy40Cj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
