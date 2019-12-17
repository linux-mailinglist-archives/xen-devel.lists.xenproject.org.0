Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305B41234ED
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 19:34:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihHdf-0005U3-AT; Tue, 17 Dec 2019 18:32:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2bJS=2H=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1ihHdd-0005Ts-Kr
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 18:32:05 +0000
X-Inumbo-ID: 864ee056-20fb-11ea-88e7-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 864ee056-20fb-11ea-88e7-bc764e2007e4;
 Tue, 17 Dec 2019 18:32:05 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id t3so2158571qtr.11
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 10:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H2wKNQUCrcnj1TPM9ZwkHqvmhIEQHosBmX2dH7dpl2Q=;
 b=LtmNaoZ/oSTKVkVcRiLKf9ukV+bCNQW5WxfnsuWw9kCs8WYP0qV5uY5EJ21iQEzbEI
 JQ2/qLa/Sgtfm1TnnxvgRI9eENzCZXXm+OZZP0FoORSVnZCVK24uBoTU0xhvPzOINiOV
 i0fid+V3X8+Ko+veXhh2SUBHcVU6/+ZQ3mdSW81kiBQicCQNNJKNQA61eJVfUzoltgGr
 lo4IeG6VLX7GVYYwJw1mghbs/9zlUB2gKJ2iKqhv1iZa9aYm3En4MSlJtjzXcmrKAEeS
 k4/1j4VMARAlNVL41iiK3F9w2CixPZeJn5kG5IuT7fxdGc9J99qhCyClRPp+dAdNozZG
 n2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H2wKNQUCrcnj1TPM9ZwkHqvmhIEQHosBmX2dH7dpl2Q=;
 b=cQtmE4Rp2Wp2rMWRsnof0ddDn+Aa1lUHde4iXUHi4UA+TcX581lL0pPhvR/8bGm1un
 G5btqGbVCg8NtgBjR3goqVkcqSeVGxsYBRkB5blbNIL6VMQVhc6f/YddUSDYCdkWVBTt
 k43gINwjc4OPpfxWmVTmdyyRgMYnKHIL7b2vphAdZrLPzvpxUhgbEGWiQcGfprl35FuE
 K59tNtew5B+AUF9nMzRWADj30AzEaCAmhrpTHHa2lGSqVckzaLX1Ekxo7oQo9OwiiTH+
 qp5w0JG/pMYVmJk3trs7V7wWS1iVhZWvBMiHRnC3tGMbbyGiSjkIwPwDTBF2Bk0CXRn3
 vSjw==
X-Gm-Message-State: APjAAAUybBiGBjO25AwiDddku5ejfODmrKnxN5RkKDFd3/P0MxeIefOc
 XKBQS96jsfAemGfT1JUCcGRdHS5qDhRfybov2E9jNA==
X-Google-Smtp-Source: APXvYqwBzxGY/v/I5Gi23sC4H85JLdqEyukA/HY4/L0//uZ+rTNC6bVRpUwQngjXurFuSZcye6NIc/oBojmNQwh2VvE=
X-Received: by 2002:ac8:7158:: with SMTP id h24mr5756032qtp.63.1576607524764; 
 Tue, 17 Dec 2019 10:32:04 -0800 (PST)
MIME-Version: 1.0
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
 <alpine.DEB.2.21.1912161814220.13474@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EG6=20dHde7AHby48Q8aWoRLAX+LFWTTTuKeHi8M+dg@mail.gmail.com>
 <5db3b29a-2f07-c807-1ee2-503d779548f7@xen.org>
