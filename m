Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E301680FB
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:58:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59iC-0004s2-Ai; Fri, 21 Feb 2020 14:55:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j59iB-0004rx-LF
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:55:27 +0000
X-Inumbo-ID: 31ecc2a6-54ba-11ea-b0fd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31ecc2a6-54ba-11ea-b0fd-bc764e2007e4;
 Fri, 21 Feb 2020 14:55:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5E7F1AC1D;
 Fri, 21 Feb 2020 14:55:26 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <4058e92ce21627731c49b588a95809dc0affd83a.1581015491.git.hongyxia@amazon.com>
 <20200221115017.tuo2i5db5mhd5yyt@debian>
 <2326943257e6f04bc9a858ef5667295651395c85.camel@amazon.com>
 <c373d061-4a1d-502b-98a3-d40ffa11ba47@suse.com>
 <20200221143608.jexjistjxuijqkme@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7c4d3a86-091d-c3db-8bfd-1b2a14b1639f@suse.com>
Date: Fri, 21 Feb 2020 15:55:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221143608.jexjistjxuijqkme@debian>
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
 Julien" <jgrall@amazon.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Xia,
 Hongyan" <hongyxia@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAyMCAxNTozNiwgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIEZlYiAyMSwgMjAy
MCBhdCAwMjozMTowOFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjEuMDIuMjAy
MCAxMzo1MiwgWGlhLCBIb25neWFuIHdyb3RlOgo+Pj4gT24gRnJpLCAyMDIwLTAyLTIxIGF0IDEx
OjUwICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+Pj4+IE9uIFRodSwgRmViIDA2LCAyMDIwIGF0IDA2
OjU4OjIzUE0gKzAwMDAsIEhvbmd5YW4gWGlhIHdyb3RlOgo+Pj4+PiArICAgIGlmICggaGFzaG1m
biAhPSBtZm4gJiYgIXZjYWNoZS0+cmVmY250W2lkeF0gKQo+Pj4+PiArICAgICAgICBfX2NsZWFy
X2JpdChpZHgsIHZjYWNoZS0+aW51c2UpOwo+Pj4+Cj4+Pj4gQWxzbywgcGxlYXNlIGZsdXNoIHRo
ZSBsaW5lYXIgYWRkcmVzcyBoZXJlIGFuZCB0aGUgb3RoZXIgX19jbGVhcl9iaXQKPj4+PiBsb2Nh
dGlvbi4KPj4+Cj4+PiBJIGZsdXNoIHdoZW4gYSBuZXcgZW50cnkgaXMgdGFraW5nIGEgc2xvdC4g
WWVhaCwgaXQncyBwcm9iYWJseSBiZXR0ZXIKPj4+IHRvIGZsdXNoIGVhcmxpZXIgd2hlbmV2ZXIg
YSBzbG90IGlzIG5vIGxvbmdlciBpbiB1c2UuCj4+Cj4+IFF1ZXN0aW9uIGlzIHdoZXRoZXIgc3Vj
aCBpbmRpdmlkdWFsIGZsdXNoZXMgYXJlbid0IGFjdHVhbGx5Cj4+IG1vcmUgb3ZlcmhlYWQgdGhh
biBhIHNpbmdsZSBmbHVzaCBjb3ZlcmluZyBhbGwgcHJldmlvdXNseQo+PiB0b3JuIGRvd24gZW50
cmllcywgZG9uZSBhdCBzdWl0YWJsZSBwb2ludHMgKHNlZSB0aGUgcHJlc2VudAo+PiBpbXBsZW1l
bnRhdGlvbikuCj4gCj4gSSBhc2tlZCB0byBmbHVzaCBiZWNhdXNlIEkgd2FzIHBhcmFub2lkIGFi
b3V0IGxlYXZpbmcgc3RhbGUgZW50cnkgYWZ0ZXIKPiB0aGUgc2xvdCBpcyByZWNsYWltZWQuIEkg
dGhpbmsgdGhlIGFkZHJlc3Mgd2lsbCBiZSBmbHVzaGVkIHdoZW4gYSBuZXcKPiBlbnRyeSBpcyBp
bnNlcnRlZC4KPiAKPiBTbyB0aGUgcXVlc3Rpb24gd291bGQgYmUgd2hldGhlciB3ZSBjYXJlIGFi
b3V0IGxlYXZpbmcgYSBzdGFsZSBlbnRyeSBpbgo+IHBsYWNlIHVudGlsIGEgbmV3IG9uZSBpcyBp
bnNlcnRlZC4KCldlbGwsIHdlIGFwcGFyZW50bHkgZG9uJ3QgaGF2ZSBhbiBpc3N1ZSB3aXRoIHN1
Y2ggdG9kYXksIHNvCnVubGVzcyBleHBsaWNpdGx5IHN0YXRlZCB0byB0aGUgY29udHJhcnkgSSB0
aGluayBhbnkgcmVwbGFjZW1lbnQKaW1wbGVtZW50YXRpb24gY2FuIGFuZCBzaG91bGQgbWFrZSB0
aGUgc2FtZSBhc3N1bXB0aW9ucyAvCmd1YXJhbnRlZXMuCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
