Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C983B99ABD
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 19:17:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0qf1-0001ZS-H0; Thu, 22 Aug 2019 17:14:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gXwC=WS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i0qez-0001ZL-Vp
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 17:14:06 +0000
X-Inumbo-ID: 3e15ff89-c500-11e9-addb-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e15ff89-c500-11e9-addb-12813bfff9fa;
 Thu, 22 Aug 2019 17:14:05 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76F7C233FC;
 Thu, 22 Aug 2019 17:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566494044;
 bh=MRm16dnp4Iafx1ollhlHmjykEf0X+Y/DhCWTCAwsoPU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=pAuiYAY39J9v25HU+rSPUWzc5YlRPlo5wbJVe0hAMD/jKrlW37O4LN5adYsTG0gxb
 XJb6f72ueYnKQCIila3Q/Ljyy5JWy395a2UQszAP0h6Vc+584BeFLXEgDR2ghbMkvh
 E3mX8cEiiREmG1CfvXXzpThi9AedzI4PH67R5Zdk=
Date: Thu, 22 Aug 2019 10:14:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190812173019.11956-15-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1908221013480.22783@sstabellini-ThinkPad-T480s>
References: <20190812173019.11956-1-julien.grall@arm.com>
 <20190812173019.11956-15-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 14/28] xen/arm32: head: Rework and
 document check_cpu_mode()
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMiBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEEgYnJhbmNoIGluIHRo
ZSBzdWNjZXNzIGNhc2UgY2FuIGJlIGF2b2lkZWQgYnkgaW52ZXJ0aW5nIHRoZSBicmFuY2gKPiBj
b25kaXRpb24uIEF0IHRoZSBzYW1lIHRpbWUsIHJlbW92ZSBhIHBvaW50bGVzcyBjb21tZW50IGFz
IFhlbiBjYW4gb25seQo+IHJ1biBhdCBIeXBlcnZpc29yIE1vZGUuCj4gCj4gTGFzdGx5LCBkb2N1
bWVudCB0aGUgYmVoYXZpb3IgYW5kIHRoZSBtYWluIHJlZ2lzdGVycyB1c2FnZSB3aXRoaW4gdGhl
Cj4gZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4KCkFscmVhZHkgcHJvdmlkZWQgYnkgcmV2aWV3ZWQtYnkgbGFzdCB0aW1lCgo+
IC0tLQo+ICAgICBDaGFuZ2VzIGluIHYyOgo+ICAgICAgICAgLSBQYXRjaCBhZGRlZAo+IC0tLQo+
ICB4ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIHwgMTUgKysrKysrKysrKystLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQu
Uwo+IGluZGV4IDQyODVmNzY0NjMuLmM3YjRmZTRjZDQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gv
YXJtL2FybTMyL2hlYWQuUwo+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiBAQCAt
MjA2LDYgKzIwNiwxNiBAQCBzZWNvbmRhcnlfc3dpdGNoZWQ6Cj4gICAgICAgICAgYiAgICAgbGF1
bmNoCj4gIEVORFBST0MoaW5pdF9zZWNvbmRhcnkpCj4gIAo+ICsvKgo+ICsgKiBDaGVjayBpZiB0
aGUgQ1BVIHN1cHBvcnRzIHZpcnR1YWxpemF0aW9uIGV4dGVuc2lvbnMgYW5kIGhhcyBiZWVuIGJv
b3RlZAo+ICsgKiBpbiBIeXBlcnZpc29yIG1vZGUuCj4gKyAqCj4gKyAqIFRoaXMgZnVuY3Rpb24g
d2lsbCBuZXZlciByZXR1cm4gd2hlbiB0aGUgQ1BVIGRvZXNuJ3Qgc3VwcG9ydAo+ICsgKiB2aXJ0
dWFsaXphdGlvbiBleHRlbnNpb25zIG9yIGlzIGJvb3RlZCBpbiBhbm90aGVyIG1vZGUgdGhhbgo+
ICsgKiBIeXBlcnZpc29yIG1vZGUuCj4gKyAqCj4gKyAqIENsb2JiZXJzIHIwIC0gcjMKPiArICov
Cj4gIGNoZWNrX2NwdV9tb2RlOgo+ICAgICAgICAgIC8qIENoZWNrIHRoYXQgdGhpcyBDUFUgaGFz
IEh5cCBtb2RlICovCj4gICAgICAgICAgbXJjICAgQ1AzMihyMCwgSURfUEZSMSkKPiBAQCAtMjIw
LDE1ICsyMzAsMTIgQEAgY2hlY2tfY3B1X21vZGU6Cj4gICAgICAgICAgbXJzICAgcjAsIGNwc3IK
PiAgICAgICAgICBhbmQgICByMCwgcjAsICMweDFmICAgICAgICAgIC8qIE1vZGUgaXMgaW4gdGhl
IGxvdyA1IGJpdHMgb2YgQ1BTUiAqLwo+ICAgICAgICAgIHRlcSAgIHIwLCAjMHgxYSAgICAgICAg
ICAgICAgLyogSHlwIE1vZGU/ICovCj4gLSAgICAgICAgYmVxICAgaHlwCj4gKyAgICAgICAgbW92
ZXEgcGMsIGxyICAgICAgICAgICAgICAgICAvKiBZZXMsIHJldHVybiAqLwo+ICAKPiAgICAgICAg
ICAvKiBPSywgd2UncmUgYm9uZWQuICovCj4gICAgICAgICAgUFJJTlQoIi0gWGVuIG11c3QgYmUg
ZW50ZXJlZCBpbiBOUyBIeXAgbW9kZSAtXHJcbiIpCj4gICAgICAgICAgUFJJTlQoIi0gUGxlYXNl
IHVwZGF0ZSB0aGUgYm9vdGxvYWRlciAtXHJcbiIpCj4gICAgICAgICAgYiAgICAgZmFpbAo+IC0K
PiAtaHlwOiAgICBQUklOVCgiLSBYZW4gc3RhcnRpbmcgaW4gSHlwIG1vZGUgLVxyXG4iKQo+IC0g
ICAgICAgIG1vdiAgIHBjLCBscgo+ICBFTkRQUk9DKGNoZWNrX2NwdV9tb2RlKQo+ICAKPiAgemVy
b19ic3M6Cj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
