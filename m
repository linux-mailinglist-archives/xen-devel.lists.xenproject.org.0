Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1317D104E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 15:38:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIC7t-00035e-Cq; Wed, 09 Oct 2019 13:35:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iIC7r-00035V-At
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 13:35:35 +0000
X-Inumbo-ID: ab34b3ca-ea99-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab34b3ca-ea99-11e9-80e3-bc764e2007e4;
 Wed, 09 Oct 2019 13:35:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 23A22AC6E;
 Wed,  9 Oct 2019 13:35:33 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191009125252.3112-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8bd07732-9cd2-aa9b-3662-8da5fbabcaf4@suse.com>
Date: Wed, 9 Oct 2019 15:35:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009125252.3112-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/passthrough: fix migration of MSI
 when using posted interrupts
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Joe Jin <joe.jin@oracle.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTAuMjAxOSAxNDo1MiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFdoZW4gdXNpbmcg
cG9zdGVkIGludGVycnVwdHMgYW5kIHRoZSBndWVzdCBtaWdyYXRlcyBNU0kgZnJvbSB2Q1BVcyBY
ZW4KPiBuZWVkcyB0byBmbHVzaCBhbnkgcGVuZGluZyBQSVJSIHZlY3RvcnMgb24gdGhlIHByZXZp
b3VzIHZDUFUsIG9yIGVsc2UKPiB0aG9zZSB2ZWN0b3JzIGNvdWxkIGdldCB3cm9uZ2x5IGluamVj
dGVkIGF0IGEgbGF0ZXIgcG9pbnQgd2hlbiB0aGUgTVNJCj4gZmllbGRzIGFyZSBhbHJlYWR5IHVw
ZGF0ZWQuCj4gCj4gUmVuYW1lIHN5bmNfcGlyX3RvX2lyciB0byB2bGFwaWNfc3luY19waXJfdG9f
aXJyIGFuZCBleHBvcnQgaXQgc28gaXQKPiBjYW4gYmUgY2FsbGVkIHdoZW4gdXBkYXRpbmcgdGhl
IHBvc3RlZCBpbnRlcnJ1cHQgZGVzY3JpcHRvciBmaWVsZCBpbgo+IHBpX3VwZGF0ZV9pcnRlLiBX
aGlsZSB0aGVyZSBhbHNvIHJlbW92ZSB0aGUgdW5sb2NrX291dCBmcm9tCj4gcGlfdXBkYXRlX2ly
dGUsIGl0J3MgdXNlZCBpbiBhIHNpbmdsZSBnb3RvIGFuZCByZW1vdmluZyBpdCBtYWtlcyB0aGUK
PiBmdW5jdGlvbiBzbWFsbGVyLgo+IAo+IE5vdGUgdGhhdCBQSVJSIGlzIHN5bmNlZCB0byBJUlIg
Ym90aCBpbiBwdF9pcnFfZGVzdHJveV9iaW5kIGFuZAo+IHB0X2lycV9jcmVhdGVfYmluZCB3aGVu
IHRoZSBpbnRlcnJ1cHQgZGVsaXZlcnkgZGF0YSBpcyBiZWluZyB1cGRhdGVkLgo+IAo+IEFsc28g
c3RvcmUgdGhlIHZDUFUgSUQgaW4gbXVsdGktZGVzdGluYXRpb24gbW9kZSB3aGVuIHVzaW5nIHBv
c3RlZAo+IGludGVycnVwdHMgYW5kIHRoZSBpbnRlcnJ1cHQgaXMgYm91bmQgdG8gYSBzaW5nbGUg
dkNQVSBpbiBvcmRlciBmb3IKPiBwb3N0ZWQgaW50ZXJydXB0cyB0byBiZSB1c2VkLgo+IAo+IFdo
aWxlIHRoZXJlIGd1YXJkIHBpX3VwZGF0ZV9pcnRlIHdpdGggQ09ORklHX0hWTSBzaW5jZSBpdCdz
IG9ubHkgdXNlZAo+IHdpdGggSFZNIGd1ZXN0cy4KPiAKPiBSZXBvcnRlZC1ieTogSm9lIEppbiA8
am9lLmppbkBvcmFjbGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCkxpa2UgZm9yIHRoZSBvdGhlciBwYXRjaCBJJ2QgcHJlZmVyIHRvIHdhaXQgYSBs
aXR0bGUgd2l0aCBjb21taXR0aW5nCihldmVuIGlmIHRoZSBWVC1kIGFjayBhcHBlYXJlZCBxdWlj
a2x5KSB1bnRpbCBob3BlZnVsbHkgYSBUZXN0ZWQtYnkKY291bGQgYmUgcHJvdmlkZWQuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
