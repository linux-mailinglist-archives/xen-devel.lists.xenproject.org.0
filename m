Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7C219E36
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 15:30:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP5Z9-0003Vj-6h; Fri, 10 May 2019 13:27:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP5Z7-0003Vb-I7
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:27:57 +0000
X-Inumbo-ID: 6c4b0b8a-7327-11e9-a40f-8b7e84f46b03
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6c4b0b8a-7327-11e9-a40f-8b7e84f46b03;
 Fri, 10 May 2019 13:27:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66D1415A2;
 Fri, 10 May 2019 06:27:56 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6155B3F575;
 Fri, 10 May 2019 06:27:55 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-12-julien.grall@arm.com>
 <5CD571FE020000780022D826@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <22eaed55-f714-0c97-385d-72cf796f5936@arm.com>
Date: Fri, 10 May 2019 14:27:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD571FE020000780022D826@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 11/14] xen/x86: mm: Re-implement
 set_gpfn_from_mfn() as a static inline function
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMC8wNS8yMDE5IDEzOjQzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwNy4w
NS4xOSBhdCAxNzoxNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gK3N0YXRpYyBp
bmxpbmUgdm9pZCBzZXRfZ3Bmbl9mcm9tX21mbih1bnNpZ25lZCBsb25nIG1mbiwgdW5zaWduZWQg
bG9uZyBwZm4pCj4+ICt7Cj4+ICsgICAgc3RydWN0IGRvbWFpbiAqZCA9IHBhZ2VfZ2V0X293bmVy
KG1mbl90b19wYWdlKF9tZm4obWZuKSkpOwo+PiArICAgIHVuc2lnbmVkIGxvbmcgZW50cnkgPSAo
ZCAmJiAoZCA9PSBkb21fY293KSkgPyBTSEFSRURfTTJQX0VOVFJZIDogcGZuOwo+IAo+IFRoZSAm
JiBoZXJlIGxvb2tzLCBlaG0sIGZ1bm55LCBidXQgSSBndWVzcyBpdCdzIG5lZWRlZCBmb3IgZWFy
bHkgYm9vdD8KCkkgaGF2ZSBubyBpZGVhLCB0aGlzIGlzIHg4NiBub3QgQXJtLi4uCgo+IEJ1dCB0
aGF0J3MgcGVyaGFwcyBhIHNlcGFyYXRlIHRoaW5nIHRvIGNsZWFuIHVwLiBIb3dldmVyLCBsb29r
aW5nIGF0Cj4gdGhpcyAtIHdoeSBpcyBBcm0gc2V0dGluZyB1cCBkb21fY293IGluIHRoZSBmaXJz
dCBwbGFjZT8KCkNvbW1vbiBjb2RlIGlzIHVzaW5nIGRvbV9jb3csIHNvIEkgZG9uJ3QgdGhpbmsg
d2Ugd2FudCBpdCB0byBiZSBOVUxMIG9uIEFybSB0byAKYXZvaWQgd2VpcmQgaXNzdWVzLgoKPiAK
Pj4gKyAgICBpZiAoIW1hY2hpbmVfdG9fcGh5c19tYXBwaW5nX3ZhbGlkKQo+IAo+IFBsZWFzZSBh
ZGQgdGhlIG1pc3NpbmcgYmxhbmtzLgoKT2suCgo+IAo+PiArICAgICAgICByZXR1cm47Cj4+ICsK
Pj4gKyAgICBpZiAoIG1mbiA+PSAoUkRXUl9DT01QQVRfTVBUX1ZJUlRfRU5EIC0gUkRXUl9DT01Q
QVRfTVBUX1ZJUlRfU1RBUlQpIC8gNCApCj4gCj4gWW91J3ZlIGludmVydGVkIHRoZSBvcmlnaW5h
bCBjb25kaXRpb24gKGJ5IHJlLXVzaW5nIGl0IHZlcmJhdGltKSAtIEknbSBwcmV0dHkKPiBzdXJl
IHRoaXMgaXMgZ29pbmcgdG8gY3Jhc2guCgpHb29kIHBvaW50LCBJIHdpbGwgdXBkYXRlIHRoZSBw
YXRjaC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
