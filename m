Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB64F134605
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:23:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipD9E-0003qN-P5; Wed, 08 Jan 2020 15:21:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jtyv=25=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipD9D-0003pu-I6
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 15:21:27 +0000
X-Inumbo-ID: 84821bae-322a-11ea-a38f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84821bae-322a-11ea-a38f-bc764e2007e4;
 Wed, 08 Jan 2020 15:21:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A4682B1EA;
 Wed,  8 Jan 2020 15:21:17 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200108143439.25580-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b0a131b-91e8-d557-8a87-476790158ca2@suse.com>
Date: Wed, 8 Jan 2020 16:21:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200108143439.25580-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/x86: clear per cpu stub page
 information in cpu_smpboot_free()
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxNTozNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBjcHVfc21wYm9vdF9m
cmVlKCkgcmVtb3ZlcyB0aGUgc3R1YnMgZm9yIHRoZSBjcHUgZ29pbmcgb2ZmbGluZSwgYnV0IGl0
Cj4gaXNuJ3QgY2xlYXJpbmcgdGhlIHJlbGF0ZWQgcGVyY3B1IHZhcmlhYmxlcy4gVGhpcyB3aWxs
IHJlc3VsdCBpbgo+IGNyYXNoZXMgd2hlbiBhIHN0dWIgcGFnZSBpcyByZWxlYXNlZCBkdWUgdG8g
YWxsIHJlbGF0ZWQgY3B1cyBnb25lCj4gb2ZmbGluZSBhbmQgb25lIG9mIHRob3NlIGNwdXMgZ29p
bmcgb25saW5lIGxhdGVyLgo+IAo+IEZpeCB0aGF0IGJ5IGNsZWFyaW5nIHN0dWJzLmFkZHIgYW5k
IHN0dWJzLm1mbiBpbiBvcmRlciB0byBhbGxvY2F0ZSBhCj4gbmV3IHN0dWIgcGFnZSB3aGVuIG5l
ZWRlZC4KCkkgd2FzIHJlYWxseSBob3BpbmcgZm9yIHlvdSB0byBtZW50aW9uIENQVSBwYXJraW5n
IGhlcmUuIEhvdyBhYm91dAoKIkZpeCB0aGF0IGJ5IGNsZWFyaW5nIHN0dWJzLm1mbiAoYW5kIGFs
c28gc3R1YnMuYWRkciBqdXN0IHRvIGJlIG9uCiB0aGUgc2FmZSBzaWRlKSBpbiBvcmRlciB0byBh
bGxvY2F0ZSBhIG5ldyBzdHViIHBhZ2Ugd2hlbiBuZWVkZWQsCiBpcnJlc3BlY3RpdmUgb2Ygd2hl
dGhlciB0aGUgQ1BVIGdldHMgcGFya2VkIG9yIHJlbW92ZWQuIgoKPiAtLS0gYS94ZW4vYXJjaC94
ODYvc21wYm9vdC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+IEBAIC05NDUsNiAr
OTQ1LDggQEAgc3RhdGljIHZvaWQgY3B1X3NtcGJvb3RfZnJlZSh1bnNpZ25lZCBpbnQgY3B1LCBi
b29sIHJlbW92ZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAocGVyX2NwdShzdHVi
cy5hZGRyLCBjcHUpIHwgflBBR0VfTUFTSykgKyAxKTsKPiAgICAgICAgICBpZiAoIGkgPT0gU1RV
QlNfUEVSX1BBR0UgKQo+ICAgICAgICAgICAgICBmcmVlX2RvbWhlYXBfcGFnZShtZm5fdG9fcGFn
ZShtZm4pKTsKPiArICAgICAgICBwZXJfY3B1KHN0dWJzLmFkZHIsIGNwdSkgPSAwOwo+ICsgICAg
ICAgIHBlcl9jcHUoc3R1YnMubWZuLCBjcHUpID0gMDsKCkxvb2tpbmcgbW9yZSBjbG9zZWx5LCBJ
IHRoaW5rIEknZCBwcmVmZXIgdGhlc2UgdHdvIGxpbmVzIChvZiB3aGljaAp0aGUgYWRkciBvbmUg
aXNuJ3Qgc3RyaWN0bHkgbmVlZGVkIGFueXdheSkgdG8gbW92ZSBhaGVhZCBvZiB0aGUKaWYoKS4K
CklmIHlvdSBhZ3JlZSwgSSdsbCBiZSBoYXBweSB0byBkbyBib3RoIHdoaWxlIGNvbW1pdHRpbmcu
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
