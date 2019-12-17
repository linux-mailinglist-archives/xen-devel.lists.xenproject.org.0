Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F935122FD4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 16:12:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihETQ-0007AU-4L; Tue, 17 Dec 2019 15:09:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TTnd=2H=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ihETN-0007AI-Ru
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 15:09:18 +0000
X-Inumbo-ID: 3125ac20-20df-11ea-8eef-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3125ac20-20df-11ea-8eef-12813bfff9fa;
 Tue, 17 Dec 2019 15:09:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1576595357; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=7SOr6WkujkBMRZ9JGl7F5H3mv2/9azRDghmz7VSYNVc=;
 b=gmQrxsYURC6uI/hY6jVPLEtJjUut8OSOS3ExErNqjEBOQ0r+n0izTgYBz30sVv8HiWM7+RD1
 aMxQSktz4/8wAtKcniBmzZKVb8aTGXv2FwkHEuoay1LSipiJUZY2jPU3J1szps3r/5RJ5+Pw
 WrgZ/QRdYU+iGgiarOFwQAIYG7M=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mxa.mailgun.org with ESMTP id 5df8ef9b.7f8c7e0fb0f0-smtp-out-n01;
 Tue, 17 Dec 2019 15:09:15 -0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t2so11714866wrr.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 07:09:14 -0800 (PST)
X-Gm-Message-State: APjAAAXwnnmLRjBy7PY0RikHbeKS1WyX4g4juDW9snHS+4rBrZYnoML7
 oM1QyPYx1oXrcrsfnFetCPZ0XvFRlXKzGogysEo=
X-Google-Smtp-Source: APXvYqzqoOCkdHp3NgdIoqzOfgxjHLZnEOJ1BmPhtzEhJ+Ku7zj6tDd4T0XPlPsil9MG7yyYiyjmm39ChdCGGb6Qqo8=
X-Received: by 2002:a5d:6802:: with SMTP id w2mr36716255wru.353.1576595353058; 
 Tue, 17 Dec 2019 07:09:13 -0800 (PST)
MIME-Version: 1.0
References: <96a1376e-9464-f797-30fd-f6923efbf6c7@list.ru>
 <faaf6d0a-1ad4-63fd-f1c6-e6649f887e4d@citrix.com>
