Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F6C118466
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 11:08:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iecPs-0005ix-Jg; Tue, 10 Dec 2019 10:06:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iecPq-0005ik-KC
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 10:06:50 +0000
X-Inumbo-ID: c800d60c-1b34-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c800d60c-1b34-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 10:06:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5739FABD6;
 Tue, 10 Dec 2019 10:06:49 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191209180638.47305-1-roger.pau@citrix.com>
 <db19e41f-9ecf-b999-23ce-075daf6dff22@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2214d2ca-271b-da04-14a1-7014c8faf6ed@suse.com>
Date: Tue, 10 Dec 2019 11:07:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <db19e41f-9ecf-b999-23ce-075daf6dff22@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: store cr4 during suspend/resume
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTIuMjAxOSAxMDo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOS8xMi8yMDE5
IDE4OjA2LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+IEN1cnJlbnRseSBjcjQgaXMgbm90IGNh
Y2hlZCBiZWZvcmUgc3VzcGVuc2lvbiwgYW5kIG1tdV9jcjRfZmVhdHVyZXMgaXMKPj4gdXNlZCBp
biBvcmRlciB0byByZXN0b3JlIHRoZSBleHBlY3RlZCBjcjQgdmFsdWUuIFRoaXMgaXMgY29ycmVj
dCBzbwo+PiBmYXIgYmVjYXVzZSB0aGUgdGFza2xldCB0aGF0IGV4ZWN1dGVzIHRoZSBzdXNwZW5k
L3Jlc3VtZSBjb2RlIGlzCj4+IHJ1bm5pbmcgaW4gdGhlIGlkbGUgdkNQVSBjb250ZXh0Lgo+Pgo+
PiBJbiBvcmRlciB0byBtYWtlIHRoZSBjb2RlIGxlc3MgZnJhZ2lsZSwgZXhwbGljaXRseSBzYXZl
IHRoZSBjdXJyZW50Cj4+IGNyNCB2YWx1ZSBiZWZvcmUgc3VzcGVuc2lvbiwgc28gdGhhdCBpdCBj
YW4gYmUgcmVzdG9yZWQgYWZ0ZXJ3YXJkcy4KPj4gVGhpcyBlbnN1cmVzIHRoYXQgdGhlIGNyNCB2
YWx1ZSBjYWNoZWQgaW4gdGhlIGNwdV9pbmZvIGRvZXNuJ3QgZ2V0IG91dAo+PiBvZiBzeW5jIGFm
dGVyIHJlc3VtZSBmcm9tIHN1c3BlbnNpb24uCj4+Cj4+IFN1Z2dlc3RlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBXaHk/wqAgVGhlcmUgaXMgbm90aGluZyBmcmFn
aWxlIGhlcmUuwqAgU3VzcGVuZC9yZXN1bWUgaXMgYWx3YXlzIGluIGlkbGUKPiBjb250ZXh0IGFu
ZCBsb2FkcyBvZiBvdGhlciBsb2dpYyBhbHJlYWR5IGRlcGVuZHMgb24gdGhpcy4KPiAKPiBJJ3Zl
IGJlZW4gc2xvd2x5IHN0cmlwcGluZyBvdXQgcmVkdW5kYW50IHNhdmVkIHN0YXRlIGxpa2UgdGhp
cy4KCldoZXJlIGl0J3MgY2xlYXJseSByZWR1bmRhbnQsIHRoaXMgaXMgZmluZS4gQnV0IEkgZG9u
J3QgdGhpbmsgaXQncwpzdWZmaWNpZW50bHkgY2xlYXIgaGVyZSwgYW5kIGdvaW5nIGJhY2sgdG8g
d2hhdCB3YXMgdGhlcmUgYmVmb3JlCmlzIGltbyBnZW5lcmFsbHkgbGVzcyBlcnJvciBwcm9uZSB0
aGFuIGdvaW5nIHRvIHNvbWUgZml4ZWQgc3RhdGUuCkZ1cnRoZXJtb3JlIEkgd2FzIGhvcGluZyB3
ZSBjb3VsZCBldmVudHVhbGx5IGRvIGF3YXkgd2l0aAptbXVfY3I0X2ZlYXR1cmVzLgoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
