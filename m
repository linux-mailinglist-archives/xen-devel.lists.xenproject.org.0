Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0003C12FA06
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 16:53:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inPDj-0003t5-DN; Fri, 03 Jan 2020 15:50:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inPDi-0003t0-1J
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 15:50:38 +0000
X-Inumbo-ID: c3c5dd8e-2e40-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3c5dd8e-2e40-11ea-b6f1-bc764e2007e4;
 Fri, 03 Jan 2020 15:50:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 28B47AC3F;
 Fri,  3 Jan 2020 15:50:28 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191223164329.3113378-1-george.dunlap@citrix.com>
 <20191223164329.3113378-5-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <20259a5a-1912-2c10-6f8c-19afbbf130d2@suse.com>
Date: Fri, 3 Jan 2020 16:51:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191223164329.3113378-5-george.dunlap@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] x86/mm: Remove force-invalidate loop
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTIuMjAxOSAxNzo0MywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBUaGUgY29tbWVudCBh
Ym91dCB0aGUgImZvcmNlLWludmFsaWRhdGUiIGxvb3AgZ2l2ZXMgdHdvIHJlYXNvbnMgZm9yCj4g
aXRzIGV4aXN0ZW5jZToKPiAKPiAxLiBCcmVha2luZyBjaXJjdWxhciAibGluZWFyIHBhZ2V0YWJs
ZSIgcmVmZXJlbmNlcwo+IAo+IDIuIENsZWFuaW5nIHVwIHBhcnRpYWxseS12YWxpZGF0ZWQgcGFn
ZXMuCj4gCj4gVGhlIGZpcnN0IHJlYXNvbiBiZWVuIGludmFsaWQgc2luY2UgWFNBLTI0MDogU2lu
Y2UgdGhlbiBpdCBoYXNuJ3QgYmVlbgo+IHBvc3NpYmxlIHRvIGdlbmVyYXRlIGNpcmN1bGFyIGxp
bmVhciBwYWdldGFibGUgcmVmZXJlbmNlcy4KPiAKPiBUaGUgc2Vjb25kIHJlYXNvbiBoYXMgYmVl
biBpbnZhbGlkIHNpbmNlIGxvbmcgYmVmb3JlIHRoYXQ6IEJlZm9yZQo+IGNhbGxpbmcgcmVsaW5x
dWlzaF9tZW1vcnkoKSwgZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkgY2FsbHMKPiB2Y3B1
X2Rlc3Ryb3lfcGFnZXRhYmxlcygpIG9uIGVhY2ggdmNwdTsgdGhpcyB3aWxsIGluIHR1cm4gY2Fs
bAo+IHB1dF9vbGRfZ3Vlc3RfdGFibGUoKSBvbiBlYWNoIHZjcHUuICBUaGUgcmVzdWx0IHNob3Vs
ZCBiZSB0aGF0IGl0J3MKPiBub3QgcG9zc2libGUgdG8gaGF2ZSB0b3AtbGV2ZWwgcGFydGlhbGx5
LWRldmFsaWRhdGVkIHBhZ2V0YWJsZXMgYnkgdGhlCj4gdGltZSB3ZSBnZXQgdG8gcmVsaW5xdWlz
aF9tZW1vcnkoKS4KClRoZXJlJ3MgYSBzdWJ0bGUgZGlmZmVyZW5jZTogVXAgaW4gdGhlIGVudW1l
cmF0aW9uIHlvdSBjb3JyZWN0bHkKc2F5ICJwYXJ0aWFsbHktdmFsaWRhdGVkIHBhZ2VzIi4gRG93
biBoZXJlIHlvdSBhbHNvIGNvcnJlY3RseSBzdGF0ZQp0aGF0IHB1dF9vbGRfZ3Vlc3RfdGFibGUo
KSBkZWFscyB3aXRoIHBhcnRpYWxseS1kZXZhbGlkYXRlZApwYWdldGFibGVzLiBUaGUgbGF0dGVy
IGluZGVlZCBzaG91bGRuJ3QgYmUgYWJsZSB0byBtYWtlIGl0IGhlcmUsCmJ1dCB3aGF0IGFib3V0
IG9uZXMgdGhhdCBoYXZlIGJlZW4gcGFydGlhbGx5IHZhbGlkYXRlZCAoYW5kIGhlbmNlCm5vdCBw
dXQgaW50byAtPmFyY2gub2xkX2d1ZXN0X3RhYmxlKSB3aGlsZSB0aGUgZG9tYWluIHdhcyBzdGls
bAphbGl2ZT8gKEkgdGhpbmsgdGhlIGNvZGUgY2hhbmdlIGlzIHN0aWxsIGNvcnJlY3QsIGJlY2F1
c2UKcGFydGlhbGx5IHZhbGlkYXRlZCBwYWdlcyBvdWdodCB0byBiZSB0YWtlbiBjYXJlIG9mIGNv
cnJlY3RseSwgYnV0CkknZCBwcmVmZXIgaWYgdGhlIGRlc2NyaXB0aW9uIG1hdGNoZWQgdGhlIGNo
YW5nZS4pCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
