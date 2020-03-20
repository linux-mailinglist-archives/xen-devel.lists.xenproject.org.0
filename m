Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1111518C78F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 07:38:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFBEV-0000Ko-Oc; Fri, 20 Mar 2020 06:34:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ak30=5F=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jFBET-0000Kj-V6
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 06:34:13 +0000
X-Inumbo-ID: cf4b5830-6a74-11ea-bce6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf4b5830-6a74-11ea-bce6-12813bfff9fa;
 Fri, 20 Mar 2020 06:34:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B87A4ACA2;
 Fri, 20 Mar 2020 06:34:10 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
References: <20200319204025.2649661-1-dwmw2@infradead.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6ff2589e-3cb9-a8a3-ea22-0798b0574eb0@suse.com>
Date: Fri, 20 Mar 2020 07:34:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319204025.2649661-1-dwmw2@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] tools/xenstore: Do not abort
 xenstore-ls if a node disappears while iterating
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDMuMjAgMjE6NDAsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPiBGcm9tOiBEYXZpZCBX
b29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgo+IAo+IFRoZSBkb19scygpIGZ1bmN0aW9uIGhh
cyBzb21ld2hhdCBpbmNvbnNpc3RlbnQgaGFuZGxpbmcgb2YgZXJyb3JzLgo+IAo+IElmIHJlYWRp
bmcgdGhlIG5vZGUncyBjb250ZW50cyB3aXRoIHhzX3JlYWQoKSBmYWlscywgdGhlbiBkb19scygp
IHdpbGwKPiBqdXN0IHF1aWV0bHkgbm90IGRpc3BsYXkgdGhlIGNvbnRlbnRzLgo+IAo+IElmIHJl
YWRpbmcgdGhlIG5vZGUncyBwZXJtaXNzaW9ucyB3aXRoIHhzX2dldF9wZXJtaXNzaW9ucygpIGZh
aWxzLCB0aGVuCj4gZG9fbHMoKSB3aWxsIHByaW50IGEgd2FybmluZywgY29udGludWUsIGFuZCB1
bHRpbWF0ZWx5IHdvbid0IGV4aXQgd2l0aAo+IGFuIGVycm9yIGNvZGUgKHVubGVzcyBhbm90aGVy
IGVycm9yIGhhcHBlbnMpLgo+IAo+IElmIHJlY3Vyc2luZyBpbnRvIHRoZSBub2RlIHdpdGggeHNf
ZGlyZWN0b3J5KCkgZmFpbHMsIHRoZW4gZG9fbHMoKSB3aWxsCj4gYWJvcnQgaW1tZWRpYXRlbHks
IG5vdCBwcmludGluZyBhbnkgZnVydGhlciBub2Rlcy4KPiAKPiBGb3IgcGVyc2lzdGVudCBmYWls
dXJlIG1vZGVzIOKAlCBzdWNoIGFzIEVOT0VOVCBiZWNhdXNlIGEgbm9kZSBoYXMgYmVlbgo+IHJl
bW92ZWQsIG9yIEVBQ0NFUyBiZWNhdXNlIGl0IGhhcyBoYWQgaXRzIHBlcm1pc2lvbnMgY2hhbmdl
ZCBzaW5jZSB0aGUKPiB4c19kaXJlY3RvcnkoKSBvbiB0aGUgcGFyZW50IGRpcmVjdG9yeSByZXR1
cm5lZCBpdHMgbmFtZSDigJQgaXQncwo+IG9idmlvdXNseSBxdWl0ZSBsaWtlbHkgdGhhdCBpZiBl
aXRoZXIgb2YgdGhlIGZpcnN0IHR3byBlcnJvcnMgb2NjdXIgZm9yCj4gYSBnaXZlbiBub2RlLCB0
aGVuIHNvIHdpbGwgdGhlIHRoaXJkIGFuZCB0aHVzIHhlbnN0b3JlLWxzIHdpbGwgYWJvcnQuCj4g
Cj4gVGhlIEVOT0VOVCBvbmUgaXMgYWN0dWFsbHkgYSBmYWlybHkgY29tbW9uIGNhc2UsIGFuZCBo
YXMgY2F1c2VkIHRvb2xzIHRvCj4gZmFpbCB0byBjbGVhbiB1cCBhIG5ldHdvcmsgZGV2aWNlIGJl
Y2F1c2UgaXQgKmFwcGFyZW50bHkqIGFscmVhZHkKPiBkb2Vzbid0IGV4aXN0IGluIHhlbnN0b3Jl
Lgo+IAo+IFRoZXJlIGlzIGEgc2Nob29sIG9mIHRob3VnaHQgdGhhdCBzYXlzLCAiV2VsbCwgeGVu
c3RvcmUtbHMgcmV0dXJuZWQgYW4KPiBlcnJvci4gU28gdGhlIHRvb2xzIHNob3VsZCBub3QgdHJ1
c3QgaXRzIG91dHB1dC4iCj4gCj4gVGhlIG5hdHVyYWwgY29yb2xsYXJ5IG9mIHRoaXMgd291bGQg
c3VyZWx5IGJlIHRoYXQgdGhlIHRvb2xzIG11c3QgcmUtcnVuCj4geGVuc3RvcmUtbHMgYXMgbWFu
eSB0aW1lcyBhcyBpcyBuZWNlc3NhcnkgdW50aWwgaXRzIG1hbmFnZXMgdG8gZXhpdAo+IHdpdGhv
dXQgaGl0dGluZyB0aGUgcmFjZSBjb25kaXRpb24uIEkgYW0gbm90IGtlZW4gb24gdGhhdCBjb25j
bHVzaW9uLgo+IAo+IEZvciB0aGUgc3BlY2lmaWMgY2FzZSBvZiBFTk9FTlQgaXQgc2VlbXMgcmVh
c29uYWJsZSB0byBkZWNsYXJlIHRoYXQsCj4gYnV0IGZvciB0aGUgdGltaW5nLCB3ZSBtaWdodCBh
cyB3ZWxsIGp1c3Qgbm90IGhhdmUgc2VlbiB0aGF0IG5vZGUgYXQKPiBhbGwgd2hlbiBjYWxsaW5n
IHhzX2RpcmVjdG9yeSgpIGZvciB0aGUgcGFyZW50LiBCeSBpZ25vcmluZyB0aGUgZXJyb3IsCj4g
d2UgZ2l2ZSBhY2NlcHRhYmxlIG91dHB1dC4KCkhhdmUgeW91IHRob3VnaHQgYWJvdXQgdGhlIHBv
c3NpYmlsaXR5IHRvIGRvIHRoZSBjb21wbGV0ZSBoYW5kbGluZyBpbiBhCnNpbmdsZSB0cmFuc2Fj
dGlvbj8gVGhpcyB3b3VsZCBlbnN1cmUgYSBjb21wbGV0ZSBjb25zaXN0ZW50IHBpY3R1cmUKZnJv
bSB0aGUgdGltZSB0aGUgb3BlcmF0aW9uIGhhcyBzdGFydGVkLiBBbnkgaW5jb25zaXN0ZW5jeSBz
aG91bGQgYmUKcmVwb3J0ZWQgYXMgYW4gZXJyb3IgdGhlbi4KCgpKdWVyZ2VuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
