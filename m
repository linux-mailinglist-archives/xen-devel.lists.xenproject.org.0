Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D644817BE85
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:31:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAD1n-0003my-GF; Fri, 06 Mar 2020 13:28:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jAD1m-0003mt-AS
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:28:34 +0000
X-Inumbo-ID: 5ef13f80-5fae-11ea-a7d4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ef13f80-5fae-11ea-a7d4-12813bfff9fa;
 Fri, 06 Mar 2020 13:28:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6DCE3ACD0;
 Fri,  6 Mar 2020 13:28:30 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1583336008-10123-1-git-send-email-igor.druzhinin@citrix.com>
 <6175e008-2b25-0232-8fe1-073fe4325b99@suse.com>
 <2dfb6eee-847d-4aa6-aa79-6daddcaf67be@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d148aa74-9a77-6ac9-b848-7aa2941cac32@suse.com>
Date: Fri, 6 Mar 2020 14:28:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2dfb6eee-847d-4aa6-aa79-6daddcaf67be@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86/cpu: Sync any remaining RCU
 callbacks before CPU up/down
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxNDoxMCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMDYvMDMvMjAy
MCAwOTo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA0LjAzLjIwMjAgMTY6MzMsIElnb3Ig
RHJ1emhpbmluIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYwo+Pj4g
KysrIGIveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYwo+Pj4gQEAgLTMwNSw3ICszMDUsNiBAQCBz
dGF0aWMgaW50IGVudGVyX3N0YXRlKHUzMiBzdGF0ZSkKPj4+ICAgICAgY3B1ZnJlcV9hZGRfY3B1
KDApOwo+Pj4gIAo+Pj4gICBlbmFibGVfY3B1Ogo+Pj4gLSAgICByY3VfYmFycmllcigpOwo+Pj4g
ICAgICBtdHJyX2Fwc19zeW5jX2JlZ2luKCk7Cj4+PiAgICAgIGVuYWJsZV9ub25ib290X2NwdXMo
KTsKPj4+ICAgICAgbXRycl9hcHNfc3luY19lbmQoKTsKPj4KPj4gSSB0YWtlIGl0IHlvdSByZW1v
dmUgdGhlIGludm9jYXRpb24gaGVyZSBiZWNhdXNlIG9mIGJlaW5nIHJlZHVuZGFudAo+PiB3aXRo
IHRoZSBjcHVfdXAoKSBpbiBlbmFibGVfbm9uYm9vdF9jcHVzKCkuIElzIHRoaXMgc2FmZSAvIGNv
cnJlY3QKPj4gaW4gYWxsIGNhc2VzPyBGb3Igb25lLCBpdCdzIG5vdCBvYnZpb3VzIHRvIG1lIHRo
YXQKPj4gbXRycl9hcHNfc3luY19iZWdpbigpIGNvdWxkbid0IHJlbHkgb24gUkNVIHN5bmNpbmcg
dG8gaGF2ZSBoYXBwZW5lZC4KPiAKPiBGcm9tIHRoZSBoaXN0b3J5ICg5ZDlhZjdkY2E4NzgpLCBy
Y3VfYmFycmllciB0aGVyZSB3YXMgaW50cm9kdWNlIGZvcgo+IGV4YWN0bHkgc2FtZSByZWFzb24g
SSBwdXQgaXQgaW50byBjcHVfdXAvZG93bi4KCk9oLCBJIGRpZG4ndCBnbyBkbyBhcmNoZW9sb2d5
IGhlcmUuIFRoaXMgaXMgdGhlbiBjZXJ0YWlubHkgZmluZS4KCj4gSSdtIHByZXR0eSBjZXJ0YWlu
Cj4gaXQncyBzYWZlIGFzIHRoZXJlIGlzIG5vIG90aGVyIG9idmlvdXMgcmVhc29uIHRvIGhhdmUg
aXQgaGVyZS4KPiAKPiBUaGUgb25seSBmdW5jdGlvbiB0aGF0IGNvdWxkIGFmZmVjdCBtdHJyX2Fw
c19zeW5jX2JlZ2luKCkgaXMKPiBtdHJyX2Fwc19zeW5jX2VuZCgpIGFuZCB0aGF0IG9uZSBpcyBj
YWxsZWQgb25seSBiZWxvdy4KPiAKPj4gQW5kIHRoZW4gZW5hYmxlX25vbmJvb3RfY3B1cygpIG1h
eSBub3QgY2FsbCBjcHVfdXAoKSBhdCBhbGwsCj4+IGJlY2F1c2Ugb2YgdGhlIHBhcmtfb2ZmbGlu
ZV9jcHVzLWJhc2VkIGVhcmx5IGxvb3AgY29udGludWF0aW9uIGluCj4+IHRoZSBmdW5jdGlvbi4K
PiAKPiBJIGNhbid0IHNlZSBob3cgdGhhdCBpcyByZWxhdGVkLgoKSXQgY291bGQgYmUgd2l0aG91
dCB5b3VyIG9ic2VydmF0aW9uIGFib3ZlLCBhcyB0aGVyZSBjb3VsZCBoYXZlCmJlZW4gb3RoZXIg
cmVhc29ucyB0byBoYXZlIHRoZSBiYXJyaWVyIHRoZXJlIChhbmQgaGVuY2UgaXQgdGhlbgpjb3Vs
ZCBiZSBhIGJ1ZyBpZiB0aGUgYmFycmllciB3YXMgcmVtb3ZlZCBmcm9tIGFuIGVmZmVjdGl2ZQpj
b2RlIHBhdGgsIHJhdGhlciB0aGFuIGp1c3QgbW92ZWQpLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