In-Reply-To: <faaf6d0a-1ad4-63fd-f1c6-e6649f887e4d@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 17 Dec 2019 08:08:37 -0700
X-Gmail-Original-Message-ID: <CABfawh=c6tEAZX4PzAO_fMWeGvKE=UFw2dkWjRkTiRQ28AJRbA@mail.gmail.com>
Message-ID: <CABfawh=c6tEAZX4PzAO_fMWeGvKE=UFw2dkWjRkTiRQ28AJRbA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [XEN PATCH v1 1/1] x86/vm_event: add fast single
 step
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Sergey Kovalev <valor@list.ru>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgNzo0OCBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDE3LzEyLzIwMTkgMTQ6NDAsIFNlcmdleSBL
b3ZhbGV2IHdyb3RlOgo+ID4gT24gYnJlYWsgcG9pbnQgZXZlbnQgZWlnaHQgY29udGV4dCBzd2l0
Y2hlcyBvY2N1cmVzLgo+ID4KPiA+IFdpdGggZmFzdCBzaW5nbGUgc3RlcCBpdCBpcyBwb3NzaWJs
ZSB0byBzaG9ydGVuIHBhdGggZm9yIHR3byBjb250ZXh0Cj4gPiBzd2l0Y2hlcwo+ID4gYW5kIGdh
aW4gMzUlIHNwZWFkLXVwLgo+ID4KPiA+IFdhcyB0ZXN0ZWQgb24gRGViaWFuIGJyYW5jaCBvZiBY
ZW4gNC4xMi4gU2VlIGF0Ogo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3NrdmwveGVuL3RyZWUvZGVi
aWFuL2tub3JyaWUvNC4xMi9mYXN0LXNpbmdsZXN0ZXAKPiA+Cj4gPiBSZWJhc2VkIG9uIG1hc3Rl
cjoKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9za3ZsL3hlbi90cmVlL2Zhc3Qtc2luZ2xlc3RlcAo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBLb3ZhbGV2IDx2YWxvckBsaXN0LnJ1Pgo+Cj4g
MzUlIGxvb2tzIGxpa2UgYSBnb29kIG51bWJlciwgYnV0IHdoYXQgaXMgImZhc3Qgc2luZ2xlIHN0
ZXAiPyAgQWxsIHRoaXMKPiBhcHBlYXJzIHRvIGJlIGlzIHBsdW1iaW5nIGZvciB0byBjYXVzZSBh
biBhbHRwMm0gc3dpdGNoIG9uIHNpbmdsZSBzdGVwLgoKWWVzLCBhIGJldHRlciBleHBsYW5hdGlv
biB3b3VsZCBiZSBtdWNoIG5lZWRlZCBoZXJlIGFuZCBJJ20gbm90IDEwMCUKc3VyZSBpdCBjb3Jy
ZWN0bHkgaW1wbGVtZW50cyB3aGF0IEkgdGhpbmsgaXQgdHJpZXMgdG8uCgpUaGlzIGlzIG15IGlu
dGVycHJldGF0aW9uIG9mIHdoYXQgdGhlIGlkZWEgaXM6IHdoZW4gdXNpbmcgRFJBS1ZVRiAob3IK
YW5vdGhlciBzeXN0ZW0gdXNpbmcgYWx0cDJtIHdpdGggc2hhZG93IHBhZ2VzIHNpbWlsYXIgdG8g
d2hhdCBJCmRlc2NyaWJlIGluIGh0dHBzOi8veGVucHJvamVjdC5vcmcvMjAxNi8wNC8xMy9zdGVh
bHRoeS1tb25pdG9yaW5nLXdpdGgteGVuLWFsdHAybSksCmFmdGVyIGEgYnJlYWtwb2ludCBpcyBo
aXQgdGhlIHN5c3RlbSBzd2l0Y2hlcyB0byB0aGUgZGVmYXVsdAp1bnJlc3RyaWN0ZWQgYWx0cDJt
IHZpZXcgd2l0aCBzaW5nbGVzdGVwIGVuYWJsZWQuIFdoZW4gdGhlIHNpbmdsZXN0ZXAKdHJhcHMg
dG8gWGVuIGFub3RoZXIgdm1fZXZlbnQgaXMgc2VudCB0byB0aGUgbW9uaXRvciBhZ2VudCwgd2hp
Y2ggdGhlbgpub3JtYWxseSBkaXNhYmxlcyBzaW5nbGVzdGVwcGluZyBhbmQgc3dpdGNoZXMgdGhl
IGFsdHAybSB2aWV3IGJhY2sgdG8KdGhlIHJlc3RyaWN0ZWQgdmlldy4gVGhpcyBwYXRjaCBsb29r
cyBsaWtlIGl0cyBzaG9ydC1jaXJjdWl0aW5nIHRoYXQKbGFzdCBwYXJ0IHNvIHRoYXQgaXQgZG9l
c24ndCBuZWVkIHRvIHNlbmQgdGhlIHZtX2V2ZW50IG91dCBmb3IgdGhlCnNpbmdsZXN0ZXAgZXZl
bnQgYW5kIHNob3VsZCBzd2l0Y2ggYmFjayB0byB0aGUgcmVzdHJpY3RlZCB2aWV3IGluIFhlbgph
dXRvbWF0aWNhbGx5LiBJdCdzIGEgbmljZSBvcHRpbWl6YXRpb24uIEJ1dCB3aGF0IHNlZW1zIHRv
IGJlIG1pc3NpbmcKaXMgdGhlIGFsdHAybSBzd2l0Y2ggaXRzZWxmLgoKVGFtYXMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
