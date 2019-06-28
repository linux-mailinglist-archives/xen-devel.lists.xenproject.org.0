Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA7E58F0F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 02:39:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgepy-0005nh-Hg; Fri, 28 Jun 2019 00:33:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=84UU=U3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hgepx-0005nc-6n
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 00:33:57 +0000
X-Inumbo-ID: 68982e71-993c-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 68982e71-993c-11e9-8980-bc764e045a96;
 Fri, 28 Jun 2019 00:33:54 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BCA02208CB;
 Fri, 28 Jun 2019 00:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561682034;
 bh=rNf5AC5payUYufBvdoxN3aN4pIyUe+7c3GaHn2o6VfQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=RXfYs79a0lPVt2bADefhnvT8CbyXLh/0ZUYvmnl9EFlq9dyYBU3CEezhkF757iGH6
 Ky2huo3l24iQxyiG240cEWZ53VaFx7hbtLeoGC1X0NnT6mvtam4nAdFy1dlpxp1C6O
 YDt4s8wFk1yMvnh0DTM58OgHZh6DWqMhp2UQ+2js=
Date: Thu, 27 Jun 2019 17:33:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Denis Obrezkov <denisobrezkov@gmail.com>
In-Reply-To: <c9cd784e-ecf3-c442-5b70-e4ca43ce6b64@gmail.com>
Message-ID: <alpine.DEB.2.21.1906271730410.5851@sstabellini-ThinkPad-T480s>
References: <ed5ec761-ec79-1c5a-0b88-f20bfb99cead@gmail.com>
 <c9cd784e-ecf3-c442-5b70-e4ca43ce6b64@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] xen on beagleboard-x15: fails to access PRCM MPU
 register
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
 Hunyue Yau <hy-gsoc@hy-research.com>, Iain Hunter <drhunter95@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V3JpdGluZyBoZXJlIGEgc3VtbWFyeSBvZiB0aGUgZm9sbG93LXVwIGRpc2N1c3Npb24gb24gSVJD
