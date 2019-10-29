Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A083E8330
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 09:29:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPMpD-0002k7-DU; Tue, 29 Oct 2019 08:25:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9ckO=YW=amazon.de=prvs=19881d706=nmanthey@srs-us1.protection.inumbo.net>)
 id 1iPMpC-0002k2-ED
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 08:25:58 +0000
X-Inumbo-ID: bb822c44-fa25-11e9-bbab-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb822c44-fa25-11e9-bbab-bc764e2007e4;
 Tue, 29 Oct 2019 08:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1572337558; x=1603873558;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=mTsxnUdYwGGO9WLgLp2zRw2XZMXB1lT9xL/7A5Cz618=;
 b=ebSNTWCNSvYNoIidq0Zvu7Ul0psTJz1B7wO9NqnMtjXRGb4Kiz3RizTA
 wzgYx3PANGIdUMvcjiw+u1FD1laxyDRa01SjPUjAU7EnJLPz1bN/RhzOJ
 /ymEzP/A6kf8yQuxV/Qk5MNiqBUPreYDO0e/4rZHHpghqBaDT/ABf54rn k=;
IronPort-SDR: d5FTGODRQfgopriQssADZmthMCYSO8QnAF1iwPSqzQwAPw+czthQb+WKw97LA4WIyYl01+CWTm
 FOJWxgVc/Qcw==
X-IronPort-AV: E=Sophos;i="5.68,243,1569283200"; 
   d="scan'208";a="887350"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 29 Oct 2019 08:25:56 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 136E1A2B7C; Tue, 29 Oct 2019 08:25:55 +0000 (UTC)
Received: from EX13D02EUB001.ant.amazon.com (10.43.166.150) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 29 Oct 2019 08:25:54 +0000
Received: from uc1a35a69ae4659.ant.amazon.com (10.43.161.115) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 29 Oct 2019 08:25:47 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-3-andrew.cooper3@citrix.com>
 <9a76e252-b9a3-4454-6ca8-ab521276fc31@suse.com>
 <782089aa-7994-f471-3c52-2afb30f95812@citrix.com>
 <c12afdd1-c561-bc79-5c36-22ac2e994953@suse.com>
 <6d7c899e-81ab-bc61-a589-043b327b3137@citrix.com>
 <477a6513-0caf-fc4a-21cf-a3a101b6c5ca@suse.com>
 <5b6b2cd3-b8a5-7697-e6f4-f7c337242276@amazon.de>
 <5d075fd9-acbe-0fcd-8f22-9f49c61f657f@citrix.com>
From: Norbert Manthey <nmanthey@amazon.de>
Openpgp: preference=signencrypt
Autocrypt: addr=nmanthey@amazon.de; prefer-encrypt=mutual; keydata=
 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
 pEddsOqYwOs=
