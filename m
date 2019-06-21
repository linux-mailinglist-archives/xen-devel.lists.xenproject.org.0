Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F424DE0F
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 02:31:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1he7Pv-0006Jl-Op; Fri, 21 Jun 2019 00:28:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hG5x=UU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1he7Pu-0006Jg-HJ
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 00:28:34 +0000
X-Inumbo-ID: 8065ecac-93bb-11e9-8295-f337a1666c72
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8065ecac-93bb-11e9-8295-f337a1666c72;
 Fri, 21 Jun 2019 00:28:33 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B03A12070B;
 Fri, 21 Jun 2019 00:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561076913;
 bh=S29o5/l4axL6WqQxSDjPhGcP/1Ia2VM3zNDWQl9S8JE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=jQNBNBUdjo2mVM0+C+1e7ASz4wKllSYapRasO3FGpvFGX4E5EHawxGLDEzn71DZDV
 MGc+q0dUOFaCTZNnHDUQZxCoXAQFz+QGnsJjnilwzWR3+sRkjlREGJ35U4inYttUOS
 SktncGGihJP+C2yDKuOjl+ln7Jhm6ovMX5rjx84Y=
Date: Thu, 20 Jun 2019 17:28:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
In-Reply-To: <20190620154952.31286-1-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.21.1906201727410.2677@sstabellini-ThinkPad-T480s>
References: <20190620154952.31286-1-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: optee: fix compilation with GCC 4.8
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMCBKdW4gMjAxOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gR0NDIDQuOCBp
cyB1bmFibGUgdG8gc2VlIHRoYXQgdmFyaWFibGVzIGd1ZXN0X3BnLCBndWVzdF9kYXRhIGFuZAo+
IHhlbl9kYXRhIHdpbGwgYmUgYWx3YXlzIGluaXRpYWxpemVkIGJlZm9yZSBhY2Nlc3MsIHNvIHdl
IG5lZWQgdG8KPiBpbml0aWFsaXplIHRoZW0gZWFybGllci4KPiAKPiBTdWdnZXN0ZWQtYnk6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBW
b2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+CgpJIHZlcmlmaWVk
IHRoYXQgaXQgd29ya3MgY29ycmVjdGx5LiBUaGFua3MgZm9yIHRoZSBwYXRjaCEgIChKdWxpZW4s
IEkKZGlkbid0IGNvbW1pdCBpdCB5ZXQgdG8gZ2l2ZSB5b3UgYSBjaGFuY2UgdG8gZ2l2ZSBpdCBh
IGxvb2sgdG9vLikKClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jIHwgMTMgKysr
KysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMgYi94ZW4vYXJjaC9hcm0vdGVlL29wdGVl
LmMKPiBpbmRleCAxNDM4MWQ2YjJkLi41NTI2ODc1ZTZmIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNo
L2FybS90ZWUvb3B0ZWUuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYwo+IEBAIC03
MTcsNiArNzE3LDE5IEBAIHN0YXRpYyBpbnQgdHJhbnNsYXRlX25vbmNvbnRpZyhzdHJ1Y3Qgb3B0
ZWVfZG9tYWluICpjdHgsCj4gICAgICBnZm4gPSBnYWRkcl90b19nZm4ocGFyYW0tPnUudG1lbS5i
dWZfcHRyICYKPiAgICAgICAgICAgICAgICAgICAgICAgICB+KE9QVEVFX01TR19OT05DT05USUdf
UEFHRV9TSVpFIC0gMSkpOwo+ICAKPiArICAgIC8qCj4gKyAgICAgKiBXZSBhcmUgaW5pdGlhbGl6
aW5nIGd1ZXN0X3BnLCBndWVzdF9kYXRhIGFuZCB4ZW5fZGF0YSB3aXRoIE5VTEwKPiArICAgICAq
IHRvIG1ha2UgR0NDIDQuOCBoYXBweSwgYXMgaXQgY2FuJ3QgaW5mZXIgdGhhdCB0aG9zZSB2YXJp
YWJsZXMKPiArICAgICAqIHdpbGwgYmUgaW5pdGlhbGl6ZWQgd2l0aCBjb3JyZWN0IHZhbHVlcyBp
biB0aGUgbG9vcCBiZWxvdy4KPiArICAgICAqCj4gKyAgICAgKiBUaGlzIHNpbGVuY2VzIG9sZCBH
Q0MsIGJ1dCBjYW4gbGVhZCB0byBOVUxMIGRlcmVmZXJlbmNlLCBpbgo+ICsgICAgICogY2FzZSBv
ZiBwcm9ncmFtbWVyJ3MgbWlzdGFrZS4gVG8gbWluaW1pemUgY2hhbmNlIG9mIHRoaXMsIHdlCj4g
KyAgICAgKiBhcmUgaW5pdGlhbGl6aW5nIHRob3NlIHZhcmlhYmxlcyB0aGVyZSwgaW5zdGVhZCBv
ZiBkb2luZyB0aGlzCj4gKyAgICAgKiBhdCBiZWdpbm5pbmcgb2YgdGhlIGZ1bmN0aW9uLgo+ICsg
ICAgICovCj4gKyAgICBndWVzdF9wZyA9IE5VTEw7Cj4gKyAgICB4ZW5fZGF0YSA9IE5VTEw7Cj4g
KyAgICBndWVzdF9kYXRhID0gTlVMTDsKPiAgICAgIHdoaWxlICggcGdfY291bnQgKQo+ICAgICAg
ewo+ICAgICAgICAgIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2U7Cj4gLS0gCj4gMi4yMS4wCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
