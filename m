Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08066AA276
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 14:03:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5qRg-00056q-NY; Thu, 05 Sep 2019 12:01:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5qRe-00055n-JA
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 12:00:58 +0000
X-Inumbo-ID: d17b2c74-cfd4-11e9-abc8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d17b2c74-cfd4-11e9-abc8-12813bfff9fa;
 Thu, 05 Sep 2019 12:00:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4D479AD0B;
 Thu,  5 Sep 2019 12:00:56 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190905113955.24870-1-jgross@suse.com>
 <20190905113955.24870-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <efd9f3e4-d2d3-8bf7-ba9a-6337f598191a@suse.com>
Date: Thu, 5 Sep 2019 14:01:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905113955.24870-4-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 3/4] xen: refactor debugtrace data
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMjAxOSAxMzozOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBcyBhIHByZXBhcmF0
aW9uIGZvciBwZXItY3B1IGJ1ZmZlcnMgZG8gYSBsaXR0bGUgcmVmYWN0b3Jpbmcgb2YgdGhlCj4g
ZGVidWd0cmFjZSBkYXRhOiBwdXQgdGhlIG5lZWRlZCBidWZmZXIgYWRtaW4gZGF0YSBpbnRvIHRo
ZSBidWZmZXIgYXMKPiBpdCB3aWxsIGJlIG5lZWRlZCBmb3IgZWFjaCBidWZmZXIuIEluIG9yZGVy
IG5vdCB0byBsaW1pdCBidWZmZXIgc2l6ZQo+IHN3aXRjaCB0aGUgcmVsYXRlZCBmaWVsZHMgZnJv
bSB1bnNpZ25lZCBpbnQgdG8gdW5zaWduZWQgbG9uZywgYXMgb24KPiBodWdlIG1hY2hpbmVzIHdp
dGggUkFNIGluIHRoZSBUQiByYW5nZSBpdCBtaWdodCBiZSBpbnRlcmVzdGluZyB0bwo+IHN1cHBv
cnQgYnVmZmVycyA+NEdCLgoKSnVzdCBhcyBhIGZ1cnRoZXIgcmVtYXJrIGluIHRoaXMgcmVnYXJk
OgoKPiAgdm9pZCBkZWJ1Z3RyYWNlX3ByaW50ayhjb25zdCBjaGFyICpmbXQsIC4uLikKPiAgewo+
ICAgICAgc3RhdGljIGNoYXIgYnVmW0RFQlVHX1RSQUNFX0VOVFJZX1NJWkVdOwo+IC0gICAgc3Rh
dGljIHVuc2lnbmVkIGludCBjb3VudCwgbGFzdF9jb3VudCwgbGFzdF9wcmQ7Cj4gKyAgICBzdGF0
aWMgdW5zaWduZWQgaW50IGNvdW50LCBsYXN0X2NvdW50OwoKSG93IGxvbmcgZG8gd2UgdGhpbmsg
d2lsbCBpdCB0YWtlIHVudGlsIHRoZWlyIHdyYXBwaW5nIHdpbGwgYmVjb21lCmFuIGlzc3VlIHdp
dGggc3VjaCBodWdlIGJ1ZmZlcnM/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
