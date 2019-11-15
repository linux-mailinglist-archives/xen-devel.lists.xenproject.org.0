Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE56FE61D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 20:58:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhhu-0004Q7-P9; Fri, 15 Nov 2019 19:56:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=giVR=ZH=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1iVhht-0004Q2-SD
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 19:56:37 +0000
X-Inumbo-ID: 07967e37-07e2-11ea-a283-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07967e37-07e2-11ea-a283-12813bfff9fa;
 Fri, 15 Nov 2019 19:56:37 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 22B672073A
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 19:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573847796;
 bh=T4sEuzSRTpiASr1z3u6j2Z7YVmEZk/Lr0wXZGx6Ow5M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tDA1VTHNN1DTzLAWnD6QGbiwfRq5eNwBeD5eD5ZN0yGbTQXG4RNiYJBHteU2FuHqs
 lz8rkEM936wT7QbGH3aIzJ+7zkLaV2VoWgUv3VdsvnqXquL9CjMrbMVXgo+Ifz5tzN
 8hB1mxr19wtlmrnSjlMzhERmyatlteXebMeNLkn4=
Received: by mail-wm1-f54.google.com with SMTP id b17so11666769wmj.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 11:56:36 -0800 (PST)
X-Gm-Message-State: APjAAAVoiy0L3mp6b7YZTPPDQz2LUeTK9QuOhiy1JKykEuN7TXQkAUSU
 2uG2RdsdtKVnFnQks9Ud0YvjV5J08DSX4evUTx2EVg==
X-Google-Smtp-Source: APXvYqxhtJtZQF4EUfIC/PjRpyqtVhvDkGNn2pWHEaM/XiDjuz6sL+K0EIaqPKHoQ45CxPchUw3gdWopAUdY3Mp+iBk=
X-Received: by 2002:a1c:16:: with SMTP id 22mr17804246wma.0.1573847794614;
 Fri, 15 Nov 2019 11:56:34 -0800 (PST)
MIME-Version: 1.0
References: <4250bba0-1719-60ae-3d1f-350fb5d2021d@suse.com>
 <6da403e5-cb52-a5d5-0cbe-fd7c2e8a22ef@suse.com>
In-Reply-To: <6da403e5-cb52-a5d5-0cbe-fd7c2e8a22ef@suse.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Fri, 15 Nov 2019 11:56:22 -0800
X-Gmail-Original-Message-ID: <CALCETrUuiyPBFviFMwJBcxQnKdJo-CP7SsiVQOLCPZvmCQZuLQ@mail.gmail.com>
Message-ID: <CALCETrUuiyPBFviFMwJBcxQnKdJo-CP7SsiVQOLCPZvmCQZuLQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] Ping: [PATCH v2] x86/stackframe/32: repair 32-bit
 Xen PV
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>, Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgNjozMCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gQW5keSwKPgo+IE9uIDI5LjEwLjIwMTkgMTA6MjgsIEphbiBCZXVs
aWNoIHdyb3RlOgo+ID4gT25jZSBhZ2FpbiBSUEwgY2hlY2tzIGhhdmUgYmVlbiBpbnRyb2R1Y2Vk
IHdoaWNoIGRvbid0IGFjY291bnQgZm9yIGEKPiA+IDMyLWJpdCBrZXJuZWwgbGl2aW5nIGluIHJp
bmcgMSB3aGVuIHJ1bm5pbmcgaW4gYSBQViBYZW4gZG9tYWluLiBUaGUKPiA+IGNhc2UgaW4gRklY
VVBfRlJBTUUgaGFzIGJlZW4gcHJldmVudGluZyBib290OyBhZGp1c3QgQlVHX0lGX1dST05HX0NS
Mwo+ID4gYXMgd2VsbCBqdXN0IGluIGNhc2UuCj4gPgo+ID4gRml4ZXM6IDNjODhjNjkyYzI4NyAo
Ing4Ni9zdGFja2ZyYW1lLzMyOiBQcm92aWRlIGNvbnNpc3RlbnQgcHRfcmVncyIpCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4KPiB3b3VsZCB5b3Ug
bWluZCBjbGFyaWZ5aW5nIHdoZXRoZXIgSSBzaG91bGQgZm9sbG93IFRob21hcycgcmVxdWVzdCwK
PiBvdmVycmlkaW5nIHdoYXQgeW91IGhhZCBhc2tlZCBmb3IgYW4gSSBkaWQgY2Fycnkgb3V0IGZv
ciB2Mj8gSSBkb24ndAo+IHRoaW5rIHRoaXMgcmVncmVzc2lvbiBzaG91bGQgYmUgbGVmdCB1bmZp
eGVkIGZvciBtdWNoIGxvbmdlciAoYXMKPiBtdWNoIGFzIHRoZSBvdGhlciBwYXJ0IG9mIGl0LCBh
ZGRyZXNzZWQgYnkgYSBsYXRlciAyLXBhdGNoIHNlcmllcykuCj4KCkknbSBmaW5lIHdpdGggZG9p
bmcgaXQgVGhvbWFzJyB3YXkuCgotLUFuZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
