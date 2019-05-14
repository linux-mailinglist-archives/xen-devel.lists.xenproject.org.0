Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBF41CCF5
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 18:30:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQaHS-0002iw-Hk; Tue, 14 May 2019 16:27:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQaHR-0002ir-Lr
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 16:27:53 +0000
X-Inumbo-ID: 37d2b197-7665-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 37d2b197-7665-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 16:27:51 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 14 May 2019 10:27:50 -0600
Message-Id: <5CDAEC81020000780022ED86@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 14 May 2019 10:27:45 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Razvan Cojocaru" <rcojocaru@bitdefender.com>
References: <1557850437-27656-1-git-send-email-rcojocaru@bitdefender.com>
In-Reply-To: <1557850437-27656-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/altp2m: move
 altp2m_get_effective_entry() under CONFIG_HVM
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE0LjA1LjE5IGF0IDE4OjEzLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gQWxsIGl0cyBjYWxsZXJzIGxpdmUgaW5zaWRlICNpZmRlZiBDT05GSUdfSFZNIHNlY3Rp
b25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRl
ZmVuZGVyLmNvbT4KClRoYW5rcyEKCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaAo+
ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKPiBAQCAtNTE0LDYgKzUxNCw3IEBAIHN0
YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBtZm5fdG9fZ2ZuKHN0cnVjdCBkb21haW4gKmQsIG1m
bl90IG1mbikKPiAgICAgICAgICByZXR1cm4gbWZuX3gobWZuKTsKPiAgfQo+ICAKPiArI2lmZGVm
IENPTkZJR19IVk0KPiAgI2RlZmluZSBBUDJNR0VUX3ByZXBvcHVsYXRlIHRydWUKPiAgI2RlZmlu
ZSBBUDJNR0VUX3F1ZXJ5IGZhbHNlCj4gIAo+IEBAIC01MjUsNiArNTI2LDcgQEAgc3RhdGljIGlu
bGluZSB1bnNpZ25lZCBsb25nIG1mbl90b19nZm4oc3RydWN0IGRvbWFpbiAqZCwgbWZuX3QgbWZu
KQo+ICBpbnQgYWx0cDJtX2dldF9lZmZlY3RpdmVfZW50cnkoc3RydWN0IHAybV9kb21haW4gKmFw
Mm0sIGdmbl90IGdmbiwgbWZuX3QgKm1mbiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHAybV90eXBlX3QgKnQsIHAybV9hY2Nlc3NfdCAqYSwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJvb2wgcHJlcG9wdWxhdGUpOwo+ICsjZW5kaWYKPiAgCj4gIC8qIERlYWRs
b2NrLWF2b2lkYW5jZSBzY2hlbWUgd2hlbiBjYWxsaW5nIGdldF9nZm4gb24gZGlmZmVyZW50IGdm
bidzICovCj4gIHN0cnVjdCB0d29fZ2ZucyB7CgpJIGRvbid0IHRoaW5rIHRoZXNlIGFkanVzdG1l
bnRzIGFyZSBzdHJpY3RseSBuZWVkZWQsIGJ1dCBhdCBsZWFzdCBmb3IKbm93IHRoZXkgb2YgY291
cnNlIGFsc28gZG9uJ3QgaHVydC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