In-Reply-To: <5db3b29a-2f07-c807-1ee2-503d779548f7@xen.org>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 17 Dec 2019 10:31:53 -0800
Message-ID: <CAMmSBy_5dAD7agPSSjnrvmXzzGtpLTdm2hw3ENrxBFYAuBqnoQ@mail.gmail.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [Xen-devel] REGRESSION: Xen 4.13 RC5 fails to bootstrap Dom0 on
 ARM
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLAoKT24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMzozMCBBTSBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMTcvMTIvMjAxOSAwNDozOSwg
Um9tYW4gU2hhcG9zaG5payB3cm90ZToKPiA+IE9uIE1vbiwgRGVjIDE2LCAyMDE5IGF0IDY6NTUg
UE0gU3RlZmFubyBTdGFiZWxsaW5pCj4gPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gPj4gT24gTW9uLCAxNiBEZWMgMjAxOSwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiA+PiBJ
ZiBJIHN1bSBhbGwgdGhlIG1lbW9yeSBzaXplcyB0b2dldGhlciBJIGdldCAweDNkZGZkMDAwIHdo
aWNoIGlzIDk5ME0uCj4gPj4gSWYgc28sIEkgd29uZGVyIGhvdyB5b3UgY291bGQgYm9vdCBzdWNj
ZXNmdWxseSB3aXRoIGRvbTBfbWVtPTEwMjRNIGV2ZW4KPiA+PiBvbiBYZW4gNC4xMi4uLiA6LT8K
PiA+Cj4gPiBUaGF0IGlzIGEgdmVyeSBpbnRlcmVzdGluZyBvYnNlcnZhdGlvbiBpbmRlZWQhIEkg
YWN0dWFsbHkgZG9uJ3QKPiA+IHJlbWVtYmVyIHdoZXJlIHRoYXQgZGV2aWNlIHRyZWUgY2FtZSBm
cm9tLCBidXQgSSB0aGluayBpdCB3YXMgZnJvbSBvbmUKPiA+IG9mIHRoZSBMaW5hcm8gc2l0ZXMu
Cj4KPiBUaGlzIGlzIG1vc3RseSBsaWtlbHkgYmVjYXVzZSBvZjoKPgo+IGNvbW1pdCA2MzQxYTY3
NDU3M2YxODM0ZjA4M2YwYWIwZjViMzZiMDc1ZjllMDJlCj4gQXV0aG9yOiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IERhdGU6ICAgV2VkIEF1ZyAyMSAyMjo0MjozMSAyMDE5
ICswMTAwCj4KPiAgICAgIHhlbi9hcm06IGRvbWFpbl9idWlsZDogRG9uJ3QgY29udGludWUgaWYg
dW5hYmxlIHRvIGFsbG9jYXRlIGFsbAo+IGRvbTAgYmFua3MKPgo+ICAgICAgWGVuIHdpbGwgb25s
eSBwcmludCBhIHdhcm5pbmcgaWYgdGhlcmUgYXJlIG1lbW9yeSB1bmFsbG9jYXRlZCB3aGVuCj4g
dXNpbmcKPiAgICAgIDE6MSBtYXBwaW5nIChvbmx5IHVzZWQgYnkgZG9tMCkuIFRoaXMgYWxzbyBp
bmNsdWRlcyB0aGUgY2FzZSB3aGVyZSBubwo+ICAgICAgbWVtb3J5IGhhcyBiZWVuIGFsbG9jYXRl
ZC4KPgo+ICAgICAgSXQgd2lsbCBicmluZyB0byBhbGwgc29ydCBvZiBpc3N1ZXMgdGhhdCBjYW4g
YmUgaGFyZCB0byBkaWFnbm9zdGljIGZvcgo+ICAgICAgdXNlcnMgKHRoZSB3YXJuaW5nIGNhbiBi
ZSBkaWZmaWN1bHQgdG8gc3BvdCBvciBkaXNyZWdhcmQpLgo+Cj4gICAgICBJZiB0aGUgdXNlcnMg
cmVxdWVzdCAxR0Igb2YgbWVtb3J5LCB0aGVuIG1vc3QgbGlrZWx5IHRoZXkgd2FudCB0aGUKPiBl
eGFjdAo+ICAgICAgYW1vdW50IGFuZCBub3QgNTEyTUIuIFNvIHBhbmljIGlmIGFsbCB0aGUgbWVt
b3J5IGhhcyBub3QgYmVlbgo+IGFsbG9jYXRlZC4KPgo+ICAgICAgQWZ0ZXIgdGhpcyBjaGFuZ2Us
IHRoZSBiZWhhdmlvciBpcyB0aGUgc2FtZSBhcyBmb3Igbm9uLTE6MSBtZW1vcnkKPiAgICAgIGFs
bG9jYXRpb24gKHVzZWQgYnkgZG9tVSkuCj4KPiAgICAgIEF0IHRoZSBzYW1lIHRpbWUsIHJlZmxv
dyB0aGUgbWVzc2FnZSB0byBoYXZlIHRoZSBmb3JtYXQgb24gYSBzaW5nbGUKPiAgICAgIGxpbmUu
Cj4KPiAgICAgIFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+Cj4gICAgICBBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgoKSXQgc2VlbXMgeW91J3JlIGFic29sdXRlbHkgcmlnaHQuIExvb2tpbmcgYXQgdGhl
IGxvZ3MgZnJvbSBYZW4gNC4xMiBJJ20gc2VlaW5nOgoKKFhFTikgQWxsb2NhdGluZyAxOjEgbWFw
cGluZ3MgdG90YWxsaW5nIDEwMjRNQiBmb3IgZG9tMDoKKFhFTikgV0FSTklORzogRmFpbGVkIHRv
IGFsbG9jYXRlIHJlcXVlc3RlZCBkb20wIG1lbW9yeS4gNjI0TUIgdW5hbGxvY2F0ZWQKKFhFTikg
QkFOS1swXSAweDAwMDAwMDA4MDAwMDAwLTB4MDAwMDAwMTAwMDAwMDAgKDEyOE1CKQooWEVOKSBC
QU5LWzFdIDB4MDAwMDAwMzYwMDAwMDAtMHgwMDAwMDAzZTAwMDAwMCAoMTI4TUIpCihYRU4pIEJB
TktbMl0gMHgwMDAwMDA0MDAwMDAwMC0weDAwMDAwMDQ3MDAwMDAwICgxMTJNQikKKFhFTikgQkFO
S1szXSAweDAwMDAwMDdiMDAwMDAwLTB4MDAwMDAwN2MwMDAwMDAgKDE2TUIpCihYRU4pIEJBTktb
NF0gMHgwMDAwMDA3ZTAwMDAwMC0weDAwMDAwMDdmMDAwMDAwICgxNk1CKQooWEVOKSBHcmFudCB0
YWJsZSByYW5nZTogMHgwMDAwMDA0Nzk5ODAwMC0weDAwMDAwMDQ3OWQ4MDAwCihYRU4pIEFsbG9j
YXRpbmcgUFBJIDE2IGZvciBldmVudCBjaGFubmVsIGludGVycnVwdAoKU28geWVzIC0tIGl0IHdh
cyBhIHdhcm5pbmcgdGhhdCBub3cgdHVybmVkIGFuIEVSUk9SLiBTbyBhdCBsZWFzdCB0aGF0CnBh
cnQgaXMgY2xlYXIgbm93LgoKV2hhdCBpc24ndCBjbGVhciBzdGlsbCBpcyB0aGUgaW50ZXJwbGF5
IGJldHdlZW4gZGV2aWNlIHRyZWVzIGFuZCBYZW4KbWVtb3J5IGFsbG9jYXRpb24gLS0gSSdsbCBy
ZXBseSB0byBTdGVmYW5vIG9uIHRoYXQuCgpUaGFua3MsClJvbWFuLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
