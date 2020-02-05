Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A90715289D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 10:45:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izHCF-000090-0A; Wed, 05 Feb 2020 09:42:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izHCD-00008s-Iq
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 09:42:09 +0000
X-Inumbo-ID: c6d73c96-47fb-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6d73c96-47fb-11ea-b211-bc764e2007e4;
 Wed, 05 Feb 2020 09:42:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 66A4EAE2C;
 Wed,  5 Feb 2020 09:42:08 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b477ca71-e5c7-0804-d3cb-f6a51f6bd46c@suse.com>
Message-ID: <0d4b021c-04b4-11e6-aa48-ce0e72d60824@suse.com>
Date: Wed, 5 Feb 2020 10:42:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <b477ca71-e5c7-0804-d3cb-f6a51f6bd46c@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 1/3] AMD/IOMMU: fix off-by-one in
 amd_iommu_get_paging_mode() callers
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

YW1kX2lvbW11X2dldF9wYWdpbmdfbW9kZSgpIGV4cGVjdHMgYSBjb3VudCwgbm90IGEgIm1heGlt
dW0gcG9zc2libGUiCnZhbHVlLiBQcmlvciB0byBiNGYwNDIyMzZhZTAgZHJvcHBpbmcgdGhlIHJl
ZmVyZW5jZSwgdGhlIHVzZSBvZiBvdXIgbWlzLQpuYW1lZCAibWF4X3BhZ2UiIGluIGFtZF9pb21t
dV9kb21haW5faW5pdCgpIG1heSBoYXZlIGxlYWQgdG8gc3VjaCBhCm1pc3VuZGVyc3RhbmRpbmcu
CgpBbHNvIHJlcGxhY2UgYSBsaXRlcmFsIDQgYnkgYW4gZXhwcmVzc2lvbiB0eWluZyBpdCB0byBh
IHdpZGVyIHVzZQpjb25zdGFudCwganVzdCBsaWtlIGFtZF9pb21tdV9xdWFyYW50aW5lX2luaXQo
KSBkb2VzLgoKRml4ZXM6IGVhMzg4Njc4MzFkYSAoIng4NiAvIGlvbW11OiBzZXQgdXAgYSBzY3Jh
dGNoIHBhZ2UgaW4gdGhlIHF1YXJhbnRpbmUgZG9tYWluIikKRml4ZXM6IGI0ZjA0MjIzNmFlMCAo
IkFNRC9JT01NVTogQ2Vhc2UgdXNpbmcgYSBkeW5hbWljIGhlaWdodCBmb3IgdGhlIElPTU1VIHBh
Z2V0YWJsZXMiKQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Ci0tLQpOb3RlOiBJJ20gbm90IGF0IHRoZSBzYW1lIHRpbWUgYWRkaW5nIGVycm9yIGNoZWNraW5n
IGhlcmUsIGRlc3BpdGUKICAgICAgYW1kX2lvbW11X2dldF9wYWdpbmdfbW9kZSgpIHBvc3NpYmx5
IHJldHVybmluZyBvbmUsIGFzIEkgdGhpbmsKICAgICAgdGhhdCdzIGEgc3VmZmljaWVudGx5IG9y
dGhvZ29uYWwgYXNwZWN0LgoKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11
X21hcC5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9tYXAuYwpAQCAt
NDU1LDkgKzQ1NSw5IEBAIGludCBhbWRfaW9tbXVfcmVzZXJ2ZV9kb21haW5fdW5pdHlfbWFwKHMK
IGludCBfX2luaXQgYW1kX2lvbW11X3F1YXJhbnRpbmVfaW5pdChzdHJ1Y3QgZG9tYWluICpkKQog
ewogICAgIHN0cnVjdCBkb21haW5faW9tbXUgKmhkID0gZG9tX2lvbW11KGQpOwotICAgIHVuc2ln
bmVkIGxvbmcgbWF4X2dmbiA9Ci0gICAgICAgIFBGTl9ET1dOKCgxdWwgPDwgREVGQVVMVF9ET01B
SU5fQUREUkVTU19XSURUSCkgLSAxKTsKLSAgICB1bnNpZ25lZCBpbnQgbGV2ZWwgPSBhbWRfaW9t
bXVfZ2V0X3BhZ2luZ19tb2RlKG1heF9nZm4pOworICAgIHVuc2lnbmVkIGxvbmcgZW5kX2dmbiA9
CisgICAgICAgIDF1bCA8PCAoREVGQVVMVF9ET01BSU5fQUREUkVTU19XSURUSCAtIFBBR0VfU0hJ
RlQpOworICAgIHVuc2lnbmVkIGludCBsZXZlbCA9IGFtZF9pb21tdV9nZXRfcGFnaW5nX21vZGUo
ZW5kX2dmbik7CiAgICAgc3RydWN0IGFtZF9pb21tdV9wdGUgKnRhYmxlOwogCiAgICAgaWYgKCBo
ZC0+YXJjaC5yb290X3RhYmxlICkKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3Bj
aV9hbWRfaW9tbXUuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9p
b21tdS5jCkBAIC0yNTksOCArMjU5LDEwIEBAIHN0YXRpYyBpbnQgYW1kX2lvbW11X2RvbWFpbl9p
bml0KHN0cnVjdAogICAgICAqICAgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSB3ZSBnaXZlIGl0LCBi
dXQgdGhpcyBpc24ndCBrbm93biB5ZXQgc28gdXNlIDQKICAgICAgKiAgIHVuaWxhdGVyYWxseS4K
ICAgICAgKi8KLSAgICBoZC0+YXJjaC5wYWdpbmdfbW9kZSA9IGlzX2h2bV9kb21haW4oZCkKLSAg
ICAgICAgPyA0IDogYW1kX2lvbW11X2dldF9wYWdpbmdfbW9kZShnZXRfdXBwZXJfbWZuX2JvdW5k
KCkpOworICAgIGhkLT5hcmNoLnBhZ2luZ19tb2RlID0gYW1kX2lvbW11X2dldF9wYWdpbmdfbW9k
ZSgKKyAgICAgICAgaXNfaHZtX2RvbWFpbihkKQorICAgICAgICA/IDF1bCA8PCAoREVGQVVMVF9E
T01BSU5fQUREUkVTU19XSURUSCAtIFBBR0VfU0hJRlQpCisgICAgICAgIDogZ2V0X3VwcGVyX21m
bl9ib3VuZCgpICsgMSk7CiAKICAgICByZXR1cm4gMDsKIH0KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
