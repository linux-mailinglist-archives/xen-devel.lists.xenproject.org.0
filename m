Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA8A145490
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 13:51:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuFRQ-0005tG-W4; Wed, 22 Jan 2020 12:49:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cJAe=3L=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iuFRQ-0005t9-92
 for xen-devel@lists.xen.org; Wed, 22 Jan 2020 12:49:04 +0000
X-Inumbo-ID: 8c7f42fa-3d15-11ea-8e9a-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c7f42fa-3d15-11ea-8e9a-bc764e2007e4;
 Wed, 22 Jan 2020 12:48:55 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t23so3044242wmi.1
 for <xen-devel@lists.xen.org>; Wed, 22 Jan 2020 04:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PjGNO/20XuU1JJbuRPDeshWK6GFNdYI+Ivblcc5AQ+8=;
 b=V5y4kF4fPOMHmqFrAIHbmjK2jn0B9lubwPv3ijLB6+/VLzbdBuUGNwft3CH6PB2uCS
 +mkLXb0ZGX9H/ZCxADjGdCr3rgk+Wp5hCG7jSIGHpdExCVtx6jzZ3jkF9UiRXpdpXEZR
 SDyeuaBxWy2jf2RaM3BroHI61MEEAWu8I4j+J4EIqwOMot0nYtvH/aIO7hgJ5qPoo6QQ
 EKKyGvU5b+aO+B7hY5Df/1Q6XYoUruvsudMvdcYBQMxsM3Xqsc/cRGrraeg08nrPhTmc
 QVU6nuCIv2M7rLddiBbTl3lLy7nF1KIkYAA1PM6xUaWxaVAHelUnEfmJHanFhL/Kn2DG
 YZag==
X-Gm-Message-State: APjAAAWclq9dEwkuO+2bVf22N0Y+G8gBYP+2iCnkO910PW+B2bNVXXXS
 eIf2dyRBXxQyj3zx0JuvyGg=
X-Google-Smtp-Source: APXvYqy5Wdk2BLCBPJ+c5cSThQVMciG8bJa7SX7GHSWJRc9aGtX0TGaC0X0Y3zMs1u2NzX3ZiZok3w==
X-Received: by 2002:a1c:541b:: with SMTP id i27mr3057177wmb.137.1579697334545; 
 Wed, 22 Jan 2020 04:48:54 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id e6sm59435906wru.44.2020.01.22.04.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2020 04:48:53 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
 <20200117164432.32245-2-sergey.dyasli@citrix.com>
 <7049fbf6-9bac-d9bf-4505-a80a8171dd40@suse.com>
 <6223c8e8-ff2a-e4fe-fea4-8661c4c44524@citrix.com>
 <e1e6c1c9-0f11-4346-965c-f1336e0adb05@xen.org>
 <18e39089-80e7-07be-d2fe-409fa1dfc083@citrix.com>
 <c831c7da-2414-5135-d989-1b5c55cd996d@xen.org>
 <f673b017-db4e-c111-d0fb-d395460361bf@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <381ca077-d44e-fb61-ccb1-3b66932b4612@xen.org>
