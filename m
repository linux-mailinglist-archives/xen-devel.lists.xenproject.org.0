Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F78D0C77
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 12:18:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI917-0000Un-7c; Wed, 09 Oct 2019 10:16:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iI915-0000Ui-T9
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 10:16:23 +0000
X-Inumbo-ID: d7c424f1-ea7d-11e9-97e6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7c424f1-ea7d-11e9-97e6-12813bfff9fa;
 Wed, 09 Oct 2019 10:16:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D4B09AF77;
 Wed,  9 Oct 2019 10:16:21 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <d1ca6ac5-0ed4-200f-c4e0-7a657b8d8fa8@suse.com>
 <0945a089-6fdb-89aa-f5a8-b8cc35f83f17@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a7e1532-36cd-0b68-3655-c9ce990087ce@suse.com>
Date: Wed, 9 Oct 2019 12:16:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0945a089-6fdb-89aa-f5a8-b8cc35f83f17@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86/mm: don't needlessly veto migration
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
 Paul Durrant <paul@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMTAuMjAxOSAxODozOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOC8xMC8yMDE5
IDE3OjEwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gRnJvbTogUGF1bCBEdXJyYW50IDxwYXVsLmR1
cnJhbnRAY2l0cml4LmNvbT4KPj4KPj4gTm93IHRoYXQgeGwuY2ZnIGhhcyBhbiBvcHRpb24gdG8g
ZXhwbGljaXRseSBlbmFibGUgSU9NTVUgbWFwcGluZ3MgZm9yIGEKPj4gZG9tYWluLCBtaWdyYXRp
b24gbWF5IGJlIG5lZWRsZXNzbHkgdmV0b2VkIGR1ZSB0byB0aGUgY2hlY2sgb2YKPj4gaXNfaW9t
bXVfZW5hYmxlZCgpIGluIHBhZ2luZ19sb2dfZGlydHlfZW5hYmxlKCkuCj4+IFRoZXJlIGlzIGFj
dHVhbGx5IG5vIG5lZWQgdG8gcHJldmVudCBsb2dkaXJ0eSBmcm9tIGJlaW5nIGVuYWJsZWQgdW5s
ZXNzCj4+IGRldmljZXMgYXJlIGFzc2lnbmVkIHRvIGEgZG9tYWluLgo+Pgo+PiBOT1RFOiBXaGls
ZSBpbiB0aGUgbmVpZ2hib3VyaG9vZCwgdGhlIGJvb2xfdCBwYXJhbWV0ZXIgdHlwZSBpbgo+PiAg
ICAgICBwYWdpbmdfbG9nX2RpcnR5X2VuYWJsZSgpIGlzIHJlcGxhY2VkIHdpdGggYSBib29sIGFu
ZCB0aGUgZm9ybWF0Cj4+ICAgICAgIG9mIHRoZSBjb21tZW50IGluIGFzc2lnbl9kZXZpY2UoKSBp
cyBmaXhlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRA
Y2l0cml4LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+PiBSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
Cj4gCj4gU2VyaW91c2x5IEZGUy7CoCBXaHkgYW0gSSBoYXZpbmcgdG8gcmVwZWF0IG15c2VsZj/C
oCBXaGF0IGlmIGFueSB3YXkKPiB1bmNsZWFyIG9uIHRoZSBwcmV2aW91cyB0aHJlYWRzPwo+IAo+
IE5BQ0sgTkFDSyBOQUNLLgoKV2l0aCBHZW9yZ2UgaGF2aW5nIGdpdmVuIGhpcyBSLWIgSSdtIG5v
dyBpbiBhbiBhd2t3YXJkIHBvc2l0aW9uOgpJIHNob3VsZG4ndCBpZ25vcmUgdGhpcyB0cmlwbGUg
TkFDSyBhbmQgY29tbWl0IHRoZSBwYXRjaCwgYnV0CnRoZXJlJ3MgYWxzbyBubyBzZW5zaWJsZSB3
YXkgZm9yd2FyZCBoZXJlIHdoaWNoIHdvdWxkIGFsbG93IHRoZQpyZWdyZXNzaW9uIHRvIGJlIHRh
a2VuIGNhcmUgb2Ygd2l0aG91dCBjb21taXR0aW5nIHRoZSBwYXRjaCBpbgppdHMgY3VycmVudCBz
aGFwZS4gQXJlIHlvdSB3aWxsaW5nIHRvIHRha2UgYmFjayBhbGwgdGhyZWUgb2YgdGhlCk5BQ0tz
LCBhbGxvd2luZyB1cyB0byBjb250aW51ZSBkaXNjdXNzaW9uIG9uIHRoZSBjb250cm92ZXJzaWFs
CnBhcnQgb2YgUGF1bCdzIHBhdGNoIHdoaWxlIGFsc28gYWxsb3dpbmcgdGhlIG5vbi1jb250cm92
ZXJzaWFsCnBhcnQgdG8gZ28gaW4gcmlnaHQgYXdheT8KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
