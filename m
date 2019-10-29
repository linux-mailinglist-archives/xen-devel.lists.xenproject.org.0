Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BC0E87B2
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 13:05:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPQBn-0003xu-Gs; Tue, 29 Oct 2019 12:01:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1x1s=YW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPQBm-0003xp-Nl
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 12:01:30 +0000
X-Inumbo-ID: d667e350-fa43-11e9-bbab-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d667e350-fa43-11e9-bbab-bc764e2007e4;
 Tue, 29 Oct 2019 12:01:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 30F86B11B;
 Tue, 29 Oct 2019 12:01:27 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 "Stonehouse, Robert" <rjstone@amazon.co.uk>
References: <D5940155-716B-48BE-A00B-36FC0B5B41A9@amazon.com>
 <be32fef4-cab5-1c85-43fd-6119f965066e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <18473a1f-130a-b013-70cb-47527550fe78@suse.com>
Date: Tue, 29 Oct 2019 13:01:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <be32fef4-cab5-1c85-43fd-6119f965066e@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [stable-4.11] Heads-up: c719519 (x86/SMP: don't try
 to stop already stopped CPUs) causes 100% kexec/kdump failure
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Durrant,
 Paul" <pdurrant@amazon.com>, "Elnikety, Eslam" <elnikety@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTAuMjAxOSAxMjoyOSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBPbiAyOC8xMC8yMDE5
IDE3OjMwLCBTdG9uZWhvdXNlLCBSb2JlcnQgd3JvdGU6Cj4+IFRoaXMgaXMgYSBoZWFkcy11cCBh
cyBJIGhhdmUgb2JzZXJ2ZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbW1pdCAoYmFja3BvcnRlZCBv
bnRvIGFuIEFtYXpvbiA0LjExIHRyZWUpIGNhdXNlcyBrZXhlYyAoYW5kIGhlbmNlIGtkdW1wKSB0
byBmYWlsLiAKPj4gPT09PT09PT0KPj4gY29tbWl0IGM3MTk1MTlhNDE4M2QwNjMwMTIxZjZhYmVi
YTQyMGY0OWRiYzMyMjkKPj4gQXV0aG9yOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cj4+IEF1dGhvckRhdGU6IEZyaSBKdWwgNSAxMDozMjo0MSAyMDE5ICswMjAwCj4+IENvbW1pdDog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBDb21taXREYXRlOiBGcmkgSnVsIDUg
MTA6MzI6NDEgMjAxOSArMDIwMAo+Pgo+PiB4ODYvU01QOiBkb24ndCB0cnkgdG8gc3RvcCBhbHJl
YWR5IHN0b3BwZWQgQ1BVcwo+PiAgICAgCj4+ICAgICBJbiBwYXJ0aWN1bGFyIHdpdGggYW4gZW5h
YmxlZCBJT01NVSAoYnV0IG5vdCByZWFsbHkgbGltaXRlZCB0byB0aGlzCj4+ICAgICBjYXNlKSwg
dHJ5aW5nIHRvIGludm9rZSBmaXh1cF9pcnFzKCkgYWZ0ZXIgaGF2aW5nIGFscmVhZHkgZG9uZQo+
PiAgICAgZGlzYWJsZV9JT19BUElDKCkgLT4gY2xlYXJfSU9fQVBJQygpIGlzIGEgcmF0aGVyIGJh
ZCBpZGVhOgo+PiA9PT09PT09PQo+IAo+IFRoaXMgd2FzIGFscmVhZHkgZml4ZWQgaW4gc3RhZ2lu
ZyBieSAieDg2L2NyYXNoOiBmaXgga2V4ZWMgdHJhbnNpdGlvbiBicmVha2FnZSI6Cj4gCj4gCWh0
dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Y29tbWl0ZGlmZjtoPWY1
NjgxM2YzNDcwYzViNDk4Nzk2M2MzYzQxZTRmZTE2Yjk1YzVhM2YKPiAKPiBMb29rcyBsaWtlIGl0
IG5lZWRzIGluY2x1c2lvbiBpbnRvIDQuMTEgYnJhbmNoLgoKSG1tLCBpbiBwcmluY2lwbGUgSSBk
aWQgZmlzaCBvdXQgdGhpcyBvbmUgYW5kIGEgZmV3IG1vcmUgZm9yCmJhY2twb3J0aW5nLiBCdXQg
aXQgbG9va3MgbGlrZSBJJ3ZlIGFwcGxpZWQgdGhlbSB0byB0aGUgNC4xMgpicmFuY2ggb25seS4g
VGhhbmtzIGZvciBub3RpY2luZyEKCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
