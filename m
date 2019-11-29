Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8750110D55B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:03:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaey0-0002aD-CN; Fri, 29 Nov 2019 12:01:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lAOS=ZV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iaexz-0002Zw-2E
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 12:01:43 +0000
X-Inumbo-ID: ff35ff46-129f-11ea-a3e3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff35ff46-129f-11ea-a3e3-12813bfff9fa;
 Fri, 29 Nov 2019 12:01:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5E8DFADFE;
 Fri, 29 Nov 2019 12:01:37 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <pdurrant@amazon.com>
References: <20191128165224.2959-1-pdurrant@amazon.com>
 <98816869-c1db-52c1-baba-b878cde88d7a@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8b5d973c-8cc7-6c52-acdc-e8f309fcaa9b@suse.com>
Date: Fri, 29 Nov 2019 13:01:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <98816869-c1db-52c1-baba-b878cde88d7a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13 v5] Rationalize max_grant_frames
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMTkgMTE6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI4LjExLjIwMTkgMTc6
NTIsIFBhdWwgRHVycmFudCB3cm90ZToKPj4gLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5j
Cj4+ICsrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+PiBAQCAtODQsMTEgKzg0LDQwIEBA
IHN0cnVjdCBncmFudF90YWJsZSB7Cj4+ICAgICAgIHN0cnVjdCBncmFudF90YWJsZV9hcmNoIGFy
Y2g7Cj4+ICAgfTsKPj4gICAKPj4gK3N0YXRpYyBpbnQgcGFyc2VfZ250dGFiX2xpbWl0KGNvbnN0
IGNoYXIgKnBhcmFtLCBjb25zdCBjaGFyICphcmcsCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgKnZhbHApCj4+ICt7Cj4+ICsgICAgY29uc3QgY2hhciAqZTsK
Pj4gKyAgICB1bnNpZ25lZCBsb25nIHZhbDsKPj4gKwo+PiArICAgIHZhbCA9IHNpbXBsZV9zdHJ0
b3VsKGFyZywgJmUsIDApOwo+PiArICAgIGlmICggKmUgKQo+PiArICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPj4gKwo+PiArICAgIGlmICggdmFsID4gSU5UX01BWCApCj4+ICsgICAgICAgIHJldHVy
biAtRVJBTkdFOwo+PiArCj4+ICsgICAgcmV0dXJuIDA7Cj4+ICt9Cj4gCj4gKnZhbHAgZG9lc24n
dCBnZXQgd3JpdHRlbiB0byBhbnltb3JlLiBXaXRoIHRoaXMgZml4ZWQgKGFuZCBubyBuZXcKPiBp
c3N1ZXMgaW50cm9kdWNlZCA7LSkgKSBoeXBlcnZpc29yIHNpZGUKPiBSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQW5kOgoKUmVsZWFzZS1hY2tlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
