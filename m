Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95614B1B5B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 12:08:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8iRm-0004sV-LY; Fri, 13 Sep 2019 10:04:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8iRk-0004rj-Vl
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 10:04:57 +0000
X-Inumbo-ID: efcc71bc-d60d-11e9-95aa-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efcc71bc-d60d-11e9-95aa-12813bfff9fa;
 Fri, 13 Sep 2019 10:04:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 458BDABC4;
 Fri, 13 Sep 2019 10:04:55 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190913094741.31451-1-paul.durrant@citrix.com>
 <20190913094741.31451-6-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9a2f884f-a709-b356-5a21-aae61f1ff3aa@suse.com>
Date: Fri, 13 Sep 2019 12:04:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190913094741.31451-6-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10 5/6] iommu: tidy up iommu_use_hap_pt()
 and need_iommu_pt_sync() macros
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMjAxOSAxMTo0NywgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9pb21tdS5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2lvbW11LmgKPiBAQCAtNTYs
OCArNTYsMTAgQEAgZXh0ZXJuIGJvb2xfdCBpb21tdV9lbmFibGUsIGlvbW11X2VuYWJsZWQ7Cj4g
IGV4dGVybiBib29sX3QgZm9yY2VfaW9tbXUsIGlvbW11X3ZlcmJvc2UsIGlvbW11X2lnZng7Cj4g
IGV4dGVybiBib29sX3QgaW9tbXVfc25vb3AsIGlvbW11X3FpbnZhbCwgaW9tbXVfaW50cmVtYXAs
IGlvbW11X2ludHBvc3Q7Cj4gIAo+IC0jaWZkZWYgQ09ORklHX0hWTQo+ICsjaWYgZGVmaW5lZChD
T05GSUdfSFZNKQo+ICBleHRlcm4gYm9vbCBpb21tdV9oYXBfcHRfc2hhcmU7Cj4gKyNlbGlmIGRl
ZmluZWQoQ09ORklHX0lPTU1VX0ZPUkNFX1BUX1NIQVJFKQo+ICsjZGVmaW5lIGlvbW11X2hhcF9w
dF9zaGFyZSB0cnVlCj4gICNlbHNlCj4gICNkZWZpbmUgaW9tbXVfaGFwX3B0X3NoYXJlIGZhbHNl
Cj4gICNlbmRpZgoKVGhlIG9yZGVyaW5nIGlzIHdyb25nIGhlcmUgLSBBcm0gdW5jb25kaXRpb25h
bGx5IGRlZmluZXMgSFZNLCBhbmQKaGVuY2UgaXQgbm93IGFsc28gc2V0dGluZyBJT01NVV9GT1JD
RV9QVF9TSEFSRSB3b24ndCBiZSBhY2NvdW50ZWQKZm9yIHRoaXMgd2F5LiBJJ2QgYmUgaGFwcHkg
dG8gYWRqdXN0IHRoaXMgb24gY29tbWl0LCBidXQgSSdtIGFmcmFpZApJJ20gc3RpbGwgdW5oYXBw
eSBhYm91dCBwYXRjaCAzIChidXQgSSBndWVzcyBhdCB0aGlzIHBvaW50IEknbGwKYmV0dGVyIHBy
b3Bvc2UgYSByZXBsYWNlbWVudCB0aGFuIGFzayB5b3UgZm9yIGdvaW5nIHRocm91Z2ggYW5vdGhl
cgpyb3VuZCkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
