Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ACF10AEC8
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 12:36:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZvaA-00049Q-Ko; Wed, 27 Nov 2019 11:34:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZva8-00049L-Sk
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 11:34:04 +0000
X-Inumbo-ID: d070a644-1109-11ea-a3af-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d070a644-1109-11ea-a3af-12813bfff9fa;
 Wed, 27 Nov 2019 11:34:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 580D3AAC2;
 Wed, 27 Nov 2019 11:34:03 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191118101600.94645-1-roger.pau@citrix.com>
 <14ccf9a0-ecb4-6e09-6461-99f989353f34@suse.com>
 <20191118140302.GL72134@Air-de-Roger>
 <3e543cfd-d81a-1a4b-0268-7b121ae23c23@suse.com>
 <20191118145554.GN72134@Air-de-Roger>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D611FB5@SHSMSX104.ccr.corp.intel.com>
 <20191127110332.GN980@Air-de-Roger>
 <8b5eebe0-0f72-7dee-37a7-1b2b94e85e5d@suse.com>
 <20191127112927.GQ980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dad60c23-5b3f-d93a-a512-80705ccd7e32@suse.com>
Date: Wed, 27 Nov 2019 12:34:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191127112927.GQ980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vmx: always sync PIR to IRR
 before vmentry
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMjAxOSAxMjoyOSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gV2VkLCBO
b3YgMjcsIDIwMTkgYXQgMTI6MTY6MzdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDI3LjExLjIwMTkgMTI6MDMsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+Pj4gT24gV2VkLCBO
b3YgMjcsIDIwMTkgYXQgMDI6MDc6MTZBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+Pj4g
VGhlbiB3aGF0J3MgdGhlIGRpZmZlcmVuY2UgZnJvbSBvcmlnaW5hbCBsb2dpYz8KPj4+Cj4+PiBU
aGUgb3JpZ2luYWwgbG9naWMgaXM6Cj4+Pgo+Pj4gaWYgKCBydW5uaW5nICYmIChpbl9pcnEoKSB8
fCAodiAhPSBjdXJyZW50KSkgKQo+Pj4gewo+Pj4gICAgICAgICB1bnNpZ25lZCBpbnQgY3B1ID0g
di0+cHJvY2Vzc29yOwo+Pj4KPj4+ICAgICAgICAgaWYgKCBjcHUgIT0gc21wX3Byb2Nlc3Nvcl9p
ZCgpICkKPj4+ICAgICAgICAgICAgIHNlbmRfSVBJX21hc2soY3B1bWFza19vZihjcHUpLCBwb3N0
ZWRfaW50cl92ZWN0b3IpOwo+Pj4gICAgICAgICBlbHNlIGlmICggIXNvZnRpcnFfcGVuZGluZyhj
cHUpICkKPj4+ICAgICAgICAgICAgIHJhaXNlX3NvZnRpcnEoVkNQVV9LSUNLX1NPRlRJUlEpOwo+
Pj4gfQo+Pj4KPj4+IFdoaWNoIEkgZmluZCBtdWNoIGhhcmRlciB0byB1bmRlcnN0YW5kLiBGb3Ig
ZXhhbXBsZSBJJ20gbm90IHN1cmUgb2YKPj4+IHdoYXQncyB0aGUgYmVuZWZpdCBvZiBkb2luZyB0
aGUgY3B1ICE9IHNtcF9wcm9jZXNzb3JfaWQoKSBjaGVjawo+Pj4gaW5zdGVhZCBvZiBzaW1wbHkg
ZG9pbmcgdiAhPSBjdXJyZW50IChsaWtlIGluIHRoZSBvdXRlciBpZiBjb25kaXRpb24pLgo+Pgo+
PiBUaGVyZSBhcmUgdHdvIGFzcGVjdHMgdG8gY29uc2lkZXI6IE9uZSBpcyB0aGF0IHYtPnByb2Nl
c3Nvcgo+PiBtYXkgZXF1YWwgc21wX3Byb2Nlc3Nvcl9pZCgpIGFsc28gZm9yIHYgIT0gY3VycmVu
dC4gVGhlIG90aGVyCj4+IGlzIHRoYXQgd2l0aG91dCB0aGlzIGNoZWNrIGluIHRoZSBpZigpIGl0
IHdvdWxkIG5lZWQgYWRkaW5nCj4+IHRvIHRoZSBlbHNlLWlmKCkuIEknbSBub3Qgc3VyZSB0byB3
aGF0IGRlZ3JlZSB3aGljaCBvZiB0aGUKPj4gdHdvIG1hdHRlcnMgZnVuY3Rpb25hbGl0eSB3aXNl
Lgo+IAo+IFNpbmNlIHRoZSB2Q1BVIGlzIHJ1bm5pbmcgdi0+cHJvY2Vzc29yIGNhbiBvbmx5IGVx
dWFsIHNtcF9wcm9jZXNzb3JfaWQKPiBpZiB2ID09IGN1cnJlbnQsCgpXaGF0IHRlbGxzIHlvdSB0
aGF0IGl0IGlzIHJ1bm5pbmc/IEl0IGhhZCBiZWVuIHJ1bm5pbmcgYXQgdGhlCnRpbWUgdGhlIGZs
YWcgd2FzIGxhdGNoZWQgKGJlZm9yZSB2Y3B1X3VuYmxvY2soKSksIGJ1dCBtYXkKaGF2ZSBnb3Qg
ZGUtc2NoZWR1bGVkIGluIHRoZSBtZWFudGltZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
