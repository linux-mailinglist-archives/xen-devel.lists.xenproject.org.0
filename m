Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED9019018
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 20:18:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOnap-0007Ku-BY; Thu, 09 May 2019 18:16:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UEDQ=TJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hOnan-0007Kp-QK
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 18:16:29 +0000
X-Inumbo-ID: 909ce8ba-7286-11e9-b750-abd02349a180
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 909ce8ba-7286-11e9-b750-abd02349a180;
 Thu, 09 May 2019 18:16:29 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 17B5A2177B;
 Thu,  9 May 2019 18:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557425788;
 bh=7OTv8do8kzx+bncQLsq0oLpbHHBAbD+3SK8WOWOS53E=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=QuAyoaiPP1bM7g50DQPbcyElOaG5oH3P6qAS/3c+xuqkVB7Wtb/7d4giBFyA3MI3k
 BqI/a7Gb98yRJ1YA2NNBbj5mAzMoh5JVoo6MZCro1REHgiuLXx0XE3tzq6RsZCdxd0
 LruikUR4566rLx4V90ZJtGH9oqo1kwbEnyG9LwpI=
Date: Thu, 9 May 2019 11:16:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <51dbab9b-b0a5-c207-f1ef-e70b997a0078@arm.com>
Message-ID: <alpine.DEB.2.21.1905091115560.25766@sstabellini-ThinkPad-T480s>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-10-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091104530.25766@sstabellini-ThinkPad-T480s>
 <51dbab9b-b0a5-c207-f1ef-e70b997a0078@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 09/14] xen: Introduce HAS_M2P config and use
 to protect mfn_to_gmfn call
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 oleksandr_tyshchenko@epam.com, andrii_anisov@epam.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCA5IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gT24gNS85
LzE5IDc6MDYgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFR1ZSwgNyBNYXkg
MjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
eGVuL2RvbWFpbi5oIGIveGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oCj4gPiA+IGluZGV4IGQxYmZj
ODJmNTcuLmYxNzYxZmUxODMgMTAwNjQ0Cj4gPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9kb21h
aW4uaAo+ID4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmgKPiA+ID4gQEAgLTExOCw0
ICsxMTgsMTIgQEAgc3RydWN0IHZudW1hX2luZm8gewo+ID4gPiAgICAgdm9pZCB2bnVtYV9kZXN0
cm95KHN0cnVjdCB2bnVtYV9pbmZvICp2bnVtYSk7Cj4gPiA+ICAgKyNpZmRlZiBDT05GSUdfSEFT
X00yUAo+ID4gPiArI2RlZmluZSBkb21haW5fc2hhcmVkX2luZm9fZ2ZuKGQpICh7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICBjb25zdCBzdHJ1Y3QgZG9tYWluICpkXyA9
IChkKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4g
PiArICAgIG1mbl90b19nZm4oZF8sIF9tZm4oX192aXJ0X3RvX21mbihkXy0+c2hhcmVkX2luZm8p
KSk7ICAgICAgIFwKPiA+IAo+ID4gQXJlbid0IHlvdSBtaXNzaW5nIGEgX2dmbiBoZXJlPwo+ID4g
Cj4gPiAgICBfZ2ZuKG1mbl90b19nZm4oZCwgX21mbihfX3ZpcnRfdG9fbWZuKGQtPnNoYXJlZF9p
bmZvKSkpKTsKPiAKPiBQYXRjaCAjMyBvZiB0aGlzIHNlcmllcyBjb252ZXJ0IG1mbl90b19nZm4g
dG8gdXNlIHR5cGVzYWZlIE1GTiAmIEdGTi4gU28gdGhlCj4gZnVuY3Rpb24gbm93IHJldHVybiBh
IGdmbl90LgoKQWghIFNvbWVob3cgSSBhbSBtaXNzaW5nIHBhdGNoZXMgMi0zLTQgaW4gbXkgaW5i
b3guIEknbGwgdHJ5IHRvIGdldCB0aGVtCmZyb20gdGhlIGFyY2hpdmUuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