Message-ID: <15ce3d44-0eaf-c01b-8c80-b0067de9e249@amazon.de>
Date: Tue, 29 Oct 2019 09:25:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5d075fd9-acbe-0fcd-8f22-9f49c61f657f@citrix.com>
Content-Language: en-US
X-Originating-IP: [10.43.161.115]
X-ClientProxiedBy: EX13D23UWA001.ant.amazon.com (10.43.160.68) To
 EX13D02EUB001.ant.amazon.com (10.43.166.150)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 2/7] xen/nospec: Use always_inline to fix
 code gen for evaluate_nospec
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMjgvMTkgMTg6MDUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjUvMTAvMjAxOSAy
Mjo1NiwgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+PiBPbiAxMC8yNS8xOSAxNzo0MCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyNS4xMC4yMDE5IDE3OjI3LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IE9uIDI1LzEwLzIwMTkgMTM6MzQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAy
NS4xMC4yMDE5IDE0OjEwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+Pj4gVGhlIHR3byBjaG9p
Y2VzIHRvIHVuYmxvY2sgNC4xMyBhcmUgdGhpcyBwYXRjaCwgb3IgdGhlIHByZXZpb3VzIHZlcnNp
b24KPj4+Pj4+IHdoaWNoIG1hZGUgQ09ORklHX0hBUkRFTl9CUkFOQ0ggZGVwZW5kIG9uIEJST0tF
Tiwgd2hpY2ggd2FzIGV2ZW4gbW9yZQo+Pj4+Pj4gZGlzbGlrZWQuCj4+Pj4+IE9wdGlvbiAzIGlz
IHRvIGhhdmUganVzdCB0aGUgY29uZmlnIG9wdGlvbiwgZm9yIHBlb3BsZSB0byB0dXJuIHRoaXMK
Pj4+Pj4gb2ZmIGlmIHRoZXkgZmVlbCBsaWtlIGRvaW5nIHNvLgo+Pj4+IFllcywgYnV0IG5vLsKg
IEEgZmFjYWRlIG9mIHNlY3VyaXR5IGlzIHdvcnNlIHRoYW4gbm8gc2VjdXJpdHksIGFuZCBJCj4+
Pj4gZG9uJ3QgY29uc2lkZXIgZG9pbmcgdGhhdCBhbiBhY2NlcHRhYmxlIHNvbHV0aW9uIGluIHRo
aXMgY2FzZS4KPj4+IEJ1dCBJIHRob3VnaHQgd2UgYWxsIGFncmVlIHRoYXQgdGhpcyBpcyBzb21l
dGhpbmcgdGhhdCdzIHByZXN1bWFibHkKPj4+IGdvaW5nIHRvIHJlbWFpbiBpbmNvbXBsZXRlIChh
cyBpbiBub3QgcHJvdmFibHkgY29tcGxldGUpIGFsdG9nZXRoZXIKPj4+IGFueXdheS4gSXQncyBq
dXN0IHRoYXQgd2l0aG91dCB0aGUgY2hhbmdlIGhlcmUgaXQncyBmYXIgbW9yZQo+Pj4gaW5jb21w
bGV0ZSB0aGVuIHdpdGggaXQuCj4gVGhpcyBpcyBpbmhlcmVudGx5IGEgYmVzdC1lZmZvcnQgYXBw
cm9hY2gsIGJ1dCB3aXRob3V0IHRoZQo+IGFsd2F5c19pbmxpbmUsIGl0IGlzIHRhbnRhbW91bnQg
dG8gdXNlbGVzcy4KPgo+IE9ubHkgdGhlIGdyYW50IHRhYmxlIG9wZXJhdGlvbnMsIGFuZCBfX21m
bl92YWxpZCgpIGFyZSBjb3JyZWN0bHkKPiBwcm90ZWN0ZWQgd2l0aCB0aGUgY29kZSBpbiBpdHMg
Y3VycmVudCBmb3JtLCB3aGVyZSBhcyB0aGUgbGFyZ2UgY2hhbmdlcwo+IChpbiB0ZXJtcyBvZiBh
YnNvbHV0ZSBudW1iZXIgb2YgcHJvdGVjdGVkIHBhdGhzKSBjb21lcyBmcm9tIHRoZSBwcmVkaWNh
dGVzLgo+Cj4+PiBJbiBhbnkgZXZlbnQgSSB0aGluayB3ZSBzaG91bGQgKGFsc28pIGhhdmUgYW4g
b3BpbmlvbiBmcm9tIHRoZSBwZW9wbGUKPj4+IHdobyBoYWQgb3JpZ2luYWxseSBjb250cmlidXRl
ZCB0aGlzIGxvZ2ljLiBZb3UgZGlkbid0IENjIGFueW9uZSBvZgo+Pj4gdGhlbTsgSSd2ZSBhZGRl
ZCBhdCBsZWFzdCBOb3JiZXJ0IG5vdy4KPj4gVGhhbmtzIGZvciBhZGRpbmcgbWUuIEkgaGFkIGEg
cXVpY2sgbG9vayBpbnRvIHRoZSBkaXNjdXNzaW9uLiBPbmx5Cj4+IG1ha2luZyBhZGRpbmcgbGZl
bmNlIHN0YXRlbWVudHMgYXJvdW5kIGNvbmRpdGlvbmFscyBkZXBlbmRpbmcgb24gY29uZmlnCj4+
IEJST0tFTiBkb2VzIG5vdCBoZWxwLCBhcyBpdCB3b3VsZCBzdGlsbCBuZWVkIHRvIGJlIGFsd2F5
c19pbmxpbmUgdG8gd29yawo+PiBhcyBleHBlY3RlZCwgY29ycmVjdD8KPiAiZGVwZW5kcyBvbiBC
Uk9LRU4iIGlzIGEgd2F5IHRvIHVuY29uZGl0aW9uYWxseSBjb21waWxlIG91dAo+IGZ1bmN0aW9u
YWxpdHksIHdoaWNoIHdhcyBvbmUgb3B0aW9uIGNvbnNpZGVyZWQgdG8gdGhpcyBwcm9ibGVtLgo+
Cj4+IEhlbmNlLCBpbiBteSBvcGluaW9uLCB0aGlzIHBhdGNoIGRvZXMgdGhlIHJpZ2h0Cj4+IHRo
aW5nIHRvIGJlbmVmaXQgZnJvbSB0aGUgbGZlbmNlcyB0aGF0IGFyZSBwbGFjZWQgYWZ0ZXIgZXZh
bHVhdGlvbgo+PiBjb25kaXRpb25hbHMuCj4gVGhpcyBwYXRjaCBpcyB0aGUgYWx0ZXJuYXRpdmUg
dG8gY29tcGlsaW5nIGV2ZXJ5dGhpbmcgb3V0Lgo+Cj4gSSdtIHN0aWxsIGhvbGRpbmcgb3V0IGhv
cGUgdGhhdCB3ZSdsbCBmaW5kIGEgYmV0dGVyIGNvbXBpbGVyIGJhc2VkCj4gbWl0aWdhdGlvbiBp
biB0aGUgbG9uZ2VyIHRlcm0sIGJlY2F1c2UgSSBkb24ndCBzZWUgZWl0aGVyIG9mIHRoZXNlCj4g
b3B0aW9ucyBiZWluZyB2aWFibGUgc3RyYXRlZ2llcyBsb25ndGVybS4KCkkgZnVsbHkgYWdyZWUg
dGhhdCBpbiB0aGUgbG9uZyBydW4sIHdlIHNob3VsZCBoYXZlIGNvbXBpbGVyIHN1cHBvcnQsIHRv
CmUuZy4gbm90IG1vdmUgbGZlbmNlIHN0YXRlbWVudHMgYXJvdW5kLgoKSG93ZXZlciwgdW50aWwg
d2UgaGF2ZSB0aGF0LCB3ZSBzaG91bGQgYWxsb3cgdXNlcnMgb2YgWGVuIHRvIGdldCB0aGUKbGZl
bmNlIHN0YXRlbWVudHMgYXQgdGhlIGNvcnJlY3QgcG9zaXRpb25zIGFzIGEgYmVzdCBlZmZvcnQg
cHJhY3RpY2UuCkhlbmNlLCB0aGUgYWx3YXlzX2lubGluZSBtb2RpZmljYXRpb24gc2hvdWxkIGJl
IHRoZXJlLiBJbiBjYXNlIHlvdSBzdGlsbAp3YW50IHRvIGNvbXBpbGUgb3V0IHRoaXMgZnVuY3Rp
b25hbGl0eSwgeW91IGNvdWxkIGV2ZW4gYWRkIGEgZGVwZW5kZW5jeQpvbiBCUk9LRU4gb24gdG9w
LCBhbmQgdGhlbiB1c2VycyBjYW4gY2hvc2UgdG8gY29tcGlsZSBpdCBpbiwgYnV0IGF0CmxlYXN0
IGdldCBhIHZlcnNpb24gd2hlcmUgdGhlIGxmZW5jZXMgYXJlIHBsYWNlZCBhdCB0aGUgcmlnaHQg
cG9zaXRpb24uCgpCZXN0LApOb3JiZXJ0Cgo+Cj4gfkFuZHJldwoKCgoKQW1hem9uIERldmVsb3Bt
ZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2No
YWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRy
YWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0
ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
