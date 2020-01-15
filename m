Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F40B913BE4E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 12:20:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irggL-0008D4-Lc; Wed, 15 Jan 2020 11:17:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wJf7=3E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irggJ-0008Cr-TA
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 11:17:51 +0000
X-Inumbo-ID: a5f343cc-3788-11ea-b89f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5f343cc-3788-11ea-b89f-bc764e2007e4;
 Wed, 15 Jan 2020 11:17:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DEE8DAC24;
 Wed, 15 Jan 2020 11:17:41 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200114203545.8897-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ad6edefe-a295-d00b-179b-c95efc5f34b0@suse.com>
Date: Wed, 15 Jan 2020 12:17:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200114203545.8897-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/list: Remove prefetching
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
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDEuMjAyMCAyMTozNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBYZW4gaW5oZXJpdGVk
IGl0cyBsaXN0IGluZnJhc3RydWN0dXJlIGZyb20gTGludXguICBPbmUgYXJlYSB3aGVyZSBoYXMg
ZmFsbGVuCj4gYmVoaW5kIGlzIHRoYXQgb2YgcHJlZmV0Y2hpbmcsIHdoaWNoIGFzIGl0IHR1cm5z
IG91dCBpcyBhIHBlcmZvcm1hbmNlIHBlbmFsdHkKPiBpbiBtb3N0IGNhc2VzLgo+IAo+IFByZWZl
dGNoIG9mIE5VTEwgb24geDg2IGlzIG5vdyB3aWRlbHkgbWVhc3VyZWQgdG8gaGF2ZSBnbGFjaWFs
IHBlcmZvcm1hbmNlCj4gcHJvcGVydGllcywgYW5kIHdpbGwgdW5jb25kaXRpb25hbGx5IGhpdCBv
biBldmVyeSBobGlzdCB1c2UgZHVlIHRvIHRoZQo+IHRlcm1pbmF0aW9uIGNvbmRpdGlvbi4KPiAK
PiBDcm9zcy1wb3J0IHRoZSBmb2xsb3dpbmcgTGludXggcGF0Y2hlczoKPiAKPiAgIDc1ZDY1YTQy
NWMgKDIwMTEpICJobGlzdDogcmVtb3ZlIHNvZnR3YXJlIHByZWZldGNoaW5nIGluIGhsaXN0IGl0
ZXJhdG9ycyIKPiAgIGU2NmVlZDY1MWYgKDIwMTEpICJsaXN0OiByZW1vdmUgcHJlZmV0Y2hpbmcg
ZnJvbSByZWd1bGFyIGxpc3QgaXRlcmF0b3JzIgo+ICAgYzBkMTVjYzdlZSAoMjAxMykgImxpbmtl
ZC1saXN0OiBSZW1vdmUgX19saXN0X2Zvcl9lYWNoIgoKSnVzdCBhcyBhbiBvYnNlcnZhdGlvbiAo
bm90IGFuIG9iamVjdGlvbiksIHRoZSAybmQgb2YgdGhlc2Ugc2F5cwoibm9ybWFsbHkgdGhlIGRv
d25zaWRlcyBhcmUgYmlnZ2VyIHRoYW4gdGhlIHVwc2lkZXMiLCB3aGljaCBtYWtlcwppdCB1bmJl
bGlldmFibHkgY2xlYXIgd2hhdCB0aGVzZSBzdXBwb3NlZCBkb3duc2lkZXMgYXJlLiBJIGNhbgph
Y2NlcHQgcHJlZmV0Y2hlcyB0aHJvdWdoIE5VTEwgdG8gYmUgaGFybWZ1bC4gSSBjYW4gYWxzbyBh
Y2NlcHQKcHJlZmV0Y2hlcyBvbiBzaW5nbGUgZW50cnkgbGlzdHMgdG8gbm90IGJlIHZlcnkgdXNl
ZnVsLiBCdXQgZG9lcwp0aGlzIGFsc28gcmVuZGVyIHRoZW0gdXNlbGVzcyBvbiBsb25nIGxpc3Rz
IHdpdGggbm90IG92ZXJseSBtdWNoCmNhY2hlIGNodXJuIGRvbmUgYnkgdGhlIGJvZHkgb2YgdGhl
IGl0ZXJhdGlvbiBsb29wPyBXb3VsZG4ndCBpdAphdCBsZWFzdCBiZSB3b3J0aHdoaWxlIHRvIGhh
dmUgbGlzdF9mb3JfZWFjaF9wcmVmZXRjaCgpIHJldGFpbmluZwpwcmlvciBiZWhhdmlvciwgYW5k
IHVzZSBpdCBpbiBwbGFjZXMgd2hlcmUgcHJlZmV0Y2hpbmcgY2FuIGJlCmRlZW1lZCB0byBoZWxw
PwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
