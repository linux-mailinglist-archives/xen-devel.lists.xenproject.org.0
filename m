Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB4A168072
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:39:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59Pb-0001yZ-L4; Fri, 21 Feb 2020 14:36:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aa0I=4J=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j59Pa-0001yU-H2
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:36:14 +0000
X-Inumbo-ID: 82c44e68-54b7-11ea-868e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82c44e68-54b7-11ea-868e-12813bfff9fa;
 Fri, 21 Feb 2020 14:36:13 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j59PX-0004YX-TP; Fri, 21 Feb 2020 14:36:11 +0000
Received: from [62.60.63.48] (helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j59PX-0000Qw-Jy; Fri, 21 Feb 2020 14:36:11 +0000
Date: Fri, 21 Feb 2020 14:36:08 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200221143608.jexjistjxuijqkme@debian>
References: <4058e92ce21627731c49b588a95809dc0affd83a.1581015491.git.hongyxia@amazon.com>
 <20200221115017.tuo2i5db5mhd5yyt@debian>
 <2326943257e6f04bc9a858ef5667295651395c85.camel@amazon.com>
 <c373d061-4a1d-502b-98a3-d40ffa11ba47@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c373d061-4a1d-502b-98a3-d40ffa11ba47@suse.com>
User-Agent: NeoMutt/20180716
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
Cc: "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMDI6MzE6MDhQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjEuMDIuMjAyMCAxMzo1MiwgWGlhLCBIb25neWFuIHdyb3RlOgo+ID4gT24gRnJp
LCAyMDIwLTAyLTIxIGF0IDExOjUwICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+ID4+IE9uIFRodSwg
RmViIDA2LCAyMDIwIGF0IDA2OjU4OjIzUE0gKzAwMDAsIEhvbmd5YW4gWGlhIHdyb3RlOgo+ID4+
PiArICAgIGlmICggaGFzaG1mbiAhPSBtZm4gJiYgIXZjYWNoZS0+cmVmY250W2lkeF0gKQo+ID4+
PiArICAgICAgICBfX2NsZWFyX2JpdChpZHgsIHZjYWNoZS0+aW51c2UpOwo+ID4+Cj4gPj4gQWxz
bywgcGxlYXNlIGZsdXNoIHRoZSBsaW5lYXIgYWRkcmVzcyBoZXJlIGFuZCB0aGUgb3RoZXIgX19j
bGVhcl9iaXQKPiA+PiBsb2NhdGlvbi4KPiA+IAo+ID4gSSBmbHVzaCB3aGVuIGEgbmV3IGVudHJ5
IGlzIHRha2luZyBhIHNsb3QuIFllYWgsIGl0J3MgcHJvYmFibHkgYmV0dGVyCj4gPiB0byBmbHVz
aCBlYXJsaWVyIHdoZW5ldmVyIGEgc2xvdCBpcyBubyBsb25nZXIgaW4gdXNlLgo+IAo+IFF1ZXN0
aW9uIGlzIHdoZXRoZXIgc3VjaCBpbmRpdmlkdWFsIGZsdXNoZXMgYXJlbid0IGFjdHVhbGx5Cj4g
bW9yZSBvdmVyaGVhZCB0aGFuIGEgc2luZ2xlIGZsdXNoIGNvdmVyaW5nIGFsbCBwcmV2aW91c2x5
Cj4gdG9ybiBkb3duIGVudHJpZXMsIGRvbmUgYXQgc3VpdGFibGUgcG9pbnRzIChzZWUgdGhlIHBy
ZXNlbnQKPiBpbXBsZW1lbnRhdGlvbikuCgpJIGFza2VkIHRvIGZsdXNoIGJlY2F1c2UgSSB3YXMg
cGFyYW5vaWQgYWJvdXQgbGVhdmluZyBzdGFsZSBlbnRyeSBhZnRlcgp0aGUgc2xvdCBpcyByZWNs
YWltZWQuIEkgdGhpbmsgdGhlIGFkZHJlc3Mgd2lsbCBiZSBmbHVzaGVkIHdoZW4gYSBuZXcKZW50
cnkgaXMgaW5zZXJ0ZWQuCgpTbyB0aGUgcXVlc3Rpb24gd291bGQgYmUgd2hldGhlciB3ZSBjYXJl
IGFib3V0IGxlYXZpbmcgYSBzdGFsZSBlbnRyeSBpbgpwbGFjZSB1bnRpbCBhIG5ldyBvbmUgaXMg
aW5zZXJ0ZWQuCgpXZWkuCgo+IAo+IEphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
