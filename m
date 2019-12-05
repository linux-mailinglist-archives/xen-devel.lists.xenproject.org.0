Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D468D113D32
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 09:41:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icmer-0003dd-Ey; Thu, 05 Dec 2019 08:38:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icmeq-0003dY-Ju
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 08:38:44 +0000
X-Inumbo-ID: a504c968-173a-11ea-8216-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a504c968-173a-11ea-8216-12813bfff9fa;
 Thu, 05 Dec 2019 08:38:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 96118B2C2;
 Thu,  5 Dec 2019 08:38:42 +0000 (UTC)
To: "Xia, Hongyan" <hongyxia@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
 <032b7288fc1606a68dc18cf5709c83540717f38a.1575477921.git.hongyxia@amazon.com>
 <a037f9b1d5881214ec17c2b68316dc8fd0d1c36b.camel@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <61478363-7da5-4983-c67b-4889cbcf429f@suse.com>
Date: Thu, 5 Dec 2019 09:38:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a037f9b1d5881214ec17c2b68316dc8fd0d1c36b.camel@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/9] x86/mm: introduce l{1,
 2}t local variables to map_pages_to_xen
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAxOTowMSwgWGlhLCBIb25neWFuIHdyb3RlOgo+Pj4gQEAgLTUyNzIsNiAr
NTI3OSw3IEBAIGludCBtYXBfcGFnZXNfdG9feGVuKAo+Pj4gICAgICAgICAgICAgICAgICAgICAg
KCgxdSA8PCBQQUdFVEFCTEVfT1JERVIpIC0gMSkpID09IDApKSApCj4+PiAgICAgICAgICAgICAg
ewo+Pj4gICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGJhc2VfbWZuOwo+Pj4gKyAgICAg
ICAgICAgICAgICBsMV9wZ2VudHJ5X3QgKmwxdDsKPj4KPj4gY29uc3QsIGFzIHRoaXMgbG9va3Mg
dG8gYmUgdXNlZCBmb3IgbG9va3VwIG9ubHk/Cj4gCj4gSSBjYW5ub3QgZG8gdGhpcyBmb3Igbm93
IHNpbmNlIHZhcmlhYmxlcyBsaWtlIGwxdCBhcmUgc3RpbGwgdXNpbmcgdGhlCj4gb2xkIEFQSSB3
aGljaCBpcyBub24tY29uc3QuIEkgY2FuIGNoYW5nZSBpdCBvbmNlIHRoZXkgYXJlIHN3aXRjaGVk
IHRvCj4gdGhlIG5ldyBjb25zdCBBUEkgaW4gbGF0ZXIgcGF0Y2hlcy4KCk1heWJlIEkndmUgaW5k
ZWVkIHBpY2tlZCBhbiBleGFtcGxlIHdoZXJlIHRoaXMgd29uJ3Qgd29yayB5ZXQsCmJ1dCB0aGVy
ZSBsb29rIHRvIGJlIGNhc2VzIHdoZXJlIHRoZSBvbGQgaW50ZXJmYWNlIHdvdWxkbid0CmdldCBp
biB0aGUgd2F5LiBJJ2QgYXBwcmVjaWF0ZSBpZiBhdCBsZWFzdCB0aG9zZSBjYXNlcyBjb3VsZApo
YXZlIGNvbnN0IGFkZGVkIHJpZ2h0IGF3YXkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
