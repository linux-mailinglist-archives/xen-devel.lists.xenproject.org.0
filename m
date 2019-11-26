Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC74210A59C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 21:47:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZhgN-0003aU-B8; Tue, 26 Nov 2019 20:43:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nsV+=ZS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iZhgM-0003aP-4b
 for xen-devel@lists.xen.org; Tue, 26 Nov 2019 20:43:34 +0000
X-Inumbo-ID: 694087fe-108d-11ea-83b8-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 694087fe-108d-11ea-83b8-bc764e2007e4;
 Tue, 26 Nov 2019 20:43:33 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 594AC2084D;
 Tue, 26 Nov 2019 20:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574801012;
 bh=kACLaDZItibkRvIqnYZpLngv3unpQl4cfc9uZkix6tw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=2FArRBkJsh6kwOxg9u9O1Toy8446QdXu89l4o9M2a+FegQlfHP+hd4ujgEMKcGOD/
 bUjm/xcImEoNYKxJ/uTEWlOvJWdqfClwqMjP1CNqrF/T6JMBTvrFcbhnG8BJzA+QNL
 /XR65mlWJKcFJohSJbfjMzt0NNEFmo3gxsdSAWWE=
Date: Tue, 26 Nov 2019 12:43:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: jgross@suse.com
In-Reply-To: <alpine.DEB.2.21.1911221105360.11302@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.1911261241260.8205@sstabellini-ThinkPad-T480s>
References: <20191122080226.6817-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911221105360.11302@sstabellini-ThinkPad-T480s>
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
Cc: jgross@suse.com, peng.fan@nxp.com, Alice Guo <alice.guo@nxp.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KyBKdWVyZ2VuCgpJIG1pc3NlZCB0aGF0IHlvdSB3ZXJlbid0IGluIENDIHRvIHRoZSBvcmlnaW5h
bCBwYXRjaCwgc29ycnkuCkkgdGhpbmsgdGhpcyBwYXRjaCBzaG91bGQgZ28gaW4sIGFzIG90aGVy
d2lzZSBMaW51eCA1LjQgY291bGQgcnVuIGludG8KcHJvYmxlbXMuIEl0IGlzIGFsc28gYSBwcmV0
dHkgc3RyYWlnaHRmb3J3YXJkIDQgbGluZXMgcGF0Y2guCgoKCk9uIEZyaSwgMjIgTm92IDIwMTks
IFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBGcmksIDIyIE5vdiAyMDE5LCBQZW5nIEZh
biB3cm90ZToKPiA+IFRoZSBlbmQgc2hvdWxkIGJlIEdJQ0RfSVNBQ1RJVkVSTiBub3QgR0lDRF9J
U0FDVElWRVIsCj4gPiBhbmQgYWxzbyBwcmludCBhIHdhcm5pbmcgZm9yIHRoZSB1bmhhbmRsZWQg
cmVhZC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+
Cj4gPiAtLS0KPiA+IAo+ID4gVjI6Cj4gPiAgQWRkIGEgd2FybmluZyBtZXNzYWdlCj4gPiAKPiA+
ICB4ZW4vYXJjaC9hcm0vdmdpYy12My5jIHwgNSArKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS92Z2ljLXYzLmMgYi94ZW4vYXJjaC9hcm0vdmdpYy12My5jCj4gPiBpbmRleCA0MjJi
OTRmOTAyLi5hMTViOWY2NDQxIDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL3ZnaWMtdjMu
Ywo+ID4gKysrIGIveGVuL2FyY2gvYXJtL3ZnaWMtdjMuYwo+ID4gQEAgLTcwNiw3ICs3MDYsMTAg
QEAgc3RhdGljIGludCBfX3ZnaWNfdjNfZGlzdHJfY29tbW9uX21taW9fcmVhZChjb25zdCBjaGFy
ICpuYW1lLCBzdHJ1Y3QgdmNwdSAqdiwKPiA+ICAgICAgICAgIGdvdG8gcmVhZF9hc196ZXJvOwo+
ID4gIAo+ID4gICAgICAvKiBSZWFkIHRoZSBhY3RpdmUgc3RhdHVzIG9mIGFuIElSUSB2aWEgR0lD
RC9HSUNSIGlzIG5vdCBzdXBwb3J0ZWQgKi8KPiA+IC0gICAgY2FzZSBWUkFOR0UzMihHSUNEX0lT
QUNUSVZFUiwgR0lDRF9JU0FDVElWRVIpOgo+ID4gKyAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSVNB
Q1RJVkVSLCBHSUNEX0lTQUNUSVZFUk4pOgo+ID4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19HX0VS
UiAiJXB2OiB2R0lDRDogdW5oYW5kbGVkIHJlYWQgZnJvbSBJU0FDVElWRVIlZFxuIiwKPiA+ICsg
ICAgICAgICAgICAgICB2LCAocmVnIC0gR0lDRF9JU0FDVElWRVIpIC8gNCk7Cj4gCj4gQWxsIHRo
ZSBvdGhlciBzaW1pbGFyIHByaW50a3MgdGhhdCB3ZSBoYXZlIGluIHZnaWMtdjMuYyBkb24ndCBo
YXZlIHRoZQo+ICIvIDQiLCBmb3IgaW5zdGFuY2U6Cj4gCj4gICAgIGNhc2UgVlJBTkdFMzIoR0lD
RF9JU0FDVElWRVIsIEdJQ0RfSVNBQ1RJVkVSTik6Cj4gICAgICAgICBpZiAoIGRhYnQuc2l6ZSAh
PSBEQUJUX1dPUkQgKSBnb3RvIGJhZF93aWR0aDsKPiAgICAgICAgIHByaW50ayhYRU5MT0dfR19F
UlIKPiAgICAgICAgICAgICAgICAiJXB2OiAlczogdW5oYW5kbGVkIHdvcmQgd3JpdGUgJSMiUFJJ
cmVnaXN0ZXIiIHRvIElTQUNUSVZFUiVkXG4iLAo+ICAgICAgICAgICAgICAgIHYsIG5hbWUsIHIs
IHJlZyAtIEdJQ0RfSVNBQ1RJVkVSKTsKPiAKPiBIb3dldmVyLCByZWcgcmVmbGVjdHMgdGhlIGFk
ZHJlc3Mgb2YgdGhlIHJlZ2lzdGVyLCBzbyBhY3R1YWxseSwgdGhlCj4gZGl2aXNpb24gYnkgNCBs
b29rcyBjb3JyZWN0IGlmIHdlIHdhbnQgdG8gZ2V0IHRoZSBpbmRleCBvZiB0aGUgc3BlY2lmaWMK
PiByZWdpc3Rlci4gVGhhbmtzIGZvciBzcG90dGluZyB0aGlzLiBXZSdsbCBuZWVkIHRvIGRvIGEg
Y2xlYW4tdXAgaW4gdGhlCj4gZmlsZSBsYXRlci4KPiAKPiBSZXZpZXdlZC1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IAo+IAo+IAo+ID4gKyAgICAgICAg
Z290byByZWFkX2FzX3plcm87Cj4gPiAgICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JQ0FDVElWRVIs
IEdJQ0RfSUNBQ1RJVkVSTik6Cj4gPiAgICAgICAgICBnb3RvIHJlYWRfYXNfemVybzsKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
