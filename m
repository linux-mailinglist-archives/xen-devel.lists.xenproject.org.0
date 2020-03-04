Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8431795FD
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 17:59:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9XKB-0003tG-K8; Wed, 04 Mar 2020 16:56:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9XKA-0003tB-6H
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 16:56:46 +0000
X-Inumbo-ID: 21012aa8-5e39-11ea-b74d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21012aa8-5e39-11ea-b74d-bc764e2007e4;
 Wed, 04 Mar 2020 16:56:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F15B8ACAE;
 Wed,  4 Mar 2020 16:56:43 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-10-jgross@suse.com>
 <61640156-0e35-6808-829a-2eb8accbfb94@suse.com>
 <1a6e1c6c-7e88-3396-885b-62371bb24db4@suse.com>
 <36259bf3-8469-5aac-fb02-3966ae1500fd@suse.com>
 <fab9f226-e3a8-85c1-669c-07fd19325d18@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <725efae2-d7e4-1d13-5b25-7cd1a52a2a63@suse.com>
Date: Wed, 4 Mar 2020 17:56:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <fab9f226-e3a8-85c1-669c-07fd19325d18@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 09/12] xen: add runtime parameter access
 support to hypfs
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDMuMjAyMCAxNzozMSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwNC4wMy4yMCAx
NjoxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA0LjAzLjIwMjAgMTY6MDcsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAwNC4wMy4yMCAxMjozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMjYuMDIuMjAyMCAxMzo0NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gK3N0YXRp
YyB2b2lkIHVwZGF0ZV9lcHRfcGFyYW1fYXBwZW5kKGNvbnN0IGNoYXIgKnN0ciwgaW50IHZhbCkK
Pj4+Pj4gK3sKPj4+Pj4gKyAgICBjaGFyICpwb3MgPSBvcHRfZXB0X3NldHRpbmcgKyBzdHJsZW4o
b3B0X2VwdF9zZXR0aW5nKTsKPj4+Pj4gKwo+Pj4+PiArICAgIHNucHJpbnRmKHBvcywgc2l6ZW9m
KG9wdF9lcHRfc2V0dGluZykgLSAocG9zIC0gb3B0X2VwdF9zZXR0aW5nKSwKPj4+Pj4gKyAgICAg
ICAgICAgICAiLCVzPSVkIiwgc3RyLCB2YWwpOwo+Pj4+PiArfQo+Pj4+PiArCj4+Pj4+ICtzdGF0
aWMgdm9pZCB1cGRhdGVfZXB0X3BhcmFtKHZvaWQpCj4+Pj4+ICt7Cj4+Pj4+ICsgICAgc25wcmlu
dGYob3B0X2VwdF9zZXR0aW5nLCBzaXplb2Yob3B0X2VwdF9zZXR0aW5nKSwgInBtbD0lZCIsIG9w
dF9lcHRfcG1sKTsKPj4+Pj4gKyAgICBpZiAoIG9wdF9lcHRfYWQgPj0gMCApCj4+Pj4+ICsgICAg
ICAgIHVwZGF0ZV9lcHRfcGFyYW1fYXBwZW5kKCJhZCIsIG9wdF9lcHRfYWQpOwo+Pj4+Cj4+Pj4g
VGhpcyB3b24ndCBjb3JyZWN0bHkgcmVmbGVjdCByZWFsaXR5OiBJZiB5b3UgbG9vayBhdAo+Pj4+
IHZteF9pbml0X3ZtY3NfY29uZmlnKCksIGV2ZW4gYSBuZWdhdGl2ZSB2YWx1ZSBtZWFucyAidHJ1
ZSIgaGVyZSwKPj4+PiB1bmxlc3Mgb24gYSBzcGVjaWZpYyBBdG9tIG1vZGVsLiBJIHRoaW5rIGlu
aXRfZXB0X3BhcmFtKCkgd2FudHMKPj4+PiB0byBoYXZlIHRoYXQgZXJyYXR1bSB3b3JrYXJvdW5k
IGxvZ2ljIG1vdmVkIHRoZXJlLCBzdWNoIHRoYXQKPj4+PiB5b3UgY2FuIHRoZW4gYXNzbWUgdGhl
IHZhbHVlIHRvIGJlIG5vbi1uZWdhdGl2ZSBoZXJlLgo+Pj4KPj4+IEJ1dCBpc24ndCBub3QgbWVu
dGlvbmluZyBpdCBpbiB0aGUgLTEgY2FzZSBjb3JyZWN0PyAtMSBtZWFuczogZG8gdGhlCj4+PiBj
b3JyZWN0IHRoaW5nIG9uIHRoZSBjdXJyZW50IGhhcmR3YXJlLgo+Pgo+PiBXZWxsLCBJIHRoaW5r
IHRoZSBvdXRwdXQgaGVyZSBzaG91bGQgcmVwcmVzZW50IGVmZmVjdGl2ZSBzZXR0aW5ncywKPiAK
PiBUaGUgbWluaW11bSByZXF1aXJlbWVudCBpcyB0byByZWZsZWN0IHRoZSBlZmZlY3RpdmUgcGFy
YW1ldGVycywgbGlrZQo+IGNtZGxpbmUgaXMgZG9pbmcgZm9yIGJvb3QtdGltZSBvbmx5IHBhcmFt
ZXRlcnMuIFdpdGggcnVudGltZSBwYXJhbWV0ZXJzCj4gd2UgaGFkIG5vIHdheSBvZiB0ZWxsaW5n
IHdoYXQgd2FzIHNldCwgYW5kIHRoaXMgaXMgbm93IHBvc3NpYmxlLgo+IAo+PiBhbmQgYSBzdWIt
aXRlbSBzaG91bGQgYmUgc3VwcHJlc3NlZCBvbmx5IGlmIGEgc2V0dGluZyBoYXMgbm8gZWZmZWN0
Cj4+IGF0IGFsbCBpbiB0aGUgY3VycmVudCBzZXR1cCwgbGlrZSAuLi4KPj4KPj4+Pj4gKyAgICBp
ZiAoIG9wdF9lcHRfZXhlY19zcCA+PSAwICkKPj4+Pj4gKyAgICAgICAgdXBkYXRlX2VwdF9wYXJh
bV9hcHBlbmQoImV4ZWMtc3AiLCBvcHRfZXB0X2V4ZWNfc3ApOwo+Pj4+Cj4+Pj4gSSBhZ3JlZSBm
b3IgdGhpcyBvbmUgLSBpZiB0aGUgdmFsdWUgaXMgc3RpbGwgLTEsIGl0IGhhcyBuZWl0aGVyCj4+
Pj4gYmVlbiBzZXQgbm9yIGlzIGl0cyB2YWx1ZSBvZiBhbnkgaW50ZXJlc3QuCj4+Cj4+IC4uLiBo
ZXJlLgo+IAo+IEkgdGhpbmsgd2Ugc2hvdWxkIG5vdCBtaXggdXAgc3BlY2lmaWVkIHBhcmFtZXRl
cnMgYW5kIGVmZmVjdGl2ZQo+IHNldHRpbmdzLiBJbiBjYXNlIGFuIGVmZmVjdGl2ZSBzZXR0aW5n
IGlzIG9mIGNvbW1vbiBpbnRlcmVzdCBpdCBzaG91bGQKPiBiZSByZXBvcnRlZCB2aWEgYSBzcGVj
aWZpYyBub2RlIChsaWtlIGUuZy4gc3BlY2lmaWMgbWl0aWdhdGlvbiBzZXR0aW5ncwo+IHdoZXJl
IHRoZSBjbWRsaW5lIGlzIG5vdCBwcm92aWRpbmcgZW5vdWdoIGRldGFpbHMpLgoKQnV0IHRoZW4g
YSBib29sZWFuIG9wdGlvbiB0aGF0IHdhc24ndCBzcGVjaWZpZWQgb24gdGhlIGNvbW1hbmQgbGlu
ZQpzaG91bGQgcHJvZHVjZSBubyBvdXRwdXQgYXQgYWxsLiBBbmQgaGVuY2Ugd2UnZCBuZWVkIGEg
d2F5IHRvIHRlbGwKd2hldGhlciBhbiBvcHRpb24gd2FzIHNldCBmcm9tIGNvbW1hbmQgbGluZSBm
b3IgX2FsbF8gb2YgdGhlbS4gSQpkb24ndCB0aGluayB0aGlzIHdvdWxkIGJlIHZlcnkgaGVscGZ1
bC4KCkknbSBjdXJpb3VzIGlmIGFueW9uZSBlbHNlIGhhcyBhbnkgb3BpbmlvbiBlaXRoZXIgd2F5
IChvciB5ZXQKYW5vdGhlciBvbmUpIGhlcmU6CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
