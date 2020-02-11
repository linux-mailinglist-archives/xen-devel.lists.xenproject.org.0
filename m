Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12DB15901D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 14:37:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Vgr-0004sn-FI; Tue, 11 Feb 2020 13:35:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cNmK=37=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1j1Vgp-0004si-Oi
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 13:34:59 +0000
X-Inumbo-ID: 4c1d515c-4cd3-11ea-a96e-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c1d515c-4cd3-11ea-a96e-bc764e2007e4;
 Tue, 11 Feb 2020 13:34:59 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c9so12428904wrw.8
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2020 05:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kkyGCh/SMajtC7YBKTxiw9sFfF6P5PQ1f8l5bQglufs=;
 b=ijBgkDAqYDb55hTzTv3adllrMr8ZREVkTyyd/ljlo+v1pkN53CeQ+BbfHDzlQmb8/V
 H+kv8z2RtOH3F0BvCNBW41CrMHEmHOvZoBFvKIErilERDA72FHj8BM0C1xa4H0KGHdMm
 coe5caV0/OoWTwpI8OQUs5qSTaEJ3FGupkMkEPm+ZQPNiGb/hOjRwae81us4pxavXKTb
 t40jvjl9r0OLl7S5gtndIqW6B6hv5WeK53D7zrOsBvgyL8MIP61i+Q+FSuSh2vtLmFLv
 DvZ7mXyxcCB+gYRqS+IIkUX6NFpV+w8zrF3aOcXjIHcFzh6KT1VUUfn0nhsmMVriVp5k
 n7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kkyGCh/SMajtC7YBKTxiw9sFfF6P5PQ1f8l5bQglufs=;
 b=K+tnR6tzrZDMcQ5bfBWjpy1AsF0GVm4nU1WBKdoQ0FMsMemUUhOJzT+QaUcqVHW08s
 4c2YVMvuKWBcq5tDFET1siYEVEs8FGO2EGOUHoAv2wKBPtx1rB3Ou5AygbjZKOSKWky/
 /4+bdzuYBw7vIWWWZXnKGqNBTrMAeukGVC+bA5yDMZRj4oIK37aMdozSebX3gGKMnAhn
 nf+PklKdtTTI3qFsIPQuUh6bwr7UFpLY4SJ3jqjmdlBgo5yoZIHWHydInnLkgvQ7sX2g
 ALw7VfTdBjtSZVsgd2uOOXnXGPHPjSXt8l8VZFENe/frnasxP6o5VDe8NkoIsHgnSvB2
 LXLg==
X-Gm-Message-State: APjAAAVBJeONnaxzH5vGxvQfyVA01SYOU3kSmeUkiPq6uWymOb0m9G8U
 Ol9SEKITVVQ7ac6ehxBPVX8sExFW/mo0f5Eg/iI=
X-Google-Smtp-Source: APXvYqxg12o4VmjJOe69EdvLLxcdgIXPQhboJ9Dr/L5YvwZxU4Tp1oUuuJMLGzXoLrgns35u+/6+gBAKm/MWtFF2dX8=
X-Received: by 2002:adf:f288:: with SMTP id k8mr9117531wro.301.1581428098264; 
 Tue, 11 Feb 2020 05:34:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581362050.git.tamas.lengyel@intel.com>
 <cf992d6e4dd09acc48afb42d43be4a900baee189.1581362050.git.tamas.lengyel@intel.com>
 <f620590a-147b-eeb8-707c-72cac10753bd@suse.com>
 <CABfawhn6Z3BO6JTEDzcR9TUYaOLQHv1KLOHv1LHXy-5Bw5QSog@mail.gmail.com>
 <6be1e66b-9c0b-9dc6-2062-dda74ad2ccc8@suse.com>
