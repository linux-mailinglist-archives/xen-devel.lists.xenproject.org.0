Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E24167EB5
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 14:34:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j58Ob-0001z6-5S; Fri, 21 Feb 2020 13:31:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j58OZ-0001z1-Uw
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 13:31:07 +0000
X-Inumbo-ID: 68fc1296-54ae-11ea-8660-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68fc1296-54ae-11ea-8660-12813bfff9fa;
 Fri, 21 Feb 2020 13:31:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BE626B165;
 Fri, 21 Feb 2020 13:31:05 +0000 (UTC)
To: "Xia, Hongyan" <hongyxia@amazon.com>
References: <4058e92ce21627731c49b588a95809dc0affd83a.1581015491.git.hongyxia@amazon.com>
 <20200221115017.tuo2i5db5mhd5yyt@debian>
 <2326943257e6f04bc9a858ef5667295651395c85.camel@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c373d061-4a1d-502b-98a3-d40ffa11ba47@suse.com>
Date: Fri, 21 Feb 2020 14:31:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2326943257e6f04bc9a858ef5667295651395c85.camel@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/domain_page: implement pure per-vCPU
 mapping infrastructure
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAyMCAxMzo1MiwgWGlhLCBIb25neWFuIHdyb3RlOgo+IE9uIEZyaSwgMjAyMC0w
Mi0yMSBhdCAxMTo1MCArMDAwMCwgV2VpIExpdSB3cm90ZToKPj4gT24gVGh1LCBGZWIgMDYsIDIw
MjAgYXQgMDY6NTg6MjNQTSArMDAwMCwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4+PiArICAgIGlmICgg
aGFzaG1mbiAhPSBtZm4gJiYgIXZjYWNoZS0+cmVmY250W2lkeF0gKQo+Pj4gKyAgICAgICAgX19j
bGVhcl9iaXQoaWR4LCB2Y2FjaGUtPmludXNlKTsKPj4KPj4gQWxzbywgcGxlYXNlIGZsdXNoIHRo
ZSBsaW5lYXIgYWRkcmVzcyBoZXJlIGFuZCB0aGUgb3RoZXIgX19jbGVhcl9iaXQKPj4gbG9jYXRp
b24uCj4gCj4gSSBmbHVzaCB3aGVuIGEgbmV3IGVudHJ5IGlzIHRha2luZyBhIHNsb3QuIFllYWgs
IGl0J3MgcHJvYmFibHkgYmV0dGVyCj4gdG8gZmx1c2ggZWFybGllciB3aGVuZXZlciBhIHNsb3Qg
aXMgbm8gbG9uZ2VyIGluIHVzZS4KClF1ZXN0aW9uIGlzIHdoZXRoZXIgc3VjaCBpbmRpdmlkdWFs
IGZsdXNoZXMgYXJlbid0IGFjdHVhbGx5Cm1vcmUgb3ZlcmhlYWQgdGhhbiBhIHNpbmdsZSBmbHVz
aCBjb3ZlcmluZyBhbGwgcHJldmlvdXNseQp0b3JuIGRvd24gZW50cmllcywgZG9uZSBhdCBzdWl0
YWJsZSBwb2ludHMgKHNlZSB0aGUgcHJlc2VudAppbXBsZW1lbnRhdGlvbikuCgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
