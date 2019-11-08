Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49512F5497
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 20:28:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT9sK-0003NP-Hw; Fri, 08 Nov 2019 19:24:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hcls=ZA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iT9sJ-0003NK-0X
 for xen-devel@lists.xen.org; Fri, 08 Nov 2019 19:24:51 +0000
X-Inumbo-ID: 6e843ad3-025d-11ea-a1d6-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e843ad3-025d-11ea-a1d6-12813bfff9fa;
 Fri, 08 Nov 2019 19:24:50 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3C8BA20656;
 Fri,  8 Nov 2019 19:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573241089;
 bh=keXR8IpScaYrQt+UeLl7cn7v4GXfAUstjCs+lKj6nfU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=AhyfDzohyh/IbaJw1IxfUAQCOsm0LzuHyPnuTGoUVbSMy/4RpTghey/8pH10lDrNs
 mu/pF8Mj80jpJQBGvOn9cOy+MlPhAIBb67qQTYzWDyItP4/HoO+8hJfJ6NR0wurvrz
 JjQYizkDV+Prf4OH5DicZLfWegWFrbsAXdHMM5MU=
Date: Fri, 8 Nov 2019 11:24:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20191107033709.17575-1-peng.fan@nxp.com>
Message-ID: <alpine.DEB.2.21.1911081123580.2677@sstabellini-ThinkPad-T480s>
References: <20191107033709.17575-1-peng.fan@nxp.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] arch: arm: vgic-v3: fix GICD_ISACTIVER range
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
Cc: jgross@suse.com, "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCA3IE5vdiAyMDE5LCBQZW5nIEZhbiB3cm90ZToKPiBUaGUgZW5kIHNob3VsZCBiZSBH
SUNEX0lTQUNUSVZFUk4gbm90IEdJQ0RfSVNBQ1RJVkVSLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBl
bmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCkp1ZXJnZW4sIEkgdGhpbmsgdGhpcyBmaXggc2hv
dWxkIGJlIGluIHRoZSByZWxlYXNlIChhbmQgYWxzbwpiYWNrcG9ydGVkIHRvIHN0YWJsZSB0cmVl
cy4pCgoKCj4gLS0tCj4gIHhlbi9hcmNoL2FybS92Z2ljLXYzLmMgfCAyICstCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vdmdpYy12My5jIGIveGVuL2FyY2gvYXJtL3ZnaWMtdjMuYwo+IGluZGV4IDQy
MmI5NGY5MDIuLmU4MDJmMjA1NWEgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3ZnaWMtdjMu
Ywo+ICsrKyBiL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMKPiBAQCAtNzA2LDcgKzcwNiw3IEBAIHN0
YXRpYyBpbnQgX192Z2ljX3YzX2Rpc3RyX2NvbW1vbl9tbWlvX3JlYWQoY29uc3QgY2hhciAqbmFt
ZSwgc3RydWN0IHZjcHUgKnYsCj4gICAgICAgICAgZ290byByZWFkX2FzX3plcm87Cj4gIAo+ICAg
ICAgLyogUmVhZCB0aGUgYWN0aXZlIHN0YXR1cyBvZiBhbiBJUlEgdmlhIEdJQ0QvR0lDUiBpcyBu
b3Qgc3VwcG9ydGVkICovCj4gLSAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSVNBQ1RJVkVSLCBHSUNE
X0lTQUNUSVZFUik6Cj4gKyAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSVNBQ1RJVkVSLCBHSUNEX0lT
QUNUSVZFUk4pOgo+ICAgICAgY2FzZSBWUkFOR0UzMihHSUNEX0lDQUNUSVZFUiwgR0lDRF9JQ0FD
VElWRVJOKToKPiAgICAgICAgICBnb3RvIHJlYWRfYXNfemVybzsKPiAgCj4gLS0gCj4gMi4xNi40
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
