Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4E898158
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 19:34:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0URp-0000hB-7g; Wed, 21 Aug 2019 17:31:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7y8g=WR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i0URn-0000h3-NJ
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 17:30:59 +0000
X-Inumbo-ID: 6f9ea109-c439-11e9-adc9-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6f9ea109-c439-11e9-adc9-12813bfff9fa;
 Wed, 21 Aug 2019 17:30:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BA4C344;
 Wed, 21 Aug 2019 10:30:57 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57E1F3F718;
 Wed, 21 Aug 2019 10:30:56 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190819180125.17504-1-julien.grall@arm.com>
 <ddf69b87-e6f3-689a-17c6-84b00af7d475@citrix.com>
 <cf285756-588b-0682-ef35-73b3d183e9ed@arm.com>
 <720ddd9b-5d7c-fd28-91d9-259c4b5cda36@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6807f7e1-b92b-fa40-fb90-73754543b7a6@arm.com>
Date: Wed, 21 Aug 2019 18:30:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <720ddd9b-5d7c-fd28-91d9-259c4b5cda36@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/console: Fix build when
 CONFIG_DEBUG_TRACE=y
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMC8wOC8yMDE5IDE0OjEyLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDE5LzA4
LzIwMTkgMTk6MzcsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgQW5kcmV3LAo+Pgo+PiBPbiA4
LzE5LzE5IDc6MDQgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBPbiAxOS8wOC8yMDE5IDE5
OjAxLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gQ29tbWl0IGI1ZTZlMWVlOGRhICJ4ZW4vY29u
c29sZTogRG9uJ3QgdHJlYXQgTlVMIGNoYXJhY3RlciBhcyB0aGUgZW5kCj4+Pj4gb2YgdGhlIGJ1
ZmZlciIgZXh0ZW5kZWQgc2VyY29uX3B1dHMgdG8gdGFrZSB0aGUgbnVtYmVyIG9mIGNoYXJhY3Rl
cgo+Pj4+IHRvIHByaW50IGluIGFyZ3VtZW50Lgo+Pj4+Cj4+Pj4gU2FkbHksIGEgY291cGxlIG9m
IGNvdXBsZSBvZiB0aGUgY2FsbGVycyBpbiBkZWJ1Z3RyYWNlX2R1bXBfd29ya2VyKCkKPj4+PiB3
ZXJlIG5vdCBjb252ZXJ0ZWQuIFRoaXMgcmVzdWx0IHRvIGEgYnVpbGQgZmFpbHVyZSB3aGVuIGVu
YWJsaW5nCj4+Pj4gQ09ORklHX0RFQlVHX1RSQUNFLgo+Pj4+Cj4+Pj4gU3BvdHRlZCBieSBUcmF2
aXMgdXNpbmcgcmFuZGNvbmZpZwo+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+Cj4+Pj4gLS0tCj4+Pj4gIMKgIHhlbi9kcml2ZXJzL2NoYXIvY29u
c29sZS5jIHwgNSArKystLQo+Pj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIv
Y29uc29sZS5jIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKPj4+PiBpbmRleCAyYzE0YzJj
YTczLi45MjRkNDk3MWNhIDEwMDY0NAo+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29s
ZS5jCj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKPj4+PiBAQCAtMTE4NSwx
MSArMTE4NSwxMiBAQCBzdGF0aWMgdm9pZCBkZWJ1Z3RyYWNlX2R1bXBfd29ya2VyKHZvaWQpCj4+
Pj4gIMKgIMKgwqDCoMKgwqAgLyogUHJpbnQgb2xkZXN0IHBvcnRpb24gb2YgdGhlIHJpbmcuICov
Cj4+Pj4gIMKgwqDCoMKgwqAgQVNTRVJUKGRlYnVndHJhY2VfYnVmW2RlYnVndHJhY2VfYnl0ZXMg
LSAxXSA9PSAwKTsKPj4+PiAtwqDCoMKgIHNlcmNvbl9wdXRzKCZkZWJ1Z3RyYWNlX2J1ZltkZWJ1
Z3RyYWNlX3ByZF0pOwo+Pj4+ICvCoMKgwqAgc2VyY29uX3B1dHMoJmRlYnVndHJhY2VfYnVmW2Rl
YnVndHJhY2VfcHJkXSwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cmxl
bigmZGVidWd0cmFjZV9idWZbZGVidWd0cmFjZV9wcmRdKSk7Cj4+Pgo+Pj4gSXNuJ3QgdGhpcyBq
dXN0IGRlYnVndHJhY2VfYnl0ZXMgLSBkZWJ1Z3RyYWNlX3ByZCAtIDEgPwo+Pgo+PiBJIHRyaWVk
IGFuZCBpdCByZXN1bHRlZCB0byBwcmludCBhIGxvdCBvZiBAXiBvbiB0aGUgY29uc29sZS4gVGhp
cyBpcwo+PiBiZWNhdXNlIHRoZSByaW5nIG1heSBub3QgYmUgZnVsbC4KPj4KPj4gU28gdGhlIHBv
cnRpb24gYmV0d2VlbiBkZWJ1Z3RyYWNlX3ByZCBhbmQgZGVidWd0cmFjZV9ieXRlcyB3aWxsIGJl
Cj4+IGZ1bGwgb2YgemVyby4KPj4KPj4gTG9va2luZyBhdCB0aGUgY29kZSBhZ2FpbiwgSSB0aGlu
ayB0aGlzIHBvcnRpb24gYW5kIGVpdGhlciBiZSBmdWxsIG9mCj4+IHplcm8gY2hhcmFjdGVyIG9y
IGZ1bGwgb2Ygbm9uLXplcm8gY2hhcmFjdGVyLiBJbiBvdGhlciB3b3JkLCBhIG1peAo+PiB3b3Vs
ZCBub3QgYmUgcG9zc2libGUuIFNvIGhvdyBhYm91dDoKPj4KPj4gaWYgKCBkZWJ1Z3RyYWNlX2J1
ZltkZWJ1Z3RyYWNlX3ByZF0gIT0gJ1wwJyApCj4+ICDCoCBzZXJjb25fcHV0cygmZGVidWd0cmFj
ZV9idWZbZGVidWd0cmFjZV9wcmRdLAo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVi
dWd0cmFjZV9ieXRlcyAtIGRlYnVndHJhY2VfcHJkIC0gMSk7Cj4gCj4gTEdUTS7CoCBBY2tlZC1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClRoYW5rIHlvdSEg
SSB3aWxsIHVwZGF0ZSB0aGUgcGF0Y2ggYW5kIGNvbW1pdCBpdC4KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