Date: Wed, 22 Jan 2020 12:48:52 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f673b017-db4e-c111-d0fb-d395460361bf@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 2/2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xen.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMi8wMS8yMDIwIDEyOjMyLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyMi4wMS4yMDIw
IDEzOjA1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIEdlb3JnZSwKPj4KPj4gT24gMjIvMDEv
MjAyMCAxMDo1NywgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4+IE9uIDEvMjIvMjAgMTA6MTQgQU0s
IEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4gT24gMjIvMDEvMjAyMCAxMDowMSwg
U2VyZ2V5IER5YXNsaSB3cm90ZToKPj4+Pj4gT24gMjAvMDEvMjAyMCAxMDowMSwgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4+Pj4+PiBPbiAxNy4wMS4yMDIwIDE3OjQ0LCBTZXJnZXkgRHlhc2xpIHdyb3Rl
Ogo+Pj4+Pj4+IHYyIC0tPiB2MzoKPj4+Pj4+PiAtIFJlbW92ZSBodm1sb2FkZXIgZmlsdGVyaW5n
Cj4+Pj4+Pgo+Pj4+Pj4gV2h5PyBTZWVpbmcgdGhlIHByaW9yIGRpc2N1c3Npb24sIGhvdyBhYm91
dCBhZGRpbmcgWEVOVkVSX2RlbmllZCB0bwo+Pj4+Pj4gcmV0dXJuIHRoZSAiZGVuaWVkIiBzdHJp
bmcsIGFsbG93aW5nIGNvbXBvbmVudHMgd2hpY2ggd2FudCB0byBmaWx0ZXIKPj4+Pj4+IHRvIGtu
b3cgZXhhY3RseSB3aGF0IHRvIGxvb2sgZm9yPyBBbmQgdGhlbiByZS1hZGQgdGhlIGZpbHRlcmlu
ZyB5b3UKPj4+Pj4+IGhhZD8gKFRoZSBoZWxwIHRleHQgb2YgdGhlIGNvbmZpZyBvcHRpb24gc2hv
dWxkIHRoZW4gcGVyaGFwcyBiZQo+Pj4+Pj4gZXh0ZW5kZWQgdG8gbWFrZSB2ZXJ5IGNsZWFyIHRo
YXQgdGhlIGNob3NlbiBzdHJpbmcgc2hvdWxkIG5vdCBtYXRjaAo+Pj4+Pj4gYW55dGhpbmcgdGhh
dCBjb3VsZCBwb3RlbnRpYWxseSBiZSByZXR1cm5lZCBieSBhbnkgb2YgdGhlIFhFTlZFUl8KPj4+
Pj4+IHN1Yi1vcHMuKQo+Pj4+Pgo+Pj4+PiBJIGhhZCB0aGUgZm9sbG93aW5nIHJlYXNvbmluZzoK
Pj4+Pj4KPj4+Pj4gMS4gTW9zdCByZWFsLXdvcmxkIHVzZXJzIHdvdWxkIHNldCBDT05GSUdfWFNN
X0RFTklFRF9TVFJJTkc9IiIgYW55d2F5Lgo+Pj4+Pgo+Pj4+PiAyLiBGaWx0ZXJpbmcgaW4gRE1J
IHRhYmxlcyBpcyBub3QgYSBjb21wbGV0ZSBzb2x1dGlvbiwgc2luY2UgZGVuaWVkCj4+Pj4+IHN0
cmluZyBsZWFrcyBlbHNld2hlcmUgdGhyb3VnaCB0aGUgaHlwZXJjYWxsIChQViBndWVzdHMsIHN5
c2ZzLCBkcml2ZXIKPj4+Pj4gbG9ncykgYXMgQW5kcmV3IGhhcyBwb2ludGVkIG91dCBpbiB0aGUg
cHJldmlvdXMgZGlzY3Vzc2lvbi4KPj4+Pj4KPj4+Pj4gT24gdGhlIG90aGVyIGhhbmQsIFNNQmlv
cyBmaWx0ZXJpbmcgc2xpZ2h0bHkgaW1wcm92ZXMgdGhlIHNpdHVhdGlvbiBmb3IKPj4+Pj4gSFZN
IGRvbWFpbnMsIHNvIEkgY2FuIHJldHVybiBpdCBpZiBtYWludGFpbmVycyBmaW5kIGl0IHdvcnRo
eS4KPj4+Pgo+Pj4+IFdoaWxlIEkgYW0gbm90IGEgbWFpbnRhaW5lciBvZiB0aGlzIGNvZGUsIG15
IGNvbmNlcm4gaXMgeW91IGltcG9zZSB0aGUKPj4+PiBjb252ZXJzaW9uIGZyb20gImRlbmllZCIg
dG8gIiIgdG8gYWxsIHRoZSB1c2VycyAoaW5jbHVkZSB0aG9zZSB3aG8gd2FudHMKPj4+PiB0byBr
ZWVwICJkZW5pZWQiKS4KPj4+Pgo+Pj4+IElmIHlvdSB3ZXJlIGRvaW5nIGFueSBmaWx0ZXJpbmcg
aW4gaHZtbG9hZGVyLCB0aGVuIGl0IHdvdWxkIGJlIGJlc3QgaWYKPj4+PiB0aGlzIGlzIGNvbmZp
Z3VyYWJsZS4gQnV0IHRoaXMgaXMgYSBiaXQgcG9pbnRsZXNzIGlmIHlvdSBhbHJlYWR5IGFsbG93
Cj4+Pj4gdGhlIHVzZXIgdG8gY29uZmlndXJlIHRoZSBzdHJpbmcgYXQgdGhlIGh5cGVydmlzb3Ig
bGV2ZWwgOikuCj4+Pgo+Pj4gU28gdGhlcmUgYXJlIHR3byB0aGluZ3Mgd2UncmUgY29uY2VybmVk
IGFib3V0Ogo+Pj4gLSBTb21lIHBlb3BsZSBkb24ndCB3YW50IHRvIHNjYXJlIHVzZXJzIHdpdGgg
YSAiPGRlbmllZD4iIHN0cmluZwo+Pj4gLSBTb21lIHBlb3BsZSBkb24ndCB3YW50IHRvICJzaWxl
bnRseSBmYWlsIiB3aXRoIGEgIiIgc3RyaW5nCj4+Pgo+Pj4gVGhlIGZhY3QgaXMsIGluICpib3Ro
IGNhc2VzKiwgdGhpcyBpcyBhIFVJIHByb2JsZW0uICBFVkVSWSBjYWxsZXIgb2YKPj4+IHRoaXMg
aW50ZXJmYWNlIHNob3VsZCBmaWd1cmUgb3V0IGluZGVwZW5kZW50bHkgd2hhdCBhIGdyYWNlZnVs
IHdheSBvZgo+Pj4gaGFuZGxpbmcgZmFpbHVyZSBpcyBmb3IgdGhlaXIgdGFyZ2V0IFVJLiAgQW55
IGNhbGxlciB3aG8gZG9lcyBub3QgdGhpbmsKPj4+IGNhcmVmdWxseSBhYm91dCB3aGF0IHRvIGRv
IGluIHRoZSBmYWlsdXJlIGNhc2UgaXMgYnVnZ3kgLS0gd2hpY2gKPj4+IGluY2x1ZGVzIGV2ZXJ5
IHNpbmdsZSBjYWxsZXIgdG9kYXkuICBUaGUgQ09ORklHX1hTTV9ERU5JRURfU1RSSU5HIGlzIGEK
Pj4+IGdyb3NzIGhhY2sgZmFsbGJhY2sgZm9yIGJ1Z2d5IFVJcy4KPj4KPj4gSSBhZ3JlZSB0aGF0
IHRoZSB0d28gY2FzZXMgeW91IGV4cGxhaW5lZCBhcmUgVUkgcHJvYmxlbXMuIEhvd2V2ZXIsIEkg
Y2FuCj4+IHNlZSBvdGhlciB1c2UgZm9yIHRoZSBLY29uZmlnIG9wdGlvbiAod2l0aCBzb21lIHR3
ZWFrcykuCj4+Cj4+IEF0IEFXUywgY29uc2lzdGVuY3kgYWNjcm9zcyB0d28gc3RhYmxlIHZlcnNp
b25zIGlzIHZlcnkgaW1wb3J0YW50LiBTbwo+PiBtb3N0IG9mIHRoZSB2ZXJzaW9uIHN0cmluZ3Mg
ZXhwb3NlZCB0byB0aGUgZ3Vlc3QgYXJlIGZpeGVkLiBUaGVyZWZvcmUgYQo+PiBndWVzdCBjYW4g
YmUgbWlncmF0ZWQgc2VlbWxlc3NseSBiZXR3ZWVuIHR3byBkaWZmZXJlbnQgdmVyc2lvbnMgd2l0
aG91dAo+PiBzZWVuIGFueSBjaGFuZ2UgdGhhdCBtYXkgYnJlYWsgaXQuCj4gCj4gQSBndWVzdCBh
d2FyZSBvZiBiZWluZyBydW4gb24gYSBoeXBlcnZpc29yIHdvdWxkIGFsc28gYmUgYXdhcmUKPiB0
aGF0IGl0IG1heSBiZSBtaWdyYXRlZCwgYW5kIGhlbmNlIHRoYXQgdGhlIHZlcnNpb24gb2YgdGhl
Cj4gdW5kZXJseWluZyBoeXBlcnZpc29yIG1heSBjaGFuZ2UgKGlmIGl0IGNhcmVzIGFib3V0IHZl
cnNpb25zCj4gaW4gdGhlIGZpcnN0IHBsYWNlKS4KCklmIHlvdSB1c2UgdXBzdHJlYW0tYXMtaXMg
eWVzLiBCdXQgd2l0aCB0aGUgb24tZ29pbmcgZGlzY3Vzc2lvbiAKcmVnYXJkaW5nIGxpdmUgdWRw
YXRlIGFuZCBndWVzdCB0cmFuc3BhcmVudCBtaWdyYXRpb24sIGEgZ3Vlc3Qgd291bGQgCnNlZW1s
ZXNzbHkgbW92ZSBiZXR3ZWVuIFhlbiB2ZXJzaW9ucyB3aXRob3V0IGV2ZW4gYmVlbiBhd2FyZS4K
Cj4gQSBndWVzdCB1bmF3YXJlIG9mIGJlaW5nIHJ1biBvbiBhCj4gaHlwZXJ2aXNvciB3b3VsZG4n
dCBjYXJlIGFib3V0IHZlcnNpb24gYW5kIGFsaWtlIHN0cmluZ3MgYXQgYWxsLgo+IE5ldmVydGhl
bGVzcyBJJ20gc3VyZSB5b3UgcGxheSB0aGlzIGdhbWUgZm9yIGEgKHJlYWwgd29ybGQpCj4gcmVh
c29uLCBlLmcuIHBlb3BsZSBtYWtpbmcgd3JvbmcgYXNzdW1wdGlvbnMuIEJ1dCBpcyB0aGlzCj4g
c29tZXRoaW5nIHlvdSByZWFsbHkgdGhpbmsgdGhlIHVwc3RyZWFtIGh5cGVydmlzb3Igc2hvdWxk
IGJlCj4gbWFkZSBjYXJlIGFib3V0PwoKSSBhZ3JlZSB0aGF0IHVwc3RyZWFtIGRvZXMgbm90IG5l
Y2Vzc2FyaWx5IG5lZWRzIGl0IHRvZGF5LiBCdXQgdGhpcyBpcyAKYW4gZXhhbXBsZSBvbiBob3cg
Y29uZmlndXJhYmxlIHZlcnNpb24gc3RyaW5ncyBjb3VsZCBiZSB1c2VmdWwgYnkgCmRvd25zdHJl
YW0gdXNlcnMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
