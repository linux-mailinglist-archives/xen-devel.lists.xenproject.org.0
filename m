Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 470AFE31CD
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 14:06:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNbpV-0003xb-Dt; Thu, 24 Oct 2019 12:03:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNbpU-0003xW-BV
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 12:03:00 +0000
X-Inumbo-ID: 37cc2c61-f656-11e9-949f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37cc2c61-f656-11e9-949f-12813bfff9fa;
 Thu, 24 Oct 2019 12:02:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8AD72B66C;
 Thu, 24 Oct 2019 12:02:57 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <36bbdcf7-28c3-b924-3d3a-145b6282bd0f@suse.com>
Date: Thu, 24 Oct 2019 14:03:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023135812.21348-6-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/7] x86/livepatch: Fail the build if
 duplicate symbols exist
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Norbert Manthey <nmanthey@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMjAxOSAxNTo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL0tjb25maWcKPiArKysgYi94ZW4vY29tbW9uL0tjb25maWcKPiBAQCAtMzYxLDkgKzM2MSwy
MyBAQCBjb25maWcgRkFTVF9TWU1CT0xfTE9PS1VQCj4gIAo+ICAJICBJZiB1bnN1cmUsIHNheSBZ
Lgo+ICAKPiArY29uZmlnIEVORk9SQ0VfVU5JUVVFX1NZTUJPTFMKPiArCWJvb2wgIkVuZm9yY2Ug
dW5pcXVlIHN5bWJvbHMiIGlmIExJVkVQQVRDSAo+ICsJZGVmYXVsdCB5IGlmIExJVkVQQVRDSAoK
SW5zdGVhZCBvZiB0d28gaWRlbnRpY2FsICJpZiIsIHdoeSBub3QgImRlcGVuZHMgb24gTElWRVBB
VENIIj8KCj4gKwktLS1oZWxwLS0tCj4gKwkgIE11bHRpcGxlIHN5bWJvbHMgd2l0aCB0aGUgc2Ft
ZSBuYW1lIGFyZW4ndCBnZW5lcmFsbHkgYSBwcm9ibGVtCj4gKwkgIHVubGVzcyBMaXZlIHBhdGNo
aW5nIGlzIHRvIGJlIHVzZWQuCj4gKwo+ICsJICBMaXZlcGF0Y2ggbG9hZGluZyBpbnZvbHZlcyBy
ZXNvbHZpbmcgcmVsb2NhdGlvbnMgYWdhaW5zdCBzeW1ib2wKPiArCSAgbmFtZXMsIGFuZCBhdHRl
bXB0aW5nIHRvIGEgZHVwbGljYXRlIHN5bWJvbCBpbiBhIGxpdmVwYXRjaCB3aWxsCj4gKwkgIHJl
c3VsdCBpbiBpbmNvcnJlY3QgbGl2ZXBhdGNoIGFwcGxpY2F0aW9uLgo+ICsKPiArCSAgVGhpcyBv
cHRpb24gc2hvdWxkIGJlIHVzZWQgdG8gZW5zdXJlIHRoYXQgYSBidWlsZCBvZiBYZW4gY2FuIGhh
dmUgYQo+ICsJICBsaXZlcGF0Y2ggYnVpbGQgYW5kIGFwcGx5IGNvcnJlY3RseS4KPiArCj4gIGNv
bmZpZyBTVVBQUkVTU19EVVBMSUNBVEVfU1lNQk9MX1dBUk5JTkdTCj4gLQlib29sICJTdXBwcmVz
cyBkdXBsaWNhdGUgc3ltYm9sIHdhcm5pbmdzIiBpZiAhTElWRVBBVENICj4gLQlkZWZhdWx0IHkg
aWYgIUxJVkVQQVRDSAo+ICsJYm9vbCAiU3VwcHJlc3MgZHVwbGljYXRlIHN5bWJvbCB3YXJuaW5n
cyIgaWYgIUVORk9SQ0VfVU5JUVVFX1NZTUJPTFMKPiArCWRlZmF1bHQgeSBpZiAhRU5GT1JDRV9V
TklRVUVfU1lNQk9MUwoKU2ltaWxhcmx5IGhlcmUgdGhlbi4gV2l0aCB0aGlzIGNoYW5nZWQsIG9y
IHdpdGggYSBwcm9wZXIgcmVhc29uCnN1cHBsaWVkClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
