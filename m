Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74033B0EB6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 14:15:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Nyg-0007H4-Jf; Thu, 12 Sep 2019 12:13:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pap2=XH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8Nye-0007Gz-SH
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 12:13:32 +0000
X-Inumbo-ID: bb07ce3e-d556-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb07ce3e-d556-11e9-b76c-bc764e2007e4;
 Thu, 12 Sep 2019 12:13:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 065C9B69A;
 Thu, 12 Sep 2019 12:13:29 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-22-jgross@suse.com>
 <18ec96a1-b3c3-adbf-4b0e-1fcb7185e046@suse.com>
 <13f2cf63-2b61-07fa-f43d-044c61601bca@suse.com>
 <5aeddfeb-e01f-2cef-59ff-d66bcc067d37@suse.com>
 <3fcb3db8-cda6-a90a-50c3-58f503057bcb@suse.com>
 <e98a0253-4da5-a306-871b-b822cb925cc7@suse.com>
 <7545b694-2f4b-16a3-a902-d7c3ff83ba89@suse.com>
 <b6abbe42-cb7e-738e-fe88-57d1b3f3ef3c@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <38e966df-dc23-6e36-13f0-5cff4c6d4d09@suse.com>
Date: Thu, 12 Sep 2019 14:13:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b6abbe42-cb7e-738e-fe88-57d1b3f3ef3c@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 21/48] xen/sched: use sched_resource cpu
 instead smp_processor_id in schedulers
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMTkgMTQ6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEyLjA5LjIwMTkgMTM6
NTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDEyLjA5LjE5IDEzOjQ2LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDEyLjA5LjIwMTkgMTM6MTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gT24gMTIuMDkuMTkgMTI6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMi4wOS4y
MDE5IDExOjM0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4gT2theXksIEknbGwgcmVuYW1l
ICJjcHUiIHRvICJteV9jcHUiLgo+Pj4+Pgo+Pj4+PiBXZSd2ZSBnb3QgYSBudW1iZXIgb2YgaW5z
dGFuY2VzIG9mICJ0aGlzX2NwdSIgaW4gc3VjaCBjYXNlcyBhbHJlYWR5LAo+Pj4+PiBidXQgbm8g
c2luZ2xlICJteV9jcHUiLiBNYXkgSSBzdWdnZXN0IHRvIHN0aWNrIHRvIHRoaXMgbmFtaW5nIGhl
cmUKPj4+Pj4gYXMgd2VsbD8KPj4+Pgo+Pj4+IEhtbSwgZG9uJ3QgeW91IHRoaW5rIGFkZGluZyBm
dXJ0aGVyIG92ZXJsb2FkaW5nIG9mICJ0aGlzX2NwdSIgaXMgYSBiYWQKPj4+PiBpZGVhPwo+Pj4K
Pj4+IE5vdCBhdCBhbGwsIG5vLiBBIGZ1bmN0aW9uLWxpa2UgbWFjcm8gYW5kIGEgdmFyaWFibGUg
b2YgdGhlIHNhbWUKPj4+IG5hbWUgd2lsbCBoYXBwaWx5IGNvZXhpc3QuCj4+Cj4+IEkgYW0gYXdh
cmUgdGhhdCB0aGlzIGlzIHdvcmtpbmcgY29ycmVjdGx5Lgo+Pgo+PiBJIGp1c3QgdGhpbmsgc3Vj
aCBvdmVybG9hZGluZyBpc24ndCBoZWxwaW5nIGZvciByZWFkYWJpbGl0eSBhbmQgZWFzZQo+PiBv
ZiBtb2RpZmljYXRpb24uCj4+Cj4+IEluIHRoZSBlbmQgSSdtIG5vdCBmZWVsaW5nIHN0cm9uZyBo
ZXJlLCBzbyBpbiBjYXNlIHRoZXJlIGFyZSBubwo+PiBvYmplY3Rpb25zIEknbGwgZ28gd2l0aCB0
aGlzX2NwdS4KPiAKPiBPa2F5LCBzbyBsZXQncyBjb25zaWRlciBhbm90aGVyIGFsdGVybmF0aXZl
OiBjdXJfY3B1PyBXaGF0IEkKClllcywgSSBsaWtlIHRoYXQgb25lIGJldHRlci4gOi0pCgo+IHNp
bmNlcmVseSBkaXNsaWtlIGFyZSBpZGVudGlmaWVycyBvZiB0aGUgbXlfKiBmb3JtLCBmb3IgYmVp
bmcKPiBhcHBhcmVudGx5IGNvbW1vbiBpbiBhYnNvbHV0ZSBiZWdpbm5lciBleGFtcGxlcy4KCldl
IHNob3VsZCB0cnkgdG8gYXZvaWQgdGhhdCwgeWVzLiA6LUQKCkFtYXppbmcgLSB0aGVyZSBpcyBu
byBteV8qIGlkZW50aWZpZXIgaW4gdGhlIGh5cGVydmlzb3IgeWV0LgoKCkp1ZXJnZW4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
