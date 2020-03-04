Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ABB17948A
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 17:09:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9WY1-0007sp-NF; Wed, 04 Mar 2020 16:07:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bZrs=4V=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1j9WY0-0007sg-Bs
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 16:07:00 +0000
X-Inumbo-ID: 2d66a59a-5e32-11ea-b74d-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d66a59a-5e32-11ea-b74d-bc764e2007e4;
 Wed, 04 Mar 2020 16:06:59 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q19so2620520ljp.9
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 08:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3aIhHuOGRPKtOGorogrstOaX7t4g4Mma1TUyzEuktYc=;
 b=beLpTFf4FWnGQ++llEvI1pqOksXjE+xfwRyy0ErZFnsifv9dINuEv1ISic1fiN/wqa
 bP6JxBr2a6D0+XyhbXok9fLvc9AFE4iPLGcREuffmuDusb31uCM/Md248uBlSa0ie/Rb
 kbH8t/pEh1bMonTRVHb6rOBFfmQbYtEvdbGrqQf60iNqSnMMUCa9KJ4NYhk2qufyrWn7
 Ris0+Nj8s7fX97xZuuqyVZqI4zSv6HssHV3PJLVjBIsGs/AuEhZqndVZm2ht18hWgIs5
 38ROMCh0E5wKHOnb3LpsMkac/LOv3aXUCyMmfVooPVn446343mwcCu/5uyq4DKpTrRLI
 ljVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3aIhHuOGRPKtOGorogrstOaX7t4g4Mma1TUyzEuktYc=;
 b=FiS7l1eolQcQv9Om9m9EvXl0QFUlyl9Gx8JTcYotGfla3ssQ6vUpSpBilJVbUMrjFH
 fmJswoq0+GzEjDe9UE/VSpiMA8T41v0SLUsIC0+WFYSeK/e2dzaMBjN+ZoEaZRbZTNHJ
 Bb2huoE95XCcqq1RmJIXiuV3rf6SPhUl3Yn7GqiiwudW2P83W4R4Xq+6hL8uJi2tRYgc
 RRVfxiMFsHiLoN9ISdk963Q6BJNYEUxMDp2DQSyTKxkPTTEbfhGEmUjJ/aBILt7UWE60
 SI/9C78gkBxBLtpQ3f5IJmVprvLslMftDvSX20mx1qRInHX+sOBo5YT1HZ+gqWD+11nQ
 +xng==
X-Gm-Message-State: ANhLgQ2ivKgx3j1CLzAqlZ9ai/zkhlbXFtXO0hf1YuDNmc4OtmSFzGlb
 7+U2NrCeOOvjwyek5FDQ+SjUzpCHiu/6f61IEs8=
X-Google-Smtp-Source: ADFU+vuaNr7o1CIMPBWshXVWwdXBMTmCW7/Bu3MX0vUCjk6YqdFNRHIhnfvRxg/COh7wNsSB9Iyq3aZkY5DCoZ4br3E=
X-Received: by 2002:a2e:87ca:: with SMTP id v10mr2276792ljj.253.1583338018743; 
 Wed, 04 Mar 2020 08:06:58 -0800 (PST)
MIME-Version: 1.0
References: <4019c78f-6546-4edc-b5c3-1ea471e129ff@www.fastmail.com>
 <f886576a-a6cc-699a-5acf-1c2399c47133@citrix.com>
 <17bc1026-ebdf-4077-85b2-8b8615b59101@www.fastmail.com>
 <CAKf6xpszDF5ZfvkKGrZ6fOaBEKX3wrDyo8sp-oyhPdUr-H66NQ@mail.gmail.com>
 <f467fbc1-be3b-6e4c-681b-71001beb35f5@citrix.com>
 <CAKf6xptqF2vJLx6MyGbmu5QEhu3qpxKk9oHxBQmx7Caam45aKw@mail.gmail.com>
 <bdba95c2-8325-af8e-83a4-e06364b045df@citrix.com>
 <CAKf6xpt26=s_+cD63VJ1Cp3WZvtq3p673uUiqiuDHAVH=ZJOcQ@mail.gmail.com>
 <ea7cba55-f267-09c5-044e-e8947a6d2900@citrix.com>
 <4354846c-2210-db80-d14e-6f00c5ed2a3f@suse.com>