In-Reply-To: <6be1e66b-9c0b-9dc6-2062-dda74ad2ccc8@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 11 Feb 2020 06:34:21 -0700
Message-ID: <CABfawh=uq2Yt0XsLdEM=C1vKBH0+vzki7n1OOjZecuaHOTL3SQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v8 1/5] x86/p2m: Allow p2m_get_page_from_gfn
 to return shared entries
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTEsIDIwMjAgYXQgNDowNCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTEuMDIuMjAyMCAxMToyOSwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gVHVlLCBGZWIgMTEsIDIwMjAgYXQgMjoxNyBBTSBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMTAuMDIuMjAyMCAyMDoyMSwgVGFt
YXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+PiBUaGUgb3duZXIgZG9tYWluIG9mIHNoYXJlZCBwYWdl
cyBpcyBkb21fY293LCB1c2UgdGhhdCBmb3IgZ2V0X3BhZ2UKPiA+Pj4gb3RoZXJ3aXNlIHRoZSBm
dW5jdGlvbiBmYWlscyB0byByZXR1cm4gdGhlIGNvcnJlY3QgcGFnZSB1bmRlciBzb21lCj4gPj4+
IHNpdHVhdGlvbnMuIFRoZSBjaGVjayBpZiBkb21fY293IHNob3VsZCBiZSB1c2VkIHdhcyBvbmx5
IHBlcmZvcm1lZCBpbgo+ID4+PiBhIHN1YnNldCBvZiB1c2UtY2FzZXMuIEZpeGluZyB0aGUgZXJy
b3IgYW5kIHNpbXBsaWZ5aW5nIHRoZSBleGlzdGluZyBjaGVjawo+ID4+PiBzaW5jZSB3ZSBjYW4n
dCBoYXZlIGFueSBzaGFyZWQgZW50cmllcyB3aXRoIGRvbV9jb3cgYmVpbmcgTlVMTC4KPiA+Pj4K
PiA+Pj4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVs
LmNvbT4KPiA+Pgo+ID4+IEkgZmluZCBpdCBxdWl0ZSBkaXNhcHBvaW50aW5nIHRoYXQgdGhlIGJs
YW5rIGxpbmVzIHJlcXVlc3RlZCB0byBiZQo+ID4+IGFkZGVkIC4uLgo+ID4+Cj4gPj4+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+ID4+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMK
PiA+Pj4gQEAgLTU3NCwxMSArNTc0LDEyIEBAIHN0cnVjdCBwYWdlX2luZm8gKnAybV9nZXRfcGFn
ZV9mcm9tX2dmbigKPiA+Pj4gICAgICAgICAgICAgICAgICBpZiAoIGZkb20gPT0gTlVMTCApCj4g
Pj4+ICAgICAgICAgICAgICAgICAgICAgIHBhZ2UgPSBOVUxMOwo+ID4+PiAgICAgICAgICAgICAg
fQo+ID4+PiAtICAgICAgICAgICAgZWxzZSBpZiAoICFnZXRfcGFnZShwYWdlLCBwMm0tPmRvbWFp
bikgJiYKPiA+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAvKiBQYWdlIGNvdWxkIGJlIHNoYXJl
ZCAqLwo+ID4+PiAtICAgICAgICAgICAgICAgICAgICAgICghZG9tX2NvdyB8fCAhcDJtX2lzX3No
YXJlZCgqdCkgfHwKPiA+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgIWdldF9wYWdlKHBhZ2Us
IGRvbV9jb3cpKSApCj4gPj4+IC0gICAgICAgICAgICAgICAgcGFnZSA9IE5VTEw7Cj4gPj4+ICsg
ICAgICAgICAgICBlbHNlCj4gPj4+ICsgICAgICAgICAgICB7Cj4gPj4+ICsgICAgICAgICAgICAg
ICAgc3RydWN0IGRvbWFpbiAqZCA9ICFwMm1faXNfc2hhcmVkKCp0KSA/IHAybS0+ZG9tYWluIDog
ZG9tX2NvdzsKPiA+Pj4gKyAgICAgICAgICAgICAgICBpZiAoICFnZXRfcGFnZShwYWdlLCBkKSAp
Cj4gPj4KPiA+PiAuLiBhYm92ZSBoZXJlIGFuZCAuLi4KPiA+Pgo+ID4+PiBAQCAtNTk0LDggKzU5
NSw5IEBAIHN0cnVjdCBwYWdlX2luZm8gKnAybV9nZXRfcGFnZV9mcm9tX2dmbigKPiA+Pj4gICAg
ICBtZm4gPSBnZXRfZ2ZuX3R5cGVfYWNjZXNzKHAybSwgZ2ZuX3goZ2ZuKSwgdCwgYSwgcSwgTlVM
TCk7Cj4gPj4+ICAgICAgaWYgKCBwMm1faXNfcmFtKCp0KSAmJiBtZm5fdmFsaWQobWZuKSApCj4g
Pj4+ICAgICAgewo+ID4+PiArICAgICAgICBzdHJ1Y3QgZG9tYWluICpkID0gIXAybV9pc19zaGFy
ZWQoKnQpID8gcDJtLT5kb21haW4gOiBkb21fY293Owo+ID4+PiAgICAgICAgICBwYWdlID0gbWZu
X3RvX3BhZ2UobWZuKTsKPiA+Pgo+ID4+IC4uLiBhYm92ZSBoZXJlIHN0aWxsIGhhdmVuJ3QgYXBw
ZWFyZWQuIE5vIG1hdHRlciB0aGF0IGl0J3MgZWFzeSB0bwo+ID4+IGRvIHNvIHdoaWxlIGNvbW1p
dHRpbmcsIHdoZW4geW91IHNlbmQgYSBuZXcgdmVyc2lvbiB5b3Ugc2hvdWxkCj4gPj4gcmVhbGx5
IGFkZHJlc3Mgc3VjaCByZW1hcmtzIHlvdXJzZWxmLCBJIHRoaW5rLgo+ID4KPiA+IE5vdGVkLiBJ
IGhhdmVuJ3QgYWRkcmVzc2VkIGl0IHNpbmNlIGl0IGFwcGVhcmVkIHRvIG1lIHRoYXQgdGhpcyBw
YXRjaAo+ID4gaGFzIGJlZW4gcmVhZHkgdG8gZ28gaW4gZm9yIGxpa2UgMyByZXZpc2lvbnMgYWxy
ZWFkeSBhcy1pcyBnaXZlbiB0aGUKPiA+IGJsYW5rLWxpbmVzIHdlcmUgbm9uLWJsb2NrZXJzLgo+
Cj4gVGhlIHBhdGNoIGNvbnRpbnVlcyB0byBsYWNrIGEgbWFpbnRhaW5lciBhY2suIEhlbmNlIGl0
IGhhc24ndCBiZWVuCj4gcmVhZHkgdG8gZ28gaW4gYXQgYW55IHBvaW50IGluIHRpbWUuCgpJIG1l
YW50IHRoZXJlIGhhcyBiZWVuIG5vIGNvbW1lbnRzIG9yIGFueXRoaW5nIGJsb2NraW5nIG5vdGVk
IGZvcgp0aHJlZSByZXNlbmRzIG5vdy4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
