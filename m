Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DD018D32E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 16:44:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFJlK-0007rA-8F; Fri, 20 Mar 2020 15:40:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jFJlJ-0007r5-0H
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 15:40:41 +0000
X-Inumbo-ID: 26ba102e-6ac1-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26ba102e-6ac1-11ea-92cf-bc764e2007e4;
 Fri, 20 Mar 2020 15:40:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6766ACB5;
 Fri, 20 Mar 2020 15:40:38 +0000 (UTC)
To: Paul Durrant <paul@xen.org>
References: <20200318173243.29183-1-paul@xen.org>
 <20200318173243.29183-4-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <67b41b97-c995-88c0-2f82-1af4c5750405@suse.com>
Date: Fri, 20 Mar 2020 16:40:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200318173243.29183-4-paul@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/3] mm: add 'is_special_page' inline
 function...
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDMuMjAyMCAxODozMiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IEZyb206IFBhdWwgRHVy
cmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAKPiAuLi4gdG8gY292ZXIgeGVuaGVhcCBhbmQg
UEdDX2V4dHJhIHBhZ2VzLgo+IAo+IFBHQ19leHRyYSBwYWdlcyBhcmUgaW50ZW5kZWQgdG8gaG9s
ZCBkYXRhIHN0cnVjdHVyZXMgdGhhdCBhcmUgYXNzb2NpYXRlZAo+IHdpdGggYSBkb21haW4gYW5k
IG1heSBiZSBtYXBwZWQgYnkgdGhhdCBkb21haW4uIFRoZXkgc2hvdWxkIG5vdCBiZSB0cmVhdGVk
Cj4gYXMgJ25vcm1hbCcgZ3Vlc3QgcGFnZXMgKGkuZS4gUkFNIG9yIHBhZ2UgdGFibGVzKS4gSGVu
Y2UsIGluIG1hbnkgY2FzZXMKPiB3aGVyZSBjb2RlIGN1cnJlbnRseSB0ZXN0cyBpc194ZW5faGVh
cF9wYWdlKCkgaXQgc2hvdWxkIGFsc28gY2hlY2sgZm9yCj4gdGhlIFBHQ19leHRyYSBiaXQgaW4g
J2NvdW50X2luZm8nLgo+IAo+IFRoaXMgcGF0Y2ggdGhlcmVmb3JlIGRlZmluZXMgaXNfc3BlY2lh
bF9wYWdlKCkgdG8gY292ZXIgYm90aCBjYXNlcyBhbmQKPiBjb252ZXJ0cyB0ZXN0cyBvZiBpc194
ZW5faGVhcF9wYWdlKCkgKG9yIG9wZW4gY29kZWQgdGVzdHMgb2YgUEdDX3hlbl9oZWFwKQo+IHRv
IGlzX3NwZWNpYWxfcGFnZSgpIHdoZXJlIHRoZSBwYWdlIGlzIGFzc2lnbmVkIHRvIGEgZG9tYWlu
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgo+IEFja2Vk
LWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKVGhlIGltcGxpZWQgYWNrIGhlcmUgaXMg
b24gdGhlIGFzc3VtcHRpb24gdGhhdCB1bHRpbWF0ZWx5IHRoZQpwZXItZG9tYWluIC0+eGVucGFn
ZV9saXN0IHdpbGwgZ28gYXdheSBhbHRvZ2V0aGVyLCBsZWF2aW5nIHVzCndpdGhvdXQgdGhlIGN1
cnJlbnRseSByZXN1bHRpbmcgbWl4LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