In-Reply-To: <4354846c-2210-db80-d14e-6f00c5ed2a3f@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 4 Mar 2020 11:06:47 -0500
Message-ID: <CAKf6xpsh3y_JpD15JLv52mgZOAVSu_Rp3EZOgGOmuS8_P5OsVQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [BUG] panic: "IO-APIC + timer doesn't work" -
 several people have reproduced
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Aaron Janse <aaron@ajanse.me>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMzoyNSBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTguMDIuMjAyMCAyMjo0NSwgQW5kcmV3IENvb3BlciB3cm90
ZToKPiA+IE9uIDE4LzAyLzIwMjAgMTg6NDMsIEphc29uIEFuZHJ5dWsgd3JvdGU6Cj4gPj4gT24g
TW9uLCBGZWIgMTcsIDIwMjAsIDg6MjIgUE0gQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4+IE9uIDE3LzAyLzIwMjAgMjA6NDEsIEphc29uIEFuZHJ5
dWsgd3JvdGU6Cj4gPj4+PiBPbiBNb24sIEZlYiAxNywgMjAyMCBhdCAyOjQ2IFBNIEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+Pj4+IFdlIGhhdmUg
bXVsdGlwbGUgYnVncy4KPiA+Pj4+Pgo+ID4+Pj4+IEZpcnN0IGFuZCBmb3JlbW9zdCwgWGVuIHNl
ZW1zIHRvdGFsbHkgYnJva2VuIHdoZW4gcnVubmluZyBpbiBFeHRJTlQKPiA+Pj4+PiBtb2RlLiAg
VGhpcyBuZWVkcyBhZGRyZXNzaW5nLCBhbmQgb3VnaHQgdG8gYmUgc3VmZmljaWVudCB0byBsZXQg
WGVuCj4gPj4+Pj4gYm9vdCwgYXQgd2hpY2ggcG9pbnQgd2UgY2FuIHRyeSB0byBmaWd1cmUgb3V0
IHdoeSBpdCBpcyB0cnlpbmcgdG8gZmFsbAo+ID4+Pj4+IGJhY2sgaW50byA0ODYoaXNoKSBjb21w
YXRpYmlsaXR5IG1vZGUuCj4gPj4gWGVuIGhhcyAiZW5hYmxlZCBFeHRJTlQgb24gQ1BVIzAiIHdo
aWxlIGxpbnV4IGhhcyAibWFza2VkIEV4dElOVCBvbgo+ID4+IENQVSMwIiBzbyBsaW51eCBpc24n
dCB1c2luZyBFeHRJTlQ/Cj4gPgo+ID4gSXQgd291bGQgYXBwZWFyIG5vdC4gIEV2ZW4gbW9yZSBj
b25jZXJuaW5nbHksIG9uIG15IEthYnlsYWtlIGJveCwKPiA+Cj4gPiAjIHhsIGRtZXNnIHwgZ3Jl
cCBFeHRJTlQKPiA+IChYRU4pIGVuYWJsZWQgRXh0SU5UIG9uIENQVSMwCj4gPiAoWEVOKSBtYXNr
ZWQgRXh0SU5UIG9uIENQVSMxCj4gPiAoWEVOKSBtYXNrZWQgRXh0SU5UIG9uIENQVSMyCj4gPiAo
WEVOKSBtYXNrZWQgRXh0SU5UIG9uIENQVSMzCj4gPiAoWEVOKSBtYXNrZWQgRXh0SU5UIG9uIENQ
VSM0Cj4gPiAoWEVOKSBtYXNrZWQgRXh0SU5UIG9uIENQVSM1Cj4gPiAoWEVOKSBtYXNrZWQgRXh0
SU5UIG9uIENQVSM2Cj4gPiAoWEVOKSBtYXNrZWQgRXh0SU5UIG9uIENQVSM3Cj4gPgo+ID4gd2hp
Y2ggYXQgZmlyc3QgZ2xhbmNlIHN1Z2dlc3RzIHRoYXQgd2UgaGF2ZSBzb21ldGhpbmcgYXN5bW1l
dHJpYyBiZWluZwo+ID4gc2V0IHVwLgo+Cj4gVGhhdCdzIHBlcmZlY3RseSBub3JtYWwgLSBFeHRJ
TlQgbWF5IGJlIGVuYWJsZWQgb24ganVzdCBvbmUgQ1BVLAo+IGFuZCB0aGF0J3MgQ1BVMCBpbiBv
dXIgY2FzZSAodW50aWwgc3VjaCB0aW1lIHRoYXQgd2Ugd291bGQgd2FudAo+IHRvIGJlIGFibGUg
dG8gb2ZmbGluZSBDUFUwKS4KClRoYW5rcywgSmFuLiAgTGludXggcHJpbnRzIG1hc2tlZCBFeHRJ
TlQgZm9yIGFsbCA4IENQVSB0aHJlYWRzLgoKSSBpbnNlcnRlZCBfX3ByaW50X0lPX0FQSUMoKSBi
ZWZvcmUgdGhlICJJTy1BUElDICsgdGltZXIgZG9lc24ndCB3b3JrIiBwYW5pYy4KClVzaW5nIHZl
Y3Rvci1iYXNlZCBpbmRleGluZwpJUlEgdG8gcGluZyBtYXBwaW5nczoKSVJRMjQwIC0+IDA6MgoK
d2hlcmUgTGludXggcHJpbnRzCklSUTAgLT4gMDoyCgpUaGF0IG1heSBqdXN0IGJlIHRoZSBkaWZm
ZXJlbmNlIGJldHdlZW4gWGVuIHByaW50aW5nIHRoZSBWZWN0b3IgdnMuCkxpbnV4IHByaW50aW5n
IHRoZSBJUlEgbnVtYmVyLgoKQW55IHBvaW50ZXJzIHRvIHdoYXQgSSBzaG91bGQgaW52ZXN0aWdh
dGU/CgpSZWdhcmRzLApKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
