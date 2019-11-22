Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1C31077E1
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 20:15:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYEM7-0001Hg-Et; Fri, 22 Nov 2019 19:12:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h8i3=ZO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iYEM6-0001Hb-91
 for xen-devel@lists.xen.org; Fri, 22 Nov 2019 19:12:34 +0000
X-Inumbo-ID: 08f3190e-0d5c-11ea-9631-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08f3190e-0d5c-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 19:12:33 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 052FE20707;
 Fri, 22 Nov 2019 19:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574449952;
 bh=szaaqqTO0De7+ptKblK7sgzTZyVWjzHCWUhlXRNTMpo=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=KlxnSuydEp1DJS2ZvWZboidvksn/3Mr14gMo32NO57M+hTdeRM3yFl0NIprz1KhGc
 IBkCU74hSAPR69QZTjltJLVaJEa/GX/8gP3/ULk1J88KLpSvo4aeeC1n4e6VeJXbD/
 B9kJ7qbj+xGtrP6ipdKTC+cAd57xBBr8F9BUpL3Q=
Date: Fri, 22 Nov 2019 11:12:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20191122080226.6817-1-peng.fan@nxp.com>
Message-ID: <alpine.DEB.2.21.1911221105360.11302@sstabellini-ThinkPad-T480s>
References: <20191122080226.6817-1-peng.fan@nxp.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH V2] arch: arm: vgic-v3: fix GICD_ISACTIVER
 range
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
Cc: Alice Guo <alice.guo@nxp.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMiBOb3YgMjAxOSwgUGVuZyBGYW4gd3JvdGU6Cj4gVGhlIGVuZCBzaG91bGQgYmUg
R0lDRF9JU0FDVElWRVJOIG5vdCBHSUNEX0lTQUNUSVZFUiwKPiBhbmQgYWxzbyBwcmludCBhIHdh
cm5pbmcgZm9yIHRoZSB1bmhhbmRsZWQgcmVhZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZh
biA8cGVuZy5mYW5AbnhwLmNvbT4KPiAtLS0KPiAKPiBWMjoKPiAgQWRkIGEgd2FybmluZyBtZXNz
YWdlCj4gCj4gIHhlbi9hcmNoL2FybS92Z2ljLXYzLmMgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL3ZnaWMtdjMuYyBiL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMKPiBpbmRleCA0MjJi
OTRmOTAyLi5hMTViOWY2NDQxIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMK
PiArKysgYi94ZW4vYXJjaC9hcm0vdmdpYy12My5jCj4gQEAgLTcwNiw3ICs3MDYsMTAgQEAgc3Rh
dGljIGludCBfX3ZnaWNfdjNfZGlzdHJfY29tbW9uX21taW9fcmVhZChjb25zdCBjaGFyICpuYW1l
LCBzdHJ1Y3QgdmNwdSAqdiwKPiAgICAgICAgICBnb3RvIHJlYWRfYXNfemVybzsKPiAgCj4gICAg
ICAvKiBSZWFkIHRoZSBhY3RpdmUgc3RhdHVzIG9mIGFuIElSUSB2aWEgR0lDRC9HSUNSIGlzIG5v
dCBzdXBwb3J0ZWQgKi8KPiAtICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JU0FDVElWRVIsIEdJQ0Rf
SVNBQ1RJVkVSKToKPiArICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JU0FDVElWRVIsIEdJQ0RfSVNB
Q1RJVkVSTik6Cj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19HX0VSUiAiJXB2OiB2R0lDRDogdW5o
YW5kbGVkIHJlYWQgZnJvbSBJU0FDVElWRVIlZFxuIiwKPiArICAgICAgICAgICAgICAgdiwgKHJl
ZyAtIEdJQ0RfSVNBQ1RJVkVSKSAvIDQpOwoKQWxsIHRoZSBvdGhlciBzaW1pbGFyIHByaW50a3Mg
dGhhdCB3ZSBoYXZlIGluIHZnaWMtdjMuYyBkb24ndCBoYXZlIHRoZQoiLyA0IiwgZm9yIGluc3Rh
bmNlOgoKICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JU0FDVElWRVIsIEdJQ0RfSVNBQ1RJVkVSTik6
CiAgICAgICAgaWYgKCBkYWJ0LnNpemUgIT0gREFCVF9XT1JEICkgZ290byBiYWRfd2lkdGg7CiAg
ICAgICAgcHJpbnRrKFhFTkxPR19HX0VSUgogICAgICAgICAgICAgICAiJXB2OiAlczogdW5oYW5k
bGVkIHdvcmQgd3JpdGUgJSMiUFJJcmVnaXN0ZXIiIHRvIElTQUNUSVZFUiVkXG4iLAogICAgICAg
ICAgICAgICB2LCBuYW1lLCByLCByZWcgLSBHSUNEX0lTQUNUSVZFUik7CgpIb3dldmVyLCByZWcg
cmVmbGVjdHMgdGhlIGFkZHJlc3Mgb2YgdGhlIHJlZ2lzdGVyLCBzbyBhY3R1YWxseSwgdGhlCmRp
dmlzaW9uIGJ5IDQgbG9va3MgY29ycmVjdCBpZiB3ZSB3YW50IHRvIGdldCB0aGUgaW5kZXggb2Yg
dGhlIHNwZWNpZmljCnJlZ2lzdGVyLiBUaGFua3MgZm9yIHNwb3R0aW5nIHRoaXMuIFdlJ2xsIG5l
ZWQgdG8gZG8gYSBjbGVhbi11cCBpbiB0aGUKZmlsZSBsYXRlci4KClJldmlld2VkLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKCj4gKyAgICAgICAgZ290
byByZWFkX2FzX3plcm87Cj4gICAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSUNBQ1RJVkVSLCBHSUNE
X0lDQUNUSVZFUk4pOgo+ICAgICAgICAgIGdvdG8gcmVhZF9hc196ZXJvOwo+ICAKPiAtLSAKPiAy
LjE2LjQKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