LgoKVGhpcyBpcyBkdWUgdG8gYSBtYWdpYyBtZW1vcnkgcmVnaW9uLCBub3QgZGVzY3JpYmVkIGlu
IHRoZSBkZXZpY2UgdHJlZSwKYmVpbmcgYWNjZXNzZWQgYnkgTGludXguIFRoZSBtZW1vcnkgcmVn
aW9uIGlzIDB4NDgyNDM0MDAgLSAweDQ4MjQzNDAwKzUxMi4KClRvIGZpeCBwcm9ibGVtcyBsaWtl
IHRoaXMgb25lLCB3ZSBoYXZlIHRoZSBwbGF0Zm9ybSBzcGVjaWZpYyBmaWxlcyBpbgp4ZW46IHNl
ZSB0aGUgZmlsZXMgdW5kZXIgeGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy8uIFNwZWNpZmljYWxseSwg
b21hcDUuYwptaWdodCBiZSBhIGdvb2QgbW9kZWwgZm9yIHdoYXQgd2UgbmVlZC4gTG9vayBhdCB0
aGUKb21hcDVfc3BlY2lmaWNfbWFwcGluZyBmdW5jdGlvbiwgd2hpY2ggZG9lcyBleGFjdGx5IHdo
YXQgdGhlIG5hbWUKc3VnZ2VzdHM6IGl0IG1hcHMgc3BlY2lhbCBNTUlPIHJlZ2lvbnMgaW50byB0
aGUgZ3Vlc3QuCgogLyogQWRkaXRpb25hbCBtYXBwaW5ncyBmb3IgZG9tMCAobm90IGluIHRoZSBE
VFMpICovCiBzdGF0aWMgaW50IG9tYXA1X3NwZWNpZmljX21hcHBpbmcoc3RydWN0IGRvbWFpbiAq
ZCkKIHsKICAgICAvKiBNYXAgdGhlIFBSTSBtb2R1bGUgKi8KICAgICBtYXBfbW1pb19yZWdpb25z
KGQsIGdhZGRyX3RvX2dmbihPTUFQNV9QUk1fQkFTRSksIDIsCiAgICAgICAgICAgICAgICAgICAg
ICBtYWRkcl90b19tZm4oT01BUDVfUFJNX0JBU0UpKTsKIAogICAgIC8qIE1hcCB0aGUgUFJNX01Q
VSAqLwogICAgIG1hcF9tbWlvX3JlZ2lvbnMoZCwgZ2FkZHJfdG9fZ2ZuKE9NQVA1X1BSQ01fTVBV
X0JBU0UpLCAxLAogICAgICAgICAgICAgICAgICAgICAgbWFkZHJfdG9fbWZuKE9NQVA1X1BSQ01f
TVBVX0JBU0UpKTsKIAogICAgIC8qIE1hcCB0aGUgV2FrZXVwIEdlbiAqLwogICAgIG1hcF9tbWlv
X3JlZ2lvbnMoZCwgZ2FkZHJfdG9fZ2ZuKE9NQVA1X1dLVVBHRU5fQkFTRSksIDEsCiAgICAgICAg
ICAgICAgICAgICAgICBtYWRkcl90b19tZm4oT01BUDVfV0tVUEdFTl9CQVNFKSk7CiAKICAgICAv
KiBNYXAgdGhlIG9uLWNoaXAgU1JBTSAqLwogICAgIG1hcF9tbWlvX3JlZ2lvbnMoZCwgZ2FkZHJf
dG9fZ2ZuKE9NQVA1X1NSQU1fUEEpLCAzMiwKICAgICAgICAgICAgICAgICAgICAgIG1hZGRyX3Rv
X21mbihPTUFQNV9TUkFNX1BBKSk7CiAKICAgICByZXR1cm4gMDsKIH0KIApXZSBuZWVkIHNvbWV0
aGluZyBzaW1pbGFyIGZvciAweDQ4MjQzNDAwIC0gMHg0ODI0MzQwMCs1MTIgb24KQmVhZ2xlYm9h
cmQuCgoKT24gVGh1LCAyNyBKdW4gMjAxOSwgRGVuaXMgT2JyZXprb3Ygd3JvdGU6Cj4gQ0MnZWQg
b3RoZXIgR1NvQyBtZW50b3JzCj4gCj4gT24gNi8yNy8xOSA5OjUyIFBNLCBEZW5pcyBPYnJlemtv
diB3cm90ZToKPiA+IEhlbGxvIGFsbCwKPiA+IAo+ID4gSSBoYXZlIGEgZmFpbHVyZSB3aGVuIEkg
YW0gdHJ5aW5nIHRvIGJvb3QgTGludXggd2l0aCBYZW4gb24gYmIteDE1LCBoZXJlCj4gPiBpcyB0
aGUgbG9nOgo+ID4gaHR0cHM6Ly9wYXN0ZWJpbi5jb20vQkJBRlBrVlUKPiA+IAo+ID4gYW5kLCBh
cyBKdWxpZW4gKGNjJ2VkKSBzdWdnZXN0ZWQgaGVyZSBpcyB0aGUgRFQgZGVidWcgaW5mb3JtYXRp
b24gZm9yIHhlbjoKPiA+IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9vcGVuP2lkPTE1WVRzQ0tZ
VVRiRzJpLXNpV2V6SlhLV3VHMEgxVmZRego+ID4gCj4gPiBTbywgd2hhdCBJIHdhcyBhYmxlIHRv
IGZpZ3VyZSBvdXQ6Cj4gPiBJbiBvbWFwNF9wcm1pbnN0X3JlYWRfaW5zdF9yZWcgaXQgdHJpZXMg
dG8gcmVhZCBmcm9tIF9wcm1fYmFzZXNbcGFydF0udmEKPiA+IChhcmNoL2FybS9tYWNoLW9tYXAy
L3BybWluc3Q0NHh4LmMpLgo+ID4gX3BybV9iYXNlc1twYXJ0XS52YSBoYXMgYSB2YWx1ZSBvZiBw
cm1fYmFzZSBvciBwcmNtX21wdV9iYXNlIGRlcGVuZGluZwo+ID4gb24gcGFydCB2YWx1ZShhcmNo
L2FybS9tYWNoLW9tYXAyL3BybWluc3Q0NHh4LmM6NDQpCj4gPiBGYWlsdXJlIGhhcHBlbnMgd2hl
biBfcHJtX2Jhc2VzW09NQVA0NDMwX1BSQ01fTVBVX1BBUlRJVElPTl0gaXMgcmVhZC4KPiA+IEl0
J3MgdmFsdWUgc2V0IHVwIGluIGFyY2gvYXJtL21hY2gtb21hcDIvcHJjbV9tcHU0NHh4LmM6NTQu
Cj4gPiBUaGUgaW5zdGFsbGVkIHZhbHVlIGlzIG9idGFpbmVkIHdpdGggT01BUF9MNF9JT19BRERS
RVNTIG1hY3JvCj4gPiAobWFjaF9vbWFwMi9pby5jOjY2NykuIEhlcmUgaXMgaXRzIGRlZmluaXRp
b24gKGFyY2gvYXJtL21hY2hfb21hcDIvaW9tYXAuaCk6Cj4gPiAjZGVmaW5lIE9NQVAyX0w0X0lP
X09GRlNFVCAgMHhiMjAwMDAwMAo+ID4gI2RlZmluZSBPTUFQMl9MNF9JT19BRERSRVNTKHBhKSBJ
T01FTSgocGEpICsgT01BUDJfTDRfSU9fT0ZGU0VUKSAvKiBMNCAqLwo+ID4gCj4gPiBhbmQgSU9N
RU0gKGFyY2gvYXJtL2luY2x1ZGUvYXNtL2lvLmgpOgo+ID4gI2RlZmluZSBJT01FTSh4KSAgICAo
KHZvaWQgX19mb3JjZSBfX2lvbWVtICopKHgpKQo+ID4gCj4gPiBJIGRvbid0IHVuZGVyc3RhbmQg
d2hhdCBpcyBoYXBwZW5pbmcgYW5kIGhvdyB0byBvdmVyY29tZSBpdC4KPiA+IAo+IAo+IC0tIAo+
IFJlZ2FyZHMsIERlbmlzIE9icmV6a292Cj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
