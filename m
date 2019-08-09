Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A9A8747B
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 10:44:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw0TB-0001tx-Jw; Fri, 09 Aug 2019 08:41:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw0T9-0001ts-9c
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 08:41:51 +0000
X-Inumbo-ID: 85277dc2-ba81-11e9-a620-8bd3f88005ed
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85277dc2-ba81-11e9-a620-8bd3f88005ed;
 Fri, 09 Aug 2019 08:41:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8954AAE49;
 Fri,  9 Aug 2019 08:41:45 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190808152944.16287-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8ad0e308-2dff-ac27-8131-8edbfa792763@suse.com>
Date: Fri, 9 Aug 2019 10:41:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808152944.16287-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86/atomic: Improvements and
 simplifications to assembly constraints
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMjAxOSAxNzoyOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAgICogQ29uc3RyYWlu
dHMgaW4gdGhlIGZvcm0gIj1yIiAoeCkgOiAiMCIgKHgpIGNhbiBiZSBmb2xkZWQgdG8ganVzdCAi
K3IiICh4KQo+ICAgKiBTd2l0Y2ggdG8gdXNpbmcgbmFtZWQgcGFyYW1ldGVycyAobW9zdGx5IGZv
ciBsZWdpYmlsaXR5KSB3aGljaCBpbgo+ICAgICBwYXJ0aWN1bGFyIGhlbHBzIHdpdGguLi4KPiAg
ICogX194Y2hnKCksIF9fY21weGNoZygpIGFuZCBfX2NtcHhjaGdfdXNlcigpIG1vZGlmeSB0aGVp
ciBtZW1vcnkgb3BlcmFuZCwgc28KPiAgICAgbXVzdCBsaXN0IGl0IGFzIGFuIG91dHB1dCBvcGVy
YW5kLiAgVGhpcyBvbmx5IHdvcmtzIGJlY2F1c2UgdGhleSBlYWNoIGhhdmUKPiAgICAgYSBtZW1v
cnkgY2xvYmJlciB0byBnaXZlIHRoZSBjb25zdHJ1Y3QgZnVsbCBjb21waWxlci1iYXJyaWVyIHBy
b3BlcnRpZXMuCj4gICAqIEV2ZXJ5IG1lbW9yeSBvcGVyYW5kIGhhcyBhbiBleHBsaWNpdCBrbm93
biBzaXplLiAgTGV0dGluZyB0aGUgY29tcGlsZXIgc2VlCj4gICAgIHRoZSByZWFsIHNpemUgcmF0
aGVyIHRoYW4gb2JzY3VyaW5nIGl0IHdpdGggX194ZygpIGFsbG93cyBmb3IgdGhlIHJlbW92YWwK
PiAgICAgb2YgdGhlIGluc3RydWN0aW9uIHNpemUgc3VmZml4ZXMgd2l0aG91dCBpbnRyb2R1Y2lu
ZyBhbWJpZ3VpdHkuCj4gICAqIE1pc2Mgc3R5bGUgY2hhbmdlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKSW4gcHJpbmNpcGxl
IEkgd291bGQgZ2l2ZSB0aGlzIG15IFItYiwgYnV0IC4uLgoKPiBUaGUgcmVhc29uIHRoZSB2b2xh
dGlsZSBjYXN0IGluIF9fY21weGNoZ191c2VyKCkgY2FuJ3QgYmUgZHJvcHBlZCBpcyBiZWNhdXNl
Cj4gd2l0aG91dCBpdCwgdGhlIGNvbXBpbGVyIHVzZXMgYSBzdGFjayBjb3B5IHJhdGhlciB0aGFu
IHRoZSBpbi1tZW1vcnkgY29weSwKPiB3aGljaCBlbmRzIHVwIHRyaXBwaW5nOgo+IAo+ICAgIC8q
IEFsbG93ZWQgdG8gY2hhbmdlIGluIEFjY2Vzc2VkL0RpcnR5IGZsYWdzIG9ubHkuICovCj4gICAg
QlVHX09OKCh0IF4gb2xkKSAmIH4oaW50cHRlX3QpKF9QQUdFX0FDQ0VTU0VEfF9QQUdFX0RJUlRZ
KSk7CgouLi4gdGhpcyBpcyBjb25jZXJuaW5nIG1lLCBzZWVpbmcgdGhhdCBlbHNld2hlcmUgeW91
IGVsaW1pbmF0ZQpjYXN0cyB0byBwb2ludGVycyB0byB2b2xhdGlsZSAoYW5kIG9mdGVuIHlvdSBh
Y3RpdmVseSBjYXN0IGF3YXkKdGhlIGF0dHJpYnV0ZSBmcm9tIHRoZSBmdW5jdGlvbiBwYXJhbWV0
ZXJzKSwgd2hpY2ggd2FzIG9uZSBvZgp0aGUgZWZmZWN0cyBvZiBfX3hnKCkuIFRoZXJlZm9yZSBv
bmx5IHdpdGggInZvbGF0aWxlIiByZXN0b3JlZApldmVyeXdoZXJlIHdoZXJlIGl0IHdhcyBpbiBl
ZmZlY3QgYmVmb3JlCgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKQWx0ZXJuYXRpdmVseSBqdXN0aWZpY2F0aW9uIGZvciB0aGUgcmVtb3ZhbCB3b3VsZCBuZWVk
IHRvIGJlCmFkZGVkIHRvIHRoZSBkZXNjcmlwdGlvbi4KCkFzIHRvIHRoZSBkZXNjcmlwdGlvbjog
VGhlIGRyb3BwaW5nIG9mIHRoZSBzZW1pY29sb25zIGFmdGVyCnRoZSBMT0NLIHByZWZpeGVzIHdv
dWxkIHBlcmhhcHMgYmUgd29ydGggYW5vdGhlciBidWxsZXQgcG9pbnQ/Ckl0J3Mgbm90IHJlYWxs
eSBqdXN0IGEgIm1pc2Mgc3R5bGUgY2hhbmdlIiBpbW8uCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
