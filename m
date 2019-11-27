Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3A310A96E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 05:37:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZp27-0000H2-7H; Wed, 27 Nov 2019 04:34:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bRVm=ZT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZp25-0000Gt-TK
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 04:34:29 +0000
X-Inumbo-ID: 33138518-10cf-11ea-a3ab-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33138518-10cf-11ea-a3ab-12813bfff9fa;
 Wed, 27 Nov 2019 04:34:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9E5C3AD26;
 Wed, 27 Nov 2019 04:34:28 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20191126171747.3185988-1-george.dunlap@citrix.com>
 <20191126171747.3185988-2-george.dunlap@citrix.com>
 <09d31a70-9f03-85fa-9772-8205eade6f08@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d34bdb0d-cd47-4007-48c0-317163552e91@suse.com>
Date: Wed, 27 Nov 2019 05:34:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <09d31a70-9f03-85fa-9772-8205eade6f08@citrix.com>
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
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMTkgMTg6MzAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gMTEvMjYvMTkgNTox
NyBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gLSB4bCB3aWxsIHVzZSB0aGUgbGlieGwgZGVm
YXVsdCBmb3IgbWFwdHJhY2ssIGJ1dCBkb2VzIGl0cyBvd24gZGVmYXVsdAo+PiAgICBjYWxjdWxh
dGlvbiBmb3IgZ3JhbnQgZnJhbWVzOiBlaXRoZXIgMzIgb3IgNjQsIGJhc2VkIG9uIHRoZSBtYXgK
Pj4gICAgcG9zc2libGUgbWZuLgo+IAo+IFtzbmlwXQo+IAo+PiBAQCAtMTk5LDEzICsxOTgsNiBA
QCBzdGF0aWMgdm9pZCBwYXJzZV9nbG9iYWxfY29uZmlnKGNvbnN0IGNoYXIgKmNvbmZpZ2ZpbGUs
Cj4+ICAgCj4+ICAgICAgIGlmICgheGx1X2NmZ19nZXRfbG9uZyAoY29uZmlnLCAibWF4X2dyYW50
X2ZyYW1lcyIsICZsLCAwKSkKPj4gICAgICAgICAgIG1heF9ncmFudF9mcmFtZXMgPSBsOwo+PiAt
ICAgIGVsc2Ugewo+PiAtICAgICAgICBsaWJ4bF9waHlzaW5mb19pbml0KCZwaHlzaW5mbyk7Cj4+
IC0gICAgICAgIG1heF9ncmFudF9mcmFtZXMgPSAobGlieGxfZ2V0X3BoeXNpbmZvKGN0eCwgJnBo
eXNpbmZvKSAhPSAwIHx8Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIShwaHlzaW5m
by5tYXhfcG9zc2libGVfbWZuID4+IDMyKSkKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ID8gMzIgOiA2NDsKPj4gLSAgICAgICAgbGlieGxfcGh5c2luZm9fZGlzcG9zZSgmcGh5c2luZm8p
Owo+PiAtICAgIH0KPiAKPiBTb3JyeSwgbWVhbnQgdG8gYWRkIGEgcGF0Y2ggdG8gYWRkIHRoaXMg
ZnVuY3Rpb25hbGl0eSBiYWNrIGludG8gdGhlCj4gaHlwZXJ2aXNvciAtLSBpLmUuLCBzbyB0aGF0
IG9wdF9tYXhfZ3JhbnRfZnJhbWVzIHdvdWxkIGJlIDMyIG9uIHN5c3RlbXMKPiB3aXRoIDMyLWJp
dCBtZm5zLgo+IAo+IEJ1dCB0aGlzIHNlZW1zIGxpa2UgYSBmYWlybHkgc3RyYW5nZSBjYWxjdWxh
dGlvbiBhbnl3YXk7IGl0J3Mgbm90IGNsZWFyCj4gdG8gbWUgd2hlcmUgaXQgd291bGQgaGF2ZSBj
b21lIGZyb20uCm1mbnMgYWJvdmUgdGhlIDMyLWJpdCBsaW1pdCByZXF1aXJlIHRvIHVzZSBncmFu
dCB2Mi4gVGhpcyBpbiB0dXJuCmRvdWJsZXMgdGhlIGdyYW50IGZyYW1lcyBuZWVkZWQgZm9yIHRo
ZSBzYW1lIG51bWJlciBvZiBncmFudHMuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
