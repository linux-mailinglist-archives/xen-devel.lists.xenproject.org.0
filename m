Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F3EDC960
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 17:49:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLUTL-0001R4-HF; Fri, 18 Oct 2019 15:47:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RSmm=YL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iLUTK-0001Qx-1D
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 15:47:22 +0000
X-Inumbo-ID: 923f1546-f1be-11e9-bbab-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 923f1546-f1be-11e9-bbab-bc764e2007e4;
 Fri, 18 Oct 2019 15:47:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3E4DC8F;
 Fri, 18 Oct 2019 08:47:20 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0635A3F718;
 Fri, 18 Oct 2019 08:47:19 -0700 (PDT)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20191018150653.24862-1-ian.jackson@eu.citrix.com>
 <20191018150653.24862-11-ian.jackson@eu.citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <38a9ad6c-6624-3e2a-aca7-20cb8ee14ce9@arm.com>
Date: Fri, 18 Oct 2019 16:47:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018150653.24862-11-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v5 10/10] libxl/xl: Overhaul
 passthrough setting logic
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
Cc: Paul Durrant <pdurrant@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSWFuLAoKT24gMTgvMTAvMjAxOSAxNjowNiwgSWFuIEphY2tzb24gd3JvdGU6Cj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2FybS5jIGIvdG9vbHMvbGlieGwvbGlieGxfYXJtLmMK
PiBpbmRleCBiZjMxYjliM2NhLi4yZjFjYTY5NDMxIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhs
L2xpYnhsX2FybS5jCj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfYXJtLmMKPiBAQCAtMTE5MSw2
ICsxMTkxLDMwIEBAIHZvaWQgbGlieGxfX2FyY2hfZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVs
dChsaWJ4bF9fZ2MgKmdjLAo+ICAgICAgIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvX2luaXRfdHlw
ZShiX2luZm8sIExJQlhMX0RPTUFJTl9UWVBFX1BWSCk7Cj4gICB9Cj4gICAKPiAraW50IGxpYnhs
X19hcmNoX3Bhc3N0aHJvdWdoX21vZGVfc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGRvbWlkLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RvbWFp
bl9jb25maWcgKmRfY29uZmlnLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IGxpYnhsX3BoeXNpbmZvICpwaHlzaW5mbykKPiArewo+ICsgICAgaW50
IHJjOwo+ICsgICAgbGlieGxfZG9tYWluX2NyZWF0ZV9pbmZvICpjb25zdCBjX2luZm8gPSAmZF9j
b25maWctPmNfaW5mbzsKPiArCj4gKyAgICBpZiAoY19pbmZvLT5wYXNzdGhyb3VnaCA9PSBMSUJY
TF9QQVNTVEhST1VHSF9FTkFCTEVEKSB7Cj4gKyAgICAgICAgY19pbmZvLT5wYXNzdGhyb3VnaCA9
IExJQlhMX1BBU1NUSFJPVUdIX1NIQVJFX1BUOwo+ICsgICAgfQo+ICsKPiArICAgIGlmIChjX2lu
Zm8tPnBhc3N0aHJvdWdoID09IExJQlhMX1BBU1NUSFJPVUdIX1NZTkNfUFQpIHsKPiArICAgICAg
ICBMT0dEKEVSUk9SLCBkb21pZCwKPiArICAgICAgICAgICAgICJwYXNzdGhyb3VnaD1cInN5bmNf
cHRcIiBub3Qgc3VwcG9ydGVkIG9uIEFSTVxuIik7Cj4gKyAgICAgICAgcmMgPSBFUlJPUl9JTlZB
TDsKPiArICAgICAgICBnb3RvIG91dDsKPiArICAgIH0KCldvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8g
dXNlIGEgc3dpdGNoIGNhc2Ugb3Igd2hpdGVsaXN0IGhlcmU/IFNvIHdlIGRvbid0IGVuZCB1cCAK
dG8gc2xpcCB0aHJvdWdoIGlmIGEgbmV3IHR5cGUgaXMgYWRkZWQgYW5kIHVuc3VwcG9ydGVkIG9u
IEFybS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
