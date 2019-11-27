Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0790610ACB7
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 10:40:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZtm7-0000Iw-Ha; Wed, 27 Nov 2019 09:38:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bRVm=ZT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZtm6-0000Iq-4D
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 09:38:18 +0000
X-Inumbo-ID: a399abe4-10f9-11ea-b155-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a399abe4-10f9-11ea-b155-bc764e2007e4;
 Wed, 27 Nov 2019 09:38:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1434CB077;
 Wed, 27 Nov 2019 09:38:16 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
References: <20191126171747.3185988-1-george.dunlap@citrix.com>
 <20191126171747.3185988-2-george.dunlap@citrix.com>
 <3d32b122-e301-1d63-7767-f599547274d2@suse.com>
 <230ff6db-0cf8-b10e-b1b2-4cac12e2b01d@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5c591298-1321-614c-73a7-364df1ef6d89@suse.com>
Date: Wed, 27 Nov 2019 10:38:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <230ff6db-0cf8-b10e-b1b2-4cac12e2b01d@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMTkgMTA6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI3LjExLjIwMTkgMDU6
MzIsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDI2LjExLjE5IDE4OjE3LCBHZW9yZ2UgRHVu
bGFwIHdyb3RlOgo+Pj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGwuaAo+Pj4gKysrIGIvdG9vbHMv
bGlieGwvbGlieGwuaAo+Pj4gQEAgLTM2NCw4ICszNjQsOCBAQAo+Pj4gICAgICovCj4+PiAgICAj
ZGVmaW5lIExJQlhMX0hBVkVfQlVJTERJTkZPX0dSQU5UX0xJTUlUUyAxCj4+PiAgICAKPj4+IC0j
ZGVmaW5lIExJQlhMX01BWF9HUkFOVF9GUkFNRVNfREVGQVVMVCAzMgo+Pj4gLSNkZWZpbmUgTElC
WExfTUFYX01BUFRSQUNLX0ZSQU1FU19ERUZBVUxUIDEwMjQKPj4+ICsjZGVmaW5lIExJQlhMX01B
WF9HUkFOVF9GUkFNRVNfREVGQVVMVCAwCj4+PiArI2RlZmluZSBMSUJYTF9NQVhfTUFQVFJBQ0tf
RlJBTUVTX0RFRkFVTFQgMAo+Pgo+PiBJJ2QgcmF0aGVyIHVzZSAtMSBmb3IgdGhlICJub3Qgc3Bl
Y2lmaWVkIiB2YWx1ZS4gVGhpcyBhbGxvd3MgdG8gc2V0IGUuZy4KPj4gdGhlIG1hcHRyYWNrIGZy
YW1lcyB0byAwIGZvciBub24tZHJpdmVyIGRvbWFpbnMuCj4gCj4gWWVzLiBCdXQgaXQgaW4gdHVy
biB3b3VsZG4ndCBhbGxvdyB0YWtpbmcgMCB0byBtZWFuICJkZWZhdWx0IiBpbiB0aGUKPiBoeXBl
cnZpc29yLgoKVGhhdCBpcyBhIGxvZ2ljYWwgY29uc2VxdWVuY2UsIHllcy4KCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
