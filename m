Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5B9FF593
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2019 21:50:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iW4ya-0006Bw-5v; Sat, 16 Nov 2019 20:47:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7/9L=ZI=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1iW4yY-0006Br-Op
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2019 20:47:22 +0000
X-Inumbo-ID: 49a914de-08b2-11ea-b678-bc764e2007e4
Received: from mail-io1-xd33.google.com (unknown [2607:f8b0:4864:20::d33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49a914de-08b2-11ea-b678-bc764e2007e4;
 Sat, 16 Nov 2019 20:47:22 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id r2so9181099iot.10
 for <xen-devel@lists.xenproject.org>; Sat, 16 Nov 2019 12:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=G5E0IwTZ1mgb8IJjoNsT+E+mQstOghHVrgih2hPoeg8=;
 b=ovcfUKiZXJUXYZqKzSz6Tr2d4/SGg/KDTJQL/VXNfi8YcQno+wRUOyb1hPNT6p2JSd
 i5VKN3UT1MIFCB7rvRj5N3symuD2KDL36uqm66ymV6CJeqfirs+EmZi+jb6M/6geDowH
 TXr8WFzgdybQpl0Acg9626vUfKlGgc5kR5PYu+BLep97mTeGcHmylWjvIXFV/8f17d5i
 qQXhQMZLPnInx3pb81dGeQKDGVIpeCnqT1SzyohhI8svojeEmq86QxtUm7i27Z/RUUo3
 5CSaxURrdm4AYA3vd0NQLuQKIYp5W/nBZqoEapyb8VnqcAwmkTU0c3l2IR7OStUqxpeo
 KVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=G5E0IwTZ1mgb8IJjoNsT+E+mQstOghHVrgih2hPoeg8=;
 b=bV95pUoFmYfcERN3FhQUqbYkvCIg9Q4Z7nroxK0wh4tqOP/V1NrUUuqV2a51ldq8R2
 i6zbWLkQJWeyus099ZIzBklteNVLpiHQbTp2O12+FzwgepVdqZMEva1j26Zm4BMsTjcj
 Jn3HIyZGAcXxruAKC3QtttwBIsN6V3hEfzz59/Nl1sQsjCzzYuhRXEzXHypozEeio8jo
 +dKEsW2v+yF2VXkQWk2gfTNTye4ZH+JZX8MHYlLRx1DAhKyR1/Dseb4Iz7LrIrftmZA/
 yJ0aMXV0VLCDlxGBmoiJf54EEcKlYzfqGBofWkVTc/wm8BgvXGVvVtCKBkvwxxHzGEQd
 sTaw==
X-Gm-Message-State: APjAAAUSIxT333wTqV+8khg+yZG1FRUoo8Z9ZZ7eBnF9WfKGQH7/ozy6
 gxmNSY/kxY7OmIFhbWtsHimKUe97
X-Google-Smtp-Source: APXvYqwwoMkVrI33CEb62UXqeQnzjNGACb3mk3ctkVE73zZOs230ixzNYPXYi8+paFcoAGqmmR6Tdw==
X-Received: by 2002:a6b:3b50:: with SMTP id i77mr6946987ioa.241.1573937241684; 
 Sat, 16 Nov 2019 12:47:21 -0800 (PST)
Received: from [100.64.72.189] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id t4sm2912843ilh.29.2019.11.16.12.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Nov 2019 12:47:20 -0800 (PST)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 16 Nov 2019 15:47:19 -0500
Message-Id: <D7B6817F-5609-4D21-AEFB-D7F1F5D786A4@gmail.com>
References: <CAMmSBy9VN9fFC1M5P7OdLOiwZdgWjjWjMWppA63gnOe5wwGr4A@mail.gmail.com>
In-Reply-To: <CAMmSBy9VN9fFC1M5P7OdLOiwZdgWjjWjMWppA63gnOe5wwGr4A@mail.gmail.com>
To: Roman Shaposhnik <roman@zededa.com>
X-Mailer: iPhone Mail (17B102)
Subject: Re: [Xen-devel] Likely regression in efi=no-rs option
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
Cc: xen-devel@lists.xenproject.org, =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSBkb24ndCBrbm93IGlmIHRoZXJlJ3MgYSBjaGFuZ2UgaW4gZWZpPW5vLXJzIGJlaGF2aW9yLCBi
dXQgc29tZSBFRkkgZml4ZXMgd2VyZSBtZXJnZWQgb24gMTAvMjUsIHdoaWNoIChvbiBzb21lIG1h
Y2hpbmVzKSBoYXZlIHJlZHVjZWQgdGhlIG5lZWQgdG8gZGlzYWJsZSBVRUZJIHJ1bnRpbWUgc2Vy
dmljZXMgdG8gd29yayBhcm91bmQgbm9uLXNwZWMgVUVGSSBmaXJtd2FyZS4gIFRoaXMgc2hvdWxk
IGluY3JlYXNlIGhhcmR3YXJlIGNvbXBhdGliaWxpdHkgd2l0aCBYZW4uICBPZiBjb3Vyc2UsIHRo
ZXJlIGNvdWxkIHN0aWxsIGJlIG90aGVyIHJlYXNvbnMgdG8gZGlzYWJsZSBVRUZJIHJ1bnRpbWUg
c2VydmljZXMuCgpDb3VsZCB5b3UgdHJ5IGJvb3RpbmcgdGhlIGFmZmVjdGVkIHN5c3RlbXMgd2l0
aCBlZmk9cnM/CgpSaWNoCgo+IE9uIE5vdiAxNiwgMjAxOSwgYXQgMDA6MjcsIFJvbWFuIFNoYXBv
c2huaWsgPHJvbWFuQHplZGVkYS5jb20+IHdyb3RlOgo+IAo+IO+7v0hpIQo+IAo+IGFzIEkndmUg
cmVwb3J0ZWQgZWFybGllciAtLSBwYXJ0IG9mIG15IHRlc3Rpbmcgb2YgWGVuIDQuMTMgUkMyIGZh
aWxlZAo+IGluIGEgbWFzc2l2ZSB3YXkgd2l0aCBEb20wIG5ldmVyIGNvbWluZyB1cC4gSSd2ZSB0
cmFjZWQgdGhhdCBwcm9ibGVtCj4gdG8gdGhlIG9wdGlvbiB0aGF0IHdlJ3JlIHVzaW5nIHRvIGJv
b3QgWGVuOgo+ICAgIGVmaT1uby1ycwo+IFdlJ3ZlIGJlZW4gdXNpbmcgdGhpcyBvcHRpb24gZm9y
IHF1aXRlIHNvbWV0aW1lIGFuZCBYZW4gNC4xMyBSQzIKPiBpcyB0aGUgZmlyc3Qgb25lIHRoYXQg
c2VlbXMgdG8gbWFrZSBEb20wIGJvb3QgZmFpbCB3aXRoIHRoaXMgb3B0aW9uCj4gcHJlc2VudCAo
bm90ZSB0aGF0IFJDMSB3YXMgZmluZSkuCj4gCj4gSSB3YXMgd29uZGVyaW5nIHdoZXRoZXIgdGhl
cmUgd2VyZSBhbnkgY2hhbmdlcyBpbiB0aGUgYXJlYXMgcmVsYXRlZAo+IHRvIFVFRkkgaW4gWGVu
IHRoYXQgbWF5IGhhdmUgdHJpZ2dlcmVkIHRoaXMuCj4gCj4gSGVyZSdzIHRoZSBib290IGxpbmUg
dGhhdCB3b3JrcyB3aXRoIFJDMjoKPiAgICBkb20wX21lbT0xMDI0TSxtYXg6MTAyNE0gZG9tMF9t
YXhfdmNwdXM9MSBkb20wX3ZjcHVzX3BpbiBzbXQ9ZmFsc2UKPiBhZGRpbmcgZWZpPW5vLXJzIG1h
a2UgRG9tMCBib290IHByb2Nlc3MgZmFpbDoKPiAgICBlZmk9bm8tcnMgZG9tMF9tZW09MTAyNE0s
bWF4OjEwMjRNIGRvbTBfbWF4X3ZjcHVzPTEgZG9tMF92Y3B1c19waW4gc210PWZhbHNlCj4gCj4g
QXR0YWNoaW5nIHhsIGluZm8gYW5kIGRtZXNnIGp1c3QgaW4gY2FzZQo+IAo+IFRoYW5rcywKPiBS
b21hbi4KPiA8ZG1lc2cudHh0Pgo+IDxpbmZvLnR4dD4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
