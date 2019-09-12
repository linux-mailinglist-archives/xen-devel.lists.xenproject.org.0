Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A70B0E55
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 13:55:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Nfh-0005F1-Rk; Thu, 12 Sep 2019 11:53:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pap2=XH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8Nfg-0005Eo-Go
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 11:53:56 +0000
X-Inumbo-ID: ff1e4862-d553-11e9-9597-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff1e4862-d553-11e9-9597-12813bfff9fa;
 Thu, 12 Sep 2019 11:53:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A6FEDAD29;
 Thu, 12 Sep 2019 11:53:54 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-22-jgross@suse.com>
 <18ec96a1-b3c3-adbf-4b0e-1fcb7185e046@suse.com>
 <13f2cf63-2b61-07fa-f43d-044c61601bca@suse.com>
 <5aeddfeb-e01f-2cef-59ff-d66bcc067d37@suse.com>
 <3fcb3db8-cda6-a90a-50c3-58f503057bcb@suse.com>
 <e98a0253-4da5-a306-871b-b822cb925cc7@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <7545b694-2f4b-16a3-a902-d7c3ff83ba89@suse.com>
Date: Thu, 12 Sep 2019 13:53:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e98a0253-4da5-a306-871b-b822cb925cc7@suse.com>
Content-Language: en-US
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

T24gMTIuMDkuMTkgMTM6NDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEyLjA5LjIwMTkgMTM6
MTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDEyLjA5LjE5IDEyOjA0LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDEyLjA5LjIwMTkgMTE6MzQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gT24gMDkuMDkuMTkgMTY6MTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwOS4wOC4y
MDE5IDE2OjU4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4gQEAgLTE4MjUsOCArMTgyNSw5
IEBAIHN0YXRpYyBzdHJ1Y3QgdGFza19zbGljZQo+Pj4+Pj4gICAgIGNzY2hlZF9zY2hlZHVsZSgK
Pj4+Pj4+ICAgICAgICAgY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBzX3RpbWVfdCBub3cs
IGJvb2xfdCB0YXNrbGV0X3dvcmtfc2NoZWR1bGVkKQo+Pj4+Pj4gICAgIHsKPj4+Pj4+IC0gICAg
Y29uc3QgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKPj4+Pj4+IC0gICAgc3RydWN0IGxp
c3RfaGVhZCAqIGNvbnN0IHJ1bnEgPSBSVU5RKGNwdSk7Cj4+Pj4+PiArICAgIGNvbnN0IHVuc2ln
bmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4+Pj4+PiArICAgIGNvbnN0IHVuc2ln
bmVkIGludCBzY2hlZF9jcHUgPSBzY2hlZF9nZXRfcmVzb3VyY2VfY3B1KGNwdSk7Cj4+Pj4+PiAr
ICAgIHN0cnVjdCBsaXN0X2hlYWQgKiBjb25zdCBydW5xID0gUlVOUShzY2hlZF9jcHUpOwo+Pj4+
Pgo+Pj4+PiBCeSByZXRhaW5pbmcgYSBsb2NhbCB2YXJpYWJsZSBuYW1lZCAiY3B1IiB5b3UgbWFr
ZSBpdCBjbG9zZSB0bwo+Pj4+PiBpbXBvc3NpYmxlIHRvIG5vdGljZSwgZHVyaW5nIGEgcmUtYmFz
ZSwgYW4gYWRkaXRpb24gdG8gdGhlCj4+Pj4+IGZ1bmN0aW9uIHN0aWxsIHJlZmVyZW5jaW5nIGEg
dmFyaWFibGUgb2YgdGhpcyBuYW1lLiBTaW1pbGFybHkKPj4+Pj4gcmV2aWV3IGlzIGJlaW5nIG1h
ZGUgaGFyZGVyIGJlY2F1c2Ugb25lIG5lZWRzIHRvIGdvIGh1bnQgYWxsCj4+Pj4+IHRoZSByZW1h
aW5pbmcgdXNlcyBvZiAiY3B1Ii4gRm9yIGV4YW1wbGUgdGhlcmUgYSB0cmFjZSBlbnRyeQo+Pj4+
PiBiZWluZyBnZW5lcmF0ZWQsIGFuZCBpdCdzIG5vdCBvYnZpb3VzIHRvIG1lIHdoZXRoZXIgdGhp
cyB3b3VsZG4ndAo+Pj4+PiBiZXR0ZXIgYWxzbyB1c2VkIHNjaGVkX2NwdS4KPj4+Pgo+Pj4+IE9r
YXl5LCBJJ2xsIHJlbmFtZSAiY3B1IiB0byAibXlfY3B1Ii4KPj4+Cj4+PiBXZSd2ZSBnb3QgYSBu
dW1iZXIgb2YgaW5zdGFuY2VzIG9mICJ0aGlzX2NwdSIgaW4gc3VjaCBjYXNlcyBhbHJlYWR5LAo+
Pj4gYnV0IG5vIHNpbmdsZSAibXlfY3B1Ii4gTWF5IEkgc3VnZ2VzdCB0byBzdGljayB0byB0aGlz
IG5hbWluZyBoZXJlCj4+PiBhcyB3ZWxsPwo+Pgo+PiBIbW0sIGRvbid0IHlvdSB0aGluayBhZGRp
bmcgZnVydGhlciBvdmVybG9hZGluZyBvZiAidGhpc19jcHUiIGlzIGEgYmFkCj4+IGlkZWE/Cj4g
Cj4gTm90IGF0IGFsbCwgbm8uIEEgZnVuY3Rpb24tbGlrZSBtYWNybyBhbmQgYSB2YXJpYWJsZSBv
ZiB0aGUgc2FtZQo+IG5hbWUgd2lsbCBoYXBwaWx5IGNvZXhpc3QuCgpJIGFtIGF3YXJlIHRoYXQg
dGhpcyBpcyB3b3JraW5nIGNvcnJlY3RseS4KCkkganVzdCB0aGluayBzdWNoIG92ZXJsb2FkaW5n
IGlzbid0IGhlbHBpbmcgZm9yIHJlYWRhYmlsaXR5IGFuZCBlYXNlCm9mIG1vZGlmaWNhdGlvbi4K
CkluIHRoZSBlbmQgSSdtIG5vdCBmZWVsaW5nIHN0cm9uZyBoZXJlLCBzbyBpbiBjYXNlIHRoZXJl
IGFyZSBubwpvYmplY3Rpb25zIEknbGwgZ28gd2l0aCB0aGlzX2NwdS4KCgpKdWVyZ2VuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
