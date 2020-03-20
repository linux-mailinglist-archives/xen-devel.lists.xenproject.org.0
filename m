Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CEA18C483
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 02:08:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jF64Z-0006Ga-G9; Fri, 20 Mar 2020 01:03:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hqqk=5F=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jF64Y-0006GV-2N
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 01:03:38 +0000
X-Inumbo-ID: a116e854-6a46-11ea-b34e-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a116e854-6a46-11ea-b34e-bc764e2007e4;
 Fri, 20 Mar 2020 01:03:37 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8ADAF20740;
 Fri, 20 Mar 2020 01:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584666216;
 bh=fe+X7bF39oYc+QF+L+y6m7dnhWjqAtGe6lhYNYgdaTw=;
 h=Date:From:To:cc:Subject:From;
 b=mU/vPVg8u619Xb4twUUklZ9nZQYdGktLcYUxokzuglJNg1AKKF9EsXB27mSy/4EY5
 bJnD9W4sSyusaOg9bwUkG0D8ep6Hq/FfwsHAl+B2+76pRzr9ovqN1MQ+8x5/+KEEFV
 z2NVwmSNKU+8o6ZUkMsy4IU0TkJIbPX0DobH92SA=
Date: Thu, 19 Mar 2020 18:03:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: julien@xen.org
Message-ID: <alpine.DEB.2.21.2003191359080.6430@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/arm: implement GICD_I[S/C]ACTIVER reads
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
Cc: xen-devel@lists.xenproject.org, peng.fan@nxp.com, sstabellini@kernel.org,
 xuwei5@hisilicon.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBhIHNpbXBsZSBpbXBsZW1lbnRhdGlvbiBvZiBHSUNEX0lDQUNUSVZFUiAvIEdJQ0Rf
SVNBQ1RJVkVSCnJlYWRzLiBJdCBkb2Vzbid0IHRha2UgaW50byBhY2NvdW50IHRoZSBsYXRlc3Qg
c3RhdGUgb2YgaW50ZXJydXB0cyBvbgpvdGhlciBwcm9jZXNzb3JzLiBPbmx5IHRoZSBsb2NhbCBw
cm9jZXNzb3IgaXMgdXAtdG8tZGF0ZS4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3RlZmFuby5zdGFiZWxsaW5pQHhpbGlueC5jb20+ClRlc3RlZC1ieTogV2VpIFh1IDx4dXdl
aTVAaGlzaWxpY29uLmNvbT4KVGVzdGVkLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4K
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdmdpYy12My5jIGIveGVuL2FyY2gvYXJtL3ZnaWMt
djMuYwppbmRleCA0ZTYwYmExNWNjLi5jOTc1NWJhNDViIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9h
cm0vdmdpYy12My5jCisrKyBiL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMKQEAgLTcxMyw5ICs3MTMs
MzggQEAgc3RhdGljIGludCBfX3ZnaWNfdjNfZGlzdHJfY29tbW9uX21taW9fcmVhZChjb25zdCBj
aGFyICpuYW1lLCBzdHJ1Y3QgdmNwdSAqdiwKICAgICAgICAgZ290byByZWFkX2FzX3plcm87CiAK
ICAgICAvKiBSZWFkIHRoZSBhY3RpdmUgc3RhdHVzIG9mIGFuIElSUSB2aWEgR0lDRC9HSUNSIGlz
IG5vdCBzdXBwb3J0ZWQgKi8KLSAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSVNBQ1RJVkVSLCBHSUNE
X0lTQUNUSVZFUik6CisgICAgY2FzZSBWUkFOR0UzMihHSUNEX0lTQUNUSVZFUiwgR0lDRF9JU0FD
VElWRVJOKToKICAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSUNBQ1RJVkVSLCBHSUNEX0lDQUNUSVZF
Uk4pOgotICAgICAgICBnb3RvIHJlYWRfYXNfemVybzsKKyAgICB7CisgICAgICAgIGJvb2wgaW52
ZXJ0ID0gZmFsc2U7CisgICAgICAgIHN0cnVjdCBwZW5kaW5nX2lycSAqcDsKKyAgICAgICAgdW5z
aWduZWQgaW50IHN0YXJ0X2lycSwgaXJxOworCisgICAgICAgIGlmICggcmVnIDwgR0lDRF9JU0FD
VElWRVJOICkKKyAgICAgICAgICAgIHN0YXJ0X2lycSA9IChyZWcgLSBHSUNEX0lTQUNUSVZFUikg
KiA4OworICAgICAgICBlbHNlCisgICAgICAgIHsKKyAgICAgICAgICAgIHN0YXJ0X2lycSA9IChy
ZWcgLSBHSUNEX0lDQUNUSVZFUikgKiA4OworICAgICAgICAgICAgaW52ZXJ0ID0gdHJ1ZTsKKyAg
ICAgICAgfQorCisgICAgICAgICpyID0gMDsKKworICAgICAgICAvKgorICAgICAgICAgKiBUaGUg
Zm9sbG93aW5nIHdvbid0IHJlZmxlY3QgdGhlIGxhdGVzdCBzdGF0dXMgb2YgaW50ZXJydXB0cyBv
bgorICAgICAgICAgKiBvdGhlciB2Y3B1cy4KKyAgICAgICAgICovCisgICAgICAgIGZvciAoIGly
cSA9IHN0YXJ0X2lycTsgaXJxIDwgc3RhcnRfaXJxICsgMzI7IGlycSsrICkKKyAgICAgICAgewor
ICAgICAgICAgICAgcCA9IGlycV90b19wZW5kaW5nKHYsIGlycSk7CisgICAgICAgICAgICBpZiAo
IHAgIT0gTlVMTCAmJiB0ZXN0X2JpdChHSUNfSVJRX0dVRVNUX0FDVElWRSwgJnAtPnN0YXR1cykg
KQorICAgICAgICAgICAgICAgICpyIHw9IDEgPDwgKGlycSAtIHN0YXJ0X2lycSk7CisgICAgICAg
IH0KKyAgICAgICAgaWYgKCBpbnZlcnQgKQorICAgICAgICAgICAgKnIgPSB+KCpyKTsKKworICAg
ICAgICByZXR1cm4gMTsKKyAgICB9CiAKICAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSVBSSU9SSVRZ
UiwgR0lDRF9JUFJJT1JJVFlSTik6CiAgICAgewoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
