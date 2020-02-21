Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 148E416837D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 17:32:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5BBG-0008J8-Fm; Fri, 21 Feb 2020 16:29:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j5BBF-0008J3-2l
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 16:29:33 +0000
X-Inumbo-ID: 56d1d16c-54c7-11ea-86af-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56d1d16c-54c7-11ea-86af-12813bfff9fa;
 Fri, 21 Feb 2020 16:29:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 658C2AD93;
 Fri, 21 Feb 2020 16:29:31 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1582133128-25638-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1d138bf8-0cec-b66d-c852-fd7d6392e69d@suse.com>
Date: Fri, 21 Feb 2020 17:29:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582133128-25638-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/cpu: Sync any remaining RCU
 callbacks after CPU up/down
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 wl@xen.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAyMCAxODoyNSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gLS0tIGEveGVuL2Fy
Y2gveDg2L3N5c2N0bC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3N5c2N0bC5jCj4gQEAgLTc4LDgg
Kzc4LDExIEBAIHN0YXRpYyB2b2lkIGwzX2NhY2hlX2dldCh2b2lkICphcmcpCj4gIGxvbmcgY3B1
X3VwX2hlbHBlcih2b2lkICpkYXRhKQo+ICB7Cj4gICAgICB1bnNpZ25lZCBpbnQgY3B1ID0gKHVu
c2lnbmVkIGxvbmcpZGF0YTsKPiAtICAgIGludCByZXQgPSBjcHVfdXAoY3B1KTsKPiArICAgIGlu
dCByZXQ7Cj4gIAo+ICsgICAgLyogRmx1c2ggcG90ZW50aWFsbHkgc2NoZWR1bGVkIFJDVSB3b3Jr
IGZyb20gcHJlY2VkaW5nIENQVSBvZmZsaW5lICovCj4gKyAgICByY3VfYmFycmllcigpOwo+ICsg
ICAgcmV0ID0gY3B1X3VwKGNwdSk7Cj4gICAgICBpZiAoIHJldCA9PSAtRUJVU1kgKQo+ICAgICAg
ewo+ICAgICAgICAgIC8qIE9uIEVCVVNZLCBmbHVzaCBSQ1Ugd29yayBhbmQgaGF2ZSBvbmUgbW9y
ZSBnby4gKi8KPiBAQCAtMTA0LDcgKzEwNywxMSBAQCBsb25nIGNwdV91cF9oZWxwZXIodm9pZCAq
ZGF0YSkKPiAgbG9uZyBjcHVfZG93bl9oZWxwZXIodm9pZCAqZGF0YSkKPiAgewo+ICAgICAgaW50
IGNwdSA9ICh1bnNpZ25lZCBsb25nKWRhdGE7Cj4gLSAgICBpbnQgcmV0ID0gY3B1X2Rvd24oY3B1
KTsKPiArICAgIGludCByZXQ7Cj4gKwo+ICsgICAgLyogRmx1c2ggcG90ZW50aWFsbHkgc2NoZWR1
bGVkIFJDVSB3b3JrIGZyb20gcHJlY2VkaW5nIENQVSBvbmxpbmUgKi8KPiArICAgIHJjdV9iYXJy
aWVyKCk7Cj4gKyAgICByZXQgPSBjcHVfZG93bihjcHUpOwo+ICAgICAgaWYgKCByZXQgPT0gLUVC
VVNZICkKPiAgICAgIHsKPiAgICAgICAgICAvKiBPbiBFQlVTWSwgZmx1c2ggUkNVIHdvcmsgYW5k
IGhhdmUgb25lIG1vcmUgZ28uICovCj4gCgpUaGVyZSBhcmUgbW9yZSBjYWxscyB0byBjcHVfdXAo
KSAvIGNwdV9kb3duKCksIG1vc3Qgbm90YWJseSBpbgpjb3JlX3BhcmtpbmcuYy4gV291bGRuJ3Qg
aXQgYmUgYmV0dGVyIHRvIG1ha2UgdGhlIGJhcnJpZXIgcGFydApvZiB0aGUgdHdvIGZ1bmN0aW9u
cz8gVGhpcyB3b3VsZCB0aGUgYWxzbyBjb3ZlciBub24teDg2IGluCmNhc2UgYW4gYXJjaCB3YW50
cyB0byBzdXBwb3J0IG9mZmxpbmluZy9vbmxpbmluZyBvZiBDUFVzLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
